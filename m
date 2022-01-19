Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C774CC433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 12:19:17 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.5479.1642594756410971804
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Jan 2022 04:19:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=kEUnU0Ot;
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
	bh=G8Id/70SkzzUFAfGgSZTlUHwCzLZ6IfYm6H7sL/SqPQ=; b=kEUnU0OtaBhXzRzBmdG4FdB317
	S9D8QMXsWs3BEZ9Okzkv9THQ354biAyMmb0Li7z1gjlWfP8A5aw8y4ordXojGTl8x1mFOQJPYolP0
	kLduWgEKYMYUikyhbOmJbtAdZjcS97FV5WVq+YCktDX4TdUXVFCXzqCK1piQZsVocowZ/2rOpvn2e
	2Cc0CelBq0CP7tdhb2NaFhHuMBM+P12Ut/eZIB3Y7zuU0hLdCsNy+UX7QwIR5x/3UpVT8MQKjR39h
	/P10rmIjaktziejYHz6UpZScVmwMlYcfZHl3ZtKm2XfOQb8T5WAgcud7J+V+K5LqYASOpsgCOjyfO
	grV/EAzQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:45782 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nA9vl-0006gb-Rh; Wed, 19 Jan 2022 14:19:15 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-frozenlist: Upgrade 1.2.0 -> 1.3.0
Date: Wed, 19 Jan 2022 14:18:58 +0200
Message-Id: <20220119121858.1575699-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220119121858.1575699-1-leon.anavi@konsulko.com>
References: <20220119121858.1575699-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Jan 2022 12:19:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94945

Upgrade to release 1.3.0:

- Do not install C sources with binary distributions
- Dropped Python 3.6 support

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-frozenlist_1.2.0.bb => python3-frozenlist_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-frozenlist_1.2.0.bb => python3-frozenlist_1.3.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.2.0.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.3.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-frozenlist_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-frozenlist_1.3.0.bb
index e8359418b..e3a932f77 100644
--- a/meta-python/recipes-devtools/python/python3-frozenlist_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/frozenlist"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf056e8e7a0a5477451af18b7b5aa98c"
 
-SRC_URI[sha256sum] = "68201be60ac56aff972dc18085800b6ee07973c49103a8aba669dee3d71079de"
+SRC_URI[sha256sum] = "ce6f2ba0edb7b0c1d8976565298ad2deba6f8064d2bebb6ffce2ca896eb35b0b"
 
 inherit pypi setuptools3
 
-- 
2.30.2


