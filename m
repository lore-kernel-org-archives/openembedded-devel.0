Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id E8C847317F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 13:25:45 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id c200so28437431wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2016 05:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=IfY4Gf72qqVRl6kDESJ9yiTCv5vxBwVDXJBcwFxhaVA=;
	b=XRPBWzNJHjlw7Lu56qdk2bahRqKIDILNxX4Gsj+Ru3cWa3z9HsHNPV9MSFZBOpgnG7
	iQ6EbxUe8Gol8eErEzlU4zvG+B+CWCM5SiMAx9jCmIbAJUGokvEy8EsZAXGvI0A+WLF0
	JU7E1DWavcZmWjnvAbahCNpE5vJhACI+oMwSRtHnApoTEH4S5fFtbC5Ihqq4fWL6hkiK
	S+iS+N4lxFI07z2PSm9ZTuYS+fc4Bq9Jk9g4xhLOcBpAo/D6rUPdo1o3KQYJxOUVx3Ar
	tOr8X6iq0YVe9rGmVgk6NdP4fQw8oSos0u8GFSfr2tJ5Vhhged1mC2KDEKkQZyB3soNd
	Jfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:subject:date:message-id
	:in-reply-to:references;
	bh=IfY4Gf72qqVRl6kDESJ9yiTCv5vxBwVDXJBcwFxhaVA=;
	b=PMTRFhl9k7XgiYt55ESWyemd6r5mdKcrN5QeiHr/aVmA3a1roerkjC8l9rqevWxBfF
	uf0SuP5AQKRWxju2t5Z1dBhbf9TTdxC0bxTFtisjGZzmYWrrYlGkW/gzhWfORulUabD9
	UHjmZXVEcYO/PbVzCglHydwZ+xkE7h98j6gIN8OJNClqe8kj+flEkHaeLfyfh/p62hh4
	BZbD4ozQo4NXejFG5YgXhtP494fBRKwj7yFHHxzQCJN1G1GLNgrV6umlIx75JV5jLkDm
	ANRSVycbFwklZFlCFW+aByu83PUgaQIFjx+P4l/budqTr0YHUH/3z8D1aarybvayCAh+
	04JQ==
X-Gm-Message-State: AG10YORSI7f2qRAAH/WQCAmxhIg6QLX4t+ZH8OjAxPEt0d2lJxE7sWp5OiL+6AfY94v1ig==
X-Received: by 10.194.175.233 with SMTP id cd9mr41004464wjc.115.1455110746181; 
	Wed, 10 Feb 2016 05:25:46 -0800 (PST)
Received: from localhost.localdomain ([81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	c136sm22230220wmd.3.2016.02.10.05.25.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 05:25:44 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Feb 2016 14:25:40 +0100
Message-Id: <1455110740-4556-1-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455108862-2507-2-git-send-email-funman@videolan.org>
References: <1455108862-2507-2-git-send-email-funman@videolan.org>
Subject: [meta-multimedia][PATCHv2] vlc: make sdl optional (enabled by default)
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
X-List-Received-Date: Wed, 10 Feb 2016 13:25:47 -0000

---
Add sdl to x11 check

 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 2887a68..3267dad 100644
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
@@ -39,8 +38,9 @@ EXTRA_OECONF = "\
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
 "
 
-PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread {@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread {@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 sdl', '', d)}"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
+PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl libsdl-image "
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[live555] = "--enable-live555,--disable-live555,live555"
-- 
2.5.0


