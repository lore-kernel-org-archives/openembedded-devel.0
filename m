Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id A695760110
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 13:15:05 +0000 (UTC)
Received: by wmww144 with SMTP id w144so238047864wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 05:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=TT2faVca6mojncU1IsQPvNn1K1lER0l7IKO+NBko2RI=;
	b=n270dsQk2pnxRlL7adDQH6E/wXHLw85BReZTpJpwAppsg2R0aReQgDtp0nteHCIm2Q
	oR5I6RbJ2jsitpqIZUUwbYrheMmEfFPoiZIf6LoUjyBCjM/gYbwZMrIN9EwBFYCOEJwI
	TkM7B1sR4PxjlxicTb21CN5LsX9T/iRzFG21wbAeMzMaYJKMDQyKMUypnVWdI5Gjz8aj
	eQXzWGFO/6yRjDxEQzNswiS1bClrXYAS5jJpPF4ue+mAfZYwWN7DjjIKRN8+ldNrDqHQ
	lmHbNvO1UnnsUdfjvaG4VhcldhX4LpbXiiCl/sl8FLzKPTXfJANYo8UsWh5rMUX3qFDA
	Ov+w==
X-Received: by 10.28.184.134 with SMTP id i128mr11149928wmf.12.1447938906065; 
	Thu, 19 Nov 2015 05:15:06 -0800 (PST)
Received: from localhost.localdomain
	(lns-bzn-47f-81-56-255-191.adsl.proxad.net. [81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	m135sm3169617wmb.0.2015.11.19.05.15.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 05:15:04 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Nov 2015 14:14:53 +0100
Message-Id: <1447938897-26171-2-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1447938897-26171-1-git-send-email-funman@videolan.org>
References: <564DC01B.4000103@videolan.org>
	<1447938897-26171-1-git-send-email-funman@videolan.org>
Subject: [meta-multimedia][PATCH 2/6] VLC: make libnotify a configurable dependency
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
X-List-Received-Date: Thu, 19 Nov 2015 13:15:06 -0000

---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index dd00174..0d0baed 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
    virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
    tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
-   libdvdcss libdvdread lua-native lua libidn libnotify gtk+ \
+   libdvdcss libdvdread lua-native lua libidn \
    avahi libjpeg-turbo xz libmodplug mpeg2dec \
    libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
    tiff xcb-util-keysyms"
@@ -43,7 +43,7 @@ EXTRA_OECONF = "\
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
 "
 
-PACKAGECONFIG ?= " live555 dc1394 dv1394"
+PACKAGECONFIG ?= " live555 dc1394 dv1394 notify"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
@@ -70,6 +70,7 @@ PACKAGECONFIG[dc1394] = "--enable-dc1394,--disable-dc1394,libdc1394"
 PACKAGECONFIG[dv1394] = "--enable-dv1394,--disable-dv1394,libraw1394 libavc1394"
 PACKAGECONFIG[svg] = "--enable-svg,--disable-svg,librsvg"
 PACKAGECONFIG[svgdec] = "--enable-svgdec,--disable-svgdec,librsvg cairo"
+PACKAGECONFIG[notify] = "--enable-notify,--disable-notify, libnotify gtk+"
 
 do_configure_prepend() {
     cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
-- 
2.5.0


