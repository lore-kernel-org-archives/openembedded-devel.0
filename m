Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC03CA0FE2
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 03:14:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12642.1693538070687079299
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Aug 2023 20:14:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F3nUHzYq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=760894fc2b=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38131g26004956
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Sep 2023 03:14:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=ySHAX
	qZjEMoet9wssrWRdHxFgPGQLRsrOrk+n9x2Byw=; b=F3nUHzYq/SVBrU1n6gDed
	3LjG9hOMLpEQ2C075HTGzm94gkQaNDSjqsrSp2hHQHo4HLBiyH3U6MkrFrEuqUOc
	wpy+flSRZBWYBPfRnFgK/Q+GcFvxYUDDDMFJ1jOCvlbUrFn+hFHKT9+Ewv66zWE5
	XfL/HrMFKTFzQab6YXQpi1ddWgy+IFqyTkyuJgVmWghGOsMQLwwzA+DQwBVVeTBO
	Drup7QYcH09tOmwBMy4ucx8p5hn3S4JAxpGkBkfnw8rcYhjkUohDjaFWjg61LBr+
	gtmJcRM3iBTDVQFpUCBT3is3KJOQPaZqgb3RVwIRrOlueyU25HHcP3FFsgexmrfb
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq6kwnh17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 01 Sep 2023 03:14:29 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 20:14:28 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 20:14:27 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] libmcrypt: fix multilib conflict
Date: Fri, 1 Sep 2023 11:14:24 +0800
Message-ID: <20230901031424.1443331-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0hNEDkvjLjhaY7Ajin7kDBerRUB2imos
X-Proofpoint-ORIG-GUID: 0hNEDkvjLjhaY7Ajin7kDBerRUB2imos
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_01,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=781 priorityscore=1501 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309010028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Sep 2023 03:14:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104687

From: Kai Kang <kai.kang@windriver.com>

It fails to install libmcrypt-dev and lib32-libmcrypt-dev at same time:

Error: Transaction test error:
  file /usr/bin/libmcrypt-config conflicts between attempted installs of
  libmcrypt-dev-2.5.8-r0.core2_64 and lib32-libmcrypt-dev-2.5.8-r0.i586

Use MULTILIB_SCRIPTS from multilib_script.bbclass to handle them.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
index a3d09c7cb..cfa056d71 100644
--- a/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
+++ b/meta-oe/recipes-crypto/libmcrypt/libmcrypt_2.5.8.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "e4eb6c074bbab168ac47b947c195ff8cef9d51a211cdd18ca9c9ef34d2
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/mcrypt/files/Libmcrypt/"
 UPSTREAM_CHECK_REGEX = "Libmcrypt/(?P<pver>\d+(\.\d+)+)/"
 
-inherit autotools-brokensep gettext binconfig
+inherit autotools-brokensep gettext binconfig multilib_script
 
 CFLAGS += "-Wno-error=implicit-int"
 
@@ -28,3 +28,5 @@ do_configure() {
 }
 
 CLEANBROKEN = "1"
+
+MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/libmcrypt-config"
-- 
2.34.1


