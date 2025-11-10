Return-Path: <eric.meyers15310@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57FAFCCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 14:29:14 +0000 (UTC)
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49212.1762784949370017405
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 06:29:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Es8nDYgx;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: eric.meyers15310@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id e9e14a558f8ab-43346da8817so16751295ab.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 06:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762784948; x=1763389748; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdMLkZjTcSVy0PUGblAgw/ze3yKZVKQgKj5qHEU1RDc=;
        b=Es8nDYgxQnMCFe9Y48VlR5M+ZdFRCV5J2Pun39T6qzplx2qAAkb4jQQG0ehD/dqzED
         2M3xHN+5pl+ewI/pH6/B7ryqWPKqVTqajmzCO+gnakdIndoiwqmBMjp3QVCs+HnUs5dJ
         vcG3A7Nj5YTd4kaQiARfFa7xOzsUc6rP7T8vjBjgezj2IAOjBPfzJvWN5W3mWpqn0eWp
         mkopm+1Vqp/1eo/o4U3ritCVcKkYPLvck/I8KV9MfdWpMKllRGIxriVkrXD2xX71Hq55
         CTu1qo167Ra7AeQAh249okiYaUo/FKBpv5QqInbP4ygnjQuUTlAvbc1gHE0FlgMF9FNZ
         rGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762784948; x=1763389748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdMLkZjTcSVy0PUGblAgw/ze3yKZVKQgKj5qHEU1RDc=;
        b=bsgJpFEiy+D6uSDUqqukN3oNQg248laazOdlUr+xmjwPfRl7jxU/QXsTs8pZ3nnz36
         C88SdmIFDw2ZFT+W/Icb66Kkj1+lkaIYihwKqGmy2azjVbg2tIUhciUe7DDdyGqZpY3Z
         ky1eSlkrYLWLIDvcqJgNjtcRy8qd40mWtH9QJK0xyBDeS26AS8+X4qv48qDkEUsGk1mj
         sb5qw3YcZg0Vgs2rt5sijGJHCye/G9p4+tm19uVYemcUNTPMhH/v3lWLR2bE5LUtnjh8
         sR2jTVbLYZ1tQiZaW7GTd9PSkmvZcZPKpTAnKT1Wn9+FeHMarZ+T8YU2icZIPBfBnWFk
         qWrw==
X-Gm-Message-State: AOJu0Yz1WEo5DUHeIWYAyQaqEC0826IRFH6o3P1m+u5MmOQDqeuOIHrY
	5tfURxx21PEPEa6YJ1HdJX5dHNggPVc0Z6JfLYANqb9kTohCO60bs4+TEilvcmpx
X-Gm-Gg: ASbGncso3iUev6GlCA2znBlUb2OsI7D51RGiC9ObusiHv6k1vXLU7ESlFWdmqCWrjGS
	LmZ3emQX6o//hMSJePxHdNMgOHkAoA4AVjkl4TmLr2/UvuY+MKTD5JYU6K1epQnVtqMEWchQlj6
	8z04Tath6qwFyW+Fg5eM2kAC212anEMuhPy9fabZ6XSdvcNBz3qBedg7nzS8JOuPR9NdL5toXvR
	a9NhQVq4muBdC9CFyFcF3NFmMo/dZV/vKMNaivQBnAUVhqEzLjW+Mmhz0YdBJfUtTDchbvtygsz
	uDnIOehvucSsyfzXDu+S0JD1F9Sjvu6IgvgYQBldrT+HEql/gmhrxsvS4EtfwSK/6hARvyi15I0
	O79PViq6krV0WtQCRx6ByHo6QgdwPlAEZKSRFfIU1su8xrcATP1s6jeTdwAX9TgtMUdDriDyZfb
	4uR3PmiaVjqnpTh/Q0W5fZ8zlu5p+SANB+QGVUU56TTLE7+1QgkPrZbd1BQjZjxHWrGk+u3kWz
X-Google-Smtp-Source: AGHT+IHxukwGtR6L2KM9iRYW/qDDqKUaCUvCzTiD9H79ZQ+rRLv4EWGIiV1VTPRNx8Tig0EoCeUkLw==
X-Received: by 2002:a05:6e02:144d:b0:433:2dcb:db41 with SMTP id e9e14a558f8ab-43367e37784mr141314845ab.10.1762784948258;
        Mon, 10 Nov 2025 06:29:08 -0800 (PST)
Received: from ACT-L-SWD024.yourbase.domain.local (c-73-168-239-54.hsd1.il.comcast.net. [73.168.239.54])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4334f45c7d9sm58137935ab.16.2025.11.10.06.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 06:29:07 -0800 (PST)
From: Eric Meyers <eric.meyers15310@gmail.com>
X-Google-Original-From: Eric Meyers <eric.meyers@arthrex.com>
To: openembedded-devel@lists.openembedded.org
Cc: Eric Meyers <eric.meyers@arthrex.com>
Subject: [PATCH] network-manager-applet: Fixing builds when x11 is not included in DISTRO_FEATURES
Date: Mon, 10 Nov 2025 08:29:13 -0600
Message-Id: <20251110142913.11662-1-eric.meyers@arthrex.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 14:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121463

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
 

