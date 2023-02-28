Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79999C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 05:20:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16934.1677561603678341495
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 21:20:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=U96rwhCM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1423f9b672=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31S5K3xp023106
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 21:20:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=/6E+MpR9d/DB8QFPjp3MbhdxSxBOLHoeEf4wPu0IoTw=;
 b=U96rwhCML1GgKLSbpGyz5ZwWHipxyw0k6pP8Atidj+XwgZGC5VmPvPMb33pA+CodOqy2
 1kBWADMLOcgUy7Fhdu4wRDAVWpRsIKwwmGhs6FZiCT2WOzFdRyYfRpOFk3BswE64xW/n
 aLK2NBmcIGGFgfmriH7wHDfnC7WTXcOylHZdYewWbMTgm4CLSTRfxNuis9h9Swtq6Bu6
 LKhLAQmzOnRNmDRJOyomB/X6BSKcwm3q5jkAVIWqbYrmvJ9l3aH4BPCgP+wRQRkphLHn
 Gb0LFQJR7tq7UkO/MCq+BN0xdG5F56gpMalyuXVHAOSfqCE9MvErBbnfhfupEe6kZD75 vQ== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nyjqrac9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 21:20:02 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Mon, 27 Feb 2023 21:20:00 -0800
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>, <yogita.urade@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] poppler: fix CVE-2021-30860
Date: Tue, 28 Feb 2023 05:19:43 +0000
Message-ID: <20230228051943.817330-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: _ixheEVECLdYdSgHaUH7zinpBPhntLhM
X-Proofpoint-ORIG-GUID: _ixheEVECLdYdSgHaUH7zinpBPhntLhM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-28_02,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 mlxlogscore=659 mlxscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302280037
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Feb 2023 05:20:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101308

An integer overflow was addressed with improved input validation. This
issue is fixed in Security Update 2021-005 Catalina, iOS 14.8 and iPadOS
14.8, macOS Big Sur 11.6, watchOS 7.6.2. Processing a maliciously crafted
PDF may lead to arbitrary code execution. Apple is aware of a report that
this issue may have been actively exploited.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2021-30860

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...JBIG2Stream-Fix-crash-on-broken-file.patch | 41 +++++++++++++++++++
 .../poppler/poppler_22.04.0.bb                |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/0001-JBIG2Stream-Fix-crash-on-broken-file.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/0001-JBIG2Stream-Fix-crash-on-broken-file.patch b/meta-oe/recipes-support/poppler/poppler/0001-JBIG2Stream-Fix-crash-on-broken-file.patch
new file mode 100644
index 000000000..4a8ea233c
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/0001-JBIG2Stream-Fix-crash-on-broken-file.patch
@@ -0,0 +1,41 @@
+From 27354e9d9696ee2bc063910a6c9a6b27c5184a52 Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Thu, 25 Aug 2022 00:14:22 +0200
+Subject: [PATCH] JBIG2Stream: Fix crash on broken file
+
+https://github.com/jeffssh/CVE-2021-30860
+
+Thanks to David Warren for the heads up
+
+CVE: CVE-2021-30860
+
+References:
+https://nvd.nist.gov/vuln/detail/CVE-2021-30860
+
+Upstream-Status: Backport
+[https://gitlab.freedesktop.org/poppler/poppler/-/commit/27354e9d9696ee2bc063910a6c9a6b27c5184a52]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ poppler/JBIG2Stream.cc | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/poppler/JBIG2Stream.cc b/poppler/JBIG2Stream.cc
+index 662276e5..9f70431d 100644
+--- a/poppler/JBIG2Stream.cc
++++ b/poppler/JBIG2Stream.cc
+@@ -1976,7 +1976,11 @@ void JBIG2Stream::readTextRegionSeg(unsigned int segNum, bool imm, bool lossless
+     for (i = 0; i < nRefSegs; ++i) {
+         if ((seg = findSegment(refSegs[i]))) {
+             if (seg->getType() == jbig2SegSymbolDict) {
+-                numSyms += ((JBIG2SymbolDict *)seg)->getSize();
++                const unsigned int segSize = ((JBIG2SymbolDict *)seg)->getSize();
++                if (unlikely(checkedAdd(numSyms, segSize, &numSyms))) {
++                    error(errSyntaxError, getPos(), "Too many symbols in JBIG2 text region");
++                    return;
++                }
+             } else if (seg->getType() == jbig2SegCodeTable) {
+                 codeTables.push_back(seg);
+             }
+--
+2.25.1
diff --git a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
index b7cdb4f1b..816c9f160 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
+           file://0001-JBIG2Stream-Fix-crash-on-broken-file.patch \
            "
 SRC_URI[sha256sum] = "813fb4b90e7bda63df53205c548602bae728887a60f4048aae4dbd9b1927deff"
 
-- 
2.25.1


