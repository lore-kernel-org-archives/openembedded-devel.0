Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.9401.1609946252710596407
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q7bSYnIB;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id dk8so4772856edb.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PPACYAtwDEVuJ0xnN54h7nuAwyLzDs6kMNICk3cPo+w=;
        b=q7bSYnIBfyWL7+vsDTSniNdTNx4a5Dde5Msxh7dRXPDI4pHJo+AmHM12GUJiaFyVDe
         ECbHLI23lfG0s6XXWluzdxvI5n0txVwPFGnG1Z6nCaHBOU5L5cvAgQVZ2LgLZtrtR0Ae
         RkeH+V1Nv1nsqklphXAX48wsNQq9DqqpxgGLHeNJk1GEPxvKgFTCKFHjZpT0GywwLwld
         5yc1opSmFpRXJMC3aBMYZ07LMba0GeEXMOIDRJ+AsZZ/Y+zOn11SJKfuTckfs1jygdWG
         hQeKeAjt2XUwdz9yspa55pVuQxMXc2cPV+PoIf2tdayURnnXci7bRZT04xLZN7KHU39e
         fL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PPACYAtwDEVuJ0xnN54h7nuAwyLzDs6kMNICk3cPo+w=;
        b=R3U9/EFkRq2AEbONtp+FF1VLALX2rBzDTvHg3+HKSl2SQ9FWKWTHAHkUAdODhjGT8Y
         gEMZW6Btq1J5mytwuUU8RREIIrQHKiYRPm9V1O7zZPytF+G0SmILkR6yDrPALZWuSnee
         VjByv6sfP5KibIqQeIhvZTHJO7olTYSSJVhPGdP1LqUEvdwRrPibfWyu11d3sTeAZpjE
         jdSmk7R1rlPHW9r+v76Rc4xAdndAWE88OjJzzriCyd9NxxhtBvAX0orfloReOsc/tur9
         z6N6uqioDL8xWFV9PHopo2zYMl7fOyzYuuvI4pTOhG/HCasH6wlYf8eTw3Us97vXceYy
         LQEA==
X-Gm-Message-State: AOAM530bOhF4iQZjANs8ySTq6Otvy+8BqHn6Fdvfd+KfcdCpjtIikhOH
	JzqgaVo4BpRhKtmDGLCi5dBzfAG7Mfdt0g==
X-Google-Smtp-Source: ABdhPJzYaxKoZM+IchvhhiClhT6uXqTwQEsuxHG66TWU76zT77V59uQWr0LGBFFifJP8KntxdqThSQ==
X-Received: by 2002:a05:6402:1386:: with SMTP id b6mr4296358edv.42.1609946251237;
        Wed, 06 Jan 2021 07:17:31 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:30 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/28] libxfce4util: upgrade 4.14.0 -> 4.16.0
Date: Wed,  6 Jan 2021 16:16:51 +0100
Message-Id: <20210106151717.1779543-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.0
========================
- Bump xfce_version_string to 4.16
- Properly handle URI schemes other than "file"

Release notes for 4.15.6
========================
[Please note that this is a development release.]
- Update configure.ac.in syntax
- Namespace of the gir needs capital first letter
- Bump GLib (and gio, gthread, etc) minimum to 2.50.0
- Remove typedef already defined by G_DECLARE_FINAL_TYPE macro
  (Fixes #4)

Release notes for 4.15.5
========================
[Please note that this is a development release.]
This is an emergency release to account for the lack of version bump to
4.16pre2 in 4.15.4.

- Bump Xfce version to 4.16pre2
- Add README.md to EXTRA_DIST

Release notes for 4.15.4
========================
This is a development release of libxfce4util aiming the upcoming
release of Xfce 4.16.

- Create README.md
- Translation Updates:
  Albanian, Armenian, Hebrew, Slovak, Uyghur

Release notes for 4.15.3
========================
[Please note that this is a development release.]

- Version bump in preparation of 4.16pre1

Release notes for 4.15.2
========================
[Please note that this is a development release.]

- Complete the field codes expansion

Release notes for 4.15.1
========================
[Please note that this is a development release.]

- Add field codes expansion and related utilities (code moved from
  garcon)
- docs: Show the "Miscellaneous Utilities" section
- Add basic GitLab pipeline
- Translation Updates:
  Albanian, Armenian (Armenia), Asturian, Belarusian, Hindi, Italian,
  Spanish, Uzbek

Release notes for 4.15.0
========================
- Bump the Xfce version to 4.15
- Translation Updates:
  Albanian, Galician, Spanish

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{libxfce4util_4.14.0.bb => libxfce4util_4.16.0.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4util/{libxfce4util_4.14.0.bb => libxfce4util_4.16.0.bb} (64%)

diff --git a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.14.0.bb b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
similarity index 64%
rename from meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.14.0.bb
rename to meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
index 1bb5007fd..1a0b7183e 100644
--- a/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.14.0.bb
+++ b/meta-xfce/recipes-xfce/libxfce4util/libxfce4util_4.16.0.bb
@@ -6,5 +6,4 @@ DEPENDS = "intltool-native xfce4-dev-tools-native glib-2.0"
 
 inherit xfce gtk-doc gobject-introspection
 
-SRC_URI[md5sum] = "46f44e36acc3abf1a5ba814c22a773cb"
-SRC_URI[sha256sum] = "32ad79b7992ec3fd863e8ff2f03eebda8740363ef9d7d910a35963ac1c1a6324"
+SRC_URI[sha256sum] = "60598d745d1fc81ff5ad3cecc3a8d1b85990dd22023e7743f55abd87d8b55b83"
-- 
2.26.2

