Return-Path: <philip.balister@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 53FB96B7B7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 23:05:39 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id uo5so8903505pbc.38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Mar 2014 16:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=7dTExiUlemyrEfMNoFiO/KMMKEaa22DzssthkP8GbKo=;
	b=YOq1GZLSfKnq/NW+rRUFYVoPG+wWuZtYoSf6yR4tYvS00OVP33h+gnx+29XP37Ok6M
	Zof1m2u/ADeWWzwInjEKnySQ2x+Q9TycaiSqRDoZOt2oBAPjNRmuhBV1gxxShplwQ9F7
	B/D/ygx5LcoJaG3CT6eYGNbo1kX3x4Lr5R92G6w8GfYdkHFKtQkkf8Db47f/30hIhK8P
	L3OygkoIawqOeIrqAUSatG34bFMtM2uuUUbRVlQ2rDblRtTz6Bg88jHFkExoh+PqmrHD
	OYtAdWQ99xYKX8aNImqGHClHYrIINWK5lexR5EeuZpElN54sDmqiJWLeOCLfollvC30C
	HOGA==
X-Received: by 10.68.211.73 with SMTP id na9mr876102pbc.13.1396307140153;
	Mon, 31 Mar 2014 16:05:40 -0700 (PDT)
Received: from mattsbaby.amer.corp.natinst.com
	(64-186-172-226.static-ip.telepacific.net. [64.186.172.226])
	by mx.google.com with ESMTPSA id
	i10sm46549547pat.36.2014.03.31.16.05.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Mar 2014 16:05:39 -0700 (PDT)
Sender: Philip Balister <philip.balister@gmail.com>
From: Philip Balister <philip@balister.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Mar 2014 16:05:29 -0700
Message-Id: <1396307129-13329-1-git-send-email-philip@balister.org>
X-Mailer: git-send-email 1.9.0
Subject: [meta-oe][PATCH] swig : Update to version 2.0.12 and fix cmake find swig issue.
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
X-List-Received-Date: Mon, 31 Mar 2014 23:05:49 -0000

 * Dropped PR and PR_INC due to PV change.
 * The cmake rule looks for swig2.0. For the sdk case, the host distro
may have a swig2.0 installed. If so the sdk would find the host swig. This
updates the sdk so it also has a swig2.0 soft linked to the swig binary in
the sdk.

Signed-off-by: Philip Balister <philip@balister.org>
---
 meta-oe/recipes-devtools/swig/swig.inc       | 5 ++++-
 meta-oe/recipes-devtools/swig/swig_2.0.10.bb | 9 ---------
 meta-oe/recipes-devtools/swig/swig_2.0.12.bb | 7 +++++++
 3 files changed, 11 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/swig/swig_2.0.10.bb
 create mode 100644 meta-oe/recipes-devtools/swig/swig_2.0.12.bb

diff --git a/meta-oe/recipes-devtools/swig/swig.inc b/meta-oe/recipes-devtools/swig/swig.inc
index 8e83526..52ef9a6 100644
--- a/meta-oe/recipes-devtools/swig/swig.inc
+++ b/meta-oe/recipes-devtools/swig/swig.inc
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
                     file://LICENSE-UNIVERSITIES;md5=8ce9dcc8f7c994de4a408b205c72ba08"
 
 SECTION = "devel"
-INC_PR = "r3"
 
 DEPENDS = "libpcre python"
 
@@ -50,3 +49,7 @@ do_configure() {
     oe_runconf
 }
 
+do_install_append_class-nativesdk() {
+    cd ${D}${bindir}
+    ln -s swig swig2.0
+}
diff --git a/meta-oe/recipes-devtools/swig/swig_2.0.10.bb b/meta-oe/recipes-devtools/swig/swig_2.0.10.bb
deleted file mode 100644
index 312ce11..0000000
--- a/meta-oe/recipes-devtools/swig/swig_2.0.10.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require ${BPN}.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch"
-
-SRC_URI[md5sum] = "6d5e7ad05b4a404e5e85db9befb70c9a"
-SRC_URI[sha256sum] = "d1eef329e867124ce60838b5ad07c763146b6c8f250dd22a861ead7406f78e63"
-
diff --git a/meta-oe/recipes-devtools/swig/swig_2.0.12.bb b/meta-oe/recipes-devtools/swig/swig_2.0.12.bb
new file mode 100644
index 0000000..0fbcfa1
--- /dev/null
+++ b/meta-oe/recipes-devtools/swig/swig_2.0.12.bb
@@ -0,0 +1,7 @@
+require ${BPN}.inc
+
+SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch"
+
+SRC_URI[md5sum] = "c3fb0b2d710cc82ed0154b91e43085a4"
+SRC_URI[sha256sum] = "65e13f22a60cecd7279c59882ff8ebe1ffe34078e85c602821a541817a4317f7"
+
-- 
1.9.0


