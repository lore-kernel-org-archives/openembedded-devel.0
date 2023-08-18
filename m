Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F19C7113E
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 12:31:12 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10135.1692361866190283755
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Aug 2023 05:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=o44BGxT6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7594e7d5ba=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37IBH5PI028687
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 12:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=pwc9b
	WNhvI7S5xhCf5KtKQLFbGRreb1KklAdBwzVaEo=; b=o44BGxT6IZ1uuG+7WnXpg
	h+K+g8u7zVBZ2ZndUdiEIQpdNyGEAq5b4onYWHcOny2ImdnDCZqOr/KbmApI6rGt
	7JXk4mey3Gz0GjzFsgDKe7QZicJG54tkV06forLqjQFPpqqfBXETviEN08mA4b0c
	Xo7uItJ2mwFphTikBqRd80xlpP7v6/GQhzHHlBr+ks+o/jqjUTt05EtPyrYui6Jo
	JUePIE6gc9FwRQvMzKIXjnC0tORGzUacNqAOzxA1BUN4D3Cp1CdMoYWr56PU/0jd
	fdXB+FF7uhL85X6gKGCY43JIX5IUz+ZbJMoKXBj1rwv2evueDWr/oDy17o0aUWDe
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3se125ww8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 12:31:05 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 18 Aug 2023 05:31:02 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH 1/1] poppler: fix CVE-2023-34872
Date: Fri, 18 Aug 2023 12:30:44 +0000
Message-ID: <20230818123044.2203564-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.35.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: nk7RlNVWrGcXwShN9GvMSqsTQKfgmn0H
X-Proofpoint-ORIG-GUID: nk7RlNVWrGcXwShN9GvMSqsTQKfgmn0H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_15,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=928 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2306200000 definitions=main-2308180115
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Aug 2023 12:31:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104489

From: Yogita Urade <yogita.urade@windriver.com>

A vulnerability in Outline.cc for Poppler prior to 23.06.0
allows a remote attacker to cause a Denial of Service (DoS)
(crash) via a crafted PDF file in OutlineItem::open.

Reference:
https://gitlab.freedesktop.org/poppler/poppler/-/issues/1399

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../poppler/poppler/CVE-2023-34872.patch      | 46 +++++++++++++++++++
 .../poppler/poppler_23.04.0.bb                |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch

diff --git a/meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch b/meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch
new file mode 100644
index 0000000000..cc942fad77
--- /dev/null
+++ b/meta-oe/recipes-support/poppler/poppler/CVE-2023-34872.patch
@@ -0,0 +1,46 @@
+From 591235c8b6c65a2eee88991b9ae73490fd9afdfe Mon Sep 17 00:00:00 2001
+From: Albert Astals Cid <aacid@kde.org>
+Date: Fri, 18 Aug 2023 11:36:06 +0000
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
diff --git a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
index 896176801b..f4411e1163 100644
--- a/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_23.04.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://basename-include.patch \
            file://0001-cmake-Do-not-use-isystem.patch \
            file://jpeg-stdio.patch \
+           file://CVE-2023-34872.patch \
            "
 SRC_URI[sha256sum] = "b6d893dc7dcd4138b9e9df59a13c59695e50e80dc5c2cacee0674670693951a1"
 
-- 
2.35.5


