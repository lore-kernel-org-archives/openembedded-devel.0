Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F288C0219D
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 10:13:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.47489.1739182435068355032
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 02:13:55 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=413644b4c0=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A6Q9Lo031384
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 10:13:54 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44nx88ss4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 10:13:54 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 10 Feb 2025 02:13:52 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 10 Feb 2025 02:13:52 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH v2] nmap: fix racing issue at do_compile
Date: Mon, 10 Feb 2025 18:13:51 +0800
Message-ID: <20250210101351.2729667-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: JLKqkWBvhwn1qg6SNt0xZABGtk81K-Kg
X-Authority-Analysis: v=2.4 cv=VZANPEp9 c=1 sm=1 tr=0 ts=67a9d162 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=NEAV23lmAAAA:8 a=auHYCxwYAAAA:8 a=t7CeM3EgAAAA:8 a=31k68eeUTyp9DnZEi88A:9 a=67XU6oJk2Lrwzah0vfu5:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: JLKqkWBvhwn1qg6SNt0xZABGtk81K-Kg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502100085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 10:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115399

There are two build-lua rules, one in Makefile.in, another in
ncat/Makefile.in which is required by build-ncat

Build them may cause potential racing

$ bitbake lib32-nmap
$ grep -e "Compiling liblua" -e 'nmap-7.95/liblua' -e ": error" -n patch-to/temp/log.do_compile
Compiling liblua
make[1]: Entering directory 'path-to/build/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
Compiling liblua
make[2]: Entering directory 'path-to/build/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
make[2]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/recipe-sysroot-native/usr/bin/i686-wrsmllib32-linux/../../libexec/i686-wrsmllib32-linux/gcc/i686-wrsmllib32-linux/14.2.0/ld: ./../liblua/liblua.a: error adding symbols: no more archived files
collect2: error: ld returned 1 exit status
make[1]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'

Explicitly make build-ncat depends on build-lua to avoid racing,
after applying the patch
...
Compiling liblua
make[1]: Entering directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
make[1]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
Compiling liblua
make[2]: Entering directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
make[2]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...ing-between-build-ncat-and-build-lua.patch | 55 +++++++++++++++++++
 meta-oe/recipes-security/nmap/nmap_7.95.bb    |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-oe/recipes-security/nmap/files/0001-fix-racing-between-build-ncat-and-build-lua.patch

diff --git a/meta-oe/recipes-security/nmap/files/0001-fix-racing-between-build-ncat-and-build-lua.patch b/meta-oe/recipes-security/nmap/files/0001-fix-racing-between-build-ncat-and-build-lua.patch
new file mode 100644
index 0000000000..aad8b1ee92
--- /dev/null
+++ b/meta-oe/recipes-security/nmap/files/0001-fix-racing-between-build-ncat-and-build-lua.patch
@@ -0,0 +1,55 @@
+From 0cde425abfcacdde725dccff29d01c9fce7c3888 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sun, 9 Feb 2025 00:45:36 +0000
+Subject: [PATCH] fix racing between build-ncat and build-lua
+
+There are two build-lua rules, one in Makefile.in, another in
+ncat/Makefile.in which is required by build-ncat
+
+Build them may cause potential racing
+
+$ bitbake lib32-nmap
+$ grep -e "Compiling liblua" -e 'nmap-7.95/liblua' -e ": error" -n patch-to/temp/log.do_compile
+Compiling liblua
+make[1]: Entering directory 'path-to/build/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+Compiling liblua
+make[2]: Entering directory 'path-to/build/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+make[2]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/recipe-sysroot-native/usr/bin/i686-wrsmllib32-linux/../../libexec/i686-wrsmllib32-linux/gcc/i686-wrsmllib32-linux/14.2.0/ld: ./../liblua/liblua.a: error adding symbols: no more archived files
+collect2: error: ld returned 1 exit status
+make[1]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+
+Explicitly make build-ncat depends on build-lua to avoid racing,
+after applying the patch
+...
+Compiling liblua
+make[1]: Entering directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+make[1]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+Compiling liblua
+make[2]: Entering directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+make[2]: Leaving directory 'path-to/tmp/work/corei7-32-wrsmllib32-linux/lib32-nmap/7.95/nmap-7.95/liblua'
+...
+
+Upstream-Status: Submitted [https://github.com/nmap/nmap/pull/3025]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index e2f79c9..0e634a3 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -159,7 +159,7 @@ build-netutil: libnetutil/Makefile
+ 	@echo Compiling libnetutil;
+ 	cd libnetutil && $(MAKE)
+ 
+-build-ncat: $(NCATDIR)/Makefile build-nbase build-nsock $(NCATDIR)/ncat.h @PCAP_BUILD@
++build-ncat: $(NCATDIR)/Makefile build-nbase build-nsock build-lua $(NCATDIR)/ncat.h @PCAP_BUILD@
+ 	cd $(NCATDIR) && $(MAKE)
+ 
+ build-lua: $(LIBLUADIR)/Makefile
+-- 
+2.47.1
+
diff --git a/meta-oe/recipes-security/nmap/nmap_7.95.bb b/meta-oe/recipes-security/nmap/nmap_7.95.bb
index a319be4fb0..f165e47bf5 100644
--- a/meta-oe/recipes-security/nmap/nmap_7.95.bb
+++ b/meta-oe/recipes-security/nmap/nmap_7.95.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
            file://0001-Include-time.h-header-to-pass-clang-compilation.patch \
            file://0002-Fix-building-with-libc.patch \
            file://0003-Fix-off-by-one-overflow-in-the-IP-protocol-table.patch \
+           file://0001-fix-racing-between-build-ncat-and-build-lua.patch \
            "
 SRC_URI[sha256sum] = "e14ab530e47b5afd88f1c8a2bac7f89cd8fe6b478e22d255c5b9bddb7a1c5778" 
 inherit autotools-brokensep pkgconfig python3native
-- 
2.34.1


