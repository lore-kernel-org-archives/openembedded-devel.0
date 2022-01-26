Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A1CC28CF5
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 14:07:38 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.13055.1643206056700531924
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 06:07:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=XZ9Hd4xS;
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
	bh=cpolrbb/MlUD/+LqWtHoaaGzC2kI1qUbn7SficVcMa4=; b=XZ9Hd4xSBYpK+56kFn/6n0C5ZF
	hoZ8ZVnzuxuazoy13/gE8BMIM/Im02VGMcqftYZhgueO+tuOGGovyeHWmyVd4QclYxfbyJqnJAk7o
	OerBtoIkhyVOu+VC9+gJ1FY4h+wA7s32uLGKHtgn528HoxyQvYYR+MjFSdjUcAZC1V2ehKDfqjD0l
	gJie1e3m9dIf9bfx5YMdD9xhFN99XyGEUlspeLV90e4YDbUF1ZqyepdrsDyst4SFPo66VFBnupQ2e
	FGIWn6IPQUqmb+tGz06DF5HUJFOqlqbGdNjpCYhYeRGrCXGPoNuPBIGq1IScUc5AHTHX+p2U0KfeL
	NqLW11ng==;
Received: from lan.nucleusys.com ([92.247.61.126]:57062 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nCixt-0009aJ-9U; Wed, 26 Jan 2022 16:07:36 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-bandit: Upgrade 1.7.1 -> 1.7.2
Date: Wed, 26 Jan 2022 16:07:23 +0200
Message-Id: <20220126140724.3923567-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220126140724.3923567-1-leon.anavi@konsulko.com>
References: <20220126140724.3923567-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jan 2022 14:07:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95105

Upgrade to release 1.7.2:

- Fix broken reported URL link for B107
- test_help_arg: remove assert on 'optional arguments'
- Create FUNDING.yml
- Start using auto-formatters
- Drop end-of-life Python 3.5 and 3.6
- Fix README.rst
- Added snmp_security check plugin for various SNMP checks
- Remove leftover openstack code
- Correctly define extras in setup.cfg

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bandit_1.7.1.bb => python3-bandit_1.7.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.7.1.bb => python3-bandit_1.7.2.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.7.1.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.2.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-bandit_1.7.1.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.7.2.bb
index ad6df1be4..f1d387688 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.2.bb
@@ -1,8 +1,8 @@
 SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "a81b00b5436e6880fa8ad6799bc830e02032047713cbb143a12939ac67eb756c"
+SRC_URI[sha256sum] = "6d11adea0214a43813887bfe71a377b5a9955e4c826c8ffd341b494e3ab25260"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.30.2


