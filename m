Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA25CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 14:29:44 +0000 (UTC)
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49191.1762784815771003322
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 06:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DiZ+hYcr;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: eric.meyers15310@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id e9e14a558f8ab-432107e48deso11066055ab.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 06:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762784815; x=1763389615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdMLkZjTcSVy0PUGblAgw/ze3yKZVKQgKj5qHEU1RDc=;
        b=DiZ+hYcrPG8eyDXQwVVOe0TOXL70LyrF/m+YKsuCTYsfNrkrx2aEULtgmlPOMEnTcI
         k4wTm/eDbRp8nk2yEBUwAd24338I1jkecn1Zq5fC8JH3sRue4ujWF5qxja2JFzhPK9xd
         j/OuvuFVkDrz+24jH39ehooFMQg/UrrztzjUEjq1s8SgcBGPFAySlsQ4zPa4gXQECu3m
         Ur2OlW1/DVx5IFjl6I43q5qXwb71xmkxBtyIy04/8xmssXt/02XsYIN7xboFc6L7mCNM
         0kMM8aIPMRZR8cqbAkWHlgpdUMhubEhHJkNaco9GFk2qjgE2bBcVMFcrp6/gYmUpf8Zb
         CiOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762784815; x=1763389615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdMLkZjTcSVy0PUGblAgw/ze3yKZVKQgKj5qHEU1RDc=;
        b=ZI92l1gE23DBEGYJE/PrLj6LJa3uc4e0wy9ellW00ecxpdcGpmUMBghrh+Om0+wYsP
         mUsgZW1D1qoIla4wwoOoKHGRRXlQw9qqOQFLAzHTpYOY1HtGJYw614tamhqRY7gioJjo
         Jfh/yhevj70jvUbOpJd2Y1NPgIgbNu3QprYcI7KrJOFDsxo9DmR1LS2wsBybbMmzJ0vn
         3gsIg3qvzYnJKlhdYGhZBB4CCTVK84Y3/1kmj01JMkh3RMSvH7s252wt+fwQ4ntJsTo+
         MvORx+wg+eyfrI7fHZKshgK1Lw5jWcmXN+mPeh/gqSgdIWzUFQ9+fNB+kQLSJRyjb7U7
         FQig==
X-Gm-Message-State: AOJu0Yz0RE3Dv8pXD4f78UDkcedRkR3fmvy+r4g/kEMgyjqPWfGh8UtE
	Wr1HYv4tF45Sqdmkkb+Mnpl/8ynd4dE7r+JMcQAncm2I47bCe+JZMNuvLtXD0FM3
X-Gm-Gg: ASbGncuLHVW3XvD96RUxw3gpAYjNMfelv5SDgxGYUCQFgvXUKey5bmPjPFkl/CZAkxG
	a01cX4R0MOLZmBkXrtGo+RnfU/UKA7z0YvgXob84rya5ecN0foAWNA11hKLMjCx3TGoEHmcVxrB
	Qc5gUXZRlkIFno03EpibSDZuqaCE6Y+Qx5yxK1b5cmpV5gNo+1H05nvCBmWMP0FHxasyVg1nhhZ
	pwfUbKRJtmWSfa0HPJH2FdAULxFrg/4oxHV9Jo2lUOEe4bhQAmt28jcVim6OzLP29IwzDBEJmny
	C/KvlTy9GIdR4G0XXIinWO67zBbA2nmksytlpd/z8ufzun91a39hHX6FmERpy4dCTH0yVoY4WG6
	X6mPjblRb6HNz+kaiozXewoCb/M7HI+rxKaYpWwe6vbgUEItIEMwNqE0zf66FLNNTCdwgFjG8a8
	dvW0erc0KBFeM5SgXDeb9PKPfjHTTHxiFHGkkTRSz5U2ipWd3pYAZU1eS9F3jJGd4y/IxpX6x07
	8CBGF5Z8QU=
X-Google-Smtp-Source: AGHT+IHy81qUjPOGHKvNoyd+xsNUUC04Rbyyyzj0pd/s6CfCuA57H8ACGwxN/RGl6xJPl7DVRPr0sQ==
X-Received: by 2002:a05:6e02:741:b0:433:2341:bc13 with SMTP id e9e14a558f8ab-43367dde525mr133618875ab.11.1762784814595;
        Mon, 10 Nov 2025 06:26:54 -0800 (PST)
Received: from ACT-L-SWD024.yourbase.domain.local (c-73-168-239-54.hsd1.il.comcast.net. [73.168.239.54])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5b746923b0fsm5005521173.34.2025.11.10.06.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 06:26:54 -0800 (PST)
From: "Eric Meyers" <eric.meyers15310@gmail.com>
X-Google-Original-From: Eric Meyers <eric.meyers@arthrex.com>
To: openembedded-devel@lists.openembedded.org
Cc: Eric Meyers <eric.meyers@arthrex.com>
Subject: [PATCH] network-manager-applet: Fixing builds when x11 is not included in DISTRO_FEATURES
Date: Mon, 10 Nov 2025 08:26:59 -0600
Message-Id: <20251110142659.11647-1-eric.meyers@arthrex.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 14:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121466

Commit c466cb9 (https://github.com/openembedded/meta-openembedded/commit/c466cb9)
switched to using ANY_OF_DISTRO_FEATURES, so theoretically users can have either
x11 or wayland in their DISTRO_FEATURES. In the case that only wayland is specified,
this build error is seen:

| In file included from ../sources/network-manager-applet-1.36.0/src/applet.c:25:
| ../sources/network-manager-applet-1.36.0/src/applet.h:14:10: fatal error: gdk/gdkx.h: No such file or directory
|    14 | #include <gdk/gdkx.h>
|       |          ^~~~~~~~~~~~
| compilation terminated.

gdkx.h is brought in via including x11 in DISTRO_FEATURES - so this patch removes
the incompatible headers in the case of x11 not being specified in DISTRO_FEATURES.

Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
---
 ...kx-build-error-when-x11-not-included.patch | 50 +++++++++++++++++++
 .../network-manager-applet_1.36.0.bb          |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet/0001-fix-gdkx-build-error-when-x11-not-included.patch

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet/0001-fix-gdkx-build-error-when-x11-not-included.patch b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet/0001-fix-gdkx-build-error-when-x11-not-included.patch
new file mode 100644
index 0000000000..f0cc54c131
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet/0001-fix-gdkx-build-error-when-x11-not-included.patch
@@ -0,0 +1,50 @@
+From: Eric Meyers <eric.meyers@arthrex.com>
+Date: Fri, 7 Nov 2025 12:00:00 +0000
+Subject: [PATCH] Patch to fix gdkx.h build issues.
+
+Patch to fix gdkx.h build issues when x11 is not included in DISTRO_FEATURES:
+
+| In file included from ../sources/network-manager-applet-1.36.0/src/applet.c:25:
+| ../sources/network-manager-applet-1.36.0/src/applet.h:14:10: fatal error: gdk/gdkx.h: No such file or directory
+|    14 | #include <gdk/gdkx.h>
+|       |          ^~~~~~~~~~~~
+| compilation terminated.
+
+Upstream-Status: Pending
+Signed-off-by: Eric Meyers <eric.meyers@arthrex.com>
+diff --git a/src/applet.h b/src/applet.h
+index 7978ba7c..6992196a 100644
+--- a/src/applet.h
++++ b/src/applet.h
+@@ -11,7 +11,6 @@
+ #include <string.h>
+
+ #include <gtk/gtk.h>
+-#include <gdk/gdkx.h>
+
+ #include <net/ethernet.h>
+
+diff --git a/src/connection-editor/nm-connection-editor.c b/src/connection-editor/nm-connection-editor.c
+index b68141bb..2d8762d8 100644
+--- a/src/connection-editor/nm-connection-editor.c
++++ b/src/connection-editor/nm-connection-editor.c
+@@ -15,7 +15,6 @@
+ #include <sys/types.h>
+ #include <unistd.h>
+ #include <errno.h>
+-#include <gdk/gdkx.h>
+
+ #if WITH_SELINUX
+ #include <selinux/selinux.h>
+diff --git a/src/connection-editor/nm-connection-list.c b/src/connection-editor/nm-connection-list.c
+index a3f41c04..b54c76b0 100644
+--- a/src/connection-editor/nm-connection-list.c
++++ b/src/connection-editor/nm-connection-list.c
+@@ -13,7 +13,6 @@
+ #include <string.h>
+ #include <sys/types.h>
+ #include <unistd.h>
+-#include <gdk/gdkx.h>
+
+ #include "ce-page.h"
+ #include "nm-connection-editor.h"
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.36.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.36.0.bb
index 10e514775a..f6c6bdab96 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.36.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.36.0.bb
@@ -10,6 +10,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "opengl"
 
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
+SRC_URI:append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', ' file://0001-fix-gdkx-build-error-when-x11-not-included.patch', d)}"
 
 SRC_URI[archive.sha256sum] = "a84704487ea3afe1485c47fb2ab598b8f779f540ae0dcbf0a1c5f85e64a7e253"
 

