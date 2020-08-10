Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.613.1597091059954695289
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2020 13:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hyF46EjT;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id bo3so10690542ejb.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2020 13:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aIOMx30gBHD/vvCgyXhCwYRPl746L2SEElkjYLBtSPI=;
        b=hyF46EjTAXGMZyaFUj9+dtcbm+z0hDpFCxlKnmtkSsUjry4XqbrqtZDC+DnpDIS5bl
         miAd3xKb4cQBdbx9eot+X1N1MAdXzgn1c9gp7LULnyLNfQC5uZGlWkqOmkQf6zzht+in
         XJ+i3TaSyolQm7MfwFTGeukV4UqmVvy/N0PRTOVHFOiHL6Hhl7Z1pLCxCYxlqsYjw4jO
         qi/unOzFW3jKZEdCAaqfaDyxtfOEvVFfbhvNAsqum+ox/9G+r3Jn43AVPJ3acmhjqbEu
         r85E2EiRXq9wkXufv7gkUwfGzZ+zFChTuaHZoT/x+4f3kmXgKPxeic49YrTdx6Lei/OE
         sSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aIOMx30gBHD/vvCgyXhCwYRPl746L2SEElkjYLBtSPI=;
        b=NsXLw6XnBOx+62GprMSR7ox5yTg+Phut9wFq6kExZAZm7ZNNLLYpAcMzsm+PSBgAxd
         fJPR9t6NrKgYzXtHvms/qz017PoPqyQJ+Z/ox8YgTNPogbbfQRNJx2E3GA1ZxNcJ+G/M
         TWSukptjr9s/4clQAfXI6oaUdWDxoE3oNR3wsJxw3Yo71m73Nk8h2O8oKbMWqzBjZqHo
         ORlWEZNfukCGoFe7TviEJ6EPviulH/XnG0GVk+x5Adu4lBTZvG3oOVhug+J2oYuOSltj
         Z+wObL2wjpMgu75ij9uGFJzmixRizIb8JM/OVx8KyxYtZteTr2GdtMt4Jx0hbXt0ndvM
         y23g==
X-Gm-Message-State: AOAM530PNrtxr9UV6xiGHirvfzjWYtqR1fnt0hVgA3C/6n9Jmy8lDEIC
	fpk9FkEB8zvE9lKYyw6I6t48O0cP
X-Google-Smtp-Source: ABdhPJz/lHiYHJpou0N673suX4gsau1VfA3q+4p8ErX3uENNOQS9DPq4VHeRZDFjP5xRf1KDQjyWFA==
X-Received: by 2002:a17:906:9609:: with SMTP id s9mr19650568ejx.232.1597091058013;
        Mon, 10 Aug 2020 13:24:18 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f102134cf0016489462cd53.dip0.t-ipconnect.de. [2003:f0:7f10:2134:cf00:1648:9462:cd53])
        by smtp.gmail.com with ESMTPSA id f21sm12878378edv.66.2020.08.10.13.24.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 13:24:17 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] libpeas: disable tests when introspection is not enabled/available
Date: Mon, 10 Aug 2020 22:24:10 +0200
Message-Id: <20200810202410.33612-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixes introspection-less build. Sent upstream so hope they either
agree or come up with something better next release.

Tested before and after adding the patch by setting GI_DATA_ENABLED = 'False'

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ts-when-introspection-is-disabled-mi.patch | 36 +++++++++++++++++++
 .../recipes-gnome/libpeas/libpeas_1.26.0.bb   |  5 +--
 2 files changed, 37 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-gnome/libpeas/libpeas/0001-Do-not-build-tests-when-introspection-is-disabled-mi.patch

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas/0001-Do-not-build-tests-when-introspection-is-disabled-mi.patch b/meta-oe/recipes-gnome/libpeas/libpeas/0001-Do-not-build-tests-when-introspection-is-disabled-mi.patch
new file mode 100644
index 000000000..86586fe71
--- /dev/null
+++ b/meta-oe/recipes-gnome/libpeas/libpeas/0001-Do-not-build-tests-when-introspection-is-disabled-mi.patch
@@ -0,0 +1,36 @@
+From 53a4f19887d9ae4e77f32dd6d71c8a7b516b4d5d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 10 Aug 2020 21:53:33 +0200
+Subject: [PATCH] Do not build tests when introspection is disabled/missing
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+| ../libpeas-1.26.0/tests/libpeas/introspection/meson.build:47:0: ERROR: Unknown variable "libpeas_gir".
+
+Upstrem-Status: Submitted[https://gitlab.gnome.org/GNOME/libpeas/-/merge_requests/28]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ meson.build | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 8322fea..43fb062 100644
+--- a/meson.build
++++ b/meson.build
+@@ -254,7 +254,9 @@ subdir('loaders')
+ if build_demos == true
+   subdir('peas-demo')
+ endif
+-subdir('tests')
++if generate_gir == true
++  subdir('tests')
++endif
+ 
+ summary = [
+   '',
+-- 
+2.26.2
+
diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
index 1b754343a..fd4ce7de5 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.26.0.bb
@@ -10,14 +10,11 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache features_check
 
-# gobject-introspection is mandatory and cannot be configured
-REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-introspection --disable-introspection"
-
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SRC_URI += " \
     file://add_missing_locale_include.patch \
+    file://0001-Do-not-build-tests-when-introspection-is-disabled-mi.patch \
 "
 
 SRC_URI[archive.md5sum] = "f7723bf8433b7984121157e1e9a629b5"
-- 
2.26.2

