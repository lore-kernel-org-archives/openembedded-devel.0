Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F5AC433FE
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 19:05:59 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.206.1636743959098386963
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Nov 2021 11:05:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from lan.nucleusys.com ([92.247.61.126]:53236
 helo=lootbox.konsulko.bg)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mlbs1-0006tw-O5; Fri, 12 Nov 2021 21:05:54 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/6] python3-elementpath: Upgrade 2.3.2 -> 2.4.0
Date: Fri, 12 Nov 2021 21:05:45 +0200
Message-Id: <20211112190547.4560-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211112190547.4560-1-leon.anavi@konsulko.com>
References: <20211112190547.4560-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Nov 2021 19:05:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93921

Upgrade to release 2.4.0:

- Fix type annotations and going strict on parsers and other
  public classes
- Add XPathConstructor token class (subclass of XPathFunction)
- Last release for Python 3.6

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-elementpath_2.3.2.bb => python3-elementpath_2.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_2.3.2.bb => python3-elementpath_2.4.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.3.2.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.4.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-elementpath_2.3.2.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_2.4.0.bb
index 4c94d9378..ed55077e3 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_2.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_2.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "392f32a5efdf15c14f3f56ef8422364f8b0a74a12f51a66d9c903c172fe3594b"
+SRC_URI[sha256sum] = "5b6801b3be94d48d213beb7b8ebad96addb35c95fc6a9c062c80e033b4a32fe8"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.20.1


