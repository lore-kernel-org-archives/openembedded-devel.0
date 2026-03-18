Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97301FCD0B6
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 05:52:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7696.1773813120869810660
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 22:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Rp11KH0N;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7537d179d4=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HMQURM2291288
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 05:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=4osFM9PQTHuz62w1pKKw
	6avKlNSJzv6hVIU55Czmxj8=; b=Rp11KH0NCIXq7BQQJs70dWUntOUedpnsuUJ5
	r7YA3VzYfK26vKMNafAMqenJCyF4IuiWhkj+vLbmJAbsCQfupeKbED/PuXUOvtfu
	BNjRMjN8sJ8fKUrWHYyD1VRQk1CDJEg/jG4QtMnmePYsFRf5181GRmnqC0QaX7m3
	vyF/Zt3IokaFDcr50AgNv30G6/XTHLad1lJLfnvuno11IBXrhWJoQTyAwC0ciOPv
	l1ErFg2oeAa+D0E+4mSkfL5BVnlD7ek0Uw9LEIxpD2fwxtZn0SEywoTxvlhFQls3
	GVl7v4+MtbNJvzzY7NEBCztomAA9G7DBH5yyleJIXZsa/5/tmw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cy9anrw6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 05:51:59 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 17 Mar 2026 22:51:58 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 17 Mar 2026 22:51:57 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH] python3-paramiko: upgrade 3.5.1->4.0.0
Date: Wed, 18 Mar 2026 13:51:57 +0800
Message-ID: <20260318055157.471168-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=IrMTsb/g c=1 sm=1 tr=0 ts=69ba3d7f cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=3MfpYBi1AAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=28sUCjc5U-gvzdgzkVcA:9 a=0X5uXF-T04uBCvzKQ_8U:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: YwNjjuxo0MkHxnl9yha-TtynWNR_h-MS
X-Proofpoint-GUID: YwNjjuxo0MkHxnl9yha-TtynWNR_h-MS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA0NyBTYWx0ZWRfXxtMF/rltABlv
 EmyLymERkt0ycIVDwOnKMuEP77zNdpkfy/FfjwfKerynM/Ab+zBOfMjRkfIaNhK03ej/3YN1VL/
 qiAnydYMX19SCXG7E7U+Id2hPeCMD8BEwt5/dDF6YhDb7arpifIp/Ms4cnX5Xukm8g3qDbZRzIs
 sjgCEcbL/biiGYYe/EWnL354sM9kuSvdSjhugW4uHLJs0GGO20mmI7QsaaapMFIMYMrbOZBmqUp
 PFZgl/bRGULjgZPeZ37ZkNBbsDlvoIpxSjUTX0no7vG1whjM8OoqOsuoYTbWIg+EmoYgXbPOGX6
 pXtHluTKHoa1VnI2PBUjmDIcq6bQCktbemd/NwiQdTiQcJTbk2OJvMfCOtEcHhNY54kR8NQSD/H
 ZD8zFC+dNPqSSeK4X6Q/GUgQECtBARDR5u3ACx4ypbg6S8/VIpbLyrd1JCRfNm9nrKzc+LKSTfJ
 AlDKT+GUHH30kmaPRgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 05:52:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125346

From: Jiaying Song <jiaying.song.cn@windriver.com>

Changelog:
https://www.paramiko.org/changelog.html

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../{python3-paramiko_3.5.1.bb => python3-paramiko_4.0.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_3.5.1.bb => python3-paramiko_4.0.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_3.5.1.bb b/meta-python/recipes-devtools/python/python3-paramiko_4.0.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-paramiko_3.5.1.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_4.0.0.bb
index daf6386888..b1f86acb4e 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_3.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_4.0.0.bb
@@ -3,11 +3,11 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "b2c665bc45b2b215bd7d7f039901b14b067da00f3a11e6640995fd58f2664822"
+SRC_URI[sha256sum] = "6a25f07b380cc9c9a88d2b920ad37167ac4667f8d9886ccebd8f90f654b5d69f"
 
 PYPI_PACKAGE = "paramiko"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 CLEANBROKEN = "1"
 
-- 
2.34.1


