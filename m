Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578E1C433EF
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 14:03:35 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.11919.1635343414231372900
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Oct 2021 07:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47174 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mfjWV-0001SJ-QU; Wed, 27 Oct 2021 17:03:28 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-prettytable: Upgrade 2.1.0 -> 2.2.1
Date: Wed, 27 Oct 2021 17:03:20 +0300
Message-Id: <20211027140320.13183-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Oct 2021 14:03:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93631

Upgrade to release 2.2.1:

- Add support for Python 3.10
- Update issue templates
- Add support for positional junction characters and add
  "double_border" table style
- Access properties instead of protected fields in _get_options()
- Use declarative metadata and support PyPy3
- Add auto index column
- Refactor for readability and avoid merge conflicts
- Remove exclamation marks from exceptions
- Consider US G0 Character Set ANSI-escape code as 0-width
  (like colors)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-prettytable_2.1.0.bb => python3-prettytable_2.2.1.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-prettytable_2.1.0.bb => python3-prettytable_2.2.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-prettytable_2.1.0.bb b/meta-python/recipes-devtools/python/python3-prettytable_2.2.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-prettytable_2.1.0.bb
rename to meta-python/recipes-devtools/python/python3-prettytable_2.2.1.bb
index 58a48e9e0..b9050cc1b 100644
--- a/meta-python/recipes-devtools/python/python3-prettytable_2.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-prettytable_2.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://code.google.com/p/prettytable"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c9a6829fcd174d9535b46211917c7671"
 
-SRC_URI[sha256sum] = "5882ed9092b391bb8f6e91f59bcdbd748924ff556bb7c634089d5519be87baa0"
+SRC_URI[sha256sum] = "6d465005573a5c058d4ca343449a5b28c21252b86afcdfa168cdc6a440f0b24c"
 
 do_install:append() {
     perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "*.txt" -o -name "PKG-INFO"`
@@ -28,6 +28,9 @@ RDEPENDS:${PN} += " \
 	${PYTHON_PN}-math \
 	${PYTHON_PN}-html \
 	${PYTHON_PN}-wcwidth \
+	${PYTHON_PN}-json \
+	${PYTHON_PN}-compression \
+	${PYTHON_PN}-importlib-metadata \
 "
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.17.1


