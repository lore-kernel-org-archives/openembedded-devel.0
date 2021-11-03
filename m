Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86B8C433EF
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 12:12:02 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6543.1635941521389716534
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Nov 2021 05:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=42766 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1miF7S-0005MY-OE; Wed, 03 Nov 2021 14:11:56 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-pint: Upgrade 0.17 -> 0.18
Date: Wed,  3 Nov 2021 14:11:46 +0200
Message-Id: <20211103121150.28596-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Nov 2021 12:12:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93803

Upgrade to release 0.18:

- Implement use of Quantity in the Quantity constructor (convert
  to specified units).
- Rename .readthedocs.yml to .readthedocs.yaml, update MANIFEST.in
- Fix a few small typos.
- Fix babel format for `Unit`.
- Fix handling of positional max/min arguments in clip function.
- Fix string formatting of numpy array scalars.
- Fix default format for Measurement class
- Fix parsing of pretty units with same exponents but different
  sign.
- Convert the application registry to a wrapper object.
- Add documentation for the string format options.
- Support custom units formats.
- Autoupdate pre-commit hooks.
- Improved the application registry.
- Improved testing isolation using pytest fixtures.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pint_0.17.bb => python3-pint_0.18.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.17.bb => python3-pint_0.18.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.17.bb b/meta-python/recipes-devtools/python/python3-pint_0.18.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pint_0.17.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.18.bb
index 6642f4b9b1..a7a1384da1 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.17.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.18.bb
@@ -10,7 +10,7 @@ PYPI_PACKAGE := "Pint"
 
 inherit pypi ptest setuptools3
 
-SRC_URI[sha256sum] = "f4d0caa713239e6847a7c6eefe2427358566451fe56497d533f21fb590a3f313"
+SRC_URI[sha256sum] = "8c4bce884c269051feb7abc69dbfd18403c0c764abc83da132e8a7222f8ba801"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.17.1


