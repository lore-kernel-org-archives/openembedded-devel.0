Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 97ED3719C5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 09:58:43 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id n85so4386793pfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 02:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vkTomOm0sHJXrI4sDVyjgHmk8cjW9ZgONW12kBY1tIM=;
	b=vRu4SEJJdyDoiDy15B4s1Uwfd6vINJ1jU6PMSwdwPKJbMDiP9fklyAjp37ZKQyBd4u
	DQvt28SkVfZlpZhpgHgyo2HOSOqBB7uTPOXqYewMjOSFnzgMdlr7NEbnpc8D5FTI6BA0
	3u7eY3YqLijv4O11fOePxqpevcuibyAsQU/6H5cPWrVuKNubkUGQyqYf0VVf2RWc09cW
	A19u98JNeUvsZ/MF2WTfvvs/1Zb9ExOhzo4i0zxsRat4VxE/Cyc2O1J6KR5uFIdniCd3
	qmF3j2seXrsC2TPna3+K8F/qZfVQ9fzsLL+Hp+ut2VH+MZMe50CjSzOYBf7msbgumSmO
	NDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vkTomOm0sHJXrI4sDVyjgHmk8cjW9ZgONW12kBY1tIM=;
	b=WJDKUsnsZKHOzD+TKyH+OMHa4tc4CEdxdDWlAKTz9O4lkkHdKDSom13FyF0RbDZOam
	Kg5eE+QFlzw7GwzcxUaecTr55qfdj1lG+oTS6fDSIfCfintuw5c/nFEBCkJg5rlqOwMe
	62m03+pIQtQMqxTqFRe3uT9Jk0iPIXG01mapyRQenO2nFFiwpU8O9Y7Kt2BqKOG7vAJJ
	pJ+j3hLQDe9vNQj0WYShd3eFRguaMM75EQffydbyYU6DLX23lFvtxzqQxJSwCbTHLODN
	yFzv98LBXOj3V/htk4edfkYf88zhq1P8rh44o+52a4arb9QNNCLlFmCIBC6VOCsx/O22
	UVCA==
X-Gm-Message-State: ABUngvfpt0z+7dsqhKbTJtqKjwfcGUhJRncB+uyrHLrWIG327U6BVhdhjhDoeqCybVwOYg==
X-Received: by 10.98.105.68 with SMTP id e65mr15109246pfc.174.1478167124696;
	Thu, 03 Nov 2016 02:58:44 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	qy2sm11280601pab.27.2016.11.03.02.58.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 02:58:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2016 02:58:38 -0700
Message-Id: <20161103095838.17297-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [meta-oe][PATCH] fwts: Update to 16.09 release
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
X-List-Received-Date: Thu, 03 Nov 2016 09:58:45 -0000

license change is just year change from 2014 to 2016
Fix build with clang while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---

V1 -> V2:
- Bump to latest to grab more recent fixes
- Limit to x86, aarch64 and ppc64 only since other arches dont support ACPI
- Add dep on dtc

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


