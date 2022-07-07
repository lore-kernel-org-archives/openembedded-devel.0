Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BF1C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 09:47:23 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.3654.1657187232533978589
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 02:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=rVF435qb;
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
	bh=BPfYvVILQQDE2Ec90RW/2pHf69WGlE3Z3E3guIaHlmk=; b=rVF435qbJJUbr4n4YtUlCtoPxj
	WpaHb5XSldvmGJH9wzW4Ab/PhktZ+MgZxUjXDHEQncSsH2RizGzI0pYh+HlFGX99DsowDDQyp6yu8
	EcTY1sthMGhT96Gt7wVZRL6RjxEZ+6dr6WriLcLMTEXjyzpA0qOz/pY2X/af588Kw5x2Z/RA3LWdL
	0ispZOc2288u5hTB7FGo5XxhsqrO9bafZwgtplI+9U2vEOw5nBD3mz+2aOlogMm1XXdy+T+RgCI3z
	X4VardgJCzN9Ep5ZNB6+JA3T73qWdPO+YloJCchPwnGqpBAN0BQLKvXSLXOVsnrVv7xTIebK77WZA
	hm5/VPUQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:48688 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1o9O7Q-0004Fc-AO;
	Thu, 07 Jul 2022 12:47:11 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-pychromecast: Upgrade 12.1.3 ->
 12.1.4
Date: Thu,  7 Jul 2022 12:46:51 +0300
Message-Id: <20220707094651.1716295-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220707094651.1716295-1-leon.anavi@konsulko.com>
References: <20220707094651.1716295-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 09:47:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97773

Upgrade to release 12.1.4 and add runtime dependencies:

- Improve timeout logs
- pin to protobuf v3

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...3-pychromecast_12.1.3.bb => python3-pychromecast_12.1.4.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_12.1.3.bb => python3-pychromecast_12.1.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_12.1.3.bb b/meta-python/recipes-devtools/python/python3-pychromecast_12.1.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-pychromecast_12.1.3.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_12.1.4.bb
index bbed92150..69372060b 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_12.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_12.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "edd67b6d23d5d064a56c97cd90ea661fa8ffd76720bf199b5a126c6869f81e01"
+SRC_URI[sha256sum] = "9e57dc985a4a05db5bdcd5da219cbf6ced25548ca093f8d74bc107b3c554ec00"
 
 PYPI_PACKAGE = "PyChromecast"
 
@@ -15,4 +15,5 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-requests \
     ${PYTHON_PN}-protobuf \
+    ${PYTHON_PN}-compression \
 "
-- 
2.30.2


