Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4420C433EF
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 10:42:45 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.43302.1636368164408353657
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Nov 2021 02:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=36832 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mk26n-0005f5-V1; Mon, 08 Nov 2021 12:42:38 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-prettytable: Upgrade 2.3.0 -> 2.4.0
Date: Mon,  8 Nov 2021 12:42:31 +0200
Message-Id: <20211108104235.24727-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Nov 2021 10:42:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93870

Upgrade to release 2.4.0:

- Markdown: Add colons to align the rendered output
- Add rows attribute to prettytable

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-prettytable_2.3.0.bb => python3-prettytable_2.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_2.3.0.bb => python3-prettytable_2.4.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_2.3.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_2.4.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-prettytable_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_2.4.0.bb
index d3d26f213e..8f5eb42996 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_2.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9a6829fcd174d9535b46211917c7671"
 
-SRC_URI[sha256sum] = "efd6f72d453bc0513b90f5b10fb4d085b919ca0f4c5ef033bda1dd894572ba64"
+SRC_URI[sha256sum] = "18e56447f636b447096977d468849c1e2d3cfa0af8e7b5acfcf83a64790c0aca"
 
 do_install:append() {
     perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
-- 
2.17.1


