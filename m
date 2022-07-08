Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4FC9CCA47B
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 09:34:54 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.5592.1657272890452227064
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jul 2022 02:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=liX/atAg;
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
	bh=UY4z2PkOG/FUI47e25XQPg3qtFjwQIzb3jV2EkGHuro=; b=liX/atAgpvxdpIq+fOUUJagn96
	HZQy6o4jIC8D2ClfybqFrW/M3ngBW4JMjIwVhIHj6aGAwqoAQBOXpVew2J2jqmA4D6uM+qrHTTrtV
	iTDtje4E4phXv1TFe8g38bNPwxYZIalmQ0itquZN3YuLPLMD97IuRaL7RAm6bvOvsxds/FiPTKvCR
	xSZg9cIHhDLC4O0mYLljcguiO5HorRMZ7SYHqF7NyNLEnskCCYGoAGu1d8nedAU45MgaD0CYtqNR1
	+z3doW3nSp3RzGAtDIxDTFFKN6AyYOP09chvJOIb2TGHkeB8LGl129NaFMY9sxYA3hfu4V2atA2+n
	B9df3nJg==;
Received: from lan.nucleusys.com ([92.247.61.126]:50666 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o9kP4-0002uR-F8;
	Fri, 08 Jul 2022 12:34:49 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-coverage: Upgrade 6.3.2 -> 6.4.1
Date: Fri,  8 Jul 2022 12:34:33 +0300
Message-Id: <20220708093434.4110274-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220708093434.4110274-1-leon.anavi@konsulko.com>
References: <20220708093434.4110274-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Jul 2022 09:34:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97785

Upgrade to release 6.4.1:

- Greatly improved performance on PyPy, and other environments that
  need the pure Python trace function.
- The conditions for using tomllib from the standard library have
  been made more precise, so that 3.11 alphas will continue to work.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_6.3.2.bb => python3-coverage_6.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_6.3.2.bb => python3-coverage_6.4.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_6.3.2.bb b/meta-python/recipes-devtools/python/python3-coverage_6.4.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-coverage_6.3.2.bb
rename to meta-python/recipes-devtools/python/python3-coverage_6.4.1.bb
index 3c6b45705..d352cdadf 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_6.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_6.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "03e2a7826086b91ef345ff18742ee9fc47a6839ccd517061ef8fa1976e652ce9"
+SRC_URI[sha256sum] = "4321f075095a096e70aff1d002030ee612b65a205a0a0f5b815280d5dc58100c"
 
 inherit pypi setuptools3
 
-- 
2.30.2


