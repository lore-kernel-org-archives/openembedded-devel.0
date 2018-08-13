Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3567260745
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:18:09 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id f14-v6so7184818pgv.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 01:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=x97DjTV33C5+VTXm1g38aZrIULX3O/+v22ng8N6JFa8=;
	b=oTDy5UK3ni3f9aZDsso2gHdtrNerKf0YNLtcPYSOkblsXKslNeDaZFkxlUb62tbdxF
	bmpicQA49VRzXnrSDQ7H3xCx/7YSdiIUnLxuYlCxhsCc6cG51xZgm8HiK5oaYQVyXRoF
	/lmMG80Th5qfHhDNbEQIHGdXyZe6q0rooapcscuy4Qzil84MUzXmywtVZJqAnm/N8Ptf
	kkIs+C0XyT8C9OkBQAubdGdQP4uSfGuXXLSEuuSennzMna1z2jRke69KGxE8r44iajDn
	Ny2hQwSCeJDZjK8/qu0Hqjky3p5s55dBD9r9rF+v3X1tVyo53JB9ql+EV52xopcmNY4U
	8a1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=x97DjTV33C5+VTXm1g38aZrIULX3O/+v22ng8N6JFa8=;
	b=feekaDfQzkf6D8Y75nTFib8CxGswxuNmgu9VLWM98a/TGjwnyGfRUQ0cbX5zNlyfNN
	/4tgJNh6tRRJAeNTT4KyngW1jLMVlS7CdCzHqWqOIqfncpHDWhryDpr9OqP2il8Vxz1o
	w7xRFBtCGQ4iHefeQZPw1BFwQbE1qq2g9HXB07fuxxipRLu/58QKoorgYR+9YM+OJBQi
	pXAlQIvaC3pF9mVZ3c/SU1SrJmqbwDuZOQkFVVOZzDt1VdSjl6zW/yJE8UXS1a+QWdQX
	OuWC9MOcWQpuJi2iEaVnKiYlkpXcw+jKk0v/9CLETY0Zc0XRkqmtkR8Oopbw3WrVx/7l
	u+DQ==
X-Gm-Message-State: AOUpUlFfUpsDdGAQVvuvCND7W59JTnaU7LFDi9+bt4WrnEZOphrzvMmD
	IFtHuifTkNmMP8pSv5GZt/ZbcNQD
X-Google-Smtp-Source: AA+uWPy77PqRlIQcTejprDZX9CrPNUPVJmCYDBsnWzsfAbbG8JBzB2RrhDRZf3x+gInKhM/XXMZUNQ==
X-Received: by 2002:a62:bd4:: with SMTP id 81-v6mr17956811pfl.67.1534148289857;
	Mon, 13 Aug 2018 01:18:09 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	b64-v6sm23414971pfg.66.2018.08.13.01.18.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 01:18:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 01:17:36 -0700
Message-Id: <20180813081742.6961-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813081742.6961-1-raj.khem@gmail.com>
References: <20180813081742.6961-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 15/21] udisks: Fix build with glibc 2.28+
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
X-List-Received-Date: Mon, 13 Aug 2018 08:18:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../udisks/0001-include-sys-sysmacros.h.patch | 77 +++++++++++++++++++
 .../recipes-support/udisks/udisks_1.0.5.bb    | 14 ++--
 2 files changed, 84 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-support/udisks/udisks/0001-include-sys-sysmacros.h.patch

diff --git a/meta-oe/recipes-support/udisks/udisks/0001-include-sys-sysmacros.h.patch b/meta-oe/recipes-support/udisks/udisks/0001-include-sys-sysmacros.h.patch
new file mode 100644
index 0000000000..f140793c5e
--- /dev/null
+++ b/meta-oe/recipes-support/udisks/udisks/0001-include-sys-sysmacros.h.patch
@@ -0,0 +1,77 @@
+From 64f051963d6cdeebd19f9e7f0a7e584a1f7acc60 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 11 Aug 2018 19:12:57 -0700
+Subject: [PATCH] include sys/sysmacros.h
+
+fixes build with glibc 2.28+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/daemon.c          | 1 +
+ src/device.c          | 1 +
+ src/mount-monitor.c   | 1 +
+ tools/udisks.c        | 1 +
+ tools/umount-udisks.c | 1 +
+ 5 files changed, 5 insertions(+)
+
+diff --git a/src/daemon.c b/src/daemon.c
+index 14e952f..2c61cfb 100644
+--- a/src/daemon.c
++++ b/src/daemon.c
+@@ -39,6 +39,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <sys/stat.h>
+ #include <sys/time.h>
+ #include <sys/resource.h>
+diff --git a/src/device.c b/src/device.c
+index d73f9d6..5911d78 100644
+--- a/src/device.c
++++ b/src/device.c
+@@ -29,6 +29,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <sys/wait.h>
+ #include <sys/stat.h>
+ #include <sys/time.h>
+diff --git a/src/mount-monitor.c b/src/mount-monitor.c
+index 573a69c..ccf3365 100644
+--- a/src/mount-monitor.c
++++ b/src/mount-monitor.c
+@@ -28,6 +28,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <sys/stat.h>
+ #include <mntent.h>
+ 
+diff --git a/tools/udisks.c b/tools/udisks.c
+index d30159b..f24a30a 100644
+--- a/tools/udisks.c
++++ b/tools/udisks.c
+@@ -29,6 +29,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <sys/stat.h>
+ #include <sys/wait.h>
+ #include <fcntl.h>
+diff --git a/tools/umount-udisks.c b/tools/umount-udisks.c
+index 2813fe0..5cf6b4d 100644
+--- a/tools/umount-udisks.c
++++ b/tools/umount-udisks.c
+@@ -29,6 +29,7 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <pwd.h>
diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
index e33266001e..7cd9992214 100644
--- a/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
+++ b/meta-oe/recipes-support/udisks/udisks_1.0.5.bb
@@ -11,13 +11,13 @@ DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
     dbus-glib-native \
 "
 
-SRC_URI = " \
-    http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
-    file://optional-depends.patch \
-    file://0001-fix-build-with-newer-glibc-versions.patch \
-    file://udisks-1.0.5-fix-service-file.patch \
-    file://0001-Make-udev-rules-directory-configurable.patch \
-"
+SRC_URI = "http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=${BPN} \
+           file://optional-depends.patch \
+           file://0001-fix-build-with-newer-glibc-versions.patch \
+           file://udisks-1.0.5-fix-service-file.patch \
+           file://0001-Make-udev-rules-directory-configurable.patch \
+           file://0001-include-sys-sysmacros.h.patch \
+           "
 
 SRC_URI[udisks.md5sum] = "70d48dcfe523a74cd7c7fbbc2847fcdd"
 SRC_URI[udisks.sha256sum] = "f2ec82eb0ea7e01dc299b5b29b3c18cdf861236ec43dcff66b3552b4b31c6f71"
-- 
2.18.0


