Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C445CC433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 19:38:36 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.36939.1641843514805291273
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 11:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=ncJ9hlwy;
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
	bh=xulWN+HUPs6uvq9WCyhc0EwZBeWUm8PMudJoIMWIis4=; b=ncJ9hlwyrRQlv3cmd19THBMOw/
	ujLbUwbE7miYZ5LBvRkKZnYe6ozUFAZXBWQa/0hT9907OXoUBikr0MOmo1iHmeIJyGiHD9fTs7/zu
	ePdsX4S+3AJwSf5UM2kgNo3YmrPIOeiWcYybJqathKe/7Kr/BQxLYbl67xi0o9c6/UNVRURt5ohd7
	eAnBcG5g1pl06gjAunV+0RMqO194OP9vSY/jLUtfmzsiUe0LH2Cpi8R1Qal5d/BWAgLiMfliiku4h
	yJ4sQMh38AnSFhjyqpIaHpH3YUzw2afbhjCrPVdzM6WJ/EpSkItxANWQhk4HrfpO0cXGwuK37VMdv
	C/Q19RjA==;
Received: from lan.nucleusys.com ([92.247.61.126]:51302 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n70Wh-0009id-8h; Mon, 10 Jan 2022 21:38:31 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-astroid: Upgrade 2.9.2 -> 2.9.3
Date: Mon, 10 Jan 2022 21:38:12 +0200
Message-Id: <20220110193815.103592-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220110193815.103592-1-leon.anavi@konsulko.com>
References: <20220110193815.103592-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 19:38:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94725

Upgrade to release 2.9.3:

- Fixed regression where packages without a ``__init__.py`` file
  were  not recognized or imported correctly.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.9.2.bb => python3-astroid_2.9.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.9.2.bb => python3-astroid_2.9.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.9.2.bb b/meta-python/recipes-devtools/python/python3-astroid_2.9.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.9.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.9.3.bb
index c504d4db3..7bc93bf33 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.9.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.9.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "72ace9c3333e274e9248168fc4f3e300da8545af1c303bd69197027f49e2bfff"
+SRC_URI[sha256sum] = "1efdf4e867d4d8ba4a9f6cf9ce07cd182c4c41de77f23814feb27ca93ca9d877"
 
 inherit pypi setuptools3
 
-- 
2.30.2


