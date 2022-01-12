Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5779DC433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 18:35:52 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.1288.1642012550596295283
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 10:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=UHVMZHpd;
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
	bh=qEWob/immcpej2m43xRje6ak77UE95F32YtSMVl/3+M=; b=UHVMZHpdRCeP7ryiWRsV/YUHBH
	6YsJZGW+XfkDml8GIUGgWxZyVHRi88UCK15oeRT82eYh1UkT8oGcTbbvs1CqHiXKS0f41hxitgWV8
	lYbSLXqUklR/sKJbwlm4RRsk3vYKlL20Srmlsm91tJ8tzTs9C63UoOvRMjEvX5BDgxX3YZeDAT+jF
	VPyBsD8srcFXsF5UZKmQCr73T44mh1EJ82RfuLtdOIbpXg483Yelnk/GHQZ+VTVVNuVBA3Php7Q8l
	jhD+ALvQn6/L26fQgDX1B5DKF16FAQUfp4y6L2JboYR3YijwgaWw6iqpWj7UeK7QPoOPU5vR7fxDv
	pJg2uKAg==;
Received: from lan.nucleusys.com ([92.247.61.126]:48040 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n7iVI-000Bc0-BA; Wed, 12 Jan 2022 20:35:50 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-natsort: Upgrade 8.0.0 -> 8.0.2
Date: Wed, 12 Jan 2022 20:35:30 +0200
Message-Id: <20220112183531.2712341-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112183531.2712341-1-leon.anavi@konsulko.com>
References: <20220112183531.2712341-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 18:35:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94791

Upgrade to release 8.0.2:

- Bug where sorting paths fail if one of the paths is '.'.
- Compose unicode characters when using locale to ensure sorting
  is correct across all locales.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-natsort_8.0.0.bb => python3-natsort_8.0.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-natsort_8.0.0.bb => python3-natsort_8.0.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-natsort_8.0.0.bb b/meta-python/recipes-devtools/python/python3-natsort_8.0.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-natsort_8.0.0.bb
rename to meta-python/recipes-devtools/python/python3-natsort_8.0.2.bb
index 7c2b7deb6..1a54fcb24 100644
--- a/meta-python/recipes-devtools/python/python3-natsort_8.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-natsort_8.0.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=58db8ac9e152dd9b700f4d39ff40a31a"
 
 PYPI_PACKAGE = "natsort"
-SRC_URI[sha256sum] = "a0a4fd71aee20a6d648da61e01180a63f7268e69983d0440bd3ad80ef1ba6981"
+SRC_URI[sha256sum] = "feb87e0ce1dc1f8f3f21e18a85216c790e746d76a5ff6889563394605f504a2b"
 
 inherit pypi setuptools3
 
-- 
2.30.2


