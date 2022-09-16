Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC24C54EE9
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 10:38:28 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.4386.1663324698376250396
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 03:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=rAsuvRjy;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=eEDQWsnaX5JGogUjH5n5sQiR/6VXGR/+O/gVZrPEeKA=; b=rAsuvRjyGIvzzSd7QRufuKyYQ4
	OB2snSJijNk53FvgmlO7Kv5LjR3z94Txox4bPrrE9dblh9R9PIK4+ZUddoTYPcTwYD0hoHK/cfNiT
	0CamfATNlSXymABngardnT5Qni/0XnthuVaZzWKfxq+YrZo3upoMA0GCawR2q0US0MhmNny/OMl1e
	e547MOAUQl4bZvHqUI4srVnH5y71X8GL/FaN+kXB8jJ1AzLlRBqEiEZqTxC9y8nI8SmwMGhrSdJhm
	zk4N1CyVXoc8mNpwkJma6Gp3r84St6uspQSYogAcGhn6JMSdiCk+IKJFxspsxeyCE8C1ifLqqpGNZ
	Tp3aC7qA==;
Received: from lan.nucleusys.com ([92.247.61.126]:49096 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oZ8jn-0005VH-NE;
	Fri, 16 Sep 2022 13:38:16 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-traitlets: Upgrade 5.3.0 -> 5.4.0
Date: Fri, 16 Sep 2022 13:37:58 +0300
Message-Id: <20220916103800.573091-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220916103800.573091-1-leon.anavi@konsulko.com>
References: <20220916103800.573091-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Sep 2022 10:38:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98832

Upgrade to release 5.4.0:

- Fix version_info
- Make generated config files more lintable
- Fix union from string
- Cover more Union parsing scenarios
- Upgrade GitHub Actions
- Fix and refactor downstream tests
- Test only the server part of notebook
- Add security.md, and tidelift bage

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-traitlets_5.3.0.bb => python3-traitlets_5.4.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.3.0.bb => python3-traitlets_5.4.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.3.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.4.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.3.0.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.4.0.bb
index 7c8186707..84f9727dd 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.4.0.bb
@@ -4,7 +4,7 @@ AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=9c125dfc5ff5364d40b5f56f02cd9de3"
 
-SRC_URI[sha256sum] = "0bb9f1f9f017aa8ec187d8b1b2a7a6626a2a1d877116baba52a129bfa124f8e2"
+SRC_URI[sha256sum] = "3f2c4e435e271592fe4390f1746ea56836e3a080f84e7833f0f801d9613fec39"
 
 inherit pypi python_hatchling
 
-- 
2.30.2


