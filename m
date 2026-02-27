Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3696FD7F8B
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:50 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92760.1772187345142837553
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X462XliR;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187344; x=1803723344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jnxhU/kx1YUqr4WQVJlAZvRDKEkPDYsjhiegrzbA8jE=;
  b=X462XliRzUo8U33wBPYpYAFcbyM5hj7t7EQSC0b4uaBb08c4sjt+0ga4
   Fqy4IHfr6WsaQRFaeWwLt6Xcg6olYN1TL34sr+X+3xiOme3EgKcHLWnE0
   kTLu2zj52GbA8KrDD9F3iPSQZBc9mlt7E4hH9fN+FVuJ/41o/qJm8TtEm
   bSLGnAmKz/5li1uoIt0Zjy0cco6JrTCPiMlMs7GiFWzS/9S/qjDqDnOA7
   yHQFq59avOaAIs9cgboCx6hVQSC08/+87+GZqC1EL5Ezg57paZeoBBNdL
   HWk8YC3J3ZjcDXhvx8PjNqlBR+jbpPVwT9WZ2YTS++Bhg62rDZ2pPBT3X
   g==;
X-CSE-ConnectionGUID: 6+cALneHSeS9qVfwIOog7w==
X-CSE-MsgGUID: hZAs+H9zTq+xI2P2WdAcUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="210299574"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="210299574"
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B7C4B1C0009A
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:45 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 6BE3B18041B8
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 8CB8218005A1;
	Fri, 27 Feb 2026 10:15:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 50/52] wireguard-tools: upgrade 1.0.20250521 -> 1.0.20260223
Date: Fri, 27 Feb 2026 18:13:25 +0800
Message-ID: <20260227101327.1432-50-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124750

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-tools_1.0.20250521.bb => wireguard-tools_1.0.20260223.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-kernel/wireguard/{wireguard-tools_1.0.20250521.bb => wireguard-tools_1.0.20260223.bb} (90%)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20250521.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20260223.bb
similarity index 90%
rename from meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20250521.bb
rename to meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20260223.bb
index 8fb86bc31e..50449b8c9b 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20250521.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20260223.bb
@@ -1,7 +1,7 @@
 require wireguard.inc
 
-SRCREV = "e2ecaaa739144997ccff89d6ad6ec81698ea6ced"
-SRC_URI = "git://github.com/WireGuard/wireguard-tools.git;branch=master;protocol=https"
+SRCREV = "49ce333da02056ae7b22ee2aeb6afe8aaed79b19"
+SRC_URI = "git://github.com/WireGuard/wireguard-tools.git;branch=master;protocol=https;tag=v${PV}"
 
 inherit bash-completion systemd pkgconfig
 
-- 
2.43.0


