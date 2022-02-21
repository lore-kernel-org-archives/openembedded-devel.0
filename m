Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6F6C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 19:23:12 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.3254.1645471390779121711
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 11:23:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=lxR0oKCs;
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
	bh=fQbSLoK7nFt54tPRKca/MAC6tqC3ZAOVJGBOCBgziHk=; b=lxR0oKCsph4di0bfkJbloG8Ipa
	vzx1obY8jKRkaGfRtf1S3Nmq72b4DmdMesyxWzcsFF4MUFn9wsJGV5risSAj4m+6rSnp/RcnesFRD
	SjJq4iwjtPt3S1rES659iLW4+MmSc/cN7RNj7y3owQBSrFCzI57o2sJ0O7BmHLS/RRVkTxS1Oqqjz
	VMxGNKmyyImbecVbEFUJrv0vEEhDgGng21MJ1KrTgaBArizxKQGy5NwZs4qBqZK/CqxsUZ23HzIft
	/sksCZJ+d0U3VD+ZDhk7AATsA3MtmApRGwsgqpD+dPThYfNpjseHwXUL6jG9N4iXCCkNMga2oN4O4
	bO4/BJhA==;
Received: from lan.nucleusys.com ([92.247.61.126]:47766 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nMEJR-0006M5-Ev; Mon, 21 Feb 2022 21:23:10 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-itsdangerous: Upgrade 2.0.1 -> 2.1.0
Date: Mon, 21 Feb 2022 21:22:55 +0200
Message-Id: <20220221192256.3347297-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
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
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Feb 2022 19:23:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95425

Upgrade to release 2.1.0:

- Drop support for Python 3.6
- Remove previously deprecated code

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-itsdangerous_2.0.1.bb => python3-itsdangerous_2.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-itsdangerous_2.0.1.bb => python3-itsdangerous_2.1.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-itsdangerous_2.0.1.bb b/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-itsdangerous_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-itsdangerous_2.1.0.bb
index 48a77dc8f..30d23c656 100644
--- a/meta-python/recipes-devtools/python/python3-itsdangerous_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-itsdangerous_2.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/mitsuhiko/itsdangerous"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=4cda9a0ebd516714f360b0e9418cfb37"
 
-SRC_URI[sha256sum] = "9e724d68fc22902a1435351f84c3fb8623f303fffcc566a4cb952df8c572cff0"
+SRC_URI[sha256sum] = "d848fcb8bc7d507c4546b448574e8a44fc4ea2ba84ebf8d783290d53e81992f5"
 
 inherit pypi setuptools3
 
-- 
2.30.2


