Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49CDC79F9F
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:23:38 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31682.1788776608220084972
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KxPVmF7B;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso3687946a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776607; x=1789381407; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CUeUmHBX5fcxhd9G5E8Bd9Pj21b7DJSq6nybGyJloBU=;
        b=KxPVmF7BV/qX93L/sx64uBNwzUvjNI1hbrCCzVYMC7Sb+5WDa5hJCt1+NhaxCQCsbi
         zq4f4ClpjYBBJwlnTE6s9V25UrltIfgVyh0JdWYXWn2ByByI5iu2EGkx23HxWYdjew7B
         LBD+aIADHJEt2lXiM9R+ibp3hlucK88KhxG6oRjq9/VOUoFCIE0UAiXpvmK6N3MRmUMI
         1kG6WYwK0oC9CF6A9tR5/8hiCp8fHuy3zEW9miHZGzWzuHLocxnaXhHDQgEwvRudx/c/
         +lWqQjJVGrKfNVY4BtE7xV7PPGSET2KpLZ7LunMf1UvneoWdMiE000JeTBWP6F43JC0f
         izng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776607; x=1789381407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUeUmHBX5fcxhd9G5E8Bd9Pj21b7DJSq6nybGyJloBU=;
        b=o/Adxru8SxUo2zCHKTPL2p9w8dudBTa9kzB6XaT02/j48l7q7E27NvHyU+mW3UCLho
         fYVoAdu9fmi8+XgQbBP8pYIuhtSXnXikfxPaK8KylCK/sWYeVMYV17RpXWYyAv/tgwkU
         eVjYOd+l7M70alh3CQP+0r7/esPSUjICRbBjSlhIIS6yf0XFRCpj4FEOANWEsSY3XRWH
         o4kWwdlRdkyXwRGMkAqsDtF45eeFDsXfGXOLBl9UKxuXSgNGm4XMVyAi25CTw5z5Unju
         c+H0TzD8mHONtBbZaZnlafMD221EOb3LP4XtIwiWFtqq3dE/6OoW12nKDHMl2mvhJTr/
         m9Ww==
X-Gm-Message-State: AFuF++ngJh8p9DCAACwKH11ykQrWKIKWNFjkGubeCARdPjqQQllfcFxs
	0htmlve2zM/WF3swnPd2tMyqXRhbdgjND7CvZPHE6Gmo36n7qIKixJKt9Q1Bz0fX
X-Gm-Gg: AYBFou1+2ajBBgf2QEhqWZWUGaK1NwgPUJ4c/PgMsFwI3Ixoi4jQy9bwoKZN2znVu/v
	CU3B2nYgeI0a6qGlAIRatFU6d0uF3RBpnOHbqiv2UYlZ41KsJvVey7iSHrCOTAVIBoqoFXUtLtk
	Hadr2e4yJfm0W5zc27HZ81qSzjQNY8RbvnLRzZJ1RyUUG/nQD3wl/jlDB7te4CCuio+B4yWxLZx
	vZimZJ0wXmqJQm5+JnyhWDT6r8exrVH1qxC/yHoYMpXTQT2ktO05lDK+6lOq9U/1s+Aso7XgCa0
	eUyDtr+0geBLeqp9q8bYFNn2+HwS25ZKWEa5fdy6AwKZjhFeteqO7Q5pHRUHyPoprNwNDSwGyny
	jjhFLSzqA0Ic0kO+ZWa8RW548bm3kWGfPNETHVxJYF//p8tlJFruZXMw9IWIRtBlPhTufcEo0li
	wDmGpOU8li5a8Zf8NQ/WP6zXpqRXgcOr/F8j1BdJ2vDQ7WpI/zhk/JFpMx8xURfxtVqbv0BYZ6i
	g==
X-Received: by 2002:a17:90a:e7c2:b0:398:9be8:ea66 with SMTP id 98e67ed59e1d1-39b261da126mr32325601a91.19.1788776607445;
        Mon, 07 Sep 2026 03:23:27 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:23:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 1/33] libnfs: patch CVE-2026-53689
Date: Mon,  7 Sep 2026 22:22:45 +1200
Message-ID: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:23:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129813

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-53689

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libnfs/libnfs/CVE-2026-53689.patch        | 34 +++++++++++++++++++
 .../libnfs/libnfs_6.0.2.bb                    |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-53689.patch

diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-53689.patch b/meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-53689.patch
new file mode 100644
index 0000000000..0c624c7219
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs/CVE-2026-53689.patch
@@ -0,0 +1,34 @@
+From d45a7d6cdc899ac2a62abc21280d674ae91ae0ae Mon Sep 17 00:00:00 2001
+From: Ronnie Sahlberg <ronniesahlberg@gmail.com>
+Date: Wed, 10 Jun 2026 11:43:28 +1000
+Subject: [PATCH] ZDR: check the string size for sanity
+
+It could otherwise cause an overflow in the bounds check later.
+
+Reported-by: Nick Hummel <nickhummel@google.com>
+Signed-off-by: Ronnie Sahlberg <ronniesahlberg@gmail.com>
+(cherry picked from commit 55c18ea33a83d667f79f0ef209c96895795c729f)
+
+CVE: CVE-2026-53689
+Upstream-Status: Backport [https://github.com/sahlberg/libnfs/commit/55c18ea33a83d667f79f0ef209c96895795c729f]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ lib/libnfs-zdr.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/libnfs-zdr.c b/lib/libnfs-zdr.c
+index bc507eb..cbdb650 100644
+--- a/lib/libnfs-zdr.c
++++ b/lib/libnfs-zdr.c
+@@ -305,7 +305,9 @@ bool_t libnfs_zdr_string(ZDR *zdrs, char **strp, uint32_t maxsize)
+ 	if (!libnfs_zdr_u_int(zdrs, &size)) {
+ 		return FALSE;
+ 	}
+-
++	if (size > zdrs->size) {
++		return FALSE;
++	}
+ 	if (zdrs->pos + (int)size > zdrs->size) {
+ 		return FALSE;
+ 	}
diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
index 83f32d3a07..403bae9465 100644
--- a/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
+++ b/meta-oe/recipes-connectivity/libnfs/libnfs_6.0.2.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=825301ba17efc9d188ee0abd4b924ada"
 
 SRC_URI = "git://github.com/sahlberg/libnfs.git;protocol=https;branch=master \
            file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch \
+           file://CVE-2026-53689.patch \
            "
 SRCREV = "18c5c73ee88bb7dc8da0d55dc95164bb77e49dc6"
 

