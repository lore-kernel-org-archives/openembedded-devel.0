Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F95CC433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 17:47:48 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.9857.1641577666052987418
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 09:47:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=X3AuD7Xg;
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
	bh=q/vCTyh2OMnNlntQxahdthWvhzcK+MCGp7HYnOz5uv4=; b=X3AuD7XgC1WKdkIe+/PJW5d1it
	0qRgwEHTiPIUZIyCTjcnCZLpTF8GJ+xq883yDtE1bW1fgCVg8EqyyGZRrCypw5QPi5nQIbmj6GkkC
	uiWFaQZhUmzEtlLkBPbOoVaP46TPZzEajC0Tc4q70lgS+VWB3AABA1DJoNEBUJHRblR2tDrQjNtWX
	rJVm8N/x5i5WvngbzEuiomXaPsFQcJLaBqiwvBD/OESuGz3Cwz7JnKeYWFVJXiy52hlr6ACDnNYGc
	ZZZ+OIhZiYhhbdi2eXOAkc2sfqjg34i6/KBHf5ZJUeoAIhkECDWQT9D3UUsxrrU+CUaH8WpFUGZWm
	aLmW8c/g==;
Received: from lan.nucleusys.com ([92.247.61.126]:48914 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n5tMe-0000YW-Jc; Fri, 07 Jan 2022 19:47:46 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-ujson: Upgrade 5.0.0 -> 5.1.0
Date: Fri,  7 Jan 2022 19:47:27 +0200
Message-Id: <20220107174730.3326962-2-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 17:47:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94693

Upgrade to release 5.1.0:

- Strip debugging symbols from Linux binaries

Add INSANE_SKIP for already-stripped to avoid build errors due to
the stripped debugging symbols from Linux binaries in this release.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-ujson_5.0.0.bb => python3-ujson_5.1.0.bb}       | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.0.0.bb => python3-ujson_5.1.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.0.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.1.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-ujson_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.1.0.bb
index fb1bcd761..821eba58c 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.1.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
 
-SRC_URI[sha256sum] = "3ff7242816b1d22c08c04c4c6db0f6ba7c16cd624ce38534c1025defa011e50e"
+SRC_URI[sha256sum] = "a88944d2f99db71a3ca0c63d81f37e55b660edde0b07216fb65a3e46403ef004"
 
 inherit pypi ptest setuptools3
 
@@ -31,3 +31,6 @@ do_install_ptest() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+# Debugging symbols have been stripped from Linux binaries since release 5.1.0
+INSANE_SKIP:${PN} += "already-stripped"
-- 
2.30.2


