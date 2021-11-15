Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1B7C4332F
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 13:10:35 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.22055.1636981834171412521
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 05:10:34 -0800
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
	id 1mmbkj-0005eR-SO; Mon, 15 Nov 2021 15:10:30 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-colorlog: Upgrade 6.5.0 -> 6.6.0
Date: Mon, 15 Nov 2021 15:10:22 +0200
Message-Id: <20211115131023.1575-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211115131023.1575-1-leon.anavi@konsulko.com>
References: <20211115131023.1575-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Nov 2021 13:10:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93949

Upgrade to release 6.6.0:

- Add a force_color option to colorlog.formatter.ColoredFormatter
- Support the FORCE_COLOR environment variable

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-colorlog_6.5.0.bb => python3-colorlog_6.6.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_6.5.0.bb => python3-colorlog_6.6.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_6.5.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_6.6.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-colorlog_6.5.0.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_6.6.0.bb
index bd9008330..2f8a0e5ca 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_6.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_6.6.0.bb
@@ -7,4 +7,4 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "colorlog"
 
-SRC_URI[sha256sum] = "cf62a8e389d5660d0d22be17937b25b9abef9497ddc940197d1773aa1f604339"
+SRC_URI[sha256sum] = "344f73204009e4c83c5b6beb00b3c45dc70fcdae3c80db919e0a4171d006fde8"
-- 
2.20.1


