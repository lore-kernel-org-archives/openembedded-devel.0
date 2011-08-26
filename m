Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QwwNn-0005xk-3s
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Aug 2011 15:23:39 +0200
Received: by fxg11 with SMTP id 11so2674599fxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Aug 2011 06:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KMOQ+zXrpdqObTUZB13byVT/zIf1suUZAzYfNWMtZIA=;
	b=l3Hm6F6bq3jc/4K1KhZHN+mK9xxT8E5aaE1qPwjPW+TX60NYQvJY8OxPRbNStK3mZC
	NIJ9jcDiJlOYRQVkCFjV38zYGCDzcHXKVKCm8DV2ZnCXi7zqfnj4Kg+FQm7DfUb6q7gB
	+Vb5naw7zVJ3opEXAHKeKVLEnA9TAXh1ct/sg=
Received: by 10.223.6.214 with SMTP id a22mr1636240faa.99.1314364730419;
	Fri, 26 Aug 2011 06:18:50 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b14sm1325619fak.5.2011.08.26.06.18.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 06:18:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Aug 2011 15:18:41 +0200
Message-Id: <1314364721-3871-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
Subject: [PATCH] evas: add evas-loader-svg back to RRECOMMENDS
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
X-List-Received-Date: Fri, 26 Aug 2011 13:23:39 -0000

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



