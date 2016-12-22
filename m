Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id A218B77505
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 06:19:30 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id y21so112182785lfa.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 22:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=1xH+yvrZTr9UfQAuLopb38UbHHJBvkJEE5/lK66GovE=;
	b=RNjok+c+SU7iDXbDxe02OiFccMNLuyPyE8yPedrPCAedBgw6aJLSiLrXR6YJG7jBsm
	vhp6TKuLPRYgxnKfpmeCHg51fqqY2sv8kIA8k2h6Yee7yv2iOoEVxr0UGhbI3v7Fq0zU
	2S5gVeexkwkjiKs2ifYv7TcxaRr7bVu7otJtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1xH+yvrZTr9UfQAuLopb38UbHHJBvkJEE5/lK66GovE=;
	b=jDWflWQKvTEb4+fB6KioPm2nMPgnHbg96qRN5U2Hpy02i0e1qDMtxpJOAxTgaK82FF
	3w8QbxyJByDzv80UicHzVK8MMOXzBX96c49dKvqcAyA9ots1/i4/MmiAVIRpdJpXo9GG
	oP8OcsdC1BWbZHx9cwR6YnZSuVpf94aGPmmKaYZSIwuHHptymDxXGOZCDom8Exwb/Ydf
	N5X1QwCoBufmC8QBYodsKynHIkMWh0OUmuKjob43+y/rDscvZestj1p6SPSvsP6xRFbF
	HGBcnM5zd+85Mii+W4fQmhHp5plbXTivspzd+/3ASEYMK8hA1ZKxFu0Po1A72B5PAUSo
	nSNg==
X-Gm-Message-State: AIkVDXLC301nsY4uAt23EmeeoKrEqv7sdEncMeJ3U6gq86pxHzIXd6V57HG2HhwqA+GxMC8X
X-Received: by 10.25.26.136 with SMTP id a130mr2110214lfa.154.1482387570986;
	Wed, 21 Dec 2016 22:19:30 -0800 (PST)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16]) by smtp.gmail.com with ESMTPSA id
	t126sm6647731lff.26.2016.12.21.22.19.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Dec 2016 22:19:29 -0800 (PST)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Dec 2016 08:19:30 +0200
Message-Id: <20161222061930.8821-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCH] fwts: upgrade to 16.12.00 release
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
X-List-Received-Date: Thu, 22 Dec 2016 06:19:31 -0000

* update PV and SRCREV to match 16.12.00 release
* refresh 0001-ignore-constant-logical-operand-warning-with-clang.patch

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 ...nstant-logical-operand-warning-with-clang.patch | 92 +++++++++++-----------
 meta-oe/recipes-test/fwts/fwts_git.bb              |  4 +-
 2 files changed, 49 insertions(+), 47 deletions(-)

diff --git a/meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-operand-warning-with-clang.patch b/meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-operand-warning-with-clang.patch
index ccfe580c1..a3cc1ff8e 100644
--- a/meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-operand-warning-with-clang.patch
+++ b/meta-oe/recipes-test/fwts/fwts/0001-ignore-constant-logical-operand-warning-with-clang.patch
@@ -5,37 +5,37 @@ Subject: [PATCH] ignore constant-logical-operand warning with clang
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+ src/dmi/dmicheck/dmicheck.c            | 3 +++
+ src/lib/src/fwts_acpi_tables.c         | 5 +++++
  src/uefi/uefirtauthvar/uefirtauthvar.c | 5 +++++
- 1 file changed, 5 insertions(+)
+ 3 files changed, 13 insertions(+)
 
-Index: git/src/uefi/uefirtauthvar/uefirtauthvar.c
-===================================================================
---- git.orig/src/uefi/uefirtauthvar/uefirtauthvar.c
-+++ git/src/uefi/uefirtauthvar/uefirtauthvar.c
-@@ -142,6 +142,9 @@ static int uefirtauthvar_deinit(fwts_fra
- 	return FWTS_OK;
- }
- 
+diff --git a/src/dmi/dmicheck/dmicheck.c b/src/dmi/dmicheck/dmicheck.c
+index ecd98223..7fca4a64 100644
+--- a/src/dmi/dmicheck/dmicheck.c
++++ b/src/dmi/dmicheck/dmicheck.c
+@@ -209,6 +209,8 @@ static const char *uuid_patterns[] = {
+ 	"0A0A0A0A-0A0A-0A0A-0A0A-0A0A0A0A0A0A",
+ 	NULL,
+ };
 +#pragma clang diagnostic push
-+#pragma clang diagnostic ignored "-Wconstant-logical-operand"
-+
- static int check_fw_support(fwts_framework *fw, uint64_t status)
- {
- 	if ((status == EFI_INVALID_PARAMETER) &&
-@@ -172,6 +175,8 @@ static int check_fw_support(fwts_framewo
- 	return FWTS_OK;
- }
++#pragma clang diagnostic ignored "-Wunneeded-internal-declaration"
  
+ static const fwts_chassis_type_map fwts_dmi_chassis_type[] = {
+ 	{ "Invalid",		FWTS_SMBIOS_CHASSIS_INVALID },
+@@ -245,6 +247,7 @@ static const fwts_chassis_type_map fwts_dmi_chassis_type[] = {
+ 	{ "Convertible",	FWTS_SMBIOS_CHASSIS_CONVERTIBLE },
+ 	{ "Detachable",		FWTS_SMBIOS_CHASSIS_DETACHABLE },
+ };
 +#pragma clang diagnostic pop
-+
- /*
-  * Set the created authenticated variable, AuthVarCreate,
-  * and checking the data size and data.
-Index: git/src/lib/src/fwts_acpi_tables.c
-===================================================================
---- git.orig/src/lib/src/fwts_acpi_tables.c
-+++ git/src/lib/src/fwts_acpi_tables.c
-@@ -392,10 +392,14 @@ static int fwts_acpi_handle_fadt(
+ 
+ /* Remapping table from buggy version numbers to correct values */
+ static const fwts_dmi_version dmi_versions[] = {
+diff --git a/src/lib/src/fwts_acpi_tables.c b/src/lib/src/fwts_acpi_tables.c
+index 30b4060e..d5339bf7 100644
+--- a/src/lib/src/fwts_acpi_tables.c
++++ b/src/lib/src/fwts_acpi_tables.c
+@@ -394,10 +394,14 @@ static int fwts_acpi_handle_fadt(
  	/* Determine FACS addr and load it.
  	 * Will ignore the missing FACS in the hardware-reduced mode.
  	 */
@@ -50,7 +50,7 @@ Index: git/src/lib/src/fwts_acpi_tables.c
  	if (result != FWTS_OK) {
  		if ((result == FWTS_NULL_POINTER) &&
  				fwts_acpi_is_reduced_hardware(fadt)) {
-@@ -414,6 +418,7 @@ static int fwts_acpi_handle_fadt(
+@@ -416,6 +420,7 @@ static int fwts_acpi_handle_fadt(
  		return FWTS_ERROR;
  	}
  	return FWTS_OK;
@@ -58,24 +58,26 @@ Index: git/src/lib/src/fwts_acpi_tables.c
  }
  
  /*
-Index: git/src/dmi/dmicheck/dmicheck.c
-===================================================================
---- git.orig/src/dmi/dmicheck/dmicheck.c
-+++ git/src/dmi/dmicheck/dmicheck.c
-@@ -209,6 +209,8 @@ static const char *uuid_patterns[] = {
- 	"0A0A0A0A-0A0A-0A0A-0A0A-0A0A0A0A0A0A",
- 	NULL,
- };
+diff --git a/src/uefi/uefirtauthvar/uefirtauthvar.c b/src/uefi/uefirtauthvar/uefirtauthvar.c
+index cdfd7aa3..001e8cc8 100644
+--- a/src/uefi/uefirtauthvar/uefirtauthvar.c
++++ b/src/uefi/uefirtauthvar/uefirtauthvar.c
+@@ -142,6 +142,9 @@ static int uefirtauthvar_deinit(fwts_framework *fw)
+ 	return FWTS_OK;
+ }
+ 
 +#pragma clang diagnostic push
-+#pragma clang diagnostic ignored "-Wunneeded-internal-declaration"
++#pragma clang diagnostic ignored "-Wconstant-logical-operand"
++
+ static int check_fw_support(fwts_framework *fw, uint64_t status)
+ {
+ 	if ((status == EFI_INVALID_PARAMETER) &&
+@@ -172,6 +175,8 @@ static int check_fw_support(fwts_framework *fw, uint64_t status)
+ 	return FWTS_OK;
+ }
  
- static const fwts_chassis_type_map fwts_dmi_chassis_type[] = {
- 	{ "Invalid",		FWTS_SMBIOS_CHASSIS_INVALID },
-@@ -245,6 +247,7 @@ static const fwts_chassis_type_map fwts_
- 	{ "Convertible",	FWTS_SMBIOS_CHASSIS_CONVERTIBLE },
- 	{ "Detachable",		FWTS_SMBIOS_CHASSIS_DETACHABLE },
- };
 +#pragma clang diagnostic pop
- 
- /* Remapping table from buggy version numbers to correct values */
- static const fwts_dmi_version dmi_versions[] = {
++
+ /*
+  * Set the created authenticated variable, AuthVarCreate,
+  * and checking the data size and data.
diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
index b04be021b..82ed5ecf0 100644
--- a/meta-oe/recipes-test/fwts/fwts_git.bb
+++ b/meta-oe/recipes-test/fwts/fwts_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
 
-PV = "16.09.00"
+PV = "16.12.00"
 
-SRCREV = "15386283ad55e2a5b9366c1f43f4531ef79b01cb"
+SRCREV = "d38fced7db86e5483d5c2e634ee1eec98620d5b8"
 SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git \
            file://0001-ignore-constant-logical-operand-warning-with-clang.patch \
            "
-- 
2.11.0


