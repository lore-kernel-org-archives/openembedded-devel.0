Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.8809.1627834788462051056
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Aug 2021 09:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D7ET3UBv;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id e2-20020a17090a4a02b029016f3020d867so21441915pjh.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Aug 2021 09:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I0BB18DeHZ4A4TgkFIugImxtWqXrlx3FuYWjsL09FwY=;
        b=D7ET3UBvGaCXoFBZ/WCUeSfcZsFFJLHEIQLhHuIagR3gDEQ+/5Lwd2e3D4EO06GQri
         mETboNEPNGaHYPKxViF0FVE1poYI86Ocq+OZ0ku/b1/uRDrW7QWYHFpCWkb575Uv4ZCl
         /lp6M3NAn9va3dmFVbpmsJWyPCOzNYPkIZBaaJdLVTutCOUMBZKvYspItBteObVBdLFR
         dfBR1bTZ3SNHMY1zYARnFdF9/C5FHfUjT4uQtrazmQ0L7X5b4qj1aksV7viu6+v5f36G
         P/Tr0SXsirvFl3p89Yea65sp7y0UU5r0IiH62l9u7hBohiMbbUrHYPrDGkRygJCyOsLu
         vPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I0BB18DeHZ4A4TgkFIugImxtWqXrlx3FuYWjsL09FwY=;
        b=AiaWpX1uWYlQJGsS7aO5IOYMjuwI8EcDA5//MCN0NyP4oLKcGX4LQYK9G0ZmuAL0P/
         jGLWPyirxqUuRpyhUfpSpv+3vt302987w1sHtsp0rSWi8VwdYEmBrMWgG7M6etz5HWx5
         znppCRCZCZ5oD2sc+ThdZfs9o5DIRpB3z3sKe6DzEfkQm226TdVDbda787d00otGY1as
         oE+4g+8TmidR0QOsXHVA0BtolDQ5sXZC9xSg/tzWHxEtqhdz6TfJ06NzIG9C3fcHmENu
         ofTGyBdrdtINBqo7LqvVxXt/+7ELThdKFaAJCEjG7EqsdWdOQTWupy1za9+qc2kQxmAr
         BQ3Q==
X-Gm-Message-State: AOAM533yx7huugbz6zf+/uNM8k494u2HpxKw4UyaiY+9piqbPJaPvN/0
	WpgeYp/J+mKKh8wcqf5k9baQInUT8YmEVQ==
X-Google-Smtp-Source: ABdhPJz5Z+lIbAyPj9sxoixueHq6+suW2mwrfXh8O8AHo2N8oMVvFCTpypCWUQBsRRBokzIdBPURsw==
X-Received: by 2002:a63:5c04:: with SMTP id q4mr3463053pgb.127.1627834787679;
        Sun, 01 Aug 2021 09:19:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d2cb])
        by smtp.gmail.com with ESMTPSA id b19sm5813291pfp.5.2021.08.01.09.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 09:19:47 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] lvm2: Update to 2.03.12 release
Date: Sun,  1 Aug 2021 09:19:44 -0700
Message-Id: <20210801161944.3087568-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Detailed changelog [1]

[1] https://github.com/lvmteam/lvm2/releases/tag/v2_03_12

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../lvm2/files/0005-do-not-build-manual.patch | 19 ++++++-------------
 ...per_2.03.11.bb => libdevmapper_2.03.12.bb} |  0
 meta-oe/recipes-support/lvm2/lvm2.inc         |  2 +-
 .../lvm2/{lvm2_2.03.11.bb => lvm2_2.03.12.bb} |  0
 4 files changed, 7 insertions(+), 14 deletions(-)
 rename meta-oe/recipes-support/lvm2/{libdevmapper_2.03.11.bb => libdevmapper_2.03.12.bb} (100%)
 rename meta-oe/recipes-support/lvm2/{lvm2_2.03.11.bb => lvm2_2.03.12.bb} (100%)

diff --git a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
index 7117d99a39..9e1ec71ec8 100644
--- a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
+++ b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
@@ -24,16 +24,14 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  configure.ac | 1 -
  2 files changed, 3 insertions(+), 4 deletions(-)

-diff --git a/Makefile.in b/Makefile.in
-index 6a1a990..80cba91 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -18,7 +18,7 @@ top_builddir = @top_builddir@
  abs_top_builddir = @abs_top_builddir@
  abs_top_srcdir = @abs_top_srcdir@

--SUBDIRS = conf daemons include lib libdaemon libdm man scripts tools
-+SUBDIRS = conf daemons include lib libdaemon libdm scripts tools
+-SUBDIRS = libdm conf daemons include lib libdaemon man scripts tools
++SUBDIRS = libdm conf daemons include lib libdaemon scripts tools

  ifeq ("@UDEV_RULES@", "yes")
    SUBDIRS += udev
@@ -46,20 +44,18 @@ index 6a1a990..80cba91 100644
      libdaemon lib tools daemons libdm \
      udev po
  tools.distclean: test.distclean
-@@ -65,7 +65,7 @@ libdm.device-mapper: include.device-mapper
+@@ -59,7 +59,7 @@ unit-test  run-unit-test: test
+
  daemons.device-mapper: libdm.device-mapper
  tools.device-mapper: libdm.device-mapper
- scripts.device-mapper: include.device-mapper
 -device-mapper: tools.device-mapper daemons.device-mapper man.device-mapper
 +device-mapper: tools.device-mapper daemons.device-mapper
+ device_mapper: device-mapper

  ifeq ("@INTL@", "yes")
- lib.pofile: include.pofile
-diff --git a/configure.ac b/configure.ac
-index 7fd0561..4154dc0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1812,7 +1812,6 @@ libdaemon/server/Makefile
+@@ -1941,7 +1941,6 @@ libdaemon/server/Makefile
  libdm/Makefile
  libdm/dm-tools/Makefile
  libdm/libdevmapper.pc
@@ -67,6 +63,3 @@ index 7fd0561..4154dc0 100644
  po/Makefile
  scripts/lvm2-pvscan.service
  scripts/blkdeactivate.sh
---
-2.7.4
-
diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.12.bb
similarity index 100%
rename from meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
rename to meta-oe/recipes-support/lvm2/libdevmapper_2.03.12.bb
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index ccb4f7ac14..6f73519283 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,7 +18,7 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://reproducible-build.patch \
            "

-SRCREV = "3e8bd8d1bd70691f09a170785836aeb4f83154e6"
+SRCREV = "01b05cf51dd547354b4ad70e7f8f4ff7ff0bb152"
 S = "${WORKDIR}/git"

 inherit autotools-brokensep pkgconfig systemd
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.12.bb
similarity index 100%
rename from meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
rename to meta-oe/recipes-support/lvm2/lvm2_2.03.12.bb
--
2.32.0
