Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2D8B373179
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:54:28 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id c200so4037114wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 04:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=xS8/CoOWz3WvYtFdCSmGuI5RitbcrZAhbeWOhRzbPvI=;
	b=xNWEOS2fweou+75/EgzSQtSH+bNwCjLLXH2uFEppgcOQi4yhgEi+ABjLaX9HsJqOwH
	kwFpwqNP+nIeK404QYeY8O5MmA5+AO7MNIeyFB2Qyno6S9tpxtQo3GaLw0gkrv/9do3i
	4o8ye9ai86KdV7K/Xz7lcTu2XtjJ3hXjQ8aqPcsESpjaAD76M2jPrZBNOURvRnLj7Me0
	g/8S8fwWqTRVgE/pxYpShHkaMOgArotCRCCpDVPX7J94/ls3Jb9tkPG9h3AhWMv4Ljec
	1d1oQcNfzpkiKBcEVvlcixNUUGU0bi+46BMy8vQmAdFqt/eoOgskdcvVlyRqT+8Swo4Q
	x0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=xS8/CoOWz3WvYtFdCSmGuI5RitbcrZAhbeWOhRzbPvI=;
	b=EzT5j3OWkKfeOM+s9coro8bFJwAebEMpGNxsgFl7/nJCaxfXZgyFFmsEd5npRIu72B
	CSSkWA/gdtef+PmNLO1kHQGJhyT4iIgDeU/X//+TQdoHKXMyaOdcTb+evWbBJV9f5SUn
	+/IYHIh17b2+bPnK0ZWD0xV0iSNWDURGR3PXWspj7wMzAhpAIWRFvoyUnsr0axVR2ZxL
	iW94SSVQ5stDlweO4+Oo1nwCI3NoZTvEReytgkOoCAcGvsc7Zp87KBeuoCzKcKeMB92n
	m1hm/bgrzxg1RfVF3i/2Pz5iTkA/ZAc8xe+BSr0XFvvz0AhqWO2EtbpSj1m7iUKh1S5U
	13Zw==
X-Gm-Message-State: AG10YORFI2yFK+93dIhd5m/trp5Av8pA12+m9tjfCoMt3YciP1VMqsoeqXv7BABzcfSNxQ==
X-Received: by 10.28.126.205 with SMTP id z196mr10469531wmc.44.1455108869485; 
	Wed, 10 Feb 2016 04:54:29 -0800 (PST)
Received: from localhost.localdomain ([81.56.255.191])
	by smtp.gmail.com with ESMTPSA id w66sm3347256wmd.2.2016.02.10.04.54.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 04:54:28 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Feb 2016 13:54:22 +0100
Message-Id: <1455108862-2507-2-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455108862-2507-1-git-send-email-funman@videolan.org>
References: <1455108862-2507-1-git-send-email-funman@videolan.org>
Subject: [meta-multimedia][PATCH 2/2] vlc: make sdl optional (enabled by default)
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
X-List-Received-Date: Wed, 10 Feb 2016 12:54:29 -0000

---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 2887a68..c85a811 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
-   virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
+   dbus dbus-glib libxml2 gnutls \
    tremor faad2 ffmpeg flac fluidsynth alsa-lib \
    lua-native lua libidn \
    avahi jpeg xz libmodplug mpeg2dec \
@@ -25,7 +25,6 @@ EXTRA_OECONF = "\
     --disable-screen --disable-caca \
     --enable-httpd --enable-vlm \
     --enable-freetype \
-    --enable-sdl \ 
     --enable-png \
     --enable-tremor \
     --enable-v4l2 --disable-aa --disable-faad \
@@ -41,6 +40,7 @@ EXTRA_OECONF = "\
 
 PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread {@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
+PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl libsdl-image "
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[live555] = "--enable-live555,--disable-live555,live555"
-- 
2.5.0


