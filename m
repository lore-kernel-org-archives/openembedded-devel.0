Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id DE9BB60125
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 20:16:34 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id b136so12231881qkg.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 13:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SyXlxKPZCyw3K5Dyf7HYmSlUtNsZk+gw1HubTH2ff2o=;
	b=NTmbCoiDQkLxV1PwyGjaJs/eHgajxplzn8QS+m83YPVEJp1XeAU6JFGxuhkdlf56nV
	RZtaCkb42uZBPHxXojiFIAmFGgnS74dwajVH4FehTLXb1+xduo2Z0xGskdQCil+o9bpm
	4eyFrDJ6cF1t62a2iYB6HqpVQ5SnO/MNGQ9G70cDVag/HP40gO2DdPZRgQaP//nmZtj1
	lBeaz6/FeAQhqbdUDfxepqqQpPhmdxYDMDzU6O4klcAfFiyuOZl7FwsUBpP1hVJCPrZv
	GRb05+I57tB2wvflJ6iKmbvvqgGtwxKk2yYIiO3r0+O461tkYthu2mnK8LFTrEAhaCYh
	BeaA==
X-Gm-Message-State: ALyK8tL5ZIAlg6EVUUulA/Fatbns72QRiFPz28XJrpcZgkkRcPf/rrJTli+QRNcYJOR3Ww==
X-Received: by 10.55.131.196 with SMTP id f187mr21827125qkd.54.1466626595083; 
	Wed, 22 Jun 2016 13:16:35 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id m7sm752422qte.0.2016.06.22.13.16.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Jun 2016 13:16:34 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jun 2016 16:16:12 -0400
Message-Id: <1466626572-10868-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-gnome][PATCH] evince: fix build errors with gcc-6
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
X-List-Received-Date: Wed, 22 Jun 2016 20:16:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../evince/evince/0002-fix-gcc6-errors.patch       | 39 ++++++++++++++++++++++
 meta-gnome/recipes-gnome/evince/evince_3.18.2.bb   |  4 ++-
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/evince/evince/0002-fix-gcc6-errors.patch

diff --git a/meta-gnome/recipes-gnome/evince/evince/0002-fix-gcc6-errors.patch b/meta-gnome/recipes-gnome/evince/evince/0002-fix-gcc6-errors.patch
new file mode 100644
index 0000000..b8e30f7
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evince/evince/0002-fix-gcc6-errors.patch
@@ -0,0 +1,39 @@
+--- evince-3.18.2/backend/comics/comics-document.c.orig	2016-06-22 20:08:01.789805750 +0000
++++ evince-3.18.2/backend/comics/comics-document.c	2016-06-22 20:07:00.817804688 +0000
+@@ -241,6 +241,8 @@
+ /* This function shows how to use the choosen command for decompressing a
+  * comic book file. It modifies fields of the ComicsDocument struct with 
+  * this information */
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-nonliteral"
+ static gboolean 
+ comics_generate_command_lines (ComicsDocument *comics_document, 
+ 			       GError         **error)
+@@ -296,6 +298,7 @@
+ 	}
+ 
+ }
++#pragma GCC diagnostic pop
+ 
+ /* This function chooses an external command for decompressing a comic 
+  * book based on its mime tipe. */
+--- evince-3.18.2/libdocument/ev-document-misc.c.orig	2016-06-22 20:01:49.205799262 +0000
++++ evince-3.18.2/libdocument/ev-document-misc.c	2016-06-22 20:02:27.233799924 +0000
+@@ -519,7 +519,8 @@
+ 
+ 	return (dp / di);
+ }
+-
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-y2k"
+ /* Returns a locale specific date and time representation */
+ gchar *
+ ev_document_misc_format_date (GTime utime)
+@@ -542,6 +543,7 @@
+ 
+ 	return g_locale_to_utf8 (s, -1, NULL, NULL, NULL);
+ }
++#pragma GCC diagnostic pop
+ 
+ void
+ ev_document_misc_get_pointer_position (GtkWidget *widget,
diff --git a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb b/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
index fe63093..5e6b30f 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
@@ -10,7 +10,9 @@ inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection
 SRC_URI[archive.md5sum] = "c39af6b8b1c44d4393ef8ac9dab99c0b"
 SRC_URI[archive.sha256sum] = "42ad6c7354d881a9ecab136ea84ff867acb942605bcfac48b6c12e1c2d8ecb17"
 
-SRC_URI += "file://0001-help-remove-YELP-macro.patch"
+SRC_URI += "file://0001-help-remove-YELP-macro.patch \
+            file://0002-fix-gcc6-errors.patch \
+"
 
 EXTRA_OECONF = " --enable-thumbnailer \
 "
-- 
1.9.1


