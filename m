Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.46096.1622477468771315354
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 09:11:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FoFPIepX;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id k7so7852229ejv.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 May 2021 09:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ciqwe4e7dify4h0gSlskEOpteiph7nGlwKBb2xSj65c=;
        b=FoFPIepXQ91EaaDvwCErMmwoA1wzoscq7W4qXV05z8nl51N3DSHkwAvh+mCBNHZwfD
         l+PJKJ7Uwr6E58Wz9/6UwrPj82Hm0WNMZdvskIx7kExFuH3TiEsIBfPH6aqq++y0OS5t
         kSwOp1MrwV12ROsG3KKk6UN+mFOSJezUFFPD8joSh2XGrJHyvUB1wPfgaFLyL/P+exb7
         VvkS5GSP6fMnZjlzMs20Ku46oceQGt+sulZb2rM4RPYa2pcujaEbIepBeQtNKxixkLK8
         PP3KFfGY2EFPLBD6RZ8B7tt9MCMv9rEMcAbi1vP9UOvq8Jh3Q8nUfku9P6O2j7WI3pQK
         Fjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ciqwe4e7dify4h0gSlskEOpteiph7nGlwKBb2xSj65c=;
        b=aXtIEJOTzTEfcMVf0NpvlrEVU7/ofU5OjPyuT2BnefCn2WBrvbZGEMDzZbLpxwNw3L
         B3H2adj3hUjCPqX345Vs9SpJZk63NBbVMeabW+X/xhldYxRMjriZXZ6E2NLjFo+Coqlt
         XcmeMaLzSM7t0oHwx1eaMc4DJq3wi1yDMpqFnmCGsosD5beGMOKT3wBf+JRXnwYclmaz
         gzPUiROY5MBwgtKeaykmFh8V0owmajwZyEQuAgSVtCyqgmU0RFEkSNMixeY1HHCYV6CH
         fB+JNLQAZ2r9Gwf67+PgV5qcKgFJTZq+aCA4rAAr6q4z+emrx6iWVJAV2jy0cd2Iby/v
         1CIg==
X-Gm-Message-State: AOAM533UpEOtHT0qNHDDAmYERa8Loj3qQ/4+C8Mwfa/H6Z8xvPInPJ/C
	ei40/MdSuKeQ/Y4Ol0m5VmEJ6Eu1AFmbRg==
X-Google-Smtp-Source: ABdhPJwlcfIWtqt5fiqae0UpwnViCVRaylTvlx439BZiqwWEkAOKPzRfygFoVzwqN58apP58ZS3KYw==
X-Received: by 2002:a17:906:489:: with SMTP id f9mr5753877eja.508.1622477466895;
        Mon, 31 May 2021 09:11:06 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f3c1e841a27535052664e52.dip0.t-ipconnect.de. [2003:f0:7f3c:1e84:1a27:5350:5266:4e52])
        by smtp.gmail.com with ESMTPSA id t20sm4586418edq.55.2021.05.31.09.11.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 09:11:06 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] gupnp: upgrade 1.2.4 -> 1.2.6
Date: Mon, 31 May 2021 18:10:59 +0200
Message-Id: <20210531161059.2209236-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In their mail announcement they stated out clearly:
GUPnP 1.0.7 and GUPnP 1.2.5 fix a potential DNS rebind issue.

An impact of this would be that for example a user could be tricked
into opening a malicious web page that could scan the local network for
UPnP media servers and download the user's shared files, or, if
enabled, even delete them.

Upgrade to 1.2.5 (or where that is not possible, 1.0.7) is strongly
recommended.

At repo side:
1.2.6
=====
- Fix wrong dependency on GSSDP 1.2.4

Bugs fixed in this release:
 - https://gitlab.gnome.org/GNOME/gupnp/issues/48

All contributors to this release:
 - Jens Georg <mail@jensge.org>

1.2.5
=====
- Fix introspection annotation for send_action_list
- Fix potential fd leak in linux CM
- Fix potential NULL pointer dereference when evaluating
  unset ServiceProxyActions
- Fix leaking the message string if an action is never
  sent
- Fix leaking the ServiceProxyAction if sending fails
  in call_action
- Fix introspection annotation for send_action and
  call_action_finish to prevent a double-free
- Make ServiceIntrospection usable from
  gobject-introspection
- Add Python examle
- Add C example
- Fix JavaScript example
- Fix potential use-after-free if service proxy is
  destroxed before libsoup request finishes in control
  point
- Fix potential data leak due to being vulnerable to DNS
  rebind attacs

Bugs fixed in this release:
 - https://gitlab.gnome.org/GNOME/gupnp/issues/47
 - https://gitlab.gnome.org/GNOME/gupnp/issues/46
 - https://gitlab.gnome.org/GNOME/gupnp/issues/23
 - https://gitlab.gnome.org/GNOME/gupnp/issues/24

All contributors to this release:
 - Jens Georg <mail@jensge.org>
 - Doug Nazar <nazard@nazar.ca>
 - Andre Klapper <a9016009@gmx.de>

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...x-build-with-hardened-security-flags.patch | 61 +++++++++++++++++++
 .../gupnp/{gupnp_1.2.4.bb => gupnp_1.2.6.bb}  |  8 ++-
 2 files changed, 66 insertions(+), 3 deletions(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-Fix-build-with-hardened-security-flags.patch
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.2.4.bb => gupnp_1.2.6.bb} (47%)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-Fix-build-with-hardened-security-flags.patch b/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-Fix-build-with-hardened-security-flags.patch
new file mode 100644
index 000000000..ef0c945d0
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-Fix-build-with-hardened-security-flags.patch
@@ -0,0 +1,61 @@
+From 6eba07bd195e0a1199a0fc62d7cc31ec376bc3dd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 31 May 2021 17:44:29 +0200
+Subject: [PATCH] Fix build with hardened security flags
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+| ../gupnp-1.2.6/examples/get-volume.c: In function 'on_introspection':
+| ../gupnp-1.2.6/examples/get-volume.c:53:17: error: format not a string literal and no format arguments [-Werror=format-security]
+|    53 |                 g_critical (error->message);
+|       |                 ^~~~~~~~~~
+| ../gupnp-1.2.6/examples/get-volume.c:114:17: error: format not a string literal and no format arguments [-Werror=format-security]
+|   114 |                 g_critical (error->message);
+|       |                 ^~~~~~~~~~
+| ../gupnp-1.2.6/examples/get-volume.c: In function 'main':
+| ../gupnp-1.2.6/examples/get-volume.c:150:17: error: format not a string literal and no format arguments [-Werror=format-security]
+|   150 |                 g_error (error->message);
+|       |                 ^~~~~~~
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gupnp/-/merge_requests/17]
+---
+ examples/get-volume.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/examples/get-volume.c b/examples/get-volume.c
+index 4601014..923581c 100644
+--- a/examples/get-volume.c
++++ b/examples/get-volume.c
+@@ -50,7 +50,7 @@ on_introspection (GObject *object, GAsyncResult *res, gpointer user_data)
+                 &error);
+ 
+         if (error != NULL) {
+-                g_critical (error->message);
++                g_critical ("%s", error->message);
+                 g_clear_error (&error);
+         }
+ 
+@@ -111,7 +111,7 @@ on_introspection (GObject *object, GAsyncResult *res, gpointer user_data)
+         g_list_free (out_names);
+ 
+         if (error != NULL) {
+-                g_critical (error->message);
++                g_critical ("%s", error->message);
+                 g_clear_error (&error);
+         } else {
+                 g_print ("Current volume: %s\n",
+@@ -147,7 +147,7 @@ int main(int argc, char *argv[])
+         GUPnPContext *context = gupnp_context_new ("wlp3s0", 0, &error);
+ 
+         if (error != NULL) {
+-                g_error (error->message);
++                g_error ("%s", error->message);
+         }
+ 
+         GUPnPControlPoint *cp = gupnp_control_point_new (context, CONTENT_DIR);
+-- 
+2.31.1
+
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.6.bb
similarity index 47%
rename from meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb
rename to meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.6.bb
index c7b330fa0..294c361db 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.4.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.6.bb
@@ -1,8 +1,10 @@
 require gupnp.inc
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "7c9c7cd80e36d9fb1e5b0267571fc17d"
-SRC_URI[sha256sum] = "f7a0307ea51f5e44d1b832f493dd9045444a3a4e211ef85dfd9aa5dd6eaea7d1"
+SRC_URI = " \
+    ${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz \
+    file://0001-Fix-build-with-hardened-security-flags.patch \
+"
+SRC_URI[sha256sum] = "00b20f1e478a72deac92c34723693a2ac55789ed1e4bb4eed99eb4d62092aafd"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
-- 
2.31.1

