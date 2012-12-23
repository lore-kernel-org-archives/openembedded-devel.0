Received: from mail-ea0-f176.google.com ([209.85.215.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tmkqx-0001rH-7i
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:40:40 +0100
Received: by mail-ea0-f176.google.com with SMTP id d13so2495940eaa.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=kEYLJwpV6GeXjCYkficQu+IuO6Y6s8jxzv1DkU6VanA=;
	b=jKLuPRZN07UEfPe5U28Wch22Cz2XJ4T/Obfge1HwCXpt2f4HCciKkDKG3+rVzeyd5F
	/M297EQDAOGTJSCLj3bvGQ6MK6x/K+2HtrtE4EBgO0LvPefZChUn29/C0Ms+ddibXr1o
	+DcIq7wnS4o+NJ2/xSifodjI4ilZlkMPQj28ryfadjN4sS1zojeTEzZXoYWI0IDYJ88U
	O5kl66OAk9fgByGOYqYSeHBriWxONyjM7eUZ7vrmKgBpapm35srnD+9/t3QhCiSRecMa
	JXkofwR6Kmpp2xSYllFGv69QftHevJOhAqkxTwYKT4VUh+sh4tp9pIDqY8kMBgZnGDQD
	0Bdw==
X-Received: by 10.14.218.69 with SMTP id j45mr47900909eep.35.1356265538742;
	Sun, 23 Dec 2012 04:25:38 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id 43sm34562332eed.10.2012.12.23.04.25.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:25:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:50 +0100
Message-Id: <797d4aa8d54593f02d626c5eb646ee72de691deb.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 25/30] libgnomecups: fix build with cups-1.6 from oe-core
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
X-List-Received-Date: Sun, 23 Dec 2012 12:40:48 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libgnomecups/libgnomecups-0.2.3-cups-1.6.patch | 288 +++++++++++++++++++++
 .../recipes-gnome/gnome/libgnomecups_0.2.3.bb      |   7 +-
 2 files changed, 293 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-cups-1.6.patch

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-cups-1.6.patch b/meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-cups-1.6.patch
new file mode 100644
index 0000000..dba60ca
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/libgnomecups/libgnomecups-0.2.3-cups-1.6.patch
@@ -0,0 +1,288 @@
+Imported from gentoo:
+http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-print/libgnomecups/files/libgnomecups-0.2.3-cups-1.6.patch
+
+From ae783efde4fa69578651994505462f02b8639220 Mon Sep 17 00:00:00 2001
+From: Alexandre Rostovtsev <tetromino@gentoo.org>
+Date: Tue, 7 Aug 2012 06:53:09 -0400
+Subject: [PATCH] Use CUPS-1.6 IPP API getter/setter functions
+
+CUPS 1.6 makes various structures private and introduces these ippGet
+and ippSet functions for all of the fields in these structures.
+http://www.cups.org/str.php?L3928
+
+We define our own accessors when building against CUPS < 1.6.
+
+Based on work by Jiri Popelka <jpopelka@redhat.com> at
+https://bugzilla.gnome.org/show_bug.cgi?id=679759
+---
+ libgnomecups/gnome-cups-printer.c |   48 +++++++++++++++++++++++++++++-------
+ libgnomecups/gnome-cups-queue.c   |   43 +++++++++++++++++++++++++++------
+ libgnomecups/gnome-cups-request.c |   44 ++++++++++++++++++++++++++++-----
+ 3 files changed, 110 insertions(+), 25 deletions(-)
+
+diff --git a/libgnomecups/gnome-cups-printer.c b/libgnomecups/gnome-cups-printer.c
+index c924af0..f5e1ef7 100644
+--- a/libgnomecups/gnome-cups-printer.c
++++ b/libgnomecups/gnome-cups-printer.c
+@@ -37,6 +37,34 @@
+ 
+ #define UPDATE_TIMEOUT 5000
+ 
++#if (CUPS_VERSION_MAJOR > 1) || (CUPS_VERSION_MINOR > 5)
++#define HAVE_CUPS_1_6 1
++#endif
++
++#ifndef HAVE_CUPS_1_6
++#define ippGetCount(attr)     attr->num_values
++#define ippGetName(attr)      attr->name
++#define ippGetInteger(attr, element) attr->values[element].integer
++#define ippGetString(attr, element, language) attr->values[element].string.text
++
++static ipp_attribute_t *
++ippFirstAttribute(ipp_t *ipp)
++{
++  if (!ipp)
++    return (NULL);
++  return (ipp->current = ipp->attrs);
++}
++
++static ipp_attribute_t *
++ippNextAttribute(ipp_t *ipp)
++{
++  if (!ipp || !ipp->current)
++    return (NULL);
++  return (ipp->current = ipp->current->next);
++}
++#endif
++
++
+ struct _GnomeCupsPPDFile {
+ 	char name[1];
+ };
+@@ -173,9 +201,9 @@ map_reasons (GnomeCupsPrinter *printer,
+ 	printer->details->state_reasons = NULL;
+ 
+ 	/* cf. RFC2911 4.4.12 */
+-	for (i = 0; i < attr->num_values; i++) {
++	for (i = 0; i < ippGetCount (attr); i++) {
+ 		const char *p;
+-		const char *keyword = attr->values [i].string.text;
++		const char *keyword = ippGetString (attr, i, NULL);
+ 
+ 		reason = g_new (GnomeCupsPrinterReason, 1);
+ 
+@@ -224,8 +252,8 @@ gnome_cups_printer_get_info (GnomeCupsPrinter *printer)
+ 	return printer->details->info;
+ }
+ 
+-#define MAP_INT(v,a) {if (!g_ascii_strcasecmp (attr->name, (a))) { if ((v) != attr->values[0].integer) { changed = TRUE; } (v) = attr->values[0].integer; }}
+-#define MAP_STRING(v,a) {if (!g_ascii_strcasecmp (attr->name, (a))) { if (!v || strcmp (v, attr->values[0].string.text)) { g_free (v); changed = TRUE; (v) = g_strdup (attr->values[0].string.text); }}}
++#define MAP_INT(v,a) {if (!g_ascii_strcasecmp (ippGetName (attr), (a))) { if ((v) != ippGetInteger (attr, 0)) { changed = TRUE; } (v) = ippGetInteger (attr, 0); }}
++#define MAP_STRING(v,a) {if (!g_ascii_strcasecmp (ippGetName (attr), (a))) { if (!v || strcmp (v, ippGetString (attr, 0, NULL))) { g_free (v); changed = TRUE; (v) = g_strdup (ippGetString (attr, 0, NULL)); }}}
+ 
+ static void
+ attributes_update_cb (guint id,
+@@ -243,14 +271,14 @@ attributes_update_cb (guint id,
+ 	changed = FALSE;
+ 
+ 	if (!error && response) {
+-		for (attr = response->attrs; attr != NULL; attr = attr->next) {
+-			if (!attr->name) {
++		for (attr = ippFirstAttribute (response); attr != NULL; attr = ippNextAttribute (response)) {
++			if (!ippGetName (attr)) {
+ 				continue;
+ 			} 
+-			if (!g_ascii_strcasecmp (attr->name, "attributes-charset") || !strcmp (attr->name, "attributes-charset")) {
++			if (!g_ascii_strcasecmp (ippGetName (attr), "attributes-charset") || !strcmp (ippGetName (attr), "attributes-charset")) {
+ 				continue;
+ 			}
+-			if (!g_ascii_strcasecmp (attr->name, "printer-state-reasons")) {
++			if (!g_ascii_strcasecmp (ippGetName (attr), "printer-state-reasons")) {
+ 				map_reasons (printer, attr);
+ 			}
+ 			MAP_INT (printer->details->state, "printer-state");
+@@ -570,7 +598,7 @@ get_default (void)
+ 	
+ 	attr = ippFindAttribute (response, "printer-name", IPP_TAG_NAME);
+ 	if (attr) {
+-		name = g_strdup (attr->values[0].string.text);
++		name = g_strdup (ippGetString (attr, 0, NULL));
+ 	} else {
+ 		name = NULL;
+ 	}
+@@ -698,7 +726,7 @@ get_printer_names (void)
+ 	attr = ippFindAttribute (response, "printer-name", IPP_TAG_NAME);
+ 	while (attr) {
+ 		ret = g_list_prepend (ret, 
+-				      g_strdup (attr->values[0].string.text));
++				      g_strdup (ippGetString (attr, 0, NULL)));
+ 		
+ 		attr = ippFindNextAttribute (response, 
+ 					     "printer-name", 
+diff --git a/libgnomecups/gnome-cups-queue.c b/libgnomecups/gnome-cups-queue.c
+index 9f98ed9..298db42 100644
+--- a/libgnomecups/gnome-cups-queue.c
++++ b/libgnomecups/gnome-cups-queue.c
+@@ -15,6 +15,33 @@
+ 
+ #define UPDATE_TIMEOUT 3000
+ 
++#if (CUPS_VERSION_MAJOR > 1) || (CUPS_VERSION_MINOR > 5)
++#define HAVE_CUPS_1_6 1
++#endif
++
++#ifndef HAVE_CUPS_1_6
++#define ippGetName(attr)      attr->name
++#define ippGetInteger(attr, element) attr->values[element].integer
++#define ippGetString(attr, element, language) attr->values[element].string.text
++
++static ipp_attribute_t *
++ippFirstAttribute(ipp_t *ipp)
++{
++  if (!ipp)
++    return (NULL);
++  return (ipp->current = ipp->attrs);
++}
++
++static ipp_attribute_t *
++ippNextAttribute(ipp_t *ipp)
++{
++  if (!ipp || !ipp->current)
++    return (NULL);
++  return (ipp->current = ipp->current->next);
++}
++#endif
++
++
+ struct _GnomeCupsQueueDetails {
+ 	char *queue_name;
+ 	GList *jobs;
+@@ -199,8 +226,8 @@ finish_job (GnomeCupsJob *job)
+ 	job->size = job->size * 1024;
+ }
+ 
+-#define MAP_STR(dest, src) { if (!g_ascii_strcasecmp (attr->name, (src))) { if ((dest) != NULL) g_free (dest); (dest) = g_strdup (attr->values[0].string.text);}}
+-#define MAP_INT(dest, src) { if (!g_ascii_strcasecmp (attr->name, (src))) { (dest) = attr->values[0].integer; } }
++#define MAP_STR(dest, src) { if (!g_ascii_strcasecmp (ippGetName (attr), (src))) { if ((dest) != NULL) g_free (dest); (dest) = g_strdup (ippGetString (attr, 0, NULL));}}
++#define MAP_INT(dest, src) { if (!g_ascii_strcasecmp (ippGetName (attr), (src))) { (dest) = ippGetInteger (attr, 0); } }
+ 
+ static void
+ get_jobs_cb (guint id,
+@@ -231,8 +258,8 @@ get_jobs_cb (guint id,
+ 	
+ 	if (response) {
+ 		job = g_new0 (GnomeCupsJob, 1);
+-		for (attr = response->attrs; attr != NULL; attr = attr->next) {
+-			if (attr->name == NULL) {
++		for (attr = ippFirstAttribute (response); attr != NULL; attr = ippNextAttribute (response)) {
++			if (ippGetName (attr) == NULL) {
+ 				if (job->name) {
+ 					finish_job (job);
+ 					jobs = g_list_prepend (jobs, job);	
+@@ -244,7 +271,7 @@ get_jobs_cb (guint id,
+ 				continue;
+ 			}
+ 			
+-			if (!g_ascii_strcasecmp (attr->name, "attributes-charset") || !g_ascii_strcasecmp (attr->name, "attributes-charset")) {
++			if (!g_ascii_strcasecmp (ippGetName (attr), "attributes-charset") || !g_ascii_strcasecmp (ippGetName (attr), "attributes-charset")) {
+ 				continue;
+ 				
+ 			}
+@@ -355,8 +382,8 @@ gnome_cups_queue_get_job_nocache (GnomeCupsQueue *queue,
+ 
+ 	if (response) {
+ 		job = g_new0 (GnomeCupsJob, 1);
+-		for (attr = response->attrs; attr != NULL; attr = attr->next) {
+-			if (attr->name == NULL) {
++		for (attr = ippFirstAttribute (response); attr != NULL; attr = ippNextAttribute (response)) {
++			if (ippGetName (attr) == NULL) {
+ 				if (job->name) {
+ 					finish_job (job);
+ 				} else {
+@@ -366,7 +393,7 @@ gnome_cups_queue_get_job_nocache (GnomeCupsQueue *queue,
+ 				break;
+ 			}
+ 			
+-			if (!g_ascii_strcasecmp (attr->name, "attributes-charset") || !g_ascii_strcasecmp (attr->name, "attributes-charset")) {
++			if (!g_ascii_strcasecmp (ippGetName (attr), "attributes-charset") || !g_ascii_strcasecmp (ippGetName (attr), "attributes-charset")) {
+ 				continue;
+ 			}
+ 			
+diff --git a/libgnomecups/gnome-cups-request.c b/libgnomecups/gnome-cups-request.c
+index c94f623..13f0948 100644
+--- a/libgnomecups/gnome-cups-request.c
++++ b/libgnomecups/gnome-cups-request.c
+@@ -19,6 +19,36 @@
+ #define STOP_UNUSED_THREADS_TIMEOUT 60
+ #define CLOSE_UNUSED_CONNECTIONS_TIMEOUT 30
+ 
++#if (CUPS_VERSION_MAJOR > 1) || (CUPS_VERSION_MINOR > 5)
++#define HAVE_CUPS_1_6 1
++#endif
++
++#ifndef HAVE_CUPS_1_6
++#define ippGetCount(attr)     attr->num_values
++#define ippGetValueTag(attr)  attr->value_tag
++#define ippGetName(attr)      attr->name
++#define ippGetBoolean(attr, element) attr->values[element].boolean
++#define ippGetInteger(attr, element) attr->values[element].integer
++#define ippGetString(attr, element, language) attr->values[element].string.text
++
++static ipp_attribute_t *
++ippFirstAttribute(ipp_t *ipp)
++{
++  if (!ipp)
++    return (NULL);
++  return (ipp->current = ipp->attrs);
++}
++
++static ipp_attribute_t *
++ippNextAttribute(ipp_t *ipp)
++{
++  if (!ipp || !ipp->current)
++    return (NULL);
++  return (ipp->current = ipp->current->next);
++}
++#endif
++
++
+ typedef struct
+ {
+ 	GMutex *mutex;
+@@ -276,14 +306,14 @@ dump_request (ipp_t const *req)
+ 	unsigned i;
+ 	ipp_attribute_t *attr;
+ 
+-	for (attr = req->attrs; attr != NULL; attr = attr->next) {
+-		g_print ("%s", attr->name);
+-		for (i = 0 ; i < attr->num_values ; i++) {
++	for (attr = ippFirstAttribute (req); attr != NULL; attr = ippNextAttribute (req)) {
++		g_print ("%s", ippGetName (attr));
++		for (i = 0 ; i < ippGetCount (attr) ; i++) {
+ 			g_print ("\t[%d] = ", i);
+-			switch (attr->value_tag & ~IPP_TAG_COPY) {
++			switch (ippGetValueTag (attr) & ~IPP_TAG_COPY) {
+ 			case IPP_TAG_INTEGER:
+ 			case IPP_TAG_ENUM:
+-				g_print ("%d\n", attr->values[i].integer);
++				g_print ("%d\n", ippGetInteger (attr, i));
+ 				break;
+ 
+ 			case IPP_TAG_STRING:
+@@ -294,11 +324,11 @@ dump_request (ipp_t const *req)
+ 			case IPP_TAG_CHARSET:
+ 			case IPP_TAG_LANGUAGE:
+ 			case IPP_TAG_MIMETYPE:
+-				g_print ("'%s'\n", attr->values[i].string.text);
++				g_print ("'%s'\n", ippGetString (attr, i, NULL));
+ 				break;
+ 
+ 			case IPP_TAG_BOOLEAN:
+-				g_print ("%s\n", (int)attr->values[i].boolean ? "true" : "false");
++				g_print ("%s\n", (int)ippGetBoolean (attr, i) ? "true" : "false");
+ 				break;
+ 
+ 			default:
+-- 
+1.7.8.6
+
diff --git a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
index 199ee72..f317997 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS="glib-2.0 gtk+ pango cups intltool libgnomeui"
 
-PR = "r1"
+PR = "r2"
 
 inherit gnome pkgconfig
 
@@ -13,7 +13,10 @@ do_compile_append () {
 	sed 's:${STAGING_DIR_HOST}::' < libgnomecups-1.0.pc.old > libgnomecups-1.0.pc
 }
 
-SRC_URI += "file://libgnomecups-0.2.3-glib.h.patch"
+SRC_URI += "\
+  file://libgnomecups-0.2.3-glib.h.patch \
+  file://libgnomecups-0.2.3-cups-1.6.patch \
+"
 
 SRC_URI[archive.md5sum] = "dc4920c15c9f886f73ea74fbff0ae48b"
 SRC_URI[archive.sha256sum] = "e130e80942b386de19a288a4c194ff3dbe9140315b31e982058c8bffbb6a1d29"
-- 
1.8.0.2



