Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0AB9C433EF
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 13:20:05 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.7330.1657286401914597504
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jul 2022 06:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=U5ApEOXu;
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
	bh=lhu+/6mqN7YrJFV4+KdZtknoe45FeKzhtOnasNdS9p8=; b=U5ApEOXuW17nwyuw4RGZm6TKv7
	veMs0hDdT5aj9/SHYMFmS8N2ZfLh19O6gd8B7DF3/LLkdtl3ID/lT+msuYm+TFIlUE9AcE081kP/p
	Dumsyqd8JJ+kpkuFEOyg917pYZG1/LfHjNyCbLCQgerM51AXoiSE33+tLYIFN71TTa+dEOSDn+aNM
	4O9KczfLY/q0CjxCPFRvEwswg/LEVonMeBRxCwZlKkTkInEfojycUx3P6pFyQcJTwPyhpcEBxaKsP
	Qti8qme58fakUE2J+ZKEKYkWA9VrrAPljJ2MfczvScBnSP2oXcYggknIAJSlcPmKokXXn2XdVO9xT
	vueNXOkQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:50708 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o9nv0-00083b-Fg;
	Fri, 08 Jul 2022 16:20:01 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-email-validator: Upgrade 1.1.3 ->
 1.2.1
Date: Fri,  8 Jul 2022 16:19:48 +0300
Message-Id: <20220708131949.48129-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220708131949.48129-1-leon.anavi@konsulko.com>
References: <20220708131949.48129-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Jul 2022 13:20:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97788

Upgrade to release 1.2.1:

- Rejecting domains with NULL MX records (when deliverability
  checks are turned on).
- Rejecting unsafe unicode characters. (Some of these checks you
  should be doing on all of your user inputs already!)
- Rejecting most special-use reserved domain names. A new
  test_environment option is added for using @*.test domains.
- Some fixes in the tests.
- example and example.com/net/org are removed from the special-use
  domains list.
- SPECIAL_USE_DOMAIN_NAMES is now a documented part of the API
  (and it is a list instead of a tuple)
- New module-level attributes ALLOW_SMTPUTF8, CHECK_DELIVERABILITY,
  TEST_ENVIRONMENT, and DEFAULT_TIMEOUT can be used to change the
  default values of the keyword arguments.
- Travis CI is updated to test from Python 3.6 forward,
  dropping 3.5.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ail-validator_1.1.3.bb => python3-email-validator_1.2.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-email-validator_1.1.3.bb => python3-email-validator_1.2.1.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-email-validator_1.1.3.bb b/meta-python/recipes-devtools/python/python3-email-validator_1.2.1.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-email-validator_1.1.3.bb
rename to meta-python/recipes-devtools/python/python3-email-validator_1.2.1.bb
index b81e39a15..a5cb09fd9 100644
--- a/meta-python/recipes-devtools/python/python3-email-validator_1.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-email-validator_1.2.1.bb
@@ -3,8 +3,7 @@ SECTION = "devel/python"
 LICENSE = "CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=65d3616852dbf7b1a6d4b53b00626032"
 
-SRC_URI[md5sum] = "25582cf3d415c7fdd44b980a095e0d53"
-SRC_URI[sha256sum] = "aa237a65f6f4da067119b7df3f13e89c25c051327b2b5b66dc075f33d62480d7"
+SRC_URI[sha256sum] = "6757aea012d40516357c0ac2b1a4c31219ab2f899d26831334c5d069e8b6c3d8"
 
 PYPI_PACKAGE = "email_validator"
 
-- 
2.30.2


