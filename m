Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA62AD116F3
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 09:03:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10738.1764752625957514983
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 01:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Zw5O1H2I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=443295ddc8=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B35HIaB1154748
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Dec 2025 01:03:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=Su92/Zn1UCvx3aLfktDM
	iNRZgu8HtH1ePa1knUtBKPw=; b=Zw5O1H2IWRnuf6bWIMp1lgKKzL4VVwwwqkhN
	C72Zpq0WofwbmFRUB0mmRUwBOrVXbnVf89Ui4Ec0EJ0YPV+ty3c4oXkQb+X7vLJY
	uQbP5TdcXsEyW9bFpCRNlrvGMGdnXdFX8aRXgFRlBHBP7fMeAekB10ZRd+sWB8he
	2A6SO4AWuuLyz88cDDwHzYF9Roy0rqmDYyisk5lflQVqK3a881Ml3jKHj90fAZzM
	23iemecoVur7jIeRLStBwbRMnK3ndTjMfZFOQH3bBupufM/+7vkE3N0D6kg6pQdM
	WTpbUkMB+WauIpOjQt5OCPBujhbMjC3MlMvg/CrSNDVdzhiNHg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17mvc8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 01:03:44 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 3 Dec 2025 01:03:44 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 3 Dec 2025 01:03:43 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libmng: correct version of libmng
Date: Wed, 3 Dec 2025 17:03:42 +0800
Message-ID: <20251203090342.2024473-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -CJikc4SmvaRRuaQBvibQPIkU4lkO89f
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=692ffcf1 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=FP58Ms26AAAA:8 a=t7CeM3EgAAAA:8
 a=aq3Hf8mS2OCL7pOpQdwA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: -CJikc4SmvaRRuaQBvibQPIkU4lkO89f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA3MSBTYWx0ZWRfX+zG2ISdOrPho
 Bz/VxTCp2fs74Y+sxF4gmSGV79Fv6uq3oGLiN/4/Wxqtu4KdvTwJ3l3oZFvDcO6JCrJjhbXiUU+
 73l4CSUv10UPossOupL3lYRLbP7T22RRjFV0ugcR42TzA2PwJSRg3rSVQ7GJVdoLCEmr9glIC4S
 B9Tlq24RwS4xnO1FAAl/SYPLMOnUpMeaXR9AxWJfRT4HZX7GBKmCUeW+YrB0HooviDiw21/yXcG
 u6hyw7mC26LIy/7f8tVvOD9kRUhqyMzzTzST91QqAuIM+xYBxVIIiX4lvqStpLtKJCpy58Ai5MK
 +sNGzj1AzQTdl657SQbeUCJZGVFajSZwchlXbLz0WyqCjHLKTq7UsUExUSMFUXR0sFbYw/IUoZ7
 B4vuS/ltEn4ki86cqQVjMSk0KYD19A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 09:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122273

From: Changqing Li <changqing.li@windriver.com>

Current version is 2.0.3, the lastrelease of libmng is in 2015,
add a patch to fix it

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...0001-configura.ac-update-the-version.patch | 32 +++++++++++++++++++
 .../recipes-graphics/libmng/libmng_2.0.3.bb   |  3 +-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/libmng/libmng/0001-configura.ac-update-the-version.patch

diff --git a/meta-oe/recipes-graphics/libmng/libmng/0001-configura.ac-update-the-version.patch b/meta-oe/recipes-graphics/libmng/libmng/0001-configura.ac-update-the-version.patch
new file mode 100644
index 0000000000..f0f644f807
--- /dev/null
+++ b/meta-oe/recipes-graphics/libmng/libmng/0001-configura.ac-update-the-version.patch
@@ -0,0 +1,32 @@
+From 8bf709daf0fe0657b55dad50a3a04854140c69a3 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 3 Dec 2025 13:57:39 +0800
+Subject: [PATCH] configura.ac: update the version
+
+current version is 2.0.3
+
+Upstream-Status: Inactive-Upstream [ lastrelease: 2015-04-20 ]
+
+https://sourceforge.net/projects/libmng/files/libmng-devel/
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 04f9c7a..a7ca9d8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,7 +3,7 @@ AC_PREREQ(2.65)
+ #
+ define([MAJ_NR],[2])
+ define([MIN_NR],[0])
+-define([REL_NR],[2])
++define([REL_NR],[3])
+ #
+ #AC_INIT (PACKAGE, VERSION, [BUG-REPORT], [TARNAME], [URL])
+ AC_INIT( [libmng],[MAJ_NR.MIN_NR.REL_NR],
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
index c92696b8bf..fe76520d15 100644
--- a/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
+++ b/meta-oe/recipes-graphics/libmng/libmng_2.0.3.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=32becdb8930f90eab219a8021130ec09"
 SECTION = "devel"
 DEPENDS = "zlib"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
+           file://0001-configura.ac-update-the-version.patch"
 
 SRC_URI[sha256sum] = "cf112a1fb02f5b1c0fce5cab11ea8243852c139e669c44014125874b14b7dfaa"
 
-- 
2.34.1


