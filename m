Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B955C001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 07:01:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.155696.1692169277318630567
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 00:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ys6NAR46;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7592dbdee9=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37G501JY020408
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 00:01:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=Vbkb5
	rwEifRNw+jpfNEJ0/vChG+wVDBAX0/GfHk/Z0A=; b=Ys6NAR46ua7GnDjCjKYW2
	6KNKr5U4Ux4ry5719sfls0oH/xE5/v0yM+wSGOusooaI6L0ESijErklIhehyUWL1
	grN9/SsgDM8taTZ99uNRuMFAdJxsywniI9bKIrZ+FPHoRL/oXOUNHcPtCgiIKFVo
	TqSzY3k9cJacZmIIt3cXrArj/oIWtNmE9tWuWyPINchyirXO1sxeAcrwTz9n6JQP
	NeZ66jgNGo5JZqUGFAD6Ur4uFtXVLfieZioCMgRECYag5l7lOqyybeyOwh0xiDqo
	I+wtM1QIFO19QTccajR7IvMdVKLzX5+BASna8krQxjhr5Yu4wri/2KcJZlXyNCHU
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se5bybe4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 00:01:16 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 16 Aug 2023 00:01:15 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Wed, 16 Aug 2023 00:01:15 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][mickledore][PATCH] mcelog: Drop unneeded autotools-brokensep
Date: Wed, 16 Aug 2023 15:01:14 +0800
Message-ID: <20230816070114.2383550-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: a6nObEwlUS5zmQScMlmbjp8nPI_09DXm
X-Proofpoint-ORIG-GUID: a6nObEwlUS5zmQScMlmbjp8nPI_09DXm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_04,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 mlxlogscore=791 lowpriorityscore=0
 adultscore=0 mlxscore=0 spamscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308160063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 07:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104414

From: Mingli Yu <mingli.yu@windriver.com>

Drop unneeded autotools-brokensep class inherit, this package has
traditional makefile build.

This change also fixes the below buildpaths issue altogether.
WARNING: mcelog-191-r0 do_package_qa: QA Issue: File /usr/sbin/.debug/mcelog in package mcelog-dbg contains reference to TMPDIR [buildpaths]

(cherry picked from commit 29e6c4928cfbfe3a00921b956938781d53563582)

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-support/mcelog/mcelog_191.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_191.bb b/meta-oe/recipes-support/mcelog/mcelog_191.bb
index e71343346..3c1c451c0 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_191.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_191.bb
@@ -18,11 +18,18 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep ptest
+inherit ptest
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
 
-do_install:append() {
+EXTRA_OEMAKE += "CFLAGS='${CFLAGS}'"
+
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
     install -d ${D}${sysconfdir}/cron.hourly
     install -m 0755 ${S}/mcelog.cron ${D}${sysconfdir}/cron.hourly/
     sed -i 's/bash/sh/' ${D}${sysconfdir}/cron.hourly/mcelog.cron
-- 
2.25.1


