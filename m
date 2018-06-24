Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 649F074DCB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:43 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id q14-v6so1324629pgt.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=qV74r2zDeG6groc4PbGufSUOozLqYDXfVxTyaK1b69c=;
	b=JAdxjIPi87JnPHJuZJ2xcN23ZdxDs9mdtyoVvBKKMBDkVOV7eBdpYIz8vQMvVZ22wg
	YXM9ADr/UDWI37a6uHXdj66lwjKbcLVSUNVNC35RPhA8Uf5yW+LIlZYGXEjEtJ+euWI8
	UBJ6i8124GaQXqRuaKSjSQTKEZvvA9U9nM/LtAjB7gMBcP2AUwjuL8a8hWME7TQQySkD
	PeEMoPm+0QCOKuUJb1gmvSTBe3EhTHKc1cmi2l7L2Yq1/u03Bt3czGw0LAFkmm3s82dv
	28JvdpE/9its3wpoOigAOqqYp/WCGrMMvpo/3Y7V+AnmVVAfH+zUHoNV5lv33NWR7nha
	cX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qV74r2zDeG6groc4PbGufSUOozLqYDXfVxTyaK1b69c=;
	b=K4FojvIVMHcTo1PrMguOxn7aTvUDYw8xGz9Z++NlK3iKeH8sk2L80gaYML3B8/9KDz
	FRAuJsNIh8gHEZYI/Hue0HbC+KYw8BRE7l6bkZ3ZfJ3MBnjw3hRxHSSNk2wuR/sHxsEe
	z7YgjtAudHZ4v5QNctWPJwbJIYQ2+OYfaN61Rv+ySMc+gzRx8O5U2XhOjQ2LYSz+u8hr
	E6t5QnET1Hzd8G1at8HB8ZaXPOhwdMYsJA1TWk3G7yxbVzz1i+k7ItTvROto9CAlXeH5
	v/HKEbfQnyGCzFFtlxY4Z85tY/2KzaqObqOhPNhI8b1Qt/Z02j6H78Iwxy2KNJl1syhp
	oXiw==
X-Gm-Message-State: APt69E3qwX6gGCJyeP3gpbMzqOH9Pxr4WE1RdcE3ujtbhwHIwRvdfMca
	DQgBkrisLJYiXpRMnMXuxh7lRw==
X-Google-Smtp-Source: ADUXVKKGPlntOObbUUbGG+xXlaYaUumJuvfsLHBFCqBw/qEJwqPIhQPcXQLXZuupPnzMmQH8sukxQA==
X-Received: by 2002:a62:8917:: with SMTP id
	v23-v6mr10233847pfd.127.1529867983890; 
	Sun, 24 Jun 2018 12:19:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:39 -0700
Message-Id: <20180624191845.31082-14-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 14/20] opensaf: Upgrade to 5.18.04
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:43 -0000

fix strncpy overflow errors seen with gcc8
refresh patches with devtool

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ch-std-ifstream-failure-by-reference.patch | 16 ++++-----
 ...0001-Fix-string-overflow-in-snprintf.patch |  3 +-
 ...e-format-overflow-if-supported-by-gc.patch | 34 ++++++++++---------
 ...Pass-linker-specific-options-with-Wl.patch | 10 +++---
 ....cc-Use-sys-wait.h-instead-of-wait.h.patch | 12 +++----
 ...header-limits.h-for-_POSIX_HOST_NAME.patch | 20 +++++------
 .../0002-Fix-format-truncation-errors.patch   | 12 +++----
 ...-check-for-size-before-using-strncpy.patch | 33 ++++++++++++++++++
 ...{opensaf_5.18.02.bb => opensaf_5.18.04.bb} |  5 +--
 9 files changed, 86 insertions(+), 59 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/opensaf/opensaf/0008-check-for-size-before-using-strncpy.patch
 rename meta-networking/recipes-daemons/opensaf/{opensaf_5.18.02.bb => opensaf_5.18.04.bb} (93%)

diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Catch-std-ifstream-failure-by-reference.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Catch-std-ifstream-failure-by-reference.patch
index 8f8dba0541..30fdb8bf14 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Catch-std-ifstream-failure-by-reference.patch
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Catch-std-ifstream-failure-by-reference.patch
@@ -1,7 +1,7 @@
-From 77d50b8d92ef1903cbc50d8f39e05fc828696bb9 Mon Sep 17 00:00:00 2001
+From 38c5343f84799fc5041575f3ec808f7476b6eea3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 16 Apr 2018 14:33:35 -0700
-Subject: [PATCH 1/2] Catch std::ifstream::failure by reference
+Subject: [PATCH] Catch std::ifstream::failure by reference
 
 Fixes
 error: catching polymorphic type 'class std::ios_base::failure' by value
@@ -10,6 +10,7 @@ error: catching polymorphic type 'class std::ios_base::failure' by value
                            ^~~~~~~
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/base/conf.cc           | 4 ++--
  src/dtm/dtmnd/dtm_main.cc  | 2 +-
@@ -39,10 +40,10 @@ index d5755a1..4820357 100644
    }
    str.close();
 diff --git a/src/dtm/dtmnd/dtm_main.cc b/src/dtm/dtmnd/dtm_main.cc
-index 3260a81..a55afac 100644
+index 585e11e..5cf6ad7 100644
 --- a/src/dtm/dtmnd/dtm_main.cc
 +++ b/src/dtm/dtmnd/dtm_main.cc
-@@ -359,7 +359,7 @@ void UpdateNodeIdFile(DTM_INTERNODE_CB *cb) {
+@@ -367,7 +367,7 @@ void UpdateNodeIdFile(DTM_INTERNODE_CB *cb) {
        try {
          str.open(PKGLOCALSTATEDIR "/node_id", std::ofstream::out);
          str << std::hex << node_id << std::endl;
@@ -52,10 +53,10 @@ index 3260a81..a55afac 100644
        str.close();
      }
 diff --git a/src/dtm/dtmnd/multicast.cc b/src/dtm/dtmnd/multicast.cc
-index bf67b9c..7232066 100644
+index cadc002..7c25fea 100644
 --- a/src/dtm/dtmnd/multicast.cc
 +++ b/src/dtm/dtmnd/multicast.cc
-@@ -198,7 +198,7 @@ bool Multicast::GetPeersFromFile(const std::string &path_name) {
+@@ -199,7 +199,7 @@ bool Multicast::GetPeersFromFile(const std::string &path_name) {
          }
        }
      }
@@ -64,6 +65,3 @@ index bf67b9c..7232066 100644
      LOG_ER("Caught std::ifstream::failure when reading file '%s', peers=%zu",
             path_name.c_str(), static_cast<size_t>(peers_.size()));
      peers_.clear();
--- 
-2.17.0
-
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-string-overflow-in-snprintf.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-string-overflow-in-snprintf.patch
index 428e462289..db6796d05d 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-string-overflow-in-snprintf.patch
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-Fix-string-overflow-in-snprintf.patch
@@ -1,4 +1,4 @@
-From 8cf323a2d8e02ca0bd36deb38e613c6edac546ad Mon Sep 17 00:00:00 2001
+From ae7178a78aba2e5766b70191617113487fd7ad0b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 16 Apr 2018 18:29:17 -0700
 Subject: [PATCH] Fix string overflow in snprintf
@@ -13,6 +13,7 @@ t-truncation=]
             ~~~~~~~~
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/log/logd/lgs_util.cc           | 4 ++--
  src/rde/rded/rde_amf.cc            | 2 +-
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Disable-format-overflow-if-supported-by-gc.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Disable-format-overflow-if-supported-by-gc.patch
index effe25c85c..be0a587679 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Disable-format-overflow-if-supported-by-gc.patch
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Disable-format-overflow-if-supported-by-gc.patch
@@ -1,20 +1,21 @@
-From ab00d6f5793b2d850f975bcb6d5d0aa6d7a9eaa4 Mon Sep 17 00:00:00 2001
+From c2668f7f2ea82a61115b7cae56ed081b41ff5153 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 22 Apr 2017 12:34:37 -0700
 Subject: [PATCH] configure: Disable format-overflow if supported by gcc
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- Makefile.am                 |  6 ++--
- configure.ac                |  2 ++
- m4/ax_check_compile_flag.m4 | 74 +++++++++++++++++++++++++++++++++++++++++++++
+ Makefile.am                 |  6 +--
+ configure.ac                |  2 +
+ m4/ax_check_compile_flag.m4 | 74 +++++++++++++++++++++++++++++++++++++
  3 files changed, 79 insertions(+), 3 deletions(-)
  create mode 100644 m4/ax_check_compile_flag.m4
 
-Index: opensaf-5.18.02/Makefile.am
-===================================================================
---- opensaf-5.18.02.orig/Makefile.am
-+++ opensaf-5.18.02/Makefile.am
+diff --git a/Makefile.am b/Makefile.am
+index b3d6553..5607fc2 100644
+--- a/Makefile.am
++++ b/Makefile.am
 @@ -52,10 +52,10 @@ AM_CPPFLAGS = \
  	-pthread \
  	-D_GNU_SOURCE -DINTERNAL_VERSION_ID='"@INTERNAL_VERSION_ID@"' \
@@ -29,11 +30,11 @@ Index: opensaf-5.18.02/Makefile.am
  
  if ENABLE_GCOV
  AM_CFLAGS += --coverage
-Index: opensaf-5.18.02/configure.ac
-===================================================================
---- opensaf-5.18.02.orig/configure.ac
-+++ opensaf-5.18.02/configure.ac
-@@ -593,6 +593,8 @@ if test -z "$OSAF_HARDEN_FLAGS"; then
+diff --git a/configure.ac b/configure.ac
+index 5b86730..47d1002 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -600,6 +600,8 @@ if test -z "$OSAF_HARDEN_FLAGS"; then
  fi
  AC_SUBST(OSAF_HARDEN_FLAGS)
  
@@ -42,10 +43,11 @@ Index: opensaf-5.18.02/configure.ac
  #############################################
  # List the output Makefiles
  #############################################
-Index: opensaf-5.18.02/m4/ax_check_compile_flag.m4
-===================================================================
+diff --git a/m4/ax_check_compile_flag.m4 b/m4/ax_check_compile_flag.m4
+new file mode 100644
+index 0000000..dcabb92
 --- /dev/null
-+++ opensaf-5.18.02/m4/ax_check_compile_flag.m4
++++ b/m4/ax_check_compile_flag.m4
 @@ -0,0 +1,74 @@
 +# ===========================================================================
 +#  https://www.gnu.org/software/autoconf-archive/ax_check_compile_flag.html
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Pass-linker-specific-options-with-Wl.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Pass-linker-specific-options-with-Wl.patch
index 5756a027b4..e4bbb4c3cd 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Pass-linker-specific-options-with-Wl.patch
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-configure-Pass-linker-specific-options-with-Wl.patch
@@ -1,4 +1,4 @@
-From 6248b717b4861d16b80235fd8e57d64e4f636428 Mon Sep 17 00:00:00 2001
+From 979b2b6a1aa574a26e8b736049c4207d568f60f3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 13 Apr 2017 17:39:07 -0700
 Subject: [PATCH] configure: Pass linker specific options with -Wl
@@ -7,15 +7,16 @@ This helps make it pass the options to linker correctly
 and we can use non-gcc compilers
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  configure.ac | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index df4fc58..02771c6 100644
+index 12a5d5c..5b86730 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -553,7 +553,7 @@ if test -z "$OSAF_HARDEN_FLAGS"; then
+@@ -596,7 +596,7 @@ if test -z "$OSAF_HARDEN_FLAGS"; then
  	if echo "${CFLAGS} ${CXXFLAGS}" | grep -q -- -O0; then
  		OSAF_HARDEN_FLAGS=""
  	fi
@@ -24,6 +25,3 @@ index df4fc58..02771c6 100644
  fi
  AC_SUBST(OSAF_HARDEN_FLAGS)
  
--- 
-2.12.2
-
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch
index 76c47c6584..e40d2b3198 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-immpbe_dump.cc-Use-sys-wait.h-instead-of-wait.h.patch
@@ -1,4 +1,4 @@
-From 508ea7c0d67243feb1684eaa83569cb687561d64 Mon Sep 17 00:00:00 2001
+From c21f77d592415f316138c05f581192a1f061e735 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Sep 2017 10:09:03 -0700
 Subject: [PATCH] immpbe_dump.cc: Use sys/wait.h instead of wait.h
@@ -7,12 +7,13 @@ Fixes
 redirecting incorrect #include <wait.h> to <sys/wait.h>
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/imm/common/immpbe_dump.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/imm/common/immpbe_dump.cc b/src/imm/common/immpbe_dump.cc
-index 100222f37..33e47ce3c 100644
+index e6b3cc5..3956028 100644
 --- a/src/imm/common/immpbe_dump.cc
 +++ b/src/imm/common/immpbe_dump.cc
 @@ -26,12 +26,12 @@
@@ -27,8 +28,5 @@ index 100222f37..33e47ce3c 100644
  #include <sys/stat.h>
 +#include <sys/wait.h>
  #include <libgen.h>
- 
- #include <saAis.h>
--- 
-2.14.1
-
+ #include <set>
+ #include <vector>
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch
index 4a2a825f99..e4a3975da6 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0001-src-Add-missing-header-limits.h-for-_POSIX_HOST_NAME.patch
@@ -1,4 +1,4 @@
-From 6442b57a855e273aa5a3d93e8596783cea128073 Mon Sep 17 00:00:00 2001
+From 7fb393c66df33110fef0cbabac7d304f12eb82e4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Sep 2017 09:39:40 -0700
 Subject: [PATCH] src: Add missing header limits.h for _POSIX_HOST_NAME_MAX
@@ -7,6 +7,7 @@ Use _GNU_SOURCE instead of libc internal __USE_GNU
 Do not use the deprecated headers under include/sys
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/base/os_defs.h        | 5 +++--
  src/mds/mds_dt_tcp.c      | 1 -
@@ -18,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  7 files changed, 6 insertions(+), 8 deletions(-)
 
 diff --git a/src/base/os_defs.h b/src/base/os_defs.h
-index 50a9bf5fc..af6842863 100644
+index a570c43..3559b19 100644
 --- a/src/base/os_defs.h
 +++ b/src/base/os_defs.h
 @@ -47,17 +47,18 @@
@@ -43,7 +44,7 @@ index 50a9bf5fc..af6842863 100644
  #include <pthread.h>
  
 diff --git a/src/mds/mds_dt_tcp.c b/src/mds/mds_dt_tcp.c
-index 1407eb1ab..a87c22faa 100644
+index 1407eb1..a87c22f 100644
 --- a/src/mds/mds_dt_tcp.c
 +++ b/src/mds/mds_dt_tcp.c
 @@ -27,7 +27,6 @@
@@ -55,7 +56,7 @@ index 1407eb1ab..a87c22faa 100644
  #include <sys/types.h>
  #include <unistd.h>
 diff --git a/src/mds/mds_dt_tcp_disc.h b/src/mds/mds_dt_tcp_disc.h
-index a6249d73e..574f52681 100644
+index a6249d7..574f526 100644
 --- a/src/mds/mds_dt_tcp_disc.h
 +++ b/src/mds/mds_dt_tcp_disc.h
 @@ -24,7 +24,7 @@
@@ -68,7 +69,7 @@ index a6249d73e..574f52681 100644
  /*  mds_indentifire + mds_version   + msg_type + scope_type + server_type +
     server_instance_lower + server_instance_upper + sub_ref_val + sub_ref_val  +
 diff --git a/src/mds/mds_dt_tipc.c b/src/mds/mds_dt_tipc.c
-index 37745e7f0..9b3255567 100644
+index 7714175..a0ed3b6 100644
 --- a/src/mds/mds_dt_tipc.c
 +++ b/src/mds/mds_dt_tipc.c
 @@ -35,7 +35,6 @@
@@ -80,7 +81,7 @@ index 37745e7f0..9b3255567 100644
  #include <sys/types.h>
  #include <unistd.h>
 diff --git a/src/mds/mds_dt_tipc.h b/src/mds/mds_dt_tipc.h
-index e73a11b09..401d208c2 100644
+index e73a11b..401d208 100644
 --- a/src/mds/mds_dt_tipc.h
 +++ b/src/mds/mds_dt_tipc.h
 @@ -32,7 +32,7 @@
@@ -93,7 +94,7 @@ index e73a11b09..401d208c2 100644
  #include <errno.h>
  #include <fcntl.h>
 diff --git a/src/mds/mds_dt_trans.c b/src/mds/mds_dt_trans.c
-index 6f621e04e..5aacbd33e 100644
+index 6f621e0..5aacbd3 100644
 --- a/src/mds/mds_dt_trans.c
 +++ b/src/mds/mds_dt_trans.c
 @@ -26,7 +26,6 @@
@@ -105,7 +106,7 @@ index 6f621e04e..5aacbd33e 100644
  
  #define MDS_PROT_TCP 0xA0
 diff --git a/src/ntf/ntfd/NtfLogger.cc b/src/ntf/ntfd/NtfLogger.cc
-index 84014b578..31b1ccc6c 100644
+index fd17c58..1120008 100644
 --- a/src/ntf/ntfd/NtfLogger.cc
 +++ b/src/ntf/ntfd/NtfLogger.cc
 @@ -20,7 +20,7 @@
@@ -117,6 +118,3 @@ index 84014b578..31b1ccc6c 100644
  
  #include "base/osaf_utility.h"
  #include <saAis.h>
--- 
-2.14.1
-
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-format-truncation-errors.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-format-truncation-errors.patch
index 9865a5e1b8..f98e28da9c 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-format-truncation-errors.patch
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0002-Fix-format-truncation-errors.patch
@@ -1,12 +1,13 @@
-From 4d58d26cbd3622183afc2e8f85c9c81edaf135df Mon Sep 17 00:00:00 2001
+From c5034fe42df8923bcefc10e163151997d70b6241 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 16 Apr 2018 14:56:47 -0700
-Subject: [PATCH 2/2] Fix format-truncation errors
+Subject: [PATCH] Fix format-truncation errors
 
 Fixes errors with gcc8 eg.
 error: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size between 0 and 254 [-Werror=format-truncation=]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/base/daemon.c  | 4 ++--
  src/mds/mds_c_db.c | 8 ++++----
@@ -15,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  4 files changed, 9 insertions(+), 9 deletions(-)
 
 diff --git a/src/base/daemon.c b/src/base/daemon.c
-index 27170d7..da97700 100644
+index 361dd8d..4001b73 100644
 --- a/src/base/daemon.c
 +++ b/src/base/daemon.c
-@@ -92,11 +92,11 @@ static int __create_pidfile(const char *pidfile)
+@@ -95,11 +95,11 @@ static int __create_pidfile(const char *pidfile)
  {
  	FILE *file = NULL;
  	int fd, rc = 0;
@@ -97,6 +98,3 @@ index 012999c..006b722 100644
    MDS_SEND_PRIORITY_TYPE pri;
    MDS_CLIENT_MSG_FORMAT_VER
        msg_fmt_ver; /* message format version specification */
--- 
-2.17.0
-
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf/0008-check-for-size-before-using-strncpy.patch b/meta-networking/recipes-daemons/opensaf/opensaf/0008-check-for-size-before-using-strncpy.patch
new file mode 100644
index 0000000000..497bb07d8d
--- /dev/null
+++ b/meta-networking/recipes-daemons/opensaf/opensaf/0008-check-for-size-before-using-strncpy.patch
@@ -0,0 +1,33 @@
+From 29510dd81e3a5e96151afdb0702863cbfd640766 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 22 Jun 2018 18:58:59 -0700
+Subject: [PATCH] check for size before using strncpy
+
+ensures that size is never execeding the string length
+that execPath can hold
+
+Fixes
+error: '__builtin___strncpy_chk' specified size between 18446744071562067968 and 18446744073709551615 exceeds maximum object size 9223372036854775807 [-Werror=stringop-overflow=]
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/imm/immnd/immnd_proc.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/imm/immnd/immnd_proc.c b/src/imm/immnd/immnd_proc.c
+index 015932a..c8f115e 100644
+--- a/src/imm/immnd/immnd_proc.c
++++ b/src/imm/immnd/immnd_proc.c
+@@ -1902,6 +1902,10 @@ static int immnd_forkPbe(IMMND_CB *cb)
+ 		LOG_ER("Pathname too long: %u max is 1023", newLen);
+ 		return -1;
+ 	}
++	if (execDirLen > 1023 || execDirLen < 0) {
++		LOG_ER("Execdir name too long: %u max is 1023", execDirLen);
++		return -1;
++	}
+ 
+ 	strncpy(execPath, cb->mProgName, execDirLen);
+ 	execPath[execDirLen] = 0;
diff --git a/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb b/meta-networking/recipes-daemons/opensaf/opensaf_5.18.04.bb
similarity index 93%
rename from meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb
rename to meta-networking/recipes-daemons/opensaf/opensaf_5.18.04.bb
index 0ef13b0485..effe956999 100644
--- a/meta-networking/recipes-daemons/opensaf/opensaf_5.18.02.bb
+++ b/meta-networking/recipes-daemons/opensaf/opensaf_5.18.04.bb
@@ -27,9 +27,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/releases/${BPN}-${PV}.tar.gz \
            file://0001-Catch-std-ifstream-failure-by-reference.patch \
            file://0002-Fix-format-truncation-errors.patch \
            file://0001-Fix-string-overflow-in-snprintf.patch \
+           file://0008-check-for-size-before-using-strncpy.patch \
            "
-SRC_URI[md5sum] = "42064f5ddbc7f560bfc5ff93ea9eecc7"
-SRC_URI[sha256sum] = "f9e24897f9cfd63bb3115f6275c706de1702d3d9bae2fc423227db72b23c37f0"
+SRC_URI[md5sum] = "21836e43b13ad33bed9bd0ed391e5a6e"
+SRC_URI[sha256sum] = "e55dc2645487fb22938e8386b99eef6eb7aff43a246ce3e92488daf6ee46247a"
 
 inherit autotools useradd systemd pkgconfig
 
-- 
2.18.0


