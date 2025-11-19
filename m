Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B7ACF34D9
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 15:26:19 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9719.1763565978174899476
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 07:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=d+Zf1Ffy;
 spf=pass (domain: konsulko.com, ip: 209.85.208.51, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-640b06fa959so12067229a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 07:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1763565975; x=1764170775; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAU/YXrMyowXj3wSLWAG5UcLKVUZKtQAdFGHkwTUP4I=;
        b=d+Zf1FfycLK54UOZfxRoMh5YMKiJggeiq5KOg/h/b3ay56as/G6SCFQt1eOmvZFT3D
         dPPzK/Nx3hZTIA+1aweU1npoyR2abryshP3o8S3LQ+sVRvHrK33nCWOewUoAmlIUp3DU
         N39CMkfG2UMd04znQXYFO/slfe8y3qJ5RA7m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763565975; x=1764170775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rAU/YXrMyowXj3wSLWAG5UcLKVUZKtQAdFGHkwTUP4I=;
        b=G3R7CiNfNX6FPzsow4HEzxBvCtHy8x3z36nsY7OaOa0fhvutU57kocDrWCbBwsvcd5
         /AqWG0bCKQSXB9vxtkdgPkXhC0wElgOZhoacq20T+5Pun+wHqBVOFMDca6QjC0BWzdri
         Bo2AjjSkS31eL1MUCGv25cZo3PsKqHOl/Q/JuCPTcYMFyOPY3Ke2RyIqzRBqtkUm8lGb
         H9UJpCjxrEJh77zRIoNj9BQuUhKZbfItzRPwCuAcxE91TS1UDbwFomdsN1/aW2+EZe4S
         If7iFrzScMXf93jPS+BgWK9xhJg1Bm6K/fj9uZcUamEIL5PAr3ilLgtLEe6Kn4TmrT1d
         hLdg==
X-Gm-Message-State: AOJu0YwijF8xzyGoNOTzGX63oB6GDVPNVQ0tCvJcriyjWTYfuQiGBVLP
	wZFkqqReUehosZXZmlWt9aC3QPyq8/orxFyxfBjQQFCAd6pqCTvU3UD4KClJCl+4KWLp542K4vr
	g9NnI
X-Gm-Gg: ASbGncv+ocweiPVwVXp+0PJQ0MFeLMTJkinzs07pjUbml5cMjq5o4kiuekBk2FmA2gt
	wEtPFQywKx48sVi4n0KyISvxAc+WYSudBxamFqQzb/T1IusY3g+vdBF8y+7HuphrDVkqqBT1NwO
	kdfbT41+HQqSoWvMqNMZuV3wlA7QK/ex6Q4C0Fo2ElPcYLtTZmxVHuhwQboUxjGZ2MdJut5BIfZ
	xcAn6cKjjN+gULq9c6NejrZJ/hqk2AGmBdmNm+bGKFn1IuAZH4djFEq35X+A+qI8FKz6jHGJvCi
	hNQMjlbvAFyoIGDxD8hQ71413vz/9DN5khqI0i4SAI/RNEPvN1ZIoO+9VcSXIUVK01fGJzGjYdZ
	t7p+6qBMB6fUKYU5N5sIoBVkfu/mhEGGEMQbWuVxinZB+edVmsIC2RFzMrWTR/bitvAgUJmOX1d
	IuM1F4UybTFPL7UX61hCc+akkl
X-Google-Smtp-Source: AGHT+IGerJ99qxWEMkWKWkRVKbY8tQJJO2WL/0dklbJ44BVCjwlw0Nwa7JG378B8/QAYBOhf7Xe6ew==
X-Received: by 2002:a05:6402:13cf:b0:641:831a:27c2 with SMTP id 4fb4d7f45d1cf-6451e3c9a40mr2721855a12.33.1763565974825;
        Wed, 19 Nov 2025 07:26:14 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3f94f8sm15510492a12.13.2025.11.19.07.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:26:14 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH] libblockdev: Upgrade 3.2.1 -> 3.4.0
Date: Wed, 19 Nov 2025 17:26:07 +0200
Message-ID: <20251119152607.2261971-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 15:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121907

Upgrade to release 3.4.0:

- bd_nvme_connect() now defaults to port 4420 or 8009 for discovery
  NQN respectively when
- configure.ac: fix bashism
- smart: Use drive self-assessment as an overall status
- nvme: Default to well-known tr_svcid values when not specified
- nvme: Handle memory allocation failures from _nvme_alloc()
- crypto: Add a function to set persistent flags for LUKS
- tests: Various minor mptovements

Drop CVE-2025-6019.patch because the change has been merged in
the upstream and it is included in version 3.4.0.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../libblockdev/files/CVE-2025-6019.patch     | 31 -------------------
 ...blockdev_3.2.1.bb => libblockdev_3.4.0.bb} |  5 ++-
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch
 rename meta-oe/recipes-extended/libblockdev/{libblockdev_3.2.1.bb => libblockdev_3.4.0.bb} (95%)

diff --git a/meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch b/meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch
deleted file mode 100644
index 2575578e77..0000000000
--- a/meta-oe/recipes-extended/libblockdev/files/CVE-2025-6019.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b2e9c16c726f62e500241617f8f3a03aa658fbe3 Mon Sep 17 00:00:00 2001
-From: Thomas Blume <Thomas.Blume@suse.com>
-Date: Fri, 16 May 2025 14:27:10 +0200
-Subject: [PATCH] Don't allow suid and dev set on fs resize
-
-Fixes: CVE-2025-6019
-
-CVE: CVE-2025-6019
-Upstream-Status: Backport [ https://github.com/storaged-project/libblockdev/commit/46b54414f66e965e3c37f8f51e621f96258ae22e ]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/plugins/fs/generic.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/plugins/fs/generic.c b/src/plugins/fs/generic.c
-index 2b2180aa..60f7d75e 100644
---- a/src/plugins/fs/generic.c
-+++ b/src/plugins/fs/generic.c
-@@ -661,7 +661,7 @@ static gchar* fs_mount (const gchar *device, gchar *fstype, gboolean read_only,
-                              "Failed to create temporary directory for mounting '%s'.", device);
-                 return NULL;
-             }
--            ret = bd_fs_mount (device, mountpoint, fstype, read_only ? "ro" : NULL, NULL, &l_error);
-+            ret = bd_fs_mount (device, mountpoint, fstype, read_only ? "nosuid,nodev,ro" : "nosuid,nodev", NULL, &l_error);
-             if (!ret) {
-                 g_propagate_prefixed_error (error, l_error, "Failed to mount '%s': ", device);
-                 g_rmdir (mountpoint);
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb b/meta-oe/recipes-extended/libblockdev/libblockdev_3.4.0.bb
similarity index 95%
rename from meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
rename to meta-oe/recipes-extended/libblockdev/libblockdev_3.4.0.bb
index e4078d6862..2263e0bbdd 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_3.2.1.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_3.4.0.bb
@@ -12,11 +12,10 @@ inherit autotools gobject-introspection pkgconfig lib_package
 
 DEPENDS = "autoconf-archive-native glib-2.0 kmod udev libnvme"
 
-SRC_URI = "git://github.com/storaged-project/libblockdev;branch=3.2.x-branch;protocol=https \
+SRC_URI = "git://github.com/storaged-project/libblockdev;branch=master;protocol=https \
            file://0001-fix-pythondir-for-multilib-when-cross-compiling.patch \
-           file://CVE-2025-6019.patch \
            "
-SRCREV = "b829b60d9ff049abb190f09a3b9a5fac648cd5a3"
+SRCREV = "c1053b3643f0b4f3d4549ac8f3ae85fdecbb2c72"
 
 FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}"
 
-- 
2.47.3


