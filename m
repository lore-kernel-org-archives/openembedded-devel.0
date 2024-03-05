Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB75AC54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 09:59:03 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.18745.1709632734446855047
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Mar 2024 01:58:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=Y4AnPk7S;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33d8739ddd4so3077295f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 01:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709632732; x=1710237532; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvXeUsLRC9kF7+6G711hEThISUzgnPv7ItR0O/fkDio=;
        b=Y4AnPk7SHu1b1kUKsF9Dj0Kb1W6JfHR46nbpH3BHoOMqx2De2wbkJPPByXZeTXoslz
         EHcGa+/y8DLFkxXtT+bQdVuUJ0DKI416lZPORf0C4/vAhEIBP1M8IaohY940O1Ndkepa
         xiwGo2W8uZzaJ0z9M9IsVGk2hLMVy4VURxuJ9kjF7hILtB12O7qx6C3tpHcosiB/MBz1
         jmE8GOVgYrc5M7TjbNWmRj0xaYFepfwHMdxS7KcZ2k4XOKQ7shpvBRQ/w1AZ1+7iNPTN
         6JEttcJOZj0G6R/VAJqg32E+kEMEqvqULv2Zr2phogM98C8bJV1G5Uc54g6XOD0T5AlA
         n/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709632732; x=1710237532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvXeUsLRC9kF7+6G711hEThISUzgnPv7ItR0O/fkDio=;
        b=iUMhp/pJuV6OZeVXD/yoo0oXEHhMm3p7Aao4jyDHxqmxtRIY9qOuSv0z9BAa42hDLa
         ll0kq7Oa4780IgiMNWzjPVhPzQFFqd3WvoV+/pogoqichhbe/tQ+qrxmy9yaHiYCUWBW
         ZkLzEvPQpvObye8EsD/yK9jJ8Dc0PpCU/q7qWlYUCDTD6FG7ryVHDLz5t70q5Ng3rgXn
         Qa4JtPLaKbNrTaYvqPPC6m7n15icOIBgAgQEKI5G8IUSpsPqCv7KqTzlFbKrvNAqiBP5
         ewuE+WKqbkGzhgQUFHU1Ww+jYj+9k0MfJENIIMwfzCfHwivdyYVi4wrcFek3tMKKjr2i
         uJxw==
X-Gm-Message-State: AOJu0YwVcjhwqITfq8mEWfiP5bGm6jI107LIRtfLKoepJv00IsXQHi3x
	qdiOkxhJnslWKX4RH6h5jawpgyo8R4T2gmn5duKLJl4SdbJUNWRkRHkQBXYwFJqmZJPqAEeyEzm
	oZjw=
X-Google-Smtp-Source: AGHT+IEFHJLRW+JnCCgeA2bwoF4J/hr7QPu2eG4SWTnOqGPF66xtt0qlmG677TzWBWKQMIdVdlspkw==
X-Received: by 2002:adf:9d8f:0:b0:33d:1d45:60a3 with SMTP id p15-20020adf9d8f000000b0033d1d4560a3mr9654709wre.44.1709632732285;
        Tue, 05 Mar 2024 01:58:52 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id x3-20020a5d6503000000b0033e206a0a7asm11309792wru.26.2024.03.05.01.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Mar 2024 01:58:52 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-networking][PATCH v2 2/2] drbd-utils: Fix a udev rule reproducibility
Date: Tue,  5 Mar 2024 10:57:52 +0100
Message-Id: <20240305095750.1667336-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240305095750.1667336-1-yoann.congal@smile.fr>
References: <20240305095750.1667336-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Mar 2024 09:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109115

drbd-utils configure step check the build host udev version to enable
or disable the target udev rule. This leads to a clear
non-reproducibility.

This patch fixes this by adding a configure option to the configure step
which allows to skip the udev version checks and unconditionally enable
the udev rule.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2:
* Rebased on master (which updated to 9.27.0)
* Update patch upstream status as it was merged in the meantime
---
 ...-an-option-to-disable-host-udev-vers.patch | 55 +++++++++++++++++++
 .../recipes-support/drbd/drbd-utils_9.27.0.bb |  2 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch

diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch
new file mode 100644
index 000000000..b98e1e70c
--- /dev/null
+++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch
@@ -0,0 +1,55 @@
+From 61991db099f66348dddbc3408e7ee8c05bda85cb Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Sat, 2 Mar 2024 16:23:07 +0100
+Subject: [PATCH] configure.ac: Add an option to disable host udev version
+ checks
+
+In cross-compilation environment, the build host might have an outdated
+udev or no udev at all. But the user may still want to build with the
+enabled udev rule (for its udev-enabled target).
+
+This patch adds a "--disable-udevchecks" option the disable build host
+udev version check at configure-time and unconditionally install the
+enabled udev rule. Without this new option, the behavior stays the same
+(checks enabled).
+
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+Upstream-Status: Backport [https://github.com/LINBIT/drbd-utils/commit/f2b5a7335ae52109dfb95a9d99ae20519c43d59a]
+---
+ configure.ac | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f1d69ea3..4c56d33b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -71,6 +71,11 @@ AC_ARG_WITH([udev],
+ 	[AS_HELP_STRING([--with-udev],
+ 			[Enable udev integration])],
+ 	[WITH_UDEV=$withval])
++AC_ARG_ENABLE([udevchecks],
++	[AS_HELP_STRING([--disable-udevchecks],
++			[Disable host udev version checks])],
++	[],
++	[enable_udevchecks=yes])
+ AC_ARG_WITH([xen],
+ 	[AS_HELP_STRING([--with-xen],
+ 			[Enable Xen integration])],
+@@ -315,7 +320,7 @@ if test -z $GIT; then
+    AC_MSG_WARN(Cannot update buildtag without git. You may safely ignore this warning when building from a tarball.)
+ fi
+ 
+-if test $UDEVADM = false && test $UDEVINFO = false; then
++if test "x$enable_udevchecks" != "xno" && test $UDEVADM = false && test $UDEVINFO = false; then
+    if test "$WITH_UDEV" = "yes"; then
+      AC_MSG_WARN([udev support enabled, but neither udevadm nor udevinfo found on this system.])
+    fi
+@@ -423,7 +428,7 @@ else
+     test -z $INITDIR && INITDIR="$sysconfdir/init.d"
+ 
+     dnl Our udev rules file is known to work only with udev >= 85
+-    if test "$WITH_UDEV" = "yes"; then
++    if test "x$enable_udevchecks" != "xno" && test "$WITH_UDEV" = "yes"; then
+        udev_version=$( set -- $($UDEVADM version); echo $1 )
+        if test -z "$udev_version"; then
+ 	    udev_version=$( set -- $($UDEVINFO -V); echo $3 )
diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb
index c99717839..63f0fd18c 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.27.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils;branch=master;prot
            git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers;branch=master;protocol=https \
            file://0001-drbdmon-add-LDFLAGS-when-linking.patch \
            ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
+           file://0001-configure.ac-Add-an-option-to-disable-host-udev-vers.patch \
            "
 SRCREV_drbd-utils = "fdd9a4d603a9dc99d110d8bd0e288d7c0b6f586e"
 SRCREV_drbd-headers = "0349f00825b4198d4ec3248f43884114a187676a"
@@ -40,6 +41,7 @@ EXTRA_OECONF = " \
                 --with-initscripttype=both    \
                 --with-systemdunitdir=${systemd_unitdir}/system \
                 --without-manual \
+                --disable-udevchecks \
                "
 
 # If we have inherited reproducible_build, we want to use it.
-- 
2.39.2


