Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 619ECC433F5
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 15:16:05 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.4887.1643037364376674762
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jan 2022 07:16:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=ZvwxHHnB;
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
	bh=NChzLTrwkeVElDhd21ftUawoxgLalXpbBOZiJjdFm8I=; b=ZvwxHHnBMtMOnaf+9QrCD0hwX6
	jDFgF6LdL+GJBF3za84lXjjzflUQS8e6RasAKkLnosMo6sCg/YPkFKJOVHkgxdvQVRo3VDrLaHheM
	lByrqIXw40MT7HDXg83pNza/SFX9yCw0GCxfDhRHehRd8JD4X08+FXoY1mobeZ+GmIfPSIg6LjDCC
	o/1fG8u+JE+x5S2MjkHQ0tdbmEPkFdQmYH2TyU65y9qpyLdVKz2KsCczTxM+uuoM/LNuAZZrzttsi
	a3CC5wzgJ6AvyQj3D+CtiBIpCGxkrFK/bqtZtsBRiQMo+WMvpyf8Ri+aBaA/lNZ5+eu905MxX9XDp
	jVBAU0fw==;
Received: from lan.nucleusys.com ([92.247.61.126]:54618 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nC14u-0009G6-1g; Mon, 24 Jan 2022 17:16:04 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-redis: Upgrade 4.0.2 -> 4.1.1
Date: Mon, 24 Jan 2022 17:15:44 +0200
Message-Id: <20220124151544.876177-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124151544.876177-1-leon.anavi@konsulko.com>
References: <20220124151544.876177-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jan 2022 15:16:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95038

Upgrade to release 4.1.1:

- Add retries to connections in Sentinel Pools
- OCSP Stapling Support
- Define incr/decr as aliases of incrby/decrby
- FT.CREATE - support MAXTEXTFIELDS, TEMPORARY, NOHL, NOFREQS,
  SKIPINITIALSCAN

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-redis_4.0.2.bb => python3-redis_4.1.1.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_4.0.2.bb => python3-redis_4.1.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.0.2.bb b/meta-python/recipes-devtools/python/python3-redis_4.1.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-redis_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-redis_4.1.1.bb
index f39a72c60..9af7383de 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.1.1.bb
@@ -4,11 +4,12 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
 
-SRC_URI[sha256sum] = "ccf692811f2c1fc7a92b466aa2599e4a6d2d73d5f736a2c70be600657c0da34a"
+SRC_URI[sha256sum] = "07420a3fbedd8e012c31d4fadac943fb81568946da202c5a5bc237774e5280a0"
 
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-cryptography \
+    ${PYTHON_PN}-packaging \
 "
-- 
2.30.2


