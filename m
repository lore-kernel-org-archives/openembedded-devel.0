Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6A7C433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 18:57:07 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.885.1637002626067851460
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Nov 2021 10:57:06 -0800
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
	id 1mmh9y-0006Dg-Mv; Mon, 15 Nov 2021 20:56:55 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-cchardet: Add recipe
Date: Mon, 15 Nov 2021 20:56:48 +0200
Message-Id: <20211115185652.27542-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-1.0
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
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Nov 2021 18:57:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93958

Universal character encoding detector, release 2.1.7:

- support Python 3.9
- drop support for Python 3.5

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-cchardet_2.1.7.bb     | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb

diff --git a/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb b/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
new file mode 100644
index 000000000..ebd8130ab
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cchardet_2.1.7.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Universal character encoding detector"
+HOMEPAGE = "https://github.com/PyYoshi/cChardet"
+LICENSE = "MPLv1.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6ecda54f6f525388d71d6b3cd92f7474"
+
+SRC_URI[sha256sum] = "c428b6336545053c2589f6caf24ea32276c6664cb86db817e03a94c60afa0eaf"
+
+inherit pypi setuptools3
-- 
2.20.1


