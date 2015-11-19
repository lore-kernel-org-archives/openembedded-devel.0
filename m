Return-Path: <rafael.carre@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id BD2E46010D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 13:15:03 +0000 (UTC)
Received: by wmec201 with SMTP id c201so117250073wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2015 05:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=68XSSK2hwAIlgiw9JQc13Lrahhz9TD1Opsk/ayv2SqY=;
	b=nM0mTPwHSarTho3jaeMGs5BBjK6G1h0QpY5KGjb44OXnd+5ch4rW4AZaT+WjkzZbkA
	gX/sfrsWlOwGteIxHfwvA2JYI+NVeGJQlrD02Qw3AcnsdHfTPQahw6TApjyZYi0uxQal
	bYRRQ8jBGoxkaDRNImRrt+z2p7G4HwC9KAIO7V9LFTGpKlXcMve1tCeWJFZ6sCOahI5g
	OhWrBbXEL32nZ8doJFaWWjjdrI/GV1vC6JNRSnH40q1ltf1zdCHr3y7660SOXsFbnxdw
	KNZjF2JqPqKE8HPqK0VdOJHTeYGA0rLJrIFL0uBnOx5g535P+XqR+6n5tgCXl0m/tcgq
	+g6Q==
X-Received: by 10.28.143.79 with SMTP id r76mr11129192wmd.102.1447938904225;
	Thu, 19 Nov 2015 05:15:04 -0800 (PST)
Received: from localhost.localdomain
	(lns-bzn-47f-81-56-255-191.adsl.proxad.net. [81.56.255.191])
	by smtp.gmail.com with ESMTPSA id
	m135sm3169617wmb.0.2015.11.19.05.15.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 05:15:02 -0800 (PST)
Sender: =?UTF-8?B?UmFmYcOrbCBDYXJyw6k=?= <rafael.carre@gmail.com>
From: =?UTF-8?q?Rafa=C3=ABl=20Carr=C3=A9?= <funman@videolan.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Nov 2015 14:14:52 +0100
Message-Id: <1447938897-26171-1-git-send-email-funman@videolan.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <564DC01B.4000103@videolan.org>
References: <564DC01B.4000103@videolan.org>
Subject: [meta-multimedia][PATCH 1/6] vlc: remove libdc1394 libraw1394 from DEPENDS
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

They are only needed if the modules introduced in ea31946 are enabled.
Add these modules to default PACKAGECONFIG to keep existing defaults.
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 9adcdb1..dd00174 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -9,7 +9,7 @@ DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
    virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
    tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
    libdvdcss libdvdread lua-native lua libidn libnotify gtk+ \
-   libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
+   avahi libjpeg-turbo xz libmodplug mpeg2dec \
    libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
    tiff xcb-util-keysyms"
 
@@ -43,7 +43,7 @@ EXTRA_OECONF = "\
     ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
 "
 
-PACKAGECONFIG ?= " live555"
+PACKAGECONFIG ?= " live555 dc1394 dv1394"
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[a52] = "--enable-a52,--disable-a52,liba52"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
-- 
2.5.0


