Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22472C4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 09:04:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.113396.1669626254425746569
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 01:04:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Rss2o1WY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83317b965e=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS8VOKs016175;
	Mon, 28 Nov 2022 09:04:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=u9C79khklkxKjPS+y5VncsRqQMqUoeO6GhZpsTpMM4k=;
 b=Rss2o1WY5XSHEdxGYY/mDa6cIqQFJg3POAWRys/jWHqVexwb5f+N61tN3PSlNnd3X4Fl
 F7foIlHHKr7CPgJ/RCYSxS+w5UhFiAhGA9gy/p4xKT4A4N1QBxiDMYONEujYenWDVrkO
 9xOPThZrX4uYlvmm+clO+aa7eOZaUXeJmUyzsrPH0yf+N4ZDJsGzwWB2MffYS6OouwL9
 BMkqlB71ucnK55AdtWk+2JdY0+S5uD7ndoufBsWkOIk3JDdsPqY6LsiQSDPbq7p1ihql
 3xf4wPhw+b/IAxYNQ1iQyRh+Kwkt71+1/EIKuGp1qc0gLgUJtapoIXgmGFRAwAgSkRTD aQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m39sbsbc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 28 Nov 2022 09:04:12 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 28 Nov 2022 01:04:11 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 28 Nov 2022 01:04:10 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] fixup! wxwidgets: 3.1.5 -> 3.2.1
Date: Mon, 28 Nov 2022 17:02:02 +0800
Message-ID: <20221128090202.13868-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: DGB041YZ_DtGPQKBPzKUjqIT_g-F-LDz
X-Proofpoint-ORIG-GUID: DGB041YZ_DtGPQKBPzKUjqIT_g-F-LDz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_07,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 suspectscore=0 mlxlogscore=815 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211280070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 09:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99823

From: Kai Kang <kai.kang@windriver.com>

The config file name is based on which package config among gtk, qt and
no_gui is enabled. Fix it in do_install script.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
index 4bb07fda0..7f0d27123 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
@@ -103,7 +103,7 @@ do_install:append() {
     # fix host contamination
     sed -i -e "s#${STAGING_DIR_NATIVE}##g" \
            -e "s#${STAGING_DIR_TARGET}##g" \
-           ${D}${libdir}/wx/config/gtk3-unicode-3.2 \
+           ${D}${libdir}/wx/config/*-unicode-3.2 \
            ${D}${libdir}/cmake/wxWidgets/wxWidgetsTargets.cmake
 }
 
-- 
2.17.1


