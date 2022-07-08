Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DFBC43334
	for <webhook@archiver.kernel.org>; Fri,  8 Jul 2022 09:34:54 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.5626.1657272888106528928
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jul 2022 02:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=hL8WHF+F;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=d4O+B3zqmqdzgIcdiBoS+849tYzZNoC36QK8JvfsCPY=; b=hL8WHF+FfQ83u2w5Tr0AyLptOB
	VBZWIVn4Y8eyLtZmCPbOpOZg1jmDNtFH2VKw3EDXxPJ7Tql37UZmGMdnViLLXbQEigjoCOvDd/bfl
	JEZRSOqmIr7f+bZHmK0aOBU3Z+waPsXtgMMAaLq1P8TmTbsh7EI4x7Dx/LTwCZDMbE6GGE9t87LKe
	YZP6u+iB+/5+PLDjXZlLoKzFjoE3v8nDilk8mZHsemkNUr7nDvSUJypij96DJ6DxRm02qg+J2oJMW
	lcPI0Aci90OXe9Ui/ZiK8jkgLaox8PSmeqaxm7+F6l1GntNAAZc+KL9zprfAhCx9eNl0VLvQi+MrP
	CWPzcP9A==;
Received: from lan.nucleusys.com ([92.247.61.126]:50666 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o9kP2-0002uR-4V;
	Fri, 08 Jul 2022 12:34:46 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-humanize: Upgrade 4.2.0 -> 4.2.3
Date: Fri,  8 Jul 2022 12:34:32 +0300
Message-Id: <20220708093434.4110274-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
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
 https://lists.openembedded.org/g/openembedded-devel/message/97784

Upgrade to release 4.2.3:

- Update annotations, docs, and tests: naturaltime can also accept
  a timedelta
- Update annotations: naturadelta and naturaltime can also accept
  a float
- Rename Arabic locale from ar_SA to ar to enable fallbacks
- Use %d for year translations, convert to string for intcomma after
- Fix intcomma with ndigits=0

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_4.2.0.bb => python3-humanize_4.2.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.2.0.bb => python3-humanize_4.2.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.2.0.bb b/meta-python/recipes-devtools/python/python3-humanize_4.2.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.2.3.bb
index e85c3cb2a..2e4822cad 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.2.3.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "b79797c101f274a19ed7b5f0cd3aa65e1aa379868b974692a9d3129ccc311be2"
+SRC_URI[sha256sum] = "2bc1fdd831cd00557d3010abdd84d3e41b4a96703a3eaf6c24ee290b26b75a44"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.30.2


