Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E5AC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 19:38:39 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.36673.1641843517336534780
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 11:38:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=r4DnWzx5;
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
	bh=gNYO5gdvklHhvI3xtUasHt7LWqYQ7S6ReSgzm9ECg6Y=; b=r4DnWzx5ZppccaoF0F/m7Oj+TP
	45gNXsERFFZbULSftCnbo/8SQT14P8A9YCN0iaZbz6OJVE3VaAEXx2VwH/sV8Ake7LN/oIsCE9h66
	NwZgExQqKuMTvbJ/LEifTBglFFCK0tAO+WgJhsBOfbdaTaE/jCygdB6CK1E0S5clDwDufcqktf0/u
	FVr9Taq27EiyTUfJrXw5T2L6Kqn/EqftN2FhadKF5R6lxBk+lUDHaKVPyIrgwaWUHzZSb22aoQueq
	aegl8oxiPZbBI2XUwvpCatj2PAjFN/qKpCMW7F2VwwPZx/5QwG4H0sjQ6kdRDFaxtJja/MWDMtoMH
	lA2m4L0g==;
Received: from lan.nucleusys.com ([92.247.61.126]:51302 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n70Wn-0009id-RM; Mon, 10 Jan 2022 21:38:38 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-bitarray: Upgrade 2.3.4 -> 2.3.5
Date: Mon, 10 Jan 2022 21:38:15 +0200
Message-Id: <20220110193815.103592-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220110193815.103592-1-leon.anavi@konsulko.com>
References: <20220110193815.103592-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 19:38:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94727

Upgrade to release 2.3.5:

- Fixed bug for big-endian systems (such as IBM s390)
- Pass `zip_safe=False` to `setup()`

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_2.3.4.bb => python3-bitarray_2.3.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.3.4.bb => python3-bitarray_2.3.5.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.3.4.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.3.5.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.3.4.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.3.5.bb
index 5a674f009..37fcfa1fe 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.3.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "f19c62425576d3d1821ed711b94d1a4e5ede8f05ca121e99b6d978ed49c7a765"
+SRC_URI[sha256sum] = "60285184cb02fdba5e1cc8605ac84e150a50f940e9383ab43564e5258d1f47bb"
 
 inherit setuptools3 pypi
 
-- 
2.30.2


