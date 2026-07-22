Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35268C4452D
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 06:09:52 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41950.1784700581641745678
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 23:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.51, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.51 with ESMTP; 22 Jul 2026 15:09:39 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.125 with ESMTP; 22 Jul 2026 15:09:39 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-python][PATCH 1/2] python3-aiodns: set CVE_PRODUCT and set status for CVE-2025-48945
Date: Wed, 22 Jul 2026 15:09:34 +0900
Message-ID: <20260722060935.273232-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 06:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128362

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:aiodns doesn't match how aiodns is
tracked in the CVE databases. NVD has no CPE for aiodns yet; the only
existing record (CVE-2025-48945) carries aio-libs:aiodns in its CNA
affected entry [1], so set that pair.

CVE-2025-48945 itself is a use-after-free in pycares: the GHSA lives
in the pycares repository [2] and the affected range "< 4.9.0" uses
pycares version numbers (fixed in pycares 4.9.0 [3], we ship 5.0.1).
Mark it cpe-incorrect so it doesn't get reported against aiodns.

[1] https://www.cve.org/CVERecord?id=CVE-2025-48945
[2] https://github.com/saghul/pycares/security/advisories/GHSA-5qpg-rh4j-qp35
[3] https://github.com/saghul/pycares/releases/tag/v4.9.0

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta-python/recipes-devtools/python/python3-aiodns_4.0.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-aiodns_4.0.4.bb b/meta-python/recipes-devtools/python/python3-aiodns_4.0.4.bb
index 875ec724d3..eb66cc5f34 100644
--- a/meta-python/recipes-devtools/python/python3-aiodns_4.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-aiodns_4.0.4.bb
@@ -15,4 +15,7 @@ RDEPENDS:${PN} += " \
     python3-pycares \
 "
 
+CVE_PRODUCT = "aio-libs:aiodns"
+CVE_STATUS[CVE-2025-48945] = "cpe-incorrect: this CVE is for pycares, fixed in pycares 4.9.0"
+
 BBCLASSEXTEND = "native nativesdk"

