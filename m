Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37840C433EF
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 18:44:44 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.11447.1655923479761728228
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jun 2022 11:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=nm6Gazwo;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KyPS8g8PBuo2IekyHEbXElbRsIBPnzd92GibPRrslhQ=; b=nm6GazwogHOQMzV/J/0FGGlhEd
	++BXpevHs967Ttxx2HD+y8WQtkUEsxlkviVJBVpScSYWWwyHMHoeTa5yyXSDTaTPJkPwanMWt/0Rt
	BEqPHVZ4OJe8rZNZKtOxeUX5eBhj9GLf+f0lopTwbFJg5Pg49yVDKUAN6HTv3ys7JesozGm60FokS
	CXtfYaFw90ZaiQHuqalkBhE2S4sKWM7yfGpffRQVOBlF3axGyDP+0G04kejjd//S+JDtErEBBltVF
	EfHwqzuv7G1AZukug4+JnRazQXwsiJREdtk2r7ToFlEtbsFEeFwuFujatbu6lbMda103oO+CLuosF
	eDsGXPdA==;
Received: from lan.nucleusys.com ([92.247.61.126]:41906 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o45LF-000AqE-ON;
	Wed, 22 Jun 2022 21:44:39 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-traitlets: Upgrade 5.2.1 -> 5.3.0
Date: Wed, 22 Jun 2022 21:44:28 +0300
Message-Id: <20220622184429.931224-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
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
 https://lists.openembedded.org/g/openembedded-devel/message/97569

Upgrade to release 5.3.0:

- Fix traitlet name in docstring
- Re-support multiple-alias key for ArgParseConfigLoader

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-traitlets_5.2.1.bb => python3-traitlets_5.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.2.1.bb => python3-traitlets_5.3.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.3.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.3.0.bb
index 3bc977279..7c8186707 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.3.0.bb
@@ -4,7 +4,7 @@ AUTHOR = "IPython Development Team <ipython-dev@scipy.org>"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.md;md5=9c125dfc5ff5364d40b5f56f02cd9de3"
 
-SRC_URI[sha256sum] = "a415578cde1985f1b773faefe49e9f078d345f38665ce3e9e914ec7b41150ce9"
+SRC_URI[sha256sum] = "0bb9f1f9f017aa8ec187d8b1b2a7a6626a2a1d877116baba52a129bfa124f8e2"
 
 inherit pypi python_hatchling
 
-- 
2.30.2


