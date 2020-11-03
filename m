Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.537.1604384825867889356
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2020 22:27:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MHtAawC4;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id x13so12874219pgp.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2020 22:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T2BNMAKRrOZGaVxg5Onfvco7JyheUMd8zEgGspWxXeU=;
        b=MHtAawC4Q9jB6UeEQIL3wlEvG4kiFjV2ejefwSi1tI5Y1821fMkgNqAr05uZ9SD+vW
         h87H/ddROyzZS2MOdd08oJ2Olaa1NtX3c0yFXEY+pffxBG3dljVy9OIkhTOPoWstpFwh
         k8caTezQiVVQEhiLYHVGh3yTGF6GgSrtURdAC/MCNPp2OWLeiymCXEWJrGhbKrLtWUjj
         vFLMCBKQ0V/PQqCGyyWMGiti0IRIvJpHYHQ8uoYlQyxzZ2JkSTBkELWrWcfgkw5WS2q3
         4cEc/U4tfGNFlmjA6SmK26CbKLCGgakQR5zNTTBBVuBsc7f3q/LC6a0/nUAc3InS6K+O
         lIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T2BNMAKRrOZGaVxg5Onfvco7JyheUMd8zEgGspWxXeU=;
        b=aTfJqXWab0j4tu2DFedTA2vJhh0hpNFpjS9mwzRZgrL0pwspvZSkGj3TCeI6P+5rnZ
         hggd3D5RIRmywJc4ELQ7BVr+HNdQmXLBwEoygTYOhPNLh53rCazJFa4Rcvz5hVVo5Xys
         jbw4XYPMyf/aB0QeYSjLzMdKMc/fAc2GY1l2SFtSNAnmd5568nnPyKIFBl0MOCn8FaJc
         be/BJV1mIAzO8f0EO6wB9UwphFRZDj9sbscclEuSWA2Geo8kJZK+qy5epo4C2jjDYI1R
         QKER4KnSc80NFUCYZrZpP14TtzKwNY/Mxjse8C3XsT2vg8f87Kb+lo/cJvozM3w2szcw
         hSnw==
X-Gm-Message-State: AOAM532h0ZjBDbj8G98EQrCRZ6CliUxIsVcgZTARpxXNGYON3P86MY+I
	7YQRbn+oG3jO4FntrHSvljkx7CLXTbUWpA==
X-Google-Smtp-Source: ABdhPJwjCxBFnyAgwhxqs7v1pbyMiSSH2eoEJxXlMxOH0D9VVZff+/+a7c78BO6OjlLg2zi5BSd0TA==
X-Received: by 2002:a63:4546:: with SMTP id u6mr16303433pgk.311.1604384825003;
        Mon, 02 Nov 2020 22:27:05 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4b05])
        by smtp.gmail.com with ESMTPSA id nv7sm1608907pjb.27.2020.11.02.22.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 22:27:04 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] graphviz: Upgrade to 2.44.1 release
Date: Mon,  2 Nov 2020 22:27:00 -0800
Message-Id: <20201103062701.286774-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Refresh patches to apply on new sources
- Switch away from gitlab archives
- Bypass pdf documentation generation for native package

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch | 2 +-
 .../graphviz/graphviz/0001-Use-native-mkdefs.patch       | 9 ++-------
 ...lugin-pango-Include-freetype-headers-explicitly.patch | 5 -----
 .../graphviz/{graphviz_2.40.1.bb => graphviz_2.44.1.bb}  | 8 ++++----
 4 files changed, 7 insertions(+), 17 deletions(-)
 rename meta-oe/recipes-graphics/graphviz/{graphviz_2.40.1.bb => graphviz_2.44.1.bb} (91%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch b/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch
index 21bf1bcd5c..6d1d441c57 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.patch
@@ -11,7 +11,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1676,7 +1676,7 @@ AC_ARG_ENABLE(tcl,
+@@ -1540,7 +1540,7 @@ AC_ARG_ENABLE(tcl,
    [], [enable_tcl=yes])
  
  if test "x$enable_tcl" != "xyes"; then
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Use-native-mkdefs.patch b/meta-oe/recipes-graphics/graphviz/graphviz/0001-Use-native-mkdefs.patch
index eb51d03d26..76ff08f63c 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Use-native-mkdefs.patch
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/0001-Use-native-mkdefs.patch
@@ -13,12 +13,10 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  lib/gvpr/Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/lib/gvpr/Makefile.am b/lib/gvpr/Makefile.am
-index ac3c098..4914854 100644
 --- a/lib/gvpr/Makefile.am
 +++ b/lib/gvpr/Makefile.am
-@@ -57,7 +57,7 @@ endif
- mkdefs_SOURCES = mkdefs.c
+@@ -59,7 +59,7 @@ mkdefs$(EXEEXT):
+ 	$(HOSTCC) $(srcdir)/mkdefs.c -o mkdefs$(EXEEXT)
  
  gdefs.h: $(top_srcdir)/lib/gvpr/gprdata mkdefs$(EXEEXT)
 -	./mkdefs$(EXEEXT) gdefs.h < $(top_srcdir)/lib/gvpr/gprdata
@@ -26,6 +24,3 @@ index ac3c098..4914854 100644
  
  EXTRA_DIST = $(man_MANS) $(pdf_DATA) gprdata mkdefs.c gdefs.h trie.c gvprlib.vcxproj*
  
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/0001-plugin-pango-Include-freetype-headers-explicitly.patch b/meta-oe/recipes-graphics/graphviz/graphviz/0001-plugin-pango-Include-freetype-headers-explicitly.patch
index a9b0352435..dd79510560 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz/0001-plugin-pango-Include-freetype-headers-explicitly.patch
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/0001-plugin-pango-Include-freetype-headers-explicitly.patch
@@ -18,8 +18,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  plugin/pango/gvtextlayout_pango.c | 4 ++++
  1 file changed, 4 insertions(+)
 
-diff --git a/plugin/pango/gvtextlayout_pango.c b/plugin/pango/gvtextlayout_pango.c
-index d620b29..b0da11c 100644
 --- a/plugin/pango/gvtextlayout_pango.c
 +++ b/plugin/pango/gvtextlayout_pango.c
 @@ -15,6 +15,10 @@
@@ -33,6 +31,3 @@ index d620b29..b0da11c 100644
  #include "gvplugin_render.h"
  #include "agxbuf.h"
  #include "utils.h"
--- 
-2.22.0
-
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
similarity index 91%
rename from meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
index aa5c0c8206..061be74970 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.44.1.bb
@@ -26,7 +26,8 @@ inherit autotools-brokensep pkgconfig gettext
 # get checksum errors. Fedora people seem to expect same so they use a versioned
 # source - see https://src.fedoraproject.org/cgit/rpms/graphviz.git/tree/graphviz.spec
 
-SRC_URI = "https://gitlab.com/graphviz/graphviz/-/archive/stable_release_${PV}/graphviz-stable_release_${PV}.tar.gz \
+SRCREV = "771bc4dbff3e6f358fa75cdc7774a413ccacad51"
+SRC_URI = "https://www2.graphviz.org/Packages/stable/portable_source/${BP}.tar.gz \
            file://0001-plugin-pango-Include-freetype-headers-explicitly.patch \
 "
 # Use native mkdefs
@@ -38,10 +39,9 @@ SRC_URI_append_class-nativesdk = "\
            file://0001-Use-native-mkdefs.patch \
            file://graphviz-setup.sh \
 "
-SRC_URI[md5sum] = "2acf30ca8e6cc8b001b0334db65fd072"
-SRC_URI[sha256sum] = "e6c3f8dbfde1c4523055403927bef29f97f9fc12715c1042b5dcf648a2c1c62a"
+SRC_URI[sha256sum] = "8e1b34763254935243ccdb83c6ce108f531876d7a5dfd443f255e6418b8ea313"
 
-S = "${WORKDIR}/${BPN}-stable_release_${PV}"
+EXTRA_OECONF_append_class-native = " PS2PDF=/bin/echo"
 
 EXTRA_OECONF_class-target = "\
                 --with-expatincludedir=${STAGING_INCDIR} \
-- 
2.29.2

