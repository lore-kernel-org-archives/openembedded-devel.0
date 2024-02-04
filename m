Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0271C4828F
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 03:36:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.32129.1707017767963480356
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Feb 2024 19:36:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=J2krIFIQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2764459116=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4142oPhf015777
	for <openembedded-devel@lists.openembedded.org>; Sun, 4 Feb 2024 03:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=fCp34
	sA70GCgpVkll2emX1E9/Ow9lWN4Z2ncB72uE40=; b=J2krIFIQYWyqffnlVMI5i
	P5FNJZwHy2pZQN1SIiFG8sE783jQrGV4n9MJFS1tFhL1P85nWCFVN8eeJiSuSIMY
	k1xCO2oOppaQB9ss6U/UhPV8PK3JRhpLHNv7zxi21/rE/LVX/wkNETnnP6BLC6py
	gcbpt/V9l2FHiVMa8UjrrDeH3FFCDrGXtWe0KWV7AUA4JHp7kAjQEjas+VQIXN5B
	CHh6WoBo60dPLPA9Wn4wJWi/rFKFEaMC5Qtq1aprSjZrZZ2RqRQsa3j3JLIfWtPF
	jLqRnP+Rk6u75L8D79Rk40RfxfHxymOU0/zKB1AbZySrFxpMXgxTr13NSH++bn8h
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w1cs78rb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 04 Feb 2024 03:36:06 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 3 Feb 2024 19:36:02 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Sat, 3 Feb 2024 19:36:02 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [V3][meta-oe][PATCH] cpuid: fix do_install
Date: Sun, 4 Feb 2024 11:36:04 +0800
Message-ID: <20240204033604.3486037-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 7O3bXQMJLTh50FagmfqKZTXFZaf6QAhN
X-Proofpoint-GUID: 7O3bXQMJLTh50FagmfqKZTXFZaf6QAhN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-03_18,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 bulkscore=0 mlxlogscore=724 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402040025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Feb 2024 03:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108559

From: Changqing Li <changqing.li@windriver.com>

Fix do_install to make cpuid-doc installed correctly

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-devtools/cpuid/cpuid_20230614.bb  | 10 +++---
 ...e-the-hardcode-path-to-bindir-mandir.patch | 36 +++++++++++++++++++
 2 files changed, 42 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/cpuid/files/0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch

diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb b/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
index a88042ba65..ed339e0160 100644
--- a/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
+++ b/meta-oe/recipes-devtools/cpuid/cpuid_20230614.bb
@@ -8,6 +8,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz \
+           file://0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch \
            "
 SRC_URI[sha256sum] = "b1c83045efc26076307751e0662d580277f5f9bf89cf027231a7812003c3a4e8"
 
@@ -15,9 +16,10 @@ COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
 
 inherit perlnative
 
-# The install rule from the Makefile has hardcoded paths, so we duplicate
-# the actions to accommodate different paths.
 do_install () {
-    install -D -m 0755 ${B}/cpuid ${D}/${bindir}/cpuid
-    install -D -m 0444 ${B}/cpuid.man.gz ${D}/${mandir}
+    oe_runmake DESTDIR=${D} bindir=${bindir} mandir=${mandir} install
 }
+
+RDEPENDS:${PN} = "perl"
+
+INSANE_SKIP:${PN} += "already-stripped"
diff --git a/meta-oe/recipes-devtools/cpuid/files/0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch b/meta-oe/recipes-devtools/cpuid/files/0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch
new file mode 100644
index 0000000000..8654fb86c3
--- /dev/null
+++ b/meta-oe/recipes-devtools/cpuid/files/0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch
@@ -0,0 +1,36 @@
+From 1339348c5b69b32378a638d65b16297d29c5fa22 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 7 Nov 2023 16:06:49 +0800
+Subject: [PATCH] Makefile: update the hardcode path to bindir/mandir
+
+Update the hardcode path to bindir/mandir
+
+Upstream-Status: Pending [ Send to cpuid@etallen.com ]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 828d2b1..365e26d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -55,10 +55,10 @@ cpuinfo2cpuid.man.gz: cpuinfo2cpuid.man
+ 	gzip < $< > $@
+ 
+ install: $(PROG) $(PROG).man.gz cpuinfo2cpuid cpuinfo2cpuid.man.gz
+-	install -D $(INSTALL_STRIP) -m 755 $(PROG) $(BUILDROOT)/usr/bin/$(PROG)
+-	install -D -m 444 $(PROG).man.gz       $(BUILDROOT)/usr/share/man/man1/$(PROG).1.gz
+-	install -D -m 755 cpuinfo2cpuid        $(BUILDROOT)/usr/bin/cpuinfo2cpuid
+-	install -D -m 444 cpuinfo2cpuid.man.gz $(BUILDROOT)/usr/share/man/man1/cpuinfo2cpuid.1.gz
++	install -D $(INSTALL_STRIP) -m 755 $(PROG) $(BUILDROOT)${bindir}/$(PROG)
++	install -D -m 444 $(PROG).man.gz       $(BUILDROOT)${mandir}/man1/$(PROG).1.gz
++	install -D -m 755 cpuinfo2cpuid        $(BUILDROOT)${bindir}/cpuinfo2cpuid
++	install -D -m 444 cpuinfo2cpuid.man.gz $(BUILDROOT)${mandir}/man1/cpuinfo2cpuid.1.gz
+ 
+ clean:
+ 	rm -f $(PROG) $(PROG).i386 $(PROG).x86_64
+-- 
+2.25.1
+
-- 
2.25.1


