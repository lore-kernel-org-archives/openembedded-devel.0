Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id AB482757E9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 10:08:59 +0000 (UTC)
Received: by wibdt2 with SMTP id dt2so43470961wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 03:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=h2ZeBH46vSifKSCbtVyptpeS9fptT7AHYT3Ky6Xo3Ng=;
	b=kzT7PsTaiXuNrJko9Tj+KCUwmTfbif9jkA0N61AGlB2TDFmK90ve2WQgAuHtzxsg/E
	fSZyy5L1PvNIYflrybfKomZwGXRRwUfEQHfL4md7f7raxX6NGTmYFshcaeZ66gYV5HZq
	4QGzyXV8VAfIVddryXXXUP8PPPsBbIFRubSv8guNnYL7kyI1TPG+ijSKa3BNjFHriDIE
	+oxjDAqg3uVoZWJmjh8KqGPB1bKiuMZOvMZwxSC1j2mB4ylTEJF+z9ipkhFrqkx/DQXv
	Y76niKLEc3byjJ2d2L9jexXii9teRbSP96K22sKfOLQ7m4T1PKC0Wi5vDjp3xsDp0pHU
	+Dpw==
X-Received: by 10.180.73.236 with SMTP id o12mr50655135wiv.56.1433412540297;
	Thu, 04 Jun 2015 03:09:00 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	lz17sm5605978wic.24.2015.06.04.03.08.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 03:08:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:09:10 +0200
Message-Id: <1433412551-20986-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.2
In-Reply-To: <1433412551-20986-1-git-send-email-Martin.Jansa@gmail.com>
References: <1433412551-20986-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-qt5][fido][PATCH 6/7] ninja-native: upgrade to 1.5.3
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
X-List-Received-Date: Thu, 04 Jun 2015 10:09:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-devtools/ninja/ninja-native_1.4.0.bb | 22 ----------------------
 recipes-devtools/ninja/ninja-native_git.bb   | 23 +++++++++++++++++++++++
 2 files changed, 23 insertions(+), 22 deletions(-)
 delete mode 100644 recipes-devtools/ninja/ninja-native_1.4.0.bb
 create mode 100644 recipes-devtools/ninja/ninja-native_git.bb

diff --git a/recipes-devtools/ninja/ninja-native_1.4.0.bb b/recipes-devtools/ninja/ninja-native_1.4.0.bb
deleted file mode 100644
index a115c2e..0000000
--- a/recipes-devtools/ninja/ninja-native_1.4.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Ninja is a small build system with a focus on speed."
-LICENSE = "Apache-2"
-
-inherit native
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
-
-SRCREV="63d5b1013cafb2db95687cf446eb5bb68cf6a27a"
-SRCBRANCH="release"
-
-SRC_URI = "git://github.com/martine/ninja.git;branch=${SRCBRANCH}"
-
-S="${WORKDIR}/git"
-
-do_compile() {
-    python ${S}/bootstrap.py
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${S}/ninja ${D}${bindir}/ninja
-}
diff --git a/recipes-devtools/ninja/ninja-native_git.bb b/recipes-devtools/ninja/ninja-native_git.bb
new file mode 100644
index 0000000..e2deb6b
--- /dev/null
+++ b/recipes-devtools/ninja/ninja-native_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Ninja is a small build system with a focus on speed."
+LICENSE = "Apache-2"
+
+inherit native
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
+
+PV = "1.5.3+gitr${SRCPV}"
+SRCREV="3309498174411e02e7680ea8b470bb7d1d70bdb8"
+SRCBRANCH="release"
+
+SRC_URI = "git://github.com/martine/ninja.git;branch=${SRCBRANCH}"
+
+S="${WORKDIR}/git"
+
+do_compile() {
+    python ${S}/bootstrap.py
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/ninja ${D}${bindir}/ninja
+}
-- 
2.4.2


