Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD70EC6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 16:19:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.956.1679674735976653397
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Mar 2023 09:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mJcS8HIg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24473a05ba=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32ODs75j024089
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 16:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=o3zZ3Z04Jt0ypX9bN3HLGVukha4WCQaaLoTGY3NbqYY=;
 b=mJcS8HIgeE3JWmO36MX6IF4eDsNXhM8SrCce5fJ5PNLAaRNYacAHiqw6lBlAGifHC9r7
 k79dPMnP3A0kRzQMvJT/f+8aW0T5/QffhVrm9cmBU98nsLdzRmAXurlidsFAJL0y2M8R
 4k1z8EUgMuQDxqgenNuIyvQSfFXr124hYu1ym+YP5cUtrfucPqSnSbgdxRlzeS0UlJ1Z
 87H4Daj4Yvda8LcgrHqgghbchECJp5W2tVhdmlz/AA6RBExhNanEkuXjWDbGpjpVKRqS
 PbNiUlJkBxXFUyOtd9bWK/eBCI6FhWs2tJvByXF0U0YFVyqv4V9ggM5/t0Kekzv7CUC5 sw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pgxhw0v4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 16:18:54 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Fri, 24 Mar 2023 09:18:52 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>, <archana.polampalli@windriver.com>
Subject: [oe][meta-oe][PATCH 1/1] Nodejs: add missing run_ptest script
Date: Fri, 24 Mar 2023 16:18:37 +0000
Message-ID: <20230324161837.2595992-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: X91JAIGzfuLyirWWSQxEyov7M_HWlWuA
X-Proofpoint-ORIG-GUID: X91JAIGzfuLyirWWSQxEyov7M_HWlWuA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_10,2023-03-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=799 mlxscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 clxscore=1011 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303240129
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 16:19:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101709

ptest-runner is not available for Nodejs on target hence added run-ptest script

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs/run-ptest  | 3 +++
 meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb | 1 +
 2 files changed, 4 insertions(+)
 create mode 100755 meta-oe/recipes-devtools/nodejs/nodejs/run-ptest

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/run-ptest b/meta-oe/recipes-devtools/nodejs/nodejs/run-ptest
new file mode 100755
index 000000000..07a8f2a99
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+./cctest
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb b/meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb
index 7361f4039..02af607e7 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.14.2.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://system-c-ares.patch \
            file://0001-liftoff-Correct-function-signatures.patch \
            file://0001-mips-Use-32bit-cast-for-operand-on-mips32.patch \
+           file://run-ptest \
            "
 
 SRC_URI:append:class-target = " \
-- 
2.34.1


