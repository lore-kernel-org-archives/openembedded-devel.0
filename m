Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E2ACC433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 13:11:33 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.25865.1646658691649525532
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 05:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=HyjSyWlp;
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
	bh=7xI9NP821iA/c/KE9X+E/wMNKN0L0l2YaOGJe+zkuUs=; b=HyjSyWlprriOcBSKOTJlv9dEbb
	v1M7e+qHPN5dEMCSVocoE2b83j83EfK62497XHRcxiCuvn4dgqJPZPxbfVZCFmlbbQBSkSOhJb3C7
	7CJF4t4dTGi6jRm+o4fco9Ot54ca5I+MGpzQ9nDwAM2wplh497aDUp/VDXXnYWVhSpgdY0HRN7eN1
	lYgLLhW6TGt+lVjsVL5y8IbpLwzbhWTm5xy/iCG7feaeDeun7rqPkeVUSs6KdAE1GZqjBJlJkJhPe
	FsBzvLtss0mXeDTd/X+tMIlieOgQixByxES5xJvbH57lS0a2LXjeQniWiM2j1ndKyo9PVthPzh5N0
	o4q027fA==;
Received: from lan.nucleusys.com ([92.247.61.126]:35064 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nRD9b-0002GR-Pq; Mon, 07 Mar 2022 15:11:29 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-bandit: Upgrade 1.7.2 -> 1.7.4
Date: Mon,  7 Mar 2022 15:11:19 +0200
Message-Id: <20220307131120.3899473-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
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
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 13:11:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95858

Upgrade to release 1.7.4:

- Fix traceback in hashlib_insecure_functions
- Add version 1.7.3 to dropdown
- core/config: Fix ConfigError missing argument if toml is missing
- Add 1.7.4 in issue template

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-bandit_1.7.2.bb => python3-bandit_1.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.7.2.bb => python3-bandit_1.7.4.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.7.2.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.4.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-bandit_1.7.2.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.7.4.bb
index f1d387688..cfdbde968 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "6d11adea0214a43813887bfe71a377b5a9955e4c826c8ffd341b494e3ab25260"
+SRC_URI[sha256sum] = "2d63a8c573417bae338962d4b9b06fbc6080f74ecd955a092849e1e65c717bd2"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.30.2


