Return-Path: <rafael.carre@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3DA4A73D46
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 16:03:28 +0000 (UTC)
Received: by wikq8 with SMTP id q8so95211218wik.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 08:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=9Bb0AAX8nq+Uw5sqrr7NXHjOughunG3FjasdxaHKxks=;
	b=AJAij4NKSjEIODLyqbw5YfZE/0AQF38iy+1kypSqHhEQpFNy6tBVd63mOVWLKBQ9jb
	PyqK4gZinfJqjv4OSvoUft4wnW9hDPftS5pvSt/TGf1ATdEGXG5H7o6D1VRPuHGvhJKa
	HoyIe7oeykoE31Cppxy/i93CHkaW21Sja9ySCrS7BORim7uW7tk6PceehZ3gN6FAvktR
	439Hzgo4vhU33ejA5r8OWh7y0u3sII2VY2rnNblbBWIlQXqdikbTOXx6YbBp3UkdBIGv
	oZK4gk+oukr48ptgPmJrEkua7X2ZskGPfqK/U95kIHmyuAlv9IMxcXSoCg5XVyp5G7dJ
	g2nQ==
X-Received: by 10.194.186.170 with SMTP id fl10mr2795088wjc.91.1446653008447; 
	Wed, 04 Nov 2015 08:03:28 -0800 (PST)
Received: from localhost.localdomain
	(lns-bzn-47f-81-56-255-191.adsl.proxad.net. [81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	lf10sm2260206wjb.23.2015.11.04.08.03.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 04 Nov 2015 08:03:27 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Nov 2015 17:03:19 +0100
Message-Id: <1446652999-24545-3-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1446652999-24545-1-git-send-email-funman@videolan.org>
References: <1446652999-24545-1-git-send-email-funman@videolan.org>
Subject: [meta-multimedia][PATCH 3/3] VLC: drop gnome-vfs, it will be removed from upstream in VLC 3.0
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
X-List-Received-Date: Wed, 04 Nov 2015 16:03:29 -0000

---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index ad5c81d..dddbb5b 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
    virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
    tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
-   libdvdcss libdvdread lua-native lua libidn gnome-vfs \
+   libdvdcss libdvdread lua-native lua libidn \
    libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
    libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
    tiff xcb-util-keysyms samba"
-- 
2.5.0


