Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C9DC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 22:27:55 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.3989.1646260074127880586
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 14:27:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=UZZh3+Zb;
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
	bh=ZvhBdsoZUYZZjec8+Zl9j5BnAEiYlaFbB0UqX/QSoAI=; b=UZZh3+ZbvfZv6gebUu3FQkN3DV
	KUvZWjVm7wz22Ee0LlZjgC8CW3iMltIexNUni4G6p4orP9jdbFE1OWlB/Gv3BLxXdHeUCQX7NEca1
	w5YzT78P1ZdmbgSY2/ER3YQ58sStog44EK9hob90Wz4AVEEX0sAp/maKOyAuRK8kpGZE4hcvU9eQ3
	Wy6r6U0bnSiebrhuO6dc8D0Xp+lSIeR2CUVGzRd8qiHdTshgXLmXsJRh8Pgf63ENn0JTiI+x5Pqta
	wXg1Ku9QgdKuMf1dsOLeWsMrJFCniN5WyXXW4sBUg42d4aG2vkNg3598jvULqOepSyGk9B8wJ3uiu
	Jqu7J7DQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:32944 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nPXRy-000BsC-Iy; Thu, 03 Mar 2022 00:27:54 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-humanize: Upgrade 3.14.0 -> 4.0.0
Date: Thu,  3 Mar 2022 00:27:37 +0200
Message-Id: <20220302222738.1047918-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220302222738.1047918-1-leon.anavi@konsulko.com>
References: <20220302222738.1047918-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 22:27:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95717

Upgrade to release 4.0.0:

- Drop support for Python 3.6
- Remove deprecated VERSION, use version instead
- Remove when from naturaldelta() and allow largest timedelta
- Remove deprecated private function aliases

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_3.14.0.bb => python3-humanize_4.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.14.0.bb => python3-humanize_4.0.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.14.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.0.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_3.14.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.0.0.bb
index 6b2fd3ad6..f84034f3c 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.0.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "60dd8c952b1df1ad83f0903844dec50a34ba7a04eea22a6b14204ffb62dbb0a4"
+SRC_URI[sha256sum] = "ee1f872fdfc7d2ef4a28d4f80ddde9f96d36955b5d6b0dac4bdeb99502bddb00"
 
 inherit pypi setuptools3
 
-- 
2.30.2


