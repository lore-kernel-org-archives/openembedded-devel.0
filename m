Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E5DC433F5
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 10:32:45 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.4752.1637577162906489287
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 02:32:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=rPzw2HHO;
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
	bh=2x/r9cf9wmGrAISobOUYid4b7YvBBA5FelSCsyA8DqM=; b=rPzw2HHOWAi8/z+cYzO+ZxxDIN
	hHHkqm/8ovtiDG4KWNxf4bct69G5/m21ybFqNU4pyMnOS7469JqJlSCJGzK5uxEpGO65RoFmk1Ps+
	W8nqA/RX3h4OWemh5K/2a+rNUwiRrLWT+HQrAb2zeV22mBDwxHDqr7LJsg1DJP3Fxzjk0dL3r9kiS
	kisDJ4DbH85iqUVGKONiMQjuIEwuWpQiZLD8jJ1UhUilfmsfObTBbXwtSdY3MUasxfRwlsb3zXiUA
	giEurJEuLYYDBrO6ntd7W8rdxqIU4lE0d9h2EUidrayQ6Bl9NMsisiFywMBWdR8XYG5EFr9Yjrm+C
	VPKsaULw==;
Received: from lan.nucleusys.com ([92.247.61.126]:36490
 helo=lootbox.konsulko.bg)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mp4kv-0004JH-6z; Mon, 22 Nov 2021 12:32:35 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-jsonpointer: Upgrade 2.1 -> 2.2
Date: Mon, 22 Nov 2021 12:32:22 +0200
Message-Id: <20211122103222.31758-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211122103222.31758-1-leon.anavi@konsulko.com>
References: <20211122103222.31758-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Nov 2021 10:32:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94093

Upgrade to release 2.2:

- Add method and add classmethod tag
- Add test for get_parts (new method)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-jsonpointer_2.1.bb => python3-jsonpointer_2.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsonpointer_2.1.bb => python3-jsonpointer_2.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonpointer_2.1.bb b/meta-python/recipes-devtools/python/python3-jsonpointer_2.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-jsonpointer_2.1.bb
rename to meta-python/recipes-devtools/python/python3-jsonpointer_2.2.bb
index fb3d9e0da..225fde755 100644
--- a/meta-python/recipes-devtools/python/python3-jsonpointer_2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonpointer_2.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=32b15c843b7a329130f4e266a281ebb3"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "5a34b698db1eb79ceac454159d3f7c12a451a91f6334a4f638454327b7a89962"
+SRC_URI[sha256sum] = "f09f8deecaaa5aea65b5eb4f67ca4e54e1a61f7a11c75085e360fe6feb6a48bf"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-json \
-- 
2.20.1


