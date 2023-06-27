Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5E9EB64DC
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 11:32:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10687.1687865548205386054
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 04:32:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=aeFgLV+G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5542be04f9=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35R6PkTp023000
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 04:32:27 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=hlUQg
	T7EI82vKelUISMkwC7+Dr9rzooGiQ0+HqZnd8E=; b=aeFgLV+GeK5fFJn6svew+
	FeE0fZ6NrUpgKbCfZK31ixhh0emMWagNbFaHr8jpJwj8u4l1Q18MnVHnZsA7rpR0
	GZO93/xZyP5BTUBFj4mxa/TJJ9FRQyG6aJULQcD4djiHid+ioqtDXN+yWk5E61Qd
	FLVHje7eH0epNFMQ1RM8coCyxOnOqWQ9J7SXNkZO+40vr/E0qTkCLWfyi2IRYLmp
	DAi4IOHpS96IndafP7My+5O6Fz4R+NknSdwC3rIuZpFZwHURthGIq1zQRhHrGchA
	YZzV9Q+7UfCkiN/Po4EavFJnglVr12oHNT/NlCMhp466BmhAiMMQqN+JXU3hayIG
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rdurxtksq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 04:32:27 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 04:32:26 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 04:32:25 -0700
From: Soumya <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>, Soumya <soumya.sambu@windriver.com>
Subject: [meta-oe][kirkstone][PATCH 1/1] opensc: Fix CVE-2023-2977
Date: Tue, 27 Jun 2023 11:32:21 +0000
Message-ID: <20230627113221.1515349-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NEV_kqII39HdJs6DGSmuBY0bbgxqRLiU
X-Proofpoint-GUID: NEV_kqII39HdJs6DGSmuBY0bbgxqRLiU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_07,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 mlxlogscore=903 lowpriorityscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306270106
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 11:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103617

A vulnerbility was found in OpenSC. This security flaw cause a buffer overrun
vulnerability in pkcs15 cardos_have_verifyrc_package. The attacker can supply
a smart card package with malformed ASN1 context. The cardos_have_verifyrc_package
function scans the ASN1 buffer for 2 tags, where remaining length is wrongly
caculated due to moved starting pointer. This leads to possible heap-based buffer
oob read. In cases where ASAN is enabled while compiling this causes a crash.
Further info leak or more damage is possible.

Signed-off-by: Soumya <soumya.sambu@windriver.com>
---
 .../opensc/files/CVE-2023-2977.patch          | 53 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.22.0.bb   |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch b/meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch
new file mode 100644
index 0000000000..6a635a7ce6
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch
@@ -0,0 +1,53 @@
+commit 81944d1529202bd28359bede57c0a15deb65ba8a
+Author: fullwaywang <fullwaywang@tencent.com>
+Date:   Mon May 29 10:38:48 2023 +0800
+Subject: [PATCH] pkcs15init: correct left length calculation to fix buffer overrun bug.
+
+    Fixes #2785
+
+CVE: CVE-2023-2977
+
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2787/commits/3bf3ab2f9091f984cda6dd910654ccbbe3f06a40]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+
+diff --git a/src/pkcs15init/pkcs15-cardos.c b/src/pkcs15init/pkcs15-cardos.c
+index 9715cf39..f41f73c3 100644
+--- a/src/pkcs15init/pkcs15-cardos.c
++++ b/src/pkcs15init/pkcs15-cardos.c
+@@ -872,7 +872,7 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
+	sc_apdu_t apdu;
+         u8        rbuf[SC_MAX_APDU_BUFFER_SIZE];
+         int       r;
+-	const u8  *p = rbuf, *q;
++	const u8  *p = rbuf, *q, *pp;
+	size_t    len, tlen = 0, ilen = 0;
+
+	sc_format_apdu(card, &apdu, SC_APDU_CASE_2_SHORT, 0xca, 0x01, 0x88);
+@@ -888,13 +888,13 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
+		return 0;
+
+	while (len != 0) {
+-		p = sc_asn1_find_tag(card->ctx, p, len, 0xe1, &tlen);
+-		if (p == NULL)
++		pp = sc_asn1_find_tag(card->ctx, p, len, 0xe1, &tlen);
++		if (pp == NULL)
+			return 0;
+		if (card->type == SC_CARD_TYPE_CARDOS_M4_3)	{
+			/* the verifyRC package on CardOS 4.3B use Manufacturer ID 0x01	*/
+			/* and Package Number 0x07					*/
+-			q = sc_asn1_find_tag(card->ctx, p, tlen, 0x01, &ilen);
++			q = sc_asn1_find_tag(card->ctx, pp, tlen, 0x01, &ilen);
+			if (q == NULL || ilen != 4)
+				return 0;
+			if (q[0] == 0x07)
+@@ -902,7 +902,7 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
+		} else if (card->type == SC_CARD_TYPE_CARDOS_M4_4)	{
+			/* the verifyRC package on CardOS 4.4 use Manufacturer ID 0x03	*/
+			/* and Package Number 0x02					*/
+-			q = sc_asn1_find_tag(card->ctx, p, tlen, 0x03, &ilen);
++			q = sc_asn1_find_tag(card->ctx, pp, tlen, 0x03, &ilen);
+			if (q == NULL || ilen != 4)
+				return 0;
+			if (q[0] == 0x02)
diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
index f8b4af0c4f..4590b85fa4 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cb8aedd3bced19bd8026d96a8b6876d7"
 #v0.21.0
 SRCREV = "c902e1992195e00ada12d71beb1029287cd72037"
 SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
+           file://CVE-2023-2977.patch \
           "
 DEPENDS = "virtual/libiconv openssl"
 
-- 
2.40.0


