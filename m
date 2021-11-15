Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C5CC433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 13:10:34 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.21882.1636981833250833084
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 05:10:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from lan.nucleusys.com ([92.247.61.126]:55526
 helo=lootbox.konsulko.bg)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mmbkg-0005eR-DZ; Mon, 15 Nov 2021 15:10:27 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-aenum: Upgrade 3.1.3 -> 3.1.5
Date: Mon, 15 Nov 2021 15:10:19 +0200
Message-Id: <20211115131023.1575-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Nov 2021 13:10:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93946

Upgrade to release 3.1.5:

- fix extend_enum()
- tests: move enum setting from body to header

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aenum_3.1.3.bb => python3-aenum_3.1.5.bb}      | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_3.1.3.bb => python3-aenum_3.1.5.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_3.1.3.bb b/meta-python/recipes-devtools/python/python3-aenum_3.1.5.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-aenum_3.1.3.bb
rename to meta-python/recipes-devtools/python/python3-aenum_3.1.5.bb
index ad7d36319..4da70b86d 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_3.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_3.1.5.bb
@@ -3,8 +3,12 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
 
-SRC_URI[sha256sum] = "1d494e4d3b3e3e95389aee420203d945776d2430ee9a3d4f162e267b3a7ec3a6"
+SRC_URI[sha256sum] = "2ebad8590b6a0183c0d9893523b458edce987ae4533339c5ac185cfac32daf1a"
 
 inherit pypi setuptools3
 
+RDEPENDS:${PN} += "\
+	${PYTHON_PN}-pprint \
+"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


