Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A409AC9833E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:53 +0000 (UTC)
Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34504.1790506248047752778
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=USSuGJYo;
 spf=pass (domain: gmail.com, ip: 74.125.228.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso1075680b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506247; x=1791111047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uQVh0eFKb6fjqYMSoQYAgC8zQnyh0oUDVt/iMfwrJ4o=;
        b=USSuGJYo0pJNfuvO9gfjPUCihRyeN2q4eCvvcaQ+eYiv4Ja8GfFK3w977vG/r0ScxJ
         OmvwVEVPP52BCCm6OMY6OGWJRsqfQQ+SJ96vgshYpbEQiF9a0pbgIVxrr6kpzenE+FIB
         rluJ9tVZ2e1A7Si8wCcigmEyaNzoFW+fUN3M4dhHNBCa4y3XWrQx3p09ncM/z+T82ynQ
         qN9/u0CVUL5WTeYheTaZUztD9nywIqdm++5lXQqF03umA6GgZecjId02clwJwz1bvdmK
         xSjCqbu/b9u9EZXZP7WKYrk0RtdT1wITI8ScohOwfYT0Cv2c5vWzB8/6v2ZA5reTiYXg
         9IRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506247; x=1791111047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uQVh0eFKb6fjqYMSoQYAgC8zQnyh0oUDVt/iMfwrJ4o=;
        b=VEi6oHeFwkCFfkKnTiUK8yatPG7gyoaMJb9blWSITcmfcn0yFhZiC596tTFx4ESTrj
         WoGBbRp/pIpEtmxLDlLSP3QwpwqrX0mjVhJpl8t6Ic7rwHfL3qscS2vBW6sd7aTOr8My
         TvVmGBHVh7tRTfuEUVQNazKTcwvm4DTbGB4g+WQfIcrpgE/SfGZFjRDlt6c0xqC41LJu
         BhWZSzlb/g+YV5VyZVpM2MTKurdrFEOvBh5VjXfYl4TCPoqaS5PhuVxC/NzqUHtzu/px
         k6ga/ISwUoQUiT2cRFn630JAFhJiqLXvxE7HzNredtbXo9G0pkbewEl0GjgaAXMFQDFm
         tCgQ==
X-Gm-Message-State: AFuF++nT8hlmpnjiA6HayvYeHn63bXM9SrW5EXiIzzHtFOh0TejZh1d+
	g0O9D90e9RhvEH2i12ck5MvIFTBhzMFTAR5O6PxMh8HsIiJopIj6dpaxEakC8g==
X-Gm-Gg: AYBFou10nEysYKTIkTfuGjQmmgDfR2n/jpzjRsxsiz0OtV6JGV5A9xbkbrYBjN2gFXm
	wQYKnL0wOl3w1MCENDOWzgZFHaEK4T0NwrD3HrdE91WpUGbEWsvV4y6bwu54hdQXmWLfLn1kgaG
	sp2vthRlRTVY+gE9omZ1ttqxYq7PXUyz+9hdTqGxuJpXbODjhorBgiTMBNuUCqfu6k+4/FB6x02
	Xfq4tk6IVqb4QxcqoQ9x/jZ8tujdfN3q0cTH+i/flVftleFCW1dVgUBITTku+t/QtYnQWfjqPZh
	3sFLZRIEJh5Py1U+0JMpbxizKSYd2LdRSkj/xf9AotEoqErDO5e+y6Syge+pTL85y/5bWdsI+K2
	d8Gx2M+ObaXi5NwXTr41hwc8Rh5mofqBsLm6wE1DxVwhTaWGC9lnsf0fCnfFxZ9tMGvdMjtb42B
	6Zba2lvnjH0viYPP4qvIXPG3cC7ciZs1WBMxEtJvI9eK40QxQ8PBqe8M/8peve+EUfM06xDowp5
	/ymGgteQhgYKD+6a8m+Gag=
X-Received: by 2002:a05:6a00:21c1:b0:84a:29a7:f3b1 with SMTP id d2e1a72fcca58-87e98f8c848mr8238119b3a.16.1790506247340;
        Sun, 27 Sep 2026 03:50:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 14/35] openlldp: upgrade 1.1.1 -> 1.2.0
Date: Sun, 27 Sep 2026 23:49:41 +1300
Message-ID: <20260927105002.1832451-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130348

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Dropped patch that is merged in the upstream version.

Changelog:
https://github.com/intel/openlldp/blob/v1.2.0/ChangeLog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...string.h-for-mem-function-prototypes.patch | 23 -------------------
 .../{openlldp_1.1.1.bb => openlldp_1.2.0.bb}  |  7 +++---
 2 files changed, 3 insertions(+), 27 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/openlldp/files/0004-clif-Include-string.h-for-mem-function-prototypes.patch
 rename meta-networking/recipes-protocols/openlldp/{openlldp_1.1.1.bb => openlldp_1.2.0.bb} (86%)

diff --git a/meta-networking/recipes-protocols/openlldp/files/0004-clif-Include-string.h-for-mem-function-prototypes.patch b/meta-networking/recipes-protocols/openlldp/files/0004-clif-Include-string.h-for-mem-function-prototypes.patch
deleted file mode 100644
index b6d9cf7707..0000000000
--- a/meta-networking/recipes-protocols/openlldp/files/0004-clif-Include-string.h-for-mem-function-prototypes.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From d88aae2230683517b6d5b62cced51da81317a722 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 29 Aug 2022 22:37:14 -0700
-Subject: [PATCH] clif: Include string.h for mem* function prototypes
-
-Upstream-Status: Submitted [https://github.com/intel/openlldp/pull/86]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- clif.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/clif.c b/clif.c
-index cad6f75..0758a7e 100644
---- a/clif.c
-+++ b/clif.c
-@@ -32,6 +32,7 @@
- 
- #include <stdlib.h>
- #include <stdio.h>
-+#include <string.h>
- #include <unistd.h>
- #include <sys/types.h>
- #include <sys/socket.h>
diff --git a/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb b/meta-networking/recipes-protocols/openlldp/openlldp_1.2.0.bb
similarity index 86%
rename from meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb
rename to meta-networking/recipes-protocols/openlldp/openlldp_1.2.0.bb
index ad72b5cdde..7f8b56a895 100644
--- a/meta-networking/recipes-protocols/openlldp/openlldp_1.1.1.bb
+++ b/meta-networking/recipes-protocols/openlldp/openlldp_1.2.0.bb
@@ -11,13 +11,12 @@ inherit ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}
 
 DEPENDS = "libnl libconfig readline"
 
-SRCREV = "f1dd9eb961fab06723d2bedb2f7e2b81e45ee9ab"
-PV .= "+git"
-SRC_URI = "git://github.com/intel/openlldp.git;protocol=https;branch=branch-1.1 \
+SRCREV = "da26ebdc2606619aae4b231a85e5d0cc19a5efee"
+
+SRC_URI = "git://github.com/intel/openlldp.git;protocol=https;branch=branch-${@oe.utils.trim_version('${PV}', 2)};tag=v${PV} \
            file://0001-Fix-musl-libc-build-issue.patch \
            file://0001-autotools-Add-include-path-to-generated-version.h.patch \
            file://0001-autotools-Add-option-to-disable-installation-of-syst.patch \
-           file://0004-clif-Include-string.h-for-mem-function-prototypes.patch \
            "
 
 # Enable install of systemd conf files.

