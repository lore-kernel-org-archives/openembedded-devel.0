Received: from mail-ea0-f181.google.com ([209.85.215.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UWnYZ-0001lT-G2
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Apr 2013 14:52:08 +0200
Received: by mail-ea0-f181.google.com with SMTP id a11so2519921eae.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Apr 2013 05:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=ZqhdbZLVhvBb3eO8FlNOOGNUUcAZOyBjQe1ML/53qJg=;
	b=l+8XvjsQ7+7AmxGRDPZcj6YE+ynQv6SrCfw9hIxpQjUW53uSHn8oyLYdIRgLCtO8L6
	qVKVxsxB71T+T51jjgm0htRRVrN6G4JKACYRGDYiOQBvQgrW+0sPC2J7ToS/pg1F/Xx9
	3UvJ55wUDdy/HkjPMGObbLPGab4Ntc7BEnM3Ky+g97r6yDxlarvVnxNeLre5LgeBZjg6
	hJaU4naOmbWLwMMS6sT0MjGMYHf3ox5ZGk0WAN5of8QmpfumZlTd4fZiPnatUeqTyxfz
	nccIuHAZQiTfI5FQPbmiXS64Ez3xmagN0a5On9H6PHnrvzWF0ys5GwdeSUqQ3BsHCsx1
	pBRg==
X-Received: by 10.15.35.71 with SMTP id f47mr67044688eev.15.1367238830911;
	Mon, 29 Apr 2013 05:33:50 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204]) by mx.google.com with ESMTPSA id
	r10sm14784232eez.10.2013.04.29.05.33.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 05:33:50 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Apr 2013 14:31:22 +0200
Message-Id: <1367238685-16855-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1367238685-16855-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367238685-16855-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-gnome 2/5] libgnomecanvas: update 2.30.3 to fix build
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
X-List-Received-Date: Mon, 29 Apr 2013 12:52:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

error message was:
| gnome-canvas-rich-text.c: In function 'gnome_canvas_rich_text_draw':
| gnome-canvas-rich-text.c:2150:2: error: implicit declaration of function 'gtk_text_layout_draw' [-Werror=implicit-function-declaration]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...mecanvas_2.26.0.bb => libgnomecanvas_2.30.3.bb} |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/libgnome/{libgnomecanvas_2.26.0.bb => libgnomecanvas_2.30.3.bb} (77%)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
similarity index 77%
rename from meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0.bb
rename to meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
index efb88ff..0821abb 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
@@ -5,10 +5,11 @@ SECTION = "x11/gnome/libs"
 
 inherit gnome
 
-PR = "r1"
-
 DEPENDS = "gtk+ libglade libart-lgpl xineramaproto"
 
+SRC_URI[archive.md5sum] = "ffcbb719c671ff5cd86e59aeba8d0b92"
+SRC_URI[archive.sha256sum] = "859b78e08489fce4d5c15c676fec1cd79782f115f516e8ad8bed6abcb8dedd40"
+
 EXTRA_OECONF = "--disable-gtk-doc"
 
 FILES_${PN} += "${libdir}/libglade/*/libcanvas.so"
@@ -19,6 +20,3 @@ FILES_${PN}-staticdev += "${libdir}/libglade/*/libcanvas*.a"
 do_configure_prepend() {
     sed -i -e s:docs::g ${S}/Makefile.am
 }
-
-SRC_URI[archive.md5sum] = "9bbc635e5ae70e63af071af74ba7e72f"
-SRC_URI[archive.sha256sum] = "80b480acc33d7303f651e9c5bc8fea51c9e9a9ed59ebfdbbb730dd798bcbc58d"
-- 
1.7.6.5



