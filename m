Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 53FF77327F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 May 2016 14:33:58 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id e201so9092499wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 May 2016 07:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uQYQYDIe5FJg7RmJgkEPzFjsII/kpjW0Q1bHrv7DKLE=;
	b=SnssfOcfyxnMWDayiyKasOckKJ6mUEYRrQdtSBXeLAI7XQV6z56gimc76Y3KFoRnUn
	FhrwyBVhRDdUf+q8pMqVpMiVDYYhNLsz5t52NW++hwW3BwRvRgj28ChHPQ5DqDtr/bnK
	z0fLevtw1HwFTyR3uZPyPSF+4DtFERfpK3f+8Tr4BBp5+RJ0GwtfMEQjzkcp6ayiXfnG
	QBseL47WCIW9VDuvahDeWXr/lO3Jpl4fBTTb6YZuwz64zUeADnDZ+m7cZ+28ZhlsUIWr
	QeCxlB831wtMhe5vUUHFKQfHs0cbj+pBHUXE5DcmBO5fzPpUlLuSc6mcgTicKJktWOz7
	DkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uQYQYDIe5FJg7RmJgkEPzFjsII/kpjW0Q1bHrv7DKLE=;
	b=OuQH2UE7AyGqyznjajbNeil0tQlv2ma4F5ICkJIcGwHfhULahiaQ8FwdsO8DCHZs2K
	GTGhiumTnyxw/L1ZI14vaCORbYK7S3m0fAtWe+3s+Hl/c5GgtlJCaiwVjRHMH6rU+W7E
	0I44H+PpcsJdNmXsjsvJ0qYM5ev5BsB/lkDRMQvRdjj+Ijr5+Psm0fNNLs0r5qp18apb
	mzlTOdMenzvDAkEPy8O8rYcwMvQ2UDPcOvVEUlkvZl0N5RvTOPvTsFhh/FtSuDhFNMvR
	qa2c+xv8A3PlQ6cepClNvi62lfcsgTgq4mVZkPcJnWtwXUXP7tbB0tA0AibrIQjg9UFK
	c5BA==
X-Gm-Message-State: AOPr4FV4bH2HXXbwrl5MHYvO+HqRP3EhGmXINZzm3t5qR8YBTkGQ23T1rawvGPNuCzolpw==
X-Received: by 10.194.190.201 with SMTP id gs9mr23124817wjc.133.1462545238908; 
	Fri, 06 May 2016 07:33:58 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id b12sm8794166wmb.0.2016.05.06.07.33.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 May 2016 07:33:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 May 2016 16:35:23 +0200
Message-Id: <1462545324-27232-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462545324-27232-1-git-send-email-Martin.Jansa@gmail.com>
References: <1462545324-27232-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][krogoth][meta-oe 2/3] pidgin: add PACKAGECONFIGs
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
X-List-Received-Date: Fri, 06 May 2016 14:33:58 -0000

* disable gstreamer and vv, because gstreamer 0.10 is in meta-multimedia now
* disable farsight2/farstream, because farsight2 is blacklisted
* don't enable X11 support without x11 in DISTRO_FEATURES
* allow to disable all UI, useful for DISTROs who want just the purple libraries
  like LuneOS

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb | 31 ++++++++++++++++++------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb b/meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
index 9133c1c..ac0871f 100644
--- a/meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin_2.10.12.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "multi-protocol instant messaging client"
 SECTION = "x11/network"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-DEPENDS = "python startup-notification avahi gtk+ ncurses gnutls virtual/libintl gstreamer dbus intltool-native farsight2 libidn libxml2 gconf dbus-glib"
+DEPENDS = "python virtual/libintl intltool-native libxml2 gconf"
 
 inherit autotools gettext pkgconfig gconf perlnative
 
@@ -16,18 +16,33 @@ SRC_URI = "\
 SRC_URI[md5sum] = "14e0f5cfb2ed065e4dc80391a806ac76"
 SRC_URI[sha256sum] = "2c7523f0fefe89749c03b2b738ab9f7bd186da435be4762f1487eee31e77ffdd"
 
+PACKAGECONFIG ??= "gnutls consoleui avahi dbus idn \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 gtk startup-notification', '', d)} \
+"
+PACKAGECONFIG[farsight2] = "--enable-farstream,--disable-farstream,farsight2"
+#  --disable-gstreamer     compile without GStreamer audio support
+#  --disable-gstreamer-video
+#                          compile without GStreamer 1.0 Video Overlay support
+#  --disable-gstreamer-interfaces
+#                          compile without GStreamer 0.10 interface support
+#  --with-gstreamer=<version>
+#                          compile with GStreamer 0.10 or 1.0 interface
+PACKAGECONFIG[gstreamer] = "--enable-gstreamer,--disable-gstreamer,gstreamer"
+PACKAGECONFIG[vv] = "--enable-vv,--disable-vv,gstreamer"
+PACKAGECONFIG[idn] = "--enable-idn,--disable-idn,libidn"
+PACKAGECONFIG[gtk] = "--enable-gtkui,--disable-gtkui,gtk+"
+PACKAGECONFIG[x11] = "--with-x=yes --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--with-x=no,virtual/libx11"
+PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
+PACKAGECONFIG[consoleui] = "--enable-consoleui --with-ncurses-headers=${STAGING_INCDIR},--disable-consoleui,ncurses"
+PACKAGECONFIG[gnutls] = "--enable-gnutls --with-gnutls-includes=${STAGING_INCDIR} --with-gnutls-libs=${STAGING_LIBDIR},--disable-gnutls,gnutls"
+PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus dbus-glib"
+PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
+
 EXTRA_OECONF = " \
-    --enable-vv \
     --disable-perl \
     --disable-tcl \
     --disable-gevolution \
     --disable-schemas-install \
-    --x-includes=${STAGING_INCDIR} \
-    --x-libraries=${STAGING_LIBDIR} \
-    --enable-gnutls=yes \
-    --with-ncurses-headers=${STAGING_INCDIR} \
-    --with-gnutls-includes=${STAGING_INCDIR} \
-    --with-gnutls-libs=${STAGING_LIBDIR} \
     --disable-gtkspell \
     --disable-meanwhile \
     --disable-nm \
-- 
2.8.2


