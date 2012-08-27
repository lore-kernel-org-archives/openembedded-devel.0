Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T68L3-0003U5-Bu
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Aug 2012 01:03:21 +0200
Received: by pbcwy7 with SMTP id wy7so8742315pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2012 15:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=EPG/oOa2Fbq4lbZ7p3p/VTLrLjBUYQq300ttzQVyL84=;
	b=rgJrQPaUBuwlaHFGowIbXBf8TE/j70JgxDjMgN4Y6ZERDJdrjraXIoJXjpBhSAIjYZ
	wJjgEIr977Wnkoc/g6KfBrdEOCqHw7XqyhTEY3+aSwAaK6XBzYqFFbL0bAiryAd9bRH7
	uvy2XDz2Rc7UAxus3xRvs5qGEfN2LCHNhsAxiHbmEQXX6anM4A2gZcS4MaNUW5ODwiaY
	Uv/VaivPAkl2dR3f5BcTjngdbSMGTriPqfyDTjd+N+oGkPTa6TI7XMu7EtI6BJ+5U7Pe
	Q9Bba8JhozhCKnYlpXdVyV1TjrPyxyXjI8qRzOvBjN3S98UWpklN9QjH9fvdYyT8WABb
	DJDA==
Received: by 10.66.75.74 with SMTP id a10mr33387696paw.46.1346107868672;
	Mon, 27 Aug 2012 15:51:08 -0700 (PDT)
Received: from leo.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id uu10sm15601238pbc.2.2012.08.27.15.51.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Aug 2012 15:51:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2012 15:50:54 -0700
Message-Id: <1346107854-28927-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [2011.03-maintenance][PATCH] gtk+_2.20.1: Depend on gdk-pixbuf-native
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
X-List-Received-Date: Mon, 27 Aug 2012 23:03:21 -0000

also BBCLASSEXTEND gdk-pixbuf recipes to provide
native version

Newer distros which ship glib-2.0 version 2.32+
there are some missing symbols that gtk+ 2.20
will complain about. So we create own gdk-pixbuf
so it does not link to library from host system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/gtk+/gdk-pixbuf_2.10.14.bb |    1 +
 recipes/gtk+/gtk+_2.20.1.bb        |    4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/gtk+/gdk-pixbuf_2.10.14.bb b/recipes/gtk+/gdk-pixbuf_2.10.14.bb
index e41f9e0..c41a2be 100644
--- a/recipes/gtk+/gdk-pixbuf_2.10.14.bb
+++ b/recipes/gtk+/gdk-pixbuf_2.10.14.bb
@@ -64,6 +64,7 @@ do_install() {
 	cd gdk-pixbuf && oe_runmake install DESTDIR=${D}
 }
 
+BBCLASSEXTEND = "native"
 
 SRC_URI[md5sum] = "018d7dd0fa7de01cfdb77c7c55e7ba26"
 SRC_URI[sha256sum] = "d02344239d048390ba02fcfd7de4f9efc0dfb51e7b06dfa46a6314d666ea4de2"
diff --git a/recipes/gtk+/gtk+_2.20.1.bb b/recipes/gtk+/gtk+_2.20.1.bb
index 62f2f3c..4d801f1 100644
--- a/recipes/gtk+/gtk+_2.20.1.bb
+++ b/recipes/gtk+/gtk+_2.20.1.bb
@@ -13,13 +13,13 @@ SRC_URI_append = "file://gtk-dnd-grab-deadlock-fix.patch \
 SRC_URI[gtk.md5sum] = "53e6f3a93bd22934878fc4a4a34c68aa"
 SRC_URI[gtk.sha256sum] = "0e081731d21e34ff45c82199490c2889504fa8b3c7e117c043e82ababaec0f65"
 
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.6"
 
 BBCLASSEXTEND = "native"
 
 ARM_INSTRUCTION_SET = "arm"
 
-DEPENDS_virtclass-native = "libpng-native atk-native pango-native cairo-native libxrender-native libxext-native libgcrypt-native"
+DEPENDS_virtclass-native = "gdk-pixbuf-native libpng-native atk-native pango-native cairo-native libxrender-native libxext-native libgcrypt-native"
 PROVIDES_virtclass-native = "gdk-pixbuf-csource-native"
 
 # Enable xkb selectively
-- 
1.7.9.5



