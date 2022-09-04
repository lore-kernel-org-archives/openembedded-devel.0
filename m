Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98EA7C6FA89
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:04 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.11284.1662276902992911181
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FEmQvbLo;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id b144so1088760pfb.7
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Wj4GFYkIs3etjEyxvZskPYig+khyK7wDnk+D3OEB9Xk=;
        b=FEmQvbLoGBqytEFeLJrEbN/uqcVrOLxBF9yitqbN0g4Ii4N1g0+F4QXT9XnjMzDmjO
         RA1afg6j5RCtwijjHWC5RsLrjsYBpCZpsHhoDlGQDcByxUgPWC5DOdnyAuYm7WMtBBDM
         yYve2zG4pyMd8ozHd29YN9P5aUy8MZLmj0fqHISAcNiSDhi/qWqDmb1bLuzffwlShMqj
         YQ+DD/51pD1OArOf3v8sPUZU/MOBPD37aslt2G5aiINNIvwE4ptpUFuBwTvQh6IijLXu
         j+tqtrVObhu1g+Cg2hDEtg+mrkdO5oqX6hhaIP9jXGYGpRejTCCRvlrPSrsQho6mWfpw
         Qdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Wj4GFYkIs3etjEyxvZskPYig+khyK7wDnk+D3OEB9Xk=;
        b=cDkeXKMnScovpxM095YHg89SK8Njq7r00kMrW1ljafawf9BIP7yj+PfbYDi8U7Ac42
         sYRxSLFYz1SwhignNnWe2qmC2jG4asmQ8Oc8MiqDQHMWERUS8sV1PMswSSG8pyoslb7v
         5VaaF0LXgPpqqyWuBUtZULcuQ2gLs3bKeBdAE2jn93ETEj/qwWmrxOIX0owOHuOTFGpX
         bMfzmuQZCXGVjc8hfQUv8o6/JcJ6H84UjZQeTiM9/qDQza0wri/TZDfipR3FiBQFwAD2
         w9PPhxCQoY3L53eRnLZwIuxM8SexQAV8iSEk3v8i0dXqDksgjJo4VVdCsb5HJFjnTOwY
         CRdw==
X-Gm-Message-State: ACgBeo3ZjGudRCDrkhvbINJJeHY93dVmSoTLARDy0ixuvIWxzTTBVIOS
	oap0BhNQtfIWI/cxxXX8pG3xnsj9g0KHfg==
X-Google-Smtp-Source: 
 AA6agR7OJzkHxr99CXQQtN5bMNZ9L6PE1moGBGEblFsjQx8XdrYaJRE5vUfgQyPl4mn08zEfJrMRXA==
X-Received: by 2002:aa7:888d:0:b0:538:328b:2ffb with SMTP id
 z13-20020aa7888d000000b00538328b2ffbmr33690012pfe.82.1662276901714;
        Sun, 04 Sep 2022 00:35:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 40/63] hplip: Upgrade to 3.22.6
Date: Sun,  4 Sep 2022 00:33:54 -0700
Message-Id: <20220904073417.3251865-40-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98634

Add fix to remove python2 need.
Add fixes to build with clang+musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...tils-Include-string.h-for-strcasestr.patch |  44 ++++++
 ...or-only-when-DISBALE_IMAGEPROCESSOR_.patch |  32 +++++
 ....c-Define-column-to-be-int-explcitly.patch |  21 +++
 ...fine-missing-prototype-for-functions.patch |  53 +++++++
 ...-Add-printf-format-to-snprintf-calls.patch |  62 +++++++++
 ...-for-missing-Python3-transition-of-t.patch | 130 ++++++++++++++++++
 .../hplip/999-remove-lImageProcessor.patch    |  69 ----------
 .../hplip/hplip/configure.patch               |   7 +-
 .../{hplip_3.19.12.bb => hplip_3.22.6.bb}     |  12 +-
 9 files changed, 354 insertions(+), 76 deletions(-)
 create mode 100644 meta-oe/recipes-extended/hplip/hplip/0001-common-utils-Include-string.h-for-strcasestr.patch
 create mode 100644 meta-oe/recipes-extended/hplip/hplip/0002-Add-ImageProcessor-only-when-DISBALE_IMAGEPROCESSOR_.patch
 create mode 100644 meta-oe/recipes-extended/hplip/hplip/0003-pserror.c-Define-column-to-be-int-explcitly.patch
 create mode 100644 meta-oe/recipes-extended/hplip/hplip/0004-Define-missing-prototype-for-functions.patch
 create mode 100644 meta-oe/recipes-extended/hplip/hplip/0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch
 create mode 100644 meta-oe/recipes-extended/hplip/hplip/0006-Workaround-patch-for-missing-Python3-transition-of-t.patch
 delete mode 100644 meta-oe/recipes-extended/hplip/hplip/999-remove-lImageProcessor.patch
 rename meta-oe/recipes-extended/hplip/{hplip_3.19.12.bb => hplip_3.22.6.bb} (80%)

diff --git a/meta-oe/recipes-extended/hplip/hplip/0001-common-utils-Include-string.h-for-strcasestr.patch b/meta-oe/recipes-extended/hplip/hplip/0001-common-utils-Include-string.h-for-strcasestr.patch
new file mode 100644
index 0000000000..659eca41c9
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip/0001-common-utils-Include-string.h-for-strcasestr.patch
@@ -0,0 +1,44 @@
+From 20984c73bea8c3df00f297176edd4f6d47c31b55 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Sep 2022 17:49:20 -0700
+Subject: [PATCH 1/4] common/utils: Include string.h for strcasestr
+
+Also define _GNU_SOURCE for the same
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ common/utils.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+--- a/common/utils.c
++++ b/common/utils.c
+@@ -1,9 +1,11 @@
++#define _GNU_SOURCE
+ #include "utils.h"
+ #include "string.h"
+ #include <dlfcn.h>
+ #include <sys/stat.h>
+ #include <errno.h>
+ #include <stdlib.h>
++#include <string.h> /* strcasestr */
+ 
+ extern int errno;
+ 
+--- a/protocol/hp_ipp.c
++++ b/protocol/hp_ipp.c
+@@ -18,12 +18,13 @@ Boston, MA 02110-1301, USA.
+ 
+ \******************************************************************************/
+ 
+-
++#define _GNU_SOURCE
+ #include <cups/cups.h>
+ #include <cups/language.h>
+ #include <cups/ppd.h>
+ #include <syslog.h>
+ #include <stdarg.h>
++#include <string.h> /* strcasecmp */
+ #include <sys/types.h>
+ #include <pwd.h>
+ #include <sys/stat.h> 
diff --git a/meta-oe/recipes-extended/hplip/hplip/0002-Add-ImageProcessor-only-when-DISBALE_IMAGEPROCESSOR_.patch b/meta-oe/recipes-extended/hplip/hplip/0002-Add-ImageProcessor-only-when-DISBALE_IMAGEPROCESSOR_.patch
new file mode 100644
index 0000000000..2cfe1255e9
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip/0002-Add-ImageProcessor-only-when-DISBALE_IMAGEPROCESSOR_.patch
@@ -0,0 +1,32 @@
+From 3d53d02af7c45763eb33f7bbe5f9e389fbcb7e21 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Sep 2022 17:55:48 -0700
+Subject: [PATCH 2/4] Add ImageProcessor only when DISBALE_IMAGEPROCESSOR_BUILD
+ is not set
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 5f75759..73421b1 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -597,7 +597,11 @@ hpcups_SOURCES = prnt/hpcups/HPCupsFilter.cpp prnt/hpcups/HPCupsFilter.h prnt/hp
+ 	prnt/hpcups/ImageProcessor.h
+ 
+ hpcups_CXXFLAGS = $(APDK_ENDIAN_FLAG) $(DBUS_CFLAGS)
+-hpcups_LDADD = -L./prnt/hpcups/ -ljpeg -ldl -lImageProcessor -lcups -lcupsimage -lz $(DBUS_LIBS)
++hpcups_LDADD = -L./prnt/hpcups/ -ljpeg -ldl -lcups -lcupsimage -lz $(DBUS_LIBS)
++if !DISBALE_IMAGEPROCESSOR_BUILD
++hpcups_LDADD += "-lImageProcessor"
++endif #DISABLE_IMAGEPROCESSOR
++
+ #else
+ #hpcupsdir = $(cupsfilterdir)
+ #hpcups_PROGRAMS = hpcups
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-extended/hplip/hplip/0003-pserror.c-Define-column-to-be-int-explcitly.patch b/meta-oe/recipes-extended/hplip/hplip/0003-pserror.c-Define-column-to-be-int-explcitly.patch
new file mode 100644
index 0000000000..78325ac8d6
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip/0003-pserror.c-Define-column-to-be-int-explcitly.patch
@@ -0,0 +1,21 @@
+From a27d6264671e7201b5d78bcc9200e7d946429979 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Sep 2022 17:57:53 -0700
+Subject: [PATCH 3/4] pserror.c: Define column to be int explcitly
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ prnt/hpps/pserror.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/prnt/hpps/pserror.c
++++ b/prnt/hpps/pserror.c
+@@ -24,7 +24,7 @@ extern char *program ;	/* Defined by mai
+ void message(int flags, char *format, ...)
+ {
+   va_list args ;
+-  static column = 0 ;		/* current screen column for message wrap */
++  static int column = 0 ;	/* current screen column for message wrap */
+   char msgbuf[MAX_MESSAGE] ;	/* buffer in which to put the message */
+   char *bufptr = msgbuf ;	/* message buffer pointer */
+ 
diff --git a/meta-oe/recipes-extended/hplip/hplip/0004-Define-missing-prototype-for-functions.patch b/meta-oe/recipes-extended/hplip/hplip/0004-Define-missing-prototype-for-functions.patch
new file mode 100644
index 0000000000..276d025785
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip/0004-Define-missing-prototype-for-functions.patch
@@ -0,0 +1,53 @@
+From 33454817880fa57b2226dd40b724e5c3d6074aca Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Sep 2022 17:58:33 -0700
+Subject: [PATCH 4/4] Define missing prototype for functions
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ prnt/cupsext/cupsext.c | 1 +
+ protocol/hp_ipp.c      | 4 ++--
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+--- a/prnt/cupsext/cupsext.c
++++ b/prnt/cupsext/cupsext.c
+@@ -101,6 +101,11 @@ typedef int Py_ssize_t;
+ #define _STRINGIZE(x) #x
+ #define STRINGIZE(x) _STRINGIZE(x)
+ 
++void _releaseCupsInstance(void);
++int addCupsPrinter(char *name, char *device_uri, char *location, char *ppd_file, char *model, char *info);
++int setDefaultCupsPrinter(char *pr_name);
++int delCupsPrinter(char *pr_name);
++int controlCupsPrinter(char *pr_name, int op);
+ 
+ //static http_t * http = NULL;     /* HTTP object */
+ 
+--- a/protocol/hp_ipp.c
++++ b/protocol/hp_ipp.c
+@@ -22,6 +22,7 @@ Boston, MA 02110-1301, USA.
+ #include <cups/cups.h>
+ #include <cups/language.h>
+ #include <cups/ppd.h>
++#include <stdio.h>
+ #include <syslog.h>
+ #include <stdarg.h>
+ #include <string.h> /* strcasecmp */
+@@ -42,7 +43,7 @@ Boston, MA 02110-1301, USA.
+ #define STRINGIZE(x) _STRINGIZE(x)
+ 
+ 
+-http_t* acquireCupsInstance()
++http_t* acquireCupsInstance(void)
+ {
+     if ( http == NULL)
+     {
+@@ -53,7 +54,7 @@ http_t* acquireCupsInstance()
+ }
+ 
+ 
+-void _releaseCupsInstance()
++void _releaseCupsInstance(void)
+ {
+     if (http)
+     {
diff --git a/meta-oe/recipes-extended/hplip/hplip/0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch b/meta-oe/recipes-extended/hplip/hplip/0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch
new file mode 100644
index 0000000000..d844e49ad3
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip/0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch
@@ -0,0 +1,62 @@
+From 4b3014df3990d90d6929510f2bde073171503329 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Sep 2022 18:18:44 -0700
+Subject: [PATCH] hp_ipp.c: Add printf format to snprintf calls
+
+Avoid -Wformat warnings
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ protocol/hp_ipp.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/protocol/hp_ipp.c b/protocol/hp_ipp.c
+index 597d9b9..a027baf 100644
+--- a/protocol/hp_ipp.c
++++ b/protocol/hp_ipp.c
+@@ -112,7 +112,7 @@ int addCupsPrinter(char *name, char *device_uri, char *location, char *ppd_file,
+      }
+ 
+      if ( info == NULL )
+-        snprintf( info,sizeof(info), name );
++        snprintf( info,sizeof(info), "%s", name );
+ 
+      sprintf( printer_uri, "ipp://localhost/printers/%s", name );
+ 
+@@ -513,27 +513,27 @@ int __parsePrinterAttributes(ipp_t *response, printer_t **printer_list)
+ 
+              if ( strcmp(attr_name, "printer-name") == 0 &&
+                                         val_tag == IPP_TAG_NAME ) {
+-                  snprintf(t_printer->name, sizeof(t_printer->name),ippGetString(attr, 0, NULL) );
++                  snprintf(t_printer->name, sizeof(t_printer->name), "%s", ippGetString(attr, 0, NULL) );
+              }
+              else if ( strcmp(attr_name, "device-uri") == 0 &&
+                                          val_tag == IPP_TAG_URI ) {
+-                  snprintf(t_printer->device_uri,sizeof(t_printer->device_uri), ippGetString(attr, 0, NULL) );
++                  snprintf(t_printer->device_uri,sizeof(t_printer->device_uri), "%s", ippGetString(attr, 0, NULL) );
+              }
+              else if ( strcmp(attr_name, "printer-uri-supported") == 0 &&
+                                                  val_tag == IPP_TAG_URI ) {
+-                  snprintf(t_printer->printer_uri,sizeof(t_printer->printer_uri), ippGetString(attr, 0, NULL) );
++                  snprintf(t_printer->printer_uri,sizeof(t_printer->printer_uri), "%s", ippGetString(attr, 0, NULL) );
+              }
+              else if ( strcmp(attr_name, "printer-info") == 0 &&
+                                         val_tag == IPP_TAG_TEXT ) {
+-                  snprintf(t_printer->info,sizeof(t_printer->info), ippGetString(attr, 0, NULL) );
++                  snprintf(t_printer->info,sizeof(t_printer->info), "%s", ippGetString(attr, 0, NULL) );
+              }
+              else if ( strcmp(attr_name, "printer-location") == 0 &&
+                                            val_tag == IPP_TAG_TEXT ) {
+-                  snprintf(t_printer->location,sizeof(t_printer->location),ippGetString(attr, 0, NULL) );
++                  snprintf(t_printer->location,sizeof(t_printer->location), "%s", ippGetString(attr, 0, NULL) );
+              }
+              else if ( strcmp(attr_name, "printer-make-and-model") == 0 &&
+                                                   val_tag == IPP_TAG_TEXT ) {
+-                  snprintf(t_printer->make_model,sizeof(t_printer->make_model),ippGetString(attr, 0, NULL) );
++                  snprintf(t_printer->make_model,sizeof(t_printer->make_model), "%s", ippGetString(attr, 0, NULL) );
+              } 
+              else if ( strcmp(attr_name, "printer-state") == 0 &&
+                                              val_tag == IPP_TAG_ENUM ) {
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-extended/hplip/hplip/0006-Workaround-patch-for-missing-Python3-transition-of-t.patch b/meta-oe/recipes-extended/hplip/hplip/0006-Workaround-patch-for-missing-Python3-transition-of-t.patch
new file mode 100644
index 0000000000..5d78bb3bbb
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip/0006-Workaround-patch-for-missing-Python3-transition-of-t.patch
@@ -0,0 +1,130 @@
+From: Till Kamppeter <till.kamppeter@gmail.com>
+Date: Fri, 22 Jul 2016 09:33:04 +0200
+Subject: Workaround patch for missing Python3 transition of the old
+ (pre-USB-storage) photo memory card support (pcardext) as this part builds
+ in Python3 environments but with pointer-related warnings which are fatal
+ errors for Ubuntu's build servers. The patch silences the warnings but the
+ memory card support is dropped in Python3 environments. This patch is
+ supplied by the HPLIP upstream developers and will be replaced by a more
+ proper solution in the next upstream release of HPLIP (see LP: #1275353)
+
+---
+ pcard/pcardext/pcardext.c | 59 +++++++++++++++++++++++++++++++++++++----------
+ pcard/photocard.py        |  2 +-
+ unload.py                 |  5 ++++
+ 3 files changed, 53 insertions(+), 13 deletions(-)
+
+--- a/pcard/pcardext/pcardext.c
++++ b/pcard/pcardext/pcardext.c
+@@ -20,7 +20,7 @@ pcardext - Python extension for HP photo
+ Requires:
+ Python 2.2+
+ 
+-Author: Don Welch
++Author: Don Welch
+ 
+ \*****************************************************************************/
+ 
+@@ -41,9 +41,37 @@ typedef int Py_ssize_t;
+ 
+ int verbose=0;
+ 
++#if PY_MAJOR_VERSION >= 3
++  #define MOD_ERROR_VAL NULL
++  #define MOD_SUCCESS_VAL(val) val
++  #define MOD_INIT(name) PyMODINIT_FUNC PyInit_##name(void)
++  #define PyInt_AS_LONG PyLong_AS_LONG
++  #define MOD_DEF(ob, name, doc, methods) \
++          static struct PyModuleDef moduledef = { \
++            PyModuleDef_HEAD_INIT, name, doc, -1, methods, }; \
++          ob = PyModule_Create(&moduledef);
++
++
++  #define PY_String_Bytes  PyBytes_FromStringAndSize
++  #define PY_AsString_Bytes  PyBytes_AsStringAndSize
++
++#else
++  #define MOD_ERROR_VAL
++  #define MOD_SUCCESS_VAL(val)
++  #define MOD_INIT(name) void init##name(void)
++  #define MOD_DEF(ob, name, doc, methods)         \
++        ob = Py_InitModule3(name, methods, doc);
++
++  #define PY_String_Bytes PyString_FromStringAndSize
++  #define PY_AsString_Bytes PyString_AsStringAndSize
++
++#endif
++
+ PyObject * readsectorFunc = NULL;
+ PyObject * writesectorFunc = NULL;
+ 
++
++
+ int ReadSector(int sector, int nsector, void *buf, int size)
+ {
+     PyObject * result;
+@@ -59,9 +87,13 @@ int ReadSector(int sector, int nsector,
+         if( result )
+         {
+             Py_ssize_t len = 0;
+-            PyString_AsStringAndSize( result, &result_str, &len );
++
++            //PyString_AsStringAndSize( result, &result_str, &len );
++            //PyBytes_AsStringAndSize( result, &result_str, &len );
++            PY_AsString_Bytes( result, &result_str, &len );
+             
+-            if( len < nsector*FAT_HARDSECT )
++
++	    if( len < nsector*FAT_HARDSECT )
+             {
+                 goto abort;
+             }
+@@ -208,7 +240,9 @@ PyObject * pcardext_read( PyObject * sel
+     
+     if( FatReadFileExt( name, offset, len, buffer ) == len )
+     {
+-        return PyString_FromStringAndSize( (char *)buffer, len );
++        // return PyString_FromStringAndSize( (char *)buffer, len );
++        return PY_String_Bytes( (char *)buffer, len );
++        // return PyBytes_FromStringAndSize( (char *)buffer, len );
+     }
+     else
+     {
+@@ -236,14 +270,15 @@ static PyMethodDef pcardext_methods[] =
+ 
+ static char pcardext_documentation[] = "Python extension for HP photocard services";
+ 
+-void initpcardext( void )
+-{
+-    PyObject * mod = Py_InitModule4( "pcardext", pcardext_methods, 
+-                                     pcardext_documentation, (PyObject*)NULL, 
+-                                     PYTHON_API_VERSION );
+-                     
+-    if (mod == NULL)
+-      return;
++MOD_INIT(pcardext)  {
++
++  PyObject* mod ;
++  MOD_DEF(mod, "pcardext", pcardext_documentation, pcardext_methods);
++  if (mod == NULL)
++    return MOD_ERROR_VAL;
++
++  return MOD_SUCCESS_VAL(mod);
++
+ }
+ 
+ 
+--- a/unload.py
++++ b/unload.py
+@@ -44,6 +44,11 @@ except ImportError:
+ 
+ # Local
+ from base.g import *
++from base.sixext import PY3
++if PY3:
++    log.error("This functionality is not spported in python3 environment.")
++    sys.exit(1)
++
+ from base import device, utils, tui, module
+ from prnt import cups
+ 
diff --git a/meta-oe/recipes-extended/hplip/hplip/999-remove-lImageProcessor.patch b/meta-oe/recipes-extended/hplip/hplip/999-remove-lImageProcessor.patch
deleted file mode 100644
index aee4ac50cc..0000000000
--- a/meta-oe/recipes-extended/hplip/hplip/999-remove-lImageProcessor.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-# ../bin/ld: cannot find -lImageProcessor
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -590,11 +590,10 @@ hpcups_SOURCES = prnt/hpcups/HPCupsFilte
- 	prnt/hpcups/flate_colorspace.h prnt/hpcups/RunLenEncoding.h prnt/hpcups/common_defines.h \
- 	prnt/hpcups/genPCLm.h \
- 	common/utils.c common/utils.h prnt/hpcups/Hbpl1_Wrapper.cpp prnt/hpcups/genPCLm.cpp \
--	prnt/hpcups/genJPEGStrips.cpp prnt/hpcups/RunLenEncoding.cpp \
--	prnt/hpcups/ImageProcessor.h
-+	prnt/hpcups/genJPEGStrips.cpp prnt/hpcups/RunLenEncoding.cpp
- 
- hpcups_CXXFLAGS = $(APDK_ENDIAN_FLAG) $(DBUS_CFLAGS)
--hpcups_LDADD = -L./prnt/hpcups/ -ljpeg -ldl -lImageProcessor -lcups -lcupsimage -lz $(DBUS_LIBS)
-+hpcups_LDADD = -L./prnt/hpcups/ -ljpeg -ldl -lcups -lcupsimage -lz $(DBUS_LIBS)
- #else
- #hpcupsdir = $(cupsfilterdir)
- #hpcups_PROGRAMS = hpcups
---- a/prnt/hpcups/HPCupsFilter.cpp
-+++ b/prnt/hpcups/HPCupsFilter.cpp
-@@ -637,16 +637,10 @@ int HPCupsFilter::processRasterData(cups
- 
- 
-     sprintf(hpPreProcessedRasterFile, "%s/hp_%s_cups_SwapedPagesXXXXXX",CUPS_TMP_DIR, m_JA.user_name);
--    image_processor_t* imageProcessor = imageProcessorCreate();
- 
-     while (cupsRasterReadHeader2(cups_raster, &cups_header))
-     {
- 
--        IMAGE_PROCESSOR_ERROR result = imageProcessorStartPage(imageProcessor, &cups_header);
--        if (result != IPE_SUCCESS){
--            dbglog("DEBUG: imageProcessorStartPage failed result = %d\n", result);
--        }
--
-         current_page_number++;
- 
-         if (current_page_number == 1) {
-@@ -745,11 +739,6 @@ int HPCupsFilter::processRasterData(cups
-             color_raster = rgbRaster;
-             black_raster = kRaster;
- 
--            result = imageProcessorProcessLine(imageProcessor, m_pPrinterBuffer, cups_header.cupsBytesPerLine);
--            if (result != IPE_SUCCESS){
--                dbglog("DEBUG: imageProcessorProcessLine failed result = %d\n", result);
--            }
--
- 
-             if ((y == 0) && !is_ljmono) {
-                 //For ljmono, make sure that first line is not a blankRaster line.Otherwise printer
-@@ -780,11 +769,6 @@ int HPCupsFilter::processRasterData(cups
-             }
-         }  // for() loop end
- 
--        result = imageProcessorEndPage(imageProcessor);
--        if (result != IPE_SUCCESS){
--                dbglog("DEBUG: imageProcessorEndPage failed result = %d\n", result);
--        }
--
- 
-         m_Job.NewPage();
-         if (err != NO_ERROR) {
-@@ -800,8 +784,6 @@ int HPCupsFilter::processRasterData(cups
-         rgbRaster = NULL;
-     }
- 
--    imageProcessorDestroy(imageProcessor);
--
-     unlink(hpPreProcessedRasterFile);
-     return ret_status;
- }
diff --git a/meta-oe/recipes-extended/hplip/hplip/configure.patch b/meta-oe/recipes-extended/hplip/hplip/configure.patch
index 8fe77c5edf..571d5fe308 100644
--- a/meta-oe/recipes-extended/hplip/hplip/configure.patch
+++ b/meta-oe/recipes-extended/hplip/hplip/configure.patch
@@ -1,10 +1,9 @@
 --- a/configure.in
 +++ b/configure.in
-@@ -27,8 +27,7 @@
+@@ -30,7 +30,7 @@
+ AC_INIT([HP Linux Imaging and Printing], [3.22.6], [3.22.6], [hplip])
  
- #AC_PREREQ(2.59)
- AC_INIT([HP Linux Imaging and Printing], [3.19.12], [3.19.12], [hplip])
--#AM_INIT_AUTOMAKE([1.9 foreign])
+ #AM_INIT_AUTOMAKE([1.9 foreign])
 -AM_INIT_AUTOMAKE
 +AM_INIT_AUTOMAKE([foreign])
  AC_DISABLE_STATIC
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.19.12.bb b/meta-oe/recipes-extended/hplip/hplip_3.22.6.bb
similarity index 80%
rename from meta-oe/recipes-extended/hplip/hplip_3.19.12.bb
rename to meta-oe/recipes-extended/hplip/hplip_3.22.6.bb
index ac845ffcf9..b746006c20 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.19.12.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.22.6.bb
@@ -5,14 +5,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=20f2c819499cc2063e9a7b07b408815c"
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
            file://configure.patch \
            file://fix-libusb-paths.patch \
-           file://999-remove-lImageProcessor.patch \
            file://600-fix.patch \
            file://030-replace_unsafe_memcpy_with_memmove.patch \
            file://050-fix-glibcisms.patch \
            file://hplip-3.19.6-fix-return.patch \
+           file://0001-common-utils-Include-string.h-for-strcasestr.patch \
+           file://0002-Add-ImageProcessor-only-when-DISBALE_IMAGEPROCESSOR_.patch \
+           file://0003-pserror.c-Define-column-to-be-int-explcitly.patch \
+           file://0004-Define-missing-prototype-for-functions.patch \
+           file://0005-hp_ipp.c-Add-printf-format-to-snprintf-calls.patch \
+           file://0006-Workaround-patch-for-missing-Python3-transition-of-t.patch \
 "
-SRC_URI[md5sum] = "d72bc77d791c150c2c22b84e9553bab3"
-SRC_URI[sha256sum] = "b7f398502fb659e0de8e54976237e3c6a64fec0b3c36054a515876f7b006b255"
+SRC_URI[sha256sum] = "27ed0d492febb0b47c656234820d3ce573b24ff5b62e3bf4b2c47f82868d6bb4"
 
 DEPENDS += "cups python3 libusb"
 
@@ -25,6 +29,7 @@ CFLAGS += "-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}"
 
 EXTRA_OECONF += "\
         LIBUSBINCLUDEROOT=${STAGING_INCDIR} \
+        --enable-cups-drv-install \
         --enable-cups-ppd-install \
         --disable-network-build \
         --disable-doc-build \
@@ -39,6 +44,7 @@ EXTRA_OECONF += "\
         --enable-foomatic-drv-install \
         --disable-foomatic-ppd-install \
         --disable-foomatic-rip-hplip-install \
+        --disable-imageProcessor_build \
         --with-cupsbackenddir=${libexecdir}/cups/backend \
         --with-cupsfilterdir=${libexecdir}/cups/filter \
 "
-- 
2.37.3


