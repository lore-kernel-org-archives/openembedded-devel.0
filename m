Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4ECC001B0
	for <webhook@archiver.kernel.org>; Fri, 11 Aug 2023 10:53:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.39932.1691751199917035354
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Aug 2023 03:53:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fQfGP9RB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7587f097e0=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37BAfhcP021974
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 03:53:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=J3xJq
	SS2RT+S056vCAlnP2yjGkISitPgEqts3+L9uOE=; b=fQfGP9RBTCwp0nUNl8JEh
	WKx6qwgBqZ0Bk8HLFcoaacnWpLXXU6gNiN4pPfuOsjUeAwBlVMFGh5hyb/RCUmZ9
	W5MDQDihpZ6YDVGWJwxtl9F7y1RdvnB2RmgFhcvIoD9QzpK9yKaka4AdLB7x//38
	UbwXsRI04KhGMph3b875K99ZZbXB+d6IOWITfzR8nqbf+dV+ptCKEexHIHzjC+3Z
	qzKV1a0mlOi7yUU7noD/YJ9sPengxmDuBboAxOogHmuvKZYLzYjQw2JfHCMHMvc0
	ET/t9PsYmh6xtYHWcHZGX1feeBGytZBL8UnL87ANQNHfeVPvwyNB4M8uWlov5Ioc
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sd8yk0e9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 03:53:19 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 03:53:18 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Fri, 11 Aug 2023 03:53:18 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [mickledore][PATCH] php: Upgrade to 8.2.8
Date: Fri, 11 Aug 2023 18:53:17 +0800
Message-ID: <20230811105317.67883-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -z7vqyqyPr5nzG4pInS5AticW2tutB-u
X-Proofpoint-GUID: -z7vqyqyPr5nzG4pInS5AticW2tutB-u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-11_01,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=813 clxscore=1015 impostorscore=0
 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308110099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Aug 2023 10:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104337

From: Mingli Yu <mingli.yu@windriver.com>

php 8.2.7 is a security release and the php 8.2.8 is a bug fix release
and more details at [1].

[1] https://www.php.net/ChangeLog-8.php#8.2.7

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-devtools/php/{php_8.2.6.bb => php_8.2.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.2.6.bb => php_8.2.8.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.2.6.bb b/meta-oe/recipes-devtools/php/php_8.2.8.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.2.6.bb
rename to meta-oe/recipes-devtools/php/php_8.2.8.bb
index 54c40392d..233ded25d 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.6.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.8.bb
@@ -33,7 +33,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "44a70c52f537662c10d91eedbf51fd765c9961be6ba2508ed63bf7a26cdd3100"
+SRC_URI[sha256sum] = "995ed4009c7917c962d31837a1a3658f36d4af4f357b673c97ffdbe6403f8517"
 
 CVE_CHECK_IGNORE += "\
     CVE-2007-2728 \
-- 
2.25.1


