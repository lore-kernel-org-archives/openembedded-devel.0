Received: from mail-wg0-f52.google.com ([74.125.82.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.betafive@gmail.com>) id 1UYZ9r-00048R-CZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 04 May 2013 11:53:41 +0200
Received: by mail-wg0-f52.google.com with SMTP id k13so2253515wgh.19
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 May 2013 02:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=NN4/KcVr+FY/OAawUfOQXPJ1UbWIvCK7qjhs21On6xc=;
	b=r0C1JQkjqrD0tKo0hVeI4J20lX7xOg+MltuOV3RdfSXsFtb+1XVwOSaTwdkdmKbu6R
	E1PEOtnOMUNezmeN2LNnQI62x1kkWPudh7VKaUUfpAHYd47Z1hZeV3d0b1jUsSTSLviT
	6k/EOUDdEQBARDANj1nWGkUkvBAlu8wm7jVKOPnOJZ/fGYYhv6CbtOv0gSSzRWX//l9B
	Vn8jn5BsF/wYzoYQ2+s1+lcSgdD5ZxM4R+6KUgP1ntbr8QxAJoCsYH4/hcYtEfnfMVoc
	+HjVXJlfRwlOAXVugCKsLh6GavH/9JW2ozJL0XTFC6WrjsO9v55hY1XsQRHyOc6w3gSt
	er+A==
X-Received: by 10.194.121.129 with SMTP id lk1mr17658771wjb.45.1367660139406; 
	Sat, 04 May 2013 02:35:39 -0700 (PDT)
Received: from vesta.betafive.co.uk (94-192-12-83.zone6.bethere.co.uk.
	[94.192.12.83])
	by mx.google.com with ESMTPSA id ed20sm2150948wic.0.2013.05.04.02.35.38
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 04 May 2013 02:35:38 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 May 2013 10:35:16 +0100
Message-Id: <1367660117-19572-5-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.8.2.2
In-Reply-To: <1367660117-19572-1-git-send-email-paul@paulbarker.me.uk>
References: <1367660117-19572-1-git-send-email-paul@paulbarker.me.uk>
Subject: [meta-multimedia][PATCH 4/5] vlc: removed unrecognised configure options
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
X-List-Received-Date: Sat, 04 May 2013 09:53:49 -0000
X-List-Received-Date: Sat, 04 May 2013 09:53:49 -0000

The configure options --enable-libtool, --disable-wxwidgets, --enable-x11,
--enable-wma and --disable-hal were not recognised by the configure script for
vlc and therefore do not have any effect (they just cause a warning).

These options are removed to prevent confusion.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 1fe2d04..059d7d2 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -47,20 +47,17 @@ FILES_${PN}-dbg    += "${libdir}/vlc/*/.debug ${libdir}/vlc/plugins/*/.debug"
 
 EXTRA_OECONF = "\
     --enable-dvdread \
-    --enable-libtool \
     --with-contrib \
     --enable-run-as-root \
-    --disable-wxwidgets \
-    --enable-x11 --enable-xvideo \ 
+    --enable-xvideo \ 
     --disable-screen --disable-caca \
     --enable-httpd --enable-vlm \
     --enable-freetype \
     --enable-sdl \ 
     --enable-png \
     --enable-live555 --enable-tremor \
-    --enable-v4l2 --enable-v4l --disable-aa --enable-wma --disable-faad \
+    --enable-v4l2 --enable-v4l --disable-aa --disable-faad \
     --enable-dbus \
-    --disable-hal \    
     --without-contrib \
     --without-kde-solid \
     --disable-opengl --disable-glx \
-- 
1.8.2.2



