Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E95C46467
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 15:42:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.160465.1672155741858866595
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Dec 2022 07:42:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=MOJ2lc2d;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=936063681c=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BRFgLfo014394
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 07:42:21 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=lHUAu4JrcnETGpsP5q/SZDC8qLdTeXhbxY5NhCJ0i30=;
 b=MOJ2lc2dGu70ok7x7JQlIx2xrWj9RbBTilLQ6LkUvvlxraLDHioB23G3JebRYwllgSbu
 YkdpPFjlEYK0mUijXpTuva6kByNxVvZmaiKpz+2HsUVKuv4uQnLJPtk1Eh8Y+5wpZ1W7
 +DsM1VnNRtI3KQlYI2HOBYSNNpsiql262Hy0BkaS1ObwGwMYGFvOulmj7O8YgJGnTbu7
 JRJ1ak7oNcqzUxL9+SA7eZh1Qt2meF++i5CC0ETbVqY0enLcwh2VelEWBaZCoU8ywJzL
 Pj+fs6ZLXHi9ZNPgmfBlXM5v2kD5Q2hs1ylb8PQB6Au7r48Ju1yU6ksX+0XWXuGqAkBB Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mp1trhjrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 07:42:21 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BRFgLh3014348
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 07:42:21 -0800
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mp1trhjra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 27 Dec 2022 07:42:21 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 27 Dec 2022 07:42:20 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 27 Dec 2022 07:42:20 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 2/5] xfce4-cpugraph-plugin: 1.2.6 -> 1.2.7
Date: Tue, 27 Dec 2022 23:42:14 +0800
Message-ID: <20221227154217.30842-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221227154217.30842-1-kai.kang@windriver.com>
References: <20221227154217.30842-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: zf1a-iQgrtctiK1JDnxCtBu6LS_Vog44
X-Proofpoint-ORIG-GUID: W1YhuNFdillHxOZwJR-uOXfkEA8HV7Kw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_11,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=855
 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212270129
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 15:42:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100288

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-cpugraph-plugin from 1.2.6 to 1.2.7

* correct license with LGPL-2.0-or-later

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...pugraph-plugin_1.2.6.bb => xfce4-cpugraph-plugin_1.2.7.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/cpugraph/{xfce4-cpugraph-plugin_1.2.6.bb => xfce4-cpugraph-plugin_1.2.7.bb} (68%)

diff --git a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.6.bb b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.7.bb
similarity index 68%
rename from meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.6.bb
rename to meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.7.bb
index a9ac08989..e23188d30 100644
--- a/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.6.bb
+++ b/meta-xfce/recipes-panel-plugins/cpugraph/xfce4-cpugraph-plugin_1.2.7.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Panel plugin with graphical representation of the cpu frequency"
 HOMEPAGE = "https://goodies.xfce.org/projects/panel-plugins/xfce4-cpugraph-plugin"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=415654f59d8fa70fe4eac2c3f86c8f5e"
 
 inherit xfce-panel-plugin
 
-SRC_URI[sha256sum] = "773246f57c1824a85468d4119c17aeb07170ed1ebace8fa406c7fbcf5b47af99"
+SRC_URI[sha256sum] = "68a651e278ed7186964e455b69b15da77f8d56257e5c3d6adf783b3ee9337405"
-- 
2.34.1


