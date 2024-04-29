Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48773C04FFE
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 08:54:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15924.1714380847416147728
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Apr 2024 01:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O7+fsmAJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=584906f8e5=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43T5w250012196
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 08:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=9yB6x
	9r3xsxxdYXb3951UNtPsjCX/LDW1tQOhPpbO7A=; b=O7+fsmAJ5QnbKsQCZEHvn
	7hjEOOAMMCf6cGB1UD/AHz6hSUORZgr+B/16EjkP1Ew/8vS2JqQ7P3NG+rL/0KT/
	DoQHHK1WSaHjZcvEXj0/D6HSvrhSgmxjOelg3Uv/q0l8Qygu7u2rWNFyrO1Oxc+a
	sSi5Q9tGngUK/6Y9FrZaTdhSFxpzelvbwnCsu6FtXKe5JgFBmSsQ7pgTdB+EkxN8
	gqPZwUd3+BEHZBB7JOBsic+sqd2AlLr7tCt9YFvT0fAT1eeNYUj8mh21/63Am5ge
	g6c7A55SzEhiZbaulDRXWHkp2Bkn0E8Hi6zpG9r+XKS6nZ5n9Pe69RgmIyZFYfKM
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xrpjx9jdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 08:54:06 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Mon, 29 Apr 2024 01:54:05 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.37 via Frontend Transport; Mon, 29 Apr 2024 01:54:04 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH] msgraph: Add opengl to REQUIRED_DISTRO_FEATURES
Date: Mon, 29 Apr 2024 16:54:03 +0800
Message-ID: <20240429085403.1279175-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: _JM6zZa_I8UbsqaIg-kdgLwek4Z7krp7
X-Proofpoint-GUID: _JM6zZa_I8UbsqaIg-kdgLwek4Z7krp7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_06,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=965
 clxscore=1011 mlxscore=0 spamscore=0 impostorscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404290055
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Apr 2024 08:54:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110167

From: Mingli Yu <mingli.yu@windriver.com>

Fixes the below yocto compliance issue:
  ERROR: Nothing PROVIDES 'rest' (but /build/layers/meta-openembedded/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb DEPENDS on or otherwise requires it)
  rest was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'msgraph', 'rest']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb b/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb
index 4c11a8d13..9b4a8a035 100644
--- a/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb
+++ b/meta-gnome/recipes-gnome/msgraph/msgraph_0.2.1.bb
@@ -2,7 +2,8 @@ SUMMARY = "libmsgraph is a GLib-based library for accessing online serive APIs u
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
 
-inherit gnomebase gobject-introspection gi-docgen
+inherit gnomebase gobject-introspection gi-docgen features_check
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI[archive.sha256sum] = "e0e59eaa8ae3e0a48ec0a6c2fed0470856a709248e9212b6a1d037de5792ecbb"
 
-- 
2.25.1


