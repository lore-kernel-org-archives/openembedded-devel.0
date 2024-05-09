Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C42DC10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 19:59:14 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.1273.1715284751036907498
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 May 2024 12:59:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aunXGT0q;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ec41d82b8bso11561905ad.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 12:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715284750; x=1715889550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vO9OC3SsOG/AMd0jrRQHkFN70vh2X8O52feLIKRi6gk=;
        b=aunXGT0qaAizc3xq+W/VysbLtk8O62RgxZ+v9VXOpy/kXBic188GAtHRcyRch3CxH+
         DV5j2irHSskMgjx8rkbEXMy2XPQtofOmk+YSmjvCwJ8zHQgzigkQPAFjpA9rT5U0k1o6
         5k1/CkbTb1gLzWirMg7Fdh1CopNoMIPKztadj9zMyJP4DVrTUD0gjyx1zBEFI6XgE+v6
         Kf0F6/3qmbAcwcpt3QAQkdvWtQ3XC6twk1Nf4IjHqePyZ+nbHNt6u98p5V8m3xSuO00p
         7RP3qiqqdddm5KR7z0zoIDUkOQgkm8WX5HnSHqpIRUCUa1YSgja9skmB7GuGqZDiVtAs
         L7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284750; x=1715889550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vO9OC3SsOG/AMd0jrRQHkFN70vh2X8O52feLIKRi6gk=;
        b=USQ8bbIh+e5BnXpVHy+IUMyT17fm4rJmovvCZYckZJh9Uti2G0vcnl0t6jgnUCBohl
         EmxiUkpCb7eomANpDYfJ+6nyMojQzs5PzrdX7eNme7OUt5kQvjdc6ROt7ImlmuYhNEx3
         6cX92uwzEHACWJ8zTGIit78fvxdeQ4AJeik9Zk8Ky26pNqFm9/GPj8ugUirNUjGDHcg8
         acrpu9Xh1xVtR7H/XnwwOob7lOObKuM75N8MvRmJEq4kzjwQ0dpF/QOrF5YvCeDMG2vd
         906ukFRtHFS1vPlc2SDmiEGfrlIH5zx3CoslhXDMYpVI+v56kVIIUQh9uUR98H8rm5MY
         EHrA==
X-Gm-Message-State: AOJu0YyO60fig4BV+6s4GPJXlTJa2/8WXu+ujxsQsULcvVBhzCzupcok
	aICPmvGu1eRe036zv66yuzs8pZODbxUkiPlG4QaZUoPLYz2b1TyTyUUxBlT66Lo=
X-Google-Smtp-Source: AGHT+IE9g5pic2+Sq5ypiQ1bEzDcLmuyh6LjjaEUqo13jpg6IyvLmm8M+kF2FX5LXGOg+16ZQoEpOA==
X-Received: by 2002:a17:902:d48c:b0:1eb:4c47:3454 with SMTP id d9443c01a7336-1ef434d2774mr8307705ad.0.1715284750140;
        Thu, 09 May 2024 12:59:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f4db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30cbasm18042455ad.126.2024.05.09.12.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 12:59:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] transmission: Upgrade to 4.0.5
Date: Thu,  9 May 2024 12:59:07 -0700
Message-ID: <20240509195907.1863061-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 May 2024 19:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110296

License-Update: Copyright Years updated

Add missing MIT license,see COPYING file

Switch to cmake build system as thats the new and only
build system supported.

Use gtk4 when selecting gtk knob, it can support gtk3 as well
however, its not added as knob, if needed someone should send
a patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nsmission_git.bb => transmission_4.0.5.bb} | 31 +++++--------------
 1 file changed, 8 insertions(+), 23 deletions(-)
 rename meta-oe/recipes-connectivity/transmission/{transmission_git.bb => transmission_4.0.5.bb} (72%)

diff --git a/meta-oe/recipes-connectivity/transmission/transmission_git.bb b/meta-oe/recipes-connectivity/transmission/transmission_4.0.5.bb
similarity index 72%
rename from meta-oe/recipes-connectivity/transmission/transmission_git.bb
rename to meta-oe/recipes-connectivity/transmission/transmission_4.0.5.bb
index 735db1441e..62e066c91c 100644
--- a/meta-oe/recipes-connectivity/transmission/transmission_git.bb
+++ b/meta-oe/recipes-connectivity/transmission/transmission_4.0.5.bb
@@ -1,50 +1,35 @@
 DESCRIPTION = "Transmission is a fast, easy, and free BitTorrent client"
 SECTION = "network"
 HOMEPAGE = "https://transmissionbt.com/"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=73f535ddffcf2a0d3af4f381f84f9b33"
+LICENSE = "MIT & GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ba8199e739948e198310093de27175fa"
 
 DEPENDS = "curl libevent gnutls openssl libtool intltool-native glib-2.0-native"
 RDEPENDS:${PN}-web = "${PN}"
 
 SRC_URI = " \
-	gitsm://github.com/transmission/transmission;branch=master;protocol=https \
+	gitsm://github.com/transmission/transmission;branch=4.0.x;protocol=https \
 	file://transmission-daemon \
 "
 
-# Transmission release 3.00
-SRCREV = "bb6b5a062ee594dfd4b7a12a6b6e860c43849bfd"
-PV = "3.00"
+# Transmission release 4.0.5
+SRCREV = "a6fe2a64aa7eca089f96006cf082a12f0cde937f"
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep gettext update-rc.d pkgconfig systemd mime-xdg
+inherit cmake gettext update-rc.d pkgconfig systemd mime-xdg
 
 PACKAGECONFIG = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk', '', d)} \
                  ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
 
-PACKAGECONFIG[gtk] = " --with-gtk,--without-gtk,gtk+3,"
-PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd,"
+PACKAGECONFIG[gtk] = "-DENABLE_GTK=ON,-DENABLE_GTK=OFF,gtk4 gtkmm4,"
+PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF,systemd,"
 
 # Weak default values for transmission user and group
 # Change them in bbappend if needed
 TRANSMISSION_USER ??= "root"
 TRANSMISSION_GROUP ??= "root"
 
-# Configure aborts with:
-# config.status: error: po/Makefile.in.in was not created by intltoolize.
-do_configure() {
-	sed -i /AM_GLIB_GNU_GETTEXT/d ${S}/configure.ac
-	cd ${S}
-	./update-version-h.sh
-	intltoolize --copy --force --automake
-        aclocal
-        libtoolize --automake --copy --force
-        autoconf
-        automake -a
-        oe_runconf
-}
-
 do_install:append() {
 	if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
 		sed -i '/USERNAME=/c\USERNAME=${TRANSMISSION_USER}' ${WORKDIR}/transmission-daemon
-- 
2.45.0


