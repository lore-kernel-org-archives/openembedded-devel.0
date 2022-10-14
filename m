Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D674C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 02:24:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.2816.1665714252827173059
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Oct 2022 19:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iIEzUHvm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=72869ccf45=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29E2OCY4019985
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 19:24:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=P3hDvoF+WQT6LBXzhQtKvcXoSV88faEfrfQYrTpRiTI=;
 b=iIEzUHvmPo9ec/nbUDXe7/MOC3X5iCpCkgz1rnCTEBi5SkRIobrCRIeWjEfYQJx1v8Bl
 mFGiAh5/oAtU6uFi+9UmVsrLTkX9Km37PD10lW2YO2+5HIr7oxR21U56x8VEDUZoTdKp
 9eR6H2O4KZLNyR9E76apiiMmzIMUSNTnvpSRr9wKAvGG4YoC69cwg8t3Q9K299Kij8S2
 s12gRWdZyk2vf8cMiYSS2fHj5nEamjyTO4VIub9vjal1UiY9b+lxTZsflggWZi8GdRYj
 E5vmFLSdDs+ccrWaM5Xlg33i9QrAUxs6G1i7y/pYjEMmoDdGpqOeuR8R05t7/Gy5sT55 PQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k38qjcgxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 19:24:12 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 13 Oct 2022 19:24:11 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 13 Oct 2022 19:24:11 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][master][meta-oe][PATCH] redis: upgrade 7.0.4 to 7.0.5
Date: Fri, 14 Oct 2022 10:24:10 +0800
Message-ID: <20221014022410.644189-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ktJtCdiAAnmYT5iFGzDHUuomU2YOxgyr
X-Proofpoint-GUID: ktJtCdiAAnmYT5iFGzDHUuomU2YOxgyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_10,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=792 bulkscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210140011
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Oct 2022 02:24:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99167

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-extended/redis/{redis_7.0.4.bb => redis_7.0.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0.4.bb => redis_7.0.5.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_7.0.4.bb b/meta-oe/recipes-extended/redis/redis_7.0.5.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0.4.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.5.bb
index e292237097..3c23deb9ce 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0.4.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.5.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE-7.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "f0e65fda74c44a3dd4fa9d512d4d4d833dd0939c934e946a5c622a630d057f2f"
+SRC_URI[sha256sum] = "67054cc37b58c125df93bd78000261ec0ef4436a26b40f38262c780e56315cc3"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.25.1


