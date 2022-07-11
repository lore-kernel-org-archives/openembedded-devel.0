Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85501CCA47B
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 09:07:09 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.26289.1657530425743246961
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 Jul 2022 02:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=jn8fl+dh;
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
	bh=wFLxBQG8dzu/A6ypb6HEpzH5u4gQTEC5lkhbGGjyR64=; b=jn8fl+dhFLrZhLXHLZ98DwaXgX
	gBIVkxWTPJ7qYwdpUYQsQaRj3fX1gBZt03GpM6JsAQ1XLEuOpBXroeLnv4xtYSpQLiShD+zDpvQ6u
	bU5hf1HlzunwsEyJeXYCJhIY+rHuFF1aBKRYWwP5pHYMFErgCpl+/U5+39nCFSOX93Kc/PO9r/Iwv
	s4OkVTVW1y4ZAlIbmtSWKvTlbXCgy7sPKHLW5cIoeb5c5h8oLBsx7Y8FHK0e72QPznE1B0RWEoTgS
	wuTnhXcTBaXHc+UVY6AhjBO0spH10oUw4oUGBkFtHSRQHGPT37XuFdZ65LOWa4Lm0+l0QQhXltmvd
	Y4/8Yq3g==;
Received: from lan.nucleusys.com ([92.247.61.126]:52702 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oApP5-000Clc-Dq;
	Mon, 11 Jul 2022 12:07:04 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-ansi2html: Upgrade 1.7.0 -> 1.8.0
Date: Mon, 11 Jul 2022 12:06:50 +0300
Message-Id: <20220711090650.2117395-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220711090650.2117395-1-leon.anavi@konsulko.com>
References: <20220711090650.2117395-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Jul 2022 09:07:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97811

Upgrade to release 1.8.0:

- style.py: Drop unused CSS class .bold
- Bring back putting a rendered man page into release archives
- Migrate from mock to unittest.mock of Python >=3.3
- Fix for ANSI color codes that include blank values
- Added py.typed file
- style.py: Get CSS class .inv_foreground in sync with
  .body_foreground
- Fix --input-encoding= regression added in PR #143 + related
  tests
- Add ability to also recognize colons in ANSI escapes
- Fixes to respect bright colors in palette

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-ansi2html_1.7.0.bb => python3-ansi2html_1.8.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ansi2html_1.7.0.bb => python3-ansi2html_1.8.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb b/meta-python/recipes-devtools/python/python3-ansi2html_1.8.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-ansi2html_1.8.0.bb
index 0f1804de8..21095cb7d 100644
--- a/meta-python/recipes-devtools/python/python3-ansi2html_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ansi2html_1.8.0.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-3.0-only"
 
 PYPI_PACKAGE = "ansi2html"
 
-SRC_URI[sha256sum] = "69316be8c68ac91c5582d397c2890e69c993cc7cda52062ac7e45fcb660d8edc"
+SRC_URI[sha256sum] = "38b82a298482a1fa2613f0f9c9beb3db72a8f832eeac58eb2e47bf32cd37f6d5"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.30.2


