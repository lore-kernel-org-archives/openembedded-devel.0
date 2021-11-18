Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6A3C433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 12:37:46 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web10.942.1637239064727950699
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 04:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=Q97dBnBe;
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
	bh=jo5CzGizG7pnsHSEMc7UrOm0ZYwQ15qmzbcH7/5TW4k=; b=Q97dBnBea8Cc0OxiYzLojBUbyI
	jZjgQ8r8ai+OY+MNbPv7SH+jyHaHYvcZySBx3crxPceJrqQrIYy/z/q7PLpAD94g5mo1dgrgF0cxy
	8nKs8mDEhxcg7NZ1lT9wSEI+Z1UWGZckXFyvt4lBdJgsKsCx7JQCUhVxCo1kDl++rJ3XRebo6odVq
	snaBRgBbB4AqVCS3Be15eQMqBa33AZFV83Da3XQHzZ1j6vdi1NoohMtAqNsNqmKb1Gheb0z6SQAd1
	JYvUyvq9bMMmDum1WqADxuWwtgLpBTfHCJIGcue4d+uk+LDP798xUibb34esr/9OBf0AJY56dAk6V
	QBBnJONw==;
Received: from lan.nucleusys.com ([92.247.61.126]:60154
 helo=lootbox.konsulko.bg)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mnenW-0007sV-0U; Thu, 18 Nov 2021 14:37:42 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-jedi: Upgrade 0.18.0 -> 0.18.1
Date: Thu, 18 Nov 2021 14:37:27 +0200
Message-Id: <20211118123727.45056-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211118123727.45056-1-leon.anavi@konsulko.com>
References: <20211118123727.45056-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 12:37:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94025

Upgrade to release 0.18.1:

- Implict namespaces are now a separate types in Name().type
- Python 3.10 support
- Mostly bugfixes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-jedi_0.18.0.bb => python3-jedi_0.18.1.bb} | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jedi_0.18.0.bb => python3-jedi_0.18.1.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-jedi_0.18.0.bb b/meta-python/recipes-devtools/python/python3-jedi_0.18.1.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-jedi_0.18.0.bb
rename to meta-python/recipes-devtools/python/python3-jedi_0.18.1.bb
index 0ea5b46b8..fb582c54b 100644
--- a/meta-python/recipes-devtools/python/python3-jedi_0.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-jedi_0.18.1.bb
@@ -6,8 +6,15 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5ed06eebfcb244cd66ebf6cef9c23ab4"
 
 PYPI_PACKAGE = "jedi"
 
-SRC_URI[sha256sum] = "92550a404bad8afed881a137ec9a461fed49eca661414be45059329614ed0707"
+SRC_URI[sha256sum] = "74137626a64a99c8eb6ae5832d99b3bdd7d29a3850fe2aa80a4126b2a7d949ab"
 
-RDEPENDS:${PN} = "${PYTHON_PN}-parso"
+RDEPENDS:${PN} = " \
+	${PYTHON_PN}-parso \
+	${PYTHON_PN}-core \
+	${PYTHON_PN}-compression \
+	${PYTHON_PN}-pydoc \
+	${PYTHON_PN}-compile \
+	${PYTHON_PN}-json \
+"
 
 inherit setuptools3 pypi
-- 
2.20.1


