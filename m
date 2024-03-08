Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79652C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 06:29:55 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.15399.1709879391961566467
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 22:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ceTU2g+E;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e6381df003so1549836b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 22:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709879391; x=1710484191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I/vw/rcn/CczRBarbGe+m7M8Ik5F3EI84TWPQly1Ggs=;
        b=ceTU2g+EmOvjtjIHa9Mp+7cH5g1043JEjdHdyCKTi02/uJPrmnDQu2jPVdIA4TS6K1
         pdN86tNYCtR2zPjJrGbYdW2rNMw1vvsSEPZiJvJPLWJVpZLtx39g/CdTyW8W65yKxdta
         s/wyTOK6sdGeTQ/9wfT2rzWD61uVu3s8N2+uRUxKvH8ntUWrsBguKBtGR5UL63q87Vl/
         ZBVhGiGJoFj+rqsDcFNCEu/XML2VMNYG1+MMNkDwz4kVzhJZ7RAOpAUoLH8l3R3jhI3t
         WpfVH02V0GYGZd+hdJaAaeW5YRoTFjqYWRbeqAhaftk/25avePE6akkFNqyQiJpgeoo2
         CqGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709879391; x=1710484191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/vw/rcn/CczRBarbGe+m7M8Ik5F3EI84TWPQly1Ggs=;
        b=v4pe1p/9gds1A9/GpyB7WA+gFS2uy2fhCdvforz6RCwJ4RGkRzyVBGXHokuJqG0X7N
         ihxlKemsvzCo+oHYt5GvtwxmVikomFqwmkhcWm65fV6VCuqnM4q+M37FMJ/fpRrwjKoZ
         THR2enn9VM0fzlhBdVWIKmzpViz3KKwANZxy/SJSE5bWPZ/x6AZZtI3JrUDqWmdhGM+z
         ZG2D9cHqXu+etEF3J4gmgy5QJqgzvkrWzIzkHP8ni38+B6nfZA8zFt0DRpZFtlPJuOoJ
         XShn80h/9H8Bacw0pr3zAVZW16Bxfz0lJVWoY3CKdHXdtjWa8/t26nW4p3WkvTQ0pT9I
         5ThA==
X-Gm-Message-State: AOJu0Yz6fUNzTknYSCk01gyLY7cmluxKyQ0z5PmTJRLsnIrkbVhFWOwM
	ZtfSS24ME3iZviphMYEZchPuMEJoLLrYwcrr/ahgxV1Q9bcF/3XdH2bCGlZp
X-Google-Smtp-Source: AGHT+IHFVjJBJZua5IP+Jw/CZ+GO4ngCLFJwMWPFCQAjnQZABkRmoxLUbLxLRUCtTLZjkkPpucpmOA==
X-Received: by 2002:a05:6a20:d496:b0:1a1:7fbf:6a9f with SMTP id im22-20020a056a20d49600b001a17fbf6a9fmr2584091pzb.46.1709879390753;
        Thu, 07 Mar 2024 22:29:50 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::682a])
        by smtp.gmail.com with ESMTPSA id d4-20020a056a00198400b006e4fc1b1881sm8443738pfl.24.2024.03.07.22.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 22:29:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 1/2] gnome-online-accounts: Fix build with libxml2 2.12
Date: Thu,  7 Mar 2024 22:29:46 -0800
Message-ID: <20240308062947.1258485-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 06:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109222

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...abackend-Fix-build-with-libxml2-2.12.patch | 28 +++++++++++++++++++
 .../gnome-online-accounts_3.48.0.bb           |  3 +-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-goabackend-Fix-build-with-libxml2-2.12.patch

diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-goabackend-Fix-build-with-libxml2-2.12.patch b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-goabackend-Fix-build-with-libxml2-2.12.patch
new file mode 100644
index 0000000000..3d13779c2e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts/0001-goabackend-Fix-build-with-libxml2-2.12.patch
@@ -0,0 +1,28 @@
+From a2867ebcf184695eed00aab4e7b47c1d4a53b2b2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=BCrg=20Billeter?= <j@bitron.ch>
+Date: Fri, 24 Nov 2023 16:19:47 +0100
+Subject: [PATCH] goabackend: Fix build with libxml2 2.12
+
+libxml/xmlIO.h no longer includes libxml/parser.h.
+
+Upstream-Status: Backport [https://github.com/GNOME/gnome-online-accounts/commit/b9638e2418408be4906752297e700506766dcf20]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/goabackend/goaewsclient.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/goabackend/goaewsclient.c b/src/goabackend/goaewsclient.c
+index 4cb2358..01a52d1 100644
+--- a/src/goabackend/goaewsclient.c
++++ b/src/goabackend/goaewsclient.c
+@@ -27,6 +27,7 @@
+ #include <glib/gi18n-lib.h>
+ 
+ #include <libsoup/soup.h>
++#include <libxml/parser.h>
+ #include <libxml/xmlIO.h>
+ 
+ #include "goaewsclient.h"
+-- 
+2.44.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
index 47b234e235..fd61d797d0 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
@@ -7,7 +7,8 @@ inherit gnomebase gsettings gobject-introspection gtk-icon-cache vala features_c
 
 DEPENDS = "gdk-pixbuf dbus glib-2.0"
 
-SRC_URI += "file://0001-Replace-filename-with-basename.patch"
+SRC_URI += "file://0001-Replace-filename-with-basename.patch \
+            file://0001-goabackend-Fix-build-with-libxml2-2.12.patch"
 SRC_URI[archive.sha256sum] = "418bb9fcffdbd72a98205ad365137617fc1e3551a54de74f6a98d45d266175bf"
 
 PACKAGECONFIG ?= "goabackend kerberos owncloud lastfm google windows_live"
-- 
2.44.0


