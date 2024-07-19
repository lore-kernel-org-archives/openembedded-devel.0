Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D45EC3DA5D
	for <webhook@archiver.kernel.org>; Fri, 19 Jul 2024 06:29:53 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13208.1721370588093897001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Jul 2024 23:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=793023b01e=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46J5t2n7011936
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 23:29:47 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40erjfsat6-12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 23:29:47 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 23:27:35 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 23:25:33 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [master][meta-python][PATCH] python3-h5py: remove unneeded CFLAGS
Date: Fri, 19 Jul 2024 14:25:32 +0800
Message-ID: <20240719062532.3740764-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Nj0oFssyPyZYkHCTRYFruOxYtzU0q-zO
X-Proofpoint-GUID: Nj0oFssyPyZYkHCTRYFruOxYtzU0q-zO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-19_03,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2407190050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 06:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111411

From: Changqing Li <changqing.li@windriver.com>

Following errors already fixed in 3.11.0, refer[1][2], so remove the
unneeded CFLAGS:
h5py/h5l.c:8163:107: error: passing argument 4 of '__pyx_f_4h5py_4defs_H5Lunpack_elink_val' from incompatible pointer type [-Wincompatible-pointer-types]
h5py/h5l.c:8163:133: error: passing argument 5 of '__pyx_f_4h5py_4defs_H5Lunpack_elink_val' from incompatible pointer type [-Wincompatible-pointer-types]

[1] https://github.com/h5py/h5py/pull/2382/commits/387a22b8c1513800c0401f496b4ed512c1639798
[2] https://github.com/h5py/h5py/pull/2380/commits/704e13ac83b42898514610c4df9f32f367e767e4

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-python/recipes-devtools/python/python3-h5py_3.11.0.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.11.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.11.0.bb
index e0ceafca1..1cf5f5638 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.11.0.bb
@@ -37,8 +37,3 @@ RDEPENDS:${PN} = "python3-numpy \
                  "
 
 export HDF5_VERSION="1.14.0"
-
-# http://errors.yoctoproject.org/Errors/Details/766919/
-# h5py/h5l.c:8163:107: error: passing argument 4 of '__pyx_f_4h5py_4defs_H5Lunpack_elink_val' from incompatible pointer type [-Wincompatible-pointer-types]
-# h5py/h5l.c:8163:133: error: passing argument 5 of '__pyx_f_4h5py_4defs_H5Lunpack_elink_val' from incompatible pointer type [-Wincompatible-pointer-types]
-CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.25.1


