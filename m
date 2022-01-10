Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4BBC4332F
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 16:32:09 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.33890.1641832326585620244
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 08:32:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=HsdApCJ/;
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
	bh=V6zG5irXCTksmv6CY03G/j+SivqXCZjf4c62TxozwXk=; b=HsdApCJ/jynvCTMvMNv4RB3k+a
	fNtiHUWBou11qGIwrXSrDsbIlk6IoMCUZ8Rv00BrFypE2sU+x8VPDs9Vz0JeWagt3lMiyhk3S2NW3
	yQuJBV+isUORxS4CqtypsWi2EKjD9wHHWDDeU4n+p4f9d+nyf61vOrRBfwQCD0uNeXah2kdomqS5H
	oKs3qZ1SCHMAb8kZuUkhHp/nleKVeDmhqne7V2vuuyD4tdepmbxmU8rD/08K4OLFBXCfsdIzshIG3
	Wq6gbsr7Jd5GCLIfGY3Ttu/FT/EuCltteyFEtdncFsFWyE9mDAhUg5H3OfZHzMLKA/HETMxbMpEcw
	/GqIugvA==;
Received: from lan.nucleusys.com ([92.247.61.126]:51272 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n6xcF-0009ij-0v; Mon, 10 Jan 2022 18:32:03 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-typeguard: Upgrade 2.13.2 -> 2.13.3
Date: Mon, 10 Jan 2022 18:31:45 +0200
Message-Id: <20220110163146.40024-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220110163146.40024-1-leon.anavi@konsulko.com>
References: <20220110163146.40024-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 16:32:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94722

Upgrade to release 2.13.3:

- Fixed TypeError when using typeguard within exec() (where
  __module__ is None)
- Fixed TypedDict causing TypeError: TypedDict does not support
  instance and class checks on Python 3.8 with standard library
  (not typing_extensions) typed dicts

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-typeguard_2.13.2.bb => python3-typeguard_2.13.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_2.13.2.bb => python3-typeguard_2.13.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.13.2.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-typeguard_2.13.2.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb
index b7ae4a32c..21ca43950 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "7e50071590ab997509aa0977609eb5cf9d73d84c1f416cb4fab78b77a9d15326"
+SRC_URI[sha256sum] = "00edaa8da3a133674796cf5ea87d9f4b4c367d77476e185e80251cc13dfbb8c4"
 
 inherit pypi setuptools3 ptest
 
-- 
2.30.2


