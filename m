Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321F6C433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 10:32:38 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.4853.1637577152734702648
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 02:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=LjuOjFlY;
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
	bh=3hFqN2sG/XVXvJY4kRtwgcwNjQLbP9MDLBTUpn9e4YQ=; b=LjuOjFlYxhi/+BQv5601k2Aa2m
	S9376I3bdsc3owRT5s1K7xqlrgHyDzNjY0bOrRND3514hBjC13kAbj3XwGg2Cc3apNL3FS7AwETwj
	hpFXOtfKMH790ASkLw8iu2Fmd+F/I8IDYWUo2BVGnFId5QRGnCdzsjlccg7lPo/BGLzibuyaPTa8m
	mD+FPVlycz23TBKYk/+1kLDiNUrUZ4VV20cygWn/lCzj38dkzfBfblIak0L2jHpNmKMdgNIs6zUTc
	ZmJeOk1GM+e4aUEamLasK3n9Ni1C9+Ekjq81XlVQhycZtTDvsqFG4ij/xW/sfdXVNNOzyNDMHbAGr
	sgJBaE/Q==;
Received: from lan.nucleusys.com ([92.247.61.126]:36490
 helo=lootbox.konsulko.bg)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mp4kp-0004JH-SN; Mon, 22 Nov 2021 12:32:30 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-imageio: Upgrade 2.11.0 -> 2.11.1
Date: Mon, 22 Nov 2021 12:32:20 +0200
Message-Id: <20211122103222.31758-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Nov 2021 10:32:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94091

Upgrade to release 2.11.1:

- Fix BytesIO regression for legacy pillow

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.11.0.bb => python3-imageio_2.11.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.11.0.bb => python3-imageio_2.11.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.11.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.11.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.11.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.11.1.bb
index 6bdceb8b5..eddbef8b0 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.11.1.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7b9bbbb543b6af3e6b53f9b7fb68f71d"
 
 
-SRC_URI[sha256sum] = "f3c4904a963eb578f14fa356213e49cc25495d017974ad946bb5dcfebf10f117"
+SRC_URI[sha256sum] = "73e53bbf21777173232cd7a1c66361516b58cd09d4828a10dcfe83bb14c2b187"
 
 inherit pypi setuptools3
 
-- 
2.20.1


