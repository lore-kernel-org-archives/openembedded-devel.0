Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CE7C004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 17:26:32 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.51576.1674149187047580826
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Jan 2023 09:26:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=pdYXjyW3;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=zcwF+DXksdvzRbGYBynUOYcM4gDiNilQ+k3p3VcsvGE=; b=pdYXjyW3mCjC6pIVACLLE/u6z5
	VK5uY+3hA5IZFbKqpX0tnxcqs9D8ilP/2FX5N3TiHbn8f0GKQTtsZ9ehhBhL01AefFU3O8FWyZopA
	MHUCS5sfWb7qNTIi12q3xv5t7eZHBT5WAj7F80PllzjeYoCbHOX8GHNHRp7gck+GnvXdw3eimPcYJ
	bKp79r7c1vtbHBXQbaXNM1RoYqetUHD5srmw0Dc65dQrAatD85XW50bM+oM/oeBvakgs5zHFgOrRz
	HAy2rgFNFT11tewX940p1OoVrsvZ/TvGd63HfVYwI5iAmPT4XjIwLqRKMjr7Tb8h05eoO7dSjE39l
	WmbnwaPw==;
Received: from lan.nucleusys.com ([92.247.61.126]:54990 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pIYgr-000AnE-FO;
	Thu, 19 Jan 2023 19:26:25 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-eventlet: Upgrade 0.33.2 -> 0.33.3
Date: Thu, 19 Jan 2023 19:26:14 +0200
Message-Id: <20230119172615.1882394-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Jan 2023 17:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100664

Upgrade to release 0.33.3:

- Fix greendns for dnspython 2.3.0+

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-eventlet_0.33.2.bb => python3-eventlet_0.33.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.33.2.bb => python3-eventlet_0.33.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.33.2.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.33.2.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb
index 6348e9b76..c1256661b 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.33.2.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.33.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
-SRC_URI[sha256sum] = "82c382c2a2c712f1a8320378a9120ac9589d9f1131c36a63780f0b8504afa5bc"
+SRC_URI[sha256sum] = "722803e7eadff295347539da363d68ae155b8b26ae6a634474d0a920be73cfda"
 
 inherit pypi setuptools3
 
-- 
2.30.2


