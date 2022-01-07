Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362F0C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 17:47:50 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.9996.1641577668788036287
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 09:47:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=LBT1rDY/;
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
	bh=nMTkX3GNzreunwsA1XeOboVepq/ZTPO3h1aoUcfulgk=; b=LBT1rDY/RB5tzGZ6uqR5JwAUk0
	djFHXo+h8QxU1M02mnevfsk0IHrdnEY9+oxyKifBe2S/n3teXmfZTUwKiUYY1F6U19U66ySykYMlj
	7vhRdeWwvMU2ZrENWAs10qGAMFbsSZRcFtaw4VtBBlsXfRdZxJ8agA0g9SQMrTsB/EG5DeIKi6PSj
	2hPYAsFjWje3Kp1e7OgjHD6DyYDlRYROCMu3eQNMR0iFfMA7bJ4JK97Z2s3l8E+vzjDmUMsf0Btg0
	dPA1EYSBn5o2PeYBNI7qR9tMOWR/E+DYhcvMXBFnflmvK45p7MT5cc5ATMtRQHZ5fKEleLV8p+uAI
	Vv5w64qw==;
Received: from lan.nucleusys.com ([92.247.61.126]:48914 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n5tMg-0000YW-S9; Fri, 07 Jan 2022 19:47:48 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-astroid: Upgrade 2.9.0 -> 2.9.2
Date: Fri,  7 Jan 2022 19:47:28 +0200
Message-Id: <20220107174730.3326962-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220107174730.3326962-1-leon.anavi@konsulko.com>
References: <20220107174730.3326962-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 17:47:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94694

Upgrade to release 2.9.2:

- Fixed regression in ``astroid.scoped_nodes`` where
  ``_is_metaclass`` was not accessible anymore.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.9.0.bb => python3-astroid_2.9.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.9.0.bb => python3-astroid_2.9.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.9.0.bb b/meta-python/recipes-devtools/python/python3-astroid_2.9.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.9.0.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.9.2.bb
index fee8acb1f..c504d4db3 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.9.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "5939cf55de24b92bda00345d4d0659d01b3c7dafb5055165c330bc7c568ba273"
+SRC_URI[sha256sum] = "72ace9c3333e274e9248168fc4f3e300da8545af1c303bd69197027f49e2bfff"
 
 inherit pypi setuptools3
 
-- 
2.30.2


