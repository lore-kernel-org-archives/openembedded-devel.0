Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C78AC6FA90
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 10:38:28 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web09.4520.1663324703239638425
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 Sep 2022 03:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=G07b8Dgm;
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
	bh=pHPgVOhybDUgMFQq4TRY7rDG9lRA71Qy98lnNDR9ZBM=; b=G07b8DgmO8xHOFIeZ3JRJOSWnQ
	H5nbUxGWsfdrxWUuaYn9S+/ekUN+qzm9Gsg/E2wlNNDnkooqNB1HkXHBwy07b1dF1lBPtyKO3nVAm
	BKKGf5l0WZs3JK2Td5TrnEInIkikr69vPi03Y+kWZWGUzOdz00xwkDGDbeG+IALOYhKQeYVyI2cNE
	k+op1GTfNnBxQ58LbNxNoi7nkjY6nDN7rKU6UtbinUeX1ktM/nFTy8gE/tnBatkZo/VFucnp48d2y
	0oVHgZ+/qBDwDpK5sSyEjGDg6vx9Uy1lF3Dl496lk/eQLvNAz53gWDRjVIwNETmNxcJCkxlYnF/TQ
	f4lvS0aw==;
Received: from lan.nucleusys.com ([92.247.61.126]:49096 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1oZ8js-0005VH-VF;
	Fri, 16 Sep 2022 13:38:22 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-elementpath: Upgrade 3.0.1 -> 3.0.2
Date: Fri, 16 Sep 2022 13:38:00 +0300
Message-Id: <20220916103800.573091-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220916103800.573091-1-leon.anavi@konsulko.com>
References: <20220916103800.573091-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Sep 2022 10:38:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98834

Upgrade to release 3.0.2:

- Extend root concept to subtrees used as root (e.g. XSD 1.1
  assertions)
- Begin XPath 3.1 implementation adding XPathMap and XPathArray

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...n3-elementpath_3.0.1.bb => python3-elementpath_3.0.2.bb} | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_3.0.1.bb => python3-elementpath_3.0.2.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_3.0.1.bb b/meta-python/recipes-devtools/python/python3-elementpath_3.0.2.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-elementpath_3.0.1.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_3.0.2.bb
index 13468ebff..661259f46 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_3.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_3.0.2.bb
@@ -3,13 +3,17 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "a75eed5aad3dad92ba577b1f3a268d8c3c98ceeda91cb8abae4269e920e7c8f6"
+SRC_URI[sha256sum] = "cca18742dc0f354f79874c41a906e6ce4cc15230b7858d22a861e1ec5946940f"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-xml \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-numbers \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-stringold \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


