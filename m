Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD046FFDA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 13:45:25 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id m124so3114577wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2016 06:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=x79fHLpfTcKeCcVEDanSY0h72Rw3nDLRH/ToSQ0bYNY=;
	b=gDCY2FEkWQ19+7Xh13LMX3Q+aGuSJudcq2s0/45gcZNtuxB0PiDxGdh1nB8ccUEWIy
	N8yTIFQzQJAVTMSfsAz+AnrFL/iV9/nLvw08DurwaQM/hi1Qg2sEDnMB7UWPMi7nK//V
	ZrqBtToPN+gSAVOz46dojkVn+G3Gthcqrg0V8Z/KVE0UATneIqAd68guzKxOeQDLDXGd
	mhScae87ivz+6dNSXj71/JvYIFTW07lhpuCXoUgpq4575EEJb/czcAPtq6l8oV9mTjMh
	For+iserrEwoHP53bdg+Ab3woWTgOH8CgBH8Bd1QYKMzYJlingnFHvQ0g5K17u8d4wEU
	CE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=x79fHLpfTcKeCcVEDanSY0h72Rw3nDLRH/ToSQ0bYNY=;
	b=HfnPKobVAqr7m5HBKAda7kc6ATvtTFxR6P4lexHBYHT54ot7u+DiCMzSRfeZLbhAB3
	lWKssxhbbsWNKSpS+sC9R3N/jB9ADx/NEddGeJZQTIsSjKgRtwcrhhtYy4FsPgbbZMnt
	Q80XAI3x5dfSWTMEboCC61duN30MyZd4DQRF+cgb0Uwl66+w+8CRz+zZ4LClbLPGp+Bp
	mchl3py7pPZaR10aOf9wtFZz/gXaHnTk8sF668NGHNiCm6VsNpJjfZA1b76YGKAvgqcg
	kHsVQsPf35kfcxbELCrNQRFkOwHqWUL5VgyIZehvIYnlwdMcRLv0ots62hEePe2QZ3Gj
	A1Iw==
X-Gm-Message-State: ALyK8tIL/PHKtW4LMR2Yq74g/2W0+qJHwZLgNHPa9jokbwEuY3NXQ8QXfE8ReIYKOOG3Xg==
X-Received: by 10.28.44.70 with SMTP id s67mr8557011wms.14.1465393525549;
	Wed, 08 Jun 2016 06:45:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id h8sm1640725wjg.9.2016.06.08.06.45.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jun 2016 06:45:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2016 15:45:42 +0200
Message-Id: <20160608134542.4523-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.4
Subject: [PATCH] faac, iperf, crash, espeak, open-vcdiff: blacklist, fails to build with gcc-6
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
X-List-Received-Date: Wed, 08 Jun 2016 13:45:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/faac/faac_1.28.bb     | 2 ++
 meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb           | 3 +++
 meta-oe/recipes-kernel/crash/crash_7.1.3.bb              | 3 +++
 meta-oe/recipes-support/espeak/espeak_1.37.bb            | 3 +++
 meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb | 3 +++
 5 files changed, 14 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb b/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
index d96c1a4..e87ddb1 100644
--- a/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
+++ b/meta-multimedia/recipes-multimedia/faac/faac_1.28.bb
@@ -19,3 +19,5 @@ FILES_lib${PN} = " ${libdir}/libfaac.so.*"
 FILES_lib${PN}-dev = "${includedir}/faac.h ${includedir}/faaccfg.h ${libdir}/libfaac.so ${libdir}/libfaac.la"
 FILES_lib${PN}-staticdev = "${libdir}/libfaac.a"
 
+# http://errors.yoctoproject.org/Errors/Details/68660/
+PNBLACKLIST[faac] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
index 4e66792..b9709f1 100644
--- a/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
+++ b/meta-oe/recipes-benchmark/iperf/iperf_2.0.5.bb
@@ -17,3 +17,6 @@ S = "${WORKDIR}/${BP}"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
+
+# http://errors.yoctoproject.org/Errors/Details/68671/
+PNBLACKLIST[iperf] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-oe/recipes-kernel/crash/crash_7.1.3.bb b/meta-oe/recipes-kernel/crash/crash_7.1.3.bb
index b787f02..49b187d 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.1.3.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.1.3.bb
@@ -110,3 +110,6 @@ RDEPENDS_${PN}_class-cross = ""
 # Causes gcc to get stuck and eat all available memory in qemuarm builds
 # jenkins  15161  100 12.5 10389596 10321284 ?   R    11:40  28:17 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.2/cc1 -quiet -I . -I . -I ./common -I ./config -I ./../include/opcode -I ./../opcodes/.. -I ./../readline/.. -I ../bfd -I ./../bfd -I ./../include -I ../libdecnumber -I ./../libdecnumber -I ./gnulib/import -I build-gnulib/import -isysroot /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -MMD eval.d -MF .deps/eval.Tpo -MP -MT eval.o -D LOCALEDIR="/usr/local/share/locale" -D CRASH_MERGE -D HAVE_CONFIG_H -D TUI=1 eval.c -quiet -dumpbase eval.c -march=armv5te -mthumb -mthumb-interwork -mtls-dialect=gnu -auxbase-strip eval.o -g -O2 -Wall -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototypes -Wdeclaration-after-statement -Wempty-body -feliminate-unused-debug-types -o -
 ARM_INSTRUCTION_SET = "arm"
+
+# http://errors.yoctoproject.org/Errors/Details/68624/
+PNBLACKLIST[crash] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-oe/recipes-support/espeak/espeak_1.37.bb b/meta-oe/recipes-support/espeak/espeak_1.37.bb
index 273fe34..2cf5ff2 100644
--- a/meta-oe/recipes-support/espeak/espeak_1.37.bb
+++ b/meta-oe/recipes-support/espeak/espeak_1.37.bb
@@ -42,3 +42,6 @@ do_install() {
     cp -prf ${S}/espeak-data/* ${D}${datadir}/espeak-data
     chown -R root:root ${D}${datadir}/espeak-data
 }
+
+# http://errors.yoctoproject.org/Errors/Details/68663/
+PNBLACKLIST[espeak] ?= "BROKEN: fails to build with gcc-6"
diff --git a/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb b/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb
index e6942d0..c32668b 100644
--- a/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb
+++ b/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb
@@ -16,3 +16,6 @@ SRC_URI[md5sum] = "5c0d378d907bebc38b51c3d7e4117011"
 SRC_URI[sha256sum] = "2b142b1027fb0a62c41347600e01a53fa274dad15445a7da48083c830c3138b3"
 
 inherit autotools
+
+# http://errors.yoctoproject.org/Errors/Details/68667/
+PNBLACKLIST[open-vcdiff] ?= "BROKEN: fails to build with gcc-6"
-- 
2.8.4


