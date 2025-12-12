Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FF8D4414A
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 08:41:02 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8647.1765528861772211144
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 00:41:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b5NRsROc;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-34b75fba315so3317a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 00:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765528861; x=1766133661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T+pay4D0XMKs8hkHsQ+r/FuOdIbVO1H8aC/wjBJ3Hus=;
        b=b5NRsROc/HsOwu/Ur4nnYq2hwFelTs2c69EqePyxxdATLiUDjxou8VWOzB85OOpHcN
         ZSqg9RNNHmgxHFRZDyITk3gkej/yGiy+p5Mph85PVpmIkwspQweYE5a+ftluZh+X679e
         i8PLjsINLmcQ08CHwWOYTnEhy6Gkbss9zsejIr2jjWpbORHi/PNfsvnGQyayxreiondo
         IWRryqgGmLDIcRYU0AaEDA/GFQyJSOUAefca4r1CiwX+132yoRRLJ+B60PNv13Z5jsna
         0kd4BlhkG4uCdeLVUnoH9w20ZqfDkSxd6hM2NR4vYiQ4m3n4Bo50jwEo/3be51BtXJln
         VVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765528861; x=1766133661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+pay4D0XMKs8hkHsQ+r/FuOdIbVO1H8aC/wjBJ3Hus=;
        b=hGAYHjpx/QF7K/iBJdY54QpEitSAAOwS6PpyvbsjngcmK40DcXv1z15a7aBCPZM5M8
         aXGXdTvXUJ1CdBV+fjqzvFrc70kQK6plURUIX7YYVDkVuQXRZ0pUraKjOIWfE/cGlrH4
         aOKqSizsCE1xr2St5kGI/VtXS7Y61eMor9KzZESnJI0CgqWF9mDJuRifjO74jGnqfboi
         wkL/NzCKTz8Jsqn7nHxN9eNxQzXLdRrd+ZGh6gAbWzBmmlsJIpJO8Ww74+80avyro7Z6
         le2f3do7kJoULA1T/oDbSVZJju/McATeY9be44ToeqexUfqHXtiVz2GnL/e/LnqHOwlJ
         nYbA==
X-Gm-Message-State: AOJu0YztfrVsRRslYQJA8nfq7Ksq+gUXwvDjHtfEst28psGGD4+JG0/9
	vdP0H/fvhbi5l6uv2yBOFB/8bA0BLRtUcIZ/MKx0kDB4vA5MTty3EpbKJFZz7Ay9
X-Gm-Gg: AY/fxX4SKVBMnhnSYxCmcmh28vJRd/Hysc202riIwfAV5EAi9KGvpOIaiuZB9HTbWqY
	O3SgxTg3uCp9G+TU407vEuLkLb5IURlakAHhDMB+UqbBg1W9fiEKBWpO+WBRqupkoCPq+HJrwcu
	H3InXXisOldGUXstWXUPC4L/W7M33PSAvcwjreSZ1boD0OIsUxTNf70ix5IQOB7QdhoMNW41u9Q
	UM22N4iLdh9WMcudnAPl79wa80y4qJdbCIlid0vGDZLFfmplsNBxAXh5Tm3HL1CTgMQ5GNQfLlK
	0D3Yv6Np+2x4c8qMtFRD7QlycWmD03B1tYsyB1BvLA4Lag1p9H3FhB5liXhRBMRvTiT5WguLBjK
	iDMhn+vRNTwVKEgaSJJWkvmnf4HPGFajTNnhlFcoemb7HCxtO7fAdOwlCl0vEZG87SpVFEGT+w3
	cu/NPmv7Gy+fAx5oVYaocfPnDx10oGUvKCtPLbU4nFSow3k0n6Mt9WJzXivPOv44kZDl2xQdhSu
	r1TFZdppsWBfhk0wxbHXxP020YdZyb0
X-Google-Smtp-Source: AGHT+IESnLupxYyMld04zm0kDyt3MlnJDzaN93mFU0sIipu6szyI4Sa1PSphweItsAgzqpH/3aFbkA==
X-Received: by 2002:a05:7022:a87:b0:11e:3e9:3e8b with SMTP id a92af1059eb24-11f354f5679mr852201c88.50.1765528860546;
        Fri, 12 Dec 2025 00:41:00 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e2b4bb8sm12369685c88.7.2025.12.12.00.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 00:41:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] spandsp: Update to tip of trunk
Date: Fri, 12 Dec 2025 00:40:56 -0800
Message-ID: <20251212084057.3903056-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 08:41:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122597

New clang needs fixes which are in upstream tip, secondly
refresh the patches to work with latest code

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-manual-search-for-libxml-by-AC_CHE.patch} | 20 +++----
 ...PROG_CC_FOR_BUILD-for-cross-compili.patch} | 56 +++++++++----------
 .../recipes-multimedia/spandsp/spandsp_git.bb |  7 +--
 3 files changed, 39 insertions(+), 44 deletions(-)
 rename meta-multimedia/recipes-multimedia/spandsp/spandsp/{configure.patch => 0001-configure-Replace-manual-search-for-libxml-by-AC_CHE.patch} (84%)
 rename meta-multimedia/recipes-multimedia/spandsp/spandsp/{makefile.patch => 0002-configure-Use-AX_PROG_CC_FOR_BUILD-for-cross-compili.patch} (91%)

diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp/configure.patch b/meta-multimedia/recipes-multimedia/spandsp/spandsp/0001-configure-Replace-manual-search-for-libxml-by-AC_CHE.patch
similarity index 84%
rename from meta-multimedia/recipes-multimedia/spandsp/spandsp/configure.patch
rename to meta-multimedia/recipes-multimedia/spandsp/spandsp/0001-configure-Replace-manual-search-for-libxml-by-AC_CHE.patch
index af504be766..a2ad962e7e 100644
--- a/meta-multimedia/recipes-multimedia/spandsp/spandsp/configure.patch
+++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp/0001-configure-Replace-manual-search-for-libxml-by-AC_CHE.patch
@@ -1,6 +1,7 @@
+From 62791a5d2532644c401060b6d49c84bee83f953c Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
 Date: Thu, 14 Mar 2024 09:41:57 +0100
-Subject: [PATCH 2/2] configure: Replace manual search for libxml by
+Subject: [PATCH 1/2] configure: Replace manual search for libxml by
  AC_CHECK_LIB
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -9,22 +10,20 @@ Content-Transfer-Encoding: 8bit
 The manual search fails if the include directories (and build environment)
 are located somewhere else.

+Upstream-Status: Submitted [https://github.com/freeswitch/spandsp/pull/109]
 Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
-Upstream-Status: Submitted [https://github.com/freeswitch/spandsp/pull/74]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
-
-ERROR: spandsp-3.0.0+git-r0 do_configure: QA Issue: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.
-
  configure.ac | 22 +++++-----------------
  1 file changed, 5 insertions(+), 17 deletions(-)

 diff --git a/configure.ac b/configure.ac
-index 2140837..b5138d6 100644
+index fa87245..bc40690 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -185,23 +185,11 @@ then
+@@ -232,23 +232,11 @@ then
  fi
-
+
  # Determine XML2 include path
 -AC_MSG_CHECKING(for libxml/xmlmemory.h)
 -
@@ -49,8 +48,5 @@ index 2140837..b5138d6 100644
 +else
 +    AC_MSG_WARN([libxml2 not found. Disabling cache.])
  fi
-
- AC_CHECK_HEADERS([libxml/xmlmemory.h])
---
-2.34.1

+ AC_CHECK_HEADERS([libxml/xmlmemory.h])
diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp/makefile.patch b/meta-multimedia/recipes-multimedia/spandsp/spandsp/0002-configure-Use-AX_PROG_CC_FOR_BUILD-for-cross-compili.patch
similarity index 91%
rename from meta-multimedia/recipes-multimedia/spandsp/spandsp/makefile.patch
rename to meta-multimedia/recipes-multimedia/spandsp/spandsp/0002-configure-Use-AX_PROG_CC_FOR_BUILD-for-cross-compili.patch
index d3eb047fe5..385ed1e44d 100644
--- a/meta-multimedia/recipes-multimedia/spandsp/spandsp/makefile.patch
+++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp/0002-configure-Use-AX_PROG_CC_FOR_BUILD-for-cross-compili.patch
@@ -1,6 +1,7 @@
+From 778a2e6ac9c5d643d236b854e53f4a71d525df57 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
 Date: Thu, 14 Mar 2024 08:08:13 +0100
-Subject: [PATCH 1/2] configure: Use AX_PROG_CC_FOR_BUILD for cross compiling
+Subject: [PATCH 2/2] configure: Use AX_PROG_CC_FOR_BUILD for cross compiling
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -12,21 +13,23 @@ time.
 [1]: https://www.gnu.org/software/autoconf-archive/ax_prog_cc_for_build.html
 [2]: https://stackoverflow.com/questions/24201260/autotools-cross-compilation-and-generated-sources/24208587#24208587

+Upstream-Status: Submitted [https://github.com/freeswitch/spandsp/pull/109]
+
 Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
-Upstream-Status: Submitted [https://github.com/freeswitch/spandsp/pull/74]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  configure.ac    | 49 +-------------------------------------------
  src/Makefile.am | 54 +++++++++++++++++++++++++------------------------
  2 files changed, 29 insertions(+), 74 deletions(-)

 diff --git a/configure.ac b/configure.ac
-index 96fd022..2140837 100644
+index bc40690..62310b4 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -55,54 +55,7 @@ AC_LANG([C])
-
+
  AX_COMPILER_VENDOR
-
+
 -if test "${build}" != "${host}"
 -then
 -    # If we are doing a Canadian Cross, in which the host and build systems
@@ -76,76 +79,76 @@ index 96fd022..2140837 100644
 -    CXXFLAGS=${CXXFLAGS-"-g -O2"}
 -fi
 +AX_PROG_CC_FOR_BUILD
-
+
  AC_DEFUN([REMOVE_FROM_VAR],[
      new_val=""
 diff --git a/src/Makefile.am b/src/Makefile.am
-index e05fad5..9b409a1 100644
+index f5c7cc9..d0706dd 100644
 --- a/src/Makefile.am
 +++ b/src/Makefile.am
-@@ -386,44 +386,46 @@ noinst_HEADERS = cielab_luts.h \
+@@ -394,44 +394,46 @@ noinst_HEADERS = cielab_luts.h \
                   v34_tx_pre_emphasis_filters.h \
                   v34_tables.h
-
+
 -make_at_dictionary$(EXEEXT): $(top_srcdir)/src/make_at_dictionary.c
 -	$(CC_FOR_BUILD) -o make_at_dictionary$(EXEEXT) $(top_srcdir)/src/make_at_dictionary.c -DHAVE_CONFIG_H -I$(top_builddir)/src
 +LINK_FOR_BUILD.c = $(CC_FOR_BUILD) -DHAVE_CONFIG_H -I$(top_builddir)/src $(CFLAGS_FOR_BUILD) $(CPPFLAGS_FOR_BUILD) $(LDFLAGS_FOR_BUILD) $(TARGET_ARCH_FOR_BUILD)
-
+
 -make_cielab_luts$(EXEEXT): $(top_srcdir)/src/make_cielab_luts.c
 -	$(CC_FOR_BUILD) -o make_cielab_luts$(EXEEXT) $(top_srcdir)/src/make_cielab_luts.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
 +make_at_dictionary$(BUILD_EXEEXT): $(top_srcdir)/src/make_at_dictionary.c
 +	$(LINK_FOR_BUILD.c) -o $@ $^
-
+
 -make_math_fixed_tables$(EXEEXT): $(top_srcdir)/src/make_math_fixed_tables.c
 -	$(CC_FOR_BUILD) -o make_math_fixed_tables$(EXEEXT) $(top_srcdir)/src/make_math_fixed_tables.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
 +make_cielab_luts$(BUILD_EXEEXT): $(top_srcdir)/src/make_cielab_luts.c
 +	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
-
+
 -make_modem_filter$(EXEEXT): $(top_srcdir)/src/make_modem_filter.c $(top_srcdir)/src/filter_tools.c
 -	$(CC_FOR_BUILD) -o make_modem_filter$(EXEEXT) $(top_srcdir)/src/make_modem_filter.c $(top_srcdir)/src/filter_tools.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
 +make_math_fixed_tables$(BUILD_EXEEXT): $(top_srcdir)/src/make_math_fixed_tables.c
 +	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
-
--make_modem_godard_coefficients$(EXEEXT): $(top_srcdir)/src/make_modem_godard_coefficients.c $(top_srcdir)/src/filter_tools.c
--	$(CC_FOR_BUILD) -o make_modem_godard_coefficients$(EXEEXT) $(top_srcdir)/src/make_modem_godard_coefficients.c $(top_srcdir)/src/filter_tools.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
+
+-make_modem_godard_descriptor$(EXEEXT): $(top_srcdir)/src/make_modem_godard_descriptor.c $(top_srcdir)/src/filter_tools.c
+-	$(CC_FOR_BUILD) -o make_modem_godard_descriptor$(EXEEXT) $(top_srcdir)/src/make_modem_godard_descriptor.c $(top_srcdir)/src/filter_tools.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
 +make_modem_filter$(BUILD_EXEEXT): $(top_srcdir)/src/make_modem_filter.c $(top_srcdir)/src/filter_tools.c
 +	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
-
+
 -make_t43_gray_code_tables$(EXEEXT): $(top_srcdir)/src/make_t43_gray_code_tables.c
 -	$(CC_FOR_BUILD) -o make_t43_gray_code_tables$(EXEEXT) $(top_srcdir)/src/make_t43_gray_code_tables.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
-+make_modem_godard_coefficients$(BUILD_EXEEXT): $(top_srcdir)/src/make_modem_godard_coefficients.c $(top_srcdir)/src/filter_tools.c
++make_modem_godard_descriptor$(BUILD_EXEEXT): $(top_srcdir)/src/make_modem_godard_descriptor.c $(top_srcdir)/src/filter_tools.c
 +	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
-
+
 -make_v17_v32_constellation_map$(EXEEXT): $(top_srcdir)/src/make_v17_v32_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
 -	$(CC_FOR_BUILD) -o make_v17_v32_constellation_map$(EXEEXT) $(top_srcdir)/src/make_v17_v32_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
 +make_t43_gray_code_tables$(BUILD_EXEEXT): $(top_srcdir)/src/make_t43_gray_code_tables.c
 +	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
-
+
 -make_v17_v32_convolutional_encoder$(EXEEXT): $(top_srcdir)/src/make_v17_v32_convolutional_encoder.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
 -	$(CC_FOR_BUILD) -o make_v17_v32_convolutional_encoder$(EXEEXT) $(top_srcdir)/src/make_v17_v32_convolutional_encoder.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
 +make_v17_v32_constellation_map$(BUILD_EXEEXT): $(top_srcdir)/src/make_v17_v32_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
 +	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
-
+
 -make_v29_constellation_map$(EXEEXT): $(top_srcdir)/src/make_v29_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
 -	$(CC_FOR_BUILD) -o make_v29_constellation_map$(EXEEXT) $(top_srcdir)/src/make_v29_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
 +make_v17_v32_convolutional_encoder$(BUILD_EXEEXT): $(top_srcdir)/src/make_v17_v32_convolutional_encoder.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
 +	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
-
+
 -make_v34_convolutional_coders$(EXEEXT): $(top_srcdir)/src/make_v34_convolutional_coders.c
 -	$(CC_FOR_BUILD) -o make_v34_convolutional_coders$(EXEEXT) $(top_srcdir)/src/make_v34_convolutional_coders.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
 +make_v29_constellation_map$(BUILD_EXEEXT): $(top_srcdir)/src/make_v29_constellation_map.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
 +	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
-
+
 -make_v34_probe_signals$(EXEEXT): $(top_srcdir)/src/make_v34_probe_signals.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
 -	$(CC_FOR_BUILD) -o make_v34_probe_signals$(EXEEXT) $(top_srcdir)/src/make_v34_probe_signals.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c -DHAVE_CONFIG_H -I$(top_builddir)/src -lm
 +make_v34_convolutional_coders$(BUILD_EXEEXT): $(top_srcdir)/src/make_v34_convolutional_coders.c
 +	$(LINK_FOR_BUILD.c) -o $@ $^ -lm
-
+
 -make_v34_shell_map$(EXEEXT): $(top_srcdir)/src/make_v34_shell_map.c
 -	$(CC_FOR_BUILD) -o make_v34_shell_map$(EXEEXT) $(top_srcdir)/src/make_v34_shell_map.c -DHAVE_CONFIG_H -I$(top_builddir)/src
 +make_v34_probe_signals$(BUILD_EXEEXT): $(top_srcdir)/src/make_v34_probe_signals.c $(top_srcdir)/src/g711.c $(top_srcdir)/src/alloc.c
 +	$(LINK_FOR_BUILD.c) -o $@ $^ -I$(top_srcdir)/src -lm
-
+
 -make_v34_tx_pre_emphasis_filters$(EXEEXT): $(top_srcdir)/src/make_v34_tx_pre_emphasis_filters.c $(top_srcdir)/tools/meteor-engine.c
 -	$(CC_FOR_BUILD) -o make_v34_tx_pre_emphasis_filters$(EXEEXT) $(top_srcdir)/src/make_v34_tx_pre_emphasis_filters.c $(top_srcdir)/tools/meteor-engine.c -DHAVE_CONFIG_H -I$(top_builddir)/src -I$(top_builddir)/tools -lm
 +make_v34_shell_map$(BUILD_EXEEXT): $(top_srcdir)/src/make_v34_shell_map.c
@@ -153,9 +156,6 @@ index e05fad5..9b409a1 100644
 +
 +make_v34_tx_pre_emphasis_filters$(BUILD_EXEEXT): $(top_srcdir)/src/make_v34_tx_pre_emphasis_filters.c $(top_srcdir)/tools/meteor-engine.c
 +	$(LINK_FOR_BUILD.c) -o $@ $^ -I$(top_srcdir)/tools -lm
-
+
  # We need to run make_at_dictionary, so it generates the
  # at_interpreter_dictionary.h file
---
-2.34.1
-
diff --git a/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb b/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
index 9993837f19..a176874bba 100644
--- a/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
+++ b/meta-multimedia/recipes-multimedia/spandsp/spandsp_git.bb
@@ -20,14 +20,13 @@ PV = "3.0.0+git"

 SRC_URI = "\
     git://github.com/freeswitch/spandsp.git;protocol=https;branch=master \
-    file://configure.patch \
-    file://makefile.patch \
+    file://0001-configure-Replace-manual-search-for-libxml-by-AC_CHE.patch \
+    file://0002-configure-Use-AX_PROG_CC_FOR_BUILD-for-cross-compili.patch \
 "
 # Fails to build with Clang since 5394b2cae6c482ccb835335b769469977e6802ae
 # https://github.com/freeswitch/spandsp/issues/67
 # https://lists.openembedded.org/g/openembedded-devel/message/109325
-SRCREV = "df1282eb9af538ab1aadb6d66146e258451d4fe4"
-
+SRCREV = "797760168945c96e91af55bde9d4edaea2e654f9"

 inherit autotools


