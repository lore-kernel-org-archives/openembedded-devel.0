Return-Path: <yue.tao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7351C7618A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 02:59:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5837.1679281149908393409
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Mar 2023 19:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=N59bXCdm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=244390f4a0=yue.tao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32K2LjF5026264
	for <openembedded-devel@lists.openembedded.org>; Sun, 19 Mar 2023 19:59:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=mRiSFEz7+1VsH68LPJnO/rgmXJOxjmRXouc6bKdatQg=;
 b=N59bXCdmzwqv6lhJEQtwT0MP7iyKL3iPwJJoM0IcRrRtzbJjMIgz34mgAqRQMA/38I/l
 TpyJ109wQB9c8X7rhEP0wmqEwkyOsvLzEFblP3x7v/O0UFvMclPWs9BTwDPAfG7cP41U
 n0GofpHlYMA2xGNVSL+dVPgBXBJ26iQferq3C1YbgrFORPZAzpN9uHD4auK3Sabd6JG7
 1A1aAETZKkVTk9EurtNEiSOz7Wd8wIg1iX7BFuiE2BW2mCgh/qAodocy5u38vaXDr2nf
 L2oHUzN2U73BLlYvFndy4nBPzJK5u5XS/uFq4euF3IS4rZPetRBx09R3iVlw6wOTJB2a /g== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pd8k4s9hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 19 Mar 2023 19:59:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Sun, 19 Mar 2023 19:59:08 -0700
Received: from pek-ytao-d1.wrs.com (128.224.34.179) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Sun, 19 Mar 2023 19:59:08 -0700
From: Yue Tao <yue.tao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <yue.tao@windriver.com>
Subject: [meta-python][PATCH] nghttp2: never build python bindings
Date: Mon, 20 Mar 2023 10:59:06 +0800
Message-ID: <20230320025906.421-1-yue.tao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ksOaYWU8gkk8QCZiOqyGAvJN_p6Q4Re0
X-Proofpoint-GUID: ksOaYWU8gkk8QCZiOqyGAvJN_p6Q4Re0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-19_14,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=826
 spamscore=0 clxscore=1011 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200025
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 02:59:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101599

From: Joe Slater <joe.slater@windriver.com>

This has already been done for oe-core/master.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/nghttp2/nghttp2_1.47.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
index 58ce08084d..becacd4502 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.47.0.bb
@@ -19,6 +19,10 @@ PACKAGECONFIG[manpages] = ""
 # first place
 EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF"
 
+# Do not let configure try to decide this.
+#
+EXTRA_OECMAKE += "-DENABLE_PYTHON_BINDINGS=OFF"
+
 PACKAGES =+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
 
 RDEPENDS:${PN} = "${PN}-client (>= ${PV}) ${PN}-proxy (>= ${PV}) ${PN}-server (>= ${PV})"
-- 
2.17.1


