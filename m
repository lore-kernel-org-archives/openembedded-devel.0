Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C255C64EC3
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 23:08:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9732.1675206535314098001
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 15:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OS/rESlm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1395f88de3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30VLrIGL024236
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 23:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=dlYeCm+5IKnL9MG9rpvksH4UyxNH/NBXCDY862Y3dZA=;
 b=OS/rESlm/09CQNuVi6BMDw6IE9r2o+hkn9cCl2vt4bVjxkOl5DS0yPRs5ZruMFoiL/Ro
 i3kRgYtWu6nYZDyFfx/2l5AmO/64omqBcZaVBJdRU6GVUbjNRj7CYmxVKjvYp9HTkHWl
 WJVkDJjKGz0xFRi8WXXnO6drUfkERt8bJcwJQnMqz2heXUdmJ8WuCRmqwgaih7fIBpPc
 mSIfclUdwX3d501mA973+/3j3EYNApDXLwu6B8dx33HEk4NeZQQYHxDh6Xf8nELoX/xk
 jggkUrUCvqFXT4nzigCzhbvRW7EFtUwyL9WzEfw6tKG0NobljmyOVmeEOV7EBZXQHOWQ 5g== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ncrx3bv5a-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 23:08:54 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Tue, 31 Jan 2023 15:08:52 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Tue, 31 Jan 2023 15:08:52 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][kirkstone][PATCH 6/6] python3-pillow: Add distutils, unixadmin for ptest
Date: Tue, 31 Jan 2023 15:08:51 -0800
Message-ID: <20230131230851.2785067-6-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
References: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: aGzXhwkKheqQVIXtrSRAAnufN7YJLPVz
X-Proofpoint-ORIG-GUID: aGzXhwkKheqQVIXtrSRAAnufN7YJLPVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 malwarescore=0 clxscore=1015 mlxlogscore=856 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310199
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 23:08:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100895

ptest results:
   ====== 3600 passed, 324 skipped, 2 xfailed, 1 xpassed in 74.41s (0:01:14) ======
for qemux86-64 with 2 GB RAM which is the same as seen on master.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
index 68c81029c..5a466778c 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
@@ -38,11 +38,13 @@ RDEPENDS:${PN}-ptest += " \
     jpeg-tools \
     libwebp \
     ${PYTHON_PN}-core \
+    ${PYTHON_PN}-distutils \
     ${PYTHON_PN}-image \
     ${PYTHON_PN}-mmap \
     ${PYTHON_PN}-pytest \
     ${PYTHON_PN}-pytest-timeout \
     ${PYTHON_PN}-resource \
+    ${PYTHON_PN}-unixadmin\
     tk \
 "
 
-- 
2.39.0


