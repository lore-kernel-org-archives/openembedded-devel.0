Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F44C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 06:17:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.31680.1699856258300890832
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 22:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=py3bH72S;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=968118e1c1=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3AD5jagm001729
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 22:17:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=VCI42
	1pUY3dPDypc06Elk78Bg5E4CVn93Q52xfnh/6s=; b=py3bH72SjiPDgJ6uIACd1
	bxQKo3sSkfT2T9Fj+JlPMNEi6r9XYerQc8MH+trAaQbQNsD4Pe6l0xSU5vkOofFd
	LxU91dJg5xEYo4cYZAh5sUSt9BcLgKBefgTxtY8KrYqF24LH8elOVVZchzQKtGXR
	uAg9vFehWdhA/7w4GUVp1237Wp64hTmOonrb1F9tfIx9ppgEO10DyvoLBnFkxmzo
	WJ1hGGILVRIICjB/dYysQKIm2C13W7nwI2P4Gf9Wr6LCAe4pZz1yCBXN62rdeDhR
	M2uGml7YgqXayU7qJ3hNlM8mc/ZDDhszBPKXKhfvtrgYrU4kz0//HNzMU2a+OUpT
	g==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uaa0kh1kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 22:17:37 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 12 Nov 2023 22:17:41 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.34 via Frontend Transport; Sun, 12 Nov 2023 22:17:40 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [mickledore][master][meta-oe][PATCH] cpuid: fix do_install
Date: Mon, 13 Nov 2023 14:17:35 +0800
Message-ID: <20231113061735.2639794-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ZjksW6o4sU0Lbf-fZNHCCNYnJ-6sNVeK
X-Proofpoint-GUID: ZjksW6o4sU0Lbf-fZNHCCNYnJ-6sNVeK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-12_24,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=821 lowpriorityscore=0 adultscore=0 mlxscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311130053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 06:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106624

From: Changqing Li <changqing.li@windriver.com>

Fix do_install to make cpuid-doc installed correctly

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-devtools/cpuid/cpuid_20211129.bb  | 10 +++---
 ...e-the-hardcode-path-to-bindir-mandir.patch | 36 +++++++++++++++++++
 2 files changed, 42 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/cpuid/files/0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch

diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20211129.bb b/meta-oe/recipes-devtools/cpuid/cpuid_20211129.bb
index 3218ba652a..9eb01f6872 100644
--- a/meta-oe/recipes-devtools/cpuid/cpuid_20211129.bb
+++ b/meta-oe/recipes-devtools/cpuid/cpuid_20211129.bb
@@ -8,6 +8,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz \
+           file://0001-Makefile-update-the-hardcode-path-to-bindir-mandir.patch \
            "
 SRC_URI[sha256sum] = "230772bb88c44732e68a42d2eff43bcff46d893bf4ea6e04151d4cb6e8c88e2f"
 
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
index 0000000000..43486338a7
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
+Upstream-Status: pending
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


