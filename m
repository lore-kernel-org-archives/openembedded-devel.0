Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A13C1C43217
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 17:03:51 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.9129.1667322222897583515
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Nov 2022 10:03:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=adCWEY82;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=BYue7HKx0TDXbWMCPDLEZ1mFJdh7CA+QJpyzKymwJq8=; b=adCWEY821P21jTiNvttjyYpayH
	Q7sZWQOnThdROT1Ld4POrR1XpM1SUwFLmCbjd6NuDf9koduiGaoIW16CklmM7K/dKLBUjiUaOqImX
	SVqGDxIbS5z7L2DQktLE91WnsYB4dJzNPQRGHQg4p0dlrSR2qLXia35q/k4De9I155qPkw8Fy5tsU
	8hAUjYWkWQ3L7x5sCvBmjqoQAbtbstqRkj6+F1CUKBR74iM11IjgEbDXhGlsB1KY5jd/7HW5wQDzj
	nzVhuK9lq8aln79aCWyeIpZEBLcRYwHrAJ0Zh58IHBo3KUOiZHAQXWbL63C2dv48ZVrHUCjlUL+2d
	hBM5SUGA==;
Received: from lan.nucleusys.com ([92.247.61.126]:40108 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1opuhK-0005Qa-TU;
	Tue, 01 Nov 2022 19:03:42 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-asttokens: Upgrade 2.0.8 -> 2.1.0
Date: Tue,  1 Nov 2022 19:03:27 +0200
Message-Id: <20221101170327.1911161-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221101170327.1911161-1-leon.anavi@konsulko.com>
References: <20221101170327.1911161-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 17:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99398

Upgrade to release 2.1.0:

- Remove 'unmarked' from public API
- Remove remaining mentions of init_tokens
- Teach ASTText the special handling for f-strings
- Explore a clearer lazy-parsing behaviour API
- Handle and test f-strings better
- Handle node being None in same way as token-using methods
- Make get_text_positions docstring match get_text_range better
- Handle f-string nodes even when tokens are present
- Type checking blocks will never get runtime coverage

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-asttokens_2.0.8.bb => python3-asttokens_2.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asttokens_2.0.8.bb => python3-asttokens_2.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-asttokens_2.0.8.bb b/meta-python/recipes-devtools/python/python3-asttokens_2.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-asttokens_2.0.8.bb
rename to meta-python/recipes-devtools/python/python3-asttokens_2.1.0.bb
index 973c57661..e4a21ae3e 100644
--- a/meta-python/recipes-devtools/python/python3-asttokens_2.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-asttokens_2.1.0.bb
@@ -7,7 +7,7 @@ PYPI_PACKAGE = "asttokens"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "c61e16246ecfb2cde2958406b4c8ebc043c9e6d73aaa83c941673b35e5d3a76b"
+SRC_URI[sha256sum] = "4aa76401a151c8cc572d906aad7aea2a841780834a19d780f4321c0fe1b54635"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.30.2


