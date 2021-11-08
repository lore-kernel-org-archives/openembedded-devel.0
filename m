Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20D0C433FE
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 10:42:45 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.43282.1636368164409048455
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
	id 1mk26o-0005f5-VD; Mon, 08 Nov 2021 12:42:39 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-imageio: Upgrade 2.10.1 -> 2.10.3
Date: Mon,  8 Nov 2021 12:42:32 +0200
Message-Id: <20211108104235.24727-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211108104235.24727-1-leon.anavi@konsulko.com>
References: <20211108104235.24727-1-leon.anavi@konsulko.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/93869

Upgrade to release 2.10.3:

- Fix file extension bug when filename contains '#'
- Allow devices above in ffmpeg

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.10.1.bb => python3-imageio_2.10.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.10.1.bb => python3-imageio_2.10.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.10.1.bb b/meta-python/recipes-devtools/python/python3-imageio_2.10.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.10.1.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.10.3.bb
index ea9ed18691..16d815131a 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.10.3.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
 
 
-SRC_URI[sha256sum] = "1fbf909bac3f07faabd05a3f71b3c49428709c3c55f43770a3f76e0eb1b525d1"
+SRC_URI[sha256sum] = "469c59fe71c81cdc41c84f842d62dd2739a08fac8cb85f5a518a92a6227e2ed6"
 
 inherit pypi setuptools3
 
-- 
2.17.1


