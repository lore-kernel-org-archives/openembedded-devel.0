Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5148C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 16:54:35 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.858.1636563273941741863
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Nov 2021 08:54:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from lan.nucleusys.com ([92.247.61.126]:48776
 helo=lootbox.konsulko.bg)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mkqrh-0004Pp-Hu; Wed, 10 Nov 2021 18:54:27 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-configparser: Upgrade 5.0.2 -> 5.1.0
Date: Wed, 10 Nov 2021 18:54:21 +0200
Message-Id: <20211110165421.20269-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Nov 2021 16:54:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93906

Upgrade to release 5.1.0:

- Synced with Python 3.10.0.
- Packaging refresh.
- Tests now run on Python 3.10.
- Modernized code relying on Python 3.6.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-configparser_5.0.2.bb => python3-configparser_5.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-configparser_5.0.2.bb => python3-configparser_5.1.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-configparser_5.0.2.bb b/meta-python/recipes-devtools/python/python3-configparser_5.1.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-configparser_5.0.2.bb
rename to meta-python/recipes-devtools/python/python3-configparser_5.1.0.bb
index 87cdd09f7..de9fe2be1 100644
--- a/meta-python/recipes-devtools/python/python3-configparser_5.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-configparser_5.1.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=10;endline=10;md5=23f9ad5cad3d8cc0336e2a5d8a87e1fa"
 
-SRC_URI[sha256sum] = "85d5de102cfe6d14a5172676f09d19c465ce63d6019cf0a4ef13385fc535e828"
+SRC_URI[sha256sum] = "202b9679a809b703720afa2eacaad4c6c2d63196070e5d9edc953c0489dfd536"
 
 DEPENDS += "${PYTHON_PN}-setuptools-scm-native ${PYTHON_PN}-toml-native"
 inherit pypi setuptools3
-- 
2.20.1


