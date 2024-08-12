Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7533BC52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 09:52:13 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.42746.1723456323488508342
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 02:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=QvNemrPF;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=nTrhv+855gF/OINdxV3Q+pEEPDpPJ4Uw0btQFclto5c=; b=QvNemrPFUmVGnEPmBmZQizye8/
	NsglI5MvAn2FVXx4ZKQ2P+WJ73Sg2Eaj2aehxzgLeqREokd6hCbGp9ADAhZd/BC2ICNwAK28clT3E
	wgSWwVjjV7wWUnZcUduxb3vLrZzTsPZLxd1AT2vQAhw6/t6fUD8iInSWjRiiuW2jzOvRB97e6csae
	A+yKNDW0vtPgZJduVe4OSEyqDvrcYCVn2V2CDY0UVDWDbcrOhIf3PrPt6QXjXYNNbQi6AjIuJhrLb
	nbtAjQxWml8onTcFVUXJ/KUvYPaCQIn815uvx1uG6TpM8zBiNy5TakCnp57Of7ZFCwSH22WWmaW8F
	f9aNq36w==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sdRib-000Bqs-De; Mon, 12 Aug 2024 11:52:01 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sdRic-000Kez-0V;
	Mon, 12 Aug 2024 11:52:01 +0200
From: Esben Haabendal <esben@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Esben Haabendal <esben@geanix.com>
Subject: [PATCH] netplan: add missing runtime dependencies
Date: Mon, 12 Aug 2024 11:52:01 +0200
Message-ID: <92f616b010f11891d2814eb526aded1e5dcaac3d.1723456138.git.esben@geanix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27365/Mon Aug 12 10:41:53 2024)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 09:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111768

The json module is used in several cli commands.

The fcntl module is used in terminal input handling.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 .../meta-python/recipes-connectivity/netplan/netplan_1.0.bb      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb
index 229414718c06..cf8d6d19e711 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.0.bb
@@ -34,6 +34,7 @@ EXTRA_OEMESON = "-Dunit_testing=false"
 
 RDEPENDS:${PN} = "python3-core python3-netifaces python3-pyyaml \
                   python3-dbus python3-rich python3-cffi \
+                  python3-json python3-fcntl \
                   util-linux-libuuid libnetplan \
                  "
 
-- 
2.45.2


