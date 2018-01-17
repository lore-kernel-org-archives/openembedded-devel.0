Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1D18A78688
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:34:57 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id f11so7494939wre.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 00:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=2tT5sODxaZxZQ7wpwJ2lLpOZGkM7vU71+sparmlKAcE=;
	b=q/D3++8YU4uufVits8zwy4d08ZTeEmqhlrhKfmzjL2Hzzu6woA8pPtxvVSa1cpichC
	5VTm1rCNzq4bmpQCmyA1vCr1YfUlilqXQ1USwWtNp637fsSeeEesrcS1wBF547OsvGS6
	YsiHg54gOM90XqWxU1aKskHXb/fI3EJ2Ad6Q3kZz+bHORV2lis/1olJGlynK/wrzjBp9
	DbDmR0DKt7rxpa7dJDAx+s00NGDPdA9z0z0Pe1y77iBSyGk/b1xmBPEXxb0BAF/stLIb
	UPqYfIVsAEu432NpEBd991cCmWaS0XAmf2IqCQ5F3gVx0npKTMVkRzNjMQFi5zrXRu9E
	iLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2tT5sODxaZxZQ7wpwJ2lLpOZGkM7vU71+sparmlKAcE=;
	b=ETk6LS2XsaecceatfsArLwzNvn2rY65f0i/Vs6C8+6ufWbDmdU7Flj1B34qInqen7t
	UEar8RPjaTe57KCxCCOFv9yespkp7p9UD+Qo3luRxi37GlK7J5Ajk0/Vf+RgGaspexh2
	6r2JNTRz4k3U4axWd7A9FcReZ4FJ2ABqI35/EsHt7B2o4sxYlClcdnsA1Q+gRztdKBDN
	P8akxbN+AqMyRfYSpqItwjtua3ZX+0zcxkvMcYhRUbpepsAeCav1rhvJ5v5K46+/ArZC
	vC+KSrmGh67CT+m9bDyOJEpcarSvXm/NJDVylEL5C3kZNkt0igOwk+qZwME+vxjMsZpf
	QHQQ==
X-Gm-Message-State: AKwxytfu8gCYqFXHs0MUbFauOvmXbl9H/Aj4y5S2Unvbg9uD3uDFy1w/
	ztrB5W8CUXCRZjzO78/IWXk0Pg==
X-Google-Smtp-Source: ACJfBosdJTJiTOX0XgzgInSCRJjuA9lJ9QJ0vqyMzRl9qrU/OWBdHNWSWewiVV74nFYecBHwj/xzQg==
X-Received: by 10.223.145.9 with SMTP id j9mr1772543wrj.128.1516178098208;
	Wed, 17 Jan 2018 00:34:58 -0800 (PST)
Received: from localhost.localdomain
	(ip-88-152-110-191.hsi03.unitymediagroup.de. [88.152.110.191])
	by smtp.gmail.com with ESMTPSA id
	c54sm4230832wrg.68.2018.01.17.00.34.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 00:34:57 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 09:34:15 +0100
Message-Id: <20180117083421.30233-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180117083421.30233-1-schnitzeltony@gmail.com>
References: <20180117083421.30233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 08/14] remove libgnomecups leftovers
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
X-List-Received-Date: Wed, 17 Jan 2018 08:34:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libgnomecups/libgnomecups-0.2.3-cups-1.6.patch | 288 ---------------------
 .../libgnomecups/libgnomecups-0.2.3-glib.h.patch   |  42 ---
 2 files changed, 330 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-cups-1.6.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-glib.h.patch

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-cups-1.6.patch b/meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-cups-1.6.patch
deleted file mode 100644
index dba60ca69..000000000
--- a/meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-cups-1.6.patch
+++ /dev/null
@@ -1,288 +0,0 @@
-Imported from gentoo:
-http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-print/libgnomecups/files/libgnomecups-0.2.3-cups-1.6.patch
-
-From ae783efde4fa69578651994505462f02b8639220 Mon Sep 17 00:00:00 2001
-From: Alexandre Rostovtsev <tetromino@gentoo.org>
-Date: Tue, 7 Aug 2012 06:53:09 -0400
-Subject: [PATCH] Use CUPS-1.6 IPP API getter/setter functions
-
-CUPS 1.6 makes various structures private and introduces these ippGet
-and ippSet functions for all of the fields in these structures.
-http://www.cups.org/str.php?L3928
-
-We define our own accessors when building against CUPS < 1.6.
-
-Based on work by Jiri Popelka <jpopelka@redhat.com> at
-https://bugzilla.gnome.org/show_bug.cgi?id=679759
----
- libgnomecups/gnome-cups-printer.c |   48 +++++++++++++++++++++++++++++-------
- libgnomecups/gnome-cups-queue.c   |   43 +++++++++++++++++++++++++++------
- libgnomecups/gnome-cups-request.c |   44 ++++++++++++++++++++++++++++-----
- 3 files changed, 110 insertions(+), 25 deletions(-)
-
-diff --git a/libgnomecups/gnome-cups-printer.c b/libgnomecups/gnome-cups-printer.c
-index c924af0..f5e1ef7 100644
---- a/libgnomecups/gnome-cups-printer.c
-+++ b/libgnomecups/gnome-cups-printer.c
-@@ -37,6 +37,34 @@
- 
- #define UPDATE_TIMEOUT 5000
- 
-+#if (CUPS_VERSION_MAJOR > 1) || (CUPS_VERSION_MINOR > 5)
-+#define HAVE_CUPS_1_6 1
-+#endif
-+
-+#ifndef HAVE_CUPS_1_6
-+#define ippGetCount(attr)     attr->num_values
-+#define ippGetName(attr)      attr->name
-+#define ippGetInteger(attr, element) attr->values[element].integer
-+#define ippGetString(attr, element, language) attr->values[element].string.text
-+
-+static ipp_attribute_t *
-+ippFirstAttribute(ipp_t *ipp)
-+{
-+  if (!ipp)
-+    return (NULL);
-+  return (ipp->current = ipp->attrs);
-+}
-+
-+static ipp_attribute_t *
-+ippNextAttribute(ipp_t *ipp)
-+{
-+  if (!ipp || !ipp->current)
-+    return (NULL);
-+  return (ipp->current = ipp->current->next);
-+}
-+#endif
-+
-+
- struct _GnomeCupsPPDFile {
- 	char name[1];
- };
-@@ -173,9 +201,9 @@ map_reasons (GnomeCupsPrinter *printer,
- 	printer->details->state_reasons = NULL;
- 
- 	/* cf. RFC2911 4.4.12 */
--	for (i = 0; i < attr->num_values; i++) {
-+	for (i = 0; i < ippGetCount (attr); i++) {
- 		const char *p;
--		const char *keyword = attr->values [i].string.text;
-+		const char *keyword = ippGetString (attr, i, NULL);
- 
- 		reason = g_new (GnomeCupsPrinterReason, 1);
- 
-@@ -224,8 +252,8 @@ gnome_cups_printer_get_info (GnomeCupsPrinter *printer)
- 	return printer->details->info;
- }
- 
--#define MAP_INT(v,a) {if (!g_ascii_strcasecmp (attr->name, (a))) { if ((v) != attr->values[0].integer) { changed = TRUE; } (v) = attr->values[0].integer; }}
--#define MAP_STRING(v,a) {if (!g_ascii_strcasecmp (attr->name, (a))) { if (!v || strcmp (v, attr->values[0].string.text)) { g_free (v); changed = TRUE; (v) = g_strdup (attr->values[0].string.text); }}}
-+#define MAP_INT(v,a) {if (!g_ascii_strcasecmp (ippGetName (attr), (a))) { if ((v) != ippGetInteger (attr, 0)) { changed = TRUE; } (v) = ippGetInteger (attr, 0); }}
-+#define MAP_STRING(v,a) {if (!g_ascii_strcasecmp (ippGetName (attr), (a))) { if (!v || strcmp (v, ippGetString (attr, 0, NULL))) { g_free (v); changed = TRUE; (v) = g_strdup (ippGetString (attr, 0, NULL)); }}}
- 
- static void
- attributes_update_cb (guint id,
-@@ -243,14 +271,14 @@ attributes_update_cb (guint id,
- 	changed = FALSE;
- 
- 	if (!error && response) {
--		for (attr = response->attrs; attr != NULL; attr = attr->next) {
--			if (!attr->name) {
-+		for (attr = ippFirstAttribute (response); attr != NULL; attr = ippNextAttribute (response)) {
-+			if (!ippGetName (attr)) {
- 				continue;
- 			} 
--			if (!g_ascii_strcasecmp (attr->name, "attributes-charset") || !strcmp (attr->name, "attributes-charset")) {
-+			if (!g_ascii_strcasecmp (ippGetName (attr), "attributes-charset") || !strcmp (ippGetName (attr), "attributes-charset")) {
- 				continue;
- 			}
--			if (!g_ascii_strcasecmp (attr->name, "printer-state-reasons")) {
-+			if (!g_ascii_strcasecmp (ippGetName (attr), "printer-state-reasons")) {
- 				map_reasons (printer, attr);
- 			}
- 			MAP_INT (printer->details->state, "printer-state");
-@@ -570,7 +598,7 @@ get_default (void)
- 	
- 	attr = ippFindAttribute (response, "printer-name", IPP_TAG_NAME);
- 	if (attr) {
--		name = g_strdup (attr->values[0].string.text);
-+		name = g_strdup (ippGetString (attr, 0, NULL));
- 	} else {
- 		name = NULL;
- 	}
-@@ -698,7 +726,7 @@ get_printer_names (void)
- 	attr = ippFindAttribute (response, "printer-name", IPP_TAG_NAME);
- 	while (attr) {
- 		ret = g_list_prepend (ret, 
--				      g_strdup (attr->values[0].string.text));
-+				      g_strdup (ippGetString (attr, 0, NULL)));
- 		
- 		attr = ippFindNextAttribute (response, 
- 					     "printer-name", 
-diff --git a/libgnomecups/gnome-cups-queue.c b/libgnomecups/gnome-cups-queue.c
-index 9f98ed9..298db42 100644
---- a/libgnomecups/gnome-cups-queue.c
-+++ b/libgnomecups/gnome-cups-queue.c
-@@ -15,6 +15,33 @@
- 
- #define UPDATE_TIMEOUT 3000
- 
-+#if (CUPS_VERSION_MAJOR > 1) || (CUPS_VERSION_MINOR > 5)
-+#define HAVE_CUPS_1_6 1
-+#endif
-+
-+#ifndef HAVE_CUPS_1_6
-+#define ippGetName(attr)      attr->name
-+#define ippGetInteger(attr, element) attr->values[element].integer
-+#define ippGetString(attr, element, language) attr->values[element].string.text
-+
-+static ipp_attribute_t *
-+ippFirstAttribute(ipp_t *ipp)
-+{
-+  if (!ipp)
-+    return (NULL);
-+  return (ipp->current = ipp->attrs);
-+}
-+
-+static ipp_attribute_t *
-+ippNextAttribute(ipp_t *ipp)
-+{
-+  if (!ipp || !ipp->current)
-+    return (NULL);
-+  return (ipp->current = ipp->current->next);
-+}
-+#endif
-+
-+
- struct _GnomeCupsQueueDetails {
- 	char *queue_name;
- 	GList *jobs;
-@@ -199,8 +226,8 @@ finish_job (GnomeCupsJob *job)
- 	job->size = job->size * 1024;
- }
- 
--#define MAP_STR(dest, src) { if (!g_ascii_strcasecmp (attr->name, (src))) { if ((dest) != NULL) g_free (dest); (dest) = g_strdup (attr->values[0].string.text);}}
--#define MAP_INT(dest, src) { if (!g_ascii_strcasecmp (attr->name, (src))) { (dest) = attr->values[0].integer; } }
-+#define MAP_STR(dest, src) { if (!g_ascii_strcasecmp (ippGetName (attr), (src))) { if ((dest) != NULL) g_free (dest); (dest) = g_strdup (ippGetString (attr, 0, NULL));}}
-+#define MAP_INT(dest, src) { if (!g_ascii_strcasecmp (ippGetName (attr), (src))) { (dest) = ippGetInteger (attr, 0); } }
- 
- static void
- get_jobs_cb (guint id,
-@@ -231,8 +258,8 @@ get_jobs_cb (guint id,
- 	
- 	if (response) {
- 		job = g_new0 (GnomeCupsJob, 1);
--		for (attr = response->attrs; attr != NULL; attr = attr->next) {
--			if (attr->name == NULL) {
-+		for (attr = ippFirstAttribute (response); attr != NULL; attr = ippNextAttribute (response)) {
-+			if (ippGetName (attr) == NULL) {
- 				if (job->name) {
- 					finish_job (job);
- 					jobs = g_list_prepend (jobs, job);	
-@@ -244,7 +271,7 @@ get_jobs_cb (guint id,
- 				continue;
- 			}
- 			
--			if (!g_ascii_strcasecmp (attr->name, "attributes-charset") || !g_ascii_strcasecmp (attr->name, "attributes-charset")) {
-+			if (!g_ascii_strcasecmp (ippGetName (attr), "attributes-charset") || !g_ascii_strcasecmp (ippGetName (attr), "attributes-charset")) {
- 				continue;
- 				
- 			}
-@@ -355,8 +382,8 @@ gnome_cups_queue_get_job_nocache (GnomeCupsQueue *queue,
- 
- 	if (response) {
- 		job = g_new0 (GnomeCupsJob, 1);
--		for (attr = response->attrs; attr != NULL; attr = attr->next) {
--			if (attr->name == NULL) {
-+		for (attr = ippFirstAttribute (response); attr != NULL; attr = ippNextAttribute (response)) {
-+			if (ippGetName (attr) == NULL) {
- 				if (job->name) {
- 					finish_job (job);
- 				} else {
-@@ -366,7 +393,7 @@ gnome_cups_queue_get_job_nocache (GnomeCupsQueue *queue,
- 				break;
- 			}
- 			
--			if (!g_ascii_strcasecmp (attr->name, "attributes-charset") || !g_ascii_strcasecmp (attr->name, "attributes-charset")) {
-+			if (!g_ascii_strcasecmp (ippGetName (attr), "attributes-charset") || !g_ascii_strcasecmp (ippGetName (attr), "attributes-charset")) {
- 				continue;
- 			}
- 			
-diff --git a/libgnomecups/gnome-cups-request.c b/libgnomecups/gnome-cups-request.c
-index c94f623..13f0948 100644
---- a/libgnomecups/gnome-cups-request.c
-+++ b/libgnomecups/gnome-cups-request.c
-@@ -19,6 +19,36 @@
- #define STOP_UNUSED_THREADS_TIMEOUT 60
- #define CLOSE_UNUSED_CONNECTIONS_TIMEOUT 30
- 
-+#if (CUPS_VERSION_MAJOR > 1) || (CUPS_VERSION_MINOR > 5)
-+#define HAVE_CUPS_1_6 1
-+#endif
-+
-+#ifndef HAVE_CUPS_1_6
-+#define ippGetCount(attr)     attr->num_values
-+#define ippGetValueTag(attr)  attr->value_tag
-+#define ippGetName(attr)      attr->name
-+#define ippGetBoolean(attr, element) attr->values[element].boolean
-+#define ippGetInteger(attr, element) attr->values[element].integer
-+#define ippGetString(attr, element, language) attr->values[element].string.text
-+
-+static ipp_attribute_t *
-+ippFirstAttribute(ipp_t *ipp)
-+{
-+  if (!ipp)
-+    return (NULL);
-+  return (ipp->current = ipp->attrs);
-+}
-+
-+static ipp_attribute_t *
-+ippNextAttribute(ipp_t *ipp)
-+{
-+  if (!ipp || !ipp->current)
-+    return (NULL);
-+  return (ipp->current = ipp->current->next);
-+}
-+#endif
-+
-+
- typedef struct
- {
- 	GMutex *mutex;
-@@ -276,14 +306,14 @@ dump_request (ipp_t const *req)
- 	unsigned i;
- 	ipp_attribute_t *attr;
- 
--	for (attr = req->attrs; attr != NULL; attr = attr->next) {
--		g_print ("%s", attr->name);
--		for (i = 0 ; i < attr->num_values ; i++) {
-+	for (attr = ippFirstAttribute (req); attr != NULL; attr = ippNextAttribute (req)) {
-+		g_print ("%s", ippGetName (attr));
-+		for (i = 0 ; i < ippGetCount (attr) ; i++) {
- 			g_print ("\t[%d] = ", i);
--			switch (attr->value_tag & ~IPP_TAG_COPY) {
-+			switch (ippGetValueTag (attr) & ~IPP_TAG_COPY) {
- 			case IPP_TAG_INTEGER:
- 			case IPP_TAG_ENUM:
--				g_print ("%d\n", attr->values[i].integer);
-+				g_print ("%d\n", ippGetInteger (attr, i));
- 				break;
- 
- 			case IPP_TAG_STRING:
-@@ -294,11 +324,11 @@ dump_request (ipp_t const *req)
- 			case IPP_TAG_CHARSET:
- 			case IPP_TAG_LANGUAGE:
- 			case IPP_TAG_MIMETYPE:
--				g_print ("'%s'\n", attr->values[i].string.text);
-+				g_print ("'%s'\n", ippGetString (attr, i, NULL));
- 				break;
- 
- 			case IPP_TAG_BOOLEAN:
--				g_print ("%s\n", (int)attr->values[i].boolean ? "true" : "false");
-+				g_print ("%s\n", (int)ippGetBoolean (attr, i) ? "true" : "false");
- 				break;
- 
- 			default:
--- 
-1.7.8.6
-
diff --git a/meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-glib.h.patch b/meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-glib.h.patch
deleted file mode 100644
index c7b616578..000000000
--- a/meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-glib.h.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Imported from gentoo:
-
-http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-print/libgnomecups/files/libgnomecups-0.2.3-glib.h.patch
-
-From d84eee9450b3b6f6155074915efc61bedcc8d446 Mon Sep 17 00:00:00 2001
-From: Dominique Leuenberger <dimstar@opensuse.org>
-Date: Sun, 27 Nov 2011 21:36:41 +0100
-Subject: [PATCH] Fix: Only glib.h can be included
-
----
- libgnomecups/gnome-cups-i18n.c |    2 +-
- libgnomecups/gnome-cups-init.h |    3 +--
- 2 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/libgnomecups/gnome-cups-i18n.c b/libgnomecups/gnome-cups-i18n.c
-index 8987c5c..127756d 100644
---- a/libgnomecups/gnome-cups-i18n.c
-+++ b/libgnomecups/gnome-cups-i18n.c
-@@ -1,5 +1,5 @@
- #include <config.h>
--#include <glib/gmacros.h>
-+#include <glib.h>
- #include "gnome-cups-i18n.h"
- 
- #ifdef ENABLE_NLS
-diff --git a/libgnomecups/gnome-cups-init.h b/libgnomecups/gnome-cups-init.h
-index 22b682a..c4600fc 100644
---- a/libgnomecups/gnome-cups-init.h
-+++ b/libgnomecups/gnome-cups-init.h
-@@ -1,8 +1,7 @@
- #ifndef GNOME_CUPS_INIT
- #define GNOME_CUPS_INIT
- 
--#include <glib/gtypes.h>
--#include <glib/gmacros.h>
-+#include <glib.h>
- 
- G_BEGIN_DECLS
- 
--- 
-1.7.7
-
-- 
2.14.3


