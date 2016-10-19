Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 50C6771C36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:38:51 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i85so1426893pfa.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dW4O9viK6GaLaSENMgnqB4TfEVEEtkXNiW7VXBm0y6U=;
	b=OjP6jP7hp+bYXrFEhdqFNcb5r/5dMIZ/vYmNtzOuYmwbPWQisAWaVSFK2ywLkgY5KW
	AzG9lJjhlKt27nPgdF6hNs8Q1BkRVEHn22TK+S5mhJlayjJ/2NnLsxuCEGykeuagoHuA
	b9U2/QPhqHV3b3fpzswl4NA6DgRTZfh+JL16sNQmGCXq9zfJ7Jx5fDsrL/pVdGnATc/A
	gwQdqjZ7TF8oVXX14oYq1narFLy7kDuSrG/cwm9UsRRaZHhJ7V6DkgSajnLCJugbHAWX
	3YfscWgI+ZkZkHpjquvnrXzcSwfTZ9e6AsPdyReV3SH72i7Fi2KLCowxmBUYy1lW3dU8
	Fffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dW4O9viK6GaLaSENMgnqB4TfEVEEtkXNiW7VXBm0y6U=;
	b=VSIezEm5gIBttQXDbIkdaHSDTdr4yqaKQ7lIIa5a/lzVSJGJKVNRBCwEu0xTrU50jM
	OThcqGNlQaqpBN3DY3zjq2VhC0zEAacAOXYn2aHnGOK3mR70JnR+2T36ifiCmZagRYz2
	/Q7AAYBsUXtR5zuC8f/69/KRpL8isidXfeyBKQ8dG8ZC1g1CADjwTKcBwse2UNxgCK+p
	pnZ3zo2lokl3uN7ysPYJYjirNoUm9WN0sMvAlyNYp7M+eXR8ZvMXTyWUoY+ck9KbVNHE
	BNY0FHTEI96ltXNnlfYL6NbQXCBkWq2ciYzJJ7kW7ZU4552mCPulxJ0MZO8Cz/pMRCzt
	cwlw==
X-Gm-Message-State: AA6/9RkyxTaoHPS+lw4V9mBtcWPWesNYmt0QJgvOMW2ofvEnppZ4tEjM8XNJC3E8gkfLyw==
X-Received: by 10.99.153.17 with SMTP id d17mr6484441pge.122.1476855533029;
	Tue, 18 Oct 2016 22:38:53 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	qd12sm60099564pab.22.2016.10.18.22.38.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 22:38:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 22:38:32 -0700
Message-Id: <20161019053834.11523-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20161019053834.11523-1-raj.khem@gmail.com>
References: <20161019053834.11523-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 14/16] fwts: Update to 16.09 release
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
X-List-Received-Date: Wed, 19 Oct 2016 05:38:51 -0000

license change is just year change from 2014 to 2016
Fix build with clang while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nstant-logical-operand-warning-with-clang.patch | 81 ++++++++++++++++++++++
 meta-oe/recipes-test/fwts/fwts_git.bb              | 15 ++--
 2 files changed, 91 insertions(+), 5 deletions(-)
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
index 197fe20..cbf5154 100644
--- a/meta-oe/recipes-test/fwts/fwts_git.bb
+++ b/meta-oe/recipes-test/fwts/fwts_git.bb
@@ -3,12 +3,14 @@ DESCRIPTION = "The tool fwts comprises of over fifty tests that are designed to
 HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=deb8af5388e838d133eaa036f4d1496f"
+LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
 
-PV = "14.12.00"
+PV = "16.09.00"
 
-SRCREV = "efc18d16294f492b7f72bba64344b2eed50e6a69"
-SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git"
+SRCREV = "7fd1834a879f27647b371c18284868c9a54f6474"
+SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git \
+           file://0001-ignore-constant-logical-operand-warning-with-clang.patch \
+           "
 
 S = "${WORKDIR}/git"
 
@@ -16,9 +18,12 @@ DEPENDS = "libpcre json-c glib-2.0"
 
 inherit autotools-brokensep
 
-CFLAGS += "-I${STAGING_INCDIR}/json-c -Wno-error=misleading-indentation"
+CFLAGS += "-I${STAGING_INCDIR}/json-c -Wno-error=unknown-pragmas"
 
 FILES_${PN} += "${libdir}/fwts/lib*${SOLIBS}"
 FILES_${PN}-dev += "${libdir}/fwts/lib*${SOLIBSDEV} ${libdir}/fwts/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/fwts/lib*a"
 FILES_${PN}-dbg += "${libdir}/fwts/.debug"
+
+TOOLCHAIN = "gcc"
+
-- 
2.10.0


