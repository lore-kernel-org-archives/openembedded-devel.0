Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED3DC5AD4E
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 04:36:01 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22832.1786336555904236687
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Aug 2026 21:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=raspNos/;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1039912a12.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 09 Aug 2026 21:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786336555; x=1786941355; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LiZjpk9lLBYWxe9hxrcISYlXqx+PQVperhy+phetsTo=;
        b=raspNos/HzB1/sznfTWAnLuD4eRGFRNQWcTL9NkOZigUJ3bih+8g4umrvBXmc8LgNZ
         aafDZALS+Y1BN31p3CKtZu+6SEMjGu6HXAUdflxoh5wWfEDsIHrdghk8C5JLNrJz4HX+
         71C7MGRtQpeVzPREcohjx7Io1NZJNPl4J27OZccuxDKnlF9GGTsK4/6GGRq0spQMglJi
         GsVxIA8uWeF/rabhpGLHneAcx8bXqRGUT0NlcMDCh4li4b2/xYO58Vrj0+SgAc192Z7Y
         woEyALNQS/sras2xubis3lkdX98iUeVTaTur5TMbnseeF+EqToYONFAFlpnwyTepN8IP
         1mtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786336555; x=1786941355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LiZjpk9lLBYWxe9hxrcISYlXqx+PQVperhy+phetsTo=;
        b=aZJRsV8HLpX6l4URo0JvJi2T2IatXhEJNYkEpaSlsRq3aEwe8U/AHOJiHNPBxRe1yY
         gmXs6fb6WvYtDOYwoC+r8NSMlia90udgT5ulyRtE4fp8H1ujsp1RviG6OeTajgWRM+iM
         MLi+bWcCcn+iFV2k81GivAb29WVa/MNWefq8ogv/3VgOrYhrH0aIglcd6w+2jqOQNkjP
         BqbxQ5By+0C3rxxnqcMNHHhHK61JMmGxo9GOubnlZnowJyoOGyjs3zLxTgy22zrtTLl/
         DyG7knuJIdwcymrOo2VB8chdpv8pvij+Ol/6AO3nTeZniXo9+vS3aM1SKOsYcN+qLN7V
         v7eg==
X-Gm-Message-State: AOJu0Ywtjl9Q3+E4lOlD6bd5qq0QaDb56/5gXhwTjaEXxoQqbsM7xylA
	Lid/2uSDxycwLp8cSJcEoblWZK9FEtBKCE5gU36yNj6AOFrdFbxa+qETTXbTRA==
X-Gm-Gg: AR+sD136dDnKpbfBYakBieo9F1rsIyv5mk4EsCCJ9DK1r6snfY1JDas9He5aKjmPxwa
	Xx0RURR5Zilqjaqj6jaf8hqKVlOI4zMlCblMDU/sxT9GJuHsWZFMK9JeAWgtKaf7rqIZowsDZii
	i0TV3OLQFJ+KBkoNGAxcCQPVc/qr+Qqn3RRFR0fqJ+6DjkdoOGiZP4NDzcjvs7hpuG4ymsnuje6
	UU/LrTzK/Ct18ZB0p08JbjxbIJf55a5uoZMIMxTpgKWpU8rgBOp78l969B/leIRt3YiO7gLZkV/
	cuGgK5L0OHwpNfyGWgKkrA4gC2LFnh7bx8rpz+tYFCj2daTlNz4LecCTVkLgG1i6oPnaPvsajO4
	1L+gLecnqoANhgPExmH4pXLDjtyTGXwJsNQInBJv2TETZtGMk2Fxy89iqDSC1Ad6BuolxYYKzFJ
	RJzKxQKjJcP3etTOoYvpNBgUZZ1Zmmp/XlZKDGj3B5w2NHCxgics64oMxeqBClB6+pwKTy0MoV3
	+/TCqmCuYZ2
X-Received: by 2002:a05:6a20:e211:b0:3c3:875d:c546 with SMTP id adf61e73a8af0-3cbce6cadc7mr18377004637.7.1786336554941;
        Sun, 09 Aug 2026 21:35:54 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be568bd3sm36941372eec.0.2026.08.09.21.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 21:35:54 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 1/1] mpd: fix build error with libupnp v1.14.30 onwards
Date: Mon, 10 Aug 2026 16:35:46 +1200
Message-ID: <20260810043546.623954-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 04:36:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128875

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

libupnp >=1.14.26 introduced API breakage which got reverted in 1.14.30
Backport upstream patch to allow build with libupnp >=1.14.30

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../musicpd/mpd/0001-upnp-allow-1.14.30.patch | 45 +++++++++++++++++++
 .../recipes-multimedia/musicpd/mpd_0.24.9.bb  |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/0001-upnp-allow-1.14.30.patch

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-upnp-allow-1.14.30.patch b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-upnp-allow-1.14.30.patch
new file mode 100644
index 0000000000..1d2497fd7f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-upnp-allow-1.14.30.patch
@@ -0,0 +1,45 @@
+From e30056b76ecfbe94acfa462cbfda5e4e6e0c25ad Mon Sep 17 00:00:00 2001
+From: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
+Date: Tue, 17 Mar 2026 20:29:19 +0100
+Subject: [PATCH] upnp: allow 1.14.30
+
+ABIbreak in 1.14.26 has been reverted w/ 1.14.30, reapplied in 1.18.X
+align with upstream versions and make easier packaging.
+
+Signed-off-by: Nicolas PARLANT <nicolas.parlant@parhuet.fr>
+(cherry picked from commit b54634fb99c9703a05334ed8920955d3c875e6e2)
+
+Upstream-Status: Backport [https://github.com/MusicPlayerDaemon/MPD/commit/b54634fb99c9703a05334ed8920955d3c875e6e2]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/lib/upnp/meson.build | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/upnp/meson.build b/src/lib/upnp/meson.build
+index 9c2c7bac1..fa4886a11 100644
+--- a/src/lib/upnp/meson.build
++++ b/src/lib/upnp/meson.build
+@@ -13,7 +13,10 @@ endif
+ if upnp_option == 'auto'
+   upnp_dep = dependency('libupnp', version: '>= 1.8', required: false)
+ 
+-  if upnp_dep.found() and upnp_dep.version().version_compare('>= 1.14.26')
++  if upnp_dep.found() and (
++    ( upnp_dep.version().version_compare('>= 1.14.26') and upnp_dep.version().version_compare('< 1.14.30') )
++    or upnp_dep.version().version_compare('>= 1.18.0')
++  )
+     warning('Your libupnp version is known to be broken, see https://github.com/pupnp/pupnp/issues/528 - disabling')
+     upnp_dep = dependency('', required: false)
+   endif
+@@ -25,7 +28,10 @@ if upnp_option == 'auto'
+ elif upnp_option == 'pupnp'
+   upnp_dep = dependency('libupnp', version: '>= 1.8', required: true)
+ 
+-  if upnp_dep.found() and upnp_dep.version().version_compare('>= 1.14.26')
++  if upnp_dep.found() and (
++    ( upnp_dep.version().version_compare('>= 1.14.26') and upnp_dep.version().version_compare('< 1.14.30') )
++    or upnp_dep.version().version_compare('>= 1.18.0')
++  )
+     error('Your libupnp version is known to be broken, see https://github.com/pupnp/pupnp/issues/528')
+   endif
+ 
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb
index 0c3d672949..e7db08860c 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb
@@ -20,6 +20,7 @@ DEPENDS += " \
 
 SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https;tag=v${PV} \
            file://mpd.conf.in \
+           file://0001-upnp-allow-1.14.30.patch \
            "
 SRCREV = "7a9afa059e95668c912f779219ee8fe1e44dd2aa"
 

