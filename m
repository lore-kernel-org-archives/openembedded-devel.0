Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0199EC54EE9
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 12:42:08 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.19276.1663591318605249040
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=LlSGN3Xp;
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
	bh=DPGHvp1gK9rp/rYt2XjuTvoeDfmFKa9saICxgo2UC9E=; b=LlSGN3XpsKckfMlxMrgWK9d94R
	eZ/C6X1kcR0+oQUtwINC9SuQQa/og77fXw3k2On4XJXzHRrkDXPJ8B69ZIHXumOKDwR6kFLEsHrn3
	AIpvaVa0TqO1YROVng7GzkICg2N1PW5MJwmrAj5FN1bnitRlChnSJzaG/YGkRLXDvA3j8KuDiZPXq
	M5hmU3f7IhLcyQ5i5eoz9U7tdk7uIvlFXmkygIuiw1YJ/S1IignO8Jv8nvjCHnhu+T8kShSMV3A5O
	pWgAeHVILORuG9LeUcDtajrNc3jZNi+dtPo34k08yW7bmYpeQxlTRobvUINFus4jGGEFpCj6PIwCV
	orjbj2kw==;
Received: from lan.nucleusys.com ([92.247.61.126]:41394 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oaG6M-0000x1-Lt;
	Mon, 19 Sep 2022 15:41:58 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-email-validator: Upgrade 1.2.1 ->
 1.3.0
Date: Mon, 19 Sep 2022 15:41:42 +0300
Message-Id: <20220919124142.4025940-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220919124142.4025940-1-leon.anavi@konsulko.com>
References: <20220919124142.4025940-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Sep 2022 12:42:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98866

Upgrade to release 1.3.0:

- Deliverability checks now check for 'v=spf1 -all' SPF records as
  a way to reject more bad domains.
- Special use domain names now raise EmailSyntaxError instead of
  EmailUndeliverableError since they are performed even if
  check_deliverability is off.
- New module-level attributes are added to override the default
  values of the keyword arguments and the special-use domains list.
- The keyword arguments of the public methods are now marked as
  keyword-only.
- pyIsEmail's test cases are added to the tests.
- Recommend that check_deliverability be set to False for
  validation on login pages.
- Added an undocumented globally_deliverable option.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...mail-validator_1.2.1.bb => python3-email-validator_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-email-validator_1.2.1.bb => python3-email-validator_1.3.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-email-validator_1.2.1.bb b/meta-python/recipes-devtools/python/python3-email-validator_1.3.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-email-validator_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-email-validator_1.3.0.bb
index a5cb09fd9..76dfdd601 100644
--- a/meta-python/recipes-devtools/python/python3-email-validator_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-email-validator_1.3.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=65d3616852dbf7b1a6d4b53b00626032"
 
-SRC_URI[sha256sum] = "6757aea012d40516357c0ac2b1a4c31219ab2f899d26831334c5d069e8b6c3d8"
+SRC_URI[sha256sum] = "553a66f8be2ec2dea641ae1d3f29017ab89e9d603d4a25cdaac39eefa283d769"
 
 PYPI_PACKAGE = "email_validator"
 
-- 
2.30.2


