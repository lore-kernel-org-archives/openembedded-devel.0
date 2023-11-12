Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E5DC4332F
	for <webhook@archiver.kernel.org>; Sun, 12 Nov 2023 18:10:43 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.20068.1699812638719918122
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 10:10:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=icMLvjSc;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-540c54944c4so7567911a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 10:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699812637; x=1700417437; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WJz+CFs3HzrOuJxKsqS5DG78NeR1dbYXEBBcFt54WU=;
        b=icMLvjScptdgxLq45/KeXR0sfQ0s0byMT4V/i4DufqS6ibxjYQnEHDZaUXHJgw5a2c
         JGBE7qur4UgH93V3XTQtOP3Jc3j8Mc77yMvAqjWMsjxIsHJ0dGOMAZ+VMWaGRq1M2D5E
         X6K+mCb4QYvk+M3md9tALWov+oJOR3oMGHHduU1glPI1hn5s80eqPTNM9qI2O5xmJqN1
         bwTjm9iGXlCtBkfDHk2Nl0COh5B6DPODwPCXGpUOdCpjsxggqPQohM/Csji9ctENIHlt
         hxED3BS8FAAeR1TplEPopMvlRMbI+WB9ZiCqnS3LcNT7/NBEBu4Yi4EhfN7bDJbblPfa
         Cvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699812637; x=1700417437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WJz+CFs3HzrOuJxKsqS5DG78NeR1dbYXEBBcFt54WU=;
        b=kBP3wD5vQJXbz0WW0+KWG+u5S1ELN80wl4h4DSHQ0s3r7aFlyQ2VHeFXGLhopeOOGq
         ylvus/J5EUHwsaqQ8O7J+B3u+R5I5XrAioFyDS+eqXxQCaja0kgVlglvfsxnMTfSgVM/
         JUe3rZBqFc1+WRoFA9aypnsxk2N+4crNDHKJEn3CXGLU8341niPYlifd9sEcAWyf1EsH
         +nmgaOg5nqbWGL03kISBn3ERVmwS7/oml6A7sm/P+LlqL5u+8xCWitgqqMICpEhEEz/d
         Q6jmm7D5cwk8WFxa/RSwmrjNNxMl/t9kKWESarPb9HlYnpmtc+7Y6Ttvng8TK2s72Nxz
         H4eQ==
X-Gm-Message-State: AOJu0YxH1lRGMScW/Wetuv+sUvkKO3kXDTrFC3ZHl2lbDe4V0pxMZuAU
	IrrrsU6q4P2zPF46/KdnLceer1F3yjsSAQ==
X-Google-Smtp-Source: AGHT+IHGqg7l+lCJvAjSap3owz4z2c90k6I/K77q/3sLd+kG+ZY8YMShLOaONSAhbDrtZCzONqXyRg==
X-Received: by 2002:a05:6402:7ca:b0:53e:e623:6a47 with SMTP id u10-20020a05640207ca00b0053ee6236a47mr4399277edy.4.1699812636379;
        Sun, 12 Nov 2023 10:10:36 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.238])
        by smtp.gmail.com with ESMTPSA id c7-20020aa7c987000000b00543525d9fddsm2529768edt.21.2023.11.12.10.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 10:10:35 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-multimedia][PATCH] tinyalsa: upgrade 1.1.1 -> 2.0.0
Date: Sun, 12 Nov 2023 21:10:28 +0300
Message-Id: <20231112181028.577133-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 18:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106598

- CMakeList.txt patch deleted because added to the new version.

Changelog:

* Miscellaneous bugs fixed.
* PCM plugin support.
* Add CMake build support.
* Add meson build support.
* tinyplay can now read from stdin.
* Improved versioning support for library.
* Improvements to pcm actions (prepare at open time and after overrun, etc.)
* Improvements/fixes to pcm_get_htimestamp().
* Fixes for the mixer percent functions.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 ...L_-path-instead-of-hardcoding-bin-li.patch | 46 -------------
 ...-compilation-error-caused-by-strncpy.patch | 69 +++++++++++++++++++
 .../{tinyalsa.bb => tinyalsa_2.0.0.bb}        |  7 +-
 3 files changed, 72 insertions(+), 50 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch
 create mode 100644 meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-fixed-compilation-error-caused-by-strncpy.patch
 rename meta-multimedia/recipes-multimedia/tinyalsa/{tinyalsa.bb => tinyalsa_2.0.0.bb} (71%)

diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch
deleted file mode 100644
index 6f9c39996..000000000
--- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From fe4f3c2a37a81201f463ff962364f014f50c9896 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 16 Dec 2019 22:58:41 -0800
-Subject: [PATCH] Use CMAKE_INSTALL_<path> instead of hardcoding bin/lib/
- install paths
-
-Helps fix build/packaging issues on machines where default libdir is not
-lib but say lib64
-
-Upstream-Status: Submitted [https://github.com/tinyalsa/tinyalsa/pull/143]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 14 +++++++++++---
- 1 file changed, 11 insertions(+), 3 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index cb31c58..1cc4a85 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -41,12 +41,20 @@ add_util("tinymix" "utils/tinymix.c")
- install(FILES ${HDRS}
-     DESTINATION "include/tinyalsa")
- 
-+if(NOT DEFINED CMAKE_INSTALL_LIBDIR)
-+    set(CMAKE_INSTALL_LIBDIR lib)
-+endif()
-+
-+if(NOT DEFINED CMAKE_INSTALL_BINDIR)
-+	set(CMAKE_INSTALL_BINDIR bin)
-+endif()
-+
- install(TARGETS "tinyalsa"
-                 "tinyplay"
-                 "tinycap"
-                 "tinymix"
-                 "tinypcminfo"
--    RUNTIME DESTINATION "bin"
--    ARCHIVE DESTINATION "lib"
--    LIBRARY DESTINATION "lib")
-+    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
-+    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
- 
--- 
-2.24.1
-
diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-fixed-compilation-error-caused-by-strncpy.patch b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-fixed-compilation-error-caused-by-strncpy.patch
new file mode 100644
index 000000000..64ebdb19c
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa/0001-fixed-compilation-error-caused-by-strncpy.patch
@@ -0,0 +1,69 @@
+From 639650dd64e483074dd7c3c7ea6dc1b1bd542743 Mon Sep 17 00:00:00 2001
+From: alperak <alperyasinak1@gmail.com>
+Date: Sun, 12 Nov 2023 20:16:55 +0300
+Subject: [PATCH] fixed compilation error caused by strncpy
+
+Issue:
+ https://github.com/tinyalsa/tinyalsa/issues/219
+
+Fix:
+ https://github.com/tinyalsa/tinyalsa/pull/220
+ https://github.com/tinyalsa/tinyalsa/pull/221
+
+Upstream-Status: Submitted
+
+Signed-off-by: alperak <alperyasinak1@gmail.com>
+---
+ src/mixer_plugin.c | 8 +++++---
+ src/pcm_plugin.c   | 9 ++++++---
+ 2 files changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/src/mixer_plugin.c b/src/mixer_plugin.c
+index 34117a9..f608563 100644
+--- a/src/mixer_plugin.c
++++ b/src/mixer_plugin.c
+@@ -82,7 +82,8 @@ static int mixer_plug_get_elem_id(struct mixer_plug_data *plug_data,
+     id->iface = ctl->iface;
+ 
+     strncpy((char *)id->name, (char *)ctl->name,
+-            sizeof(id->name));
++            sizeof(id->name) - 1);
++    ((char *)id->name)[sizeof(id->name) - 1] = '\0';
+ 
+     return 0;
+ }
+@@ -100,8 +101,9 @@ static int mixer_plug_info_enum(struct snd_control *ctl,
+ 
+     strncpy(einfo->value.enumerated.name,
+             val->texts[einfo->value.enumerated.item],
+-            sizeof(einfo->value.enumerated.name));
+-
++            sizeof(einfo->value.enumerated.name) - 1);
++    einfo->value.enumerated.name[sizeof(einfo->value.enumerated.name) - 1] = '\0';
++    
+     return 0;
+ }
+ 
+diff --git a/src/pcm_plugin.c b/src/pcm_plugin.c
+index 15bfc80..47bf4a5 100644
+--- a/src/pcm_plugin.c
++++ b/src/pcm_plugin.c
+@@ -153,9 +153,12 @@ static int pcm_plug_info(struct pcm_plug_data *plug_data,
+         return ret;
+     }
+ 
+-    strncpy((char *)info->id, name, sizeof(info->id));
+-    strncpy((char *)info->name, name, sizeof(info->name));
+-    strncpy((char *)info->subname, name, sizeof(info->subname));
++    strncpy((char *)info->id, name, sizeof(info->id) - 1);
++    ((char *)info->id)[sizeof(info->id) - 1] = '\0';
++    strncpy((char *)info->name, name, sizeof(info->name) - 1);
++    ((char *)info->name)[sizeof(info->name) - 1] = '\0';
++    strncpy((char *)info->subname, name, sizeof(info->subname) - 1);
++    ((char *)info->subname)[sizeof(info->subname) - 1] = '\0';
+ 
+     info->subdevices_count = 1;
+ 
+-- 
+2.25.1
+
diff --git a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
similarity index 71%
rename from meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
rename to meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
index 68cf8795a..e6f1be0e5 100644
--- a/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa.bb
+++ b/meta-multimedia/recipes-multimedia/tinyalsa/tinyalsa_2.0.0.bb
@@ -4,13 +4,12 @@ HOMEPAGE = "https://github.com/tinyalsa/tinyalsa"
 SECTION = "libs/multimedia"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://NOTICE;md5=dbdefe400d894b510a9de14813181d0b"
+LIC_FILES_CHKSUM = "file://NOTICE;md5=e04cd6fa58488e016f7fb648ebea1db4"
 
-SRCREV = "8449529c7e50f432091539ba7b438e79b04059b5"
+SRCREV = "1c5fb68ced57d838f2b7ecd0c00bc1fefc9ab60d"
 SRC_URI = "git://github.com/tinyalsa/tinyalsa;branch=master;protocol=https \
-           file://0001-Use-CMAKE_INSTALL_-path-instead-of-hardcoding-bin-li.patch \
+	   	    file://0001-fixed-compilation-error-caused-by-strncpy.patch \
           "
-PV = "1.1.1+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


