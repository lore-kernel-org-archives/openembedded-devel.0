Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1576C54EBC
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 10:56:34 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web11.101204.1673348185364266628
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 02:56:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=MjmZegxM;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=SKYn4h9dHhMK8l0O+RwvABtZHVWzmRCXi+dOnxXW4o0=; b=MjmZegxM1wdzPfsqyESJJWe0h6
	15TEYeiB6TDP0nxCq2MXKOrDekoLLBBx9qcC+P97/OzWfNgU1jUF9Mb8YYG0FFeNlBQh/ulndEhBM
	yT2o37JKYu8Li74rWT/LuiQrDFvbJS/ZXS80YrAvu1dNUXbSbrg07w/8srQzGBl+Y7sLfTsJweAYz
	3B5fTDcGoZBPN/CXd9+kuty7wDmcgYpcvh7CFwOEWvk3V+Q/wz0rDc2Cd/XKMpJl6/abpX3PS8ud7
	Q0jgJ1g1VRGd5tUZwgAZ8cM8ZuiKEtIqTvgFSqoL+Mc4w1wn3QkW4eTUMAIJfd/PQzEoHM4/6NGi8
	8Ch6gK9Q==;
Received: from lan.nucleusys.com ([92.247.61.126]:53480 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1pFCIo-0009km-Jl;
	Tue, 10 Jan 2023 12:56:24 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-cantools: Upgrade 38.0.0 -> 38.0.1
Date: Tue, 10 Jan 2023 12:56:09 +0200
Message-Id: <20230110105609.56178-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230110105609.56178-1-leon.anavi@konsulko.com>
References: <20230110105609.56178-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jan 2023 10:56:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100519

Upgrade to release 38.0.1:

- Changed relative links to absolute links

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cantools_38.0.0.bb => python3-cantools_38.0.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_38.0.0.bb => python3-cantools_38.0.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_38.0.0.bb b/meta-python/recipes-devtools/python/python3-cantools_38.0.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_38.0.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_38.0.1.bb
index 96e193d4f..c11606351 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_38.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_38.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "b7d5465aba357ce4c103a7d38c9e01a6f12d8265090b4147b3cc1fa4c3adb993"
+SRC_URI[sha256sum] = "be391520a43c8041ba99839a00a0a61b7afa929387def6c6348a9626b99f24d7"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.30.2


