Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id B95CC70D61
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 21:45:30 +0000 (UTC)
Received: by mail-lb0-f174.google.com with SMTP id c11so2412404lbj.33
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 14:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RvynVH9CYtbnSwm88y3ynAGSto2kvfeD93BsJlvDrKc=;
	b=vImpjiAe8JmeT+Q6rAFFmXRhNXsgrgHePdxX+BiNU5gSR13Vyhl+/UeFV+bK9YRa6g
	Irlb9q7+iqb5WhKTG3PkUWl+kLfbGfFdjb6BXjWLn5hQp3AzZfe/c2d7tAMwRrbbWe85
	f48qxyq2I5UHjveKZY7LQS4WIvbWYwTcWRjLTdxXDKAaZY54Iohw4WtcpLhhIBDDwAp4
	fjbp1eYaKE3dDt68H5FKTjwTbqL9lFPTLUm/f2VORbA2cUwUjqeQD4MWxb4QrpwgQE9f
	COD8AF+p5Jsd9vb1ujAD+A0Y2KSXG0M5+jiACwzH2Ei8HDpqkkAfYmMSnyUCr7yYr12s
	SMlg==
X-Received: by 10.152.5.42 with SMTP id p10mr13166950lap.82.1408139131799;
	Fri, 15 Aug 2014 14:45:31 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r8sm5657831laa.34.2014.08.15.14.45.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Aug 2014 14:45:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Aug 2014 23:46:08 +0200
Message-Id: <1408139168-14007-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [meta-browser][PATCH] firefox: fix build on qemux86-64
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
X-List-Received-Date: Fri, 15 Aug 2014 21:45:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-mozilla/firefox/firefox/x86_64-fix.patch | 16 ++++++++++++++++
 recipes-mozilla/firefox/firefox_10.0.11esr.bb    |  3 ++-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 recipes-mozilla/firefox/firefox/x86_64-fix.patch

diff --git a/recipes-mozilla/firefox/firefox/x86_64-fix.patch b/recipes-mozilla/firefox/firefox/x86_64-fix.patch
new file mode 100644
index 0000000..69bd957
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/x86_64-fix.patch
@@ -0,0 +1,16 @@
+Loosely based on
+https://bug436263.bugzilla.mozilla.org/attachment.cgi?id=323103
+
+--- mozilla-esr10/js/src/jscpucfg.h.orig        2014-08-15 16:02:55.462991201 +0000
++++ mozilla-esr10/js/src/jscpucfg.h     2014-08-15 15:56:10.858551202 +0000
+@@ -42,6 +42,10 @@
+
+ #define JS_HAVE_LONG_LONG
+
++#if defined __GNUC__ && defined __x86_64__
++#define HAVE_VA_LIST_AS_ARRAY
++#endif
++
+ #if defined(_WIN64)
+
+ #if defined(_M_X64) || defined(_M_AMD64) || defined(_AMD64_)
diff --git a/recipes-mozilla/firefox/firefox_10.0.11esr.bb b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
index 307e672..cd303ff 100644
--- a/recipes-mozilla/firefox/firefox_10.0.11esr.bb
+++ b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
@@ -73,7 +73,8 @@ SRC_URI = "ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/f
            file://debian-hacks/Bug-508942-Use-Preprocessor.py-filters-in-defines-an.patch \
            file://configure.patch \
            file://powerpc_va_list.patch \
-	   file://freetype-2.5.patch \
+           file://freetype-2.5.patch \
+           file://x86_64-fix.patch \
            file://vendor.js"
 
 SRC_URI[archive.md5sum] = "2f0e3a1dd7480e03f374c0121b4155e2"
-- 
2.0.4


