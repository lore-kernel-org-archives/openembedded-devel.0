Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4CDEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:07:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7435.1687849667592531965
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cY0Xd/RY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=55427ce27d=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 35R5SNWZ026029
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 00:07:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=edsAy
	2UocU6Asm9hm03JOxDwTtwE4TOCMBoOa+id9L8=; b=cY0Xd/RYg7m1KjPY8IDBy
	J/C8OO9c19qahNVI6VD8j/U+mL+xIn8ALlbyaeF+P3pz03wjOlHeikPEvpzMxmfN
	B7LxCHCq3y4PpzaF1xowkWVcgv1TybU6wLtGt1GVxgxvXxNny9IKCel4Y5nacl+s
	afmxcoUFf7iqfjPiAY4t1pTVbNZsrXeee4Yr5wICLcAEU+IgmTqxITLS2kui/LWT
	tY/o/h/ii5ts1OyaIdkUp7T6nJ0JG9K4gP+w4Qrd6NdNlyuZkHhhdtKqOi0HXH6w
	xTReZKLnxv+YkVAOp0nJHHGY51yigt1mrHJlsc2A8EjaRJhxgjLqAE1XqtBbiR7k
	w==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3regfb1pyg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 00:07:46 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 00:07:46 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 00:07:45 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [mickledore][meta-oe][PATCH] opensc: fix CVE-2023-2977
Date: Tue, 27 Jun 2023 15:07:44 +0800
Message-ID: <20230627070744.2316965-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 1DpnKvyZ2HHqBtZM0NUIb328Qj6yC7ua
X-Proofpoint-ORIG-GUID: 1DpnKvyZ2HHqBtZM0NUIb328Qj6yC7ua
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-27_04,2023-06-26_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2305260000 definitions=main-2306270067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103594

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../opensc/files/CVE-2023-2977.patch          | 58 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.23.0.bb   |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch b/meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch
new file mode 100644
index 0000000000..b584572a91
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2023-2977.patch
@@ -0,0 +1,58 @@
+From b34e1d52faea5a4e25c5b0c12d098c1e829e2d56 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 27 Jun 2023 14:05:46 +0800
+Subject: [PATCH] pkcs15init: correct left length calculation to fix buffer
+ overrun bug.
+
+Fixes #2785
+
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/pull/2787/commits/3bf3ab2f9091f984cda6dd910654ccbbe3f06a40]
+CVE: CVE-2023-2977
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/pkcs15init/pkcs15-cardos.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/pkcs15init/pkcs15-cardos.c b/src/pkcs15init/pkcs15-cardos.c
+index a13b73f61..23dc37a5b 100644
+--- a/src/pkcs15init/pkcs15-cardos.c
++++ b/src/pkcs15init/pkcs15-cardos.c
+@@ -850,7 +850,7 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
+ 	sc_apdu_t apdu;
+         u8        rbuf[SC_MAX_APDU_BUFFER_SIZE];
+         int       r;
+-	const u8  *p = rbuf, *q;
++	const u8  *p = rbuf, *q, *pp;
+ 	size_t    len, tlen = 0, ilen = 0;
+ 
+ 	sc_format_apdu(card, &apdu, SC_APDU_CASE_2_SHORT, 0xca, 0x01, 0x88);
+@@ -866,13 +866,13 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
+ 		return 0;
+ 
+ 	while (len != 0) {
+-		p = sc_asn1_find_tag(card->ctx, p, len, 0xe1, &tlen);
+-		if (p == NULL)
++               pp = sc_asn1_find_tag(card->ctx, p, len, 0xe1, &tlen);
++               if (pp == NULL)
+ 			return 0;
+ 		if (card->type == SC_CARD_TYPE_CARDOS_M4_3)	{
+ 			/* the verifyRC package on CardOS 4.3B use Manufacturer ID 0x01	*/
+ 			/* and Package Number 0x07					*/
+-			q = sc_asn1_find_tag(card->ctx, p, tlen, 0x01, &ilen);
++			q = sc_asn1_find_tag(card->ctx, pp, tlen, 0x01, &ilen);
+ 			if (q == NULL || ilen != 4)
+ 				return 0;
+ 			if (q[0] == 0x07)
+@@ -880,7 +880,7 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
+ 		} else if (card->type == SC_CARD_TYPE_CARDOS_M4_4)	{
+ 			/* the verifyRC package on CardOS 4.4 use Manufacturer ID 0x03	*/
+ 			/* and Package Number 0x02					*/
+-			q = sc_asn1_find_tag(card->ctx, p, tlen, 0x03, &ilen);
++			q = sc_asn1_find_tag(card->ctx, pp, tlen, 0x03, &ilen);
+ 			if (q == NULL || ilen != 4)
+ 				return 0;
+ 			if (q[0] == 0x02)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-support/opensc/opensc_0.23.0.bb b/meta-oe/recipes-support/opensc/opensc_0.23.0.bb
index f68107df87..b3fc1f0458 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.23.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.23.0.bb
@@ -16,6 +16,7 @@ SRCREV = "5497519ea6b4af596628f8f8f2f904bacaa3148f"
 SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
            file://0001-pkcs11-tool-Fix-private-key-import.patch \
            file://0002-pkcs11-tool-Log-more-information-on-OpenSSL-errors.patch \
+           file://CVE-2023-2977.patch \
           "
 DEPENDS = "virtual/libiconv openssl"
 
-- 
2.25.1


