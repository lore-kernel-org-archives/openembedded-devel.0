Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 008B56B547
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  4 Aug 2013 21:47:27 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so1273697eak.32
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Aug 2013 14:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=yzKb4Rim3JeCrLWsYK6QaEF+b4PRtu/vshskQbFC/Tc=;
	b=tc9oCWqQBjb3tQm1Kn8vXxd8Vu7UAq9QpZ5k5tPub0Nfnf6lPD1SKj13Ud3OB6UXl7
	nTr1e0vjSs6jsZF3FDpgISLGx+O/eHNUsmoH1jJ0LjcUOnRnX9oUFUOwrTj8Ea/0Jveq
	Dft0nlnHKEOrqINTllGrgm41Ab8YwiePAWn0WKJPT/3uPK9b5SIvXPmQFD/rUTn8SqWl
	hqvDs6Um2RnYbp+5/sbd2eCMGyEnotYjag0icF1t1XtdNwhA6p18TSnAgoOLbzX1M5BN
	7Z/0ucJq7waZAxTmgkNsImSItqiyucH4XQueYx7qh99QvHbJSxH8G8JLRKYcfr6Gl2YT
	xc2Q==
X-Received: by 10.14.215.1 with SMTP id d1mr14434417eep.10.1375652848410;
	Sun, 04 Aug 2013 14:47:28 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	l42sm28772528eeo.14.2013.08.04.14.47.27 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 14:47:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  4 Aug 2013 23:47:46 +0200
Message-Id: <1375652867-10498-14-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
References: <1375652867-10498-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 14/15] evolution-data-server: upgrade to 3.2.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 04 Aug 2013 21:47:28 -0000

* I've only build tested this, because it was broken for long time and
  bothering me in world builds (and test-dependencies builds), but I'm
  not using any eds dependant app, so I cannot test it properly in
  runtime
* I've dropped some patches with unclear purpose
* enabled nss/nspr as they are now available in oe-core and simplifies
  the build (needs patch to fix build when nss is disabled)
* it was broken for more then 4 months since glib upgrade to 2.36.*
  and nobody complained, I'm tempted to just remove it next time
  (together with cheese, dates, contacts, tasks)
* too late I've found this commit
  https://lists.yoctoproject.org/pipermail/poky/2010-November/000526.html
  which does some similar things but only for 2.32.1

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ace-the-Novell-sample-contact-with-somet.patch} | 46 ++++++++-----
 .../0002-Fix-for-automake-1.12.x.patch             | 32 +++++++++
 ...atch => 0003-Disable-Werror-for-automake.patch} | 32 ++++++---
 ...ix-libical-pkg-config-trying-to-use-host-.patch | 39 +++++++++++
 ...soup-adapt-to-new-libxml2-API-from-2.9.0.patch} | 41 +++---------
 .../eds/evolution-data-server/depbuildfix.patch    | 78 ----------------------
 .../fix_for_automake-1.12.x.patch                  | 28 --------
 .../evolution-data-server/new-contact-fix.patch    | 23 -------
 .../eds/evolution-data-server/nossl.patch          | 70 -------------------
 .../eds/evolution-data-server/old-gdk-api.patch    | 19 ------
 .../optional_imapx_provider.patch                  | 64 ------------------
 .../recipes-gnome/eds/evolution-data-server_git.bb | 49 +++++++-------
 12 files changed, 157 insertions(+), 364 deletions(-)
 rename meta-gnome/recipes-gnome/eds/evolution-data-server/{oh-contact.patch => 0001-contact-Replace-the-Novell-sample-contact-with-somet.patch} (93%)
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0002-Fix-for-automake-1.12.x.patch
 rename meta-gnome/recipes-gnome/eds/evolution-data-server/{avoid_automake_errors.patch => 0003-Disable-Werror-for-automake.patch} (89%)
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0004-configure-Fix-libical-pkg-config-trying-to-use-host-.patch
 rename meta-gnome/recipes-gnome/eds/evolution-data-server/{0001-soup-adapt-to-new-libxml2-API-from-2.9.0.patch => 0005-soup-adapt-to-new-libxml2-API-from-2.9.0.patch} (62%)
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/depbuildfix.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/fix_for_automake-1.12.x.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/new-contact-fix.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/nossl.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/old-gdk-api.patch
 delete mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/optional_imapx_provider.patch

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/oh-contact.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-contact-Replace-the-Novell-sample-contact-with-somet.patch
similarity index 93%
rename from meta-gnome/recipes-gnome/eds/evolution-data-server/oh-contact.patch
rename to meta-gnome/recipes-gnome/eds/evolution-data-server/0001-contact-Replace-the-Novell-sample-contact-with-somet.patch
index b746044..b77e7b9 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/oh-contact.patch
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-contact-Replace-the-Novell-sample-contact-with-somet.patch
@@ -1,11 +1,32 @@
-Replace the Novell sample contact with something more appropriate
+From 4df8bd8ae4258289663b27af1207027c7ee06340 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 4 Aug 2013 09:13:25 +0200
+Subject: [PATCH 1/5] contact: Replace the Novell sample contact with something
+ more appropriate
 
 Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ addressbook/backends/file/Makefile.am    |   1 +
+ addressbook/libedata-book/ximian-vcard.h | 179 ++++++++++++++++++-------------
+ 2 files changed, 103 insertions(+), 77 deletions(-)
 
-Index: addressbook/libedata-book/ximian-vcard.h
-===================================================================
---- addressbook/libedata-book/ximian-vcard.h.orig	2011-12-19 13:58:29.058859231 +0000
-+++ addressbook/libedata-book/ximian-vcard.h	2011-12-19 14:41:48.678918549 +0000
+diff --git a/addressbook/backends/file/Makefile.am b/addressbook/backends/file/Makefile.am
+index 08cf58f..17e7149 100644
+--- a/addressbook/backends/file/Makefile.am
++++ b/addressbook/backends/file/Makefile.am
+@@ -2,6 +2,7 @@ ebook_backend_LTLIBRARIES = libebookbackendfile.la
+ 
+ libebookbackendfile_la_CPPFLAGS = \
+ 	$(AM_CPPFLAGS)					\
++	-DCREATE_DEFAULT_VCARD \
+ 	-DG_LOG_DOMAIN=\"libebookbackend\"		\
+ 	-I$(top_srcdir)					\
+ 	-I$(top_builddir)				\
+diff --git a/addressbook/libedata-book/ximian-vcard.h b/addressbook/libedata-book/ximian-vcard.h
+index 782d37b..5b0b250 100644
+--- a/addressbook/libedata-book/ximian-vcard.h
++++ b/addressbook/libedata-book/ximian-vcard.h
 @@ -1,80 +1,105 @@
  #define XIMIAN_VCARD \
  "BEGIN:VCARD\n" \
@@ -189,15 +210,6 @@ Index: addressbook/libedata-book/ximian-vcard.h
 +" cgM7OzmqAwLdaARzP6QCobajrA5gza+5LALfefuJ+BsKgt7d3xtjP6urqxP2u1OF3XnFiETIkRI\n" \
 +" gQIUKE+H+C/wMGX8Ias1s6CQAAAABJRU5ErkJggg==\n" \
  "END:VCARD"
-Index: addressbook/backends/file/Makefile.am
-===================================================================
---- addressbook/backends/file/Makefile.am.orig	2011-12-19 13:58:28.954859229 +0000
-+++ addressbook/backends/file/Makefile.am	2011-12-19 13:58:31.442859286 +0000
-@@ -2,6 +2,7 @@
- 
- libebookbackendfile_la_CPPFLAGS = \
- 	$(AM_CPPFLAGS)					\
-+	-DCREATE_DEFAULT_VCARD \
- 	-DG_LOG_DOMAIN=\"libebookbackend\"		\
- 	-I$(top_srcdir)					\
- 	-I$(top_builddir)				\
+-- 
+1.8.3.2
+
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0002-Fix-for-automake-1.12.x.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0002-Fix-for-automake-1.12.x.patch
new file mode 100644
index 0000000..5f222ae
--- /dev/null
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0002-Fix-for-automake-1.12.x.patch
@@ -0,0 +1,32 @@
+From f46423c9e4b8b19eda27b307456a717de79b75f3 Mon Sep 17 00:00:00 2001
+From: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: Sun, 4 Aug 2013 09:15:43 +0200
+Subject: [PATCH 2/5] Fix for automake-1.12.x
+
+Fixed these kinds if warning-errors
+
+warning: 'libebookbackendfile.la': linking libtool libraries using a non-POSIX archiver requires 'AM_PROG_AR' in 'configure.ac'
+
+Upstream-Status: Pending
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 9bd97db..49d7506 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -31,6 +31,7 @@ AC_LANG(C)
+ 
+ dnl Automake 1.11 - Silent Build Rules
+ m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
++m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
+ 
+ dnl Required Package Versions
+ m4_define([glib_minimum_version], [2.28])
+-- 
+1.8.3.2
+
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/avoid_automake_errors.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0003-Disable-Werror-for-automake.patch
similarity index 89%
rename from meta-gnome/recipes-gnome/eds/evolution-data-server/avoid_automake_errors.patch
rename to meta-gnome/recipes-gnome/eds/evolution-data-server/0003-Disable-Werror-for-automake.patch
index ebf00c3..a182d4d 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/avoid_automake_errors.patch
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0003-Disable-Werror-for-automake.patch
@@ -1,4 +1,7 @@
-Upstream-Status: Inappropriate [embedded specific]
+From 37b227cff78fd4c652651662dafd71537280824e Mon Sep 17 00:00:00 2001
+From: Nitin A Kamble <nitin.a.kamble@intel.com>
+Date: Sun, 4 Aug 2013 09:16:59 +0200
+Subject: [PATCH 3/5] Disable Werror for automake
 
 Avoid these warning-errors
 
@@ -65,19 +68,30 @@ servers/groupwise/Makefile.am:85: warning: '%'-style pattern rules are a GNU mak
 servers/groupwise/Makefile.am:91: warning: pkgconfig_DATA:-$(API_VERSION: non-POSIX variable name
 autoreconf: automake failed with exit status: 1
 
+Upstream-Status: Inappropriate [embedded specific]
+
 Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/07/09
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
+Conflicts:
+	configure.ac
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 49d7506..1c802ff 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -21,7 +21,7 @@ m4_define([api_version], [1.2])
  dnl Autoconf / Automake Initialization
- AC_PREREQ(2.58)
+ AC_PREREQ(2.62)
  AC_INIT([evolution-data-server],[eds_version],[http://bugzilla.gnome.org/enter_bug.cgi?product=Evolution-Data-Server])
--AM_INIT_AUTOMAKE([gnu 1.9 tar-ustar -Wall -Werror foreign])
-+AM_INIT_AUTOMAKE([gnu 1.9 tar-ustar -Wall foreign])
+-AM_INIT_AUTOMAKE([gnu 1.10 tar-ustar dist-xz no-dist-gzip -Wall -Wno-portability -Werror foreign])
++AM_INIT_AUTOMAKE([gnu 1.10 tar-ustar dist-xz no-dist-gzip -Wall -Wno-portability foreign])
  AC_CONFIG_MACRO_DIR([m4])
  AC_CONFIG_SRCDIR(README)
  AC_CONFIG_HEADERS(config.h)
+-- 
+1.8.3.2
+
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-configure-Fix-libical-pkg-config-trying-to-use-host-.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-configure-Fix-libical-pkg-config-trying-to-use-host-.patch
new file mode 100644
index 0000000..1383347
--- /dev/null
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-configure-Fix-libical-pkg-config-trying-to-use-host-.patch
@@ -0,0 +1,39 @@
+From 2c73b588b9018cb59c666eae3a15fa1af42c56be Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 4 Aug 2013 10:57:08 +0200
+Subject: [PATCH 4/5] configure: Fix libical pkg-config trying to use host
+ paths
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ calendar/libecal/libecal.pc.in | 2 +-
+ configure.ac                   | 3 ++-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/calendar/libecal/libecal.pc.in b/calendar/libecal/libecal.pc.in
+index fc6b359..d3435bb 100644
+--- a/calendar/libecal/libecal.pc.in
++++ b/calendar/libecal/libecal.pc.in
+@@ -12,4 +12,4 @@ Description: Client library for evolution calendars
+ Version: @VERSION@
+ Requires: libical >= @LIBICAL_REQUIRED@ libedataserver-1.2 gio-2.0
+ Libs: -L${libdir} -lecal-1.2
+-Cflags: -I${privincludedir} @LIBICAL_EXTRA_CFLAGS@
++Cflags: -I${privincludedir}
+diff --git a/configure.ac b/configure.ac
+index 1c802ff..f1d4ce8 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1351,7 +1351,8 @@ dnl to differentiate between <libical/ical.h> and <ical.h>
+ dnl We have fixed all our instances to use <libical/ical.h>. Until the .pc from
+ dnl libical is fixed, we have to work-around the buggy CFlags.
+ dnl *****
+-	LIBICAL_EXTRA_CFLAGS=" -I`$PKG_CONFIG --variable=includedir libical` "
++	m4_pattern_allow([^PKG_CONFIG_SYSROOT_DIR$])
++	LIBICAL_EXTRA_CFLAGS=" -I$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=includedir libical` "
+ 	LIBICAL_EXTRA_LIBS=""
+ 	AC_SUBST(LIBICAL_EXTRA_CFLAGS)
+ 	AC_SUBST(LIBICAL_EXTRA_LIBS)
+-- 
+1.8.3.2
+
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-soup-adapt-to-new-libxml2-API-from-2.9.0.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0005-soup-adapt-to-new-libxml2-API-from-2.9.0.patch
similarity index 62%
rename from meta-gnome/recipes-gnome/eds/evolution-data-server/0001-soup-adapt-to-new-libxml2-API-from-2.9.0.patch
rename to meta-gnome/recipes-gnome/eds/evolution-data-server/0005-soup-adapt-to-new-libxml2-API-from-2.9.0.patch
index 7905801..addf2ee 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-soup-adapt-to-new-libxml2-API-from-2.9.0.patch
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0005-soup-adapt-to-new-libxml2-API-from-2.9.0.patch
@@ -1,7 +1,7 @@
-From 5083b22669f0d2102b72956a2b8afd9432303ce5 Mon Sep 17 00:00:00 2001
+From ac95e89749a01618f98b554a98e78d7c988bfc10 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Tue, 27 Nov 2012 08:46:51 +0100
-Subject: [PATCH] soup: adapt to new libxml2 API from 2.9.0
+Subject: [PATCH 5/5] soup: adapt to new libxml2 API from 2.9.0
 
 * for more info see
   https://mail.gnome.org/archives/xml/2012-August/msg00005.html
@@ -9,14 +9,13 @@ Subject: [PATCH] soup: adapt to new libxml2 API from 2.9.0
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  calendar/backends/caldav/e-cal-backend-caldav.c | 21 +++++++++++++++++++++
- servers/google/libgdata/gdata-entry.c           |  8 ++++++++
- 2 files changed, 29 insertions(+)
+ 1 file changed, 21 insertions(+)
 
 diff --git a/calendar/backends/caldav/e-cal-backend-caldav.c b/calendar/backends/caldav/e-cal-backend-caldav.c
-index 5e7ecc4..b7f4afb 100644
+index 12f8f22..5555a3e 100644
 --- a/calendar/backends/caldav/e-cal-backend-caldav.c
 +++ b/calendar/backends/caldav/e-cal-backend-caldav.c
-@@ -1038,8 +1038,13 @@ check_calendar_changed_on_server (ECalBackendCalDAV *cbdav)
+@@ -1172,8 +1172,13 @@ check_calendar_changed_on_server (ECalBackendCalDAV *cbdav)
  	soup_message_set_request (message,
  				  "application/xml",
  				  SOUP_MEMORY_COPY,
@@ -30,7 +29,7 @@ index 5e7ecc4..b7f4afb 100644
  
  	/* Send the request now */
  	send_and_handle_redirection (priv->session, message, NULL);
-@@ -1180,8 +1185,13 @@ caldav_server_list_objects (ECalBackendCalDAV *cbdav, CalDAVObject **objs, gint
+@@ -1321,8 +1326,13 @@ caldav_server_list_objects (ECalBackendCalDAV *cbdav,
  	soup_message_set_request (message,
  				  "application/xml",
  				  SOUP_MEMORY_COPY,
@@ -44,7 +43,7 @@ index 5e7ecc4..b7f4afb 100644
  
  	/* Send the request now */
  	send_and_handle_redirection (priv->session, message, NULL);
-@@ -1502,8 +1512,14 @@ caldav_receive_schedule_outbox_url (ECalBackendCalDAV *cbdav)
+@@ -1715,8 +1725,14 @@ caldav_receive_schedule_outbox_url (ECalBackendCalDAV *cbdav)
  	soup_message_set_request (message,
  				  "application/xml",
  				  SOUP_MEMORY_COPY,
@@ -59,7 +58,7 @@ index 5e7ecc4..b7f4afb 100644
  
  	/* Send the request now */
  	send_and_handle_redirection (priv->session, message, NULL);
-@@ -1552,8 +1568,13 @@ caldav_receive_schedule_outbox_url (ECalBackendCalDAV *cbdav)
+@@ -1765,8 +1781,13 @@ caldav_receive_schedule_outbox_url (ECalBackendCalDAV *cbdav)
  		soup_message_set_request (message,
  				  "application/xml",
  				  SOUP_MEMORY_COPY,
@@ -73,28 +72,6 @@ index 5e7ecc4..b7f4afb 100644
  
  		/* Send the request now */
  		send_and_handle_redirection (priv->session, message, NULL);
-diff --git a/servers/google/libgdata/gdata-entry.c b/servers/google/libgdata/gdata-entry.c
-index ab69eb0..3f05b17 100644
---- a/servers/google/libgdata/gdata-entry.c
-+++ b/servers/google/libgdata/gdata-entry.c
-@@ -877,9 +877,17 @@ gdata_entry_new_from_xmlptr (xmlDocPtr doc, xmlNodePtr cur)
- 		xmlOutputBufferFlush (buf);
- 
- 		if (buf->conv == NULL)
-+#ifdef LIBXML2_NEW_BUFFER
-+			xmlString = g_strdup ((gchar *) xmlOutputBufferGetContent(buf));
-+#else
- 			xmlString = g_strdup ((gchar *)buf->buffer->content);
-+#endif
- 		else
-+#ifdef LIBXML2_NEW_BUFFER
-+			xmlString = g_strdup ((gchar *) xmlBufContent(buf));
-+#else
- 			xmlString = g_strdup ((gchar *)buf->conv->content);
-+#endif
- 		xmlOutputBufferClose (buf);
- 	}
- 
 -- 
-1.8.0
+1.8.3.2
 
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/depbuildfix.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/depbuildfix.patch
deleted file mode 100644
index 0785a93..0000000
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/depbuildfix.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-G_CONST_RETURN is deprecated in glib 2.30 so remove to to avoid
-build failures. Also resolve other deprecation issues.
-
-RP 2011/10/12
-
-Upstream-Status: Pending
-
-Index: git/libedataserver/e-data-server-util.c
-===================================================================
---- git.orig/libedataserver/e-data-server-util.c	2011-10-12 01:42:40.622045788 +0100
-+++ git/libedataserver/e-data-server-util.c	2011-10-12 01:48:16.732045664 +0100
-@@ -165,7 +165,8 @@
- static gunichar
- stripped_char (gunichar ch)
- {
--        gunichar *decomp, retval;
-+        gunichar decomp[4];
-+        gunichar retval;
-         GUnicodeType utype;
-         gsize dlen;
- 
-@@ -175,7 +176,7 @@
-         case G_UNICODE_CONTROL:
-         case G_UNICODE_FORMAT:
-         case G_UNICODE_UNASSIGNED:
--        case G_UNICODE_COMBINING_MARK:
-+        case G_UNICODE_SPACING_MARK:
-                 /* Ignore those */
-                 return 0;
-                break;
-@@ -183,7 +184,7 @@
-                 /* Convert to lowercase, fall through */
-                 ch = g_unichar_tolower (ch);
-         case G_UNICODE_LOWERCASE_LETTER:
--                if ((decomp = g_unicode_canonical_decomposition (ch, &dlen))) {
-+                if ((dlen = g_unichar_fully_decompose (ch, FALSE, decomp, 4))) {
-                         retval = decomp[0];
-                         g_free (decomp);
-                         return retval;
-Index: git/addressbook/libedata-book/e-data-book-factory.c
-===================================================================
---- git.orig/addressbook/libedata-book/e-data-book-factory.c	2011-10-12 01:52:25.692045500 +0100
-+++ git/addressbook/libedata-book/e-data-book-factory.c	2011-10-12 01:53:31.862045707 +0100
-@@ -238,7 +238,7 @@
- 	return g_strdup_printf (
- 		"/org/gnome/evolution/dataserver/addressbook/%d/%u",
- 		getpid (),
--		g_atomic_int_exchange_and_add (&counter, 1));
-+		g_atomic_int_add (&counter, 1));
- }
- 
- static void
-Index: git/addressbook/libedata-book/e-data-book.c
-===================================================================
---- git.orig/addressbook/libedata-book/e-data-book.c	2011-10-12 01:54:40.752045465 +0100
-+++ git/addressbook/libedata-book/e-data-book.c	2011-10-12 01:55:16.012045897 +0100
-@@ -553,7 +553,7 @@
- 
- 	return g_strdup_printf ("/org/gnome/evolution/dataserver/addressbook/BookView/%d/%d",
- 				getpid (),
--				g_atomic_int_exchange_and_add ((int*)&counter, 1));
-+				g_atomic_int_add ((int*)&counter, 1));
- }
- 
- static void
-Index: git/calendar/libedata-cal/e-data-cal-factory.c
-===================================================================
---- git.orig/calendar/libedata-cal/e-data-cal-factory.c	2011-10-12 01:57:56.612045081 +0100
-+++ git/calendar/libedata-cal/e-data-cal-factory.c	2011-10-12 01:57:58.832045211 +0100
-@@ -227,7 +227,7 @@
- 	return g_strdup_printf (
- 		"/org/gnome/evolution/dataserver/calendar/%d/%u",
- 		getpid (),
--		g_atomic_int_exchange_and_add (&counter, 1));
-+		g_atomic_int_add (&counter, 1));
- }
- 
- static void
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/fix_for_automake-1.12.x.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/fix_for_automake-1.12.x.patch
deleted file mode 100644
index ac77a6d..0000000
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/fix_for_automake-1.12.x.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Pending
-
-Fixed these kinds if warning-errors
-
-warning: 'libebookbackendfile.la': linking libtool libraries using a non-POSIX archiver requires 'AM_PROG_AR' in 'configure.ac'
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/07/09
-
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -17,6 +17,7 @@ dnl This number is meaningless, but we'r
- dnl library names for backward compatibility.
- m4_define([api_version], [1.2])
- 
-+
- dnl Autoconf / Automake Initialization
- AC_PREREQ(2.58)
- AC_INIT([evolution-data-server],[eds_version],[http://bugzilla.gnome.org/enter_bug.cgi?product=Evolution-Data-Server])
-@@ -30,6 +31,7 @@ AC_LANG(C)
- 
- dnl Automake 1.11 - Silent Build Rules
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
-+m4_ifdef([AM_PROG_AR], [AM_PROG_AR]) # required by automake 1.12
- 
- dnl Required Package Versions
- m4_define([glib_minimum_version], [2.16.1])
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/new-contact-fix.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/new-contact-fix.patch
deleted file mode 100644
index 22c293d..0000000
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/new-contact-fix.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-When contacts called for the 1st time, adding new contact always failed but
-worked after restart. The reason is e-addressbook-factory used to handle
-addressbook leads a segmentation fault. Root cause is that factory would create
-the data base if not exist, but use it without proper initialization.
-
-This patch fix it.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Edwin Zhai <edwin.zhai@intel.com>
-Index: git/addressbook/backends/file/e-book-backend-file.c
-===================================================================
---- git.orig/addressbook/backends/file/e-book-backend-file.c	2010-10-20 16:14:31.000000000 +0800
-+++ git/addressbook/backends/file/e-book-backend-file.c	2010-10-22 14:11:47.000000000 +0800
-@@ -1217,6 +1217,8 @@
- 				EContact *contact = NULL;
- 				EBookBackendSyncStatus status;
- 
-+				/* Initialize file_db, or else following do_create cause seg fault */
-+				bf->priv->file_db = db;
- 				status = do_create (bf, XIMIAN_VCARD, &contact);
- 				if (status != GNOME_Evolution_Addressbook_Success)
- 					g_warning ("Cannot create default contact: %d", status);
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/nossl.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/nossl.patch
deleted file mode 100644
index 67b6d07..0000000
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/nossl.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
-Index: git/camel/Makefile.am
-===================================================================
---- git.orig/camel/Makefile.am	2010-02-05 15:25:09.000000000 +0000
-+++ git/camel/Makefile.am	2010-02-05 15:25:20.000000000 +0000
-@@ -80,7 +80,6 @@
- 	camel-store-summary.c			\
- 	camel-store.c				\
- 	camel-tcp-stream-raw.c			\
--	camel-tcp-stream-ssl.c			\
- 	camel-tcp-stream.c			\
- 	camel-transport.c			\
- 	camel-uid-cache.c			\
-@@ -133,7 +132,6 @@
- 	camel-store-summary.h			\
- 	camel-store.h				\
- 	camel-tcp-stream-raw.h			\
--	camel-tcp-stream-ssl.h			\
- 	camel-tcp-stream.h			\
- 	camel-transport.h			\
- 	camel-uid-cache.h			\
-Index: git/camel/camel.h
-===================================================================
---- git.orig/camel/camel.h	2010-02-05 15:26:30.000000000 +0000
-+++ git/camel/camel.h	2010-02-05 15:26:52.000000000 +0000
-@@ -122,7 +122,6 @@
- #include <camel/camel-string-utils.h>
- #include <camel/camel-tcp-stream.h>
- #include <camel/camel-tcp-stream-raw.h>
--#include <camel/camel-tcp-stream-ssl.h>
- #include <camel/camel-text-index.h>
- #include <camel/camel-transport.h>
- #include <camel/camel-trie.h>
-Index: git/camel/providers/imap/camel-imap-store.c
-===================================================================
---- git.orig/camel/providers/imap/camel-imap-store.c	2010-02-05 15:28:19.000000000 +0000
-+++ git/camel/providers/imap/camel-imap-store.c	2010-02-05 15:28:38.000000000 +0000
-@@ -51,7 +51,6 @@
- #include "camel/camel-stream.h"
- #include "camel/camel-string-utils.h"
- #include "camel/camel-tcp-stream-raw.h"
--#include "camel/camel-tcp-stream-ssl.h"
- #include "camel/camel-url.h"
- #include "camel/camel-utf8.h"
- 
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2010-02-05 15:31:59.000000000 +0000
-+++ git/configure.ac	2010-02-05 15:33:00.000000000 +0000
-@@ -1272,7 +1272,8 @@
- dnl We have fixed all our instances to use <libical/ical.h>. Until the .pc from
- dnl libical is fixed, we have to work-around the buggy CFlags.
- dnl *****
--	LIBICAL_EXTRA_CFLAGS=" -I`$PKG_CONFIG --variable=includedir libical` "
-+	m4_pattern_allow([^PKG_CONFIG_SYSROOT_DIR$])
-+	LIBICAL_EXTRA_CFLAGS=" -I$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=includedir libical` "
- 	LIBICAL_EXTRA_LIBS=""
- 	AC_SUBST(LIBICAL_EXTRA_CFLAGS)
- 	AC_SUBST(LIBICAL_EXTRA_LIBS)
-Index: git/calendar/libecal/libecal.pc.in
-===================================================================
---- git.orig/calendar/libecal/libecal.pc.in	2010-02-05 15:39:41.000000000 +0000
-+++ git/calendar/libecal/libecal.pc.in	2010-02-05 15:39:55.000000000 +0000
-@@ -12,4 +12,4 @@
- Version: @VERSION@
- Requires: libical >= @LIBICAL_REQUIRED@ libedataserver-1.2 dbus-glib-1
- Libs: -L${libdir} -lecal-1.2
--Cflags: -I${privincludedir} @LIBICAL_EXTRA_CFLAGS@
-+Cflags: -I${privincludedir}
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/old-gdk-api.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/old-gdk-api.patch
deleted file mode 100644
index 7ef2956..0000000
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/old-gdk-api.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Do not disable old API after upgrading gtk+.
-This avoid build error due to defination missing.
-
-Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2010-12-16 10:25:24.000000000 +0800
-+++ git/configure.ac	2010-12-16 10:25:58.000000000 +0800
-@@ -147,7 +147,6 @@
- AS_COMPILER_FLAGS(WARNING_FLAGS,
- 	"-DG_DISABLE_DEPRECATED
- 	-DPANGO_DISABLE_DEPRECATED
--	-DGDK_DISABLE_DEPRECATED
- 	-DGDK_PIXBUF_DISABLE_DEPRECATED
- 	-DG_DISABLE_SINGLE_INCLUDES
- 	-DGTK_DISABLE_SINGLE_INCLUDES
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/optional_imapx_provider.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/optional_imapx_provider.patch
deleted file mode 100644
index d9b0940..0000000
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server/optional_imapx_provider.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-Upstream-Status: Inappropriate [disable feature]
-
-Index: git/camel/providers/Makefile.am
-===================================================================
---- git.orig/camel/providers/Makefile.am	2010-07-06 18:49:34.000000000 +0800
-+++ git/camel/providers/Makefile.am	2010-07-08 17:23:56.000000000 +0800
-@@ -6,6 +6,10 @@
- IMAP4_DIR=imap4
- endif
- 
-+if ENABLE_IMAPX
-+IMAPX_DIR=imapx
-+endif
-+
- if ENABLE_HULA
- HULA_DIR=hula
- endif
-@@ -15,6 +19,6 @@
- SENDMAIL_DIR=sendmail
- endif
- 
--SUBDIRS = pop3 $(SENDMAIL_DIR) smtp imap imapx $(IMAP4_DIR) $(NNTP_DIR) local groupwise $(HULA_DIR)
-+SUBDIRS = pop3 $(SENDMAIL_DIR) smtp imap $(IMAPX_DIR) $(IMAP4_DIR) $(NNTP_DIR) local groupwise $(HULA_DIR)
- 
- -include $(top_srcdir)/git.mk
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2010-07-08 17:24:36.000000000 +0800
-+++ git/configure.ac	2010-07-08 17:32:06.000000000 +0800
-@@ -1002,6 +1002,26 @@
- AM_CONDITIONAL(ENABLE_IMAP4, [test x$enable_imap4 = xyes])
- 
- dnl ******************************
-+dnl IMAPX code support.
-+dnl ******************************
-+AC_ARG_ENABLE(imapx,
-+	AS_HELP_STRING([--enable-imapx=no/yes],
-+	[Attempt to compile yet another, incomplete, very unsupported IMAPv4r1 implementation]),
-+	[],[enable_imapx=no])
-+
-+if test "x$enable_imapx" = "xyes"; then
-+	AC_DEFINE(ENABLE_IMAPX,1,[Really don't try this at home])
-+	AC_PATH_PROG(GPERF, gperf)
-+	if test -z "$GPERF" ; then
-+	AC_MSG_ERROR([You need gperf to compile imapx provider])
-+	fi
-+	msg_imapx=yes
-+else
-+	msg_imapx=no
-+fi
-+AM_CONDITIONAL(ENABLE_IMAPX, [test x$enable_imapx = xyes])
-+
-+dnl ******************************
- dnl Hula support
- dnl ******************************
- AC_ARG_ENABLE([hula],
-@@ -1541,3 +1561,7 @@
- if test "x$msg_hula" = "xyes"; then
- 	echo "Hula support:	$msg_hula"
- fi
-+
-+if test "x$msg_imapx" = "xyes"; then
-+	echo "IMAPX support:	$msg_imapx"
-+fi
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
index 23a6cef..155945f 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
@@ -5,31 +5,29 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 LICENSE = "LGPLv2 & LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
                     file://camel/camel.h;endline=24;md5=b02175c88f821224746b347a89731a2b \
-                    file://libedataserver/e-data-server-util.h;endline=23;md5=9df8127bd8cfdc5469e938fc710d1f40 \
+                    file://libedataserver/e-data-server-util.h;endline=20;md5=934502f03c84523aa059d4825887b380 \
                     file://calendar/libecal/e-cal.h;endline=24;md5=5d496b9b6fd2a4fdbbfc31ef9455c9d0"
 
-DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libiconv zlib libsoup-2.4 libglade libical gnome-keyring gperf-native"
+DEPENDS = "intltool-native glib-2.0 gtk+3 gconf dbus db gnome-common virtual/libiconv zlib libsoup-2.4 libglade libical libgnome-keyring gperf-native libgdata nss"
 
-SRCREV = "3ca578d968d09785933ebbb45b66b3bccdbd5832"
+SRCREV = "a9e4e74ec4473a4fd09e56b690bd4fa72f686687"
 
-PV = "2.30+git${SRCPV}"
-PR = "r4"
+# 3.4 series needs libgdata-0.10*, 3.8 series needs also libsecret instead of gnome-keyring
+PV = "3.2.3+git${SRCPV}"
 
-SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
-           file://oh-contact.patch;striplevel=0 \
-           file://nossl.patch \
-           file://optional_imapx_provider.patch \
-           file://new-contact-fix.patch \
-           file://old-gdk-api.patch \
-           file://depbuildfix.patch \
-           file://fix_for_automake-1.12.x.patch \
-           file://avoid_automake_errors.patch \
-           file://0001-soup-adapt-to-new-libxml2-API-from-2.9.0.patch \
-           file://iconv-detect.h"
+SRC_URI = " \
+    git://git.gnome.org/evolution-data-server;protocol=git \
+    file://0001-contact-Replace-the-Novell-sample-contact-with-somet.patch \
+    file://0002-Fix-for-automake-1.12.x.patch \
+    file://0003-Disable-Werror-for-automake.patch \
+    file://0004-configure-Fix-libical-pkg-config-trying-to-use-host-.patch \
+    file://0005-soup-adapt-to-new-libxml2-API-from-2.9.0.patch \
+    file://iconv-detect.h \
+"
 
 S = "${WORKDIR}/git"
 
-inherit autotools gtk-doc pkgconfig
+inherit autotools gtk-doc pkgconfig gettext
 
 # -ldb needs this on some platforms
 LDFLAGS += "-lpthread"
@@ -41,12 +39,12 @@ LDFLAGS += "-lpthread"
 
 do_configure_append () {
     cp ${WORKDIR}/iconv-detect.h ${S}
-    sed -i 's/-DG_DISABLE_DEPRECATED//g' ${S}/libedataserver/Makefile
 }
 
 EXTRA_OECONF = "--without-openldap --with-dbus --without-bug-buddy \
                 --with-soup --with-libdb=${STAGING_DIR_HOST}${prefix} \
-                --disable-smime --disable-ssl --disable-nntp --without-weather"
+                --disable-nntp --without-weather --disable-goa --disable-uoa --disable-weather"
+#		--disable-ssl --disable-smime --disable-ssl
 
 PACKAGES =+ "libcamel libcamel-dev libebook libebook-dev libecal libecal-dev \
              libedata-book libedata-book-dev libedata-cal libedata-cal-dev \
@@ -55,17 +53,20 @@ PACKAGES =+ "libcamel libcamel-dev libebook libebook-dev libecal libecal-dev \
 
 FILES_${PN} =+ "${datadir}/evolution-data-server-*/ui/"
 FILES_${PN}-dev =+ "${libdir}/pkgconfig/evolution-data-server-*.pc"
-FILES_${PN}-dbg =+ "${libdir}/evolution-data-server-*/camel-providers/.debug \
+FILES_${PN}-dbg =+ "${libdir}/evolution-data-server*/camel-providers/.debug \
+                    ${libdir}/evolution-data-server*/calendar-backends/.debug \
+                    ${libdir}/evolution-data-server*/addressbook-backends/.debug \
                     ${libdir}/evolution-data-server*/extensions/.debug/"
+
 RRECOMMENDS_${PN}-dev += "libecal-dev libebook-dev"
 
-FILES_libcamel = "${libexecdir}/camel-* ${libdir}/libcamel-*.so.* \
+FILES_libcamel = "${libdir}/libcamel-*.so.* \
                   ${libdir}/libcamel-provider-*.so.* \
-                  ${libdir}/evolution-data-server-*/camel-providers/*.so \
-                  ${libdir}/evolution-data-server-*/camel-providers/*.urls"
+                  ${libdir}/evolution-data-server*/camel-providers/*.so \
+                  ${libdir}/evolution-data-server*/camel-providers/*.urls"
 FILES_libcamel-dev = "${libdir}/libcamel-*.so ${libdir}/libcamel-provider-*.so \
                       ${libdir}/pkgconfig/camel*pc \
-                    ${libdir}/evolution-data-server-*/camel-providers/*.la \
+                      ${libdir}/evolution-data-server*/camel-providers/*.la \
                       ${includedir}/evolution-data-server*/camel"
 
 FILES_libebook = "${libdir}/libebook-*.so.*"
-- 
1.8.3.2


