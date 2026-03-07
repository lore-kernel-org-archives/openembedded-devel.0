Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D85BCFC9EFD
	for <webhook@archiver.kernel.org>; Sat,  7 Mar 2026 11:41:56 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7521.1772883710030170440
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Mar 2026 03:41:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fsmCVwEx;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-439b7c2788dso4657757f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 03:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772883708; x=1773488508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xS+R9dmhnMteexhFnK9zLTUvkV+hnfyvgLWLyNL4wy8=;
        b=fsmCVwExIYXiUD3E4IwK+tet4lGEm1b0EtXqwpfQzDCc8Q4O5+/F6F7Q7sX8arJNpe
         phqdSGems/mIWvc4+LjiFYsYbOCUM+16RHtyhnmIBhWLNU/NUiqxK3FZdu1Hb2kWbrAH
         J09Oz8y3ZMgUa/e2+WhgOgD3GXYeXByY8Tb2OVPOk4Rf9sRaUnQ56EH7KcWK7x4oaifj
         1ToPf2e04J1ge2c7KQK67zC13oHlfspRYLLNHIvAeStM9lT8KyMPoXliBE5BgCGlATUO
         3jQkVv03L2luSwzDSpw5irKsGpqBeorlaWn+NhmX+uce3mlBprNtMbHFQkZpn7+63v0d
         zpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772883708; x=1773488508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xS+R9dmhnMteexhFnK9zLTUvkV+hnfyvgLWLyNL4wy8=;
        b=PZXgKo5sJCiN8m16OFeiiuG3U38003LH1bhXTnrjDn3EHNHOowvZCcosGFccKS4rXH
         i1Dr+1YHVC0D5luSnGYNoN8hnGrmmcDSsh7B/O0v2XYE8GGfGgsLg0t+Ir+ClfVwzWII
         dFUGRKwZu4ajgJSb/7Vzsi3jqDNj57wn4Mki5gPut3qZT1HeEQMuDW/4WCAMqPdhxgUd
         EomD6lKCBD4l2dWBUFVfb2vtJPoDr0ISljQZiArhnf6pVOVdl9IDwn4IAL8CDDgFzA2w
         yLuBige6/wLz3NhBtNsLANgPGzhqjOPjNY1FvGmqPuRgULMPY4YTygEnSp9Vrn/WhAbv
         dx/g==
X-Gm-Message-State: AOJu0YyMMeEzbGX4nbpk1ovpH1OeoiUdnf59ogu61PfXifzeR8xhgzQe
	uF84h4xBhJV6/lfReImKuJilY2Ebb982pLyIZXujdoIeAUKtzgIF+GoJ26YQZg==
X-Gm-Gg: ATEYQzycAdZtu/ghZGwErnp4mhsyfDGn9YslHQYbhWwIYFFQFJqRJJUw7yV+7OnP9lJ
	QaGyz8/rw41VOgX0htkK9nj1Tp3OEb85YNlqRxWhu1zhpsWV/u+vQop443Wb1KpLNUGs4t0LsVQ
	jMc1wanGi47zCKDcU3yRm1i4wsyIPolMS96Z7iAH8InNoATt91Eb1ZMnYZGRwdJfOtWcXGm+bRp
	6D6vSBxsxahjcGfAal/vW6/2WbzeV4lYVwrEQIo02DJM6sBQZzmr+mpld+gyseh2HnjjEhgKAB0
	Pt0/g6IxEfpjNthQgX+P2symW009c8FNta18Tq06wZ7t7mehKMApWaf8oiG7emESExFLG3mxuQg
	Hy9E1DTqSpiBFTHxbTE4klPoZXwxLsrrZ2vhLo5+QXPlhkM7s74OLbEuUArch3BA8oKCRy39ggc
	aEOpws50o6bLauM4fFDFr7
X-Received: by 2002:a05:6000:420b:b0:439:ccd7:cdd1 with SMTP id ffacd0b85a97d-439da66936amr8195170f8f.36.1772883708255;
        Sat, 07 Mar 2026 03:41:48 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2b9d8sm11170913f8f.21.2026.03.07.03.41.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 03:41:47 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 4/4] rdma-core: upgrade 51.0 -> 62.0
Date: Sat,  7 Mar 2026 12:41:42 +0100
Message-ID: <20260307114142.3992185-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307114142.3992185-1-skandigraun@gmail.com>
References: <20260307114142.3992185-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Mar 2026 11:41:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124929

v51 series will get support only for about 2 more years, but v62
just started its ~4 years long support cycle.

Drop patches that are included in this release, or were solved on another
way by upstream.

Changelog:
62.0: https://github.com/linux-rdma/rdma-core/releases/tag/v62.0
61.0: https://github.com/linux-rdma/rdma-core/releases/tag/v61.0
60.0: https://github.com/linux-rdma/rdma-core/releases/tag/v60.0
59.0: https://github.com/linux-rdma/rdma-core/releases/tag/v59.0
58.0: https://github.com/linux-rdma/rdma-core/releases/tag/v58.0
57.0: https://github.com/linux-rdma/rdma-core/releases/tag/v57.0
56.0: https://github.com/linux-rdma/rdma-core/releases/tag/v56.0
55.0: https://github.com/linux-rdma/rdma-core/releases/tag/v55.0
54.0: https://github.com/linux-rdma/rdma-core/releases/tag/v54.0
53.0: https://github.com/linux-rdma/rdma-core/releases/tag/v53.0
52.0: https://github.com/linux-rdma/rdma-core/releases/tag/v52.0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...EMCTL_BIN-to-be-overridden-from-envi.patch |  4 +-
 .../0001-include-libgen.h-for-basename.patch  | 58 -------------------
 ...erloadable-function-attribute-with-c.patch | 38 ------------
 .../{rdma-core_51.0.bb => rdma-core_62.0.bb}  |  6 +-
 4 files changed, 4 insertions(+), 102 deletions(-)
 delete mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0001-include-libgen.h-for-basename.patch
 delete mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0001-librdmacm-Use-overloadable-function-attribute-with-c.patch
 rename meta-networking/recipes-support/rdma-core/{rdma-core_51.0.bb => rdma-core_62.0.bb} (85%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch
index e181ee2872..d6c641d90b 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch
@@ -17,8 +17,8 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 98985e7ee..001efb800 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -237,7 +237,10 @@ else()
-   endif()
+@@ -256,7 +256,10 @@ else()
+     message(WARNING "pyverbs build requested but python development files not found")
  endif()
  
 -find_program(SYSTEMCTL_BIN systemctl HINTS "/usr/bin" "/bin")
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-include-libgen.h-for-basename.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-include-libgen.h-for-basename.patch
deleted file mode 100644
index a093e47048..0000000000
--- a/meta-networking/recipes-support/rdma-core/rdma-core/0001-include-libgen.h-for-basename.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From ae6adc4c748e67919fdf8ae1d44c619ee104c271 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 25 Mar 2024 11:37:41 -0700
-Subject: [PATCH] include libgen.h for basename
-
-basename prototype has been removed from string.h from latest musl [1]
-compilers e.g. clang-18 flags the absense of prototype as error. therefore
-include libgen.h for providing it.
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://github.com/linux-rdma/rdma-core/pull/1443]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- kernel-boot/rdma_rename.c  | 1 +
- librdmacm/examples/rping.c | 1 +
- providers/mlx5/mlx5_vfio.c | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/kernel-boot/rdma_rename.c b/kernel-boot/rdma_rename.c
-index 4af9e4a39..5193ac411 100644
---- a/kernel-boot/rdma_rename.c
-+++ b/kernel-boot/rdma_rename.c
-@@ -2,6 +2,7 @@
- /* Copyright (c) 2019, Mellanox Technologies. All rights reserved. See COPYING file */
- 
- #define _GNU_SOURCE
-+#include <libgen.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <string.h>
-diff --git a/librdmacm/examples/rping.c b/librdmacm/examples/rping.c
-index cc16ad910..0f1321458 100644
---- a/librdmacm/examples/rping.c
-+++ b/librdmacm/examples/rping.c
-@@ -33,6 +33,7 @@
- #define _GNU_SOURCE
- #include <endian.h>
- #include <getopt.h>
-+#include <libgen.h>
- #include <stdlib.h>
- #include <string.h>
- #include <stdio.h>
-diff --git a/providers/mlx5/mlx5_vfio.c b/providers/mlx5/mlx5_vfio.c
-index cd0c41462..4d064b1fc 100644
---- a/providers/mlx5/mlx5_vfio.c
-+++ b/providers/mlx5/mlx5_vfio.c
-@@ -6,6 +6,7 @@
- #define _GNU_SOURCE
- #include <config.h>
- 
-+#include <libgen.h>
- #include <stdio.h>
- #include <stdlib.h>
- #include <unistd.h>
--- 
-2.44.0
-
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-librdmacm-Use-overloadable-function-attribute-with-c.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-librdmacm-Use-overloadable-function-attribute-with-c.patch
deleted file mode 100644
index 092f4431bf..0000000000
--- a/meta-networking/recipes-support/rdma-core/rdma-core/0001-librdmacm-Use-overloadable-function-attribute-with-c.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From c7de6834f0cd92b7341ab17a5c6996f3fbd40140 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 21 Jun 2024 22:16:47 -0700
-Subject: [PATCH]  librdmacm: Use overloadable function attribute with clang
-
- This is to fix build warnings seen with upcoming clang19 and
- glibc 2.40, since glibc 2.40 has improved fortyfying this
- function with clang, it ends up with build errors like below
-
-librdmacm/preload.c:796:9: error: at most one overload for a given name may lack the 'overloadable' attribute
-|   796 | ssize_t recvfrom(int socket, void *buf, size_t len, int flags,
-|       |         ^
-| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/rdma-core/51.0/recipe-sysroot/usr/include/sys/socket.h:163:16: note: previous unmarked overload of function is here
-|   163 | extern ssize_t recvfrom (int __fd, void *__restrict __buf, size_t __n,
-|       |                ^
-
-Upstream-Status: Submitted [https://github.com/linux-rdma/rdma-core/pull/1475]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- librdmacm/preload.c | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
---- a/librdmacm/preload.c
-+++ b/librdmacm/preload.c
-@@ -792,8 +792,11 @@ ssize_t recv(int socket, void *buf, size
- 	return (fd_fork_get(socket, &fd) == fd_rsocket) ?
- 		rrecv(fd, buf, len, flags) : real.recv(fd, buf, len, flags);
- }
--
--ssize_t recvfrom(int socket, void *buf, size_t len, int flags,
-+ssize_t
-+#if defined(__clang__) && defined(__GLIBC__)
-+__attribute__((overloadable))
-+#endif
-+recvfrom(int socket, void *buf, size_t len, int flags,
- 		 struct sockaddr *src_addr, socklen_t *addrlen)
- {
- 	int fd;
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_62.0.bb
similarity index 85%
rename from meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_62.0.bb
index 2555c43a85..5a8640ad02 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_51.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_62.0.bb
@@ -5,12 +5,10 @@ SECTION = "libs"
 DEPENDS = "libnl"
 RDEPENDS:${PN} = "bash perl"
 
-SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch \
-           file://0001-include-libgen.h-for-basename.patch \
-           file://0001-librdmacm-Use-overloadable-function-attribute-with-c.patch \
 "
-SRCREV = "6cd09097ad2eebde9a7fa3d3bb09a2cea6e3c2d6"
+SRCREV = "31af04ec84378724cb6256814d4ffde359a7123b"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
 LICENSE = "BSD-2-Clause | GPL-2.0-only"

