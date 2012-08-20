Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3ZDs-0006ex-Fy
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 23:09:20 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so4416325wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2012 13:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=P5h2SX27PqQdPfBkuyo+mz1+ZKBduTLNBuP+LaWUa34=;
	b=gYF3wQWVIkQXBStoT37in9uoGDMY+YPrGhGMfRbF7n0ACql/ilQ6W9yiLDdO6px52k
	OqlOKskc6vYbw3Bb7SNf14/iIq+9OACrz35tcA5ohA5Rn2+GlPZhWGDS5Gdw2zqEwNj8
	C/4K1AfZtTMltyNyAdSX4etoyWZiSIOSjbP2SSG0gwACyL1pQQG5INmqTn6qfu50Sagu
	uOl5bwtXQ7Z8qiP+SbW7ianlW8iHFbqyUJp82NJZhKtAVrFcrG/e8EscSIvsxqJrWgH2
	YkIHsA74lBQkPryoICKUio6Xtdz9nwqn7P+kuKvgfWq1ro1mGC3Fv4ntvx6P1diJaOzc
	1f3g==
Received: by 10.180.107.70 with SMTP id ha6mr8057616wib.7.1345496239779;
	Mon, 20 Aug 2012 13:57:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t8sm29941468wiy.3.2012.08.20.13.57.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Aug 2012 13:57:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Aug 2012 22:56:33 +0200
Message-Id: <ee8a3aaadfd3b0b2d9c158b0f5b9272977bb4577.1345496053.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1345496053.git.Martin.Jansa@gmail.com>
References: <cover.1345496053.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1345496053.git.Martin.Jansa@gmail.com>
References: <cover.1345496053.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 6/8] meta-gnome: add libical
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
X-List-Received-Date: Mon, 20 Aug 2012 21:09:20 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../libical/files/pthread-fix.patch                |   52 ++++++++++++++++++++
 meta-gnome/recipes-support/libical/libical_0.48.bb |   17 ++++++
 2 files changed, 69 insertions(+), 0 deletions(-)
 create mode 100644 meta-gnome/recipes-support/libical/files/pthread-fix.patch
 create mode 100644 meta-gnome/recipes-support/libical/libical_0.48.bb

diff --git a/meta-gnome/recipes-support/libical/files/pthread-fix.patch b/meta-gnome/recipes-support/libical/files/pthread-fix.patch
new file mode 100644
index 0000000..aa7767f
--- /dev/null
+++ b/meta-gnome/recipes-support/libical/files/pthread-fix.patch
@@ -0,0 +1,52 @@
+New added pthread feathre leads some deadlock with some unlock code missing.
+This patch fix it.
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+
+Upstream-Status: Pending
+
+Index: libical-0.47/src/libical/icaltimezone.c
+===================================================================
+--- libical-0.47.orig/src/libical/icaltimezone.c	2011-12-16 13:42:25.000000000 +0800
++++ libical-0.47/src/libical/icaltimezone.c	2011-12-16 14:16:25.000000000 +0800
+@@ -1773,7 +1773,7 @@
+     filename = (char*) malloc (filename_len);
+     if (!filename) {
+ 	icalerror_set_errno(ICAL_NEWFAILED_ERROR);
+-	return;
++	goto out;
+     }
+ 
+     snprintf (filename, filename_len, "%s/%s.ics", get_zone_directory(),
+@@ -1783,7 +1783,7 @@
+     free (filename);
+     if (!fp) {
+ 	icalerror_set_errno(ICAL_FILE_ERROR);
+-	return;
++	goto out;
+     }
+ 
+ 	
+@@ -1807,7 +1807,7 @@
+ 
+     if (!subcomp) {
+ 	icalerror_set_errno(ICAL_PARSE_ERROR);
+-	return;
++	goto out;
+     }
+ 
+     icaltimezone_get_vtimezone_properties (zone, subcomp);
+@@ -1817,10 +1817,12 @@
+     icalcomponent_free(comp);
+     }
+ #endif 
+-#ifdef HAVE_PTHREAD
++
+  out:
++#ifdef HAVE_PTHREAD
+     pthread_mutex_unlock(&builtin_mutex);
+ #endif
++    return;
+ }
+ 
+ 
diff --git a/meta-gnome/recipes-support/libical/libical_0.48.bb b/meta-gnome/recipes-support/libical/libical_0.48.bb
new file mode 100644
index 0000000..80f629c
--- /dev/null
+++ b/meta-gnome/recipes-support/libical/libical_0.48.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "iCal and scheduling (RFC 2445, 2446, 2447) library"
+HOMEPAGE = "http://sourceforge.net/projects/freeassociation/"
+BUGTRACKER = "http://sourceforge.net/tracker/?group_id=16077&atid=116077"
+LICENSE = "LGPLv2.1 | MPL-1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d4fc58309d8ed46587ac63bb449d82f8 \
+                    file://LICENSE;md5=d1a0891cd3e582b3e2ec8fe63badbbb6"
+SECTION = "libs"
+
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/freeassociation/${BPN}/${P}/${BPN}-${PV}.tar.gz\
+           file://pthread-fix.patch"
+
+SRC_URI[md5sum] = "e549f434d5fbf9cd156c60ed4943618f"
+SRC_URI[sha256sum] = "2ae78b0757f0dd13431acf42a9a8d038339fd4767fd5134e650bf60ee0b4dff0"
+
+inherit autotools
-- 
1.7.8.6



