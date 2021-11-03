Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B93C4332F
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 12:12:03 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.6533.1635941522420108343
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
	id 1miF7V-0005MY-2u; Wed, 03 Nov 2021 14:11:58 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-astroid: Upgrade 2.8.2 -> 2.8.4
Date: Wed,  3 Nov 2021 14:11:48 +0200
Message-Id: <20211103121150.28596-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211103121150.28596-1-leon.anavi@konsulko.com>
References: <20211103121150.28596-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Nov 2021 12:12:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93804

Upgrade to release 2.8.4:

- Fix the ``scope()`` and ``frame()`` methods of ``NamedExpr``
  nodes. When these nodes occur in ``Arguments``, ``Keyword``  or
  ``Comprehension`` nodes these methods now correctly point to the
  outer-scope of the ``FunctionDef``, ``ClassDef``, or
  ``Comprehension``.
- Fix the ``set_local`` function for ``NamedExpr`` nodes.
  When these nodes occur in ``Arguments``, ``Keyword``, or
  ``Comprehension`` nodes these nodes are now correctly added to
  the locals of the ``FunctionDef``, ``ClassDef``, or
  ``Comprehension``.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.8.2.bb => python3-astroid_2.8.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.8.2.bb => python3-astroid_2.8.4.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.8.2.bb b/meta-python/recipes-devtools/python/python3-astroid_2.8.4.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.8.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.8.4.bb
index f465ba992d..1d2767fba1 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.8.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "304e99c129794f2cfda584a12b71fde85205da950e2f330f4be09150525ae949"
+SRC_URI[sha256sum] = "1e83a69fd51b013ebf5912d26b9338d6643a55fec2f20c787792680610eed4a2"
 
 inherit pypi setuptools3
 
-- 
2.17.1


