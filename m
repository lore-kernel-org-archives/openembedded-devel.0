Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.7487.1595673300029089745
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Jul 2020 03:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=uYSlKvnC;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.173, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f173.google.com with SMTP id q6so12429092ljp.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 25 Jul 2020 03:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=445tVHzWJVgpn6/4cEu7ze0ieEnzyNX18ECP51RiHvM=;
        b=uYSlKvnCZQmbPi3lFZGqA+0by4/mCEv2Duqo+xnQxE8xII9HkXNyqGsXFbqt+Mj7t6
         f/VD+xxkHC59Him0xjXAspj1ING0BbalUyG9bgHb7hL9Thkk/tB5OSoFVR+evY3r2alL
         14TotBW2j9SBU8efcKNX+MDlfihIBV+nilOQjMSj1e+1AdnlwhrvUqDu/eDBSGVIzE3n
         kCKhn4zH6UOuHQkMN+y11NznWk5Blty45oW3QBLJU6iMXlQeiqhjwvcJSZ81cNc//Wjk
         aTTmAwVJpPeTy88NC15MZPepi886xY0gKCdiiTfVMg3pvNRYjlm1B2Ez8TCtJdpEHxWT
         D7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=445tVHzWJVgpn6/4cEu7ze0ieEnzyNX18ECP51RiHvM=;
        b=Re/aVFIWqnLKTEejTvDm3msGP0f2dVLRpOmrAatcv8Eb75J5plh0cuu/B6QxLhNoB+
         XY9+D7vXQmlrRrl58prg/bOgE9UkMtuouODSp3EY1GlY4MSMR+OeDtyKtSNa26NCg7+z
         lkJReealVJVyFXVOOZ/S+QJ6AVuyfxLxIkDDq7YKK1PutmOEUIE9/4Ncr0CbI5iRvlcc
         yI09I3OahqqcD0CVcmsqkTh7nDbro7Btg0PMGnGVk/8UCYNFnFBlswCn+96B494FGynK
         KbK90VIJ4pR275aIdtJIICTyjWaAYpLx0cTDQj7CcY12i4pWWaZjnqf69H7V3JDFempI
         ojeA==
X-Gm-Message-State: AOAM533dsHovh7ZjN1dVTp7hNL3lcYhYXrn+F44R+4m52LSu3zSho9K0
	5jhaf97gDgLcXXvYZtHPhbhsZxmDh7c=
X-Google-Smtp-Source: ABdhPJx42BInsi6BtvXjQ5Y/TLQbOkb3iQORFkjXxB7MZj3tQMEQcUd24UUKbZ+yTjLmTfkrNJavIw==
X-Received: by 2002:a2e:1502:: with SMTP id s2mr5623040ljd.236.1595673297914;
        Sat, 25 Jul 2020 03:34:57 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id b18sm1325859lfp.36.2020.07.25.03.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 03:34:57 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe 3/4] libplist: update to 2.2.0
Date: Sat, 25 Jul 2020 12:34:46 +0200
Message-Id: <20200725103447.2109015-3-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200725103447.2109015-1-open.source@oleksandr-kravchuk.com>
References: <20200725103447.2109015-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{libplist_2.1.0.bb => libplist_2.2.0.bb}   | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-extended/libimobiledevice/{libplist_2.1.0.bb => libplist_2.2.0.bb} (70%)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
similarity index 70%
rename from meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
rename to meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
index 36659e752d..408fa8ac0e 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_2.1.0.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_2.2.0.bb
@@ -1,5 +1,5 @@
 SUMMARY = "A library to handle Apple Property List format whereas it's binary or XML"
-
+HOMEPAGE = "https://github.com/libimobiledevice/libplist"
 LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \
                     file://COPYING.LESSER;md5=6ab17b41640564434dda85c06b7124f7"
@@ -8,9 +8,8 @@ DEPENDS = "libxml2 glib-2.0 swig python3"
 
 inherit autotools pkgconfig python3native
 
-SRCREV = "3df02d4d0e9008771e8622fdc10de8333b3f0d85"
-SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https \
-           "
+SRCREV = "c5a30e9267068436a75b5d00fcbf95cb9c1f4dcd"
+SRC_URI = "git://github.com/libimobiledevice/libplist;protocol=https"
 
 S = "${WORKDIR}/git"
 
@@ -20,10 +19,11 @@ do_install_append () {
     fi
 }
 
-PACKAGES =+ "${PN}-utils ${PN}++ ${PN}-python"
-FILES_${PN} = "${libdir}/libplist${SOLIBS}"
-FILES_${PN}++ = "${libdir}/libplist++${SOLIBS}"
+PACKAGES =+ "${PN}-utils \
+             ${PN}++ \
+             ${PN}-python"
+
+FILES_${PN} = "${libdir}/libplist-2.0${SOLIBS}"
+FILES_${PN}++ = "${libdir}/libplist++-2.0${SOLIBS}"
 FILES_${PN}-utils = "${bindir}/*"
 FILES_${PN}-python = "${libdir}/python*/site-packages/*"
-
-
-- 
2.25.1

