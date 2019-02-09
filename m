Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id DBD4C7C5CA
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Feb 2019 18:58:05 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id c25so3030011pgb.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Feb 2019 10:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pD1obns3jwmmk4gxCGMnvNPa91xWQSNSo0VKJ6hLzrY=;
	b=RgadBHZnvbcovZqS2IijnsPyKkf4YkgoyJNbYhtFAF5CbHoY6cpTRhWL/dFlowNDOV
	bUl594qzF+ARTLIGxf7Ig5YJHqNPMRE6iKcKc7CSLWJt4KVqEcoOMDLNkN3UbujkmbRw
	Ujly/l6XjtDyk7MAVJZ1wwzv28UzzZVEO7epoTxMF+GD90kVBsuaowuDFYVCFdI4d6HV
	GZGS2e1N1z9WB4RZDytcnmMQN83v33mUROC4DDiypYfvRs3jeOTU+p8WK56mP+9iMrkZ
	34pxeuGt+MWlSTqSsA1bF0cg6H90OiZVvymH3GRQ/VTmWapOieIIyTl+utp9oMwNEWC0
	3PgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=pD1obns3jwmmk4gxCGMnvNPa91xWQSNSo0VKJ6hLzrY=;
	b=FYcSaMhnQDSnWExcvoaam7+hMbnKcj5EAok3Raaaz6NfcTeKbcc6O/biWd2IkJkH9N
	F4zcvwa+llUYg9hbiBxh2jFzy1ms4fsRw7MflTZzAtMkOx/e6/fCE02Q/1TxbbxnV1iI
	TXtpu/k/ZjaLQKGzmUq8XiwxCpjXa1I2NFFkonXMqnj5U/nR9Jyjgw//nUIlv4WySaWZ
	zNwByVj794+ym5LxID79INKZ6y4uwokPMePNI2dcC2ZQH2uWRHUtY4/GzeHub+VMH8D6
	oqKJLn9JjjL3djuSsRmG9uO7nOTD+KafUDWh4/5y9NT5NmZUBdRPxZXf9Dda1e2S4u3p
	+/sQ==
X-Gm-Message-State: AHQUAuYV+lAEFoWbohSY8kDLYK+d+E8a5lXUWPQEKerLU55+MU1uxyOW
	24y4E2u+cJs7t/+crmQG/guh425o
X-Google-Smtp-Source: AHgI3IYbco/Kr4u9YsYpbCS75AYjlvycVL8LEAPw1dtFiTGvaIGUuSbpRzdIrTGwdOlCUwp9mufWrA==
X-Received: by 2002:a63:2744:: with SMTP id n65mr26425585pgn.65.1549738686447; 
	Sat, 09 Feb 2019 10:58:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::dc44])
	by smtp.gmail.com with ESMTPSA id
	f14sm6165839pgv.23.2019.02.09.10.58.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Feb 2019 10:58:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Feb 2019 10:57:58 -0800
Message-Id: <20190209185758.19856-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH V2] image_types.bbclass: Set 70% RAM memory usage limit and -T for xz
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
X-List-Received-Date: Sat, 09 Feb 2019 18:58:06 -0000
Content-Transfer-Encoding: 8bit

when building with opkg backend and huge packages e.g. chromium/llvm all
going in parallel, memory pressure causes xz to catapult with

do_package_write_ipk: Failed to create package, opkg-build failed with: xz: (stdin): Cannot allocate memory

since there are many tasks going on in parallel, xz adds to memory pressure
and it wants it all, put an upper limit for memory xz can use

We add a variable XZ_MAXRAM with 30% of RAM limit and can be customized
if builders have more memory one can set it like

XZ_DEFAULTS = "-M 0 -T 0"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2: Consider all locations of xz use

 meta/classes/image_types.bbclass       | 9 ++++-----
 meta/classes/package_ipk.bbclass       | 2 +-
 meta/classes/populate_sdk_base.bbclass | 2 +-
 meta/conf/bitbake.conf                 | 3 +++
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 70bd315306..b12420310f 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -56,7 +56,6 @@ def imagetypes_getdepends(d):
 
 XZ_COMPRESSION_LEVEL ?= "-3"
 XZ_INTEGRITY_CHECK ?= "crc32"
-XZ_THREADS ?= "-T 0"
 
 ZIP_COMPRESSION_LEVEL ?= "-9"
 
@@ -152,12 +151,12 @@ UBI_VOLNAME ?= "${MACHINE}-rootfs"
 multiubi_mkfs() {
 	local mkubifs_args="$1"
 	local ubinize_args="$2"
-    
+
         # Added prompt error message for ubi and ubifs image creation.
         if [ -z "$mkubifs_args" ] || [ -z "$ubinize_args" ]; then
             bbfatal "MKUBIFS_ARGS and UBINIZE_ARGS have to be set, see http://www.linux-mtd.infradead.org/faq/ubifs.html for details"
         fi
-    
+
 	if [ -z "$3" ]; then
 		local vname=""
 	else
@@ -284,7 +283,7 @@ CONVERSIONTYPES = "gz bz2 lzma xz lz4 lzo zip sum md5sum sha1sum sha224sum sha25
 CONVERSION_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD_gz = "pigz -f -9 -n -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 CONVERSION_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
-CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
+CONVERSION_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_DEFAULTS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
 CONVERSION_CMD_lz4 = "lz4 -9 -z -l ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
 CONVERSION_CMD_lzo = "lzop -9 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 CONVERSION_CMD_zip = "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.zip ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
@@ -317,7 +316,7 @@ CONVERSION_DEPENDS_qcow2 = "qemu-native"
 RUNNABLE_IMAGE_TYPES ?= "ext2 ext3 ext4"
 RUNNABLE_MACHINE_PATTERNS ?= "qemu"
 
-DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso" 
+DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
 
 # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
 # images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdddirect, hddimg, iso, etc.
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 508b7dcaff..d1b317b42b 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -8,7 +8,7 @@ IPKGCONF_SDK =  "${WORKDIR}/opkg-sdk.conf"
 PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
 
 # Program to be used to build opkg packages
-OPKGBUILDCMD ??= 'opkg-build -Z xz -a "--threads 0"'
+OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
 
 OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
 OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 80fa443e4c..ebc30d39b3 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -226,7 +226,7 @@ fakeroot tar_sdk() {
 	# Package it up
 	mkdir -p ${SDKDEPLOYDIR}
 	cd ${SDK_OUTPUT}/${SDKPATH}
-	tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
+	tar ${SDKTAROPTS} -cf - . | xz ${XZ_DEFAULTS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
 }
 
 TOOLCHAIN_SHAR_EXT_TMPL ?= "${COREBASE}/meta/files/toolchain-shar-extract.sh"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9452d5ac4f..3f5d84d348 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -791,6 +791,9 @@ BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
 # Default to setting automatically based on cpu count
 PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
 
+# Default parallelism and resource usage for xz
+XZ_DEFAULTS ?= "--memlimit=30% --threads=${BB_NUMBER_THREADS}"
+
 ##################################################################
 # Magic Cookie for SANITY CHECK
 ##################################################################
-- 
2.20.1


