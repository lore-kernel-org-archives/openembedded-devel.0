Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5D6C433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 15:51:59 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.7684.1639756318054102232
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Dec 2021 07:51:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=f/muuEWo;
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
	bh=BVxiiLuLkiZfbREzrqcr+HTFLF++ZtWqbQDvBv6l+pk=; b=f/muuEWoaksO3E4y9wnuUnRcxO
	r8rWxdbvjITmUEC374N3zAPHUiIFfuT7Kdj2ENf0IMyHY85fXeYIOdSuyP2PFDqHDFPa0tWERLxDL
	pDFA/ZouHE7E4BklXCJAdf56Tt0emXS+JT4s/XRAPccQsfbBPOU+1vPHasGHjztX6V36hQnhW/5Aj
	fuLcUtBk/6LJZ8TYANz1MCfG6JcyIJ3Yw4zwTRsh0fEGn6eZicSQ2VTaJNkXPvNiw4sWpsR0YvGdc
	uX/IQBNBjbJDJAR0vjHLZQso14qu4ltTy9C1kt4LdUzyeTRrO+8fyUJw/fTNSPaTXh3UakgP/48Ye
	YEBuj/ow==;
Received: from lan.nucleusys.com ([92.247.61.126]:52916
 helo=lootbox.konsulko.bg)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1myFWV-0004X8-S3; Fri, 17 Dec 2021 17:51:58 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-prompt-toolkit: Upgrade 3.0.22 ->
 3.0.24
Date: Fri, 17 Dec 2021 17:51:44 +0200
Message-Id: <20211217155144.22827-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211217155144.22827-1-leon.anavi@konsulko.com>
References: <20211217155144.22827-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
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
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Dec 2021 15:51:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94425

Upgrade to release 3.0.24 with the following fixes:

- Prevent window content overflowing when using scrollbars.
- Handle `PermissionError` when trying to attach /dev/null in
  vt100 input.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...rompt-toolkit_3.0.22.bb => python3-prompt-toolkit_3.0.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prompt-toolkit_3.0.22.bb => python3-prompt-toolkit_3.0.24.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.22.bb b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.24.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.22.bb
rename to meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.24.bb
index e8cc87697..9a6798ad3 100644
--- a/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.22.bb
+++ b/meta-python/recipes-devtools/python/python3-prompt-toolkit_3.0.24.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-prompt-toolkit.readthedocs.io/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b2cde7da89f0c1f3e49bf968d00d554f"
 
-SRC_URI[sha256sum] = "449f333dd120bd01f5d296a8ce1452114ba3a71fae7288d2f0ae2c918764fa72"
+SRC_URI[sha256sum] = "1bb05628c7d87b645974a1bad3f17612be0c29fa39af9f7688030163f680bad6"
 
 inherit pypi setuptools3
 
-- 
2.20.1


