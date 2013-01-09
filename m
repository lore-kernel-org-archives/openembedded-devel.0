Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TsoX9-00013c-GQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jan 2013 06:49:08 +0100
Received: by mail-pa0-f44.google.com with SMTP id hz11so798489pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jan 2013 21:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=iPuqApT5w/SDPrRHOIqbDPSORSBXRkY9cC46dshGZs4=;
	b=GJdSqAbZdGwsViboe3yF3HV8M6rJDwdGCbq0A0c8OrxcoRz8AXrwdYGiIPs0lAF2ij
	4QBCqYp7O0rSpWLpHVZMWaDIu8pG+zcZsLoPpnXbjNzMTKGPxezz7rV+x3WX8gdOTlVH
	j+1Xk7eT6KyIFKi/BS8Y6mVTdl5/M/1qrmT/Q55pz84kjxxoxj3UG3/O8pqKQBKFi64H
	/R27pR7X27lt62gGnKfq2HZB+4GCpsySCng4Ggl5LeI57ZZO+C/TJiIzLOXGV7InZOT7
	dIOE1QXQoU5au+W4eUEcS+PLr/dmF0l/OnyfjtBlh6KjZCsMgrxfRcA1HA4Mdimt1oG6
	WMMg==
X-Received: by 10.66.52.79 with SMTP id r15mr186567588pao.46.1357709631167;
	Tue, 08 Jan 2013 21:33:51 -0800 (PST)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id f5sm42114866pav.22.2013.01.08.21.33.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Jan 2013 21:33:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Jan 2013 21:33:34 -0800
Message-Id: <1357709614-12266-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-gnome][PATCH] obexd: Include unistd.h to get ssize_t definition
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
X-List-Received-Date: Wed, 09 Jan 2013 05:49:18 -0000

This error is exposed with eglibc 2.17

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../obex/obexd/ssize_t_definition.patch            |   32 ++++++++++++++++++++
 meta-gnome/recipes-connectivity/obex/obexd_0.44.bb |    6 ++--
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-connectivity/obex/obexd/ssize_t_definition.patch

diff --git a/meta-gnome/recipes-connectivity/obex/obexd/ssize_t_definition.patch b/meta-gnome/recipes-connectivity/obex/obexd/ssize_t_definition.patch
new file mode 100644
index 0000000..2009dcd
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/obex/obexd/ssize_t_definition.patch
@@ -0,0 +1,32 @@
+include unistd.h to get ssize_t definitions
+
+Fixes errors like
+
+| In file included from plugins/mas.c:36:0:
+| ./src/obex.h:39:1: error: unknown type name 'ssize_t'
+| ./src/obex.h:49:1: error: unknown type name 'ssize_t'
+| ./src/obex.h:50:1: error: unknown type name 'ssize_t'
+| In file included from plugins/mas.c:38:0:
+| ./src/mimetype.h:36:2: error: expected specifier-qualifier-list before 'ssize_t'
+| In file included from plugins/mas.c:39:0:
+| plugins/filesystem.h:24:1: error: unknown type name 'ssize_t'
+| plugins/mas.c:550:1: error: unknown type name 'ssize_t'
+| plugins/mas.c:557:1: error: unknown type name 'ssize_t'
+| plugins/mas.c: In function 'any_read':
+| plugins/mas.c:560:2: error: unknown type name 'ssize_t'
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Index: obexd-0.44/plugins/mas.c
+===================================================================
+--- obexd-0.44.orig/plugins/mas.c	2012-01-11 14:53:53.000000000 -0800
++++ obexd-0.44/plugins/mas.c	2013-01-08 12:51:12.681882174 -0800
+@@ -29,6 +29,7 @@
+ #include <glib.h>
+ #include <fcntl.h>
+ #include <inttypes.h>
++#include <unistd.h>
+ 
+ #include "obexd.h"
+ #include "plugin.h"
diff --git a/meta-gnome/recipes-connectivity/obex/obexd_0.44.bb b/meta-gnome/recipes-connectivity/obex/obexd_0.44.bb
index 77d7f1e..384ce05 100644
--- a/meta-gnome/recipes-connectivity/obex/obexd_0.44.bb
+++ b/meta-gnome/recipes-connectivity/obex/obexd_0.44.bb
@@ -4,9 +4,11 @@ DEPENDS = "openobex glib-2.0 dbus bluez4 libical"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "files://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz"
+SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/obexd-${PV}.tar.gz \
+           file://ssize_t_definition.patch \
+          "
 SRC_URI[md5sum] = "3fb9cb9d7ab119753253ff784235a364"
 SRC_URI[sha256sum] = "104fc50eb8bf41d690d31588c3a4829a75dc7738b1c76cf260171d8f525da758"
 
-- 
1.7.9.5



