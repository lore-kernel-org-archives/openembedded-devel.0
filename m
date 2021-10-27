Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D98C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 10:34:08 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.9757.1635330847531920950
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 03:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52436 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mfgFu-0005gm-Dn; Wed, 27 Oct 2021 13:34:02 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-thrift: Upgrade 0.13.0 -> 0.15.0
Date: Wed, 27 Oct 2021 13:33:56 +0300
Message-Id: <20211027103358.31062-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 10:34:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93626

Upgrade to release 0.15.0:

- possible collisions at VOID type with some 3rd-party libraries
  on Haxe cpp targets
- deprecate netstd "Async" method postfix
- go: NewTSocketConf and NewTSSLSocketConf no longer return an
  error
- Deprecate/remove ActionScript 3 support
- version of thrift-maven-plugin is not sync with the main project
- AppVeyor CI tries to download outdated cmake
- build: autotools: add foreign to AM_INIT_AUTOMAKE

License-Update: Check a single line from PKG-INFO.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-thrift_0.13.0.bb => python3-thrift_0.15.0.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-connectivity/python-thrift/{python3-thrift_0.13.0.bb => python3-thrift_0.15.0.bb} (65%)

diff --git a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.13.0.bb b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.15.0.bb
similarity index 65%
rename from meta-python/recipes-connectivity/python-thrift/python3-thrift_0.13.0.bb
rename to meta-python/recipes-connectivity/python-thrift/python3-thrift_0.15.0.bb
index d62ba6622..78cbba6b2 100644
--- a/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.13.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python3-thrift_0.15.0.bb
@@ -1,9 +1,8 @@
 SUMMARY = "Python bindings for the Apache Thrift RPC system"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e95cd2f17c70d3180a2b361332319fe0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
 
-SRC_URI[md5sum] = "c3bc8d9a910d2c9ce26f2ad1f7c96762"
-SRC_URI[sha256sum] = "9af1c86bf73433afc6010ed376a6c6aca2b54099cc0d61895f640870a9ae7d89"
+SRC_URI[sha256sum] = "87c8205a71cf8bbb111cb99b1f7495070fbc9cabb671669568854210da5b3e29"
 
 inherit pypi setuptools3
 
-- 
2.17.1


