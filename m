Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9FFCC43217
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 19:06:00 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.228.1636743960311308080
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Nov 2021 11:06:00 -0800
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
	id 1mlbs2-0006tw-Nj; Fri, 12 Nov 2021 21:05:56 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/6] python3-astroid: Upgrade 2.8.4 -> 2.8.5
Date: Fri, 12 Nov 2021 21:05:46 +0200
Message-Id: <20211112190547.4560-5-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Nov 2021 19:06:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93922

Upgrade to release 2.8.5:

- Use more permissive versions for the typed-ast dependencie
  (<2.0 instead of <1.5)
- Fix crash on inference of __len__.
- Added missing kind (for Const) and conversion (for
  FormattedValue) fields to repr.
- Fix crash with assignment expressions, nested if expressions and
  filtering of statements
- Fix incorrect filtering of assignment expressions statements

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-astroid_2.8.4.bb => python3-astroid_2.8.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.8.4.bb => python3-astroid_2.8.5.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.8.4.bb b/meta-python/recipes-devtools/python/python3-astroid_2.8.5.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-astroid_2.8.4.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.8.5.bb
index 1d2767fba..f8f050cab 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.8.4.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.8.5.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "1e83a69fd51b013ebf5912d26b9338d6643a55fec2f20c787792680610eed4a2"
+SRC_URI[sha256sum] = "11f7356737b624c42e21e71fe85eea6875cb94c03c82ac76bd535a0ff10b0f25"
 
 inherit pypi setuptools3
 
-- 
2.20.1


