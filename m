Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34992C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:20:02 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.3802.1657095591154924142
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:19:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=kr9T3oCE;
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
	bh=bwtBdSzCC38sYpUBNbA8UGYulLlbd4TbqrbThuqHzK8=; b=kr9T3oCEqsXtvGm0TY5kvLrXK9
	gPQMSCdfITjKcySV5nlzseXLd1YwT2TVvEtk39OVR5hGiPf5rPa2KLbw7hKU/StoS4nwn0K+qY8L5
	heWuJEFjK6JCdKbW+2UrANgQv2upCixYghPoKeBr6+7LzJQH03GGuT0BZW59XNcYdaU2ediJc6N5E
	U2J++p4Dmi9eZoMBpX1HxflZxpBbAXs73uTDvrJj8vxdbSrfS5OIcjMoEDCMzQB6scvvUJq7V2sTa
	EjIchUDinpKIFIEcq93l6DBE5DGxckRkH4F2Jfh1Fbu3ykZGvMiQSdVEm78UwWBKsttQgorjT4cNX
	qe31FYgw==;
Received: from lan.nucleusys.com ([92.247.61.126]:46700 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o90HF-0000Lq-Tg;
	Wed, 06 Jul 2022 11:19:49 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/4] python3-eth-hash: Upgrade 0.3.2 -> 0.3.3
Date: Wed,  6 Jul 2022 11:19:37 +0300
Message-Id: <20220706081940.1256838-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Jul 2022 08:20:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97724

Upgrade to release 0.3.3 and add runtime dependencies:

- Keccak backend was initialized every time it was called.
  Now it's initialized only the first time it's called.
- Prune venv files from the release via MANIFEST.in

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-eth-hash_0.3.2.bb => python3-eth-hash_0.3.3.bb} | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-hash_0.3.2.bb => python3-eth-hash_0.3.3.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-hash_0.3.2.bb b/meta-python/recipes-devtools/python/python3-eth-hash_0.3.3.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-eth-hash_0.3.2.bb
rename to meta-python/recipes-devtools/python/python3-eth-hash_0.3.3.bb
index c9630b172..c4e8e5e51 100644
--- a/meta-python/recipes-devtools/python/python3-eth-hash_0.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-hash_0.3.3.bb
@@ -4,6 +4,11 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
 
-SRC_URI[sha256sum] = "3f40cecd5ead88184aa9550afc19d057f103728108c5102f592f8415949b5a76"
+SRC_URI[sha256sum] = "8cde211519ff1a98b46e9057cb909f12ab62e263eb30a0a94e2f7e1f46ac67a0"
 
 inherit pypi setuptools3
+
+RDEPENDS:${PN} = "\
+	${PYTHON_PN}-logging \
+	${PYTHON_PN}-pycryptodome \
+"
-- 
2.30.2


