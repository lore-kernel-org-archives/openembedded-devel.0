Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6757DE7D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 19:58:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44znNZ1cF0z5k
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 21:58:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557345534;
	bh=SJfFO3EN5LELhCqVEnhDyD1OHSBoIC64ap2tThia3mY=;
	h=From:To:Subject:Date:From;
	b=mR2jOEd4NCAgh2nQ1oFe0mxlqlaclJfnoYoMjF438QFivKZ3UL1+lgOLzJyMWQW9G
	hteLg7HfCcBI6wwHAhSKbXz6o48ErFsgikknS2e7/rH7CpucaL0H+XlxtZFUSs1RAt
	+XtDbZ1KScHsJvWLr0Rar0UcitTN90yYTnmKCvs+nmUdRn0+g/ALhvVz/CTznJZW57
	Vxrn0G2povuRjfNOgB8VQqurompsBuAO054em/MoAxIBZ/kie6NoO1fKxodboc1D63
	2SXsDZnQPBgxFYnBNFRVhwLCTWmJCDW8yJRTLm2tVQVdpCwkelE6sf5XIAnqa3nM72
	N57iiGpNNc5XSb0VUK4hcZaTKpyb1jY22XOZFPs7y1e/c9LNbfFteskwht3VUaVL7S
	M3yrYPaUF5jlLx5o5USKpWAVabZatHI9aW2EcX0MqSEWFm6P8Uck2x5JbjU1qn4wnb
	jDxE17xS4J0xCvvSB7oQQwIOu6KcNkzyaMgw8EutOg4NliaVpG9kTLibK4xICiAm29
	3yzsaHAMI0Osu8/NLX2RYCpDflypeImt76DBMzLjKmsg7eRav2j7SazjHM4LHCjxSn
	cQ/DzEj5CSmnRJfVFDYRRvRPyDywAE+hoPuminMyRh11D+GuoVWBlxHas9B6B/iuP+
	W1ZP+X5Dlv7pu+kOHPEjNi8A=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2019 22:58:47 +0300
Message-Id: <20190508195852.28803-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-multimedia][PATCH] dvb-apps: Remove dvb-fe-xc5000c-4.1.30.7.fw
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
X-List-Received-Date: Wed, 08 May 2019 19:58:54 -0000

Shipping firmware for some specific device in dvb-apps is wrong,
even more so when the same binary is already in linux-firmware.

The firmware was also not LICENSE = "GPLv2" as the recipe claimed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../dvb-apps/dvb-apps_1.1.1.bb                  |   8 +-------
 .../dvb-apps/files/dvb-fe-xc5000c-4.1.30.7.fw   | Bin 16497 -> 0 bytes
 2 files changed, 1 insertion(+), 7 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/dvb-apps/files/dvb-fe-xc5000c-4.1.30.7.fw

diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
index ff9eabbb5..2aa7ccebf 100644
--- a/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/dvb-apps/dvb-apps_1.1.1.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRCREV = "3d43b280298c39a67d1d889e01e173f52c12da35"
 
 SRC_URI = "hg://linuxtv.org/hg;module=dvb-apps;protocol=http \
-          file://dvb-fe-xc5000c-4.1.30.7.fw \
           file://dvb-scan-table \
           file://0001-Fix-generate-keynames.patch \
           file://0002-Fix-compiler-warning-flags.patch \
@@ -31,10 +30,6 @@ do_install() {
     install -d ${D}/${docdir}/dvb-apps/scan
     install -d ${D}/${docdir}/dvb-apps/szap
     chmod a+rx ${D}/${libdir}/*.so*
-    if [ "${DVB_WINTV_TUNER}" = "true" ]; then
-        install -d ${D}/lib/firmware
-        install -m 0644 ${WORKDIR}/*.fw ${D}/lib/firmware/
-    fi
     cp -R --no-dereference --preserve=mode,links ${S}/util/szap/channels-conf* ${D}/${docdir}/dvb-apps/szap/
     cp -R --no-dereference --preserve=mode,links ${S}/util/szap/README   ${D}/${docdir}/dvb-apps/szap/
     cp -R --no-dereference --preserve=mode,links ${WORKDIR}/dvb-scan-table/* ${D}/usr/share/dvb
@@ -64,7 +59,7 @@ RDEPENDS_dvbnet =+ "libdvbapi"
 
 RCONFLICTS_dvb-evtest = "evtest"
 
-FILES_${PN} = "${bindir} ${datadir}/dvb lib/firmware"
+FILES_${PN} = "${bindir} ${datadir}/dvb"
 FILES_${PN}-doc = ""
 FILES_${PN}-dev = "${includedir}"
 FILES_dvb-evtest = "${bindir}/evtest"
@@ -103,5 +98,4 @@ python populate_packages_prepend () {
 INSANE_SKIP_${PN} = "ldflags"
 INSANE_SKIP_${PN}-dev = "ldflags"
 
-DVB_WINTV_TUNER = "true"
 TARGET_CC_ARCH += "${LDFLAGS}"
diff --git a/meta-multimedia/recipes-multimedia/dvb-apps/files/dvb-fe-xc5000c-4.1.30.7.fw b/meta-multimedia/recipes-multimedia/dvb-apps/files/dvb-fe-xc5000c-4.1.30.7.fw
deleted file mode 100644
index 5786ffa44179b739c8ce78c9f26a6fd1e6760d24..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 16497
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

-- 
2.17.1


