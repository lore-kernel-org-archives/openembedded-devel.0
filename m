Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B221AE98FD5
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 06:19:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.126486.1775715553931392036
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2026 23:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jblVOws0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8559144404=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6395BB7K3624839
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Apr 2026 06:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=J4uYXMpBnzj58QDXST8FPxT7FWu9WR/1+iVC/0XgAtI=; b=jblVOws0onPJ
	OdXCVR8bqIAZ3VJWop3xhfD8Wf5cl3Sz//7QRCNHMPbVxxv1a3eCMwNbPXfvHugs
	U1IHsEUzaPvgmOnoni3MuYxhsLH6NhP04QIDuFCKxBu+14bc94s6Fm7la7DkTXqJ
	QLaXDDWmtMs4nu9oGMJh23UKUBhXFDSRcI0XfrzkYjimfhNggxkLGbJZz0+WHK3a
	jCNn+dKs0uyrNAz6QGQUIzJOWSe5hEAdRdO6vaB2Kl/RNNQBT2YY7vgr3NfMo4Gd
	JRhvSVdX1ROe2QENGpCIK6jDhaSfQma7ZOSHsfgSCNQMx8rQ0L0cKTZANIEHTrpe
	foCe0KLn8w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrqkrf0-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 06:19:12 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 8 Apr 2026 23:19:11 -0700
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 8 Apr 2026 23:19:11 -0700
From: <jinfeng.wang.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][scarthgap][PATCH 06/11] hdf5: fix CVE-2025-44905
Date: Thu, 9 Apr 2026 14:18:59 +0800
Message-ID: <20260409061904.1694992-7-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260409061904.1694992-1-jinfeng.wang.cn@windriver.com>
References: <20260409061904.1694992-1-jinfeng.wang.cn@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=RPCD2Yi+ c=1 sm=1 tr=0 ts=69d744e0 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=fsqS_kxPcqjdks22YjMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: yWXTyA3RZU43xLFBJvr-HjZLWl99lnBh
X-Proofpoint-GUID: yWXTyA3RZU43xLFBJvr-HjZLWl99lnBh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA1NCBTYWx0ZWRfXy3Z+iLtEGPbz
 XEoWZ4nj+fF7alqJrN1NVHTEVJPkaIV6eNn6+9VWtwSRyRgcfU9rxCP/oPjvY+u9DQ31coHm+Xn
 0sEf+qCsBjNXRC4syhnYO31NrJnAhvCVGY+fXgaS1rAf5etKkdssBnjRO++B4XHomWTozgyUWb5
 Sxmjm+sTQ4S8fUWFQaYmsve0El5mhGXrBmVbFzp6Hx2+iLyS2kYyQGU7OfLgepsZxyPiccInGqD
 bvWWOcJvsyR5AX0oZPgiKEcQKT6b0cBSx2yxodaLe8eWLOf2+2AMYMw+n0cDonSa5R/UlykHkUU
 gtzhkfoXFTodbt+nvLWisvwrguHpHtgtOIF59cbnfjhchgPE8NNOWkVCPggAkkL3YDz++XIitFo
 reaSzt5wnwqrTiUFlMVIkadWGAPnMTRDoCkB5yiAvIVUHJHUx5/0XfRpj1E42V95T5G30HPeelc
 o3bSo/RHZGyLHV+zygw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_01,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 06:19:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126118

From: Libo Chen <libo.chen.cn@windriver.com>

According to [1], hdf5 v1.14.6 was discovered to contain a heap buffer
overflow via the H5Z__filter_scaleoffset function.

Backport patch [2] from upstream to fix CVE-2025-44905

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-44905
[2] https://github.com/HDFGroup/hdf5/commit/42588aeba786a121fec1fbad72cf39d8f60a4983

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../hdf5/files/CVE-2025-44905.patch           | 46 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-44905.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-44905.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-44905.patch
new file mode 100644
index 0000000000..91ad655760
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-44905.patch
@@ -0,0 +1,46 @@
+From d7ed737287ef2ecc6efd006fa11c3f784cdbdba6 Mon Sep 17 00:00:00 2001
+From: Libo Chen <libo.chen.cn@windriver.com>
+Date: Fri, 30 Jan 2026 14:37:09 +0800
+Subject: [PATCH] H5Zscaleoffset: add buffer size check to prevent
+ out-of-bounds reads
+
+Adds a buffer size check in H5Z__filter_scaleoffset to prevent out-of-bounds reads with malformed HDF5 files.
+
+Fixes CVE-2025-44905.
+
+CVE: CVE-2025-44905
+
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/42588aeba786a121fec1fbad72cf39d8f60a4983]
+
+Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
+---
+ src/H5Zscaleoffset.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/H5Zscaleoffset.c b/src/H5Zscaleoffset.c
+index 048344b..fbf12d6 100644
+--- a/src/H5Zscaleoffset.c
++++ b/src/H5Zscaleoffset.c
+@@ -1205,6 +1205,9 @@ H5Z__filter_scaleoffset(unsigned flags, size_t cd_nelmts, const unsigned cd_valu
+         unsigned           minval_size  = 0;
+ 
+         minbits = 0;
++        if (H5_IS_BUFFER_OVERFLOW((unsigned char *)*buf, 5, (unsigned char *)*buf + *buf_size - 1))
++            HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, 0, "buffer too short");
++
+         for (i = 0; i < 4; i++) {
+             minbits_mask = ((unsigned char *)*buf)[i];
+             minbits_mask <<= i * 8;
+@@ -1220,6 +1223,9 @@ H5Z__filter_scaleoffset(unsigned flags, size_t cd_nelmts, const unsigned cd_valu
+         minval_size = sizeof(unsigned long long) <= ((unsigned char *)*buf)[4] ? sizeof(unsigned long long)
+                                                                                : ((unsigned char *)*buf)[4];
+         minval      = 0;
++        if (H5_IS_BUFFER_OVERFLOW((unsigned char *)*buf, 5 + minval_size,
++                                  (unsigned char *)*buf + *buf_size - 1))
++            HGOTO_ERROR(H5E_ARGS, H5E_BADVALUE, 0, "buffer too short");
+         for (i = 0; i < minval_size; i++) {
+             minval_mask = ((unsigned char *)*buf)[5 + i];
+             minval_mask <<= i * 8;
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index 653c32ab4a..9cf3f98fe3 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -27,6 +27,7 @@ SRC_URI = " \
     file://CVE-2025-6857.patch \
     file://CVE-2025-2153.patch \
     file://CVE-2025-2310.patch \
+    file://CVE-2025-44905.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.34.1


