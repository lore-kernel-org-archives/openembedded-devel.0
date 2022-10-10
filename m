Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E73C4332F
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 14:43:35 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.7068.1665413010772540685
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Oct 2022 07:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=fdE+Xpjm;
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
	bh=UbPo/ObWWIHRIEPiJKOpipsrUGM92FrkKu7WP1ZWxeQ=; b=fdE+XpjmBfSKGUR+kdPSzdJII5
	PggUVSfvxfAfnber6woKJLAu3ZjtM6aQWAqVnMHivJ5X6yyVs6d/hXSNLff16a9VM5nI2PV38VLjB
	L9IR8LP9EKtfML1BI+/isUWu9ewdbuwzMk65AtJPwmYCs3D+rWfy7TxCFcMNglO1tLMwQiJpvEADQ
	pDVDHY88tdUbABzX13uIh9RtkApHdmBC25SF8wUx8osEWJsQBaqdZGM5ojCCdq/FmB9zGWhi+3zcM
	jQmQHFtKKHaZ+ZT2qAGcm5NbgfmBEpgIlUqcgEo2yhuuIMFTPRBsFoOv0UptwskMj8efhJ9pf1Fwf
	845CoSxw==;
Received: from lan.nucleusys.com ([92.247.61.126]:49634 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1ohu0O-0000vn-U9;
	Mon, 10 Oct 2022 17:43:29 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-astroid: Upgrade 2.12.10 -> 2.12.11
Date: Mon, 10 Oct 2022 17:43:19 +0300
Message-Id: <20221010144320.3908330-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Oct 2022 14:43:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99130

Upgrade to release 2.12.11:

- Improve detection of namespace packages for the modules with
  __spec__ set to None.
- Fixed a regression in the creation of the __init__ of dataclasses
  with multiple inheritance.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.12.10.bb => python3-astroid_2.12.11.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.12.10.bb => python3-astroid_2.12.11.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.12.10.bb b/meta-python/recipes-devtools/python/python3-astroid_2.12.11.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.12.10.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.12.11.bb
index c1d746b89..b9dc58082 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.12.10.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.12.11.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "81f870105d892e73bf535da77a8261aa5bde838fa4ed12bb2f435291a098c581"
+SRC_URI[sha256sum] = "2df4f9980c4511474687895cbfdb8558293c1a826d9118bb09233d7c2bff1c83"
 
 inherit pypi setuptools3
 
-- 
2.30.2


