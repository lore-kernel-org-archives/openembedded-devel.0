Return-Path: <3npq_WwMKALUrVfbjjbgZ.Xjh@flex--wak.bounces.google.com>
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com
	[209.85.210.202])
	by mail.openembedded.org (Postfix) with ESMTP id D19BB6022F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 18:46:53 +0000 (UTC)
Received: by mail-pf1-f202.google.com with SMTP id z28-v6so9118194pff.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Oct 2018 11:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
	h=mime-version:date:message-id:subject:from:to:cc;
	bh=YjEaEqDWcKCQO4Nk7THy1AVg7nNdnRNuWKNSPLygWeo=;
	b=upjStXDVYpjtaeU62oYAuU0sITognfweqUVknYpPyyPorqjCQnejnM/CyI860aHpAh
	2JglXo7cw2W7w84FGXJJ5QkXHW0N//0dwHSS+2Z6kVGu/CuWvvj23B1mg3gALmOX5g2H
	3UMH+6jG0vV/xWKGGvRelA6iFcplc4GdAKpTAJZw4uoteTjj86zAtfqbXZFYk1hhHz9Z
	X7kCNdS1shA0odOl/zr+zrjaDun8EEFkl8/x3If4HvaLL5xLlyqPF8i6uwjAEc/Z/Jss
	pKr3SRlPpCfpZFlK7zWZIWG0vjNtQMs+k74CyyxrYuoPUL4IvQLw2BVi8lOyQfqioXVY
	sRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to:cc;
	bh=YjEaEqDWcKCQO4Nk7THy1AVg7nNdnRNuWKNSPLygWeo=;
	b=sqkXbsBNu/7mGdPn/N0q1qlA/v7ahx5hwLiR8WUmd6zw9o+VlJaDdptdEJa58ucbNn
	ie2ruZNUITJer/RhAGFvPl+hNQPRe6ZF15Ogw0q1ItuIIK2WKwOYFWA/Q/YEaHXY4epd
	3udBLvom6OBJtr6MtyISWcNhbPFm+j/nSlIsZCHQHwdbf0UtfisdHcd2xGpJ9nWmX5pF
	iDjvNJhzlpRjywoVcmXX0WRnPn0hTk1setHfLASS69XtABqXeDutbwmn45nNjDTfGTdn
	QySP61TfQ/fa5NcIdHD4U7JbrNySZpqxzxLMDm8bm0N7VHdQXJzaKBME7mYK7IVpb50o
	Nvcw==
X-Gm-Message-State: ABuFfohHfO+0b7eJaOE/HJtHDgfmAs7QWLLzbcUIxUeaxP+Tv4IgJ+ST
	P/IpbJQx2qD1W91hmCV5xZTiJHgTcivs221/oKr3+UOe1fru6hrFBC6EMaEhwXkaCrHsjJbTxx1
	zvuO1DONC5TILgMbbZxiu6Po2yOjUp/41O1gS0i/ZfYUxOoND9bI/OGu3Id1R0Etpu1Alivejpu
	laBZA=
X-Google-Smtp-Source: ACcGV63nrx/TODgHaZh0u4FL5IL3oosHsYFESVx/zlhZBTWJKwr8gE+2IsdIJ1/dYb3GNb9t8Pyf0Gk=
MIME-Version: 1.0
X-Received: by 2002:a62:908e:: with SMTP id
	q14-v6mr1488786pfk.62.1539283614873; 
	Thu, 11 Oct 2018 11:46:54 -0700 (PDT)
Date: Thu, 11 Oct 2018 11:46:51 -0700
Message-Id: <20181011184651.252438-1-wak@google.com>
X-Mailer: git-send-email 2.18.0
From: "William A. Kennington III" <wak@google.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] dbus-broker: update to 16
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Oct 2018 18:46:54 -0000
Content-Type: text/plain; charset="UTF-8"

Dropped the patches for version 13 as they are now included in the
upstream dbus-broker codebase.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 ...de-sys-wait.h-for-WEXITED-definition.patch | 37 -------------------
 ...env-instead-of-secure_getenv-on-musl.patch | 29 ---------------
 meta-oe/recipes-core/dbus/dbus-broker_git.bb  |  9 ++---
 3 files changed, 3 insertions(+), 72 deletions(-)
 delete mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0001-Include-sys-wait.h-for-WEXITED-definition.patch
 delete mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0002-Use-getenv-instead-of-secure_getenv-on-musl.patch

diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0001-Include-sys-wait.h-for-WEXITED-definition.patch b/meta-oe/recipes-core/dbus/dbus-broker/0001-Include-sys-wait.h-for-WEXITED-definition.patch
deleted file mode 100644
index 8b8be074f..000000000
--- a/meta-oe/recipes-core/dbus/dbus-broker/0001-Include-sys-wait.h-for-WEXITED-definition.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 99657fcbba288a843dc9e411bdfd3934b2074db5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 28 Jun 2018 07:11:58 -0700
-Subject: [PATCH] Include sys/wait.h for WEXITED definition
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- src/launch/main.c       | 1 +
- test/dbus/util-broker.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/src/launch/main.c b/src/launch/main.c
-index f335d6b..6475ae6 100644
---- a/src/launch/main.c
-+++ b/src/launch/main.c
-@@ -16,6 +16,7 @@
- #include <sys/socket.h>
- #include <sys/types.h>
- #include <sys/un.h>
-+#include <sys/wait.h>
- #include <systemd/sd-bus.h>
- #include <systemd/sd-daemon.h>
- #include <systemd/sd-event.h>
-diff --git a/test/dbus/util-broker.c b/test/dbus/util-broker.c
-index d9367ae..3bd021b 100644
---- a/test/dbus/util-broker.c
-+++ b/test/dbus/util-broker.c
-@@ -11,6 +11,7 @@
- #include <sys/socket.h>
- #include <sys/types.h>
- #include <sys/un.h>
-+#include <sys/wait.h>
- #include <systemd/sd-bus.h>
- #include <systemd/sd-event.h>
- #include "dbus/protocol.h"
diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0002-Use-getenv-instead-of-secure_getenv-on-musl.patch b/meta-oe/recipes-core/dbus/dbus-broker/0002-Use-getenv-instead-of-secure_getenv-on-musl.patch
deleted file mode 100644
index bebd2145f..000000000
--- a/meta-oe/recipes-core/dbus/dbus-broker/0002-Use-getenv-instead-of-secure_getenv-on-musl.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 95a5541f8b75f7896ee6e5e71edd61838cab3c8b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 28 Jun 2018 07:16:34 -0700
-Subject: [PATCH] Use getenv instead of secure_getenv on musl
-
-musl doesnt implement secure version
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- src/launch/main.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/launch/main.c b/src/launch/main.c
-index 6475ae6..6468d84 100644
---- a/src/launch/main.c
-+++ b/src/launch/main.c
-@@ -30,6 +30,10 @@
- #include "util/log.h"
- #include "util/misc.h"
- 
-+#ifndef __GLIBC__
-+#define secure_getenv getenv
-+#endif
-+
- typedef struct Manager Manager;
- typedef struct Service Service;
- 
diff --git a/meta-oe/recipes-core/dbus/dbus-broker_git.bb b/meta-oe/recipes-core/dbus/dbus-broker_git.bb
index 4a025cfeb..ac2c50063 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_git.bb
@@ -8,13 +8,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 
 DEPENDS = "dbus glib-2.0 expat"
 
-PV = "13+git${SRCPV}"
-SRCREV = "1165025e26c3b46160402841dadf08d3d42f5cbb"
+PV = "16+git${SRCPV}"
+SRCREV = "fc874afa0992d0c75ec25acb43d344679f0ee7d2"
 
-SRC_URI = "git://github.com/bus1/dbus-broker;protocol=git \
-           file://0001-Include-sys-wait.h-for-WEXITED-definition.patch \
-           file://0002-Use-getenv-instead-of-secure_getenv-on-musl.patch \
-           "
+SRC_URI = "git://github.com/bus1/dbus-broker;protocol=git"
 
 S = "${WORKDIR}/git"
 
-- 
2.18.0


