Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.4384.1623220728361154395
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IoGZ+tyR;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id l1so36665528ejb.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fTmKTLXa9EYE2JdU0EKteSxAhxhpbcfOfyA2eCGiGZM=;
        b=IoGZ+tyRCf1VBkXRvsBR+6uKPMh2wWc3iR5h0VDIe5yK8/kngd5Bw0q5+PpFrGrgng
         mn04I/gWG2wQLvwrWREjACQMsEIvj++MeQbWzAWikeeUGpHc+qBXHHY32Qz8QbjXDdpN
         IUAGizwOP1zwkSpmZ2OGkilNOfSvRscpVxkeShJYu5vYI1xwQ4CIqYAp5DNSGAx4FwL9
         ylHFO2CH3nGCjq6uCriiKhfR3KHYWXhCP90E/TPylCTW5Vk9/sVpMmSf99xdo10lgj1/
         NN0Dq0/iumNK6GTNuL+L227KvyEsBF+p4rVTgETDK2f0WI50iNPktGK0Wf+wWYDmw/AC
         X6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fTmKTLXa9EYE2JdU0EKteSxAhxhpbcfOfyA2eCGiGZM=;
        b=tGq0EOGMHdLSYRZwhluFGKEX9XM4y+KhmmF17gYbyjMaJlLDQpd8mAMubUNz6S3pPm
         0i9xQMX/19/MLf8C0UQgFoNZJES5Ni8WDgXNfYvuNjvp8vPTjinf/SXAWMCOzcpL2OVI
         fdn0auq8uvpX/ruHWHY4O9LoOAoem769cwtJT0PAQj3ua2v96SOXCkHfiaZXHQKoor/Y
         AhIz0NZEg+RQeNKu0n0QM/aOA+TJAaSB353VL5HtCFDdVxyG0WaDIYbgxhvfyYDPvob4
         AvVFDYyIp1eVqdA+pILyOpPFuQu47oJmphwLQcuGsGKzri6n/ZsWIbE2kRbrb5XkJ391
         OLiQ==
X-Gm-Message-State: AOAM530oGwEB4+Cc5ePd3XvsoJONGaP+5Cwjqj0pvFfWNljkjzW4OhlL
	ffaK47KiJ49oFpxXnKJEIdK5amHOvyToBw==
X-Google-Smtp-Source: ABdhPJxnfMWqZIdhAaHC/rRRZfAHU3R1Kzzt6WIvzu3e6dnKEsIAfRHW5MsSPkfcFsFFV+IWIeS4Iw==
X-Received: by 2002:a17:906:4483:: with SMTP id y3mr22076752ejo.92.1623220726809;
        Tue, 08 Jun 2021 23:38:46 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:46 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 06/28] glibmm: upgrade 2.62.0 -> 2.66.1 / build with meson / cleanup recipe
Date: Wed,  9 Jun 2021 08:38:09 +0200
Message-Id: <20210609063831.3400611-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

2.66.1 is the version GNOME 40.2 release suggests. There are 2.68 versions but
these are for mm-bindings compatible with gtk4.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{glibmm_2.62.0.bb => glibmm_2.66.1.bb}       | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm_2.62.0.bb => glibmm_2.66.1.bb} (62%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.1.bb
similarity index 62%
rename from meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm_2.66.1.bb
index 75eea4e58..a40561138 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.62.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.1.bb
@@ -6,23 +6,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
+
+GNOMEBASEBUILDCLASS = "meson"
+
 inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI += " \
-    file://remove-examples.patch \
-"
-SRC_URI[archive.md5sum] = "7da228e3f0c6a10024b9a7708c53691e"
-SRC_URI[archive.sha256sum] = "36659f13cc73282392d1305858f3bbca46fbd1ce2f078cc9db8b9f79b2e93cfe"
+SRC_URI[archive.sha256sum] = "69bd6b5327716ca2f511ab580a969fd7bf0cd2c24ce15e1d0e530592d3ff209c"
 
 do_install_append() {
-    install -d ${D}${datadir}/glibmm-2.4
-    install -d ${D}${datadir}/aclocal
-
-    install -m 0644 glib/glibmmconfig.h ${D}${datadir}/glibmm-2.4/
-    install -m 0644 scripts/glibmm_check_perl.m4 ${D}${datadir}/aclocal/ || true
-
     for i in generate_wrap_init.pl gmmproc; do
         sed -i -e '1s,.*,#!${bindir}/env perl,' ${D}${libdir}/glibmm-2.4/proc/$i
     done
@@ -32,4 +25,3 @@ FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev += "${datadir}/glibmm-* ${libdir}/glibmm-2.4/include/ ${libdir}/glibmm-2.4/proc/ ${libdir}/giomm-2.4/include/"
 
 RDEPENDS_${PN}-dev = "perl"
-SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
-- 
2.31.1

