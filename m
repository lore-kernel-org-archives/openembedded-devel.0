Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5361C531DF
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 10:58:40 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.16263.1724151513661836787
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Aug 2024 03:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=Hh4/rIH7;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: esben@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=sNAZEBv5nOHKyyq3YB1pfE3ubGLpQkYAyYXFOAxWZzs=; b=Hh4/rIH7QsEXbIU4estJSLIylV
	KLkgPAIEi8WX5u+HrPPGHjhTZIRLT+dDytLjN5dCaAQRLVHjuFDn8Babl72RU0rmsMLY3Mo5G9RMy
	gBinECUj2Wk+oSSa2yhpZ21EUx6bL4fZ0rRu2sEJZBMvZ4mx6etj3BrZWCI6Rj4sY5dK7gonuL7Bm
	7WUJ2u7ffGikXgnc34QfAr53xcVT4jDbHrYnSYyuKKoK4cNFtBIQPS+pbZ5pUbdrk5K1im4zYmtl+
	i0Ced9yf8Ct4hUbLzYDRfZvPzIl3TmZ0PBT5uNb0UxrlWNFPQC5fUpH73MU0Rh1i00x7GdkCDY7sY
	lat8S//Q==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sgMZK-000N90-IE; Tue, 20 Aug 2024 12:58:30 +0200
Received: from [87.49.147.137] (helo=localhost)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sgMZK-000Jgf-2u;
	Tue, 20 Aug 2024 12:58:30 +0200
From: Esben Haabendal <esben@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	Esben Haabendal <esben@geanix.com>
Subject: [meta-oe][scarthgap][PATCH] netplan: add missing runtime dependencies
Date: Tue, 20 Aug 2024 12:58:28 +0200
Message-ID: <10bf18809e0f45290e2d5e4facb2dd65a6b9caee.1724151195.git.esben@geanix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27373/Tue Aug 20 10:46:09 2024)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Aug 2024 10:58:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111866

The json module is used in several cli commands.

The fcntl module is used in terminal input handling.

Signed-off-by: Esben Haabendal <esben@geanix.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit cb50c930964bac0394020949c7efe0a4a06f3b89)
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
2.46.0


