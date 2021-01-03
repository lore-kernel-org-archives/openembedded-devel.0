Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.25313.1609683182962270625
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Jan 2021 06:13:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pWB99ywU;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id y24so24500679edt.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Jan 2021 06:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=83Hu6rYUpZMSihx0iblHRmM1qimmu2YrJBTFO6CN9+Y=;
        b=pWB99ywUOq2V/PVHzIN7MD7lxX7i4LgVN87pDywvjijZZpV8DAg51R8A/90CDv040c
         ODD6hHffLNfryJQUKy0Ccpqo5DoE6lxLbKRzux3pVGvIkTXicV4J6QsoxMwKMf2OwhNT
         vUI6qoq/4/cPAzhXu7JHLf3bTmpPs1RnBwvwmcPNPtmuf94fTcWMhbUV6O3U2mtLgCdY
         5fT3fB7mySFRw4GqUs8QSW1JufjI6M9l82HSrtEV2DQ8SSzKdq5sMKuxlBfOYLuINU4Z
         FUVFp3f276oHG6+8DTnLkWf18yvxENXRpgUQAkRQJw3k5l0y9IxAOnh4zYzdBX2Nfhtc
         Khgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=83Hu6rYUpZMSihx0iblHRmM1qimmu2YrJBTFO6CN9+Y=;
        b=Go39fbbtocrClAinKnaMWIqFB2OeCp7BXudeDbJ9JBQCt7YtEAFq2XdfXWD1Lwq0xY
         5pOvTbLp3e4GXf7+rCbJmOf0kBKXgrT0k4O3O6/rYL4/77yAQY0kRBVfGevfV6tAAKGO
         GGNqVzNPE8KW1IieyAsY5hHNYYJgsCxP1DsTH0XoW3a+mJ91AbkuurspLPXvebhHnOlT
         EbOEiDCL/KDUq7EHHmNX06aReTrSAvEZUi4lvwkRGTvf9yH7Io0D3gSooJFnTNblwAEp
         FKv8ZJsMQhaNTB5KFa6yPUb6PYU68YklszGyhW/TIpBPe8n7BtMpJBrppckjuV2fsEyY
         ow2Q==
X-Gm-Message-State: AOAM532sVnvMSoR/775oQdAN+F1acIRYjaihb1NtPmodWSWI2n74mUy9
	kSaOe5Rp6CXmRqPif0TpFJxmjk+Coqk=
X-Google-Smtp-Source: ABdhPJztLDwDSwFUqdKC8JGtEgOJFf8irllo+1WW2/WIqV7bgNLDx3jrc68wV4RBTVBBGTsof5Y/DA==
X-Received: by 2002:a05:6402:1841:: with SMTP id v1mr68267488edy.194.1609683181382;
        Sun, 03 Jan 2021 06:13:01 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47430798383ab6418f4c8a.dip0.t-ipconnect.de. [2003:f0:7f47:4307:9838:3ab6:418f:4c8a])
        by smtp.gmail.com with ESMTPSA id r16sm42385370edp.43.2021.01.03.06.13.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 06:13:00 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][V2 02/16] xfce4-mount-plugin: upgrade 1.1.3 -> 1.1.5
Date: Sun,  3 Jan 2021 15:12:33 +0100
Message-Id: <20210103141247.1637618-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103141247.1637618-1-schnitzeltony@gmail.com>
References: <20210103141247.1637618-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.1.5
=======================
Updated and revised German translation;
further enhanced autotools setup;
checked compilation and functionality on FreeBSD 12.2.

Release notes for 1.1.4
=======================
- Remove unused variable exclude_devicenames
- Remove obsolete panel version 4.9 check
- Remove checks for unused functions from configure.ac
- Include stdlib because malloc is used
- Spellfix. Add missing "e" to siz (size)
- Update URLs from goodies.x.o to docs.x.o (Bug #16168)
- Fix build with panel 4.15
- Make build less verbose
- Another change to the SVG icon file canvas size
- Updated svg image to have a larger canvas so that the panel can be
  resized up to 192 pixels size
- Added title to popup menu; even if it is not empty (Bug #14478)
- https URL instead of http
- Renamed improperly named member variable of main mountpoint display
  structure
- Display percentage on progress bar again (regression from port to
  Gtk3)
- Reformatted popup information with more columns and nicer alignment.
  (Bug #14670)
- Fix bug 13624 by not trying to save when closing the plugin, but
  already and only when closing the settings dialog
- Translation Updates:
  Albanian, Arabic, Asturian, Basque, Belarusian, Bulgarian,
  Catalan, Chinese (China), Chinese (Taiwan), Croatian, Czech, Danish,
  Dutch, Eastern Armenian, English (Australia), English (United
  Kingdom), Finnish, French, Galician, German, Greek, Hebrew,
  Hungarian, Icelandic, Indonesian, Interlingue, Italian, Japanese,
  Korean, Latvian, Lithuanian, Malay, Norwegian Bokmål, Occitan (post
  1500), Panjabi (Punjabi), Polish, Portuguese, Portuguese (Brazil),
  Russian, Serbian, Slovak, Spanish, Swedish, Thai, Turkish, Ukrainian,
  Urdu, Urdu (Pakistan), Uyghur

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...1-check-for-fstab.h-during-configure.patch | 30 +++++++++----------
 ...n_1.1.3.bb => xfce4-mount-plugin_1.1.5.bb} |  4 +--
 2 files changed, 16 insertions(+), 18 deletions(-)
 rename meta-xfce/recipes-panel-plugins/mount/{xfce4-mount-plugin_1.1.3.bb => xfce4-mount-plugin_1.1.5.bb} (57%)

diff --git a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch
index e2165c2fa..d81f70289 100644
--- a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch
+++ b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch
@@ -14,38 +14,38 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Patch Reworked for xfce4-mount-plugin 0.6.4->1.1.2
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
- configure.ac           |  1 +
+ configure.ac           |  2 +
  panel-plugin/devices.c | 22 +++++++++++++++++++---
- 2 files changed, 20 insertions(+), 3 deletions(-)
+ 2 files changed, 21 insertions(+), 3 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index b131117..c633fef 100644
+index 375e64a..590b7ad 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -69,6 +69,7 @@ AC_CHECK_HEADERS([sys/socket.h])
- AC_CHECK_HEADERS([sys/time.h])
- AC_CHECK_HEADERS([unistd.h])
- AC_CHECK_HEADERS([sys/sockio.h])
+@@ -65,6 +65,9 @@ dnl param.h is part of libc6 on Linux, but important for old-style Unix and espe
+ AC_CHECK_HEADERS([sys/param.h])
+ AC_CHECK_HEADERS([sys/mount.h])
+ 
++dnl make musl happy
 +AC_CHECK_HEADERS([fstab.h])
- AC_HEADER_SYS_WAIT
- AC_PROG_GCC_TRADITIONAL
- AC_TYPE_SIZE_T
++
+ dnl Add -traditional to output variable CC if using the GNU C compiler and ioctl does not work properly without -traditional. That usually happens when the fixed header files have not been installed on an old system. Leave here commented out to comment in if some older *NIX systems might require it as was recently written on the ML.
+ dnl AC_PROG_GCC_TRADITIONAL
+ 
 diff --git a/panel-plugin/devices.c b/panel-plugin/devices.c
 index 797b079..d29df56 100644
 --- a/panel-plugin/devices.c
 +++ b/panel-plugin/devices.c
-@@ -24,8 +24,10 @@ Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
- #ifdef HAVE_CONFIG_H
+@@ -25,7 +25,9 @@ Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
  #include <config.h>
  #endif
--
+ 
 +#if HAVE_FSTAB_H
  #include <fstab.h>
 +#endif
-+
  #include <glib.h>
  #include <stdio.h>
- #include <string.h>
+ #include <stdlib.h>
 @@ -468,11 +470,12 @@ disks_new (gboolean include_NFSs, gboolean *showed_fstab_dialog, gint length)
  {
      GPtrArray * pdisks; /* to be returned */
diff --git a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.3.bb b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb
similarity index 57%
rename from meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.3.bb
rename to meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb
index 4600104ad..1fb82b740 100644
--- a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.3.bb
+++ b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin_1.1.5.bb
@@ -6,6 +6,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-panel-plugin
 
-SRC_URI += "file://0001-check-for-fstab.h-during-configure.patch"
-SRC_URI[md5sum] = "2f1f903d0bdf6ee6776afd8af73497ac"
-SRC_URI[sha256sum] = "aae5bd6b984bc78daf6b5fb9d15817a27253674a4264ad60f62ccb1aa194911e"
+SRC_URI[sha256sum] = "584cd954929e542b3da0ff8d69e0325d8838dc39e7b32a509d1074ce3bb58ec2"
-- 
2.26.2

