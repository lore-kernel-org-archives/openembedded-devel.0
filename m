Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.23617.1610915773421931075
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Jan 2021 12:36:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gMYsewBo;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id dj23so12741010edb.13
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Jan 2021 12:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Bicrj6xmRGk0mWPAMbXtuIzdXLQM8P3UyxRKtWEAzKw=;
        b=gMYsewBoeFBWr3V0ob4uLz6WKKRIAMPdb7fB2uCBwursHgoPDR0VPGwMIjOJRlHnf0
         hhe5YwE9o15R/gAsTFUffStGl2Ybl/0DKOYF+ZqmhG9GFO5lPN7JwcpkOKb7zCFXpiIb
         1/7eqVkcpnCiqhgjmVCZrukHEFdAhHtLZ25jUIewXwV571DMErH/C0RMgdQNIbTxl0S2
         2JmRgreeOQjJ7ENIFmTOzxYDZRDQGUtIjYqulz3Bu5rJNIfcpZP7Sqs7PmrcTuodHeKo
         T6/2TNEujuXZ1R6InUWphD+c7DPc1TTuxk0G/bXlaMyqXaSvP7TOMwpQH1JlLVcB8z45
         sMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bicrj6xmRGk0mWPAMbXtuIzdXLQM8P3UyxRKtWEAzKw=;
        b=NKG4iIVnHCpaW61QEauq1prupU10cqMpW3hc2l0oybq8vAbg3X0q58m5DRK6F4RyJe
         aKUMTNrPEf+PYMdgJpWxw901XQrDAE2QRfIHflOtbTnPi/NrIoOTvTOhPxLyG+uF3Yvl
         f0hf4i3004rJ8Yo9BcE3HPytw7Fx2fCDGdE/X1qnPTQND9cMPFAyeysmWfLyUcnsmglC
         ECj1jktE7RPUsf5zqN0AKsq1her0Suz61sa5vI4NFqqamxyKCAM5KDwV0oYu46SxUXiW
         jbqpNAjug9W0hy+yG/51B1s3x5vMESg6Kcowgwo7YFakwNpDR6btXHuNWlEQOj93adoE
         duGw==
X-Gm-Message-State: AOAM532Jrz93h+SMgi9goQwHMQF14ud72G12kx0/4HyoE5TjZUsH7x8D
	dTR0FO4bA0VRvrYlfON26I9p2v5+koafkA==
X-Google-Smtp-Source: ABdhPJxwPA3lI3B1aXPOWMjkJCBr7R2Yaqm9K70cmkGCjzdMdDVvJ5xdbRcqqBPB+EgHcUPa5mLexg==
X-Received: by 2002:a50:fb96:: with SMTP id e22mr4318720edq.118.1610915771832;
        Sun, 17 Jan 2021 12:36:11 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f07b38751750a69f7d327ba.dip0.t-ipconnect.de. [2003:f0:7f07:b387:5175:a69:f7d3:27ba])
        by smtp.gmail.com with ESMTPSA id x6sm6922369ejw.69.2021.01.17.12.36.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 12:36:11 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATC][dunfell 2/2] graphviz: Upgrade to 2.44.1 release
Date: Sun, 17 Jan 2021 21:36:00 +0100
Message-Id: <20210117203600.2714-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210117203600.2714-1-schnitzeltony@gmail.com>
References: <20210117203600.2714-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

- Refresh patches to apply on new sources
- Switch away from gitlab archives
- Bypass pdf documentation generation

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
index aa5c0c8206..bc46a11d3a 100644
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
+EXTRA_OECONF_append = " PS2PDF=/bin/echo"
 
 EXTRA_OECONF_class-target = "\
                 --with-expatincludedir=${STAGING_INCDIR} \
-- 
2.26.2

