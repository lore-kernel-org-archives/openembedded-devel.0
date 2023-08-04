Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A18CC001DE
	for <webhook@archiver.kernel.org>; Fri,  4 Aug 2023 07:16:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6416.1691133369691804449
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Aug 2023 00:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RFHYzebX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7580682941=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3745NZ60014378
	for <openembedded-devel@lists.openembedded.org>; Fri, 4 Aug 2023 00:16:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=IOuoa
	mAqD2uUGkifPgCJ3cwKHM15XYGzlXjsqqMV0zw=; b=RFHYzebXRF5jMYEor1h4Z
	VlWrZKMO3O9Ms2UsQkhr2whyI/UD5rY9TwcEkamBr7rveVKs8CvqAoniRY0wes8i
	0yWFow4qt5CjMCsImPtrAJ2Dl8rGwQmWkwaWZuduxJZxrq5iqoaLPCASkg/qb5s6
	YITrY63poGWubdE9qBhR1cdDQ5CM4cIgXKhB3CDWFbMkhN5646gOJpFKNE9LkBoQ
	/WoeZ6R3wDYKBDB/jTorIo08/LP5DT/ADvYy7Ck88/39Ia+k2a20scr9pmnFeac6
	/z2EGKoPG1tyiu35yh+UmK3GTUct5JR4E6UdX+R9dkdpXYsc6w5hb6G81RRhL0Q5
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s6daquxb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 04 Aug 2023 00:16:09 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 4 Aug 2023 00:16:07 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] redis: upgrade 6.2.12 -> 6.2.13
Date: Fri, 4 Aug 2023 07:15:50 +0000
Message-ID: <20230804071550.378000-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: j3xUmWmAkCXCNWAQqoxyrcdxYHGIZFNk
X-Proofpoint-GUID: j3xUmWmAkCXCNWAQqoxyrcdxYHGIZFNk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-04_05,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 mlxlogscore=699 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308040063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Aug 2023 07:16:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104227

security fixes:
https://nvd.nist.gov/vuln/detail/CVE-2022-24834

Changelog:
==========
Re-enable downscale rehashing while there is a fork child

References:
https://github.com/redis/redis/releases/tag/6.2.13

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../recipes-extended/redis/{redis_6.2.12.bb => redis_6.2.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.12.bb => redis_6.2.13.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_6.2.12.bb b/meta-oe/recipes-extended/redis/redis_6.2.13.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_6.2.12.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.13.bb
index 3ed686781..640831c52 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.13.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "75352eef41e97e84bfa94292cbac79e5add5345fc79787df5cbdff703353fb1b"
+SRC_URI[sha256sum] = "89ff27c80d420456a721ccfb3beb7cc628d883c53059803513749e13214a23d1"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.40.0


