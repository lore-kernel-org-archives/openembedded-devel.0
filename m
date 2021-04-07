Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.467.1617833919954869375
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 15:18:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QrVlWONw;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id u11so7121550wrp.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 15:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qXuuG5OBfRjNa1NniOedK0/v9FygsBcxaCK9rSTnScM=;
        b=QrVlWONwRMUP5MxQOJkAW8m7UcAyPvzEZNz85wJWWAh2nahH5uU+n1Xu6mzScCkRMP
         N1fLnWxVkfww8KpiHO9FQEeq9M27erQHygzwuJj3eZzo0jHY8Iyx3vKHyZgKt1qCNICQ
         j2S2W6EXsir+WZUjAM6Znjvexz9BhVTcx6mCy0e29eRRGdlDjHv5q+APJSOQabVe4yc6
         K+L2UlWm3prbOAoZ0ktxEuODjl+a93alPPhb4pytT8EzYCiECso4MiXCJIOXGZg0H8jU
         6ZRVliy2frl5ZyxPep4xrnOVQ3P3zbqcXF/sWzKRmdGvzbkSzrUfDY9w7Rv19T2arQiW
         Kd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qXuuG5OBfRjNa1NniOedK0/v9FygsBcxaCK9rSTnScM=;
        b=MpwcaDTTEZ1z5k/Nb3T4NRKzdHlmnnawlvyXn289MYfzvQEk5tKgqsIdmjnd0LzoDS
         an1WlsrRZlm5SSM8lICFtzZ+5Zlf4cNtNy5AzDnH1YugHzOhIMDzVxS4Saiu5WOw9tSo
         beeoW2WE5aHlkph9IDfPXFVWOGUGl6JsNNPwq7AzirEyLeOOhalZULdXJa9mgyDhybqY
         cb+1cG9mni0A1o2XNWK5DUXaKojk697WFUI5NlY8QS9cwnCGhwcIkeRdw8kJTW8RS67/
         x4AHxWSKFNIvG2PjuaVrG94jDLeV7ZP24xM4GivJb97gXxxPyHcCGmsUruHLt76z2nsQ
         oc/w==
X-Gm-Message-State: AOAM531b63p7gPdhSNnIFG8s9dsEIvDHBVEXIsY0SXuMrummRJC+2thA
	FheFFg2/jm3GNqO5X7bdyH8JIYiDr58=
X-Google-Smtp-Source: ABdhPJzYmsjsQqX9dBdWA2W9pbmTZZxw2yYyC10mODTvFhCzfJCq8ZRKtnJzqtyal6u1SMSzpI14HA==
X-Received: by 2002:a5d:4242:: with SMTP id s2mr6959425wrr.421.1617833918326;
        Wed, 07 Apr 2021 15:18:38 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f1192521410777e3304dd72.dip0.t-ipconnect.de. [2003:f0:7f11:9252:1410:777e:3304:dd72])
        by smtp.gmail.com with ESMTPSA id e9sm27462434wrv.92.2021.04.07.15.18.37
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 15:18:37 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/6] mousepad: upgrade 0.5.3 -> 0.5.4
Date: Thu,  8 Apr 2021 00:18:23 +0200
Message-Id: <20210407221829.606871-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 0.5.4
=======================
- New Features:
  - Add --line/-l and --column/-c number (#107, !83)
  - Port to GtkSourceView 4 (#55, #80, !10)

- Bug Fixes:
  - Delay request to scroll to cursor for the correct active view
  - Monitor hardlinks with glib 2.56.2 (#110, !82)
  - Transfer encoding from remote to primary instance (#109)
  - Prevent a crash when no language is found
  - Make window require attention when opening new tabs (#106, #93, !81)
  - Fix BOM array (!80)
  - Correctly initialize toolbar style combo box (#103)
  - Allow checking parent sources when looking up schema (#101)
  - Fix missing parameter to "select-all" signal (!79)

- Translation Updates

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mousepad/{mousepad_0.5.3.bb => mousepad_0.5.4.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/mousepad/{mousepad_0.5.3.bb => mousepad_0.5.4.bb} (67%)

diff --git a/meta-xfce/recipes-apps/mousepad/mousepad_0.5.3.bb b/meta-xfce/recipes-apps/mousepad/mousepad_0.5.4.bb
similarity index 67%
rename from meta-xfce/recipes-apps/mousepad/mousepad_0.5.3.bb
rename to meta-xfce/recipes-apps/mousepad/mousepad_0.5.4.bb
index 1fba67914..7a2f12b1e 100644
--- a/meta-xfce/recipes-apps/mousepad/mousepad_0.5.3.bb
+++ b/meta-xfce/recipes-apps/mousepad/mousepad_0.5.4.bb
@@ -3,11 +3,11 @@ SECTION = "x11/application"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "gtk+3 gtksourceview3 xfconf xfce4-dev-tools-native"
+DEPENDS = "gtk+3 gtksourceview4 xfconf xfce4-dev-tools-native"
 
 inherit xfce-app gsettings mime-xdg
 
-SRC_URI[sha256sum] = "e7208bb9e96a1525d3358a64f9cdd165005078e84e81984a953a2a03491fcaa8"
+SRC_URI[sha256sum] = "d90f492e5d0cba5f5b3b0c1eb7fd7c1701aef57e3fa244d2c457e7f9b0a42aa1"
 
 FILES_${PN} += " \
     ${datadir}/glib-2.0/schemas \
-- 
2.26.2

