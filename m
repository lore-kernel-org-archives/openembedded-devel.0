Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9937B6BB9C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 10:33:21 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id p5so1240477lbi.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 03:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=QXreXU47ZiW+dp5ZH5QlIIOD+TPaKf6JaFyNpu1TnoY=;
	b=fpvqtb/zr2XRIxzVTMSaQLPEqBz4BJOQQ6NyRzAfktF3OyyVMSRmDKsp4CWPNnH83I
	bXmk5nBrPDOjkV3nAxhymGSDmPohwz4+w7/DcNO+VxcffibXTGz3+oyk0JNnHZ6hk/R2
	6fU4UzeBoTEXJWU1+yN3wYAuaLssPilbEue62ESdzUUKiM29PR5YxnViZqHEWfs6qw9i
	pAumFEbgUkwkk34QUOCevCDotcvKt6pysFRIVEPbYVtmp+FYwWS/b3xvw3nrcK4RnneB
	1lO0kzii02SA/PNMDsfgi1qVKh0MX64k37H+W2FcNGaJ/TpdYyO/+gaak8XK8F7Ua3FY
	Ew1g==
X-Gm-Message-State: ALoCoQn5j6E1++9dWof5e4B09Oy46aqp7s3G8HfU7HAukChshUBfOw/R4bnP3lrMzcmRlYGZny9k
X-Received: by 10.152.88.74 with SMTP id be10mr13427007lab.4.1377513201872;
	Mon, 26 Aug 2013 03:33:21 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id ap7sm5461308lac.10.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 03:33:21 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Aug 2013 13:33:14 +0300
Message-Id: <1377513195-21664-3-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377513195-21664-1-git-send-email-fathi.boudra@linaro.org>
References: <1377513195-21664-1-git-send-email-fathi.boudra@linaro.org>
Cc: koen@dominion.thruhere.net, Graeme Gregory <graeme.gregory@linaro.org>
Subject: [meta-oe][PATCH 2/3] acpica: fix recipe to be OE compliant with spacing
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
X-List-Received-Date: Mon, 26 Aug 2013 10:33:22 -0000

Signed-off-by: Graeme Gregory <graeme.gregory@linaro.org>
---
 meta-oe/recipes-extended/acpica/acpica_20130626.bb | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-extended/acpica/acpica_20130626.bb b/meta-oe/recipes-extended/acpica/acpica_20130626.bb
index bf38fa3..af0dd45 100644
--- a/meta-oe/recipes-extended/acpica/acpica_20130626.bb
+++ b/meta-oe/recipes-extended/acpica/acpica_20130626.bb
@@ -1,21 +1,18 @@
+SUMMARY = "ACPICA tools for the development and debug of ACPI tables"
 DESCRIPTION = "The ACPI Component Architecture (ACPICA) project provides an \
 OS-independent reference implementation of the Advanced Configuration and \
 Power Interface Specification (ACPI). ACPICA code contains those portions of \
 ACPI meant to be directly integrated into the host OS as a kernel-resident \
 subsystem, and a small set of tools to assist in developing and debugging \
 ACPI tables."
-SUMMARY = "ACPICA tools for the development and debug of ACPI tables"
 HOMEPAGE = "http://www.acpica.org/"
 SECTION = "console/tools"
 LICENSE = "BSD | GPLv2"
 LIC_FILES_CHKSUM = "file://generate/unix/readme.txt;md5=204407e197c1a01154a48f6c6280c3aa"
-DEPENDS="bison \
-    flex"
-COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
-
+DEPENDS = "bison flex"
 PR="r1"
 
-SRC_URI="https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
+SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
     file://cross-compile.patch \
     file://no-werror.patch \
     file://fix-parallel-build.patch"
@@ -23,7 +20,7 @@ SRC_URI="https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
 SRC_URI[md5sum] = "b7112b3deffef8fe25aac7810cc419a9"
 SRC_URI[sha256sum] = "888dda6227265c396a686624f971c51693c2bba84f24c634536234c8dca7b465"
 
-S="${WORKDIR}/acpica-unix2-${PV}"
+S = "${WORKDIR}/acpica-unix2-${PV}"
 
 EXTRA_OEMAKE = "'OPT_CFLAGS=-Wall'"
 
@@ -36,3 +33,5 @@ do_install() {
     install -D -p -m0755 generate/unix/bin*/acpisrc ${D}${bindir}/acpisrc
     install -D -p -m0755 generate/unix/bin*/acpixtract ${D}${bindir}/acpixtract
 }
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
-- 
1.8.1.2


