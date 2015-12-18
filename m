Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8DEDF73198
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:19:54 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l126so62805463wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 04:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=+f04zbgxOjrH1KD2lj9oTmOQHhwOB4Umnmy0af/BunM=;
	b=a4+zagdWbJXQAsXWP0GAPN3RL3tNz/nAmwM0yrVT3kY+C9jf/6EBT2VYc/ENeU6o/q
	JeRflXjt3fdN4twU+p0FuoG5plonH+OZ/VwumMEPwa4hI+vneRSwLTp6Rw0/gnr4YkRI
	I35k3d7oHO2672gxYyn0a6jUKZO3afTbrlWGzSOEe+7a4ce3JjFrzOpkHDBmBqG4LG5z
	dzhcXtpnkTocr5C6uyoRyJINcVTbrIVVSG7IzDQw6R/62hThN4YabvX1MLxwhTif6m7p
	rSw/AQbwH1DIBE/rxVw8EevFF6yzn4iA53CMZfqayCBNUDUTP/5ofYODSmSRbS52YEsv
	tBYQ==
X-Received: by 10.194.173.233 with SMTP id bn9mr3705802wjc.1.1450441194602;
	Fri, 18 Dec 2015 04:19:54 -0800 (PST)
Received: from localhost.localdomain
	(lns-bzn-47f-81-56-255-191.adsl.proxad.net. [81.56.255.191])
	by smtp.gmail.com with ESMTPSA id b82sm6502935wmf.9.2015.12.18.04.19.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Dec 2015 04:19:53 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 18 Dec 2015 13:19:49 +0100
Message-Id: <1450441189-24925-1-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
Subject: [meta-multimedia][PATCH] VLC: depend on jpeg rather than libjpeg-turbo
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Dec 2015 12:19:54 -0000

The underlying libjpeg implementation doesn't matter
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index a5b214d..46dbd5d 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -9,7 +9,7 @@ DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
    virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
    tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
    lua-native lua libidn \
-   avahi libjpeg-turbo xz libmodplug mpeg2dec \
+   avahi jpeg xz libmodplug mpeg2dec \
    libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
    tiff xcb-util-keysyms"
 
-- 
2.5.0


