Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F935C433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Oct 2021 09:54:14 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.16991.1635587643180416185
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Oct 2021 02:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=40554 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mgl3g-0008JH-VY; Sat, 30 Oct 2021 12:53:53 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-qrcode: Upgrade 7.3 -> 7.3.1
Date: Sat, 30 Oct 2021 12:53:47 +0300
Message-Id: <20211030095347.28287-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Oct 2021 09:54:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93656

Upgrade to release 7.3.1:

- Improvements for embeded image

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-qrcode_7.3.bb => python3-qrcode_7.3.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-qrcode_7.3.bb => python3-qrcode_7.3.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-qrcode_7.3.bb b/meta-python/recipes-devtools/python/python3-qrcode_7.3.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-qrcode_7.3.bb
rename to meta-python/recipes-devtools/python/python3-qrcode_7.3.1.bb
index f195f4717..f6de60e1a 100644
--- a/meta-python/recipes-devtools/python/python3-qrcode_7.3.bb
+++ b/meta-python/recipes-devtools/python/python3-qrcode_7.3.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4b802d2a65df4626623c79757f486af9"
 
 PYPI_PACKAGE = "qrcode"
-SRC_URI[sha256sum] = "d72861b65e26b611609f0547f0febe58aed8ae229d6bf4e675834f40742915b3"
+SRC_URI[sha256sum] = "375a6ff240ca9bd41adc070428b5dfc1dcfbb0f2507f1ac848f6cded38956578"
 
 inherit pypi setuptools3
 
-- 
2.17.1


