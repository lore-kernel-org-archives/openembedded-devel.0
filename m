Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi6b-0002oS-UH
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:19:29 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1377891eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 18:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ldYE080COHq1jKlvUmrjq9ftFDJsJtdnjWPnj1vQer8=;
	b=H9PLfbff4nHk+fhNlHfzT4Dru52TmptMEjv0x7vNcjFEsCUN1PttmEUovHCn6JQhQg
	bmwQKZwUTz/S8tB0TNotGDedsmZedb6Hg9oz9WZ49kodS6iOMgu4Wkzb8Yph99Eg/Ufy
	5vEOxqSqreaSVeWA/NYgl5zooAHvmyuk797/kWslTYqf51iLQ8WI5ubTPNO5nWnXEKpq
	wleyr8B4GizAJ+YV6D2MbMJ/bvFyKt61t5KpH2C9cvlTrefivDjM4K+355oUGgphijYd
	Wit5fyHRygU9TZs0teeBBtCxfODMRB0KEo3GLT8OcbB/8MWLqZ6hNC7i4IYNR6NMkV/c
	kaHA==
Received: by 10.14.221.5 with SMTP id q5mr42289727eep.33.1354586710285;
	Mon, 03 Dec 2012 18:05:10 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d3sm8843346eeo.13.2012.12.03.18.05.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 18:05:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:59:13 +0100
Message-Id: <1c3bd51cce889e1afd9ef169cebf8cb5d9165ea5.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 40/58] libgnomecanvas: fix QA warnings from packaging
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
X-List-Received-Date: Tue, 04 Dec 2012 02:25:56 -0000

* fixes:
libgnomecanvas-2.26.0: non -staticdev package contains static .a library: libgnomecanvas-dev path '/work/armv7a-vfp-neon-oe-linux-gnueabi/libgnomecanvas/2.26.0-r0/packages-split/libgnomecanvas-dev/usr/lib/libglade/2.0/libcanvas.a'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0.bb
index 79e9e8a..efb88ff 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.26.0.bb
@@ -5,13 +5,16 @@ SECTION = "x11/gnome/libs"
 
 inherit gnome
 
+PR = "r1"
+
 DEPENDS = "gtk+ libglade libart-lgpl xineramaproto"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
 FILES_${PN} += "${libdir}/libglade/*/libcanvas.so"
 FILES_${PN}-dbg += "${libdir}/libglade/*/.debug/"
-FILES_${PN}-dev += "${libdir}/libglade/*/libcanvas.*a"
+FILES_${PN}-dev += "${libdir}/libglade/*/libcanvas*.la"
+FILES_${PN}-staticdev += "${libdir}/libglade/*/libcanvas*.a"
 
 do_configure_prepend() {
     sed -i -e s:docs::g ${S}/Makefile.am
-- 
1.8.0



