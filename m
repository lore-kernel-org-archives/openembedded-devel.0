Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id CD4397D5C0
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Apr 2019 18:42:31 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id b3so4832811plr.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Apr 2019 11:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vIF77ifR2FVfqMNW1ZAUK0TaD2dEu/G50O2mxzmMEi0=;
	b=S9q4AzYjkiNEHesXDMeuMYS2jhRgdaR4uKvM1Ec+QSsbHIZDQpsrGsFJgRHVGdr3dL
	Hpcv++51o4RFrNBv9dXCB3yCSAtQumx/XMA08kpSZS2qOfr7KhWBMs4OWB6yYtKpnV9b
	cxyMy08nxOcFIubAX9tEEPbjkkseiSp0Gi1YT8KfcYAGaJRfNSJ9WbtFXGlv8nKzmmLn
	04RZ70UTzSbVhbFHcTucnjaPW1F1ETHCPmYIGqfGkv2AA5KA02q5fnQaNrMjsfJA39YC
	JYj5Hj6TLyGo21dCBxuaqotkMrs42SGVB2PDys//MaiPfNbj3kp6NZWmzVwS32RhD2R5
	rE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vIF77ifR2FVfqMNW1ZAUK0TaD2dEu/G50O2mxzmMEi0=;
	b=P/yFoeTZ2IJmXM3J4C34qjsrkw+uaj9ReBp5OAAAitJb5cqT//H/6xsdA8TBua2Jwr
	vya4jaLPMXYYcEG13FRzPSHe4uhfpoLU9WfDUqjRW5pBmohznfPFO++Cxd+lbJNn0oBL
	D9tKthl92qYKgLiesF7nX2Vi5xUsxnQG2xpkGnfZTPVWebezQYq5KUl6cEpvcLt+6x26
	PQMvKT4ZSzI4uFY/V+GplABeyHu1dZYpByxexYLIB9o973ken54/ySEHomufDh6cbgtx
	txSdaQYeuVKPJGP57PL7WCsooa598V2hhCfXg1ax57j5NcgIfkFSEd0e2gcDbnTihmKe
	Ey8A==
X-Gm-Message-State: APjAAAX+nKy7Kpq8OzhBEZr2lXfaDkHf1lzMgCYsiX79KCRPpDlzl9wu
	UDsuAvc+JTpSgOhffOSZZiBGb1bqtsc=
X-Google-Smtp-Source: APXvYqzZ7dA0ILp70dejuPpEh4VoyV66ZOlv4GCKC2VRK2BQK8Sx6tkuzdZgATfdP3xQw8rHj8RQHw==
X-Received: by 2002:a17:902:6b03:: with SMTP id
	o3mr20555202plk.226.1554576152031; 
	Sat, 06 Apr 2019 11:42:32 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::8ec8])
	by smtp.gmail.com with ESMTPSA id
	w18sm40572132pfg.75.2019.04.06.11.42.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 Apr 2019 11:42:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2019 11:42:23 -0700
Message-Id: <20190406184223.28699-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] networkmanager: Fix build with clang
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
X-List-Received-Date: Sat, 06 Apr 2019 18:42:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Detecting libdl for dlopen when failed returns
"none required", which then gets added to linker commandline
and inturn fails to link with errors obviously because "-lnone required"
is no such library.

This patch is not musl dependent, earlier patches clubbed it into musl
patch however this is needed with clang too regardless of the C library
the reason is clang automatically brings in libdl in OE and hence this
test is failing.

This is noop with gcc since the first check will pass thats why it works
in first place

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../networkmanager/0003-dlopen-failure.patch  | 34 +++++++++++++++++++
 .../musl/0001-Fix-build-with-musl.patch       | 13 -------
 .../networkmanager/networkmanager_1.16.0.bb   |  1 +
 3 files changed, 35 insertions(+), 13 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-dlopen-failure.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-dlopen-failure.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-dlopen-failure.patch
new file mode 100644
index 0000000000..e99c22710c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0003-dlopen-failure.patch
@@ -0,0 +1,34 @@
+From 57239fda56b68a8f3e413f7b6af5290ba0d86636 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Thu, 22 Mar 2018 18:18:06 +0100
+Subject: [PATCH] musl: dlopen is included so LD_LIBS="" instead of
+ LD_LIBS="none required"
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Stolen from [1] and prettyfied slightly
+
+[1] https://github.com/voidlinux/void-packages/tree/master/srcpkgs/NetworkManager/patches
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 487a266..96ae4f7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -235,6 +235,7 @@ dnl
+ dnl Checks for libdl - on certain platforms its part of libc
+ dnl
+ AC_SEARCH_LIBS([dlopen], [dl dld], [], [ac_cv_search_dlopen=])
++AS_IF([test "$ac_cv_search_dlopen" = "none required"],[ac_cv_search_dlopen=""])
+ AC_SUBST([DL_LIBS], "$ac_cv_search_dlopen")
+ 
+ PKG_CHECK_MODULES(GLIB, [gio-unix-2.0 >= 2.37.6 gmodule-2.0],
+-- 
+2.14.3
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl.patch
index 21e9a16d6d..b3f93ff92b 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl.patch
@@ -11,7 +11,6 @@ Upstream-Status: Pending
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
  clients/cli/connections.c                    |  1 -
- configure.ac                                 |  1 +
  libnm-core/nm-utils.c                        |  2 +-
  shared/n-acd/src/n-acd.c                     |  1 -
  shared/systemd/src/basic/in-addr-util.c      |  1 +
@@ -43,18 +42,6 @@ index 6db44f8..36e51cc 100644
  #include <readline/readline.h>
  #include <readline/history.h>
  #include <fcntl.h>
-diff --git a/configure.ac b/configure.ac
-index 872c292..b1d7a68 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -241,6 +241,7 @@ dnl
- dnl Checks for libdl - on certain platforms its part of libc
- dnl
- AC_SEARCH_LIBS([dlopen], [dl dld], [], [ac_cv_search_dlopen=])
-+AS_IF([test "$ac_cv_search_dlopen" = "none required"],[ac_cv_search_dlopen=""])
- AC_SUBST([DL_LIBS], "$ac_cv_search_dlopen")
- 
- PKG_CHECK_MODULES(GLIB, [gio-unix-2.0 >= 2.37.6 gmodule-2.0],
 diff --git a/libnm-core/nm-utils.c b/libnm-core/nm-utils.c
 index d276cfe..2aec785 100644
 --- a/libnm-core/nm-utils.c
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
index 90792ff4ee..9f57908e96 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
@@ -26,6 +26,7 @@ SRC_URI = " \
     ${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManager-${PV}.tar.xz \
     file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
+    file://0003-dlopen-failure.patch \
 "
 SRC_URI_append_libc-musl = " file://musl/0001-Fix-build-with-musl.patch"
 
-- 
2.21.0


