Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65330C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 11:35:11 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.8901.1644492909213754429
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 03:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=BKgDLRzF;
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
	bh=UmA/qDE6eIGX+0zfHqGqH3ZMquop8Aq2UVdYE3b+Los=; b=BKgDLRzFgPVzXZn5PV/bzRHwwS
	cG/MIsJ0JTIeRF3hmcQOxZZoMhoVEaUwT1GvIPD1VV1J0PcwmZHHslesMyJezjW1usXrK1iqWcAU3
	9c9FrZe6z6RrfQhfipNOeulAjstFrzjqQn8VM2mfi5EwCLGP2QpL7DOiZiiWo84xdA2rIkbmgyIm0
	V+f21mI7Y1a2EXAsKFO84GuFz0s08yKh6n2oMWPG/KtonhndfH+IvSWqbrXjQK+rETNsH25EX3GYm
	fInGHy1nJ410/BcypclK1emvLyMqxym1yr7AhcfZkCIRH7hKusx1kzip/zBkwE3LoE+KhBIWYVbq0
	Wl9PEyCw==;
Received: from lan.nucleusys.com ([92.247.61.126]:42712 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nI7kf-000CVK-9G; Thu, 10 Feb 2022 13:35:08 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-bitarray: Upgrade 2.3.5 -> 2.3.6
Date: Thu, 10 Feb 2022 13:34:54 +0200
Message-Id: <20220210113454.2022446-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210113454.2022446-1-leon.anavi@konsulko.com>
References: <20220210113454.2022446-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Feb 2022 11:35:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95286

Upgrade to release 2.3.6:

- add optional value parameter to `util.count_n()`
- determine machine endianness at build time when possible, by
  using the `PY_LITTLE_ENDIAN` macro, in order to optimize
  `shift_r8()`
- add official Python 3.11 support

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-bitarray_2.3.5.bb => python3-bitarray_2.3.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.3.5.bb => python3-bitarray_2.3.6.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.3.5.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.3.6.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.3.5.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.3.6.bb
index 37fcfa1fe..d4fb6ed76 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.3.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "60285184cb02fdba5e1cc8605ac84e150a50f940e9383ab43564e5258d1f47bb"
+SRC_URI[sha256sum] = "3bfdb59ded15c961e6e3d5b7f167155cda053be2475ea8017461df0b4d820b7d"
 
 inherit setuptools3 pypi
 
-- 
2.30.2


