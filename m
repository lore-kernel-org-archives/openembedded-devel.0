Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id BC2E66BB73
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 10:33:22 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id el20so2170428lab.40
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 03:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oPDWIGh9IdFFtoAedgxeJlwEjK8p75rKMZFgkjmvaa8=;
	b=lgwU9zh5YGziuh20aRVrYfa1IlLsTDyAg8xlfUqJkDgU+8Mdq1sHiNqkSdCT1LcFCx
	NbPODqyxpR4Cn5To1sXNdeaxR/MeneFURmpO/I0m2wBlOLPBgxLGOemQH9YAZaipGam0
	IoXcw0bueY4MarlndOfrTf8xlj5A3zi/x2thtiX84jDze1XDdBfHMXYsTid+b9V7BGAP
	iNBqmTBnpYsTWjoiCrBJ55+/4dVvoM01W0YJj2cYtHoHfSrrnwg7VmSjsMBKv0//7gq5
	A/fzMlXpH+PCMLUT3Bq2doTm02KhKAX9OWaqkXOnIVHzvi2pm2fCGlmT8XY7VZu/f3Zr
	u3GA==
X-Gm-Message-State: ALoCoQl/7MxZ/zCbkuXfm2OzbsHHktiEaLKp/WpxEQ85W+LQ+0mgGDu+SVkOrp7EUzMNESLTBIM6
X-Received: by 10.152.20.36 with SMTP id k4mr1108693lae.33.1377513202901;
	Mon, 26 Aug 2013 03:33:22 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id ap7sm5461308lac.10.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 03:33:22 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Aug 2013 13:33:15 +0300
Message-Id: <1377513195-21664-4-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377513195-21664-1-git-send-email-fathi.boudra@linaro.org>
References: <1377513195-21664-1-git-send-email-fathi.boudra@linaro.org>
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCH 3/3] acpica: bump to version 20130823
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
X-List-Received-Date: Mon, 26 Aug 2013 10:33:23 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-extended/acpica/acpica_20130626.bb | 37 ----------------------
 meta-oe/recipes-extended/acpica/acpica_20130823.bb | 37 ++++++++++++++++++++++
 2 files changed, 37 insertions(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/acpica/acpica_20130626.bb
 create mode 100644 meta-oe/recipes-extended/acpica/acpica_20130823.bb

diff --git a/meta-oe/recipes-extended/acpica/acpica_20130626.bb b/meta-oe/recipes-extended/acpica/acpica_20130626.bb
deleted file mode 100644
index af0dd45..0000000
--- a/meta-oe/recipes-extended/acpica/acpica_20130626.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-SUMMARY = "ACPICA tools for the development and debug of ACPI tables"
-DESCRIPTION = "The ACPI Component Architecture (ACPICA) project provides an \
-OS-independent reference implementation of the Advanced Configuration and \
-Power Interface Specification (ACPI). ACPICA code contains those portions of \
-ACPI meant to be directly integrated into the host OS as a kernel-resident \
-subsystem, and a small set of tools to assist in developing and debugging \
-ACPI tables."
-HOMEPAGE = "http://www.acpica.org/"
-SECTION = "console/tools"
-LICENSE = "BSD | GPLv2"
-LIC_FILES_CHKSUM = "file://generate/unix/readme.txt;md5=204407e197c1a01154a48f6c6280c3aa"
-DEPENDS = "bison flex"
-PR="r1"
-
-SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
-    file://cross-compile.patch \
-    file://no-werror.patch \
-    file://fix-parallel-build.patch"
-
-SRC_URI[md5sum] = "b7112b3deffef8fe25aac7810cc419a9"
-SRC_URI[sha256sum] = "888dda6227265c396a686624f971c51693c2bba84f24c634536234c8dca7b465"
-
-S = "${WORKDIR}/acpica-unix2-${PV}"
-
-EXTRA_OEMAKE = "'OPT_CFLAGS=-Wall'"
-
-do_install() {
-    install -D -p -m0755 generate/unix/bin*/iasl ${D}${bindir}/iasl
-    install -D -p -m0755 generate/unix/bin*/acpibin ${D}${bindir}/acpibin
-    install -D -p -m0755 generate/unix/bin*/acpiexec ${D}${bindir}/acpiexec
-    install -D -p -m0755 generate/unix/bin*/acpihelp ${D}${bindir}/acpihelp
-    install -D -p -m0755 generate/unix/bin*/acpinames ${D}${bindir}/acpinames
-    install -D -p -m0755 generate/unix/bin*/acpisrc ${D}${bindir}/acpisrc
-    install -D -p -m0755 generate/unix/bin*/acpixtract ${D}${bindir}/acpixtract
-}
-
-COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
diff --git a/meta-oe/recipes-extended/acpica/acpica_20130823.bb b/meta-oe/recipes-extended/acpica/acpica_20130823.bb
new file mode 100644
index 0000000..15dbeba
--- /dev/null
+++ b/meta-oe/recipes-extended/acpica/acpica_20130823.bb
@@ -0,0 +1,37 @@
+SUMMARY = "ACPICA tools for the development and debug of ACPI tables"
+DESCRIPTION = "The ACPI Component Architecture (ACPICA) project provides an \
+OS-independent reference implementation of the Advanced Configuration and \
+Power Interface Specification (ACPI). ACPICA code contains those portions of \
+ACPI meant to be directly integrated into the host OS as a kernel-resident \
+subsystem, and a small set of tools to assist in developing and debugging \
+ACPI tables."
+HOMEPAGE = "http://www.acpica.org/"
+SECTION = "console/tools"
+LICENSE = "BSD | GPLv2"
+LIC_FILES_CHKSUM = "file://generate/unix/readme.txt;md5=204407e197c1a01154a48f6c6280c3aa"
+DEPENDS = "bison flex"
+PR="r1"
+
+SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
+    file://cross-compile.patch \
+    file://no-werror.patch \
+    file://fix-parallel-build.patch"
+
+SRC_URI[md5sum] = "6694a6a5baa4a23fba892b8ad23f3959"
+SRC_URI[sha256sum] = "dcaf8bcdd146006e7c480d4249e014e38eb2ae3e4d2d40f90ec454312cc7e4d1"
+
+S = "${WORKDIR}/acpica-unix2-${PV}"
+
+EXTRA_OEMAKE = "'OPT_CFLAGS=-Wall'"
+
+do_install() {
+    install -D -p -m0755 generate/unix/bin*/iasl ${D}${bindir}/iasl
+    install -D -p -m0755 generate/unix/bin*/acpibin ${D}${bindir}/acpibin
+    install -D -p -m0755 generate/unix/bin*/acpiexec ${D}${bindir}/acpiexec
+    install -D -p -m0755 generate/unix/bin*/acpihelp ${D}${bindir}/acpihelp
+    install -D -p -m0755 generate/unix/bin*/acpinames ${D}${bindir}/acpinames
+    install -D -p -m0755 generate/unix/bin*/acpisrc ${D}${bindir}/acpisrc
+    install -D -p -m0755 generate/unix/bin*/acpixtract ${D}${bindir}/acpixtract
+}
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
-- 
1.8.1.2


