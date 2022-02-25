Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F27C433FE
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 13:23:43 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.6361.1645795422398895664
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Feb 2022 05:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=q7jlDAA9;
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
	bh=KFKJl5xjcqOKwrS+LPdNyOIS50VJjwRFs49TtOMl6Os=; b=q7jlDAA9NNoccZHIbFbyZwhfQ2
	KpyVfnEqJB+dfPeHapS2WxqFwHxvOVthB5vRCcEQEJ95SOVDJ4EqsR6mFdPV60sAufEDXrA4wf0qt
	Fj+9yybTEk1AWQ1dnK3inIidhCB0M4b/kpstLW9LzvjCjBl0JWopv+xYukdcyfWzRZc78qDDErw6U
	KnoinAztLTxY7mhdttNOwzODfOaRavH51aQf+Mt7agDu3ocTRKkxDDU57xlYjd3MDgb6nuhFB2yz4
	NDmiZcZwJIS1pC4x4mFZik7CFvLEP6KpqxMUgkF/xm45IJH1bOKrCsUxWGKimEFXZmVZxAeoVGVmR
	OsP2xlVQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:56822 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nNac3-0009rs-30; Fri, 25 Feb 2022 15:23:42 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-charset-normalizer: Upgrade 2.0.10
 -> 2.0.12
Date: Fri, 25 Feb 2022 15:23:28 +0200
Message-Id: <20220225132328.2469153-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225132328.2469153-1-leon.anavi@konsulko.com>
References: <20220225132328.2469153-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Feb 2022 13:23:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95522

Upgrade to release 2.0.12:

- ASCII miss-detection on rare cases
- Explicit support for Python 3.11

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ormalizer_2.0.10.bb => python3-charset-normalizer_2.0.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_2.0.10.bb => python3-charset-normalizer_2.0.12.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_2.0.10.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_2.0.12.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_2.0.10.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_2.0.12.bb
index 3c1e6804e..47b8579a1 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_2.0.10.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_2.0.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0974a390827087287db39928f7c524b5"
 
-SRC_URI[sha256sum] = "876d180e9d7432c5d1dfd4c5d26b72f099d503e8fcc0feb7532c9289be60fcbd"
+SRC_URI[sha256sum] = "2857e29ff0d34db842cd7ca3230549d1a697f96ee6d3fb071cfa6c7393832597"
 
 inherit pypi setuptools3
 
-- 
2.30.2


