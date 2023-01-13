Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE655C54EBD
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 16:15:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.91771.1673626522281335937
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Jan 2023 08:15:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qtv9JJBd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0377ab77e1=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30DDS3Ob029163
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Jan 2023 08:15:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=g4NmE6XLVWuVQejCCfjts9NmrEiXhGRV32gce6bv2HE=;
 b=qtv9JJBdQzMU7DWod4RAHu1Vlr0f1K0tCJkEb5GLqC5hHFdSIj/1jC25+WxPLqeyaSCH
 cyWqMQOW7omdShFVkPm/DtOfYpBPaqUJM01wgXdrPKrGu/7P48zFlTAoYioXD6jfdnHI
 RdvH46w4ZrB/oAnEMcLQsJvGG/KdIlil5HxyZuA9beZ76ASqDP7shFWzJ24DrQ9HSv6j
 BLuuJ82tyxV2WjJw/KCXzdnvgyUbUA31slRFU0eaAeZ2J46QzbMN4LG0yhIZdL6eA2Sa
 ALe5pj8NIeS2x1s4DMHOzJ9hr1DAUlBT1kjWoBcKrFTEbMW/1CxFfbYEjUCycCKIDxYb 6A== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n1k5s2u4j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Jan 2023 08:15:21 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 13 Jan 2023 08:15:21 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Fri, 13 Jan 2023 08:15:20 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mozjs: fix compile error for arm
Date: Sat, 14 Jan 2023 00:15:18 +0800
Message-ID: <20230113161518.1118-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Ts4k2-vmjcEzb1fE1JUlBv8trgZorcTz
X-Proofpoint-GUID: Ts4k2-vmjcEzb1fE1JUlBv8trgZorcTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_07,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130108
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Jan 2023 16:15:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100564

From: Kai Kang <kai.kang@windriver.com>

Backport patch from firefox bugzilla to fix compile error for qemuarm
with some armv7ve tunes such as 'armv7vethf' and 'armv7vet-vfpv3d16':

| /path/to/build/tmp/work/armv7vet2hf-vfp-poky-linux-gnueabi/mozjs-102/102.5.0-r0/build/js/src/jit/AtomicOperationsGenerated.h:240:17:
  error: 'asm' operand has impossible constraints
|  240 |                 asm volatile (
|      |                 ^~~

Ref:
* https://bugzilla.mozilla.org/show_bug.cgi?id=1761665

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-add-arm-to-list-of-mozinline.patch   | 25 +++++++++++++++++++
 .../mozjs/mozjs-102_102.5.0.bb                |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-102/0001-add-arm-to-list-of-mozinline.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/0001-add-arm-to-list-of-mozinline.patch b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-add-arm-to-list-of-mozinline.patch
new file mode 100644
index 000000000..02f5e5c7e
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0001-add-arm-to-list-of-mozinline.patch
@@ -0,0 +1,25 @@
+Backport patch from firefox bugzilla to fix compile error for qemuarm with
+some armv7ve tunes such as 'armv7vethf' and 'armv7vet-vfpv3d16':
+
+| /path/to/build/tmp/work/armv7vet2hf-vfp-poky-linux-gnueabi/mozjs-102/102.5.0-r0/build/js/src/jit/AtomicOperationsGenerated.h:240:17:
+  error: 'asm' operand has impossible constraints
+|  240 |                 asm volatile (
+|      |                 ^~~
+
+Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=1761665]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+diff --git a/js/src/jit/GenerateAtomicOperations.py b/js/src/jit/GenerateAtomicOperations.py
+index d8a38a0..65f91ab 100644
+--- a/js/src/jit/GenerateAtomicOperations.py
++++ b/js/src/jit/GenerateAtomicOperations.py
+@@ -856,7 +856,7 @@ def generate_atomics_header(c_out):
+ 
+         # Work around a GCC issue on 32-bit x86 by adding MOZ_NEVER_INLINE.
+         # See bug 1756347.
+-        if is_gcc and cpu_arch == "x86":
++        if is_gcc and cpu_arch in ("x86", "arm"):
+             contents = contents.replace("INLINE_ATTR", "MOZ_NEVER_INLINE inline")
+         else:
+             contents = contents.replace("INLINE_ATTR", "inline")
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb
index d38ae10b8..5e884b6f6 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102_102.5.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://0001-rewrite-cargo-host-linker-in-python3.patch  \
            file://py-3.11.patch \
            file://musl-disable-stackwalk.patch \
+           file://0001-add-arm-to-list-of-mozinline.patch \
            "
 SRC_URI[sha256sum] = "017dd44b1285913f477074802707a4c76ed1a28270ec5a327bbb76574cc057d8"
 
-- 
2.17.1


