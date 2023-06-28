Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A621EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 07:14:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10718.1687936484102311693
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jun 2023 00:14:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kFTaNxWD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5543003f59=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35S6wXPM030736
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 07:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=rNzC8
	lIv+2uAvAXJmaO5logW693z2Na7jtqlhShqp5A=; b=kFTaNxWDSVRj73V69KpWz
	EhBuZguVdkC5ThD/7palAyLdu4RofA1FAkYVSACYwvIn0CHLeEQXlXlGK+3WN4gl
	rlwN3Y7R98XH2HM2zC0umgAzNAR1Mq/Kv9RA6yev3JmjbZcLPqZ1Lo13K+6w/MKq
	nl0nnskDB/zWX5bkIqwoS1T5te0q7+l7yZ61T1VhJtY8jU/YNTr5xvCeGtlhdYlL
	C5QlLRbuFwzjQLwHOE9lLlbnN9Y9zp0nVZM09GKbS5YHr0oVqC7FDAJ2e+ifDsCm
	IgqOBXhqjAGl7teDxpvSNfeSvyTwGQQ0oF3iLja4y+briOjj6rroWlCvK89aiIX5
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdpqb3mhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 07:14:43 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 00:14:41 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 00:14:41 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH] libtimezonemap: rename downloaded file name
Date: Wed, 28 Jun 2023 15:14:37 +0800
Message-ID: <20230628071437.4181206-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2wjJK48QbhwqsaqdsFayfSS0mc79EZW6
X-Proofpoint-GUID: 2wjJK48QbhwqsaqdsFayfSS0mc79EZW6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_04,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 mlxlogscore=797 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306280063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Jun 2023 07:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103623

From: Kai Kang <kai.kang@windriver.com>

Add parameter 'downloadfilename' to SRC_URI to keep the downloaded file
name as same as before.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
index 00d66b418..bafe7af04 100644
--- a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
+++ b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
@@ -4,7 +4,7 @@ SECTION = "devel/lib"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz"
+SRC_URI = "${DEBIAN_MIRROR}/main/libt/${BPN}/${BPN}_${PV}.orig.tar.gz;downloadfilename=${BP}.tar.gz"
 SRC_URI[sha256sum] = "0d634cc2476d8f57d1ee1864bd4f442180ae4bf040a9ae4bf73b66bbd85d7195"
 
 DEPENDS = "gtk+3 gdk-pixbuf libsoup-2.4 json-glib gnome-common-native"
-- 
2.34.1


