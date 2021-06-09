Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.4432.1623220734964996929
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BJz4wuOh;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id g8so36713233ejx.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=k4Xf78xjae02CCXnw8q9Qx0JqX425RPNA8i7Rlm728k=;
        b=BJz4wuOhRX2PsOyve9ry63k8A8fnJL0U3Bsl/epEyLOysG173YnRoTKC5ZKehw1B3W
         d5NDl1P70TAfQlhd0N6V5TiVEMT5ujmYmYzrnG074geG4MekOBGBnolqQplirbW6Ctie
         0YjbLHDmf6B4cFtHf0DDoydyOevvU+/ySXQvpv8wSZm39OCYvMlOpf2Ai/G8wqpx5TVR
         oLy5TjfdhMS+M1Tb5wCjAIRkApuibnZTKZIlOM2pipMxRup5T90LacxEEXzyH7v4ds9z
         bgK7JnZYtsn0PT7C6DntVzBHsjuyDS2amIbbka5DoADa6JlbHj7dzrd3k03QkcSoc2/W
         xaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k4Xf78xjae02CCXnw8q9Qx0JqX425RPNA8i7Rlm728k=;
        b=PYgp8q4sXYluc6GDwJVayh8s+PcC89vb5LCZqJsK3DUEneV2Udvow5Q/wCsuVsFxl3
         zbIihNahmeIeYhPb7Y8g2+3mVIcAQYNBYETLiXXyh6MuHSCfr3sjPWcLjLYuiLMw3lx4
         jtsAE7LKu5qvNeKeOdHiTpRxprtmKvPnrUZi8Js6lNB5klf0OJs3rjIpCrTXElQ83kd6
         sJdMwXN0S2kWOCg3epPwlCOn5J6XpUPxpy2zAOEcNAX1SwoMKJuEUaw0cQrHuspaDcsW
         FWsjLpnvPoqHZ0918AndZov/xa+QuSmiO74K/Mifs1RDNe+ENXMNcupNL2cy4adroyyM
         nz1Q==
X-Gm-Message-State: AOAM531c8xZcy0cuIREEGDx1QHmQQBoXyB8k/kow9qQdoIH+NYETAZ8I
	P6hbVWAASWqTD0/KnFxAVmmmDSVj7RW8hg==
X-Google-Smtp-Source: ABdhPJwE7y4OsQMokL9Dwjt5mTo483rWvP4GWUDkzSJitZO7FuOytxaOGdsMf96DoP6qa1kv0Bh6SQ==
X-Received: by 2002:a17:906:9706:: with SMTP id k6mr26834234ejx.456.1623220733473;
        Tue, 08 Jun 2021 23:38:53 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:53 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 15/28] gupnp: upgrade 1.2.6 -> 1.2.7
Date: Wed,  9 Jun 2021 08:38:18 +0200
Message-Id: <20210609063831.3400611-15-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hardening fix was applied

1.2.7
=====

- Fix build with -Wformat-security=error
- Bump required GLib version to 2.66
- Fix some introspection annotations
- Add missing varargs functions to vapi
- Revert fix from 1.2.5 which causes managed control points to
  live too long

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...x-build-with-hardened-security-flags.patch | 61 -------------------
 .../recipes-connectivity/gupnp/gupnp_1.2.6.bb | 10 ---
 .../recipes-connectivity/gupnp/gupnp_1.2.7.bb |  7 +++
 3 files changed, 7 insertions(+), 71 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-Fix-build-with-hardened-security-flags.patch
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.6.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.7.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-Fix-build-with-hardened-security-flags.patch b/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-Fix-build-with-hardened-security-flags.patch
deleted file mode 100644
index ef0c945d0..000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-Fix-build-with-hardened-security-flags.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 6eba07bd195e0a1199a0fc62d7cc31ec376bc3dd Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Mon, 31 May 2021 17:44:29 +0200
-Subject: [PATCH] Fix build with hardened security flags
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-| ../gupnp-1.2.6/examples/get-volume.c: In function 'on_introspection':
-| ../gupnp-1.2.6/examples/get-volume.c:53:17: error: format not a string literal and no format arguments [-Werror=format-security]
-|    53 |                 g_critical (error->message);
-|       |                 ^~~~~~~~~~
-| ../gupnp-1.2.6/examples/get-volume.c:114:17: error: format not a string literal and no format arguments [-Werror=format-security]
-|   114 |                 g_critical (error->message);
-|       |                 ^~~~~~~~~~
-| ../gupnp-1.2.6/examples/get-volume.c: In function 'main':
-| ../gupnp-1.2.6/examples/get-volume.c:150:17: error: format not a string literal and no format arguments [-Werror=format-security]
-|   150 |                 g_error (error->message);
-|       |                 ^~~~~~~
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gupnp/-/merge_requests/17]
----
- examples/get-volume.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/examples/get-volume.c b/examples/get-volume.c
-index 4601014..923581c 100644
---- a/examples/get-volume.c
-+++ b/examples/get-volume.c
-@@ -50,7 +50,7 @@ on_introspection (GObject *object, GAsyncResult *res, gpointer user_data)
-                 &error);
- 
-         if (error != NULL) {
--                g_critical (error->message);
-+                g_critical ("%s", error->message);
-                 g_clear_error (&error);
-         }
- 
-@@ -111,7 +111,7 @@ on_introspection (GObject *object, GAsyncResult *res, gpointer user_data)
-         g_list_free (out_names);
- 
-         if (error != NULL) {
--                g_critical (error->message);
-+                g_critical ("%s", error->message);
-                 g_clear_error (&error);
-         } else {
-                 g_print ("Current volume: %s\n",
-@@ -147,7 +147,7 @@ int main(int argc, char *argv[])
-         GUPnPContext *context = gupnp_context_new ("wlp3s0", 0, &error);
- 
-         if (error != NULL) {
--                g_error (error->message);
-+                g_error ("%s", error->message);
-         }
- 
-         GUPnPControlPoint *cp = gupnp_control_point_new (context, CONTENT_DIR);
--- 
-2.31.1
-
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.6.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.6.bb
deleted file mode 100644
index 294c361db..000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require gupnp.inc
-
-SRC_URI = " \
-    ${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz \
-    file://0001-Fix-build-with-hardened-security-flags.patch \
-"
-SRC_URI[sha256sum] = "00b20f1e478a72deac92c34723693a2ac55789ed1e4bb4eed99eb4d62092aafd"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.7.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.7.bb
new file mode 100644
index 000000000..7ad594f02
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.2.7.bb
@@ -0,0 +1,7 @@
+require gupnp.inc
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz"
+SRC_URI[sha256sum] = "8441276f1afd0176e6f595026a3a507eed1809abfa04026bad3f21622b3523ec"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://libgupnp/gupnp.h;beginline=1;endline=20;md5=d78a69d9b6e63ee2dc72e7b674d97520"
-- 
2.31.1

