Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6DAC433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:20:02 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.3711.1657095598164671172
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=iVHeKCq+;
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
	bh=cbn+usUzwaxiKL20LzBjipxt7tcn8ROjddKlYUDC91Y=; b=iVHeKCq+0iLTmWmyWJKnoB35Ef
	/zZWdqqaaPYHwafO3R0L2LQ5QQQpxASQ3Zml1jZnfE3zt8mjTNqIa1HMPcDgLxuaIB62OjKoH92tE
	ahm7/pqbrriHUBO8RLzdZ8+R+9UhQmhy4ypCp+mRhKm7dShjYyBR3n+oeWzznNsCKEHVvXYLawVVA
	2ILXBLUWANpVrzz8goIbD0lHRZKGufHPvRr9Q1OBe2mXuC9YO6OmJ6ErR40HP6NZQf+eEEDqCZSV6
	MMcV9S/J8vvQxVm2VvQr7mxayvhOGCln8pF2g+JZH2rlwtRaAAI4bQfBX174TnoM3xxuR7FPH8qEG
	rPIwFnuQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:46700 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o90HN-0000Lq-5S;
	Wed, 06 Jul 2022 11:19:56 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-web3: Upgrade 5.29.1 -> 5.29.2
Date: Wed,  6 Jul 2022 11:19:40 +0300
Message-Id: <20220706081940.1256838-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706081940.1256838-1-leon.anavi@konsulko.com>
References: <20220706081940.1256838-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Jul 2022 08:20:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97727

Upgrade to release 5.29.2:

- Only thread lock methods attempting to access the cache for the
  caching middleware.
- Socket timeout when pushing a significant amount of data

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-web3_5.29.1.bb => python3-web3_5.29.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_5.29.1.bb => python3-web3_5.29.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_5.29.1.bb b/meta-python/recipes-devtools/python/python3-web3_5.29.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_5.29.1.bb
rename to meta-python/recipes-devtools/python/python3-web3_5.29.2.bb
index b0b636b90..c9820ebdf 100644
--- a/meta-python/recipes-devtools/python/python3-web3_5.29.1.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_5.29.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
 
-SRC_URI[sha256sum] = "14d0c4ef5d693b6cc9a36ad4ff31201add8ef1f4c1cdb920f7ce07f81841e6bc"
+SRC_URI[sha256sum] = "f37b01f3dc32010b176cef01c2107bc25b7cf94b63c3269d4ec52d7e5ded9a36"
 
 inherit pypi setuptools3
 
-- 
2.30.2


