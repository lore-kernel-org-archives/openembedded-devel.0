Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5D8E99040
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 07:05:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150884.1775804714465485307
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2026 00:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fWOgN1bT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8560f54642=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A502Pq2703639
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 00:05:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ua+CkW458HQZY8VuSYFTbHrKWh2p0K8bPi7y0en36EM=; b=fWOgN1bTE7gL
	iFVLoZNpFqjgXSKXb9ABdHvVKB23Yddmp+OG+vX1WvD5hbGKTL0MaXFKew49EU1x
	3vO78lmjMr/IeMhgMOBZ9HuANEZeu3R0zJFzu+xUr7/BGiLR8K54CGbk0QIys5Uc
	lCVnkEVnmo/NWbISdHcE4sFaJv7dPwXoU2Chle1TU9dPBGM3386I2pbSFMJGdqp7
	ae67RJLwLA2H9JsinGFoNDYWdjc5K0g2TskdSKB1UdPIoPOTS1J9tfPGJ6sx4mEI
	uDJcDeSZRxup3bT+NGcFu528gmBY0hn9EHC/10+VzbnYgmSywsp55047Pad8e/ui
	bL9zUiWpjg==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmryn4ed-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 00:05:13 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 10 Apr 2026 00:05:13 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 10 Apr 2026 00:05:12 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH v2 04/11] hdf5: fix CVE-2025-2153
Date: Fri, 10 Apr 2026 15:05:01 +0800
Message-ID: <20260410070508.1104455-5-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
References: <20260410070508.1104455-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: bETLQf0u91QccDePPkKJhzWPMi1KOW5J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA2MyBTYWx0ZWRfX64dMz+hiT6a0
 yqO/kBKVftT04WmbxuMhL766D0NORz6YTZzt+TLVSx5QPE6vG6lsQ1E+q3zE+oulWGT1QlIk/xb
 E2ytUjRsLv7IQdpZSE4+49YV1MwDiVH2qkjWuqqbeeWxX01zuQwXqhlwk8PzOjcnebVUprGC+GB
 Vaz67a12FLB7gHiLYd8TjzABSJCnSODtKgwhIQ8+cpGlTwBY7lcROYvzA+1Kvux9ktKSJcQQndx
 EhJMdjJc7/gLLGzomEOpmSyUXZL9IjK7fOcBZERSfI3p6ckY85gNkTDN/0ywlomt0Fsp61+otmn
 rIZ7hbl58DvmBWBBnLyJ/UZ+pxIWIpokeRowrsGMFHcl/udTWwWk32UJya5WXwWIYLVo/r3ICJa
 /amwJR4LuYqfsmfMzgb3LgTIT48VUCtgHUmXNsnxviL6WtXL/B7CMsoMY3m/+rrsnl8qcPN/DAw
 EqFXHvXli4LHhXlezTg==
X-Proofpoint-GUID: bETLQf0u91QccDePPkKJhzWPMi1KOW5J
X-Authority-Analysis: v=2.4 cv=Wcg8rUhX c=1 sm=1 tr=0 ts=69d8a129 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=HK-ge7EqtdluswH-FwHe:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=1UTvrjLGKP7plThKwisA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Apr 2026 07:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126226

From: Libo Chen <libo.chen.cn@windriver.com>

According to [1], A vulnerability, which was classified as critical, was
found in HDF5 1.14.6. Affected is the function H5SM_delete of the file
H5SM.c of the component h5 File Handler. The manipulation leads to
heap-based buffer overflow. It is possible to launch the attack remotely.
The complexity of an attack is rather high. The exploitability is told to
be difficult. The exploit has been disclosed to the public and may be used.

Backport patch [2] from upstream to fix CVE-2025-2153

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-2153
[2] https://github.com/HDFGroup/hdf5/commit/38954615fc079538aa45d48097625a6d76aceef0

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../hdf5/files/CVE-2025-2153.patch            | 51 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2153.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-2153.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-2153.patch
new file mode 100644
index 0000000000..6f77ad330b
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-2153.patch
@@ -0,0 +1,51 @@
+From 586f01d74f23dabcd733c82a05cf26bf123a91dc Mon Sep 17 00:00:00 2001
+From: Libo Chen <libo.chen.cn@windriver.com>
+Date: Fri, 30 Jan 2026 11:42:10 +0800
+Subject: [PATCH] Fix CVE-2025-2153
+
+This PR fixes #5329. Previously, the message flags field was able to be modified such that a message that is not sharable according to the share_flags field in H5O_msg_class_t could be treated as sharable. A check has been added to make sure messages that are not sharable can't be modified so that they indicate they can be shared.
+
+The bug was first reproduced using the fuzzer and the POC file from #5329. With this change, the heap based buffer overflow no longer occurs.
+
+CVE: CVE-2025-2153
+
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/38954615fc079538aa45d48097625a6d76aceef0]
+
+Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
+---
+ src/H5Ocache.c   | 4 ++--
+ src/H5Omessage.c | 3 +++
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/H5Ocache.c b/src/H5Ocache.c
+index 9b82509..7203490 100644
+--- a/src/H5Ocache.c
++++ b/src/H5Ocache.c
+@@ -1422,8 +1422,8 @@ H5O__chunk_deserialize(H5O_t *oh, haddr_t addr, size_t chunk_size, const uint8_t
+             else {
+                 /* Check for message of unshareable class marked as "shareable"
+                  */
+-                if ((flags & H5O_MSG_FLAG_SHAREABLE) && H5O_msg_class_g[id] &&
+-                    !(H5O_msg_class_g[id]->share_flags & H5O_SHARE_IS_SHARABLE))
++                if (((flags & H5O_MSG_FLAG_SHARED) || (flags & H5O_MSG_FLAG_SHAREABLE)) &&
++                    H5O_msg_class_g[id] && !(H5O_msg_class_g[id]->share_flags & H5O_SHARE_IS_SHARABLE))
+                     HGOTO_ERROR(H5E_OHDR, H5E_CANTLOAD, FAIL,
+                                 "message of unshareable class flagged as shareable");
+ 
+diff --git a/src/H5Omessage.c b/src/H5Omessage.c
+index 7190e46..fb9006c 100644
+--- a/src/H5Omessage.c
++++ b/src/H5Omessage.c
+@@ -354,6 +354,9 @@ H5O__msg_write_real(H5F_t *f, H5O_t *oh, const H5O_msg_class_t *type, unsigned m
+          */
+         assert(!(mesg_flags & H5O_MSG_FLAG_DONTSHARE));
+ 
++        /* Sanity check to see if the type is not sharable */
++        assert(type->share_flags & H5O_SHARE_IS_SHARABLE);
++
+         /* Remove the old message from the SOHM index */
+         /* (It would be more efficient to try to share the message first, then
+          *      delete it (avoiding thrashing the index in the case the ref.
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 1b9f0fcfa8..715f14ccae 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -25,6 +25,7 @@ SRC_URI = " \
     file://CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_02.patch \
     file://CVE-2025-2926.patch \
     file://CVE-2025-6857.patch \
+    file://CVE-2025-2153.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.34.1


