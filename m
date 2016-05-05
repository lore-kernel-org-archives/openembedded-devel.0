Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 75BF36FFE8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 15:01:40 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id n129so24133499wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 May 2016 08:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uQYQYDIe5FJg7RmJgkEPzFjsII/kpjW0Q1bHrv7DKLE=;
	b=hZzTB1WF6ljObwqaSGJT9hx7TgAnA8g2cVM6sRVL3E00nf1yWtMyVvrAaplYyv8flP
	XBnLea+B843WD2V+C0oeIBAj9+IP/fHsoYydpf303YAli+VPgjoUoVmHnT7pzxb6qcAc
	7rMdx/uaooaNr4IENYfpb4ZYCjEQkqhCcTCOu244DiVRqN5gjoYsb7W3Cw/k7eMGzabt
	gP4pjLKZp0q10ihq0LgHLKD6eVr4+RGEJyXxbRjTIS4PZed3jwtXegf596oBbOzqoU/W
	zQ9bjbSXjgScyCo1OurPCP6Cy7jQQ+Pf7wCLkUo0GuKVxBaKNod9XBiIKlI6c+SZVFd2
	YzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uQYQYDIe5FJg7RmJgkEPzFjsII/kpjW0Q1bHrv7DKLE=;
	b=dlpLKt2Ofz8LeJXDzgTkz7WcwLyQ3e0UPFdPFD/n9RqktjLrTtnPtKT4mnnoR6auto
	DNQLenBaLReOwSWbjbfgYdv3pyAW3oxzqBO7bbNevBerY2Bz/Na8Oa5+FnwR6eIjVVnQ
	4xx7m2cUuosNumDAL6g+X/4ao9eoPuVcAvaHKW4uqCK25wBW/3nfUaBvFHp2nTI5J4wb
	/c2M/p97FqNRtVzhEYVgdzOrYJDNcZQhU6aIbli6YgHZSuvmweuyMtkYaBv1tAsp6+5T
	+h7uC59xrxABKTFSOdxAJArSS6nyOSU2A+rC1JwTSTM9RRO+OhYLddjgv789ZWoXRCcz
	6ZAA==
X-Gm-Message-State: AOPr4FWJ3fUa1jz1zR4e3dVfqxPc7p8posQaocEI2RiJK4SQO5pVRyLk+auFyRIABClYyQ==
X-Received: by 10.28.16.136 with SMTP id 130mr3984343wmq.23.1462460501105;
	Thu, 05 May 2016 08:01:41 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id b15sm3614849wmd.1.2016.05.05.08.01.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 May 2016 08:01:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 May 2016 17:02:58 +0200
Message-Id: <1462460580-12774-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462460580-12774-1-git-send-email-Martin.Jansa@gmail.com>
References: <1462460580-12774-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 2/4] pidgin: add PACKAGECONFIGs
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
X-List-Received-Date: Thu, 05 May 2016 15:01:44 -0000

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


