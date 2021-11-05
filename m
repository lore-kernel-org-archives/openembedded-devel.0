Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD69C433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 09:30:47 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.3189.1636104646374656500
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
	id 1mivYX-0001pJ-1E; Fri, 05 Nov 2021 11:30:42 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-cachecontrol: Upgrade 0.12.6 ->
 0.12.9
Date: Fri,  5 Nov 2021 11:30:36 +0200
Message-Id: <20211105093037.25071-2-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 09:30:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93829

Upgrade to release 0.12.9:

- Ensure we reset the file handle after reading
- Formatting updates after running black
- Ensure the required python version is PEP 440 compliant
- Fix the Makefile bootstrap to use pip3

License-Update: LICENSE.txt is missing. Use PKG-INFO instead.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...achecontrol_0.12.6.bb => python3-cachecontrol_0.12.9.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cachecontrol_0.12.6.bb => python3-cachecontrol_0.12.9.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.6.bb b/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.9.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-cachecontrol_0.12.6.bb
rename to meta-python/recipes-devtools/python/python3-cachecontrol_0.12.9.bb
index e07fa98992..2b2b72d555 100644
--- a/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.6.bb
+++ b/meta-python/recipes-devtools/python/python3-cachecontrol_0.12.9.bb
@@ -1,14 +1,13 @@
 SUMMARY = "httplib2 caching for requests"
 HOMEPAGE = "https://pypi.org/project/CacheControl/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=6dc7e1b428eda03d850209fdbd6c71f1"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=12;endline=12;md5=62d6ee40749ec0b76d8a1200a1562369"
 
 # On PyPi, this is "CacheControl", rather than "cachecontrol", so we need to
 # override PYPI_PACKAGE so fetch succeeds.
 PYPI_PACKAGE = "CacheControl"
 
-SRC_URI[md5sum] = "5890b797f9b48b2b4cd1448cca89e396"
-SRC_URI[sha256sum] = "be9aa45477a134aee56c8fac518627e1154df063e85f67d4f83ce0ccc23688e8"
+SRC_URI[sha256sum] = "b5d0c98f7ee9f02e2d5a85af98b9a76c0a2c73c972c142291f823a0ed2eb7a78"
 
 inherit pypi setuptools3
 
@@ -24,6 +23,7 @@ RDEPENDS:${PN} += "\
     python3-pickle \
     python3-requests \
     python3-urllib3 \
+    python3-mmap \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


