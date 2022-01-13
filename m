Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966A9C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 13:26:02 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.8472.1642080360313331652
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 05:26:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=HI3WlpaS;
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
	bh=1M1NZKdY3UkqqygjCVFtcIeZcjpZHydeOG+bOF/8gGc=; b=HI3WlpaSC1wAcI9dSc+FDA3UGe
	6TGpD4W2in93SE39lJ8zGIwDaq4QBIAS1iv10fQrnSChzbzN78onFVDMaawwFlZj4cFbN/QGtf7J/
	0QH2Uju5YAeEkNKRrR3tICt4beXA0UzrXjhD55oc/YEZ11sImM3zK5lYukkmJfqFmIJiF281sFxMD
	1A2lgcVdE2QY9m+ffb5zyLDPL0w00053V8HYTGfz8pRIlR7mnLCnA/xgLF/E8XOGFEPwmSRf+R091
	5+dupdkkQuaaPA4Mq8W3P31gD22+tGDlGv082EwAsAM1N0xbB9BlIMvCSKHrHqoPJDYJQRalNatQ7
	SYUCTbpg==;
Received: from lan.nucleusys.com ([92.247.61.126]:51702 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n8073-00068z-Hm; Thu, 13 Jan 2022 15:25:59 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-wtforms: Upgrade 3.0.0 -> 3.0.1
Date: Thu, 13 Jan 2022 15:25:43 +0200
Message-Id: <20220113132544.779928-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220113132544.779928-1-leon.anavi@konsulko.com>
References: <20220113132544.779928-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Jan 2022 13:26:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94807

Upgrade to release 3.0.1:

- Fixed :class:`~fields.DateTimeField` and other similar fields
  can handle multiple formats
- Stop support for python 3.6

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-wtforms_3.0.0.bb => python3-wtforms_3.0.1.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wtforms_3.0.0.bb => python3-wtforms_3.0.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-wtforms_3.0.0.bb b/meta-python/recipes-devtools/python/python3-wtforms_3.0.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-wtforms_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-wtforms_3.0.1.bb
index c72af7451..36a0191dc 100644
--- a/meta-python/recipes-devtools/python/python3-wtforms_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-wtforms_3.0.1.bb
@@ -3,10 +3,9 @@ HOMEPAGE = "https://pypi.python.org/pypi/WTForms"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 
-
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d"
 
-SRC_URI[sha256sum] = "4abfbaa1d529a1d0ac927d44af8dbb9833afd910e56448a103f1893b0b176886"
+SRC_URI[sha256sum] = "6b351bbb12dd58af57ffef05bc78425d08d1914e0fd68ee14143b7ade023c5bc"
 
 PYPI_PACKAGE = "WTForms"
 
-- 
2.30.2


