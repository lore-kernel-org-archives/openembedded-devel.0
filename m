Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33877C44512
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 06:09:52 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41951.1784700581729449593
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2026 23:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo01.lge.com) (156.147.1.125)
	by 156.147.23.52 with ESMTP; 22 Jul 2026 15:09:39 +0900
X-Original-SENDERIP: 156.147.1.125
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.125 with ESMTP; 22 Jul 2026 15:09:39 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-python][PATCH 2/2] python3-h11: set CVE_PRODUCT
Date: Wed, 22 Jul 2026 15:09:35 +0900
Message-ID: <20260722060935.273232-2-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722060935.273232-1-mark.yang@lge.com>
References: <20260722060935.273232-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 06:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128363

From: "mark.yang" <mark.yang@lge.com>

The pypi class default python:h11 doesn't match how h11 is tracked
in the CVE databases. NVD has no CPE for it yet; the only existing
record (CVE-2025-43859) carries python-hyper:h11 in its CNA affected
entry [1], so set that pair.

CVE-2025-43859 (request smuggling) is fixed in 0.16.0, the version
we ship, so it resolves as not affected.

[1] https://www.cve.org/CVERecord?id=CVE-2025-43859

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 meta-python/recipes-devtools/python/python3-h11_0.16.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb b/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb
index a47e6ab61e..ed1702ff54 100644
--- a/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h11_0.16.0.bb
@@ -7,4 +7,6 @@ inherit pypi setuptools3
 
 SRC_URI[sha256sum] = "4e35b956cf45792e4caa5885e69fba00bdbc6ffafbfa020300e549b208ee5ff1"
 
+CVE_PRODUCT = "python-hyper:h11"
+
 RDEPENDS:${PN} += "python3-profile"

