Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtHZ0-0004g5-HH
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 13:48:58 +0100
Received: by mail-pa0-f44.google.com with SMTP id hz11so331627pad.17
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 04:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=glK79nYvrwlNnG5kFln08xJZoQKKd7QQzvx7Q1qcps0=;
	b=IlbwkpBRddPSDxu1LdDL4gqvnK5Va2j/u//cYoZy3IE8d2MSAq8F1AOqKDvpyQDNTT
	Gd0+YsoRN6OScDV/SGgGfj9icSzs9uZ2QSSA+p+lMHyNejEtR7mVdZjb5wIh67sUDwrw
	0+XLM10ccfMqSSsK339m1EdjHG9JKXGTuw8HTGqUTtddOMEy2T3+cW6mxxr/fGEBEoo1
	0adJlaH6Zm3vWsG+6GiXakMaF8QY/Mz3BXnMgPv1HxAsWrusdnnOlZLDKB3WXO09yPBv
	0IhCXIRanYWKMk1x6V8mVblhxFp5BDm6E+z2z2fYS8hqj2n9406OxgoylbgB60wzLgiy
	OlFw==
X-Received: by 10.68.202.65 with SMTP id kg1mr39080062pbc.28.1357821220564;
	Thu, 10 Jan 2013 04:33:40 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id wg3sm746906pbc.28.2013.01.10.04.33.38
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 04:33:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2013 13:33:41 +0100
Message-Id: <1357821221-714-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1
Subject: [PATCH] goffice: add patch to use pcre_fullinfo instead of pcre_info
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
X-List-Received-Date: Thu, 10 Jan 2013 12:49:02 -0000

* pcre_info was removed in newer pcre and abiword now fails to build
  /usr/lib/libgoffice-0.8.so: undefined reference to pcre_info

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/goffice/goffice/pcre-8.30.patch   | 19 +++++++++++++++++++
 meta-gnome/recipes-support/goffice/goffice_0.8.17.bb  |  5 ++++-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-support/goffice/goffice/pcre-8.30.patch

diff --git a/meta-gnome/recipes-support/goffice/goffice/pcre-8.30.patch b/meta-gnome/recipes-support/goffice/goffice/pcre-8.30.patch
new file mode 100644
index 0000000..96efb8d
--- /dev/null
+++ b/meta-gnome/recipes-support/goffice/goffice/pcre-8.30.patch
@@ -0,0 +1,19 @@
+Taken from http://trac.macports.org/ticket/34812
+
+Fixes abiword build failing with:
+/usr/lib/libgoffice-0.8.so: undefined reference to `pcre_info'
+
+Upstream-Status: pending
+
+http://www.linuxfromscratch.org/blfs/view/cvs/x/goffice.html
+--- goffice/utils/regutf8.c.orig	2009-09-05 18:52:09.000000000 -0500
++++ goffice/utils/regutf8.c	2012-06-09 18:04:29.000000000 -0500
+@@ -155,7 +155,7 @@
+ 		default: return GO_REG_BADPAT;
+ 		}
+ 	} else {
+-		gor->re_nsub = pcre_info (r, NULL, NULL);
++		gor->re_nsub = pcre_fullinfo (r, NULL, 0, NULL);
+ 		gor->nosub = (cflags & GO_REG_NOSUB) != 0;
+ 		return 0;
+ 	}
diff --git a/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb b/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb
index c5d54ab..637ee18 100644
--- a/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb
+++ b/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb
@@ -7,8 +7,11 @@ DEPENDS = "libxml-parser-perl-native glib-2.0 gtk+ pango cairo libgsf libpcre li
 
 inherit gnome pkgconfig perlnative
 
+PR = "r1"
+
 SRC_URI += " file://c99math.patch \
-             file://nodolt.patch "
+             file://nodolt.patch \
+             file://pcre-8.30.patch"
 
 SRC_URI[archive.md5sum] = "b4c924457163e02daf8a8d2428f51d10"
 SRC_URI[archive.sha256sum] = "dd8caef5fefffbc53938fa619de9f58e7c4dc71a1803de134065d42138a68c06"
-- 
1.8.1



