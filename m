Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8576EEC0495
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 18:03:33 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.544.1772561011278022766
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Mar 2026 10:03:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SPSSQCyi;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48378136adcso35714505e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 10:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772561010; x=1773165810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=R16xbHTm0GK09JiJrtu9F4fwLFZEb2RW73OrG8rFqi8=;
        b=SPSSQCyijVuYsUyIaXC/7Up5l+gPi306q7sSfCE3gicwkzI3sZGW0/ZZJ7I7gL8vXc
         dar5Fd0XlCxPWnwtuVGHDiv1XQo8zXFuI9Jh9h3comeGCfUeWiel400c5bqOSNIzRMeR
         gJQuum3pEhiRsDwR1w2wpc9a1pxXsjHcGIASiMdjZPFYHekGWQrhau7M+k2lSB7l3aiX
         /XuLPBIK0L2mmBPPDyeuolHzLSDPgHU2iyukGUesyW4oVo3tRHv625LdxxNylmXNxU2S
         ywKtQbu/7g8+JyEzBOj6K48SGF/xa7Z8z3SKhX0CQ+fA9ssdCBI3y61tRPgSXcvWtMHf
         MF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772561010; x=1773165810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R16xbHTm0GK09JiJrtu9F4fwLFZEb2RW73OrG8rFqi8=;
        b=tuDaNWtnIweeAKnkjOEg7/NvleFvR+XFM+UHMvnBT5RA49dKYBJEGC2r1rUiWidrhe
         Vu+Ro+BfO8IfNHn2nOrGbwACHyBLuDGR79saCON4irHgbdVxvGqFmYBRPvxd7YM5cIIb
         t+AXagIAqiuav4gOI6OPIaG/5aHfNe32ANptSZDGOqy6ys74NxWwTfIf9+gdjrUc/Bsw
         OrzYxPhbAOS+XeIbT6/GNZpF52cjkWNXgmtttFOG0KOMbuASy2H07CnxeRlkUZgd9JUY
         kBaaQT1UgOd7pSncFg4TRpOrHRRq0VmE1XTbLhtuAn2qowwx4jIkUHaCDf7zG1W5kA3N
         /8wg==
X-Gm-Message-State: AOJu0YyXjZf1JudNTRVqNuov4hdysCiH6/FxnPW0TYVkrOV5zwDmmIlq
	xH0kYQvmekhTmulQDDsnPCnpv657aCn2r0fARe3r+qkqW5BVpK95l/v9Z2jI9g==
X-Gm-Gg: ATEYQzxjl74QMEHzfn9JpPXCeCbkawGZz3KK/Jsgxsn6Ajav3v9qQtgH0TEhHgtsnxC
	Ma88UV+GFrg/xDC/H579fHisghTdhDhQ/syzO5yq9dBHlydN+aUfiteLAbOzla+KhNje9gJ1T4L
	BNurYVOzyWnhM9JMUHK16ITQKpGSkK6PUblptz9r3ixdxCBrNaJm3nPNf60tESqHFEHSIe9RSLK
	+mYbIE/anoDrjDYgMjTMuqawukoymF5Ph9vzEWhW3Kjppo0Ug2U+E+ndbTaV+NFhFj3p2F3gEkE
	r1fmDu7cVQpttzm0hPOtZhlEI+QJTpxMXURyT8lnkz14ljEWBfnTikDuJj87TQqThc7aGnLyPOK
	L7mjMNPjxGgihFeuwCAdGwaVHLoUf1i09Ep4H9XJF3uKbCSIn4mHwYqiw0CJ++RE5zb6kbSEDeN
	/8DaIB/ijy8W5PE2n07KH2
X-Received: by 2002:a05:600c:4e89:b0:47d:25ac:3a94 with SMTP id 5b1f17b1804b1-483c9bff799mr281729455e9.17.1772561009213;
        Tue, 03 Mar 2026 10:03:29 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851336656dsm32794105e9.8.2026.03.03.10.03.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 10:03:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] hplip: upgrade 3.22.10 -> 3.25.8
Date: Tue,  3 Mar 2026 19:03:26 +0100
Message-ID: <20260303180326.2093901-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 18:03:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124834

Contains fix for CVE-2025-43023, and support for many new printers.

Drop patches that are included in this release (or the underlying problem
was solved on another way)

Changelog: https://developers.hp.com/hp-linux-imaging-and-printing/release_notes

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...tils-Include-string.h-for-strcasestr.patch | 27 +++-----
 ...fine-missing-prototype-for-functions.patch | 33 +++++-----
 ...-Add-printf-format-to-snprintf-calls.patch | 64 -------------------
 .../hplip/hplip/configure.patch               |  2 +-
 .../hplip/hplip/hplip-3.19.6-fix-return.patch | 22 -------
 .../{hplip_3.22.10.bb => hplip_3.25.8.bb}     | 11 +++-
 6 files changed, 35 insertions(+), 124 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/hplip/hplip/0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch
 delete mode 100644 meta-oe/recipes-extended/hplip/hplip/hplip-3.19.6-fix-return.patch
 rename meta-oe/recipes-extended/hplip/{hplip_3.22.10.bb => hplip_3.25.8.bb} (86%)

diff --git a/meta-oe/recipes-extended/hplip/hplip/0001-common-utils-Include-string.h-for-strcasestr.patch b/meta-oe/recipes-extended/hplip/hplip/0001-common-utils-Include-string.h-for-strcasestr.patch
index 659eca41c9..1457fc62c8 100644
--- a/meta-oe/recipes-extended/hplip/hplip/0001-common-utils-Include-string.h-for-strcasestr.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/0001-common-utils-Include-string.h-for-strcasestr.patch
@@ -7,38 +7,29 @@ Also define _GNU_SOURCE for the same
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Rebased for latest version. string.h is included already, left
+only the _GNU_SOURCE definition.
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
 ---
  common/utils.c | 2 ++
  1 file changed, 2 insertions(+)
 
 --- a/common/utils.c
 +++ b/common/utils.c
-@@ -1,9 +1,11 @@
+@@ -1,3 +1,4 @@
 +#define _GNU_SOURCE
  #include "utils.h"
  #include "string.h"
  #include <dlfcn.h>
- #include <sys/stat.h>
- #include <errno.h>
- #include <stdlib.h>
-+#include <string.h> /* strcasestr */
- 
- extern int errno;
- 
 --- a/protocol/hp_ipp.c
 +++ b/protocol/hp_ipp.c
-@@ -18,12 +18,13 @@ Boston, MA 02110-1301, USA.
- 
+@@ -18,6 +18,7 @@ Boston, MA 02110-1301, USA.
+
  \******************************************************************************/
- 
--
+
 +#define _GNU_SOURCE
  #include <cups/cups.h>
  #include <cups/language.h>
  #include <cups/ppd.h>
- #include <syslog.h>
- #include <stdarg.h>
-+#include <string.h> /* strcasecmp */
- #include <sys/types.h>
- #include <pwd.h>
- #include <sys/stat.h> 
diff --git a/meta-oe/recipes-extended/hplip/hplip/0004-Define-missing-prototype-for-functions.patch b/meta-oe/recipes-extended/hplip/hplip/0004-Define-missing-prototype-for-functions.patch
index 7223bf939e..b17d8ec8fd 100644
--- a/meta-oe/recipes-extended/hplip/hplip/0004-Define-missing-prototype-for-functions.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/0004-Define-missing-prototype-for-functions.patch
@@ -13,18 +13,19 @@ Upstream-Status: Pending
 
 --- a/prnt/cupsext/cupsext.c
 +++ b/prnt/cupsext/cupsext.c
-@@ -101,6 +101,11 @@ typedef int Py_ssize_t;
+@@ -99,6 +99,12 @@ typedef int Py_ssize_t;
  #define _STRINGIZE(x) #x
  #define STRINGIZE(x) _STRINGIZE(x)
- 
+
 +void _releaseCupsInstance(void);
 +int addCupsPrinter(char *name, char *device_uri, char *location, char *ppd_file, char *model, char *info);
 +int setDefaultCupsPrinter(char *pr_name);
 +int delCupsPrinter(char *pr_name);
 +int controlCupsPrinter(char *pr_name, int op);
- 
- //static http_t * http = NULL;     /* HTTP object */
- 
++
+ // static http_t * http = NULL;     /* HTTP object */
+
+ PyObject *releaseCupsInstance(PyObject *self, PyObject *args)
 --- a/protocol/hp_ipp.c
 +++ b/protocol/hp_ipp.c
 @@ -22,6 +22,7 @@ Boston, MA 02110-1301, USA.
@@ -34,20 +35,20 @@ Upstream-Status: Pending
 +#include <stdio.h>
  #include <syslog.h>
  #include <stdarg.h>
- #include <string.h> /* strcasecmp */
-@@ -42,7 +43,7 @@ Boston, MA 02110-1301, USA.
- #define STRINGIZE(x) _STRINGIZE(x)
- 
- 
--http_t* acquireCupsInstance()
-+http_t* acquireCupsInstance(void)
+ #include <sys/types.h>
+@@ -45,7 +46,7 @@ Boston, MA 02110-1301, USA.
+ 		dst[size - 1] = '\0'; \
+     } while (0)
+
+-http_t *acquireCupsInstance()
++http_t *acquireCupsInstance(void)
  {
-     if ( http == NULL)
+     if (http == NULL)
      {
-@@ -53,7 +54,7 @@ http_t* acquireCupsInstance()
+@@ -55,7 +56,7 @@ http_t* acquireCupsInstance()
+     return http;
  }
- 
- 
+
 -void _releaseCupsInstance()
 +void _releaseCupsInstance(void)
  {
diff --git a/meta-oe/recipes-extended/hplip/hplip/0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch b/meta-oe/recipes-extended/hplip/hplip/0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch
deleted file mode 100644
index ac0ff81e6f..0000000000
--- a/meta-oe/recipes-extended/hplip/hplip/0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 4b3014df3990d90d6929510f2bde073171503329 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 2 Sep 2022 18:18:44 -0700
-Subject: [PATCH] hp_ipp.c: Add printf format to snprintf calls
-
-Avoid -Wformat warnings
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- protocol/hp_ipp.c | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/protocol/hp_ipp.c b/protocol/hp_ipp.c
-index 597d9b9..a027baf 100644
---- a/protocol/hp_ipp.c
-+++ b/protocol/hp_ipp.c
-@@ -112,7 +112,7 @@ int addCupsPrinter(char *name, char *device_uri, char *location, char *ppd_file,
-      }
- 
-      if ( info == NULL )
--        snprintf( info,sizeof(info), name );
-+        snprintf( info,sizeof(info), "%s", name );
- 
-      sprintf( printer_uri, "ipp://localhost/printers/%s", name );
- 
-@@ -513,27 +513,27 @@ int __parsePrinterAttributes(ipp_t *response, printer_t **printer_list)
- 
-              if ( strcmp(attr_name, "printer-name") == 0 &&
-                                         val_tag == IPP_TAG_NAME ) {
--                  snprintf(t_printer->name, sizeof(t_printer->name),ippGetString(attr, 0, NULL) );
-+                  snprintf(t_printer->name, sizeof(t_printer->name), "%s", ippGetString(attr, 0, NULL) );
-              }
-              else if ( strcmp(attr_name, "device-uri") == 0 &&
-                                          val_tag == IPP_TAG_URI ) {
--                  snprintf(t_printer->device_uri,sizeof(t_printer->device_uri), ippGetString(attr, 0, NULL) );
-+                  snprintf(t_printer->device_uri,sizeof(t_printer->device_uri), "%s", ippGetString(attr, 0, NULL) );
-              }
-              else if ( strcmp(attr_name, "printer-uri-supported") == 0 &&
-                                                  val_tag == IPP_TAG_URI ) {
--                  snprintf(t_printer->printer_uri,sizeof(t_printer->printer_uri), ippGetString(attr, 0, NULL) );
-+                  snprintf(t_printer->printer_uri,sizeof(t_printer->printer_uri), "%s", ippGetString(attr, 0, NULL) );
-              }
-              else if ( strcmp(attr_name, "printer-info") == 0 &&
-                                         val_tag == IPP_TAG_TEXT ) {
--                  snprintf(t_printer->info,sizeof(t_printer->info), ippGetString(attr, 0, NULL) );
-+                  snprintf(t_printer->info,sizeof(t_printer->info), "%s", ippGetString(attr, 0, NULL) );
-              }
-              else if ( strcmp(attr_name, "printer-location") == 0 &&
-                                            val_tag == IPP_TAG_TEXT ) {
--                  snprintf(t_printer->location,sizeof(t_printer->location),ippGetString(attr, 0, NULL) );
-+                  snprintf(t_printer->location,sizeof(t_printer->location), "%s", ippGetString(attr, 0, NULL) );
-              }
-              else if ( strcmp(attr_name, "printer-make-and-model") == 0 &&
-                                                   val_tag == IPP_TAG_TEXT ) {
--                  snprintf(t_printer->make_model,sizeof(t_printer->make_model),ippGetString(attr, 0, NULL) );
-+                  snprintf(t_printer->make_model,sizeof(t_printer->make_model), "%s", ippGetString(attr, 0, NULL) );
-              } 
-              else if ( strcmp(attr_name, "printer-state") == 0 &&
-                                              val_tag == IPP_TAG_ENUM ) {
--- 
-2.37.3
-
diff --git a/meta-oe/recipes-extended/hplip/hplip/configure.patch b/meta-oe/recipes-extended/hplip/hplip/configure.patch
index 0e0fd47fa1..9dad089ff1 100644
--- a/meta-oe/recipes-extended/hplip/hplip/configure.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/configure.patch
@@ -3,7 +3,7 @@ Upstream-Status: Pending
 --- a/configure.in
 +++ b/configure.in
 @@ -30,7 +30,7 @@
- AC_INIT([HP Linux Imaging and Printing], [3.22.10], [3.22.10], [hplip])
+ AC_INIT([HP Linux Imaging and Printing], [3.25.8], [3.25.8], [hplip])
  
  #AM_INIT_AUTOMAKE([1.9 foreign])
 -AM_INIT_AUTOMAKE
diff --git a/meta-oe/recipes-extended/hplip/hplip/hplip-3.19.6-fix-return.patch b/meta-oe/recipes-extended/hplip/hplip/hplip-3.19.6-fix-return.patch
deleted file mode 100644
index 45b25c5e76..0000000000
--- a/meta-oe/recipes-extended/hplip/hplip/hplip-3.19.6-fix-return.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 2fcd0e79b21ec6dbf975ad7d1b5697a78993e2f1 Mon Sep 17 00:00:00 2001
-From: David Valleau <valleau@chromium.org>
-Date: Wed, 14 Aug 2019 15:47:38 -0700
-Subject: [PATCH] Fixing invalid return in void function
-
----
-Upstream-Status: Pending
-
- prnt/hpps/hppsfilter.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/prnt/hpps/hppsfilter.c
-+++ b/prnt/hpps/hppsfilter.c
-@@ -104,7 +104,7 @@ static void open_tempbookletfile(char *m
-     if(ptempbooklet_file == NULL)
-     {
-             fprintf(stderr, "ERROR: Unable to open temp file %s\n", temp_filename);
--            return 1;
-+            return;
-     }  
-     chmod(temp_filename, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
- 
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb b/meta-oe/recipes-extended/hplip/hplip_3.25.8.bb
similarity index 86%
rename from meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
rename to meta-oe/recipes-extended/hplip/hplip_3.25.8.bb
index 2b53d19f9f..3b5f58f320 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.22.10.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.25.8.bb
@@ -8,17 +8,15 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://600-fix.patch \
            file://030-replace_unsafe_memcpy_with_memmove.patch \
            file://050-fix-glibcisms.patch \
-           file://hplip-3.19.6-fix-return.patch \
            file://0001-common-utils-Include-string.h-for-strcasestr.patch \
            file://0002-Add-ImageProcessor-only-when-DISBALE_IMAGEPROCESSOR_.patch \
            file://0003-pserror.c-Define-column-to-be-int-explcitly.patch \
            file://0004-Define-missing-prototype-for-functions.patch \
-           file://0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch \
            file://0006-Workaround-patch-for-missing-Python3-transition-of-t.patch \
            file://0001-Fix-installing-ipp-usb-quirk.patch \
            file://0001-Drop-using-register-storage-classifier.patch \
            file://0001-Fix-upstream-CFLAGS-override.patch"
-SRC_URI[sha256sum] = "533c3f2f6b53e4163ded4fd81d1f11ae6162a0f6451bd5e62a8382d0c1366624"
+SRC_URI[sha256sum] = "1cf6d6c28735435c8eb6646e83bcfb721e51c4b1f0e8cf9105a6faf96dc9ad25"
 
 CVE_PRODUCT = "hplip linux_imaging_and_printing"
 
@@ -51,6 +49,13 @@ EXTRA_OECONF += "\
 
 EXTRA_OEMAKE = "rulessystemdir=${systemd_unitdir}/system/"
 
+do_configure:prepend() {
+    # If not set directly, it determines the absolute path of site-packages dir in recipe-sysroot,
+    # and then it installs the python libraries into a folder in ${D} that was constructed from
+    # that path, instead of using the correct ${PYTHON_SITEPACKAGES_DIR}.
+    sed -i 's,^\(   PYTHONEXECDIR=\).*,\1"${PYTHON_SITEPACKAGES_DIR}",' configure.in
+}
+
 do_install:append() {
     rm -rf ${D}${datadir}/hplip/upgrade.py
     rm -rf ${D}${datadir}/hplip/uninstall.py

