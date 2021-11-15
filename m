Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8DDC433FE
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 13:10:35 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.22053.1636981833669715252
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
	id 1mmbkj-0005eR-AO; Mon, 15 Nov 2021 15:10:29 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-bandit: Uprade 1.7.0 -> 1.7.1
Date: Mon, 15 Nov 2021 15:10:21 +0200
Message-Id: <20211115131023.1575-3-leon.anavi@konsulko.com>
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
 https://lists.openembedded.org/g/openembedded-devel/message/93947

Upgrade to release 1.7.1:

- Fix broken reported URL link for B107
- fix reading initial values from .bandit
- Always use a Loader in yaml.load
- PEP-518 support: configure bandit via pyproject.toml

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bandit_1.7.0.bb => python3-bandit_1.7.1.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.7.0.bb => python3-bandit_1.7.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.7.0.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-bandit_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.7.1.bb
index 18989c6d8..ad6df1be4 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.1.bb
@@ -2,8 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
 
-SRC_URI[md5sum] = "24965f102dc62129d3fafe4fe596a3b8"
-SRC_URI[sha256sum] = "8a4c7415254d75df8ff3c3b15cfe9042ecee628a1e40b44c15a98890fbfc2608"
+SRC_URI[sha256sum] = "a81b00b5436e6880fa8ad6799bc830e02032047713cbb143a12939ac67eb756c"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.20.1


