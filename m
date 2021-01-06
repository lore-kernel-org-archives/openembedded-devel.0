Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.9402.1609946253889414661
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VOmrE22G;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id b73so4627686edf.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=qXV7RIPsIhQN0SZv2Ls4TLD/qVcqmYbmubKt0/EJW30=;
        b=VOmrE22G/VlUEb+j+QmEFQ2yzUFOevP9ILrwerTHof+mxhiHdKv15GYwgnw0InYm9V
         F4uCLWMbsa4NeFjzhsHz/9pIxTXSNFvV2uf2+VESYgCYYC/vG4kWbxFAM7Zc5oIhq88y
         PlAhMqJQ9icLp8lgZz+WH+pZnKCb6KbnZRgPYTF64IqQmdJpOTQN7eZwCaNSn0XsB2Ny
         Dzhdh+ImwmEYqt06k4xSTkWi0jhRRYHd9JuEweLJbh3eVbevT5m5nh+18l4K8BwLv9tD
         ZL8LBW59hgIETdRH6KHKZBxaQtIvjsU/ftdHfQGhFRpeUEeZMtEx3eKBdUCBUIe5Z6Pd
         l8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qXV7RIPsIhQN0SZv2Ls4TLD/qVcqmYbmubKt0/EJW30=;
        b=MH/sY87ovEkdUnYJoXCPII5iFCy6GdLXMg7TcyfrMj6Gjfkxl+MDT4IIUOwazzJamX
         xNJLaFrMORIxna0lcMG5lvm6GSRtCtIRLTMq9LuwMi+GMUbc/dGndEmojWChA3yeevk1
         Vs9Fg4oV30bAFaSellXWCBcGteNKa7LhNcJc9477EJlReO0nZSL4FHFHKrAmNrFHYMIY
         69I0qA/eeV5CcTnHOYHROzZGLVltrTx2ugh2G7eN3+uJ4op1FWAPhMw3lhGJ+ajUo6xf
         l/UVBIOYr9+7RhqODDvy6eZElxciR0ICiatxlxpcSmy76TYlhIx53XnA/AlDoM3KJDhE
         zrVg==
X-Gm-Message-State: AOAM533sx67bNsgS5KGu5tF441RakF546CxzULLxxX0Tmvb4xVpovsYR
	mtCmMg/PI6dtugsqdewY3w69kVFPvXkzhw==
X-Google-Smtp-Source: ABdhPJyF/xTYHqfv1iGYxyt/Gn4gKw8zr9dOrpSrKd+FUTslSQI2oj9QVI13xAgxh3N/21NGyAZD/w==
X-Received: by 2002:a50:9f4a:: with SMTP id b68mr4265080edf.296.1609946252470;
        Wed, 06 Jan 2021 07:17:32 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:31 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/28] xfconf: upgrade 4.14.3 -> 4.16.0
Date: Wed,  6 Jan 2021 16:16:52 +0100
Message-Id: <20210106151717.1779543-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 4.16.0
========================
- Don't use shebang for bash completion file
- Remove GLIB_CHECK_VERSION IFDEFs which are obsolete after glib bump
- bump glib (and gio, gthread, etc) minimum to 2.50.0
- remove last traces of xfconf-perl
- Fix make distcheck and enable it on gitlab CI
- Add README.md to EXTRA_DIST

Release notes for 4.15.1
========================
[Please note that this is a development release.]

- Fix stray double-quote in bash-completion PKG_CONFIG invocation
- Disable parallelism on all tests
- Adds new README.md and updates AM_INIT_AUTOMAKE
- xfconf-cache: Fix access to freed data (#16)
- Translation Updates: oc, he, hu, hy_AM, lt, sk, sq, ug, tr.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../xfconf/{xfconf_4.14.3.bb => xfconf_4.16.0.bb}            | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.14.3.bb => xfconf_4.16.0.bb} (77%)

diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.3.bb b/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
similarity index 77%
rename from meta-xfce/recipes-xfce/xfconf/xfconf_4.14.3.bb
rename to meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
index 792f8b160..9b341bb27 100644
--- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.14.3.bb
+++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.16.0.bb
@@ -4,12 +4,11 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "libxfce4util perl intltool-native xfce4-dev-tools-native"
 
-inherit xfce gtk-doc gobject-introspection
+inherit xfce gtk-doc gobject-introspection bash-completion
 
 EXTRA_OECONF += "PERL=${STAGING_DIR_TARGET}/usr/bin/perl"
 
-SRC_URI[md5sum] = "25c32ed08a43e81f7900c03601dffc02"
-SRC_URI[sha256sum] = "589052a0efc6151c5fb5f438da463502a4fd91848cae7b9376d417be4c5a0c02"
+SRC_URI[sha256sum] = "652a119007c67d9ba6c0bc7a740c923d33f32d03dc76dfc7ba682584e72a5425"
 
 FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
                 ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
-- 
2.26.2

