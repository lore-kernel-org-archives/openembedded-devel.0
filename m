Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CBDC433FE
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 11:35:37 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.5961.1637148934773347827
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 03:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from lan.nucleusys.com ([92.247.61.126]:57950
 helo=lootbox.konsulko.bg)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mnJDt-0006bJ-KW; Wed, 17 Nov 2021 13:35:30 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-imageio: Upgrade 2.10.3 -> 2.10.5
Date: Wed, 17 Nov 2021 13:35:25 +0200
Message-Id: <20211117113526.22305-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117113526.22305-1-leon.anavi@konsulko.com>
References: <20211117113526.22305-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 11:35:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93996

Upgrade to release 2.10.5:

- Resolve regression on imageJ TIFF hyperstacks
- Consistently handle file opening/closing

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.10.3.bb => python3-imageio_2.10.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.10.3.bb => python3-imageio_2.10.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.10.3.bb b/meta-python/recipes-devtools/python/python3-imageio_2.10.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.10.3.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.10.5.bb
index 16d815131..a724cfd83 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.10.3.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.10.5.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
 
 
-SRC_URI[sha256sum] = "469c59fe71c81cdc41c84f842d62dd2739a08fac8cb85f5a518a92a6227e2ed6"
+SRC_URI[sha256sum] = "f3f6e9a73d62f12348f098364219f4fc64462760bc07abfe16d14db0e4974845"
 
 inherit pypi setuptools3
 
-- 
2.20.1


