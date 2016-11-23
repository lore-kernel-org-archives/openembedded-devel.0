Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8A0B160767
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 09:22:22 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id x23so663603pgx.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 01:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gHdXaNpQ0EfbOD6MJtCeYozT4MmGKnL1Rm6TAyPS1XU=;
	b=lefnDCzYvk3/kZCKhQadOpUJXCXy1UTsRe76bDG8E7uuxWoa9Es4TTqtGKn2a3VTKo
	rcSgz1nGHKW4GFs+DzQ5novvjyPt7T6veG9F+EMFZJx8CbbMitHARSvj/qnuO4/1yMAZ
	jktLEB5AqKeTzWiwarTcJYc7IHM71UWHvPuMkD5yHUwA/wctLlIXFAGV1KriGGVhjKOv
	EfoiRiVKpEo3N18IM0QN6hNrkXhxthG61yJaagUxWh063vpIXeEjfHjYqYMd2snWW1m1
	9O3xws+fD2pEqORRqjiiFgup862XKPsYc3k/e/0cdjjUAOsW97cHlUwiV3x2i8u5uf4N
	4mlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gHdXaNpQ0EfbOD6MJtCeYozT4MmGKnL1Rm6TAyPS1XU=;
	b=gQ7ts90rCRuEFvDEYJrVA8/RlZtD7+eDw18XlGIzD5xOpxSREO0BuOGFIssGfYyDks
	ztUUiZrfzRsNbXYVwm6YK/DtiJAtCM09+Xxq9EUFgIdwSe7YRPYYyHUzrwm0B/Ffkw/2
	mxOzEjFWsH5WQa8LUOCbZloNQkTPa+t4XUnbagRPquoNx/XOxwg0k5pgNLtDw7OtkfQ6
	zIytW7aF7VcCQcsjb7QV/WrYikWPxpWvdtKFclZyLupClXLw7JINpYkxHYvv8QThXPD7
	kjDWRbUfeULj3a+rUEFnnweai7NxM6qyVphkx1DaTLcAlSWZ4xl1brU6nmKdyuqt+CdK
	bGaw==
X-Gm-Message-State: AKaTC03smg6ZqT86YvilvXwLg0Hhquj2LGztEN68I6vUhlt9b/eQtLYCtDJUIheWWf2vUQ==
X-Received: by 10.84.173.4 with SMTP id o4mr4635297plb.123.1479892944028;
	Wed, 23 Nov 2016 01:22:24 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u23sm51056087pfg.86.2016.11.23.01.22.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 01:22:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 01:21:29 -0800
Message-Id: <20161123092209.23699-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161123092209.23699-1-raj.khem@gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 09/49] fwts: Update to 16.09 release
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Nov 2016 09:22:22 -0000

license change is just year change from 2014 to 2016
Fix build with clang while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nstant-logical-operand-warning-with-clang.patch | 81 ++++++++++++++++++++++
 meta-oe/recipes-test/fwts/fwts_git.bb              | 21 ++++--
 2 files changed, 95 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-operand-warning-with-clang.patch

diff --git a/meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-operand-warning-with-clang.patch b/meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-operand-warning-with-clang.patch
new file mode 100644
index 0000000..ccfe580
--- /dev/null
+++ b/meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-operand-warning-with-clang.patch
@@ -0,0 +1,81 @@
+From 953cff93c85d3cfd5cbcac56e14443dc5f6e5fbd Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Oct 2016 01:57:16 +0000
+Subject: [PATCH] ignore constant-logical-operand warning with clang
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/uefi/uefirtauthvar/uefirtauthvar.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+Index: git/src/uefi/uefirtauthvar/uefirtauthvar.c
+===================================================================
+--- git.orig/src/uefi/uefirtauthvar/uefirtauthvar.c
++++ git/src/uefi/uefirtauthvar/uefirtauthvar.c
+@@ -142,6 +142,9 @@ static int uefirtauthvar_deinit(fwts_fra
+ 	return FWTS_OK;
+ }
+ 
++#pragma clang diagnostic push
++#pragma clang diagnostic ignored "-Wconstant-logical-operand"
++
+ static int check_fw_support(fwts_framework *fw, uint64_t status)
+ {
+ 	if ((status == EFI_INVALID_PARAMETER) &&
+@@ -172,6 +175,8 @@ static int check_fw_support(fwts_framewo
+ 	return FWTS_OK;
+ }
+ 
++#pragma clang diagnostic pop
++
+ /*
+  * Set the created authenticated variable, AuthVarCreate,
+  * and checking the data size and data.
+Index: git/src/lib/src/fwts_acpi_tables.c
+===================================================================
+--- git.orig/src/lib/src/fwts_acpi_tables.c
++++ git/src/lib/src/fwts_acpi_tables.c
+@@ -392,10 +392,14 @@ static int fwts_acpi_handle_fadt(
+ 	/* Determine FACS addr and load it.
+ 	 * Will ignore the missing FACS in the hardware-reduced mode.
+ 	 */
++#pragma clang diagnostic push
++#pragma clang diagnostic ignored "-Waddress-of-packed-member"
++
+ 	result = fwts_acpi_handle_fadt_tables(fw, fadt,
+ 			"FACS", "FIRMWARE_CTRL", "X_FIRMWARE_CTRL",
+ 			&fadt->firmware_control, &fadt->x_firmware_ctrl,
+ 			provenance);
++
+ 	if (result != FWTS_OK) {
+ 		if ((result == FWTS_NULL_POINTER) &&
+ 				fwts_acpi_is_reduced_hardware(fadt)) {
+@@ -414,6 +418,7 @@ static int fwts_acpi_handle_fadt(
+ 		return FWTS_ERROR;
+ 	}
+ 	return FWTS_OK;
++#pragma clang diagnostic pop
+ }
+ 
+ /*
+Index: git/src/dmi/dmicheck/dmicheck.c
+===================================================================
+--- git.orig/src/dmi/dmicheck/dmicheck.c
++++ git/src/dmi/dmicheck/dmicheck.c
+@@ -209,6 +209,8 @@ static const char *uuid_patterns[] = {
+ 	"0A0A0A0A-0A0A-0A0A-0A0A-0A0A0A0A0A0A",
+ 	NULL,
+ };
++#pragma clang diagnostic push
++#pragma clang diagnostic ignored "-Wunneeded-internal-declaration"
+ 
+ static const fwts_chassis_type_map fwts_dmi_chassis_type[] = {
+ 	{ "Invalid",		FWTS_SMBIOS_CHASSIS_INVALID },
+@@ -245,6 +247,7 @@ static const fwts_chassis_type_map fwts_
+ 	{ "Convertible",	FWTS_SMBIOS_CHASSIS_CONVERTIBLE },
+ 	{ "Detachable",		FWTS_SMBIOS_CHASSIS_DETACHABLE },
+ };
++#pragma clang diagnostic pop
+ 
+ /* Remapping table from buggy version numbers to correct values */
+ static const fwts_dmi_version dmi_versions[] = {
diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
index 197fe20..b04be02 100644
--- a/meta-oe/recipes-test/fwts/fwts_git.bb
+++ b/meta-oe/recipes-test/fwts/fwts_git.bb
@@ -3,22 +3,29 @@ DESCRIPTION = "The tool fwts comprises of over fifty tests that are designed to
 HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=deb8af5388e838d133eaa036f4d1496f"
+LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
 
-PV = "14.12.00"
+PV = "16.09.00"
 
-SRCREV = "efc18d16294f492b7f72bba64344b2eed50e6a69"
-SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git"
+SRCREV = "15386283ad55e2a5b9366c1f43f4531ef79b01cb"
+SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git \
+           file://0001-ignore-constant-logical-operand-warning-with-clang.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "libpcre json-c glib-2.0"
+COMPATIBLE_HOST = "(i.86|x86_64|aarch64|powerpc64).*-linux"
 
-inherit autotools-brokensep
+DEPENDS = "libpcre json-c glib-2.0 dtc"
 
-CFLAGS += "-I${STAGING_INCDIR}/json-c -Wno-error=misleading-indentation"
+inherit autotools pkgconfig
+
+CFLAGS += "-I${STAGING_INCDIR}/json-c -Wno-error=unknown-pragmas"
 
 FILES_${PN} += "${libdir}/fwts/lib*${SOLIBS}"
 FILES_${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/fwts/lib*a"
 FILES_${PN}-dbg += "${libdir}/fwts/.debug"
+
+TOOLCHAIN = "gcc"
+
-- 
2.10.2


