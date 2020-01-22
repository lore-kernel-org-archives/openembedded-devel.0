Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 70F9D7FD1B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:38:30 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id s94so1748494pjc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 22:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nrLQqCaGZuAyzkZHQtafCLh6pLg8h+0GGmncjfrSDZo=;
	b=Yd2L73SnEWAppxYP8PqBHnd5xycjoKLV4bSah0rKXuySA/LDJNlPwGZZaIYbqIepXO
	F3n6F/4h7FqxKSwCoLJiSkMsuDtwOMkd2RaIBnow0hvrpShjvJeIKFudmKmzbaU0bSXI
	X6CXeOLIRgXkS8Udg43zcwU2iKVOS+fllsWjPw4H+/i5XIOt7LNjO54WcAm1kOOOwmj4
	fv1pX+S5AirazRU3DR88cJH+ezziHE8fVUhDaT6ZfT06gmkkr0+1qwCOKYqu1BwQpd6s
	04w1J4oRmDA4e1GnrL/Res4+ksiUaW3uPIk+tuoQ6axmghe5JBvPs6cbGBudSDDx5q2I
	hl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nrLQqCaGZuAyzkZHQtafCLh6pLg8h+0GGmncjfrSDZo=;
	b=adK+EMGTJb/+0QBBySEVz0r3GeTApDzNpSbwKPFvv+ayuLQoAF6iobwTzW28+zqwWx
	20ZviQ82N6cfEm1ytWoUdjJOPJd641tD3if39vFjVdAS+8EMDVpkekhb1RYKH21fLdnK
	bJjragFOf0/lTtssOLX97IBR7MsSO3K/a7elw5An/vAGRr5Xh9t4+YNMQx54Z2VU9A8u
	VEWVCQrTl7061O9qz44vRCFlWYCmC1f13EnMAQlpMWCc/8ev0jRBS4iaHsd1Dw64aJtz
	omkJnJa2ZI718JVF928ZNU8iHCLKULJJDK3jDN2VMpukkNoTmwwscoHV4NKXy1uyrv0b
	XGcA==
X-Gm-Message-State: APjAAAX398AcBAiiQGw/hzLahSVBhVYQOKM26kV5Jok5nCfHuOd+uUuT
	q+UQudrpWTarZ8xMEcVUesLNazWU0ZI=
X-Google-Smtp-Source: APXvYqwaqq5VIHtfHtfENZIk/DhfWEPypKwxo9pI0MC1zqeoAtZe6fz6Z8BUUf9MdWmiXOS3adxQMA==
X-Received: by 2002:a17:902:6b8c:: with SMTP id
	p12mr9251582plk.290.1579675110686; 
	Tue, 21 Jan 2020 22:38:30 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	100sm1600283pjo.17.2020.01.21.22.38.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 22:38:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 22:38:19 -0800
Message-Id: <20200122063823.242098-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122063823.242098-1-raj.khem@gmail.com>
References: <20200122063823.242098-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 08/12] hplip: Upgrade to 3.19.12
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
X-List-Received-Date: Wed, 22 Jan 2020 06:38:30 -0000
Content-Transfer-Encoding: quoted-printable

Use python3 instead of py2
Apply patches from openwrt to fix crosscompile and musl builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ps-ppd.h-for-missing-ppd-definitions.patch |  42 --
 .../hplip/hplip-3.12.6/configure.patch        |  14 -
 .../hplip/hplip-3.12.6/cups-1.6.patch         | 395 ------------------
 .../hplip/hplip-3.12.6/fix-libusb-paths.patch |  35 --
 .../setup-add-sleep-after-cups-reset.patch    |  12 -
 ...0-replace_unsafe_memcpy_with_memmove.patch |  15 +
 .../hplip/hplip/050-fix-glibcisms.patch       |  17 +
 .../hplip/hplip/600-fix.patch                 |  10 +
 .../hplip/999-remove-lImageProcessor.patch    |  69 +++
 .../hplip/hplip/configure.patch               |  12 +
 .../hplip/hplip/fix-libusb-paths.patch        |  33 ++
 .../recipes-extended/hplip/hplip_3.12.6.bb    |  75 ----
 .../recipes-extended/hplip/hplip_3.19.12.bb   |  87 ++++
 13 files changed, 243 insertions(+), 573 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-includ=
e-cups-ppd.h-for-missing-ppd-definitions.patch
 delete mode 100644 meta-oe/recipes-extended/hplip/hplip-3.12.6/configure.p=
atch
 delete mode 100644 meta-oe/recipes-extended/hplip/hplip-3.12.6/cups-1.6.pa=
tch
 delete mode 100644 meta-oe/recipes-extended/hplip/hplip-3.12.6/fix-libusb-=
paths.patch
 delete mode 100644 meta-oe/recipes-extended/hplip/hplip-3.12.6/setup-add-s=
leep-after-cups-reset.patch
 create mode 100644 meta-oe/recipes-extended/hplip/hplip/030-replace_unsafe=
_memcpy_with_memmove.patch
 create mode 100644 meta-oe/recipes-extended/hplip/hplip/050-fix-glibcisms.=
patch
 create mode 100644 meta-oe/recipes-extended/hplip/hplip/600-fix.patch
 create mode 100644 meta-oe/recipes-extended/hplip/hplip/999-remove-lImageP=
rocessor.patch
 create mode 100644 meta-oe/recipes-extended/hplip/hplip/configure.patch
 create mode 100644 meta-oe/recipes-extended/hplip/hplip/fix-libusb-paths.p=
atch
 delete mode 100644 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
 create mode 100644 meta-oe/recipes-extended/hplip/hplip_3.19.12.bb

diff --git a/meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cups-=
ppd.h-for-missing-ppd-definitions.patch b/meta-oe/recipes-extended/hplip/hp=
lip-3.12.6/0001-include-cups-ppd.h-for-missing-ppd-definitions.patch
deleted file mode 100644
index f259b5f05d..0000000000
--- a/meta-oe/recipes-extended/hplip/hplip-3.12.6/0001-include-cups-ppd.h-f=
or-missing-ppd-definitions.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 7ef9c040dd959105c16d4dc67e14f3bbea25e77f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 16 Dec 2016 19:51:19 +0000
-Subject: [PATCH] include cups/ppd.h for missing ppd definitions
-
-Fixes errors spotted by clang
-
-| prnt/hpcups/HPCupsFilter.cpp:365:18: error: use of undeclared identifier=
 'ppdFindAttr'
-|     if (((attr =3D ppdFindAttr(m_ppd, "hpPrinterLanguage", NULL)) =3D=3D=
 NULL) ||
-|                  ^
-| prnt/hpcups/HPCupsFilter.cpp:368:13: error: use of undeclared identifier=
 'ppdClose'
-|             ppdClose(m_ppd);
-|             ^
-| prnt/hpcups/HPCupsFilter.cpp:444:9: error: use of undeclared identifier =
'ppdClose'
-|         ppdClose(m_ppd);
-|         ^
-| prnt/hpcups/HPCupsFilter.cpp:497:13: error: use of undeclared identifier=
 'ppdOpenFile'
-|     m_ppd =3D ppdOpenFile(getenv("PPD"));
-|             ^
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- prnt/hpcups/HPCupsFilter.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/prnt/hpcups/HPCupsFilter.h b/prnt/hpcups/HPCupsFilter.h
-index 0431a7a..eb0cad6 100644
---- a/prnt/hpcups/HPCupsFilter.h
-+++ b/prnt/hpcups/HPCupsFilter.h
-@@ -37,6 +37,7 @@
- #include "Job.h"=0D
- =0D
- #include "dbuscomm.h"=0D
-+#include <cups/ppd.h>=0D
- =0D
- #define		DBITMAPFILEHEADER		14=0D
- #define		DBITMAPINFOHEADER		40=0D
---=20
-1.9.1
-
diff --git a/meta-oe/recipes-extended/hplip/hplip-3.12.6/configure.patch b/=
meta-oe/recipes-extended/hplip/hplip-3.12.6/configure.patch
deleted file mode 100644
index 31c005c60c..0000000000
--- a/meta-oe/recipes-extended/hplip/hplip-3.12.6/configure.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Index: hplip-3.12.6/configure.in
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- hplip-3.12.6.orig/configure.in	2014-07-16 20:03:51.310044196 +0000
-+++ hplip-3.12.6/configure.in	2014-07-18 07:53:31.589559192 +0000
-@@ -27,8 +27,7 @@
-=20
- #AC_PREREQ(2.59)
- AC_INIT([HP Linux Imaging and Printing], [3.12.6], [3.12.6], [hplip])
--#AM_INIT_AUTOMAKE([1.9 foreign])
--AM_INIT_AUTOMAKE
-+AM_INIT_AUTOMAKE([1.9 foreign])
- AC_DISABLE_STATIC
-=20
- # Checks for programs.
diff --git a/meta-oe/recipes-extended/hplip/hplip-3.12.6/cups-1.6.patch b/m=
eta-oe/recipes-extended/hplip/hplip-3.12.6/cups-1.6.patch
deleted file mode 100644
index 7df01aab33..0000000000
--- a/meta-oe/recipes-extended/hplip/hplip-3.12.6/cups-1.6.patch
+++ /dev/null
@@ -1,395 +0,0 @@
-Imported from gentoo:
-https://bugs.gentoo.org/show_bug.cgi?id=3D428672
-
-diff -Naur hplip-3.12.6_old/prnt/cupsext/cupsext.c hplip-3.12.6/prnt/cupse=
xt/cupsext.c
---- hplip-3.12.6_old/prnt/cupsext/cupsext.c	2012-08-04 09:18:18.388330038 =
+0200
-+++ hplip-3.12.6/prnt/cupsext/cupsext.c	2012-08-04 09:18:27.855181327 +0200
-@@ -87,6 +87,46 @@
- #define PY_SSIZE_T_MIN INT_MIN=0D
- #endif=0D
- =0D
-+#if (CUPS_VERSION_MAJOR > 1) || (CUPS_VERSION_MINOR > 5)=0D
-+#define HAVE_CUPS_1_6 1=0D
-+#endif=0D
-+=0D
-+#ifndef HAVE_CUPS_1_6=0D
-+#define ippGetCount(attr)     attr->num_values=0D
-+#define ippGetGroupTag(attr)  attr->group_tag=0D
-+#define ippGetValueTag(attr)  attr->value_tag=0D
-+#define ippGetName(attr)      attr->name=0D
-+#define ippGetBoolean(attr, element) attr->values[element].boolean=0D
-+#define ippGetInteger(attr, element) attr->values[element].integer=0D
-+#define ippGetStatusCode(ipp) ipp->request.status.status_code=0D
-+#define ippGetString(attr, element, language) attr->values[element].strin=
g.text=0D
-+=0D
-+static ipp_attribute_t * ippFirstAttribute( ipp_t *ipp )=0D
-+{=0D
-+    if (!ipp)=0D
-+        return (NULL);=0D
-+    return (ipp->current =3D ipp->attrs);=0D
-+}=0D
-+=0D
-+static ipp_attribute_t * ippNextAttribute( ipp_t *ipp )=0D
-+{=0D
-+    if (!ipp || !ipp->current)=0D
-+        return (NULL);=0D
-+    return (ipp->current =3D ipp->current->next);=0D
-+}=0D
-+=0D
-+static int ippSetOperation( ipp_t *ipp, ipp_op_t op )=0D
-+{=0D
-+    ipp->request.op.operation_id =3D op;=0D
-+    return (1);=0D
-+}=0D
-+=0D
-+static int ippSetRequestId( ipp_t *ipp, int request_id )=0D
-+{=0D
-+    ipp->request.any.request_id =3D request_id;=0D
-+    return (1);=0D
-+}=0D
-+#endif=0D
- =0D
- int g_num_options =3D 0;=0D
- cups_option_t * g_options;=0D
-@@ -333,8 +373,8 @@
-     request =3D ippNew();=0D
-     language =3D cupsLangDefault();=0D
- =0D
--    request->request.op.operation_id =3D CUPS_GET_PRINTERS;=0D
--    request->request.any.request_id =3D 1;=0D
-+    ippSetOperation( request, CUPS_GET_PRINTERS );=0D
-+    ippSetRequestId ( request, 1);=0D
- =0D
-     ippAddString( request, IPP_TAG_OPERATION, IPP_TAG_CHARSET,=0D
-                   "attributes-charset", NULL, cupsLangEncoding( language =
) );=0D
-@@ -378,10 +418,10 @@
-         ipp_pstate_t state;=0D
-         int i =3D 0;=0D
- =0D
--        for ( attr =3D response->attrs; attr !=3D NULL; attr =3D attr->ne=
xt )=0D
-+        for ( attr =3D ippFirstAttribute( response ); attr !=3D NULL; att=
r =3D ippNextAttribute( response ) )=0D
-         {=0D
--            while ( attr !=3D NULL && attr->group_tag !=3D IPP_TAG_PRINTE=
R )=0D
--                attr =3D attr->next;=0D
-+            while ( attr !=3D NULL && ippGetGroupTag( attr ) !=3D IPP_TAG=
_PRINTER )=0D
-+                attr =3D ippNextAttribute( response );=0D
- =0D
-             if ( attr =3D=3D NULL )=0D
-                 break;=0D
-@@ -390,41 +430,41 @@
-             state =3D IPP_PRINTER_IDLE;=0D
-             accepting =3D 0;=0D
- =0D
--            while ( attr !=3D NULL && attr->group_tag =3D=3D IPP_TAG_PRIN=
TER )=0D
-+            while ( attr !=3D NULL && ippGetGroupTag( attr ) =3D=3D IPP_T=
AG_PRINTER )=0D
-             {=0D
--                if ( strcmp( attr->name, "printer-name" ) =3D=3D 0 &&=0D
--                        attr->value_tag =3D=3D IPP_TAG_NAME )=0D
--                    name =3D attr->values[ 0 ].string.text;=0D
--=0D
--                else if ( strcmp( attr->name, "device-uri" ) =3D=3D 0 &&=
=0D
--                        attr->value_tag =3D=3D IPP_TAG_URI )=0D
--                    device_uri =3D attr->values[ 0 ].string.text;=0D
--=0D
--                else if ( strcmp( attr->name, "printer-uri-supported" ) =
=3D=3D 0 &&=0D
--                        attr->value_tag =3D=3D IPP_TAG_URI )=0D
--                    printer_uri =3D attr->values[ 0 ].string.text;=0D
--=0D
--                else if ( strcmp( attr->name, "printer-info" ) =3D=3D 0 &=
&=0D
--                        attr->value_tag =3D=3D IPP_TAG_TEXT )=0D
--                    info =3D attr->values[ 0 ].string.text;=0D
--=0D
--                else if ( strcmp( attr->name, "printer-location" ) =3D=3D=
 0 &&=0D
--                        attr->value_tag =3D=3D IPP_TAG_TEXT )=0D
--                    location =3D attr->values[ 0 ].string.text;=0D
--=0D
--                else if ( strcmp( attr->name, "printer-make-and-model" ) =
=3D=3D 0 &&=0D
--                        attr->value_tag =3D=3D IPP_TAG_TEXT )=0D
--                    make_model =3D attr->values[ 0 ].string.text;=0D
--=0D
--                else if ( strcmp( attr->name, "printer-state" ) =3D=3D 0 =
&&=0D
--                        attr->value_tag =3D=3D IPP_TAG_ENUM )=0D
--                    state =3D ( ipp_pstate_t ) attr->values[ 0 ].integer;=
=0D
--=0D
--                else if (!strcmp(attr->name, "printer-is-accepting-jobs")=
 &&=0D
--                        attr->value_tag =3D=3D IPP_TAG_BOOLEAN)=0D
--                    accepting =3D attr->values[ 0 ].boolean;=0D
-+                if ( strcmp( ippGetName( attr ), "printer-name" ) =3D=3D =
0 &&=0D
-+                        ippGetValueTag( attr ) =3D=3D IPP_TAG_NAME )=0D
-+                    name =3D ippGetString( attr, 0, NULL );=0D
-+=0D
-+                else if ( strcmp( ippGetName( attr ), "device-uri" ) =3D=
=3D 0 &&=0D
-+                        ippGetValueTag( attr ) =3D=3D IPP_TAG_URI )=0D
-+                    device_uri =3D ippGetString( attr, 0, NULL );=0D
-+=0D
-+                else if ( strcmp( ippGetName( attr ), "printer-uri-suppor=
ted" ) =3D=3D 0 &&=0D
-+                        ippGetValueTag( attr ) =3D=3D IPP_TAG_URI )=0D
-+                    printer_uri =3D ippGetString( attr, 0, NULL );=0D
-+=0D
-+                else if ( strcmp( ippGetName( attr ), "printer-info" ) =
=3D=3D 0 &&=0D
-+                        ippGetValueTag( attr ) =3D=3D IPP_TAG_TEXT )=0D
-+                    info =3D ippGetString( attr, 0, NULL );=0D
-+=0D
-+                else if ( strcmp( ippGetName( attr ), "printer-location" =
) =3D=3D 0 &&=0D
-+                        ippGetValueTag( attr ) =3D=3D IPP_TAG_TEXT )=0D
-+                    location =3D ippGetString( attr, 0, NULL );=0D
-+=0D
-+                else if ( strcmp( ippGetName( attr ), "printer-make-and-m=
odel" ) =3D=3D 0 &&=0D
-+                        ippGetValueTag( attr ) =3D=3D IPP_TAG_TEXT )=0D
-+                    make_model =3D ippGetString( attr, 0, NULL );=0D
-+=0D
-+                else if ( strcmp( ippGetName( attr ), "printer-state" ) =
=3D=3D 0 &&=0D
-+                        ippGetValueTag( attr ) =3D=3D IPP_TAG_ENUM )=0D
-+                    state =3D ( ipp_pstate_t ) ippGetInteger( attr, 0 );=
=0D
-+=0D
-+                else if (!strcmp(ippGetName( attr ), "printer-is-acceptin=
g-jobs") &&=0D
-+                        ippGetValueTag( attr ) =3D=3D IPP_TAG_BOOLEAN)=0D
-+                    accepting =3D ippGetBoolean( attr, 0 );=0D
- =0D
--                attr =3D attr->next;=0D
-+                attr =3D ippNextAttribute( response );=0D
-             }=0D
- =0D
-             if ( device_uri =3D=3D NULL )=0D
-@@ -522,8 +562,8 @@
-     request =3D ippNew();=0D
-     language =3D cupsLangDefault();=0D
- =0D
--    request->request.op.operation_id =3D CUPS_ADD_PRINTER;=0D
--    request->request.any.request_id =3D 1;=0D
-+    ippSetOperation( request, CUPS_ADD_PRINTER );=0D
-+    ippSetRequestId ( request, 1 );=0D
- =0D
-     ippAddString( request, IPP_TAG_OPERATION, IPP_TAG_CHARSET,=0D
-                   "attributes-charset", NULL, cupsLangEncoding( language =
) );=0D
-@@ -568,7 +608,7 @@
-     }=0D
-     else=0D
-     {=0D
--        status =3D response->request.status.status_code;=0D
-+        status =3D ippGetStatusCode( response );=0D
-         //ippDelete( response );=0D
-         r =3D 1;=0D
-     }=0D
-@@ -631,8 +671,8 @@
-        */=0D
-     request =3D ippNew();=0D
- =0D
--    request->request.op.operation_id =3D CUPS_DELETE_PRINTER;=0D
--    request->request.op.request_id =3D 1;=0D
-+    ippSetOperation( request, CUPS_DELETE_PRINTER );=0D
-+    ippSetRequestId ( request, 1 );=0D
- =0D
-     language =3D cupsLangDefault();=0D
- =0D
-@@ -650,7 +690,7 @@
-      */=0D
-     response =3D cupsDoRequest( http, request, "/admin/" );=0D
- =0D
--    if ( ( response !=3D NULL ) && ( response->request.status.status_code=
 <=3D IPP_OK_CONFLICT ) )=0D
-+    if ( ( response !=3D NULL ) && ( ippGetStatusCode( response ) <=3D IP=
P_OK_CONFLICT ) )=0D
-     {=0D
-         r =3D 1;=0D
-     }=0D
-@@ -721,8 +761,8 @@
- =0D
-     request =3D ippNew();=0D
- =0D
--    request->request.op.operation_id =3D CUPS_SET_DEFAULT;=0D
--    request->request.op.request_id =3D 1;=0D
-+    ippSetOperation( request, CUPS_SET_DEFAULT );=0D
-+    ippSetRequestId ( request, 1 );=0D
- =0D
-     language =3D cupsLangDefault();=0D
- =0D
-@@ -743,7 +783,7 @@
- =0D
-     response =3D cupsDoRequest( http, request, "/admin/" );=0D
- =0D
--    if ( ( response !=3D NULL ) && ( response->request.status.status_code=
 <=3D IPP_OK_CONFLICT ) )=0D
-+    if ( ( response !=3D NULL ) && ( ippGetStatusCode( response ) <=3D IP=
P_OK_CONFLICT ) )=0D
-     {=0D
-         r =3D 1;=0D
-     }=0D
-@@ -797,8 +837,8 @@
- =0D
-     request =3D ippNew();=0D
- =0D
--    request->request.op.operation_id =3D op;=0D
--    request->request.op.request_id =3D 1;=0D
-+    ippSetOperation( request, op );=0D
-+    ippSetRequestId ( request, 1 );=0D
- =0D
-     language =3D cupsLangDefault();=0D
- =0D
-@@ -822,7 +862,7 @@
- =0D
-     response =3D cupsDoRequest(http, request, "/admin/");=0D
- =0D
--    if (( response !=3D NULL ) && (response->request.status.status_code <=
=3D IPP_OK_CONFLICT))=0D
-+    if (( response !=3D NULL ) && (ippGetStatusCode( response ) <=3D IPP_=
OK_CONFLICT))=0D
-     {=0D
-         r =3D 1;=0D
-     }=0D
-@@ -837,7 +877,7 @@
-     if ( response !=3D NULL )=0D
-         ippDelete( response );=0D
- =0D
--    return Py_BuildValue( "i", r );;=0D
-+    return Py_BuildValue( "i", r );=0D
- }=0D
- =0D
- =0D
-@@ -1116,8 +1156,8 @@
- =0D
-     request =3D ippNew();=0D
- =0D
--    request->request.op.operation_id =3D CUPS_GET_PPDS;=0D
--    request->request.op.request_id   =3D 1;=0D
-+    ippSetOperation( request, CUPS_GET_PPDS );=0D
-+    ippSetRequestId ( request, 1 );=0D
- =0D
-     language =3D cupsLangDefault();=0D
- =0D
-@@ -1143,43 +1183,43 @@
-     if ((response =3D cupsDoRequest(http, request, "/")) !=3D NULL)=0D
-     {=0D
- =0D
--        for (attr =3D response->attrs; attr; attr =3D attr->next)=0D
-+        for (attr =3D ippFirstAttribute( response ); attr; attr =3D ippNe=
xtAttribute( response ))=0D
-         {=0D
-             PyObject *dict;=0D
-             char *ppdname =3D NULL;=0D
- =0D
--            while (attr && attr->group_tag !=3D IPP_TAG_PRINTER)=0D
--                attr =3D attr->next;=0D
-+            while (attr && ippGetGroupTag( attr ) !=3D IPP_TAG_PRINTER)=0D
-+                attr =3D ippNextAttribute( response );=0D
- =0D
-             if (!attr)=0D
-                 break;=0D
- =0D
-             dict =3D PyDict_New ();=0D
- =0D
--            for (; attr && attr->group_tag =3D=3D IPP_TAG_PRINTER; attr =
=3D attr->next)=0D
-+            for (; attr && ippGetGroupTag( attr ) =3D=3D IPP_TAG_PRINTER;=
 attr =3D ippNextAttribute( response ))=0D
-             {=0D
-                 PyObject *val =3D NULL;=0D
- =0D
--                if (!strcmp (attr->name, "ppd-name") && attr->value_tag =
=3D=3D IPP_TAG_NAME)=0D
-+                if (!strcmp (ippGetName( attr ), "ppd-name") && ippGetVal=
ueTag( attr ) =3D=3D IPP_TAG_NAME)=0D
-                 {=0D
--                    ppdname =3D attr->values[0].string.text;=0D
-+                    ppdname =3D ippGetString( attr, 0, NULL );=0D
- =0D
-                     //sprintf( buf, "print '%s'", ppdname);=0D
-                     //PyRun_SimpleString( buf );=0D
-                 }=0D
- =0D
--                else if (attr->value_tag =3D=3D IPP_TAG_TEXT || attr->val=
ue_tag =3D=3D IPP_TAG_NAME || attr->value_tag =3D=3D IPP_TAG_KEYWORD)=0D
--                //else if ((!strcmp (attr->name, "ppd-natural-language") =
&& attr->value_tag =3D=3D IPP_TAG_LANGUAGE) ||=0D
--                //    (!strcmp (attr->name, "ppd-make-and-model") && attr=
->value_tag =3D=3D IPP_TAG_TEXT) ||=0D
--                //    (!strcmp (attr->name, "ppd-make") && attr->value_ta=
g =3D=3D IPP_TAG_TEXT) ||=0D
--                //    (!strcmp (attr->name, "ppd-device-id") && attr->val=
ue_tag =3D=3D IPP_TAG_TEXT))=0D
-+                else if (ippGetValueTag( attr ) =3D=3D IPP_TAG_TEXT || ip=
pGetValueTag( attr ) =3D=3D IPP_TAG_NAME || ippGetValueTag( attr ) =3D=3D I=
PP_TAG_KEYWORD)=0D
-+                //else if ((!strcmp (ippGetName( attr ), "ppd-natural-lan=
guage") && ippGetValueTag( attr ) =3D=3D IPP_TAG_LANGUAGE) ||=0D
-+                //    (!strcmp (ippGetName( attr ), "ppd-make-and-model")=
 && ippGetValueTag( attr ) =3D=3D IPP_TAG_TEXT) ||=0D
-+                //    (!strcmp (ippGetName( attr ), "ppd-make") && ippGet=
ValueTag( attr ) =3D=3D IPP_TAG_TEXT) ||=0D
-+                //    (!strcmp (ippGetName( attr ), "ppd-device-id") && i=
ppGetValueTag( attr ) =3D=3D IPP_TAG_TEXT))=0D
-                 {=0D
--                    val =3D PyObj_from_UTF8(attr->values[0].string.text);=
=0D
-+                    val =3D PyObj_from_UTF8(ippGetString( attr, 0, NULL )=
);=0D
-                 }=0D
- =0D
-                 if (val)=0D
-                 {=0D
--                    PyDict_SetItemString (dict, attr->name, val);=0D
-+                    PyDict_SetItemString (dict, ippGetName( attr ), val);=
=0D
-                     Py_DECREF (val);=0D
-                 }=0D
-             }=0D
-diff -Naur hplip-3.12.6_old/scan/sane/hpaio.c hplip-3.12.6/scan/sane/hpaio=
.c
---- hplip-3.12.6_old/scan/sane/hpaio.c	2012-08-04 09:18:21.458389913 +0200
-+++ hplip-3.12.6/scan/sane/hpaio.c	2012-08-04 09:18:27.875181720 +0200
-@@ -47,6 +47,43 @@
- #define DEBUG_DECLARE_ONLY
- #include "sanei_debug.h"
-=20
-+#if (CUPS_VERSION_MAJOR > 1) || (CUPS_VERSION_MINOR > 5)
-+#define HAVE_CUPS_1_6 1
-+#endif
-+
-+#ifndef HAVE_CUPS_1_6
-+#define ippGetGroupTag(attr)  attr->group_tag
-+#define ippGetValueTag(attr)  attr->value_tag
-+#define ippGetName(attr)      attr->name
-+#define ippGetString(attr, element, language) attr->values[element].strin=
g.text
-+
-+static ipp_attribute_t * ippFirstAttribute( ipp_t *ipp )
-+{
-+    if (!ipp)
-+        return (NULL);
-+    return (ipp->current =3D ipp->attrs);
-+}
-+
-+static ipp_attribute_t * ippNextAttribute( ipp_t *ipp )
-+{
-+    if (!ipp || !ipp->current)
-+        return (NULL);
-+    return (ipp->current =3D ipp->current->next);
-+}
-+
-+static int ippSetOperation( ipp_t *ipp, ipp_op_t op )
-+{
-+    ipp->request.op.operation_id =3D op;
-+    return (1);
-+}
-+
-+static int ippSetRequestId( ipp_t *ipp, int request_id )
-+{
-+    ipp->request.any.request_id =3D request_id;
-+    return (1);
-+}
-+#endif
-+
- static SANE_Device **DeviceList =3D NULL;
-=20
- static int AddDeviceList(char *uri, char *model, SANE_Device ***pd)
-@@ -186,8 +223,8 @@
-    /* Assemble the IPP request */
-    request =3D ippNew();
-=20
--   request->request.op.operation_id =3D CUPS_GET_PRINTERS;
--   request->request.any.request_id  =3D 1;
-+   ippSetOperation( request, CUPS_GET_PRINTERS );
-+   ippSetRequestId( request, 1 );
-=20
-    ippAddString(request, IPP_TAG_OPERATION, IPP_TAG_CHARSET, "attributes-=
charset", NULL, "utf-8");
-    ippAddString(request, IPP_TAG_OPERATION, IPP_TAG_LANGUAGE, "attributes=
-natural-language", NULL, "en");
-@@ -197,20 +234,20 @@
-    if ((response =3D cupsDoRequest(http, request, "/")) =3D=3D NULL)
-       goto bugout;
-=20
--   for (attr =3D response->attrs; attr !=3D NULL; attr =3D attr->next)
-+   for (attr =3D ippFirstAttribute ( response ); attr !=3D NULL; attr =3D=
 ippNextAttribute( response ))
-    {
-       /* Skip leading attributes until we hit a printer. */
--      while (attr !=3D NULL && attr->group_tag !=3D IPP_TAG_PRINTER)
--         attr =3D attr->next;
-+      while (attr !=3D NULL && ippGetGroupTag( attr ) !=3D IPP_TAG_PRINTE=
R)
-+         attr =3D ippNextAttribute( response );
-=20
-       if (attr =3D=3D NULL)
-          break;
-=20
--      while (attr !=3D NULL && attr->group_tag =3D=3D IPP_TAG_PRINTER)
-+      while (attr !=3D NULL && ippGetGroupTag( attr ) =3D=3D IPP_TAG_PRIN=
TER)
-       {
--         if (strcmp(attr->name, "device-uri") =3D=3D 0 && attr->value_tag=
 =3D=3D IPP_TAG_URI && AddCupsList(attr->values[0].string.text, printer) =
=3D=3D 0)
-+         if (strcmp(ippGetName( attr ), "device-uri") =3D=3D 0 && ippGetV=
alueTag( attr ) =3D=3D IPP_TAG_URI && AddCupsList(ippGetString( attr, 0, NU=
LL ), printer) =3D=3D 0)
-             cnt++;
--         attr =3D attr->next;
-+         attr =3D ippNextAttribute( response );
-       }
-=20
-       if (attr =3D=3D NULL)
diff --git a/meta-oe/recipes-extended/hplip/hplip-3.12.6/fix-libusb-paths.p=
atch b/meta-oe/recipes-extended/hplip/hplip-3.12.6/fix-libusb-paths.patch
deleted file mode 100644
index b347f831cb..0000000000
--- a/meta-oe/recipes-extended/hplip/hplip-3.12.6/fix-libusb-paths.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff -rupN hplip-3.12.6_orig/configure.in hplip-3.12.6/configure.in
---- hplip-3.12.6_orig/configure.in	2012-06-18 20:44:24.000000000 +1000
-+++ hplip-3.12.6/configure.in	2012-08-16 13:40:07.259927650 +1000
-@@ -524,6 +524,8 @@ if test "$hpijs_only_build" =3D "no"; then
-       AC_CHECK_HEADERS(usb.h, ,[AC_MSG_ERROR([cannot find libusb-devel su=
pport], 11)])
-    else
-       AC_CHECK_LIB([usb-1.0], [libusb_init], [LIBS=3D"$LIBS"], [AC_MSG_ER=
ROR([cannot find libusb 1.0 support], 2)])
-+      LIBUSBINCLUDEROOT?=3D"/usr/include/"
-+      AC_ARG_VAR(LIBUSBINCLUDEROOT, [path to libusb-1.0 folder])
-       AC_CHECK_HEADERS(libusb-1.0/libusb.h, ,[AC_MSG_ERROR([cannot find l=
ibusb-1.0-devel support], 11)])
-    fi
- fi
-diff -rupN hplip-3.12.6_orig/Makefile.am hplip-3.12.6/Makefile.am
---- hplip-3.12.6_orig/Makefile.am	2012-06-18 20:44:13.000000000 +1000
-+++ hplip-3.12.6/Makefile.am	2012-08-16 13:41:12.307932822 +1000
-@@ -72,7 +72,7 @@ libhpmud_la_SOURCES =3D io/hpmud/hpmud.c i
- 	  io/hpmud/hpmud.h io/hpmud/hpmudi.h io/hpmud/list.h io/hpmud/mlc.h io/h=
pmud/pml.h io/hpmud/dot4.c \
- 	  io/hpmud/dot4.h io/hpmud/jd.c io/hpmud/jd.h io/hpmud/pp.c io/hpmud/pp.=
h io/hpmud/musb.h io/hpmud/musb_libusb01.c
- else
--libhpmud_la_CFLAGS =3D -I/usr/include/libusb-1.0 -DMUDNAME=3D\"$(MUDNAME)=
\" -DCONFDIR=3D\"$(hplip_confdir)\"
-+libhpmud_la_CFLAGS =3D -I/$(LIBUSBINCLUDEROOT)/libusb-1.0 -DMUDNAME=3D\"$=
(MUDNAME)\" -DCONFDIR=3D\"$(hplip_confdir)\"
- libhpmud_la_SOURCES =3D io/hpmud/hpmud.c io/hpmud/mlc.c io/hpmud/model.c =
io/hpmud/pml.c \
- 	  io/hpmud/hpmud.h io/hpmud/hpmudi.h io/hpmud/list.h io/hpmud/mlc.h io/h=
pmud/pml.h io/hpmud/dot4.c \
- 	  io/hpmud/dot4.h io/hpmud/jd.c io/hpmud/jd.h io/hpmud/pp.c io/hpmud/pp.=
h io/hpmud/musb.h io/hpmud/musb.c
-@@ -286,7 +286,7 @@ hpmudext_la_LIBADD =3D libhpmud.la
- if LIBUSB01_BUILD
- hpmudext_la_CFLAGS =3D -I$(PYTHONINCLUDEDIR)
- else
--hpmudext_la_CFLAGS =3D-I/usr/include/libusb-1.0 -I$(PYTHONINCLUDEDIR)
-+hpmudext_la_CFLAGS =3D-I$(LIBUSBINCLUDEROOT)/libusb-1.0 -I$(PYTHONINCLUDE=
DIR)
- endif
-=20
- # ui (qt3)
diff --git a/meta-oe/recipes-extended/hplip/hplip-3.12.6/setup-add-sleep-af=
ter-cups-reset.patch b/meta-oe/recipes-extended/hplip/hplip-3.12.6/setup-ad=
d-sleep-after-cups-reset.patch
deleted file mode 100644
index 0e1b6c4ed3..0000000000
--- a/meta-oe/recipes-extended/hplip/hplip-3.12.6/setup-add-sleep-after-cup=
s-reset.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
---- hplip-3.11.10/setup.py.orig	2011-10-02 14:06:19.000000000 +1100
-+++ hplip-3.11.10/setup.py	2012-02-29 08:21:39.167999938 +1100
-@@ -573,6 +573,7 @@
-=20
-             log.debug("Restarting CUPS...")
-             status, output =3D utils.run(restart_cups())
-+            time.sleep(3)
-             log.debug("Restart CUPS returned: exit=3D%d output=3D%s" % (s=
tatus, output))
-=20
-             cups.setPasswordPrompt("You do not have permission to add a p=
rinter.")
diff --git a/meta-oe/recipes-extended/hplip/hplip/030-replace_unsafe_memcpy=
_with_memmove.patch b/meta-oe/recipes-extended/hplip/hplip/030-replace_unsa=
fe_memcpy_with_memmove.patch
new file mode 100644
index 0000000000..2babb2b67a
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip/030-replace_unsafe_memcpy_with_m=
emmove.patch
@@ -0,0 +1,15 @@
+https://bugs.launchpad.net/hplip/+bug/1672256
+
+memcpy should never be used with overlapping memory regions
+
+--- a/io/hpmud/musb.c
++++ b/io/hpmud/musb.c
+@@ -775,7 +775,7 @@ static int device_id(int fd, unsigned ch
+         len =3D size-1;   /* leave byte for zero termination */
+     if (len > 2)
+         len -=3D 2;
+-    memcpy(buffer, buffer+2, len);    /* remove length */
++    memmove(buffer, buffer+2, len);    /* remove length */
+     buffer[len]=3D0;
+     DBG("read actual device_id successfully fd=3D%d len=3D%d\n", fd, len);
+=20
diff --git a/meta-oe/recipes-extended/hplip/hplip/050-fix-glibcisms.patch b=
/meta-oe/recipes-extended/hplip/hplip/050-fix-glibcisms.patch
new file mode 100644
index 0000000000..e020bd4642
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip/050-fix-glibcisms.patch
@@ -0,0 +1,17 @@
+diff --git a/scan/sane/OrbliteScan/LinuxCommon.h b/scan/sane/OrbliteScan/L=
inuxCommon.h
+index 6605dd9..55c7110 100644
+--- a/scan/sane/OrbliteScan/LinuxCommon.h
++++ b/scan/sane/OrbliteScan/LinuxCommon.h
+@@ -18,10 +18,8 @@ typedef u_int32_t			UInt32;
+ typedef int32_t				SInt32;=0D
+ //typedef unsigned long			UInt32;=0D
+ //typedef signed long			SInt32;=0D
+-typedef __S64_TYPE			SInt64;=0D
+-typedef __U64_TYPE			UInt64;=0D
+-typedef __S64_TYPE			int64_t;=0D
+-typedef __U64_TYPE			uint64_t;=0D
++typedef int64_t 			SInt64;=0D
++typedef uint64_t			UInt64;=0D
+ =0D
+ //typedef unsigned long	ULONG;=0D
+ //typedef void*			LPVOID;=0D
diff --git a/meta-oe/recipes-extended/hplip/hplip/600-fix.patch b/meta-oe/r=
ecipes-extended/hplip/hplip/600-fix.patch
new file mode 100644
index 0000000000..91a5035ae9
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip/600-fix.patch
@@ -0,0 +1,10 @@
+--- a/configure.in
++++ b/configure.in
+@@ -254,7 +254,6 @@ if test "$class_driver" =3D "yes"; then
+    test `sh ./createPPD.sh -f` =3D=3D 0
+ else
+    AC_MSG_RESULT(no)
+-   test `sh ./createPPD.sh -q` =3D=3D 0
+ fi
+ AM_CONDITIONAL(HPLIP_CLASS_DRIVER, test x$class_driver =3D xyes)
+=20
diff --git a/meta-oe/recipes-extended/hplip/hplip/999-remove-lImageProcesso=
r.patch b/meta-oe/recipes-extended/hplip/hplip/999-remove-lImageProcessor.p=
atch
new file mode 100644
index 0000000000..aee4ac50cc
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip/999-remove-lImageProcessor.patch
@@ -0,0 +1,69 @@
+# ../bin/ld: cannot find -lImageProcessor
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -590,11 +590,10 @@ hpcups_SOURCES =3D prnt/hpcups/HPCupsFilte
+ 	prnt/hpcups/flate_colorspace.h prnt/hpcups/RunLenEncoding.h prnt/hpcups/=
common_defines.h \
+ 	prnt/hpcups/genPCLm.h \
+ 	common/utils.c common/utils.h prnt/hpcups/Hbpl1_Wrapper.cpp prnt/hpcups/=
genPCLm.cpp \
+-	prnt/hpcups/genJPEGStrips.cpp prnt/hpcups/RunLenEncoding.cpp \
+-	prnt/hpcups/ImageProcessor.h
++	prnt/hpcups/genJPEGStrips.cpp prnt/hpcups/RunLenEncoding.cpp
+=20
+ hpcups_CXXFLAGS =3D $(APDK_ENDIAN_FLAG) $(DBUS_CFLAGS)
+-hpcups_LDADD =3D -L./prnt/hpcups/ -ljpeg -ldl -lImageProcessor -lcups -lc=
upsimage -lz $(DBUS_LIBS)
++hpcups_LDADD =3D -L./prnt/hpcups/ -ljpeg -ldl -lcups -lcupsimage -lz $(DB=
US_LIBS)
+ #else
+ #hpcupsdir =3D $(cupsfilterdir)
+ #hpcups_PROGRAMS =3D hpcups
+--- a/prnt/hpcups/HPCupsFilter.cpp
++++ b/prnt/hpcups/HPCupsFilter.cpp
+@@ -637,16 +637,10 @@ int HPCupsFilter::processRasterData(cups
+=20
+=20
+     sprintf(hpPreProcessedRasterFile, "%s/hp_%s_cups_SwapedPagesXXXXXX",C=
UPS_TMP_DIR, m_JA.user_name);
+-    image_processor_t* imageProcessor =3D imageProcessorCreate();
+=20
+     while (cupsRasterReadHeader2(cups_raster, &cups_header))
+     {
+=20
+-        IMAGE_PROCESSOR_ERROR result =3D imageProcessorStartPage(imagePro=
cessor, &cups_header);
+-        if (result !=3D IPE_SUCCESS){
+-            dbglog("DEBUG: imageProcessorStartPage failed result =3D %d\n=
", result);
+-        }
+-
+         current_page_number++;
+=20
+         if (current_page_number =3D=3D 1) {
+@@ -745,11 +739,6 @@ int HPCupsFilter::processRasterData(cups
+             color_raster =3D rgbRaster;
+             black_raster =3D kRaster;
+=20
+-            result =3D imageProcessorProcessLine(imageProcessor, m_pPrint=
erBuffer, cups_header.cupsBytesPerLine);
+-            if (result !=3D IPE_SUCCESS){
+-                dbglog("DEBUG: imageProcessorProcessLine failed result =
=3D %d\n", result);
+-            }
+-
+=20
+             if ((y =3D=3D 0) && !is_ljmono) {
+                 //For ljmono, make sure that first line is not a blankRas=
ter line.Otherwise printer
+@@ -780,11 +769,6 @@ int HPCupsFilter::processRasterData(cups
+             }
+         }  // for() loop end
+=20
+-        result =3D imageProcessorEndPage(imageProcessor);
+-        if (result !=3D IPE_SUCCESS){
+-                dbglog("DEBUG: imageProcessorEndPage failed result =3D %d=
\n", result);
+-        }
+-
+=20
+         m_Job.NewPage();
+         if (err !=3D NO_ERROR) {
+@@ -800,8 +784,6 @@ int HPCupsFilter::processRasterData(cups
+         rgbRaster =3D NULL;
+     }
+=20
+-    imageProcessorDestroy(imageProcessor);
+-
+     unlink(hpPreProcessedRasterFile);
+     return ret_status;
+ }
diff --git a/meta-oe/recipes-extended/hplip/hplip/configure.patch b/meta-oe=
/recipes-extended/hplip/hplip/configure.patch
new file mode 100644
index 0000000000..8fe77c5edf
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip/configure.patch
@@ -0,0 +1,12 @@
+--- a/configure.in
++++ b/configure.in
+@@ -27,8 +27,7 @@
+=20
+ #AC_PREREQ(2.59)
+ AC_INIT([HP Linux Imaging and Printing], [3.19.12], [3.19.12], [hplip])
+-#AM_INIT_AUTOMAKE([1.9 foreign])
+-AM_INIT_AUTOMAKE
++AM_INIT_AUTOMAKE([foreign])
+ AC_DISABLE_STATIC
+=20
+ # Checks for programs.
diff --git a/meta-oe/recipes-extended/hplip/hplip/fix-libusb-paths.patch b/=
meta-oe/recipes-extended/hplip/hplip/fix-libusb-paths.patch
new file mode 100644
index 0000000000..6aa1de0a8a
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip/fix-libusb-paths.patch
@@ -0,0 +1,33 @@
+Upstream-Status: Inappropriate [configuration]
+
+--- a/configure.in
++++ b/configure.in
+@@ -599,6 +599,8 @@ if test "$class_driver" =3D "no" && test "
+       AC_CHECK_HEADERS(usb.h, ,[AC_MSG_ERROR([cannot find libusb-devel su=
pport], 11)])
+    else
+       AC_CHECK_LIB([usb-1.0], [libusb_init], [LIBS=3D"$LIBS"], [AC_MSG_ER=
ROR([cannot find libusb 1.0 support], 2)])
++      LIBUSBINCLUDEROOT?=3D"/usr/include/"
++      AC_ARG_VAR(LIBUSBINCLUDEROOT, [path to libusb-1.0 folder])
+       AC_CHECK_HEADERS(libusb-1.0/libusb.h, ,[AC_MSG_ERROR([cannot find l=
ibusb-1.0-devel support], 11)])
+    fi
+ fi
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -109,7 +109,7 @@ libhpmud_la_SOURCES +=3D io/hpmud/musb_lib
+ libhpmud_la_LDFLAGS +=3D -lusb
+ else
+ libhpmud_la_SOURCES +=3D io/hpmud/musb.c=20
+-libhpmud_la_CFLAGS  +=3D -I/usr/include/libusb-1.0
++libhpmud_la_CFLAGS  +=3D -I$(LIBUSBINCLUDEROOT)/libusb-1.0
+ libhpmud_la_LDFLAGS +=3D -lusb-1.0
+ endif
+=20
+@@ -362,7 +362,7 @@ hpmudext_la_CFLAGS +=3D -Iprotocol/discove
+ endif
+=20
+ if !LIBUSB01_BUILD
+-hpmudext_la_CFLAGS +=3D-I/usr/include/libusb-1.0=20
++hpmudext_la_CFLAGS +=3D-I$(LIBUSBINCLUDEROOT)/libusb-1.0=20
+ endif
+ endif #!HPLIP_CLASS_DRIVER
+ # ui (qt3)
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb b/meta-oe/recip=
es-extended/hplip/hplip_3.12.6.bb
deleted file mode 100644
index 765a84643e..0000000000
--- a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
+++ /dev/null
@@ -1,75 +0,0 @@
-SUMMARY =3D "HP Linux Imaging and Printing"
-LICENSE=3D"GPLv2"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D442bb3cbbeeb60643a87325718b8a8e=
e"
-
-PR =3D "r1"
-
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
-           file://setup-add-sleep-after-cups-reset.patch \
-           file://fix-libusb-paths.patch \
-           file://cups-1.6.patch \
-           file://configure.patch \
-           file://0001-include-cups-ppd.h-for-missing-ppd-definitions.patc=
h \
-"
-
-DEPENDS +=3D "cups python libusb"
-
-inherit autotools-brokensep python3-dir python3native pkgconfig
-
-export STAGING_INCDIR
-export STAGING_LIBDIR
-
-EXTRA_OECONF +=3D "\
-        LIBUSBINCLUDEROOT=3D${STAGING_INCDIR} \
-        --disable-network-build \
-        --disable-doc-build \
-        --disable-pp-build \
-        --disable-scan-build \
-        --disable-gui-build \
-        --disable-fax-build \
-        --disable-policykit  \
-        --disable-qt4 \
-        --disable-qt3 \
-        --disable-dbus-build \
-        --disable-foomatic-drv-install \
-        --enable-foomatic-ppd-install  \
-        --enable-foomatic-rip-hplip-install \
-        --with-cupsbackenddir=3D${libdir}/cups/backend \
-        --with-cupsfilterdir=3D${libdir}/cups/filter \
-"
-
-PACKAGES +=3D "${PN}-ppd ${PN}-cups ${PN}-backend ${PN}-filter ${PN}-hal"
-
-RDEPENDS_${PN} +=3D " \
-        python \
-        python-syslog \
-        python-pprint \
-        python-compression \
-        python-shell \
-        python-xml \
-        python-unixadmin \
-        python-html \
-        python-resource \
-        python-terminal \
-        python-subprocess\
-"
-RDEPENDS_${PN}-filter +=3D "perl"
-
-# need to snag the debug file or OE will fail on backend package
-FILES_${PN}-dbg +=3D "\
-        ${libdir}/cups/backend/.debug \
-        ${PYTHON_SITEPACKAGES_DIR}/.debug \
-        ${libdir}/cups/filter/.debug "
-
-FILES_${PN}-dev +=3D "${PYTHON_SITEPACKAGES_DIR}/*.la"
-FILES_${PN}-ppd =3D "${datadir}/ppd"
-FILES_${PN}-cups =3D "${datadir}/cups"
-FILES_${PN}-backend =3D "${libdir}/cups/backend"
-FILES_${PN}-filter =3D "${libdir}/cups/filter"
-FILES_${PN}-hal =3D "${datadir}/hal"
-
-FILES_${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}/*.so"
-
-SRC_URI[md5sum] =3D "5303938e8630775ea6fb383af85775e5"
-SRC_URI[sha256sum] =3D "54578000792969adb583e75efeacb9c46ab69659ec7e9424de=
390613f3595775"
-
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.19.12.bb b/meta-oe/reci=
pes-extended/hplip/hplip_3.19.12.bb
new file mode 100644
index 0000000000..834bcbc734
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip_3.19.12.bb
@@ -0,0 +1,87 @@
+SUMMARY =3D "HP Linux Imaging and Printing"
+LICENSE=3D"GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D20f2c819499cc2063e9a7b07b408815=
c"
+
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
+           file://configure.patch \
+           file://fix-libusb-paths.patch \
+           file://999-remove-lImageProcessor.patch \
+           file://600-fix.patch \
+           file://030-replace_unsafe_memcpy_with_memmove.patch \
+           file://050-fix-glibcisms.patch \
+"
+SRC_URI[md5sum] =3D "d72bc77d791c150c2c22b84e9553bab3"
+SRC_URI[sha256sum] =3D "b7f398502fb659e0de8e54976237e3c6a64fec0b3c36054a51=
5876f7b006b255"
+
+DEPENDS +=3D "cups python3 libusb"
+
+inherit autotools-brokensep python3-dir python3native pkgconfig systemd
+
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+CFLAGS +=3D "-I${STAGING_INCDIR}/python${PYTHON_BASEVERSION}${PYTHON_ABI}"
+
+EXTRA_OECONF +=3D "\
+        LIBUSBINCLUDEROOT=3D${STAGING_INCDIR} \
+        --enable-cups-ppd-install \
+        --disable-network-build \
+        --disable-doc-build \
+        --disable-pp-build \
+        --disable-scan-build \
+        --disable-gui-build \
+        --disable-fax-build \
+        --disable-policykit  \
+        --disable-qt4 \
+        --disable-qt3 \
+        --disable-dbus-build \
+        --enable-foomatic-drv-install \
+        --disable-foomatic-ppd-install \
+        --disable-foomatic-rip-hplip-install \
+        --with-cupsbackenddir=3D${libdir}/cups/backend \
+        --with-cupsfilterdir=3D${libdir}/cups/filter \
+"
+
+EXTRA_OEMAKE =3D "rulessystemdir=3D${systemd_unitdir}/system/"
+
+do_install_append() {
+    rm -rf ${D}${datadir}/hplip/upgrade.py
+    rm -rf ${D}${datadir}/hplip/uninstall.py
+    sed -i -e "s|/usr/bin/env python|/usr/bin/env python3|g" ${D}${datadir=
}/hplip/*.py
+    sed -i -e "s|/usr/bin/python|/usr/bin/env python3|g" ${D}${datadir}/hp=
lip/*.py
+}
+
+PACKAGES +=3D "${PN}-ppd ${PN}-cups ${PN}-backend ${PN}-filter ${PN}-hal"
+
+RDEPENDS_${PN} +=3D " \
+        python3\
+        python3-syslog \
+        python3-pprint \
+        python3-compression \
+        python3-shell \
+        python3-xml \
+        python3-unixadmin \
+        python3-html \
+        python3-resource \
+        python3-terminal \
+"
+RDEPENDS_${PN}-filter +=3D "perl"
+
+# need to snag the debug file or OE will fail on backend package
+FILES_${PN}-dbg +=3D "\
+        ${libdir}/cups/backend/.debug \
+        ${PYTHON_SITEPACKAGES_DIR}/.debug \
+        ${libdir}/cups/filter/.debug "
+
+FILES_${PN}-dev +=3D "${PYTHON_SITEPACKAGES_DIR}/*.la"
+FILES_${PN}-ppd =3D "${datadir}/ppd"
+FILES_${PN}-cups =3D "${datadir}/cups"
+FILES_${PN}-backend =3D "${libdir}/cups/backend"
+FILES_${PN}-filter =3D "${libdir}/cups/filter"
+FILES_${PN}-hal =3D "${datadir}/hal"
+
+FILES_${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}/*.so"
+
+SYSTEMD_SERVICE_${PN} =3D "hplip-printer@.service"
+
+CLEANBROKEN =3D "1"
--=20
2.25.0


