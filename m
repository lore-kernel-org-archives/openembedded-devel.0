Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12214C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 13:17:42 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.7368.1645622261063288363
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 05:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=rxfEyEh2;
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
	bh=kph3ofNlxt+XdsXk95eYOFuIy784mUTsUnrcXDM4vrs=; b=rxfEyEh23wj3LdebVXdhyWbyli
	uoB+f3qLxtZ1qSbfAaD/ZGgwLv6XitDjIegR8jo7/eUCdZfk8KMm7uCtCYqvwPyY3NBDIsA/0kl9E
	jDHDrasI9hsOhYO7tuJsdWfGPpfb6BPJbWi1kthUK4FvyEdnVqTWDmTDvNXzy8GNQMIgtB6vC83Sq
	OV9s3iBUWhCq57pp+8vnYIsOUNmxFoJR4qN1kcOYklCa7F+0oPjijNJzg9jGrNEVdHGeY54BtQm4B
	uOWEfjqhP1yEqXrTvLIXjTMPMAaKI+JyYfaBvOS8ZE/ceqgvIthxTvgMQrKl6SQprtHWP7jFY2Yoa
	pBixI1IA==;
Received: from lan.nucleusys.com ([92.247.61.126]:51954 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nMrYz-000Bp1-5H; Wed, 23 Feb 2022 15:17:40 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-langtable: Upgrade to release 0.0.57
Date: Wed, 23 Feb 2022 15:17:21 +0200
Message-Id: <20220223131721.1683054-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223131721.1683054-1-leon.anavi@konsulko.com>
References: <20220223131721.1683054-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 13:17:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95481

Upgrade to release 0.0.57:

- Get translation changes from CLDR
- Add more translations from CLDR
- Replace "ibus/cangjie" with "ibus/table:cangjie"
- Updates for Sami languages
- Updates for Finnish keyboard layouts

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-langtable_0.0.56.bb => python3-langtable_0.0.57.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.56.bb => python3-langtable_0.0.57.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.56.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.57.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.56.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.57.bb
index b8f052ea3..39819f435 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.56.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.57.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[sha256sum] = "318af0fd616711ce5cd2a7b11a6761183ba9c1ff76a762919e08d85645fc854b"
+SRC_URI[sha256sum] = "6c3c0a6577652c81871cbaf139046e1c88ead8439c585bd83976b3092f57e9d7"
 
 inherit pypi setuptools3 python3native
 
-- 
2.30.2


