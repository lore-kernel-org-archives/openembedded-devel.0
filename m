Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3A48F7533A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 22:56:24 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id m16-v6so5111660pls.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 15:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZewGTigKkG5v8lqotF20ztr0bRm7CoUBNWF/s/QVKOY=;
	b=AoQSUMs0+/ULE4Kae7kM+FBwr6Mo3/e6jLYSb3RpUm0Kc44tXFHxzpAfvkyGHKLD0h
	tZwdS6XzBNU/35AXLrs4nrff+OYvmnW1UwLpn8WGj9J9YX1nVC3PcN3ixkZYMAWxsKSI
	t3HlVvdbYGGJK86hQCmQTB6FbkrUDo0kZVMmD7PliyZFkCfYzhEHdhSXlaEAoFK70G9z
	Lpufimm3R50uHpKtXSrYgGUSXHHinLK2MllbOPa313Wkiso3zSa3lpvua8/Zmfh3M/sY
	NI78Gz9b12aE6qC83t2wh2ZK4HzF4Ov6qUlsiq560sD81DfAAhAATyQcAnu9a7TCosg9
	OLag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZewGTigKkG5v8lqotF20ztr0bRm7CoUBNWF/s/QVKOY=;
	b=lVdHEJFlMbYahsR4YirX7xF0qejv84xLzgBrhBnK/8CMTk872azZAhf3WIV5Dq7dH8
	2sYJ7aYbPdTIHVpKFl3BOLq00UZ9TucHePs8G1rRCTbxd79TfU5NmBdljsQdb7mi9J5W
	pSHu4a68e5fx2QI/eDbmqlo/vGscPNQ9ucYXCNfTbCumMwd1mbUYoz0cqbFWK5xEiJLL
	XC1ne7g0muY1oTwbSpVNJfc5UakDwpb1HccalgffcV0GZlnx+S6HaPAWHrJCyQ7MuiLQ
	U1K40dBE1dtvoLWbLf9yR1+UGsYEINAjGl8PmfoqRnWsjt9CK1DXgbQyCq+ggRlneMJc
	MKig==
X-Gm-Message-State: APt69E0HuA/vK6e4q0X5No5F9ApPuJogkV+TWwBuTQ8JZFHe1dp9yvIF
	WNaoxMg7fvOl13SyTAE/qPUaTQ==
X-Google-Smtp-Source: ADUXVKKIwshEXwlHhgxcxee0RKvR2V7HncLpIoJgO3uiFqZ/MMVRDC2lXc4X7shNPoSlGgmlGVEM8Q==
X-Received: by 2002:a17:902:201:: with SMTP id
	1-v6mr17010740plc.310.1530312984533; 
	Fri, 29 Jun 2018 15:56:24 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	b69-v6sm3009171pfd.33.2018.06.29.15.56.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Jun 2018 15:56:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 15:56:25 -0700
Message-Id: <20180629225626.33238-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-oe][PATCH 1/2] dbus-broker: Upgrade to latest and fix build on musl
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
X-List-Received-Date: Fri, 29 Jun 2018 22:56:24 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Comment-rst2man-related-stuff.patch  | 34 -----------------
 ...de-sys-wait.h-for-WEXITED-definition.patch | 37 +++++++++++++++++++
 ...Correct-including-directory-for-conf.patch | 25 -------------
 ...env-instead-of-secure_getenv-on-musl.patch | 29 +++++++++++++++
 meta-oe/recipes-core/dbus/dbus-broker_git.bb  | 13 ++++---
 5 files changed, 74 insertions(+), 64 deletions(-)
 delete mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0001-Comment-rst2man-related-stuff.patch
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0001-Include-sys-wait.h-for-WEXITED-definition.patch
 delete mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0002-Correct-including-directory-for-conf.patch
 create mode 100644 meta-oe/recipes-core/dbus/dbus-broker/0002-Use-getenv-instead-of-secure_getenv-on-musl.patch

diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0001-Comment-rst2man-related-stuff.patch b/meta-oe/recipes-core/dbus/dbus-broker/0001-Comment-rst2man-related-stuff.patch
deleted file mode 100644
index f10c49e7c3..0000000000
--- a/meta-oe/recipes-core/dbus/dbus-broker/0001-Comment-rst2man-related-stuff.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From a92fd7da3a262e21c0970a3908eb0b4502819a01 Mon Sep 17 00:00:00 2001
-From: Yang Lyu <yangl@axis.com>
-Date: Fri, 23 Feb 2018 16:31:49 +0100
-Subject: [PATCH] Comment rst2man related stuff
-
----
- meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 56d38e4..3c3b109 100644
---- a/meson.build
-+++ b/meson.build
-@@ -15,7 +15,7 @@ add_project_arguments('-DBINDIR="' + join_paths(get_option('prefix'), get_option
- cc = meson.get_compiler('c')
- conf = configuration_data()
- mod_pkgconfig = import('pkgconfig')
--prog_rst2man = find_program('rst2man', 'rst2man.py')
-+#prog_rst2man = find_program('rst2man', 'rst2man.py')
- 
- sub_cdvar = subproject('c-dvar', version: '>=1')
- sub_clist = subproject('c-list', version: '>=3')
-@@ -56,7 +56,7 @@ endif
- 
- conf.set('bindir', join_paths(get_option('prefix'), get_option('bindir')))
- 
--subdir('docs')
-+#subdir('docs')
- subdir('src')
- 
- if use_launcher
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0001-Include-sys-wait.h-for-WEXITED-definition.patch b/meta-oe/recipes-core/dbus/dbus-broker/0001-Include-sys-wait.h-for-WEXITED-definition.patch
new file mode 100644
index 0000000000..8b8be074fe
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/dbus-broker/0001-Include-sys-wait.h-for-WEXITED-definition.patch
@@ -0,0 +1,37 @@
+From 99657fcbba288a843dc9e411bdfd3934b2074db5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 28 Jun 2018 07:11:58 -0700
+Subject: [PATCH] Include sys/wait.h for WEXITED definition
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ src/launch/main.c       | 1 +
+ test/dbus/util-broker.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/launch/main.c b/src/launch/main.c
+index f335d6b..6475ae6 100644
+--- a/src/launch/main.c
++++ b/src/launch/main.c
+@@ -16,6 +16,7 @@
+ #include <sys/socket.h>
+ #include <sys/types.h>
+ #include <sys/un.h>
++#include <sys/wait.h>
+ #include <systemd/sd-bus.h>
+ #include <systemd/sd-daemon.h>
+ #include <systemd/sd-event.h>
+diff --git a/test/dbus/util-broker.c b/test/dbus/util-broker.c
+index d9367ae..3bd021b 100644
+--- a/test/dbus/util-broker.c
++++ b/test/dbus/util-broker.c
+@@ -11,6 +11,7 @@
+ #include <sys/socket.h>
+ #include <sys/types.h>
+ #include <sys/un.h>
++#include <sys/wait.h>
+ #include <systemd/sd-bus.h>
+ #include <systemd/sd-event.h>
+ #include "dbus/protocol.h"
diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0002-Correct-including-directory-for-conf.patch b/meta-oe/recipes-core/dbus/dbus-broker/0002-Correct-including-directory-for-conf.patch
deleted file mode 100644
index 4909dea125..0000000000
--- a/meta-oe/recipes-core/dbus/dbus-broker/0002-Correct-including-directory-for-conf.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 4b79f603b948709906c108796087de7b5643f61a Mon Sep 17 00:00:00 2001
-From: Yang Lyu <yangl@axis.com>
-Date: Mon, 26 Feb 2018 12:48:34 +0100
-Subject: [PATCH] Correct including directory for conf
-
----
- src/launch/config.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/launch/config.c b/src/launch/config.c
-index 6a68699..579471b 100644
---- a/src/launch/config.c
-+++ b/src/launch/config.c
-@@ -1022,7 +1022,7 @@ static void config_parser_end_fn(void *userdata, const XML_Char *name) {
-                                     state->file,
-                                     state->current->include.selinux_root_relative ?
-                                         bus_selinux_policy_root() :
--                                        state->file->path,
-+                                        NULL,
-                                     state->current->cdata);
-                 if (r) {
-                         state->error = error_trace(r);
--- 
-2.1.4
-
diff --git a/meta-oe/recipes-core/dbus/dbus-broker/0002-Use-getenv-instead-of-secure_getenv-on-musl.patch b/meta-oe/recipes-core/dbus/dbus-broker/0002-Use-getenv-instead-of-secure_getenv-on-musl.patch
new file mode 100644
index 0000000000..bebd2145f2
--- /dev/null
+++ b/meta-oe/recipes-core/dbus/dbus-broker/0002-Use-getenv-instead-of-secure_getenv-on-musl.patch
@@ -0,0 +1,29 @@
+From 95a5541f8b75f7896ee6e5e71edd61838cab3c8b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 28 Jun 2018 07:16:34 -0700
+Subject: [PATCH] Use getenv instead of secure_getenv on musl
+
+musl doesnt implement secure version
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ src/launch/main.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/launch/main.c b/src/launch/main.c
+index 6475ae6..6468d84 100644
+--- a/src/launch/main.c
++++ b/src/launch/main.c
+@@ -30,6 +30,10 @@
+ #include "util/log.h"
+ #include "util/misc.h"
+ 
++#ifndef __GLIBC__
++#define secure_getenv getenv
++#endif
++
+ typedef struct Manager Manager;
+ typedef struct Service Service;
+ 
diff --git a/meta-oe/recipes-core/dbus/dbus-broker_git.bb b/meta-oe/recipes-core/dbus/dbus-broker_git.bb
index b62bccf2c9..4a025cfeb1 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_git.bb
@@ -8,17 +8,20 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7b486c2338d225a1405d979ed2c15ce8"
 
 DEPENDS = "dbus glib-2.0 expat"
 
-PV = "9+git${SRCPV}"
-SRCREV = "ccd06b284892182af569e69046262331150e3536"
+PV = "13+git${SRCPV}"
+SRCREV = "1165025e26c3b46160402841dadf08d3d42f5cbb"
 
-SRC_URI = "git://github.com/bus1/dbus-broker;protocol=git"
-SRC_URI += "file://0001-Comment-rst2man-related-stuff.patch"
-SRC_URI += "file://0002-Correct-including-directory-for-conf.patch"
+SRC_URI = "git://github.com/bus1/dbus-broker;protocol=git \
+           file://0001-Include-sys-wait.h-for-WEXITED-definition.patch \
+           file://0002-Use-getenv-instead-of-secure_getenv-on-musl.patch \
+           "
 
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig systemd distro_features_check
 
+EXTRA_OEMESON += "-Ddocs=false"
+
 REQUIRED_DISTRO_FEATURES = "systemd"
 
 SYSTEMD_SERVICE_${PN} = "${BPN}.service"
-- 
2.18.0


