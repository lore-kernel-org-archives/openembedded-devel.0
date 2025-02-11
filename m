Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 845B7C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 13:32:00 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.12188.1739280718580413981
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 05:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d0MnbmrE;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dd14c99d3so2992688f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 05:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739280717; x=1739885517; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n0xvicXQ55SjAyBt5h05QMCipyCW0LmFgs53oYsmE10=;
        b=d0MnbmrE0ZGyPi+vEgyzvOJhKflzKuFAp11GT6SxgaOa/FaniJZc0uCm1iGB9LnhWB
         frN9N60oOL5qKGQBxhJRRVrNvQPHwdgqw0kQSYt0kzYTkIXtNrX0tso5KTQZxOBGg1rC
         qXfPc2BoWLj4ac9efhlD3/Fayq9wykDCvp7TTwDGHQvCPI+VGwt6QylBmN4ZB3sBq0Ds
         hY9v09p9W7yXcKikXyvEYOQ6LUQ9fKDXWaN1E3NqSPsODWH36Dr3MNgis1crd7lJczcj
         W/r3xiSAB/STrwsAJl0s96/3ZCmtuZYWV6gQTQD5ueWhHox/rZWREWBW41UnUWZKRWc7
         DaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280717; x=1739885517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n0xvicXQ55SjAyBt5h05QMCipyCW0LmFgs53oYsmE10=;
        b=WRcKYrWcSdfJVO8HNLWGuvbOg4ZiMjZmUBPRk0sA3R7RrqQSb/I0tAg+TTmc5dte8n
         duRma3q5Y5TbR+x/J3RQVqdMxUNOqDxnyUoKHQpmfdIhjcrrrhnvt457ULGrXUFU3YXH
         3bhV1qxqUr5DaRMI8QRPXi9jOeZ+fTU6Qw8LNHnr0O4lYYKm440wN1MdmnxUfDyc76ZB
         WwjHpdWMmdrkeYc2IpCvFBhHyBXDee67L+KuiFDAse74lAQ0UPqu0AMwLuPK/sthAurY
         4w68qu55gF+YSN0IeFC1yllQQNXMBBqtNHMPAq4/FFkdfcAlb0nO0BPNc/in6wxkfMS+
         HJBQ==
X-Gm-Message-State: AOJu0YybVkJ9QgtR5nKrqYr3pySCEisaBhsvvt+fN+BaBZoTfpbSg5kg
	45ESoCE9ngOMt8u5bXvvwk3ueLvFBwTOd86CSeZs4/ogR5nxpfjSpEYoPw==
X-Gm-Gg: ASbGncvfRDGRpGDE62rcWdJa8UM/2TlsvahlGkQFkMBWXUfw/GNOY2kNzzNyjMlt9pc
	AUHpNfz00mI9gktQDY8HT0tRPcp4MRDaS2ep/atQeK3Et8Th0d/osnLSbCyr8Tb7P8524xsrtil
	bC3kK8m8okWNK+4VWC4ga5nSPkEW38lh3sj97vdHT/Xow+gYBMsxO0xICXrKixWswZIVjX05CY5
	8R6KSazwhANgLe4gJ9wwOr1qhDsTNmmVAO+Y9Y28O8L9sL6UB3oUm56nnB/28rZHU+JMtQd6Gfw
	nT9mpfRCi0yv4c4UWZaB5APPZujHtcg=
X-Google-Smtp-Source: AGHT+IFQr0TLlFC3CflsJ3WOu1TR8yERrogrLDxYubYrjVhVEF5WmmgntMFTLGvMG1cq7BkHk6lyNQ==
X-Received: by 2002:a05:6000:1889:b0:38d:cab2:921a with SMTP id ffacd0b85a97d-38dcab294b5mr13956646f8f.1.1739280716865;
        Tue, 11 Feb 2025 05:31:56 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dccc1f531sm11555203f8f.87.2025.02.11.05.31.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 05:31:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH v2] mutter: fix profiler PACKAGECONFIG
Date: Tue, 11 Feb 2025 14:31:55 +0100
Message-ID: <20250211133155.4081059-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 13:32:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115428

In case "profiler" PACKAGECONFIG is enabled, the build fails with
the following error:

| ninja: error: '/usr/share/dbus-1/interfaces/org.gnome.Sysprof3.Profiler.xml', needed by 'src/meta-dbus-sysprof3-profiler.c', missing and no known rule to make it

meson.build script is looking explicitly for a required file using the
sysroot of the build system instead of ${RECIPE_SYSROOT}. To avoid this,
patch meson.build to prefix this path with ${RECIPE_SYSROOT}.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...-Dont-use-system-sysprof-dbus-folder.patch | 35 +++++++++++++++++++
 .../recipes-gnome/mutter/mutter_47.4.bb       |  2 ++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-dbus-folder.patch

diff --git a/meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-dbus-folder.patch b/meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-dbus-folder.patch
new file mode 100644
index 000000000..2f09c3299
--- /dev/null
+++ b/meta-gnome/recipes-gnome/mutter/files/0001-Dont-use-system-sysprof-dbus-folder.patch
@@ -0,0 +1,35 @@
+From 790177e2a89aa0710b570d595223bdb511241c56 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Tue, 11 Feb 2025 13:39:54 +0100
+Subject: [PATCH] Don't use system sysprof dbus folder
+
+In case Mutter is built with profiler support, it requires
+org.gnome.Sysprof3.Profiler.xml file to be available - however
+the meson build file is trying to access it on the build machine's
+system ($datadir/dbus-1/interfaces) instead of searching for it
+in the $RECIPE_SYSROOT.
+
+To ensure that it looks for this file in the correct folder, prefix
+the search path with the value of the sys_root property, which is set 
+in the meson.cross file (by meson.bbclass).
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+
+Upstream-Status: Inappropriate [oe-specific: only related to cross-compiling]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 551cb23..5199be6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -446,7 +446,7 @@ if have_profiler
+ 
+   if libsysprof_capture_dep.type_name() == 'pkgconfig'
+     sysprof_dep = dependency('sysprof-6', 'sysprof-4')
+-    sysprof_dbus_interfaces_dir = sysprof_dep.get_variable('datadir') / 'dbus-1' / 'interfaces'
++    sysprof_dbus_interfaces_dir = meson.get_external_property('sys_root') + sysprof_dep.get_variable('datadir') / 'dbus-1' / 'interfaces'
+   else
+     sysprof_dbus_interfaces_dir = mutter_srcdir / 'subprojects' / 'sysprof' / 'src'
+   endif
diff --git a/meta-gnome/recipes-gnome/mutter/mutter_47.4.bb b/meta-gnome/recipes-gnome/mutter/mutter_47.4.bb
index 30301dac2..fe30aa60c 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_47.4.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_47.4.bb
@@ -24,6 +24,8 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gettext features_check
 
+SRC_URI += "file://0001-Dont-use-system-sysprof-dbus-folder.patch"
+
 SRC_URI[archive.sha256sum] = "f531fc00e6ec6dbb570b3bf942b6490f7a93df91c4c267a918b4d2afe9211bda"
 
 # x11 is still manadatory - see meson.build

