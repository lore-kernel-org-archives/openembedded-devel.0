Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A981C433FE
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 09:30:48 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.3217.1636104646989685859
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 02:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52016 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mivYY-0001pJ-Ix; Fri, 05 Nov 2021 11:30:43 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-wrapt: Upgrade 1.13.2 -> 1.13.3
Date: Fri,  5 Nov 2021 11:30:37 +0200
Message-Id: <20211105093037.25071-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211105093037.25071-1-leon.anavi@konsulko.com>
References: <20211105093037.25071-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 09:30:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93831

Upgrade to release 1.13.3:

- Adds wheels for Python 3.10 on PyPi and where possible also now
  generating binary wheels for musllinux.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-wrapt_1.13.2.bb => python3-wrapt_1.13.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-wrapt_1.13.2.bb => python3-wrapt_1.13.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-wrapt_1.13.2.bb b/meta-python/recipes-devtools/python/python3-wrapt_1.13.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-wrapt_1.13.2.bb
rename to meta-python/recipes-devtools/python/python3-wrapt_1.13.3.bb
index b1710fcd1e..05ee4c6356 100644
--- a/meta-python/recipes-devtools/python/python3-wrapt_1.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-wrapt_1.13.3.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fdfc019b57affbe1d7a32e3d34e83db4"
 
-SRC_URI[sha256sum] = "dca56cc5963a5fd7c2aa8607017753f534ee514e09103a6c55d2db70b50e7447"
+SRC_URI[sha256sum] = "1fea9cd438686e6682271d36f3481a9f3636195578bab9ca3382e2f5f01fc185"
 
 inherit pypi setuptools3 
 
-- 
2.17.1


