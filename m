Received: from mail-pa0-f49.google.com ([209.85.220.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtGnB-0002zV-Tb
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 12:59:34 +0100
Received: by mail-pa0-f49.google.com with SMTP id bi1so304715pad.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 03:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Yu3+bu+5/gDtUJEP7mfAaraSh4HxVr8n36iapBdpPwg=;
	b=yBkUW1Ojf0R9HvRseZuf+WhFwGbM2tnmfQPwEtAPeJj64n6YDOTqQAsgbJGFFKQEBr
	7KXJ0XtrRt+qnJsVpNWQNXtv+M7FotP1++hXBlbdpbVGx+wgxMm/WBSjnvgAETESUny9
	VddoN62O9egPjZ3VVIxhysg6W/RlKqqJzK5IXVX39O/sbQiQ8+px6Bfw255KBjACfj4S
	OT4Ce50knckd3/Bj/sE1IuJGUniZVS5KVbYmGcX/vpjiPGKCBF5mHtiTGpjbAPVnEQ/M
	D2+0ui8AoGmleqHXf4F1pW9ITm1rzr/c0ZHA2CZJ2gWyb+2UvKQ0tCl2MoR/LbvisZD+
	HW2Q==
X-Received: by 10.68.242.134 with SMTP id wq6mr47464852pbc.146.1357818255968; 
	Thu, 10 Jan 2013 03:44:15 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id qt3sm681569pbb.32.2013.01.10.03.44.13
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 03:44:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2013 12:44:17 +0100
Message-Id: <1357818257-18773-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1
Subject: [PATCH] gpm: fix build with eglibc-2.17
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
X-List-Received-Date: Thu, 10 Jan 2013 11:59:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.patch | 12 ++++++++++++
 meta-oe/recipes-support/gpm/gpm_1.99.7.bb                |  3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.patch

diff --git a/meta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.patch b/meta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.patch
new file mode 100644
index 0000000..e43bdcb
--- /dev/null
+++ b/meta-oe/recipes-support/gpm/gpm-1.99.7/eglibc-2.17.patch
@@ -0,0 +1,12 @@
+Upstream-Status: pending
+
+--- gpm-1.99.7.orig/src/daemon/open_console.c	2008-07-24 12:33:05.000000000 +0200
++++ gpm-1.99.7/src/daemon/open_console.c	2013-01-10 12:39:47.975461947 +0100
+@@ -23,6 +23,7 @@
+ #include <fcntl.h>              /* open and co.  */
+ #include <sys/stat.h>           /* stat() */
+ #include <sys/ioctl.h>          /* ioctl() */
++#include <sys/types.h>          /* major() */
+ 
+ /* Linux specific (to be outsourced in gpm2 */
+ #include <linux/serial.h>       /* for serial console check */
diff --git a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
index a8af6ab..e35e50e 100644
--- a/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
+++ b/meta-oe/recipes-support/gpm/gpm_1.99.7.bb
@@ -5,13 +5,14 @@ SECTION = "console/utils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://gpm2/core/main.c;endline=19;md5=66d3c205c4e7ee5704b2ee351dfed72f"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS = "ncurses"
 
 SRC_URI = "ftp://arcana.linux.it/pub/gpm/gpm-${PV}.tar.bz2 \
            file://no-docs.patch \
            file://processcreds.patch \
+           file://eglibc-2.17.patch \
            file://init"
 
 inherit autotools update-rc.d
-- 
1.8.1



