Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA51C433FE
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 16:32:08 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.34319.1641832326405580022
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 08:32:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=OP46VIPN;
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
	bh=s+iDCdvnNh/7RwnSly4GakoiUsIG+o9hBoYZlo9ud4Y=; b=OP46VIPNQEgBmge8jBqaCckdEF
	tn7Dvhh3G03vPdOFZ3laaG1gd0vAQrf8fqMs5/Ikrw47xfxVdIWpa5bvNYk6//wN55UGVT/x/0/uQ
	OTF737zM3rIbgQ6rtvjjQPLp3Cv/Wx5XLEyyhErCFGubMpobj44YEZVOLSGX9Oyvo7aP0WqQVLDcw
	FlEiqIk1N2G09PXhBYzNXZgU1fD1BpBEfE8dXlGKEjo6wPL4Eged8dHpGBUAA616YkHshd8jaCbUH
	UVfyYWL7jBa+6CJlwbJ8T8e8wyAWU/X676e2lAI0EOEa1tcYSKnuh7lsoUhI9O68DlRnSds2cC9fZ
	KZo5m23A==;
Received: from lan.nucleusys.com ([92.247.61.126]:51272 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n6xcC-0009ij-UA; Mon, 10 Jan 2022 18:32:01 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-pycocotools: Upgrade 2.0.2 -> 2.0.4
Date: Mon, 10 Jan 2022 18:31:44 +0200
Message-Id: <20220110163146.40024-3-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 16:32:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94721

Upgrade to release 2.0.4:

- Revamp Python build system to fix multiple build problems
- Update config.yml

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...thon3-pycocotools_2.0.2.bb => python3-pycocotools_2.0.4.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pycocotools_2.0.2.bb => python3-pycocotools_2.0.4.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.4.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pycocotools_2.0.4.bb
index d47b7b563..ec8585e61 100644
--- a/meta-python/recipes-devtools/python/python3-pycocotools_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pycocotools_2.0.4.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://pycocotools/coco.py;beginline=45;endline=45;md5=12cb5
 
 inherit setuptools3 pypi
 
-SRC_URI[md5sum] = "33858f23c8b99ce8116b70c32f6b6dd9"
-SRC_URI[sha256sum] = "24717a12799b4471c2e54aa210d642e6cd4028826a1d49fcc2b0e3497e041f1a"
+SRC_URI[sha256sum] = "2ab586aa389b9657b6d73c2b9a827a3681f8d00f36490c2e8ab05902e3fd9e93"
 
 DEPENDS = "python3-cython-native python3-numpy-native virtual/crypt"
 RDEPENDS:${PN} = "python3-matplotlib python3-pillow python3-profile"
-- 
2.30.2


