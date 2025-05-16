Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E1EC3ABC9
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 12:14:55 +0000 (UTC)
Received: from smarthost01c.sbp.mail.zen.net.uk (smarthost01c.sbp.mail.zen.net.uk [212.23.1.5])
 by mx.groups.io with SMTP id smtpd.web11.11626.1747397690042181549
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 May 2025 05:14:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=lliqJB1V;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.5, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01c.sbp.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1uFtxX-00GHm8-0Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 May 2025 12:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	In-Reply-To:References; bh=8SINPcTZtyL7FLamMWxyp3dt+22eEgWCyTDqZOOorVE=; b=ll
	iqJB1VPacQt2ObvtkSB/a15aFzJe/3nAERgkFqYq4vixLiQNxLR8MZlmab96b1OX5VUpyvzRcHFpj
	GKbJKwBAldimgPh017IXOFQU8NcKa1i/3AkAAO/2Og+SXGq0kAhlG7kZGJ6PuXkslDK8R3du8q2X1
	6/zxYNSSoMSWIbNl0Km7SnYEbbmuQ5a7WOnqPilnu5CN9VSTHoF3qr2UtFBoH6wVQwhcwQBxaCkRr
	NAlaVYXEVLtcd9qU8rSWT3pJ5eIxty7o9ZpJLb3QU1bFL/hWqpN36kXqtY5MaQThODntuF4PccOL+
	SW9hst2/BPUj+jsTcBf+yqG0XO5jqnwg==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1uFtxe-00Fwi9-1j;
	Fri, 16 May 2025 13:14:46 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [meta-oe][PATCH] civetweb: Fix build with ssl disabled
Date: Fri, 16 May 2025 13:14:38 +0100
Message-Id: <20250516121438.673215-1-mac@mcrowe.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-smarthost01c-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 12:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117429

Move enabling of openssl 3.0 API from EXTRA_OECMAKE to
PACKAGECONFIG[ssl] so that this package can still be configured
successfully without ssl in PACKAGECONFIG.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

Tested against Scarthgap, but this part of the recipe hasn't changed
since then.

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index 4b08a44813..a7e81213c3 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -23,7 +23,6 @@ EXTRA_OECMAKE = " \
     -DCIVETWEB_ENABLE_LUA=OFF \
     -DCIVETWEB_ENABLE_ASAN=OFF \
     -DCIVETWEB_BUILD_TESTING=OFF \
-    -DCIVETWEB_SSL_OPENSSL_API_3_0=ON \
 "
 
 # Building with ninja fails on missing third_party/lib/libcheck.a (which
@@ -37,7 +36,7 @@ PACKAGECONFIG[cpp] = "-DCIVETWEB_ENABLE_CXX=ON,-DCIVETWEB_ENABLE_CXX=OFF,"
 PACKAGECONFIG[debug] = "-DCIVETWEB_ENABLE_MEMORY_DEBUGGING=ON,-DCIVETWEB_ENABLE_MEMORY_DEBUGGING=OFF,"
 PACKAGECONFIG[ipv6] = "-DCIVETWEB_ENABLE_IPV6=ON,-DCIVETWEB_ENABLE_IPV6=OFF,"
 PACKAGECONFIG[server] = "-DCIVETWEB_ENABLE_SERVER_EXECUTABLE=ON -DCIVETWEB_INSTALL_EXECUTABLE=ON,-DCIVETWEB_ENABLE_SERVER_EXECUTABLE=OFF -DCIVETWEB_INSTALL_EXECUTABLE=OFF,"
-PACKAGECONFIG[ssl] = "-DCIVETWEB_ENABLE_SSL=ON -DCIVETWEB_SSL_OPENSSL_API_1_1=OFF -DCIVETWEB_ENABLE_SSL_DYNAMIC_LOADING=OFF,-DCIVETWEB_ENABLE_SSL=OFF,openssl (=1.0.2%),"
+PACKAGECONFIG[ssl] = "-DCIVETWEB_ENABLE_SSL=ON -DCIVETWEB_SSL_OPENSSL_API_1_1=OFF -DCIVETWEB_SSL_OPENSSL_API_3_0=ON -DCIVETWEB_ENABLE_SSL_DYNAMIC_LOADING=OFF,-DCIVETWEB_ENABLE_SSL=OFF,openssl (=1.0.2%),"
 PACKAGECONFIG[websockets] = "-DCIVETWEB_ENABLE_WEBSOCKETS=ON,-DCIVETWEB_ENABLE_WEBSOCKETS=OFF,"
 
 do_install:append() {
-- 
2.39.5


