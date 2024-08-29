Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5765C7115A
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 01:15:10 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.2509.1724894106385644140
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 18:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bxeDyfXl;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71434174201so131653b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 18:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724894105; x=1725498905; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A1qdVJoV6paP11WQElXAZt+pf2vkeYhNUmT+7aaJcJw=;
        b=bxeDyfXlU32FW1Ev9rKTIiJZfxOCDN8Z3NR/xW69vWUSXdMwoHW6iUMk1iDHZe5ZGE
         s7Haeu2acTIEXRomD2B8lYEvWcZWasmx/AgXntdlfISTKOrSwhjtHbyxmAz0S2lF9hRE
         aOcb2gBWsbgq3Ckgr56F0ddmc6wG8sXxfBv2q1wDFbLqk64cjv/YnLPPICDpWXpVhzY5
         I6MsJj+xxhMqzyCOoucdAi5NeMUMvoSHzsfEK7YBxQz9R/MBloIa2ELQ1ghRBVh3g8X6
         0Ap/x0NrqvQBH0FOeH60g5ZQPlb6xqZZ+mOEDpJaneBpUBDN0mhrY+vfyVKUpJ0PQ06C
         5UkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724894105; x=1725498905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A1qdVJoV6paP11WQElXAZt+pf2vkeYhNUmT+7aaJcJw=;
        b=mNQ2o56cmgbXRdwpGUgROhdGzNTS1nwilxQx7Y/kBDmAT3Io+SxOrxe5jbfQ8iiFi2
         FpfI5RiQcZLuM0O1Q1IfGOwa/0PNGBnA3KVbBvNoTLOiiUHoH3SQWoyJbtJtWjLKV3Gy
         CcAD9LtZodXFBZYbzlBOdU3ZGdNLqhoFB+hIUQmLPB3n4FDidsRUMwLjvlT86hh+Qzud
         3GVrWVBgh9XUhmRyT/4OoLzw9V5nrddRpptXgGx9ZuzvPi7oL3Nf+ZGPo/XD7BDPdmZn
         ql1/JOAyP5tYbYNeyfeLVsQvRruV6UB8Clmw2+UqZ8ghYK5X+dogUXr0jBEGX02M/WUt
         qO4w==
X-Gm-Message-State: AOJu0YztOhV6NlbqZil7+H343uf7A/pW8isVl6EMdt8Np+TK5ztjwEC2
	RpzNHEDCUooXKAeJuWN/EwmV6LtpsYwxWBpYLRiBYl8DJgQlQYpmYbuDyw==
X-Google-Smtp-Source: AGHT+IE0gYefmBPEfh3tEbs6MxWw2GPMzz/bl6M9WAgF3nbWMMhicJca9UjfPeaTxqc2BRY5X4oTzw==
X-Received: by 2002:a05:6a20:9f44:b0:1cc:d4a0:2675 with SMTP id adf61e73a8af0-1cce0fff4e2mr1170479637.3.1724894105203;
        Wed, 28 Aug 2024 18:15:05 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e575c422sm89396b3a.198.2024.08.28.18.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 18:15:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mariadb: Upgrade to 10.11.9 release
Date: Wed, 28 Aug 2024 18:15:00 -0700
Message-ID: <20240829011501.3403487-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 01:15:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112030

Drop upstreamed patches
Fixes build with fmt11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e_10.11.7.bb => mariadb-native_10.11.9.bb} |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   4 +-
 ...EV-33439-Fix-build-with-libxml2-2.12.patch | 170 ------------------
 ...Remove-the-compile_time_assert-lines.patch |  43 -----
 ...{mariadb_10.11.7.bb => mariadb_10.11.9.bb} |   0
 5 files changed, 1 insertion(+), 216 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.7.bb => mariadb-native_10.11.9.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-the-compile_time_assert-lines.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.7.bb => mariadb_10.11.9.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.7.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 32a6022bab..ae6581ec71 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -23,11 +23,9 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
-           file://0001-Remove-the-compile_time_assert-lines.patch \
-           file://0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
-SRC_URI[sha256sum] = "5239a245ed90517e96396605cd01ccd8f73cd7442d1b3076b6ffe258110e5157"
+SRC_URI[sha256sum] = "0a00180864cd016187c986faab8010de23a117b9a75f91d6456421f894e48d20"
 
 UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/tags"
 
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch
deleted file mode 100644
index 3e42535dad..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch
+++ /dev/null
@@ -1,170 +0,0 @@
-From dae52f5916ef59434c93f0b716270f59dd0c3a94 Mon Sep 17 00:00:00 2001
-From: Jan Tojnar <jtojnar@gmail.com>
-Date: Sun, 7 Jan 2024 10:19:54 +0100
-Subject: [PATCH] MDEV-33439 Fix build with libxml2 2.12
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-libxml2 2.12.0 made `xmlGetLastError()` return `const` pointer:
-
-https://gitlab.gnome.org/GNOME/libxml2/-/commit/61034116d0a3c8b295c6137956adc3ae55720711
-
-Clang 16 does not like this:
-
-    error: assigning to 'xmlErrorPtr' (aka '_xmlError *') from 'const xmlError *' (aka 'const _xmlError *') discards qualifiers
-    error: cannot initialize a variable of type 'xmlErrorPtr' (aka '_xmlError *') with an rvalue of type 'const xmlError *' (aka 'const _xmlError *')
-
-Let’s update the variables to `const`.
-For older versions, it will be automatically converted.
-
-But then `xmlResetError(xmlError*)` will not like the `const` pointer:
-
-    error: no matching function for call to 'xmlResetError'
-    note: candidate function not viable: 1st argument ('const xmlError *' (aka 'const _xmlError *')) would lose const qualifier
-
-Let’s replace it with `xmlResetLastError()`.
-
-ALso remove `LIBXMLDOC::Xerr` protected member property.
-It was introduced in 65b0e5455b547a3d574fa77b34cce23ae3bea0a0
-along with the `xmlResetError` calls.
-It does not appear to be used for anything.
-
-Upstream-Status: Backport [https://github.com/MariaDB/server/pull/2983]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- storage/connect/libdoc.cpp | 39 +++++++++++++++++++-------------------
- 1 file changed, 19 insertions(+), 20 deletions(-)
-
-diff --git a/storage/connect/libdoc.cpp b/storage/connect/libdoc.cpp
-index 67f22ce2..ab588dd4 100644
---- a/storage/connect/libdoc.cpp
-+++ b/storage/connect/libdoc.cpp
-@@ -93,7 +93,6 @@ class LIBXMLDOC : public XMLDOCUMENT {
-   xmlXPathContextPtr Ctxp;
-   xmlXPathObjectPtr  Xop;
-   xmlXPathObjectPtr  NlXop;
--  xmlErrorPtr        Xerr;
-   char              *Buf;                  // Temporary
-   bool               Nofreelist;
- }; // end of class LIBXMLDOC
-@@ -327,7 +326,6 @@ LIBXMLDOC::LIBXMLDOC(char *nsl, char *nsdf, char *enc, PFBLOCK fp)
-   Ctxp = NULL;
-   Xop = NULL;
-   NlXop = NULL;
--  Xerr = NULL;
-   Buf = NULL;
-   Nofreelist = false;
-   } // end of LIBXMLDOC constructor
-@@ -365,8 +363,8 @@ bool LIBXMLDOC::ParseFile(PGLOBAL g, char *fn)
-       Encoding = (char*)Docp->encoding;
- 
-     return false;
--  } else if ((Xerr = xmlGetLastError()))
--    xmlResetError(Xerr);
-+  } else if (xmlGetLastError())
-+    xmlResetLastError();
- 
-   return true;
-   } // end of ParseFile
-@@ -505,9 +503,9 @@ int LIBXMLDOC::DumpDoc(PGLOBAL g, char *ofn)
- #if 1
-   // This function does not crash (
-   if (xmlSaveFormatFileEnc((const char *)ofn, Docp, Encoding, 0) < 0) {
--    xmlErrorPtr err = xmlGetLastError();
-+    const xmlError *err = xmlGetLastError();
-     strcpy(g->Message, (err) ? err->message : "Error saving XML doc");
--    xmlResetError(Xerr);
-+    xmlResetLastError();
-     rc = -1;
-     } // endif Save
- //  rc = xmlDocDump(of, Docp);
-@@ -546,8 +544,8 @@ void LIBXMLDOC::CloseDoc(PGLOBAL g, PFBLOCK xp)
-     if (Nlist) {
-       xmlXPathFreeNodeSet(Nlist);
- 
--      if ((Xerr = xmlGetLastError()))
--        xmlResetError(Xerr);
-+      if (xmlGetLastError())
-+        xmlResetLastError();
- 
-       Nlist = NULL;
-       } // endif Nlist
-@@ -555,8 +553,8 @@ void LIBXMLDOC::CloseDoc(PGLOBAL g, PFBLOCK xp)
-     if (Xop) {
-       xmlXPathFreeObject(Xop);
- 
--      if ((Xerr = xmlGetLastError()))
--        xmlResetError(Xerr);
-+      if (xmlGetLastError())
-+        xmlResetLastError();
- 
-       Xop = NULL;
-       } // endif Xop
-@@ -564,8 +562,8 @@ void LIBXMLDOC::CloseDoc(PGLOBAL g, PFBLOCK xp)
-     if (NlXop) {
-       xmlXPathFreeObject(NlXop);
- 
--      if ((Xerr = xmlGetLastError()))
--        xmlResetError(Xerr);
-+      if (xmlGetLastError())
-+        xmlResetLastError();
- 
-       NlXop = NULL;
-       } // endif NlXop
-@@ -573,8 +571,8 @@ void LIBXMLDOC::CloseDoc(PGLOBAL g, PFBLOCK xp)
-     if (Ctxp) {
-       xmlXPathFreeContext(Ctxp);
- 
--      if ((Xerr = xmlGetLastError()))
--        xmlResetError(Xerr);
-+      if (xmlGetLastError())
-+        xmlResetLastError();
- 
-       Ctxp = NULL;
-       } // endif Ctxp
-@@ -590,6 +588,7 @@ void LIBXMLDOC::CloseDoc(PGLOBAL g, PFBLOCK xp)
- /******************************************************************/
- xmlNodeSetPtr LIBXMLDOC::GetNodeList(PGLOBAL g, xmlNodePtr np, char *xp)
-   {
-+  const xmlError *xerr;
-   xmlNodeSetPtr nl;
- 
-   if (trace(1))
-@@ -649,11 +648,11 @@ xmlNodeSetPtr LIBXMLDOC::GetNodeList(PGLOBAL g, xmlNodePtr np, char *xp)
-     } else
-       xmlXPathFreeObject(Xop);            // Caused node not found
- 
--    if ((Xerr = xmlGetLastError())) {
--      strcpy(g->Message, Xerr->message);
--      xmlResetError(Xerr);
-+    if ((xerr = xmlGetLastError())) {
-+      strcpy(g->Message, xerr->message);
-+      xmlResetLastError();
-       return NULL;
--      } // endif Xerr
-+      } // endif xerr
- 
-     } // endif Xop
- 
-@@ -1079,7 +1078,7 @@ void XML2NODE::AddText(PGLOBAL g, PCSZ txtp)
- /******************************************************************/
- void XML2NODE::DeleteChild(PGLOBAL g, PXNODE dnp)
-   {
--  xmlErrorPtr xerr;
-+  const xmlError *xerr;
- 
-   if (trace(1))
-     htrc("DeleteChild: node=%p\n", dnp);
-@@ -1122,7 +1121,7 @@ void XML2NODE::DeleteChild(PGLOBAL g, PXNODE dnp)
-   if (trace(1))
-     htrc("DeleteChild: errmsg=%-.256s\n", xerr->message);
- 
--  xmlResetError(xerr);
-+  xmlResetLastError();
-   } // end of DeleteChild
- 
- /* -------------------- class XML2NODELIST ---------------------- */
--- 
-2.44.0
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-the-compile_time_assert-lines.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-the-compile_time_assert-lines.patch
deleted file mode 100644
index 9a6e28297b..0000000000
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-the-compile_time_assert-lines.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From cc5f1d0759b367265a1a000287e2ec15c31eb518 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Mon, 26 Feb 2024 14:56:02 +0800
-Subject: [PATCH] Remove the compile_time_assert lines
-
-Remove the problematic compile_time_assert lines to fix the below build
-failure on 32-bit arm.
- In file included from TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/mariadb/10.11.7/mariadb-10.11.7/tests/mysql_client_test.c:38:
- TOPDIR/build/tmp/work/cortexa15t2hf-neon-yoe-linux-gnueabi/mariadb/10.11.7/mariadb-10.11.7/tests/mysql_client_fw.c:1438:3: error: 'compile_time_assert' declared as an array with a negative size
-  1438 |   compile_time_assert(sizeof(MYSQL) == 77*sizeof(void*)+656);
-       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Inappropriate [Upstream will bring the asset back
-                                in a new way [1]]
-[1] https://jira.mariadb.org/browse/MDEV-33429
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- tests/mysql_client_fw.c | 8 --------
- 1 file changed, 8 deletions(-)
-
-diff --git a/tests/mysql_client_fw.c b/tests/mysql_client_fw.c
-index c9e64678..5c0c7ce2 100644
---- a/tests/mysql_client_fw.c
-+++ b/tests/mysql_client_fw.c
-@@ -1430,14 +1430,6 @@ int main(int argc, char **argv)
-     tests_to_run[i]= NULL;
-   }
- 
--#ifdef _WIN32
--  /* must be the same in C/C and embedded, 1208 on 64bit, 968 on 32bit */
--  compile_time_assert(sizeof(MYSQL) == 60*sizeof(void*)+728);
--#else
--  /* must be the same in C/C and embedded, 1272 on 64bit, 964 on 32bit */
--  compile_time_assert(sizeof(MYSQL) == 77*sizeof(void*)+656);
--#endif
--
-   if (mysql_server_init(embedded_server_arg_count,
-                         embedded_server_args,
-                         (char**) embedded_server_groups))
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.7.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.7.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb

