Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdGE2-00060g-2v
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 09:09:11 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so4637410eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2012 23:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=mD8WVFCisI/3LnAfc20CT05OQ/Ofv0lsXH24RXlwSus=;
	b=cC8yqMQ2YPO6SymkxCVG8Ou8guag+byJH2ZGoLk39rkRoRvDot3m6bH1TbutJj2Iwl
	VJ03uKIKDidSD51Z526/c1/bafzXLm62SKdRkmPCsPshdS7H1HIWpd+KX6kGb1rWO3EX
	8iBYZBMNccNtXcuS0y0jAV2JXdWwcBMlHgFoYqdO0Rr1IGCOzq40v680WNR9aoNEbKqI
	HG7sxa9k2O3XBVPRFTXy3jUPMJ9WNez5E4h6CFCAQqmmVJJAA3ZpX7xpxGCiuaDGBdTr
	DnvN1w8EU9VZkxGcvxSQ1WjO/utYB5OF8PK6jIDNW8s1M3psS/uCifWBrIB4nq1OAqv5
	YvEw==
Received: by 10.14.205.198 with SMTP id j46mr55374290eeo.27.1354002889433;
	Mon, 26 Nov 2012 23:54:49 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e7sm39192426eep.1.2012.11.26.23.54.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Nov 2012 23:54:48 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 08:54:40 +0100
Message-Id: <1354002880-9815-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [meta-oe][meta-gnome][PATCH] evolution-data-server: fix build with libxml2-2.9.0
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
X-List-Received-Date: Tue, 27 Nov 2012 08:09:12 -0000

* newer eds versions depend on external libgdata
  http://git.gnome.org/browse/evolution-data-server/commit/servers?h=gnome-2-32&id=28897beab5dcd4aab3586322a96280be92585db6
  but for this one, we need this patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-soup-adapt-to-new-libxml2-API-from-2.9.0.patch | 100 +++++++++++++++++++++
 .../recipes-gnome/eds/evolution-data-server_git.bb |   3 +-
 2 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0001-soup-adapt-to-new-libxml2-API-from-2.9.0.patch

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-soup-adapt-to-new-libxml2-API-from-2.9.0.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-soup-adapt-to-new-libxml2-API-from-2.9.0.patch
new file mode 100644
index 0000000..7905801
--- /dev/null
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0001-soup-adapt-to-new-libxml2-API-from-2.9.0.patch
@@ -0,0 +1,100 @@
+From 5083b22669f0d2102b72956a2b8afd9432303ce5 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 27 Nov 2012 08:46:51 +0100
+Subject: [PATCH] soup: adapt to new libxml2 API from 2.9.0
+
+* for more info see
+  https://mail.gnome.org/archives/xml/2012-August/msg00005.html
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ calendar/backends/caldav/e-cal-backend-caldav.c | 21 +++++++++++++++++++++
+ servers/google/libgdata/gdata-entry.c           |  8 ++++++++
+ 2 files changed, 29 insertions(+)
+
+diff --git a/calendar/backends/caldav/e-cal-backend-caldav.c b/calendar/backends/caldav/e-cal-backend-caldav.c
+index 5e7ecc4..b7f4afb 100644
+--- a/calendar/backends/caldav/e-cal-backend-caldav.c
++++ b/calendar/backends/caldav/e-cal-backend-caldav.c
+@@ -1038,8 +1038,13 @@ check_calendar_changed_on_server (ECalBackendCalDAV *cbdav)
+ 	soup_message_set_request (message,
+ 				  "application/xml",
+ 				  SOUP_MEMORY_COPY,
++#ifdef LIBXML2_NEW_BUFFER
++				  (gchar *) xmlOutputBufferGetContent(buf),
++				  xmlOutputBufferGetSize(buf));
++#else
+ 				  (gchar *) buf->buffer->content,
+ 				  buf->buffer->use);
++#endif
+ 
+ 	/* Send the request now */
+ 	send_and_handle_redirection (priv->session, message, NULL);
+@@ -1180,8 +1185,13 @@ caldav_server_list_objects (ECalBackendCalDAV *cbdav, CalDAVObject **objs, gint
+ 	soup_message_set_request (message,
+ 				  "application/xml",
+ 				  SOUP_MEMORY_COPY,
++#ifdef LIBXML2_NEW_BUFFER
++				  (gchar *) xmlOutputBufferGetContent(buf),
++				  xmlOutputBufferGetSize(buf));
++#else
+ 				  (gchar *) buf->buffer->content,
+ 				  buf->buffer->use);
++#endif
+ 
+ 	/* Send the request now */
+ 	send_and_handle_redirection (priv->session, message, NULL);
+@@ -1502,8 +1512,14 @@ caldav_receive_schedule_outbox_url (ECalBackendCalDAV *cbdav)
+ 	soup_message_set_request (message,
+ 				  "application/xml",
+ 				  SOUP_MEMORY_COPY,
++#ifdef LIBXML2_NEW_BUFFER
++				  (gchar *) xmlOutputBufferGetContent(buf),
++				  xmlOutputBufferGetSize(buf));
++#else
+ 				  (gchar *) buf->buffer->content,
+ 				  buf->buffer->use);
++#endif
++
+ 
+ 	/* Send the request now */
+ 	send_and_handle_redirection (priv->session, message, NULL);
+@@ -1552,8 +1568,13 @@ caldav_receive_schedule_outbox_url (ECalBackendCalDAV *cbdav)
+ 		soup_message_set_request (message,
+ 				  "application/xml",
+ 				  SOUP_MEMORY_COPY,
++#ifdef LIBXML2_NEW_BUFFER
++				  (gchar *) xmlOutputBufferGetContent(buf),
++				  xmlOutputBufferGetSize(buf));
++#else
+ 				  (gchar *) buf->buffer->content,
+ 				  buf->buffer->use);
++#endif
+ 
+ 		/* Send the request now */
+ 		send_and_handle_redirection (priv->session, message, NULL);
+diff --git a/servers/google/libgdata/gdata-entry.c b/servers/google/libgdata/gdata-entry.c
+index ab69eb0..3f05b17 100644
+--- a/servers/google/libgdata/gdata-entry.c
++++ b/servers/google/libgdata/gdata-entry.c
+@@ -877,9 +877,17 @@ gdata_entry_new_from_xmlptr (xmlDocPtr doc, xmlNodePtr cur)
+ 		xmlOutputBufferFlush (buf);
+ 
+ 		if (buf->conv == NULL)
++#ifdef LIBXML2_NEW_BUFFER
++			xmlString = g_strdup ((gchar *) xmlOutputBufferGetContent(buf));
++#else
+ 			xmlString = g_strdup ((gchar *)buf->buffer->content);
++#endif
+ 		else
++#ifdef LIBXML2_NEW_BUFFER
++			xmlString = g_strdup ((gchar *) xmlBufContent(buf));
++#else
+ 			xmlString = g_strdup ((gchar *)buf->conv->content);
++#endif
+ 		xmlOutputBufferClose (buf);
+ 	}
+ 
+-- 
+1.8.0
+
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
index 9064251..958a90c 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_git.bb
@@ -13,7 +13,7 @@ DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libi
 SRCREV = "3ca578d968d09785933ebbb45b66b3bccdbd5832"
 
 PV = "2.30+git${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
            file://oh-contact.patch;striplevel=0 \
@@ -24,6 +24,7 @@ SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
            file://depbuildfix.patch \
            file://fix_for_automake-1.12.x.patch \
            file://avoid_automake_errors.patch \
+           file://0001-soup-adapt-to-new-libxml2-API-from-2.9.0.patch \
            file://iconv-detect.h"
 
 S = "${WORKDIR}/git"
-- 
1.8.0



