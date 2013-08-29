Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 393CD6BE39
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:50 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so343749eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=opde8CTu3BuTiimNOHCGl28IC+YDa5ZxUF8RUR4ht7w=;
	b=PUC0vqzf8Ax9mbnVffKvB3ouDmy6pFsFEd8W38hH1AfdzAR5OFtfUovIzmXdd0QP09
	watLtkto417JPpAKYK8Gek9iHh0uDIs9iFzZ7DEIC5/FtSoGgzhSv0nJGnYy3PX2kLw0
	8W44p0Z+dYvRhdnFKtED16O/GJfvz9XoCKAFCoH3zA+IZj+xFwa9mdI4MCF4kkrakiZu
	6N0hvKqsT1qtfOs7J5WeceWNRUlu7SPUAcKuagkQOS8dsq7CfEbt8+xOPlO0cUhTXpcu
	D712oZ0FxUptl5yylYnRlGxwPbgtoCGKEog+eEymn8Pd1YPwtxmsgL6Iu0F8GfqYojwd
	fILA==
X-Received: by 10.15.41.77 with SMTP id r53mr4614637eev.64.1377791510674;
	Thu, 29 Aug 2013 08:51:50 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm47164523eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:39 +0200
Message-Id: <2e53e9014473df30f1538a2d4077c4941e7ab7ae.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 46/66] gnome-mplayer: Add PACKAGECONFIG for gtk3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2013 15:51:50 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
index d7d2314..4cbe303 100644
--- a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
@@ -13,6 +13,9 @@ SRC_URI = "http://${PN}.googlecode.com/files/${P}.tar.gz"
 SRC_URI[md5sum] = "1d3ab24c5501b5528e357931ca4dc6da"
 SRC_URI[sha256sum] = "ac3c179345baecb4ca5237782aa33e83253a87bf8b42ce6eb3a9207a340f61b2"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gtk3] = "--enable-gtk3,--disable-gtk3,gtk+3"
+
 EXTRA_OECONF = "--with-gio --with-alsa --with-dbus --with-libnotify"
 
 FILES_${PN} += "${datadir}/gnome-control-center/default-apps/${PN}.xml"
-- 
1.8.3.2


