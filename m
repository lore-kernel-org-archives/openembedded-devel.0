Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 243B5C54E5D
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 01:24:44 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web10.10509.1709861074887009488
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 17:24:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZTQDK0KM;
 spf=pass (domain: gmail.com, ip: 209.85.166.172, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-36523b9fa11so975965ab.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 17:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709861074; x=1710465874; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0xop/QmM9oZ+HccrMA3qu58piqOx//cjxgy5ZYZNwA=;
        b=ZTQDK0KMRLjCSqwc/cCfTJM6zgN+34NcGN8QvIajBbIQijiIyTrD9uyNsO7szMpJCG
         jkzihGD3a1qUch6y30nlSPM4h3PnAuxy9KT2E+7VJdw5kzmjIV/OL+kOPefnRUO2S528
         lingqvTvcfSLJ1eRw1LnM0TmM/cQdkpIQgjiZCNimsdgHO2x8T75CvdZKouaoo4t3jVq
         NvlwhVWVUXhfARCFbW6Gmg+sBT3Uz3JUj+i2Wmq2R6/cwPCM98N61ec8fud/m3dGPqnM
         BpOYXDcHqxUD0WYRyY306OLFu7EsYOZ6OCpqyEw+Fj6hrlMRyiuBj8+tzNsnDU1NdYUM
         3+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709861074; x=1710465874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0xop/QmM9oZ+HccrMA3qu58piqOx//cjxgy5ZYZNwA=;
        b=uF5S9p1ol1/pFO4s6dqt99IO44lxsq9ePiMy/Iq0fx1krD/EukJs3ONNq3R3lXmRWl
         sFCe3WuIMkbGmCV5KiSB93af/ak1Ldih48vGBe16wJ9dtFcIru2dkJBQqbxeAO3k649Q
         JkiDu+V6jNwtiTEUI91aMVUEnlEm8F3CiS8YopDLH2uew4TsuTVL8HJ2rMi4WsriMpTq
         jX353SL5odbw2vIFtqNTnjzujuyK2ugMUMm8MLLdbFPxVzSuklrx7w9uxPgU8ZJBRNIL
         Hf4BLxsCNROwvHXFqAr002Iqzgt4p5Ngiij6DjwxkMTJzBpLdjqp7SrWBlMQMa0uBVt/
         a/lg==
X-Gm-Message-State: AOJu0Yw33wTF/DZAh1Dec75IuqeLA+g85tEyEJf3vxGR7ib7iY++hsl1
	pgwgBEaI7LAuBuAwiylkMKiq3SQY1V7ioPJcZu1mJUF10YF3f2bf20MiBLdQ
X-Google-Smtp-Source: AGHT+IGX5d8JIK/v7Qx9hjX2rf0/p6DAVcTknuRyMWFZmglE6dge6r++GKWTFMzhMBGFLIomu9tmRw==
X-Received: by 2002:a05:6e02:1a22:b0:365:ac7:30b8 with SMTP id g2-20020a056e021a2200b003650ac730b8mr24078201ile.29.1709861073722;
        Thu, 07 Mar 2024 17:24:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::682a])
        by smtp.gmail.com with ESMTPSA id k4-20020aa79984000000b006e559bc3250sm10649731pfh.68.2024.03.07.17.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 17:24:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] mariadb: Fix build with libxml2 2.12 ABI changes
Date: Thu,  7 Mar 2024 17:24:25 -0800
Message-ID: <20240308012429.577792-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240308012429.577792-1-raj.khem@gmail.com>
References: <20240308012429.577792-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 01:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109214

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   1 +
 ...EV-33439-Fix-build-with-libxml2-2.12.patch | 170 ++++++++++++++++++
 2 files changed, 171 insertions(+)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 9e6d490cbe..33da32fb28 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -24,6 +24,7 @@ SRC_URI = "https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
            file://lfs64.patch \
            file://0001-Add-missing-includes-cstdint-and-cstdio.patch \
            file://0001-Remove-the-compile_time_assert-lines.patch \
+           file://0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch \
           "
 SRC_URI:append:libc-musl = " file://ppc-remove-glibc-dep.patch"
 SRC_URI[sha256sum] = "5239a245ed90517e96396605cd01ccd8f73cd7442d1b3076b6ffe258110e5157"
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch
new file mode 100644
index 0000000000..3e42535dad
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-33439-Fix-build-with-libxml2-2.12.patch
@@ -0,0 +1,170 @@
+From dae52f5916ef59434c93f0b716270f59dd0c3a94 Mon Sep 17 00:00:00 2001
+From: Jan Tojnar <jtojnar@gmail.com>
+Date: Sun, 7 Jan 2024 10:19:54 +0100
+Subject: [PATCH] MDEV-33439 Fix build with libxml2 2.12
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+libxml2 2.12.0 made `xmlGetLastError()` return `const` pointer:
+
+https://gitlab.gnome.org/GNOME/libxml2/-/commit/61034116d0a3c8b295c6137956adc3ae55720711
+
+Clang 16 does not like this:
+
+    error: assigning to 'xmlErrorPtr' (aka '_xmlError *') from 'const xmlError *' (aka 'const _xmlError *') discards qualifiers
+    error: cannot initialize a variable of type 'xmlErrorPtr' (aka '_xmlError *') with an rvalue of type 'const xmlError *' (aka 'const _xmlError *')
+
+Let’s update the variables to `const`.
+For older versions, it will be automatically converted.
+
+But then `xmlResetError(xmlError*)` will not like the `const` pointer:
+
+    error: no matching function for call to 'xmlResetError'
+    note: candidate function not viable: 1st argument ('const xmlError *' (aka 'const _xmlError *')) would lose const qualifier
+
+Let’s replace it with `xmlResetLastError()`.
+
+ALso remove `LIBXMLDOC::Xerr` protected member property.
+It was introduced in 65b0e5455b547a3d574fa77b34cce23ae3bea0a0
+along with the `xmlResetError` calls.
+It does not appear to be used for anything.
+
+Upstream-Status: Backport [https://github.com/MariaDB/server/pull/2983]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ storage/connect/libdoc.cpp | 39 +++++++++++++++++++-------------------
+ 1 file changed, 19 insertions(+), 20 deletions(-)
+
+diff --git a/storage/connect/libdoc.cpp b/storage/connect/libdoc.cpp
+index 67f22ce2..ab588dd4 100644
+--- a/storage/connect/libdoc.cpp
++++ b/storage/connect/libdoc.cpp
+@@ -93,7 +93,6 @@ class LIBXMLDOC : public XMLDOCUMENT {
+   xmlXPathContextPtr Ctxp;
+   xmlXPathObjectPtr  Xop;
+   xmlXPathObjectPtr  NlXop;
+-  xmlErrorPtr        Xerr;
+   char              *Buf;                  // Temporary
+   bool               Nofreelist;
+ }; // end of class LIBXMLDOC
+@@ -327,7 +326,6 @@ LIBXMLDOC::LIBXMLDOC(char *nsl, char *nsdf, char *enc, PFBLOCK fp)
+   Ctxp = NULL;
+   Xop = NULL;
+   NlXop = NULL;
+-  Xerr = NULL;
+   Buf = NULL;
+   Nofreelist = false;
+   } // end of LIBXMLDOC constructor
+@@ -365,8 +363,8 @@ bool LIBXMLDOC::ParseFile(PGLOBAL g, char *fn)
+       Encoding = (char*)Docp->encoding;
+ 
+     return false;
+-  } else if ((Xerr = xmlGetLastError()))
+-    xmlResetError(Xerr);
++  } else if (xmlGetLastError())
++    xmlResetLastError();
+ 
+   return true;
+   } // end of ParseFile
+@@ -505,9 +503,9 @@ int LIBXMLDOC::DumpDoc(PGLOBAL g, char *ofn)
+ #if 1
+   // This function does not crash (
+   if (xmlSaveFormatFileEnc((const char *)ofn, Docp, Encoding, 0) < 0) {
+-    xmlErrorPtr err = xmlGetLastError();
++    const xmlError *err = xmlGetLastError();
+     strcpy(g->Message, (err) ? err->message : "Error saving XML doc");
+-    xmlResetError(Xerr);
++    xmlResetLastError();
+     rc = -1;
+     } // endif Save
+ //  rc = xmlDocDump(of, Docp);
+@@ -546,8 +544,8 @@ void LIBXMLDOC::CloseDoc(PGLOBAL g, PFBLOCK xp)
+     if (Nlist) {
+       xmlXPathFreeNodeSet(Nlist);
+ 
+-      if ((Xerr = xmlGetLastError()))
+-        xmlResetError(Xerr);
++      if (xmlGetLastError())
++        xmlResetLastError();
+ 
+       Nlist = NULL;
+       } // endif Nlist
+@@ -555,8 +553,8 @@ void LIBXMLDOC::CloseDoc(PGLOBAL g, PFBLOCK xp)
+     if (Xop) {
+       xmlXPathFreeObject(Xop);
+ 
+-      if ((Xerr = xmlGetLastError()))
+-        xmlResetError(Xerr);
++      if (xmlGetLastError())
++        xmlResetLastError();
+ 
+       Xop = NULL;
+       } // endif Xop
+@@ -564,8 +562,8 @@ void LIBXMLDOC::CloseDoc(PGLOBAL g, PFBLOCK xp)
+     if (NlXop) {
+       xmlXPathFreeObject(NlXop);
+ 
+-      if ((Xerr = xmlGetLastError()))
+-        xmlResetError(Xerr);
++      if (xmlGetLastError())
++        xmlResetLastError();
+ 
+       NlXop = NULL;
+       } // endif NlXop
+@@ -573,8 +571,8 @@ void LIBXMLDOC::CloseDoc(PGLOBAL g, PFBLOCK xp)
+     if (Ctxp) {
+       xmlXPathFreeContext(Ctxp);
+ 
+-      if ((Xerr = xmlGetLastError()))
+-        xmlResetError(Xerr);
++      if (xmlGetLastError())
++        xmlResetLastError();
+ 
+       Ctxp = NULL;
+       } // endif Ctxp
+@@ -590,6 +588,7 @@ void LIBXMLDOC::CloseDoc(PGLOBAL g, PFBLOCK xp)
+ /******************************************************************/
+ xmlNodeSetPtr LIBXMLDOC::GetNodeList(PGLOBAL g, xmlNodePtr np, char *xp)
+   {
++  const xmlError *xerr;
+   xmlNodeSetPtr nl;
+ 
+   if (trace(1))
+@@ -649,11 +648,11 @@ xmlNodeSetPtr LIBXMLDOC::GetNodeList(PGLOBAL g, xmlNodePtr np, char *xp)
+     } else
+       xmlXPathFreeObject(Xop);            // Caused node not found
+ 
+-    if ((Xerr = xmlGetLastError())) {
+-      strcpy(g->Message, Xerr->message);
+-      xmlResetError(Xerr);
++    if ((xerr = xmlGetLastError())) {
++      strcpy(g->Message, xerr->message);
++      xmlResetLastError();
+       return NULL;
+-      } // endif Xerr
++      } // endif xerr
+ 
+     } // endif Xop
+ 
+@@ -1079,7 +1078,7 @@ void XML2NODE::AddText(PGLOBAL g, PCSZ txtp)
+ /******************************************************************/
+ void XML2NODE::DeleteChild(PGLOBAL g, PXNODE dnp)
+   {
+-  xmlErrorPtr xerr;
++  const xmlError *xerr;
+ 
+   if (trace(1))
+     htrc("DeleteChild: node=%p\n", dnp);
+@@ -1122,7 +1121,7 @@ void XML2NODE::DeleteChild(PGLOBAL g, PXNODE dnp)
+   if (trace(1))
+     htrc("DeleteChild: errmsg=%-.256s\n", xerr->message);
+ 
+-  xmlResetError(xerr);
++  xmlResetLastError();
+   } // end of DeleteChild
+ 
+ /* -------------------- class XML2NODELIST ---------------------- */
+-- 
+2.44.0
+
-- 
2.44.0


