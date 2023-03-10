Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D04C6FD19
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 07:43:17 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.14157.1678434188500153327
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 23:43:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kZaUDtSC;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id y11so4732015plg.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 23:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678434187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lV6/NlKloFnpOHCtxCiH7nzLymTKalaLJ1fK7GsQwLI=;
        b=kZaUDtSCu1W4f2xk0tc0kbDvGm7dXe67zP8sHLExbUKSEIjjaDm4Y7vvrHgrebrOO5
         QjyOGjNBNxUSnai/4qtwTHWCMNUlPah1Y3Ab8w035Az55dm3fLRrnD8bnP4AlfLLOyvd
         b++3LDq80nBbtsWLuJevdXZuQ6rVyNyJ4bPYsdW+oMPRN3IsmmaSXSKkxIcIIDiT9kq5
         MmUIkQAtSsmU+r79yEL7eKdXyYI955FbFPKTfrjEY1c8LXAk1pbpv5j7MemnXl7BgWhg
         4EP+3dAdQjUjjjA6QisX3pXG29EOPP7jLw0ahhz8eOS2jOwC21SyekY6DOVPOhVrYlLf
         8hCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678434187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lV6/NlKloFnpOHCtxCiH7nzLymTKalaLJ1fK7GsQwLI=;
        b=EnyqBRyb6hCCyrCLwBmT9iV1Vi7LdCREZSWpSv8R6VUitQdaCAgzLXoJQitUvBmagU
         zyB1isNx4QE+dYGArewInJfVZrwf9dEdKcRScEU8Gctw35wx2oR1jM6p4cJR2SSCMA6S
         HBf2bsjc43ynXYEwZ25IzzXoyB+N+3qVLZonqOZE+pE1UhHMVZbiLfTZc6uMGCwIc+jM
         ZuIQ6N3dE2wV7iSGVYPAqF4mr5a9XQc7bTUiU5elDePUE9QhhobTAuF1anenOPKsU/Ev
         YMRhdbAI4UrgFpjxssXgtAhYIWjnp2dmRw9n7dO81afQazpYrcRX0e/U+Zx64Z4dqrHD
         RdPg==
X-Gm-Message-State: AO0yUKVSPrhVm+vTRqDNs/yvbe86eb0WIUw1r4EXsEL0GxJX4byTfiLE
	EH0mcawyEjC+/lJtgxK69LVQwZ6p7rk=
X-Google-Smtp-Source: AK7set9E1Bes0H5I81Kt0NImIBus1EsCGZ7mFawvNSESBb3VVP9wBmXHdvCJDYDLr9+SXZaN/1KqLQ==
X-Received: by 2002:a17:902:e54f:b0:19c:b4e3:c65b with SMTP id n15-20020a170902e54f00b0019cb4e3c65bmr28474856plf.8.1678434187306;
        Thu, 09 Mar 2023 23:43:07 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::8cdc])
        by smtp.gmail.com with ESMTPSA id w21-20020a170902d71500b0019c901b35ecsm809674ply.106.2023.03.09.23.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 23:43:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] pahole: Upgrade to tip of trunk
Date: Thu,  9 Mar 2023 23:43:03 -0800
Message-Id: <20230310074303.2948796-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 07:43:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101484

Drop patches already present in 1.24+
Needed to get fixes to build with latest libbpf APIs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-CMakeList.txt-make-python-optional.patch | 44 -------------------
 ...n-t-download-libbpf-source-when-syst.patch | 34 --------------
 .../pahole/{pahole_1.22.bb => pahole_1.24.bb} |  7 ++-
 3 files changed, 3 insertions(+), 82 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/pahole/files/0001-CMakeList.txt-make-python-optional.patch
 delete mode 100644 meta-oe/recipes-devtools/pahole/files/0003-CMakeList.txt-don-t-download-libbpf-source-when-syst.patch
 rename meta-oe/recipes-devtools/pahole/{pahole_1.22.bb => pahole_1.24.bb} (80%)

diff --git a/meta-oe/recipes-devtools/pahole/files/0001-CMakeList.txt-make-python-optional.patch b/meta-oe/recipes-devtools/pahole/files/0001-CMakeList.txt-make-python-optional.patch
deleted file mode 100644
index d64cba109f..0000000000
--- a/meta-oe/recipes-devtools/pahole/files/0001-CMakeList.txt-make-python-optional.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From f6ca8c930d0fbd2491b3cc77169e32806a14e5e9 Mon Sep 17 00:00:00 2001
-From: Matteo Croce <mcroce@microsoft.com>
-Date: Mon, 30 Aug 2021 16:25:56 +0200
-Subject: [PATCH] CMakeList.txt: make python optional
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/devel/pahole/pahole.git/commit/?id=88431099950ab3e8bc1645353508d7978a6cad35]
-
-ostra-cg, which requires python, is installed in the destination dir.
-Make it optional for embedded distributions which doesn't have the
-python interpreter available.
-
-Signed-off-by: Matteo Croce <mcroce@microsoft.com>
----
- CMakeLists.txt | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4140574..8523bce 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -61,6 +61,7 @@ find_package(DWARF REQUIRED)
- find_package(ZLIB REQUIRED)
- find_package(argp REQUIRED)
- find_package(obstack REQUIRED)
-+find_package(Python3 QUIET)
- 
- # make sure git submodule(s) are checked out
- find_package(Git QUIET)
-@@ -185,8 +186,10 @@ install(FILES dwarves.h dwarves_emit.h dwarves_reorganize.h
- 	      elfcreator.h elf_symtab.h hash.h libctf.h
- 	DESTINATION ${CMAKE_INSTALL_PREFIX}/include/dwarves/)
- install(FILES man-pages/pahole.1 DESTINATION ${CMAKE_INSTALL_PREFIX}/share/man/man1/)
--install(PROGRAMS ostra/ostra-cg DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
-+if(Python3_FOUND)
-+	install(PROGRAMS ostra/ostra-cg DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
-+	install(FILES ostra/python/ostra.py DESTINATION ${CMAKE_INSTALL_PREFIX}/share/dwarves/runtime/python)
-+endif()
- install(PROGRAMS btfdiff fullcircle DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
--install(FILES ostra/python/ostra.py DESTINATION ${CMAKE_INSTALL_PREFIX}/share/dwarves/runtime/python)
- install(FILES lib/Makefile lib/ctracer_relay.c lib/ctracer_relay.h lib/linux.blacklist.cu
- 	DESTINATION ${CMAKE_INSTALL_PREFIX}/share/dwarves/runtime)
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-devtools/pahole/files/0003-CMakeList.txt-don-t-download-libbpf-source-when-syst.patch b/meta-oe/recipes-devtools/pahole/files/0003-CMakeList.txt-don-t-download-libbpf-source-when-syst.patch
deleted file mode 100644
index 3d491e2ef2..0000000000
--- a/meta-oe/recipes-devtools/pahole/files/0003-CMakeList.txt-don-t-download-libbpf-source-when-syst.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 3d20210d84f61ee2189927e2d9de9ce3e5a0a9c5 Mon Sep 17 00:00:00 2001
-From: Matteo Croce <mcroce@microsoft.com>
-Date: Mon, 20 Sep 2021 18:44:52 +0200
-Subject: [PATCH] CMakeList.txt: Don't download libbpf source when system
- library is used
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/devel/pahole/pahole.git/commit/?id=3d20210d84f61ee2189927e2d9de9ce3e5a0a9c5]
-
-The build system always download the libbpf submodule, regardless if
-we're using the embedded or the system version.
-Download the libbpf source only if we're using the embedded one.
-
-Signed-off-by: Matteo Croce <mcroce@microsoft.com>
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8523bce..2ab66e4 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -65,7 +65,7 @@ find_package(Python3 QUIET)
- 
- # make sure git submodule(s) are checked out
- find_package(Git QUIET)
--if(GIT_FOUND AND EXISTS "${PROJECT_SOURCE_DIR}/.git")
-+if(LIBBPF_EMBEDDED AND GIT_FOUND AND EXISTS "${PROJECT_SOURCE_DIR}/.git")
- 	# Update submodules as needed
- 	option(GIT_SUBMODULE "Check submodules during build" ON)
- 	if(GIT_SUBMODULE)
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.22.bb b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
similarity index 80%
rename from meta-oe/recipes-devtools/pahole/pahole_1.22.bb
rename to meta-oe/recipes-devtools/pahole/pahole_1.24.bb
index 449508a5d5..b7f1f8bb28 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.24.bb
@@ -9,11 +9,10 @@ DEPENDS = "elfutils zlib libbpf"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|aarch64).*-linux"
 
-SRCREV = "f02af2553ea58ae1186226af0d0ec835a248358f"
+PV .= "+1.25+git${SRCPV}"
+SRCREV = "a9498899109d3be14f17abbc322a8f55a1067bee"
 SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master \
-           file://0001-CMakeList.txt-make-python-optional.patch \
-           file://0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch \
-           file://0003-CMakeList.txt-don-t-download-libbpf-source-when-syst.patch"
+           file://0002-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.39.2


