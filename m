Received: from mail-ea0-f169.google.com ([209.85.215.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmkqV-0001o5-E9
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:40:02 +0100
Received: by mail-ea0-f169.google.com with SMTP id a12so2618669eaa.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=lqH0veIEh5o7YrMpQrZDqxClhoDThwwXHND345CCszk=;
	b=Htv7KI2xWQOv917sHUHAC0xet46d+AeEb7VlIqs+thK8DRs68Qot+r5U6DdfHoJ1lA
	MewOuDr83usfLUB11nC1MwKw0B/eBKHZ7veL+IX5KlA0rBIy5r6YxidhwEGDEW1j2gH2
	M490ql42uvao6sPoaip0Oc+oESwK7PEq/moCDlk9/yJMsgG5/ssXXwlKNeYXmX/W0Djf
	GaYKENgT/05qttPy6BzHmYad3fuzgWt3GjaoQv8HsMba7Gv7Rj2Y6lZc1dDnJC6wdoVY
	bp1aSLBoifsJ+2bsTBvf/WyWrZkF5OOiBCxRqd5vjczdHWnH1wNe1o+hfzsjEjZVuIqJ
	k2Zw==
X-Received: by 10.14.225.194 with SMTP id z42mr48098986eep.22.1356265511117;
	Sun, 23 Dec 2012 04:25:11 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l3sm34571535eem.14.2012.12.23.04.25.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:25:10 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:47 +0100
Message-Id: <8b9178edd14eb63e3b6204ede2f7c8e9752827ee.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 22/30] hplip: fix build with newer cups
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Dec 2012 12:40:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../hplip/hplip-3.12.6/cups-1.6.patch              | 395 +++++++++++++++++++++
 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |   3 +
 2 files changed, 398 insertions(+)
 create mode 100644 meta-oe/recipes-extended/hplip/hplip-3.12.6/cups-1.6.patch

diff --git a/meta-oe/recipes-extended/hplip/hplip-3.12.6/cups-1.6.patch b/meta-oe/recipes-extended/hplip/hplip-3.12.6/cups-1.6.patch
new file mode 100644
index 0000000..7df01aa
--- /dev/null
+++ b/meta-oe/recipes-extended/hplip/hplip-3.12.6/cups-1.6.patch
@@ -0,0 +1,395 @@
+Imported from gentoo:
+https://bugs.gentoo.org/show_bug.cgi?id=428672
+
+diff -Naur hplip-3.12.6_old/prnt/cupsext/cupsext.c hplip-3.12.6/prnt/cupsext/cupsext.c
+--- hplip-3.12.6_old/prnt/cupsext/cupsext.c	2012-08-04 09:18:18.388330038 +0200
++++ hplip-3.12.6/prnt/cupsext/cupsext.c	2012-08-04 09:18:27.855181327 +0200
+@@ -87,6 +87,46 @@
+ #define PY_SSIZE_T_MIN INT_MIN
+ #endif
+ 
++#if (CUPS_VERSION_MAJOR > 1) || (CUPS_VERSION_MINOR > 5)
++#define HAVE_CUPS_1_6 1
++#endif
++
++#ifndef HAVE_CUPS_1_6
++#define ippGetCount(attr)     attr->num_values
++#define ippGetGroupTag(attr)  attr->group_tag
++#define ippGetValueTag(attr)  attr->value_tag
++#define ippGetName(attr)      attr->name
++#define ippGetBoolean(attr, element) attr->values[element].boolean
++#define ippGetInteger(attr, element) attr->values[element].integer
++#define ippGetStatusCode(ipp) ipp->request.status.status_code
++#define ippGetString(attr, element, language) attr->values[element].string.text
++
++static ipp_attribute_t * ippFirstAttribute( ipp_t *ipp )
++{
++    if (!ipp)
++        return (NULL);
++    return (ipp->current = ipp->attrs);
++}
++
++static ipp_attribute_t * ippNextAttribute( ipp_t *ipp )
++{
++    if (!ipp || !ipp->current)
++        return (NULL);
++    return (ipp->current = ipp->current->next);
++}
++
++static int ippSetOperation( ipp_t *ipp, ipp_op_t op )
++{
++    ipp->request.op.operation_id = op;
++    return (1);
++}
++
++static int ippSetRequestId( ipp_t *ipp, int request_id )
++{
++    ipp->request.any.request_id = request_id;
++    return (1);
++}
++#endif
+ 
+ int g_num_options = 0;
+ cups_option_t * g_options;
+@@ -333,8 +373,8 @@
+     request = ippNew();
+     language = cupsLangDefault();
+ 
+-    request->request.op.operation_id = CUPS_GET_PRINTERS;
+-    request->request.any.request_id = 1;
++    ippSetOperation( request, CUPS_GET_PRINTERS );
++    ippSetRequestId ( request, 1);
+ 
+     ippAddString( request, IPP_TAG_OPERATION, IPP_TAG_CHARSET,
+                   "attributes-charset", NULL, cupsLangEncoding( language ) );
+@@ -378,10 +418,10 @@
+         ipp_pstate_t state;
+         int i = 0;
+ 
+-        for ( attr = response->attrs; attr != NULL; attr = attr->next )
++        for ( attr = ippFirstAttribute( response ); attr != NULL; attr = ippNextAttribute( response ) )
+         {
+-            while ( attr != NULL && attr->group_tag != IPP_TAG_PRINTER )
+-                attr = attr->next;
++            while ( attr != NULL && ippGetGroupTag( attr ) != IPP_TAG_PRINTER )
++                attr = ippNextAttribute( response );
+ 
+             if ( attr == NULL )
+                 break;
+@@ -390,41 +430,41 @@
+             state = IPP_PRINTER_IDLE;
+             accepting = 0;
+ 
+-            while ( attr != NULL && attr->group_tag == IPP_TAG_PRINTER )
++            while ( attr != NULL && ippGetGroupTag( attr ) == IPP_TAG_PRINTER )
+             {
+-                if ( strcmp( attr->name, "printer-name" ) == 0 &&
+-                        attr->value_tag == IPP_TAG_NAME )
+-                    name = attr->values[ 0 ].string.text;
+-
+-                else if ( strcmp( attr->name, "device-uri" ) == 0 &&
+-                        attr->value_tag == IPP_TAG_URI )
+-                    device_uri = attr->values[ 0 ].string.text;
+-
+-                else if ( strcmp( attr->name, "printer-uri-supported" ) == 0 &&
+-                        attr->value_tag == IPP_TAG_URI )
+-                    printer_uri = attr->values[ 0 ].string.text;
+-
+-                else if ( strcmp( attr->name, "printer-info" ) == 0 &&
+-                        attr->value_tag == IPP_TAG_TEXT )
+-                    info = attr->values[ 0 ].string.text;
+-
+-                else if ( strcmp( attr->name, "printer-location" ) == 0 &&
+-                        attr->value_tag == IPP_TAG_TEXT )
+-                    location = attr->values[ 0 ].string.text;
+-
+-                else if ( strcmp( attr->name, "printer-make-and-model" ) == 0 &&
+-                        attr->value_tag == IPP_TAG_TEXT )
+-                    make_model = attr->values[ 0 ].string.text;
+-
+-                else if ( strcmp( attr->name, "printer-state" ) == 0 &&
+-                        attr->value_tag == IPP_TAG_ENUM )
+-                    state = ( ipp_pstate_t ) attr->values[ 0 ].integer;
+-
+-                else if (!strcmp(attr->name, "printer-is-accepting-jobs") &&
+-                        attr->value_tag == IPP_TAG_BOOLEAN)
+-                    accepting = attr->values[ 0 ].boolean;
++                if ( strcmp( ippGetName( attr ), "printer-name" ) == 0 &&
++                        ippGetValueTag( attr ) == IPP_TAG_NAME )
++                    name = ippGetString( attr, 0, NULL );
++
++                else if ( strcmp( ippGetName( attr ), "device-uri" ) == 0 &&
++                        ippGetValueTag( attr ) == IPP_TAG_URI )
++                    device_uri = ippGetString( attr, 0, NULL );
++
++                else if ( strcmp( ippGetName( attr ), "printer-uri-supported" ) == 0 &&
++                        ippGetValueTag( attr ) == IPP_TAG_URI )
++                    printer_uri = ippGetString( attr, 0, NULL );
++
++                else if ( strcmp( ippGetName( attr ), "printer-info" ) == 0 &&
++                        ippGetValueTag( attr ) == IPP_TAG_TEXT )
++                    info = ippGetString( attr, 0, NULL );
++
++                else if ( strcmp( ippGetName( attr ), "printer-location" ) == 0 &&
++                        ippGetValueTag( attr ) == IPP_TAG_TEXT )
++                    location = ippGetString( attr, 0, NULL );
++
++                else if ( strcmp( ippGetName( attr ), "printer-make-and-model" ) == 0 &&
++                        ippGetValueTag( attr ) == IPP_TAG_TEXT )
++                    make_model = ippGetString( attr, 0, NULL );
++
++                else if ( strcmp( ippGetName( attr ), "printer-state" ) == 0 &&
++                        ippGetValueTag( attr ) == IPP_TAG_ENUM )
++                    state = ( ipp_pstate_t ) ippGetInteger( attr, 0 );
++
++                else if (!strcmp(ippGetName( attr ), "printer-is-accepting-jobs") &&
++                        ippGetValueTag( attr ) == IPP_TAG_BOOLEAN)
++                    accepting = ippGetBoolean( attr, 0 );
+ 
+-                attr = attr->next;
++                attr = ippNextAttribute( response );
+             }
+ 
+             if ( device_uri == NULL )
+@@ -522,8 +562,8 @@
+     request = ippNew();
+     language = cupsLangDefault();
+ 
+-    request->request.op.operation_id = CUPS_ADD_PRINTER;
+-    request->request.any.request_id = 1;
++    ippSetOperation( request, CUPS_ADD_PRINTER );
++    ippSetRequestId ( request, 1 );
+ 
+     ippAddString( request, IPP_TAG_OPERATION, IPP_TAG_CHARSET,
+                   "attributes-charset", NULL, cupsLangEncoding( language ) );
+@@ -568,7 +608,7 @@
+     }
+     else
+     {
+-        status = response->request.status.status_code;
++        status = ippGetStatusCode( response );
+         //ippDelete( response );
+         r = 1;
+     }
+@@ -631,8 +671,8 @@
+        */
+     request = ippNew();
+ 
+-    request->request.op.operation_id = CUPS_DELETE_PRINTER;
+-    request->request.op.request_id = 1;
++    ippSetOperation( request, CUPS_DELETE_PRINTER );
++    ippSetRequestId ( request, 1 );
+ 
+     language = cupsLangDefault();
+ 
+@@ -650,7 +690,7 @@
+      */
+     response = cupsDoRequest( http, request, "/admin/" );
+ 
+-    if ( ( response != NULL ) && ( response->request.status.status_code <= IPP_OK_CONFLICT ) )
++    if ( ( response != NULL ) && ( ippGetStatusCode( response ) <= IPP_OK_CONFLICT ) )
+     {
+         r = 1;
+     }
+@@ -721,8 +761,8 @@
+ 
+     request = ippNew();
+ 
+-    request->request.op.operation_id = CUPS_SET_DEFAULT;
+-    request->request.op.request_id = 1;
++    ippSetOperation( request, CUPS_SET_DEFAULT );
++    ippSetRequestId ( request, 1 );
+ 
+     language = cupsLangDefault();
+ 
+@@ -743,7 +783,7 @@
+ 
+     response = cupsDoRequest( http, request, "/admin/" );
+ 
+-    if ( ( response != NULL ) && ( response->request.status.status_code <= IPP_OK_CONFLICT ) )
++    if ( ( response != NULL ) && ( ippGetStatusCode( response ) <= IPP_OK_CONFLICT ) )
+     {
+         r = 1;
+     }
+@@ -797,8 +837,8 @@
+ 
+     request = ippNew();
+ 
+-    request->request.op.operation_id = op;
+-    request->request.op.request_id = 1;
++    ippSetOperation( request, op );
++    ippSetRequestId ( request, 1 );
+ 
+     language = cupsLangDefault();
+ 
+@@ -822,7 +862,7 @@
+ 
+     response = cupsDoRequest(http, request, "/admin/");
+ 
+-    if (( response != NULL ) && (response->request.status.status_code <= IPP_OK_CONFLICT))
++    if (( response != NULL ) && (ippGetStatusCode( response ) <= IPP_OK_CONFLICT))
+     {
+         r = 1;
+     }
+@@ -837,7 +877,7 @@
+     if ( response != NULL )
+         ippDelete( response );
+ 
+-    return Py_BuildValue( "i", r );;
++    return Py_BuildValue( "i", r );
+ }
+ 
+ 
+@@ -1116,8 +1156,8 @@
+ 
+     request = ippNew();
+ 
+-    request->request.op.operation_id = CUPS_GET_PPDS;
+-    request->request.op.request_id   = 1;
++    ippSetOperation( request, CUPS_GET_PPDS );
++    ippSetRequestId ( request, 1 );
+ 
+     language = cupsLangDefault();
+ 
+@@ -1143,43 +1183,43 @@
+     if ((response = cupsDoRequest(http, request, "/")) != NULL)
+     {
+ 
+-        for (attr = response->attrs; attr; attr = attr->next)
++        for (attr = ippFirstAttribute( response ); attr; attr = ippNextAttribute( response ))
+         {
+             PyObject *dict;
+             char *ppdname = NULL;
+ 
+-            while (attr && attr->group_tag != IPP_TAG_PRINTER)
+-                attr = attr->next;
++            while (attr && ippGetGroupTag( attr ) != IPP_TAG_PRINTER)
++                attr = ippNextAttribute( response );
+ 
+             if (!attr)
+                 break;
+ 
+             dict = PyDict_New ();
+ 
+-            for (; attr && attr->group_tag == IPP_TAG_PRINTER; attr = attr->next)
++            for (; attr && ippGetGroupTag( attr ) == IPP_TAG_PRINTER; attr = ippNextAttribute( response ))
+             {
+                 PyObject *val = NULL;
+ 
+-                if (!strcmp (attr->name, "ppd-name") && attr->value_tag == IPP_TAG_NAME)
++                if (!strcmp (ippGetName( attr ), "ppd-name") && ippGetValueTag( attr ) == IPP_TAG_NAME)
+                 {
+-                    ppdname = attr->values[0].string.text;
++                    ppdname = ippGetString( attr, 0, NULL );
+ 
+                     //sprintf( buf, "print '%s'", ppdname);
+                     //PyRun_SimpleString( buf );
+                 }
+ 
+-                else if (attr->value_tag == IPP_TAG_TEXT || attr->value_tag == IPP_TAG_NAME || attr->value_tag == IPP_TAG_KEYWORD)
+-                //else if ((!strcmp (attr->name, "ppd-natural-language") && attr->value_tag == IPP_TAG_LANGUAGE) ||
+-                //    (!strcmp (attr->name, "ppd-make-and-model") && attr->value_tag == IPP_TAG_TEXT) ||
+-                //    (!strcmp (attr->name, "ppd-make") && attr->value_tag == IPP_TAG_TEXT) ||
+-                //    (!strcmp (attr->name, "ppd-device-id") && attr->value_tag == IPP_TAG_TEXT))
++                else if (ippGetValueTag( attr ) == IPP_TAG_TEXT || ippGetValueTag( attr ) == IPP_TAG_NAME || ippGetValueTag( attr ) == IPP_TAG_KEYWORD)
++                //else if ((!strcmp (ippGetName( attr ), "ppd-natural-language") && ippGetValueTag( attr ) == IPP_TAG_LANGUAGE) ||
++                //    (!strcmp (ippGetName( attr ), "ppd-make-and-model") && ippGetValueTag( attr ) == IPP_TAG_TEXT) ||
++                //    (!strcmp (ippGetName( attr ), "ppd-make") && ippGetValueTag( attr ) == IPP_TAG_TEXT) ||
++                //    (!strcmp (ippGetName( attr ), "ppd-device-id") && ippGetValueTag( attr ) == IPP_TAG_TEXT))
+                 {
+-                    val = PyObj_from_UTF8(attr->values[0].string.text);
++                    val = PyObj_from_UTF8(ippGetString( attr, 0, NULL ));
+                 }
+ 
+                 if (val)
+                 {
+-                    PyDict_SetItemString (dict, attr->name, val);
++                    PyDict_SetItemString (dict, ippGetName( attr ), val);
+                     Py_DECREF (val);
+                 }
+             }
+diff -Naur hplip-3.12.6_old/scan/sane/hpaio.c hplip-3.12.6/scan/sane/hpaio.c
+--- hplip-3.12.6_old/scan/sane/hpaio.c	2012-08-04 09:18:21.458389913 +0200
++++ hplip-3.12.6/scan/sane/hpaio.c	2012-08-04 09:18:27.875181720 +0200
+@@ -47,6 +47,43 @@
+ #define DEBUG_DECLARE_ONLY
+ #include "sanei_debug.h"
+ 
++#if (CUPS_VERSION_MAJOR > 1) || (CUPS_VERSION_MINOR > 5)
++#define HAVE_CUPS_1_6 1
++#endif
++
++#ifndef HAVE_CUPS_1_6
++#define ippGetGroupTag(attr)  attr->group_tag
++#define ippGetValueTag(attr)  attr->value_tag
++#define ippGetName(attr)      attr->name
++#define ippGetString(attr, element, language) attr->values[element].string.text
++
++static ipp_attribute_t * ippFirstAttribute( ipp_t *ipp )
++{
++    if (!ipp)
++        return (NULL);
++    return (ipp->current = ipp->attrs);
++}
++
++static ipp_attribute_t * ippNextAttribute( ipp_t *ipp )
++{
++    if (!ipp || !ipp->current)
++        return (NULL);
++    return (ipp->current = ipp->current->next);
++}
++
++static int ippSetOperation( ipp_t *ipp, ipp_op_t op )
++{
++    ipp->request.op.operation_id = op;
++    return (1);
++}
++
++static int ippSetRequestId( ipp_t *ipp, int request_id )
++{
++    ipp->request.any.request_id = request_id;
++    return (1);
++}
++#endif
++
+ static SANE_Device **DeviceList = NULL;
+ 
+ static int AddDeviceList(char *uri, char *model, SANE_Device ***pd)
+@@ -186,8 +223,8 @@
+    /* Assemble the IPP request */
+    request = ippNew();
+ 
+-   request->request.op.operation_id = CUPS_GET_PRINTERS;
+-   request->request.any.request_id  = 1;
++   ippSetOperation( request, CUPS_GET_PRINTERS );
++   ippSetRequestId( request, 1 );
+ 
+    ippAddString(request, IPP_TAG_OPERATION, IPP_TAG_CHARSET, "attributes-charset", NULL, "utf-8");
+    ippAddString(request, IPP_TAG_OPERATION, IPP_TAG_LANGUAGE, "attributes-natural-language", NULL, "en");
+@@ -197,20 +234,20 @@
+    if ((response = cupsDoRequest(http, request, "/")) == NULL)
+       goto bugout;
+ 
+-   for (attr = response->attrs; attr != NULL; attr = attr->next)
++   for (attr = ippFirstAttribute ( response ); attr != NULL; attr = ippNextAttribute( response ))
+    {
+       /* Skip leading attributes until we hit a printer. */
+-      while (attr != NULL && attr->group_tag != IPP_TAG_PRINTER)
+-         attr = attr->next;
++      while (attr != NULL && ippGetGroupTag( attr ) != IPP_TAG_PRINTER)
++         attr = ippNextAttribute( response );
+ 
+       if (attr == NULL)
+          break;
+ 
+-      while (attr != NULL && attr->group_tag == IPP_TAG_PRINTER)
++      while (attr != NULL && ippGetGroupTag( attr ) == IPP_TAG_PRINTER)
+       {
+-         if (strcmp(attr->name, "device-uri") == 0 && attr->value_tag == IPP_TAG_URI && AddCupsList(attr->values[0].string.text, printer) == 0)
++         if (strcmp(ippGetName( attr ), "device-uri") == 0 && ippGetValueTag( attr ) == IPP_TAG_URI && AddCupsList(ippGetString( attr, 0, NULL ), printer) == 0)
+             cnt++;
+-         attr = attr->next;
++         attr = ippNextAttribute( response );
+       }
+ 
+       if (attr == NULL)
diff --git a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
index 2826a76..b9c270d 100644
--- a/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
+++ b/meta-oe/recipes-extended/hplip/hplip_3.12.6.bb
@@ -2,9 +2,12 @@ DESCRIPTION = "HP Linux Imaging and Printing"
 LICENSE="GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=442bb3cbbeeb60643a87325718b8a8ee"
 
+PR = "r1"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${PN}-${PV}.tar.gz \
            file://setup-add-sleep-after-cups-reset.patch \
            file://fix-libusb-paths.patch \
+           file://cups-1.6.patch \
 	  "
 
 DEPENDS += "cups python libusb"
-- 
1.8.0.2



