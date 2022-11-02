Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE72CC433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 14:55:05 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.7272.1667400895782422479
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Nov 2022 07:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=IdyicWa1;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=b9MEmjcQVtiYtJMUTdnIEcJCltYb2SW11IPLJBT2UEg=; b=IdyicWa1EVCoLuRBVLxQZkat/t
	Rs7OQR/aMsYx9U3kRxb1nZqcp5aVxQuzXnvNjZxrqnaRtgTxrJhxbwVaUdzMYiAbR9yrzfqLvF9Cv
	o5Rusd5p1xr0Uaf9wmCNkGODSUCRLSQpD66FXJ7dMxl29gPBP6bB+qB7LGrLquw6gwb6gpND/vuBP
	Vn8Jmfg75eQrP0D5jgO6ASyCoGASNcdhKPvmv1s3a3/nbfPmhiXCLvBEC8PL7byYFA7En3cBTZ1sS
	+9wlVUKbOC8sttjYYYrID2lS8zz2BnP44t2/ZwQ6+2qODRQS1Vh0jsquLHqdCS8N92Q0Hq6ZZ2DNR
	8mja6ygw==;
Received: from lan.nucleusys.com ([92.247.61.126]:44148 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oqFAI-0004Ql-Qv;
	Wed, 02 Nov 2022 16:54:54 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-imageio: Upgrade 2.22.2 -> 2.22.3
Date: Wed,  2 Nov 2022 16:54:39 +0200
Message-Id: <20221102145441.3101891-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 14:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99420

Upgrade to release 2.22.3:

- Support compression and compressionargs in tifffile plugin

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-imageio_2.22.2.bb => python3-imageio_2.22.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.22.2.bb => python3-imageio_2.22.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.22.2.bb b/meta-python/recipes-devtools/python/python3-imageio_2.22.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.22.2.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.22.3.bb
index 272ec4b61..9b1be658f 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.22.2.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.22.3.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "db7010cd10712518819a4187baf61b05988361ea20c23e829918727b27acb977"
+SRC_URI[sha256sum] = "63f007b7f2a082306e36922b3fd529a7aa305d2b78f46195bab8e22bbfe866e9"
 
 inherit pypi setuptools3
 
-- 
2.30.2


