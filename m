Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFB0C4332F
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 18:57:04 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.905.1637002623052871889
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 10:57:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from lan.nucleusys.com ([92.247.61.126]:55720
 helo=lootbox.konsulko.bg)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mmhA2-0006Dg-17; Mon, 15 Nov 2021 20:56:58 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-aiohttp: Upgrade 3.8.0 -> 3.8.1
Date: Mon, 15 Nov 2021 20:56:52 +0200
Message-Id: <20211115185652.27542-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211115185652.27542-1-leon.anavi@konsulko.com>
References: <20211115185652.27542-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Nov 2021 18:57:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93957

Upgrade to release 3.8.1:

- Fix the error in handling the return value of getaddrinfo.
  getaddrinfo will return an (int, bytes) tuple, if CPython could
  not handle the address family. It will cause a index out of
  range error in aiohttp. For example, if user compile CPython
  with --disable-ipv6 option but his system enable the ipv6.
- Do not install "examples" as a top-level package.
- Restored ability to connect IPv6-only host.
- Remove Signal from __all__, replace aiohttp.Signal with
  aiosignal.Signal in docs
- Made chunked encoding HTTP header check stricter

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-aiohttp_3.8.0.bb => python3-aiohttp_3.8.1.bb}   | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.8.0.bb => python3-aiohttp_3.8.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.0.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.8.0.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb
index 710f8f4ce..1d8434e3c 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.8.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8074d6c6e217873b2a018a4522243ea3"
 
-SRC_URI[sha256sum] = "d3b19d8d183bcfd68b25beebab8dc3308282fe2ca3d6ea3cb4cd101b3c279f8d"
+SRC_URI[sha256sum] = "fc5471e1a54de15ef71c1bc6ebe80d4dc681ea600e68bfd1cbce40427f0b7578"
 
 PYPI_PACKAGE = "aiohttp"
 inherit setuptools3 pypi
@@ -20,4 +20,7 @@ RDEPENDS:${PN} = "\
     ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-typing-extensions \
     ${PYTHON_PN}-yarl \
+    ${PYTHON_PN}-cchardet \
+    ${PYTHON_PN}-charset-normalizer \
+    ${PYTHON_PN}-aiosignal \
 "
-- 
2.20.1


