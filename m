Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 3913C766DE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 19:46:37 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so59409159wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Aug 2015 12:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MS19QlN172jVAORtjcRJuBSXizTUHhL49KSXhGN5J0o=;
	b=mKJqIwKpMLzFlXVPzWIktzasdeLaw5GWVqumrJZ3A0DhJqchVA/L0DSNOUvCR7clLr
	Xy2Hhc9q1ttKHuWm0k3EL0WRGGWatPTFcdY9N35039JWMBt4ctgNEKDfMZZJdn1SvKKR
	2sFYYVuZZqPmob6brNoU4zNIpfcN84h8W1TrgL/XUqAkiRBOEzWBBooPxWOrU7v7cZor
	0ylIykgLy9EEAHBXN6VoBWLaPKiShcnGESn9T5pVNMsX2tyF117uTuGLHDK+RNCU+o1h
	7W+lh2KewR/e5B41hD40PkHDTsRjnsL8WJVnxXGunIxsXR91t72Lzb6jb7AAUJSqi4f6
	WNlQ==
X-Received: by 10.180.208.42 with SMTP id mb10mr27635046wic.34.1439754397673; 
	Sun, 16 Aug 2015 12:46:37 -0700 (PDT)
Received: from Saturn.local.all (212-41-85-106.adsl.solnet.ch. [212.41.85.106])
	by smtp.gmail.com with ESMTPSA id
	p1sm18490730wjq.28.2015.08.16.12.46.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Aug 2015 12:46:37 -0700 (PDT)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Aug 2015 21:40:18 +0200
Message-Id: <1439754023-13290-4-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1439754023-13290-1-git-send-email-max.oss.09@gmail.com>
References: <1439754023-13290-1-git-send-email-max.oss.09@gmail.com>
Cc: gary@mlbassoc.com
Subject: [meta-browser][PATCH 3/8] firefox: prevent SIGILL crash with arm build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 16 Aug 2015 19:46:38 -0000

Firefox crashes with a SIGILL signal during startup.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-mozilla/firefox/firefox/alignment.patch | 17 +++++++++++++++++
 recipes-mozilla/firefox/firefox_10.0.11esr.bb   |  3 ++-
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 recipes-mozilla/firefox/firefox/alignment.patch

diff --git a/recipes-mozilla/firefox/firefox/alignment.patch b/recipes-mozilla/firefox/firefox/alignment.patch
new file mode 100644
index 0000000..f5d5b7c
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/alignment.patch
@@ -0,0 +1,17 @@
+In some setups firefox crashes because of wrongly aligned variables
+Observed on a ARM Cortex-A9 target.
+
+Upstream-Status: Pending
+
+Signed-off-by: Max Krummenacher <max.oss.09 at gmail.com>
+--- mozilla-release/ipc/ipdl/ipdl/cxx/cgen.py~	2012-07-29 11:14:45.000000000 +0200
++++ mozilla-release/ipc/ipdl/ipdl/cxx/cgen.py	2012-07-29 11:13:36.000000000 +0200
+@@ -107,7 +107,7 @@
+             self.println(';')
+         self.dedent()
+ 
+-        self.printdent('}')
++        self.printdent('} __attribute__ ((aligned (__BIGGEST_ALIGNMENT__)))')
+ 
+ 
+     def visitTypedef(self, td):
diff --git a/recipes-mozilla/firefox/firefox_10.0.11esr.bb b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
index e07555b..cb368d0 100644
--- a/recipes-mozilla/firefox/firefox_10.0.11esr.bb
+++ b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
@@ -75,7 +75,8 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox
            file://powerpc_va_list.patch \
            file://freetype-2.5.patch \
            file://x86_64-fix.patch \
-           file://vendor.js"
+           file://vendor.js \
+           file://alignment.patch"
 
 SRC_URI[archive.md5sum] = "2f0e3a1dd7480e03f374c0121b4155e2"
 SRC_URI[archive.sha256sum] = "94b4d5a339d97dc56fd349f93407c3af4f408a4a8409a64e3680d564d37594f8"
-- 
1.8.4.5


