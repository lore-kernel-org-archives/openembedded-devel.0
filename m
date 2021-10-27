Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B548DC4332F
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 10:34:10 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.9917.1635330849053196444
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 03:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52436 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mfgFx-0005gm-G3; Wed, 27 Oct 2021 13:34:05 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-traitlets: Upgrade 5.1.0 -> 5.1.1
Date: Wed, 27 Oct 2021 13:33:58 +0300
Message-Id: <20211027103358.31062-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211027103358.31062-1-leon.anavi@konsulko.com>
References: <20211027103358.31062-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 10:34:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93628

Upgrade to release 5.1.1:

- Fixes compatibility issues with Python 3.10 (rc2).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-traitlets_5.1.0.bb => python3-traitlets_5.1.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.1.0.bb => python3-traitlets_5.1.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.1.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.1.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.1.1.bb
index 120604a8b..bfed02d6f 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.1.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46"
 
 PYPI_PACKAGE = "traitlets"
 
-SRC_URI[sha256sum] = "bd382d7ea181fbbcce157c133db9a829ce06edffe097bcf3ab945b435452b46d"
+SRC_URI[sha256sum] = "059f456c5a7c1c82b98c2e8c799f39c9b8128f6d0d46941ee118daace9eb70c7"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-ipython-genutils \
-- 
2.17.1


