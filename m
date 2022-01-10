Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8514C4332F
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 19:38:36 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.36938.1641843514805151623
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 11:38:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=trKdphyz;
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
	bh=95N611K9l8D6W4SfE2wkpaF5U9jw4z5f5OVW9d/q9lA=; b=trKdphyzFsnrGd4CTBx92q8jS3
	WQWy6U3GXWjSGVqqJJBaU4pDLtTgioX2HHKtyD/lOhdLSy+krJ5WofDoVoQhAk5xEya16uYh1dLwG
	CVZMsD8N1iVIjAlZAUYtro2WsiJDt+343ViyUM4FSN1Nkbx0tpg41KgHOPdr5RPNsrEaGKdHphsMk
	4nMY075ng4w14d7X8W7C0ovY3VZglbh+OZQ8doiwy2+uXH6ZywPxx5goIIIumXakvQlXWlkcidhgx
	TBbI3/CuYdgaB4scMDpv6mCeksFUVErVtHlACkMyWK1vGsvrKD/FFedc/GKuSYns6KWXhXpmuv/89
	4SurqrNg==;
Received: from lan.nucleusys.com ([92.247.61.126]:51302 helo=lootbox.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n70We-0009id-Nt; Mon, 10 Jan 2022 21:38:29 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-google-api-core: Upgrade 2.2.0 ->
 2.3.2
Date: Mon, 10 Jan 2022 21:38:11 +0200
Message-Id: <20220110193815.103592-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
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
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 19:38:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94724

Upgrade to release 2.3.2:

- add operations rest client to support long-running operations
- handle bare 'grpc.Call' in 'from_grpc_error'

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...oogle-api-core_2.2.0.bb => python3-google-api-core_2.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.2.0.bb => python3-google-api-core_2.3.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.2.0.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.3.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.3.2.bb
index d6293613b..c43fa4c58 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.3.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "dca67b5e369a5127ec00c8ea02de48517e39c1aad882e2e6d85da8050520cab6"
+SRC_URI[sha256sum] = "c8889f45cf58deca522888ae1d39b2a25e93e7d1b019ae8cee6456d5c726a40c"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.30.2


