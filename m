Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F70C05052
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 10:37:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8444.1692355021292993742
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Aug 2023 03:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OSQw0wck;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7594e7d5ba=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37IAJPHS017813
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 10:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=9hegd
	LDN61EWDS6siuKa5hiX531qtdHr738oUKnd7ws=; b=OSQw0wckXp+ETAvF7UxSA
	B+jnPwk40Z7dZpEf/XnAPpx957LlqMqvD7DPX3dd6jg/zCMkRpaHE8WuoaF53Evr
	IOFS1z5wQQUG9goK/t43AGazJljnY5ScmzW5bNK5bOtC0I0oqHuXewjGxKnRP+A9
	8fnrYgKEOIS7JSNHozu05um0YREtCgjqcKMQaIQn9SL5xywM2SPEqIODcCfA5QOh
	4IiRfJpnB2X9Z2vUtCD6ScgGmaY6d/oNKE928iXCTRnFEhL7UoJmx+1IbRFLHdVK
	oE7Ng62d/XSHVXPMn2ywgUjTMyLYEfDkD9SDlmEGU6RmGvIrxCvOXHJA/qOznmIY
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se125wtkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 10:37:00 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 03:36:57 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] poppler: fix CVE-2023-34872
Date: Fri, 18 Aug 2023 10:36:39 +0000
Message-ID: <20230818103639.4016027-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: Way8oxFw5tErgpMF6ydOLMV9HWw9Ebfa
X-Proofpoint-ORIG-GUID: Way8oxFw5tErgpMF6ydOLMV9HWw9Ebfa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_12,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=845 spamscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308180099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 10:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104482

From: Yogita Urade <yogita.urade@windriver.com>

A vulnerability in Outline.cc for Poppler prior to 23.06.0
allows a remote attacker to cause a Denial of Service (DoS)
(crash) via a crafted PDF file in OutlineItem::open.

Reference:
https://gitlab.freedesktop.org/poppler/poppler/-/issues/1399

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../poppler/poppler/CVE-2023-34872.patch      | 46 +++++++++++++++++++
 .../poppler/poppler_22.04.0.bb                |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch
new file mode 100644
index 0000000000..7fdc293aac
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch
@@ -0,0 +1,46 @@
+From 591235c8b6c65a2eee88991b9ae73490fd9afdfe Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Fri, 18 Aug 2023 08:22:06 +0000
+Subject: [PATCH] OutlineItem::open: Fix crash on malformed files
+
+Fixes #1399
+
+CVE: CVE-2023-34872
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/poppler/poppler/-/commit/591235c8b6c65a2eee88991b9ae73490fd9afdfe]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ poppler/Outline.cc | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/poppler/Outline.cc b/poppler/Outline.cc
+index cbb6cb4..4c68be9 100644
+--- a/poppler/Outline.cc
++++ b/poppler/Outline.cc
+@@ -14,7 +14,7 @@
+ // under GPL version 2 or later
+ //
+ // Copyright (C) 2005 Marco Pesenti Gritti <mpg@redhat.com>
+-// Copyright (C) 2008, 2016-2019, 2021 Albert Astals Cid <aacid@kde.org>
++// Copyright (C) 2008, 2016-2019, 2021, 2023 Albert Astals Cid <aacid@kde.org>
+ // Copyright (C) 2009 Nick Jones <nick.jones@network-box.com>
+ // Copyright (C) 2016 Jason Crain <jason@aquaticape.us>
+ // Copyright (C) 2017 Adrian Johnson <ajohnson@redneon.com>
+@@ -483,8 +483,12 @@ void OutlineItem::open()
+ {
+     if (!kids) {
+         Object itemDict = xref->fetch(ref);
+-        const Object &firstRef = itemDict.dictLookupNF("First");
+-        kids = readItemList(this, &firstRef, xref, doc);
++        if (itemDict.isDict()) {
++            const Object &firstRef = itemDict.dictLookupNF("First");
++            kids = readItemList(this, &firstRef, xref, doc);
++        } else {
++            kids = new std::vector<OutlineItem *>();
++        }
+     }
+ }
+
+--
+2.35.5
diff --git a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
index 816c9f1608..04106f11aa 100644
--- a/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_22.04.0.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            file://0001-JBIG2Stream-Fix-crash-on-broken-file.patch \
+	   file://CVE-2023-34872.patch \
            "
 SRC_URI[sha256sum] = "813fb4b90e7bda63df53205c548602bae728887a60f4048aae4dbd9b1927deff"
 
-- 
2.35.5


