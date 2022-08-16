Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9242CC25B0E
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 13:08:58 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.15165.1660655332451717082
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 06:08:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=o8XjytW3;
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
	bh=B5paUd6eGKxFTn/uk2qBC2Abhxv0fO4j+Nw8OCI2MtM=; b=o8XjytW3jzuKatyAwG5fw5ULvT
	FkbGv8aIX7THesbD7aKkVjXiNPZM0pDXyWML42wCqfxl/lT7eCuPj9JHhB8LExbuV8zIrSiUt+6W+
	qeoyn07cRBHB2eh2TNVP2jiSvaOfbzYDvM9uaPu0PSjZRHPPiaSvwRDQh+f9n8Qzi6R1Oo786ROMt
	eV3LnRJ8ObgL2rVgjmFsg7sJtCqmJRfWI+olobcyupekdSoY0aMPkMzbDuzh5d9wxuvglNt+MvqyJ
	39Y7b0SZqULK/ddviQRpBrjFUirdLb1kf7jKqqbEgfzf+WgFDQOgHFXQ8mUl+QzuovQ24ktqSNxB9
	GkQs9t+w==;
Received: from lan.nucleusys.com ([92.247.61.126]:59550 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oNwKs-0008MD-QC;
	Tue, 16 Aug 2022 16:08:50 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-aiohue: Upgrade 4.4.2 -> 4.5.0
Date: Tue, 16 Aug 2022 16:08:42 +0300
Message-Id: <20220816130842.1011891-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Aug 2022 13:08:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98262

Upgrade to release 4.5.0:

- Add support for new Hue Tap Dial (relative rotary)
- Fix KeyError on fake Hue bridges
- Add monitor configuration type
- Updated rate limit statuscode

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-aiohue_4.4.2.bb => python3-aiohue_4.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_4.4.2.bb => python3-aiohue_4.5.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_4.4.2.bb b/meta-python/recipes-devtools/python/python3-aiohue_4.5.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohue_4.4.2.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_4.5.0.bb
index 63d29a48f..7507b8ffd 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_4.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_4.5.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "871c27da3d5a5b7d7c5049e6d23713425a2f251639ff1fb5fac460724ba42f15"
+SRC_URI[sha256sum] = "9a5aaf2fa97a889746142093e74143d5e3e02209fae428d1e2dbcc34a5c36efd"
 
 inherit pypi setuptools3
 
-- 
2.30.2


