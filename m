Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14269C6FA90
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 12:41:58 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.19256.1663591316779212351
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 05:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=GXZziYhE;
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
	bh=vODPeHI3aKtCeCihvqg1SmT37C0FlsgqJG1db0y6NK0=; b=GXZziYhEQnK3UkK2leZ2L3C3kF
	EuH4iWh4Z0BTl1TMLntr9b8uJik6iGdJ5jezwhnZPkegee3M4MhTl3H8gqM2EvkugFW0/h0KV8M56
	sHIIaPUiQyd8mvg84RBM8hJ0DZHQQ25kfjV+TsOZIgzLd7YqfPfT6F2KIwAkPJURnFiWOADhwY/eK
	Ubfo1mxpne6gAo8wGerIxdVBf9oiWa1+NYK1z57PgfF6hRLWJWbT9fyl2t6uNAjPp4TW3rzVNZkL+
	AoJzBGC1aZaZef2/509XnojwRuyUx/fGxJTo2oYeLUFzwE6E5T74NdZDUos/AmPPHEp8d/qf3xqys
	dtvyUZMw==;
Received: from lan.nucleusys.com ([92.247.61.126]:41394 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oaG6K-0000x1-LS;
	Mon, 19 Sep 2022 15:41:56 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/4] python3-imageio: Upgrade 2.21.3 -> 2.22.0
Date: Mon, 19 Sep 2022 15:41:41 +0300
Message-Id: <20220919124142.4025940-3-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Sep 2022 12:41:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98865

Upgrade to release 2.22.0:

- Pyav API for procedural video writing

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.21.3.bb => python3-imageio_2.22.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.21.3.bb => python3-imageio_2.22.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.21.3.bb b/meta-python/recipes-devtools/python/python3-imageio_2.22.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.21.3.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.22.0.bb
index 74591f3c4..6bc7b60f9 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.21.3.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.22.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "b10a583c831c932f4afbea9e8403082d2a76b1d30d7555b777ceb70441890b3c"
+SRC_URI[sha256sum] = "a332d127ec387b2d3dca967fd065a90f1c1a4ba2343570b03fe2cebb6ed064ea"
 
 inherit pypi setuptools3
 
-- 
2.30.2


