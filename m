Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06EF3C433F5
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 15:51:57 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.7846.1639756314606422053
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Dec 2021 07:51:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=vAJEZME+;
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
	bh=+5wZGtX1/ShpR2U89F49CMGaom/SAmeV/m91LLZgWtQ=; b=vAJEZME+h+v4RMm9a0sgUrrd0V
	wO/oA8rI+QMwjje1bYtouA5wcRSoTghc1qcloQnnMdwMCivEEXR6PSRLrH6T+s7BHpl5LRgYV/tcW
	bf3YLv37oVwxgTkB4GPV+wkrSRGDlso8hKjSi0f09X0iJtIBzb2dVKvP8yG4SF0r1zaW4Q0ZRY97l
	9NGKGrUR2dY51IDa/TPrLmjSZiovycgJmuJmXAedSfr6SI6WN+7PKY5TaDfWpzT7E1kpuN5x0FGJA
	e9nrdEIskPjoXT3r5Wtirsiy94UQ2H+YGw+1kJQmdV0T+XM9mJuR+U2mzWKDp8b/BgR8LGS6ME87m
	FQe2+3Bw==;
Received: from lan.nucleusys.com ([92.247.61.126]:52916
 helo=lootbox.konsulko.bg)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1myFWR-0004X8-AF; Fri, 17 Dec 2021 17:51:53 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-humanize: Upgrade 3.12.0 -> 3.13.1
Date: Fri, 17 Dec 2021 17:51:42 +0200
Message-Id: <20211217155144.22827-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
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
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Dec 2021 15:51:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94423

Upgrade to release 3.13.1:

- Add da_DK language
- Fix and add Russian and Ukrainian words
- Add missing strings for Polish translation
- Add Traditional Chinese (zh-HK)
- Temporarily comment out to avoid warning during import humanize

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_3.12.0.bb => python3-humanize_3.13.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.12.0.bb => python3-humanize_3.13.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.12.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.13.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_3.12.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.13.1.bb
index 1aecc5a96..2c601b5de 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.13.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "5ec1a66e230a3e31fb3f184aab9436ea13d4e37c168e0ffc345ae5bb57e58be6"
+SRC_URI[sha256sum] = "12f113f2e369dac7f35d3823f49262934f4a22a53a6d3d4c86b736f50db88c7b"
 
 inherit pypi setuptools3
 
-- 
2.20.1


