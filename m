Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B39C6FA8D
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 11:58:54 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.5275.1663156723618768980
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Sep 2022 04:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=kwhbWLyd;
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
	bh=igK6sIzlexhtVRzC9xLpjZv/f40N3klYKvV2dGkGUok=; b=kwhbWLydLZfiGuyHXqYyb+byJB
	3fSDgIQbdVBHP4E6aqd6vmPpZeV97FC3lMylJpJTO17h88htS1uUY65MIOUX9KhtgCUF9Mugzgy19
	xZh/fA8WGGE3bu1LpQPd59BLcEeSTj++R4FEObs/UNrhZ5BImbD8PfWmw8MyuJNp+RAQl3QiKxOk9
	Ru4/1ZYyTC6HjKxYZ19LRH39ACo538Zv3X0FWclZm1POB+E8k4iDZu3CFTAqgUm0sYUvSeii6USQM
	Q1R3yK47Fk6o/WYlnOJEBqBcyQHDQFGLitkbCU1q1scfQzrMTEkoHYzvXrhFYhcsMuauGt2ptV09s
	MPQget7A==;
Received: from lan.nucleusys.com ([92.247.61.126]:58898 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oYR2N-0002R1-LL;
	Wed, 14 Sep 2022 14:58:41 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-imageio: Upgrade 2.21.2 -> 2.21.3
Date: Wed, 14 Sep 2022 14:58:29 +0300
Message-Id: <20220914115833.177477-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Sep 2022 11:58:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98790

Upgrade to release 2.21.3:

- Raise error if fps is specified
- Fix small typo
- Examples for Pyav

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.21.2.bb => python3-imageio_2.21.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.21.2.bb => python3-imageio_2.21.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.21.2.bb b/meta-python/recipes-devtools/python/python3-imageio_2.21.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.21.2.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.21.3.bb
index 06af2a15f..74591f3c4 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.21.2.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.21.3.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "5702e7b4874bdb2f428b08c7491699b44842129d412cdaa7177ba7ff059deb2c"
+SRC_URI[sha256sum] = "b10a583c831c932f4afbea9e8403082d2a76b1d30d7555b777ceb70441890b3c"
 
 inherit pypi setuptools3
 
-- 
2.30.2


