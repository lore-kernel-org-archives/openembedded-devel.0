Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D085C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 11:35:36 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.5962.1637148935023972872
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 03:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from lan.nucleusys.com ([92.247.61.126]:57950
 helo=lootbox.konsulko.bg)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mnJDt-0006bJ-3v; Wed, 17 Nov 2021 13:35:29 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-eventlet: Upgrade 0.32.0 -> 0.33.0
Date: Wed, 17 Nov 2021 13:35:24 +0200
Message-Id: <20211117113526.22305-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
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
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 11:35:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93997

Upgrade to release 0.33.0:

- green.thread: unlocked Lock().release() should raise exception,
  returned True
- wsgi: Don't break HTTP framing during 100-continue handling
- greendns: Create a DNS resolver lazily rather than on import
- ssl: GreenSSLContext minimum_version and maximum_version setters

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...on3-eventlet_0.32.0.bb => python3-eventlet_0.33.0.bb} | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.32.0.bb => python3-eventlet_0.33.0.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.32.0.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.33.0.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.32.0.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.33.0.bb
index 3848150e4..6a4449cf5 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.32.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.33.0.bb
@@ -4,8 +4,13 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
-SRC_URI[sha256sum] = "2f0bb8ed0dc0ab21d683975d5d8ab3c054d588ce61def9faf7a465ee363e839b"
+SRC_URI[sha256sum] = "80144f489c1bb273a51b6f96ff9785a382d2866b9bab1f5bd748385019f4141f"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += "${PYTHON_PN}-dnspython"
+RDEPENDS:${PN} += " \
+	${PYTHON_PN}-dnspython \
+	${PYTHON_PN}-six \
+	${PYTHON_PN}-distutils \
+	${PYTHON_PN}-greenlet \
+"
-- 
2.20.1


