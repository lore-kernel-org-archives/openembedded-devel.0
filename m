Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OtJLU-0008RB-Q6
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 14:03:41 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 6AB78491278;
	Wed,  8 Sep 2010 14:01:05 +0200 (CEST)
Received: from mobil-400-586.intern.dresearch.de ([10.32.11.62]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 8 Sep 2010 14:01:05 +0200
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id D8C7C2DA4D; Wed,  8 Sep 2010 14:01:04 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Sep 2010 14:00:46 +0200
Message-Id: <1283947246-30457-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <4C86151D.50801@dresearch.de>
References: <4C86151D.50801@dresearch.de>
X-OriginalArrivalTime: 08 Sep 2010 12:01:05.0543 (UTC)
	FILETIME=[83F97170:01CB4F4D]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] gtk+: fix configure problem for native build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Sep 2010 12:04:36 -0000
X-List-Received-Date: Wed, 08 Sep 2010 12:04:36 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/gtk+/gtk+_2.18.6.bb |    2 +-
 recipes/gtk+/gtk+_2.20.0.bb |    2 +-
 recipes/gtk+/gtk+_2.20.1.bb |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes/gtk+/gtk+_2.18.6.bb b/recipes/gtk+/gtk+_2.18.6.bb
index 237689d..864f4ba 100644
--- a/recipes/gtk+/gtk+_2.18.6.bb
+++ b/recipes/gtk+/gtk+_2.18.6.bb
@@ -16,7 +16,7 @@ XKBTOGGLE = " --disable-xkb"
 XKBTOGGLE_angstrom = ""
 
 EXTRA_OECONF = "--with-libtiff ${XKBTOGGLE} --disable-glibtest gio_can_sniff=yes"
-EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg"
+EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg --disable-cups"
 
 PACKAGES_DYNAMIC = "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
 
diff --git a/recipes/gtk+/gtk+_2.20.0.bb b/recipes/gtk+/gtk+_2.20.0.bb
index 2c061b7..1e07e83 100644
--- a/recipes/gtk+/gtk+_2.20.0.bb
+++ b/recipes/gtk+/gtk+_2.20.0.bb
@@ -20,7 +20,7 @@ XKBTOGGLE = " --disable-xkb"
 XKBTOGGLE_angstrom = ""
 
 EXTRA_OECONF = "--with-libtiff ${XKBTOGGLE} --disable-glibtest gio_can_sniff=yes"
-EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg"
+EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg --disable-cups"
 
 PACKAGES_DYNAMIC = "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
 
diff --git a/recipes/gtk+/gtk+_2.20.1.bb b/recipes/gtk+/gtk+_2.20.1.bb
index 1568e61..ca5e197 100644
--- a/recipes/gtk+/gtk+_2.20.1.bb
+++ b/recipes/gtk+/gtk+_2.20.1.bb
@@ -24,7 +24,7 @@ XKBTOGGLE = " --disable-xkb"
 XKBTOGGLE_angstrom = ""
 
 EXTRA_OECONF = "--with-libtiff ${XKBTOGGLE} --disable-glibtest gio_can_sniff=yes"
-EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg"
+EXTRA_OECONF_append_virtclass-native = " --without-libtiff --without-libjpeg --disable-cups"
 
 PACKAGES_DYNAMIC = "gtk-module-* gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
 
-- 
1.7.1



