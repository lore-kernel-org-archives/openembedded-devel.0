Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4C9C433F5
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 10:46:58 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.8227.1637059608399228441
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Nov 2021 02:46:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from lan.nucleusys.com ([92.247.61.126]:55782
 helo=lootbox.konsulko.bg)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mmvz5-00050i-J3; Tue, 16 Nov 2021 12:46:41 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] packagegroup-meta-python.bb: Add new packages
Date: Tue, 16 Nov 2021 12:46:37 +0200
Message-Id: <20211116104637.4000-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Nov 2021 10:46:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93973

Add new packages:

- python3-aiosignal
- python3-frozenlist
- python3-charset-normalizer
- python3-cchardet

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-python.bb    | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index be0786f60..051c6cceb 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -22,6 +22,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-aiohttp \
     python3-aiohttp-jinja2 \
     python3-aiohue \
+    python3-aiosignal \
     python3-alembic \
     python3-ansi2html \
     python3-ansicolors \
@@ -65,10 +66,12 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-cantools \
     python3-cassandra-driver \
     python3-cbor2 \
+    python3-cchardet \
     python3-cerberus \
     python3-certifi \
     python3-cffi \
     python3-chardet \
+    python3-charset-normalizer \
     python3-cheetah \
     python3-click \
     python3-click-repl \
@@ -145,6 +148,7 @@ RDEPENDS:packagegroup-meta-python3 = "\
     python3-flask-wtf \
     python3-flask-xstatic \
     python3-future \
+    python3-frozenlist \
     python3-gast \
     python3-geojson \
     python3-geomet \
-- 
2.20.1


