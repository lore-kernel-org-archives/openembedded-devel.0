Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327CEC5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 09:32:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.18040.1709890357582353390
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Mar 2024 01:32:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Pq19EH1P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3797c483d2=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4284P1v6014108
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 Mar 2024 09:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=9bZGa
	rjYjEntl/ts3GK/KiuYzg7DKZYHde7BrYXBBvs=; b=Pq19EH1PiPJqdfoGCnlap
	9JhyfO/gPg6WLtwG6PPJLeWvTOCvFdZGmOZ9O/+4688NJokdkM0QUBkfUI7+f541
	zf8Bkp8j94a3rDwzJlhza8+7Zs4bHo97cRrUXNvfYR/L4teMGtmiDduSK9Q9EzKJ
	w2sOgP2wDYvN69xI6kAgNxbmO1u4GZKJAAW848VdmBYcPXVZbBMvQbu8XwHTEALj
	YZlazwOGmNv9QiGFfFLJwx8bgMU5DilUPph9ztTfrj5RIK7Bo8TuZqa3f8gxOVGE
	ex4d4JR4vPt7mTQESMRT6Uql59ReOnhBIdrGjuZlxzLOQpDcaj0bTlRYL5b5R+/H
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wku36e6x3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 09:32:36 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 01:32:35 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 01:32:35 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/1] gnulib: 2018-12-18 -> 202401
Date: Fri, 8 Mar 2024 01:32:35 -0800
Message-ID: <20240308093235.1220778-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: p4RKxQLddENsC3vIAKGIzp1ypvDBemHl
X-Proofpoint-GUID: p4RKxQLddENsC3vIAKGIzp1ypvDBemHl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_06,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=886 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403080073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 09:32:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109229

From: Robert Yang <liezhi.yang@windriver.com>

Change version format to keep align with upstream branch name stable-${PV}.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../gnulib/{gnulib_2018-12-18.bb => gnulib_202401.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/gnulib/{gnulib_2018-12-18.bb => gnulib_202401.bb} (88%)

diff --git a/meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb b/meta-oe/recipes-support/gnulib/gnulib_202401.bb
similarity index 88%
rename from meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
rename to meta-oe/recipes-support/gnulib/gnulib_202401.bb
index 9e09b971c..41675d358 100644
--- a/meta-oe/recipes-support/gnulib/gnulib_2018-12-18.bb
+++ b/meta-oe/recipes-support/gnulib/gnulib_202401.bb
@@ -11,9 +11,9 @@ SECTION = "devel"
 LICENSE = "LGPL-2.0-or-later"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=56a22a6e5bcce45e2c8ac184f81412b5"
-SRCREV = "0d6e3307bbdb8df4d56043d5f373eeeffe4cbef3"
+SRCREV = "c99c8d491850dc3a6e0b8604a2729d8bc5c0eff1"
 
-SRC_URI = "git://git.savannah.gnu.org/git/gnulib.git;branch=master;protocol=https \
+SRC_URI = "git://git.savannah.gnu.org/git/gnulib.git;branch=stable-${PV};protocol=https \
 "
 
 S = "${WORKDIR}/git"
-- 
2.42.0


