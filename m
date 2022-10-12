Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AB61C433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 13:06:39 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.20169.1665579995647586631
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Oct 2022 06:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=c/bBXcQ5;
 spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=jFF1KmBX3AtHDdkifCC8nEf08Nb/B2EA+0y28EgYpl8=; b=c/bBXcQ5KokZTWkj8CfcqdDCu2
	GRc1k4scs4k4Ondr7z8IYoewOik8lHe1yg4hjfz3v3eXD+J2fpbMxrd0kAT43DAqxqMDVfwqesBgr
	hiY8k72DiYyrxpw1jujgjP7Hn7TjQuCi9dRxoPfjcs/h1jxl+jo2s7l07h0nIk4B9zEel4CvuaKGg
	Lh3gkWRBN1i0esgKRVryehZ116IjVTCnf92q8vJJ8wAVf5cBydCGdnCf/RaZHPmzDn/9jc/T4tsNF
	WqQ+lod1ha2fwxUV/1ixvg0DYEzxm/qElHkHTAYOycK+W6ElFtHwanGDaSxRD2qOvGdF2/ouqZ367
	KGjdnUkw==;
Received: from lan.nucleusys.com ([92.247.61.126]:48086 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oibRQ-0002Bt-Fq;
	Wed, 12 Oct 2022 16:06:34 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-xmltodict: Upgrade 0.12.0 -> 0.13.0
Date: Wed, 12 Oct 2022 16:06:24 +0300
Message-Id: <20221012130624.1336826-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221012130624.1336826-1-leon.anavi@konsulko.com>
References: <20221012130624.1336826-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 13:06:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99145

Upgrade to release 0.13.0:

- Add install info to readme for openSUSE
- Support defaultdict for namespace mapping
- parse(generator) is now possible
- Processing comments on parsing from xml to dict
- Add expand_iter kw to unparse to expand iterables
- Add support for python3.8
- Drop Jython/Python 2 and add Python 3.9/3.10
- Do not use len() to determine if a sequence is empty
- Add more namespace attribute tests
- Fix encoding issue in setup.py

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...3-xmltodict_0.12.0.bb => python3-xmltodict_0.13.0.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xmltodict_0.12.0.bb => python3-xmltodict_0.13.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-xmltodict_0.12.0.bb b/meta-python/recipes-devtools/python/python3-xmltodict_0.13.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-xmltodict_0.12.0.bb
rename to meta-python/recipes-devtools/python/python3-xmltodict_0.13.0.bb
index 1d871b2d3..aadf8b7f4 100644
--- a/meta-python/recipes-devtools/python/python3-xmltodict_0.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-xmltodict_0.13.0.bb
@@ -4,8 +4,7 @@ HOMEPAGE = "https://github.com/martinblech/xmltodict"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=01441d50dc74476db58a41ac10cb9fa2"
 
-SRC_URI[md5sum] = "ddb2bd078cef4f7e3021a578034ad941"
-SRC_URI[sha256sum] = "50d8c638ed7ecb88d90561beedbf720c9b4e851a9fa6c47ebd64e99d166d8a21"
+SRC_URI[sha256sum] = "341595a488e3e01a85a9d8911d8912fd922ede5fecc4dce437eb4b6c8d037e56"
 
 PYPI_PACKAGE = "xmltodict"
 
@@ -15,6 +14,12 @@ SRC_URI += " \
 	file://run-ptest \
 "
 
+RDEPENDS:${PN} += " \
+	${PYTHON_PN}-core \
+	${PYTHON_PN}-xml \
+	${PYTHON_PN}-io \
+"
+
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
 "
-- 
2.30.2


