Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.9393.1609946274108228578
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b/x5/OFM;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id b2so4753199edm.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=syL5JcQUYMGFsR2BsBS5h1+Jy/NPmGDGy4xG/6yButM=;
        b=b/x5/OFMwLkoxOouO/rdN05+VKlGb/yVg7+kXD3HQqdFzj7ltuoYCowR38oRW83O06
         m/KGlAwJkOZKD91qGawyPeUqLG7jv+D5FQcNgZcYQVAlqf88n85Dyb/CS9d7hY1vHpUN
         NdCspOrGPyXgkUYXhePpqn+19gIMKkY0gU9OxxlIH4WnMYusqKS5YXnLkNvH1K3u5FNh
         gXhnJ1VKek9KcwMR438GoIM++dIspwNgWUdhEkmWZ69kge+4uE7ljGcKq+F2qUA5XQ1v
         IWP9dU9tTewUfUNqcYUmc03rDGrm4gfEDwq+mMLQqS5B+C0Ir/oU+F/neMJXefCxoD1S
         zxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=syL5JcQUYMGFsR2BsBS5h1+Jy/NPmGDGy4xG/6yButM=;
        b=ARXoDrNWLBCRiU+Bj20WaQHQQ0GoOI8tnQqtoSL0tmODNd5zi/18CvP1qW2ehyylln
         nEHIoqwwkqySod/epUz12JCY6Fg66TBYBembgbaEL499ItqJ8xssFO3+iIIzds4j8qbg
         eQggNL3Pm1jO0hNFhRe34c9v+AK4o3npWY75t03wjPQY9g4JAIMK2kpx154stZaTw494
         grqw4pBMyMhbq+0lWlfTVSsI7pZAV8fSaHWwNxOMZvik9povBBtTcwzF9pA4tdWdjAhO
         vT6FJpr1NvnHUPY6+7SihNns+00k9fkM7rS/BMi9Sv3IGZJ8bpFHbCqjdIzmNdWIdBqR
         l5sw==
X-Gm-Message-State: AOAM533i9Q09daD4kbePys/SQGOSZjOj06QHREgEK82phkTVrtXSZ4ta
	NvIr0aGpKhrP0+gCSaVekxL04eIDIjG9Fw==
X-Google-Smtp-Source: ABdhPJzmGHbcO4XRcLNHycpYtSj1Iej2PA+57bCs1aSqRkVw3a+ggTLL0Vblj2TRYCAHH+WgX8sqLw==
X-Received: by 2002:aa7:de0f:: with SMTP id h15mr4417732edv.110.1609946272719;
        Wed, 06 Jan 2021 07:17:52 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:51 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 18/28] xfce4-screensaver: upgrade 0.1.10 -> 4.16.0
Date: Wed,  6 Jan 2021 16:17:07 +0100
Message-Id: <20210106151717.1779543-18-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix-pam-config.patch was applied upstream

Release notes for 4.16.0
========================
This release version has been bumped from 0.x to 4.16.0 to align with
the new Libxfce4util and Xfconf GIR requirements.

- xfce4-screensaver-configure: Use GIRepository of libxfce4util and
xfconf (#11)
- Change type of seconds to guint in add_lock_timer
- Check dbus system_connection in add_sleep_inhibit
- Cleanup GSourceFunc usage
- Convert date_time_update to a timer function
- Fix format specifiers in lock_timer
- Fix issues connected to dbus (#66)
- Fix pam_strerror usage
- Pass constants to XSetScreenSaver
- Plug memleak in get_x11_idle_info
- Remove obsolete check for scrnsaver.h from configure.ac
- Translation Updates:
  Czech, Japanese, Portuguese, Turkish

Release notes for 0.1.11
========================
[Please note that this is a development release.]

Configuration Update:
This release updates the DPMS settings used for the Blank screensaver.
Timeouts are now stored in seconds instead of minutes, with the default
DPMS sleep now 5 seconds after the screensaver goes active. Xfconf:
/xfce4-screensaver/screensavers/xfce-blank/dpms-sleep-after

Theme Update:
This release uses a new icon name, org.xfce.ScreenSaver, instead of the
generic preferences-desktop-screensaver.

NEWS:
- Builds: Move from exo-csource to xdt-csource (Bugzilla #16717)
- CI: Add basic GitLab pipeline
- distcheck: Add missing gs-auth-pam.c
- DPMS: Change sleep settings to seconds, default after 5 seconds (#27)
- Fix: Catch gs_listener_dbus_init failures
- Fix: remove unused flag --no-daemon
- Icons: New icons and rDNS icon name, org.xfce.ScreenSaver
- Internal: Change timers from milliseconds to seconds
- README.md: Note setuid requirement after install with shadow/bsdauth
(#9)
- xfce4-screensaver.common-auth: replace @include with standard systax
(#6)

Translation Updates:
Albanian, Armenian (Armenia), Basque, Bulgarian, Catalan, Chinese
(China), Chinese (Taiwan), Czech, Danish, Dutch, Eastern Armenian,
English (Australia), Estonian, French, German, Hebrew, Hungarian,
Icelandic, Italian, Japanese, Korean, Lithuanian, Malay, Norwegian
Bokmål, Polish, Portuguese, Portuguese (Brazil), Russian, Serbian,
Slovak, Slovenian, Spanish, Swedish, Thai, Turkish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xfce4-screensaver/fix-pam-config.patch         | 14 --------------
 ...saver_0.1.10.bb => xfce4-screensaver_4.16.0.bb} |  9 +++------
 2 files changed, 3 insertions(+), 20 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-pam-config.patch
 rename meta-xfce/recipes-apps/xfce4-screensaver/{xfce4-screensaver_0.1.10.bb => xfce4-screensaver_4.16.0.bb} (77%)

diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-pam-config.patch b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-pam-config.patch
deleted file mode 100644
index 94cad23f8..000000000
--- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-pam-config.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-'@include' is not a standard sysntax and not supported by oe.
-
-Upstream-Status: Submitted [https://bugzilla.xfce.org/show_bug.cgi?id=15626]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-diff --git a/data/xfce4-screensaver.common-auth b/data/xfce4-screensaver.common-auth
-index a9fd9ce..3bfea70 100644
---- a/data/xfce4-screensaver.common-auth
-+++ b/data/xfce4-screensaver.common-auth
-@@ -1,2 +1,2 @@
--@include common-auth
-+auth include common-auth
- auth optional pam_gnome_keyring.so
diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.10.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.16.0.bb
similarity index 77%
rename from meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.10.bb
rename to meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.16.0.bb
index 62f0640f0..d4ea43ce1 100644
--- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_0.1.10.bb
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.16.0.bb
@@ -12,16 +12,13 @@ DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfcon
 
 inherit xfce-app
 
-SRC_URI_append = " \
-    file://fix-cross-compile.patch \
-    file://fix-pam-config.patch \
-"
-SRC_URI[md5sum] = "1f093cde5af09e9fd9be017774e032ef"
-SRC_URI[sha256sum] = "586f1c78dd6745a20e9ce9f12d0117189d597ba7ad0c8ffcfcd25c9bb05f1d57"
+SRC_URI_append = " file://fix-cross-compile.patch"
+SRC_URI[sha256sum] = "6d4d143e3e62db679ce83ce7da97903390773ee0a8ceb05ff4c3dac36616268d"
 
 do_install_append() {
     install -D -m 0644 ${S}/data/xfce4-screensaver.common-auth ${D}${sysconfdir}/pam.d/xfce4-screensaver
 }
 
 FILES_${PN} += "${datadir}/dbus-1 ${datadir}/desktop-directories"
+
 RDEPENDS_${PN} += "python3-core"
-- 
2.26.2

