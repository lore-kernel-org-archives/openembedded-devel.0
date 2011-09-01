Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qz9eb-0008VC-T2
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 17:58:09 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so881914fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Sep 2011 08:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=KMOQ+zXrpdqObTUZB13byVT/zIf1suUZAzYfNWMtZIA=;
	b=p2z+i5/t1x/359+VwuIakc0eDqfPb4uRsNsR5wMkZnlnyav8OzsSjI5SxbPxTwnTqx
	KOpbv51T4k5dOxDdmmcneAX9nn7nvROgEM7o7Q7ZK7qm2OxaDuOyEp6nHMh+OUZkxdut
	AdyfKTTO5xEztyaeaC+dM0iqrRsB3orBT+DC0=
Received: by 10.223.87.204 with SMTP id x12mr14370fal.27.1314892396633;
	Thu, 01 Sep 2011 08:53:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c4sm137335fac.11.2011.09.01.08.53.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Sep 2011 08:53:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2011 17:53:07 +0200
Message-Id: <f25cc3380d321eae88a0566d20d2b2248258eb79.1314892354.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <cover.1314892354.git.Martin.Jansa@gmail.com>
References: <cover.1314892354.git.Martin.Jansa@gmail.com>
Subject: [meta-efl][PATCH 1/2] evas: add evas-loader-svg back to RRECOMMENDS
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
X-List-Received-Date: Thu, 01 Sep 2011 15:58:10 -0000

* it doesn't look like whole Gtk+ anymore, but still needs gdk-pixbuf,
  libcairo2 etc.

  Package: evas-loader-svg
  Depends: libxcb1 (>= 1.7), libxrender1 (>= 0.9.6), libpixman-1-0 (>= 0.22.2), libxml2 (>= 2.7.8), libz1 (>= 1.2.5), librsvg-2-2 (>= 2.32.1), libfreetype6 (>= 2.4.6), eina (>= 1.0.999+svnr62850), libgcrypt11 (>= 1.4.6), libpng12-0 (>= 1.2.46), libffi5 (>= 3.0.9), gdk-pixbuf (>= 2.22.1), libcairo2 (>= 1.10.2), libstdc++6 (>= 4.6.1+svnr175454), libglib-2.0-0 (>= 2.29.3+gitr1+d97cbc6731deab137770bc0fe9c69b06f689f5b4), libxau6 (>= 1.0.6), libjpeg8 (>= 8c), libx11-6 (>= 1.4.3), evas (>= 1.0.999+svnr62850), libfribidi0 (>= 0.19.2), libc6 (>= 2.13), pango (>= 1.28.3), libgpg-error0 (>= 1.10), libgnutls26 (>= 2.12.5), libeet1 (>= 1.4.999+svnr62850), libtasn1-3 (>= 2.9), libexpat1 (>= 2.0.1), libxdmcp6 (>= 1.1.0), libfontconfig1 (>= 2.8.0)

  Package: librsvg-2-2
  Depends: libx11-6 (>= 1.4.3), libpixman-1-0 (>= 0.22.2), libxcb1 (>= 1.7), libc6 (>= 2.13), libxrender1 (>= 0.9.6), libffi5 (>= 3.0.9), libxml2 (>= 2.7.8), libz1 (>= 1.2.5), libfreetype6 (>= 2.4.6), gdk-pixbuf (>= 2.22.1), libpng12-0 (>= 1.2.46), libcairo2 (>= 1.10.2), libstdc++6 (>= 4.6.1+svnr175454), libglib-2.0-0 (>= 2.29.3+gitr1+d97cbc6731deab137770bc0fe9c69b06f689f5b4), libxau6 (>= 1.0.6), libexpat1 (>= 2.0.1), pango (>= 1.28.3), libxdmcp6 (>= 1.1.0), libfontconfig1 (>= 2.8.0)

* but otherwise e-wm keeps complaining about missing svg support
  <<<< Enlightenment Error >>>>
  Enlightenment found Evas can't load SVG files. Check Evas has SVG loader
  support.

* we can also RRECOMMEND it only from e-wm, so people using only evas
  without e-wm won't get it by default

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/evas.inc |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/evas.inc b/meta-efl/recipes-efl/efl/evas.inc
index 3f7eed3..bbe06cc 100644
--- a/meta-efl/recipes-efl/efl/evas.inc
+++ b/meta-efl/recipes-efl/efl/evas.inc
@@ -44,6 +44,7 @@ RRECOMMENDS_${PN} = " \
   evas-loader-jpeg \
   evas-loader-eet \
   evas-loader-gif \
+  evas-loader-svg \
 "
 
 # Some upgrade path tweaking
@@ -74,11 +75,6 @@ RREPLACES_evas-engine-buffer = "liblibevas-ver-pre-svn-00-engine-buffer libevas-
 RREPLACES_evas-engine-xrender-x11 = "liblibevas-ver-pre-svn-00-engine-xrender-x11 libevas-ver-pre-svn-00-engine-xrender-x11 "
 RREPLACES_evas-engine-software-x11 = "liblibevas-ver-pre-svn-00-engine-software-x11 libevas-ver-pre-svn-00-engine-software-x11 "
 
-# disabling this, since (due to OE bugs) it drags in whole Gtk+
-#RRECOMMENDS_${PN} += " \
-#  libevas-loader-svg \
-#"
-
 EVAS_CPU_TWEAKS = ""
 # Disabled for now, see http://thread.gmane.org/gmane.comp.window-managers.enlightenment.devel/25194
 EVAS_CPU_TWEAKS_armv7a = "--disable-cpu-neon"
-- 
1.7.6.1



