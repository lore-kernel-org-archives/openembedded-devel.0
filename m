Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D81C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 18:35:47 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.1290.1642012545496809962
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jan 2022 10:35:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=cW7aFL6I;
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
	bh=+wp2cBMJsTJBQEGhOaah7ssH0UdtHc9ysO7CWdRIvzA=; b=cW7aFL6I6XO2rf8k6E74/Yw4Vv
	qpVDlgdSE/fxdiGbG2deGmTFfENnfKoKn74Gq50hCs1exYoiiHIVNPPqOCS3wxX474hRk8rxqko4G
	yxcA4zhP+viviBAGGqeLGwTxbITaKNuvnef5P0CMwK7XqHB+kgHIcAdeas+S8Sf4BJOPHp4axGeGv
	7obsx4ODmaPyRzqEwVaMHpkft53Ot4tWOO6Kk+9e7kkJqLAP60IUJ+08Ajok1BeTUVcSuLvL34q+S
	IN5ppmg4TI17PgWDL7DWx0CfTkgST6koYsezcSksxj8euLX7k5hGQraba7CrNWlc7YQwdT7jEHl3T
	uxeFj24A==;
Received: from lan.nucleusys.com ([92.247.61.126]:48040 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n7iVB-000Bc0-1f; Wed, 12 Jan 2022 20:35:43 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-asyncio-throttle: Add recipe
Date: Wed, 12 Jan 2022 20:35:27 +0200
Message-Id: <20220112183531.2712341-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-1.0
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
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jan 2022 18:35:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94789

Add asyncio-throttle: a simple, easy-to-use throttler for asyncio.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-asyncio-throttle_1.0.2.bb             | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb b/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb
new file mode 100644
index 000000000..1f907511a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-asyncio-throttle_1.0.2.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "Simple, easy-to-use throttler for asyncio."
+HOMEPAGE = "https://github.com/hallazzang/asyncio-throttle"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c7906e56b70808e1ade6ca05e0bb48d5"
+
+SRC_URI[sha256sum] = "2675282e99d9129ecc446f917e174bc205c65e36c602aa18603b4948567fcbd4"
+
+inherit pypi setuptools3
-- 
2.30.2


