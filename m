Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14181C6FA8B
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 12:41:58 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.19122.1663591314737109763
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=fGmWZkr9;
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
	bh=mCRdNPNXe3obH+Mvlt9Xffrod5LedMdgPY2xKFkspVc=; b=fGmWZkr9cRRf0APk4EVkMyQBKP
	7XVyW0NzTJPBJbZPM/Cg6stwqy6Pkpvs7YBSQX4lcihXnSlRGXVREHA5JXHIaxebveUzBtvzZCbTT
	Wij7ncHwfzqri00+ncmO/9UyLyZbSfYOzoaDS9LxKMRsOAsu8LdOIvKjPxHrDzBVY40A7sxsXzFic
	fLdbwhyDq4LsEvGQQxP+BNUzAvJ2ebdg7SCprelQAfUv2AWhdeWy32V/uO5T4wqIfirGRpGXPySz5
	MdH2MB/VEMZK/9oLhsw9GunLKgMhJ2NYTbFTLPzJfuhGmIhK0md9errgMbPFZ3JixnqdyN6krf+N8
	L1dT5WLg==;
Received: from lan.nucleusys.com ([92.247.61.126]:41394 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oaG6I-0000x1-9s;
	Mon, 19 Sep 2022 15:41:54 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-astroid: Upgrade 2.12.9 -> 2.12.10
Date: Mon, 19 Sep 2022 15:41:40 +0300
Message-Id: <20220919124142.4025940-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220919124142.4025940-1-leon.anavi@konsulko.com>
References: <20220919124142.4025940-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Sep 2022 12:41:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98864

Upgrade to release 2.12.10:

- Fixed a crash when introspecting modules compiled by `cffi`
- ``decorators.cached`` now gets its cache cleared by calling
  ``AstroidManager.clear_cache``

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.12.9.bb => python3-astroid_2.12.10.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.12.9.bb => python3-astroid_2.12.10.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.12.9.bb b/meta-python/recipes-devtools/python/python3-astroid_2.12.10.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.12.9.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.12.10.bb
index 4fb29709a..c1d746b89 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.12.9.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.12.10.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "0dafbfcf4ebdecd3c8f6d742c9d9c88508229ca823d5c98ab872d964f3321e56"
+SRC_URI[sha256sum] = "81f870105d892e73bf535da77a8261aa5bde838fa4ed12bb2f435291a098c581"
 
 inherit pypi setuptools3
 
-- 
2.30.2


