Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D483AC3DA6F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 09:35:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7216.1692869694537530381
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 02:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=f+orlJGv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=760001ddf9=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37O8cubG021085
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 09:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Cr5e+
	/cTQsC47fldIP58w5uR1W1/G6Zh9BpH3jkYKwQ=; b=f+orlJGvJU04l3c2XduqM
	R8J30THw7egJ7YMoihQUyfCqq4PQfhoj8yG3idUIgBhO11Hb9Dg8PvcrWpXdMbja
	1aPHlr0o9ezJL3qIn+sMpo4IAtiuORNHHM5y/W5Y4Kp9R7hzFfj7UYO/iqdADxxV
	d0/GlxhQv4xXNeadYzuqIaDE8sTkInqGXjYm9QMju7g6Zjrp5YiRqHjFLqEwCk1D
	qS6KZ2I5F5QB2XArIchdy/jc94H9tJqFvm45hNKWZ9dd9uzVfZN17KHHO8Tx0EAn
	vg2TX5eMZtre9OYLrvSGqjHLnBW0ToD91xhDVfBx6nsaxj05G+3JA1SpNs9dTOFh
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sn21mhmw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 09:34:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 24 Aug 2023 02:34:49 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Thu, 24 Aug 2023 02:34:49 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] gnulib: Update SRC_URI
Date: Thu, 24 Aug 2023 17:34:48 +0800
Message-ID: <20230824093448.3899614-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: H8o9-IPbJuX6Zt55vkR93BpnclGlJlEX
X-Proofpoint-GUID: H8o9-IPbJuX6Zt55vkR93BpnclGlJlEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_06,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=633
 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308240076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 09:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104588

From: Mingli Yu <mingli.yu@windriver.com>

Update the SRC_URI to fix the do_fetch warning.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb b/meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
index a27968079..9e09b971c 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
@@ -13,7 +13,7 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=56a22a6e5bcce45e2c8ac184f81412b5"
 SRCREV = "0d6e3307bbdb8df4d56043d5f373eeeffe4cbef3"
 
-SRC_URI = "git://git.savannah.gnu.org/git/gnulib.git;branch=master \
+SRC_URI = "git://git.savannah.gnu.org/git/gnulib.git;branch=master;protocol=https \
 "
 
 S = "${WORKDIR}/git"
-- 
2.25.1


