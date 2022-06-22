Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38931C43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 18:44:44 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.11506.1655923481540029381
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jun 2022 11:44:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=kyGKOxT7;
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
	bh=tgd4yHlEGZO/DQJc7cpzcCGfgd4riWC8TGYCo9MYLMk=; b=kyGKOxT7o+vbFhPo1a2JIvL2pM
	agisMzVcZgMeiP6JjgpVqWFIqGk75szuY3PoM+4aHzDeylk4WAqbVnzzuc1CH6mCuflKwYU+ibB/p
	T6AB3QgfCv913y/Tq/xevrAW1hcd0hcV94tJFtX6bZaWZiinjkJ/M3aCTS/OpkzryPNpjzI+y4c9f
	TYW3hEzWCr5t0Xza9iW8I3rDjCajkO0mYM9HlnbSJEFHyYejL2ij15KCbS4F+mp+fGYOmxbVmKKmQ
	Tzvqgu3nsZf6QoYSy+w8jggWyz/ZL6Cu3A53VvXMv5IqJ6s/8FC/TCwQ0K8x/1z3b+27rARyL1OL7
	ild5L17g==;
Received: from lan.nucleusys.com ([92.247.61.126]:41906 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o45LI-000AqE-AL;
	Wed, 22 Jun 2022 21:44:42 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-humanize: Upgrade 4.1.0 -> 4.2.0
Date: Wed, 22 Jun 2022 21:44:29 +0300
Message-Id: <20220622184429.931224-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622184429.931224-1-leon.anavi@konsulko.com>
References: <20220622184429.931224-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jun 2022 18:44:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97570

Upgrade to release 4.2.0:

- Add humanize.metric() for converting big/small numbers to SI units
- Add type hints

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_4.1.0.bb => python3-humanize_4.2.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.1.0.bb => python3-humanize_4.2.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.1.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.2.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.2.0.bb
index df5a4e9d5..e85c3cb2a 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.2.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "3a119b242ec872c029d8b7bf8435a61a5798f124b244a08013aec5617302f80e"
+SRC_URI[sha256sum] = "b79797c101f274a19ed7b5f0cd3aa65e1aa379868b974692a9d3129ccc311be2"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.30.2


