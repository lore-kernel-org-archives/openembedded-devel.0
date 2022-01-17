Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AD1C433EF
	for <webhook@archiver.kernel.org>; Mon, 17 Jan 2022 18:05:19 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.897.1642442718069410904
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jan 2022 10:05:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=YJzGppEq;
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
	bh=iLcBAxmT2Jsd2etvSv6KiRaR+SreSJ9/pvhBvLGz5RA=; b=YJzGppEqbGHX/E0Ajiu+sXmXEM
	wvzfjnO3CT28QmRVoMhFdmWw2OBYnj+4eq/CB0G4Nx1F0wic3na3tSoBKiGPYZ1wxv4fXL1VoNwUV
	pBbknr3MfmuKIej5D2hIgsSuPBBy2XLmfr6gQUqDrI48fhRNB64dgyJt1BiuwGMnlNy7YDHzyHHvL
	/veGIOZNVv4GOz6JAx6xuOEUGP6hHaLoREBNYTlu6kW0ufspyQOpcwVHRDiEPG9neoFgjgrrrP34M
	hEYNAZJlY9v1Zl0seJC9UizPjW8hbb3AiulrbD0Yy7VSYJseUlWTABtaJM0DzMkthS8UgegeQI7wJ
	Di7vcORQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:57514 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n9WNq-0006Ib-L3; Mon, 17 Jan 2022 20:05:18 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-jsmin: Upgrade 3.0.0 -> 3.0.1
Date: Mon, 17 Jan 2022 20:05:04 +0200
Message-Id: <20220117180505.571730-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220117180505.571730-1-leon.anavi@konsulko.com>
References: <20220117180505.571730-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jan 2022 18:05:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94903

Upgrade to release 3.0.1:

- Bump (patch) version

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-jsmin_3.0.0.bb => python3-jsmin_3.0.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-jsmin_3.0.0.bb => python3-jsmin_3.0.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-jsmin_3.0.0.bb b/meta-python/recipes-devtools/python/python3-jsmin_3.0.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-jsmin_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-jsmin_3.0.1.bb
index 733c9639c..51b17066e 100644
--- a/meta-python/recipes-devtools/python/python3-jsmin_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jsmin_3.0.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3a3301ce2ad647e172f4a1016c67324d"
 
 inherit setuptools3 pypi ptest
-SRC_URI[sha256sum] = "88fc1bd6033a47c5911dbcada7d279c7a8b7ad0841909590f6a742c20c4d2e08"
+SRC_URI[sha256sum] = "c0959a121ef94542e807a674142606f7e90214a2b3d1eb17300244bbb5cc2bfc"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.2


