Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id DD56775E80
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 07:24:44 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so108919831wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 00:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kQn/MFzl3XhJ/49w2x/WaJoSQPOKNQIaJQ7yIMY5620=;
	b=b9LGxa6BuqiyZIolEXhKQjYGt1waFpywUbAPjRmrkSJ3gIu5U7Ll4tpFDc2k4vOvRt
	s+jXXJZMHXiVEkC1PEiMC4wWP7BjqHuZ0Mm64sF77lb8BpTI52pwMf7vPTKU3U0ACyUE
	HpegMWZqflj3lz19eIVg6oulcvFo5Tc+OP9KgJ0gm02cSqGh/cbiiZtPdUejHRFnJtwi
	W94kLIoMRW7TuPHqMKyLKODKPhL16hY5ywdaCKVwYvgBicgh1BSCQIr7dl54QGkHPDe+
	/Q2bxV8kh9IrKioQ1r5H8VgovmBA4GLNFQ9ioeaQAY7qfs4ufxXK7sI2XDG5OqzxT+Mk
	8XCg==
X-Gm-Message-State: ALoCoQnbB5Vhb28OpmNUevKEyUlKdYtiC6P8RPqu/ESJThv3r8p0ORsizBofNofKYxprSWLm33rR
X-Received: by 10.180.102.226 with SMTP id fr2mr43696915wib.3.1441697084429;
	Tue, 08 Sep 2015 00:24:44 -0700 (PDT)
Received: from localhost ([2001:610:612:0:2ad2:44ff:fe4b:bc17])
	by smtp.gmail.com with ESMTPSA id t7sm3233813wia.9.2015.09.08.00.24.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 00:24:43 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Sep 2015 09:24:35 +0200
Message-Id: <1441697075-16453-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.1.0
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [meta-oe][PATCH] acpica: update to 20150515 and fix conflicts with other layers
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
X-List-Received-Date: Tue, 08 Sep 2015 07:24:46 -0000

Meta-virtualization and meta-luv both has iasl_*.bb, which is a subset of this recipe. Extend this recipe to provide the native tools and add the necessary runtime conflict options.

Also address style issues by moving around a few bits and adding some whitespace.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---
 .../acpica/{acpica_20140828.bb => acpica_20150515.bb}  | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/acpica/{acpica_20140828.bb => acpica_20150515.bb} (80%)

diff --git a/meta-oe/recipes-extended/acpica/acpica_20140828.bb b/meta-oe/recipes-extended/acpica/acpica_20150515.bb
similarity index 80%
rename from meta-oe/recipes-extended/acpica/acpica_20140828.bb
rename to meta-oe/recipes-extended/acpica/acpica_20150515.bb
index fb19c88..de897e1 100644
--- a/meta-oe/recipes-extended/acpica/acpica_20140828.bb
+++ b/meta-oe/recipes-extended/acpica/acpica_20150515.bb
@@ -5,17 +5,22 @@ Power Interface Specification (ACPI). ACPICA code contains those portions of \
 ACPI meant to be directly integrated into the host OS as a kernel-resident \
 subsystem, and a small set of tools to assist in developing and debugging \
 ACPI tables."
+
 HOMEPAGE = "http://www.acpica.org/"
 SECTION = "console/tools"
+
 LICENSE = "BSD | GPLv2"
 LIC_FILES_CHKSUM = "file://generate/unix/readme.txt;md5=204407e197c1a01154a48f6c6280c3aa"
+
+COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+
 DEPENDS = "bison flex"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
     file://no-werror.patch \
     "
-SRC_URI[md5sum] = "6f05f0d10166a1b1ff6107f3d1cdf1e5"
-SRC_URI[sha256sum] = "01d8867656c5ba41dec307c4383ce676196ad4281ac2c9dec9f5be5fac6d888e"
+SRC_URI[md5sum] = "2bc4a7ccc82de9df9fa964f784ecb29c"
+SRC_URI[sha256sum] = "61204ec56d71bc9bfa2ee2ade4c66f7e8541772ac72ef8ccc20b3f339cc96374"
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
 
@@ -31,4 +36,11 @@ do_install() {
     install -D -p -m0755 generate/unix/bin*/acpixtract ${D}${bindir}/acpixtract
 }
 
-COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
+# iasl*.bb is a subset of this recipe, so RREPLACE it
+PROVIDES = "iasl"
+RPROVIDES_${PN} += "iasl"
+RREPLACES_${PN} += "iasl"
+RCONFLIGHTS_${PN} += "iasl"
+
+NATIVE_INSTALL_WORKS = "1"
+BBCLASSEXTEND = "native"
-- 
2.1.0


