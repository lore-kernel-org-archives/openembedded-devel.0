Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RTysa-0001i1-0n
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Nov 2011 17:44:01 +0100
Received: by yenm2 with SMTP id m2so3660188yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2011 08:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=DbC3/icsQNnvpF7KSvPpFi/iTFrH1jHJSRXtbp+Bzs0=;
	b=W2Q+VQtiR8CzoK/agpYow1v/pmbIcsG6V1Xst+SeOKxyWLadRQyZe20hEYUXQZqSIk
	FXZSu3s7Wpo/eoGBiDjYrXqCyTU9PUSpyp05kYqN8dnwRnTTfBEA9y1koV+N2A4JJuna
	I486LwwPnC0g2L6XUB76RFsuC2wa7kUQu5f5Q=
Received: by 10.236.185.68 with SMTP id t44mr49791724yhm.41.1322239041834;
	Fri, 25 Nov 2011 08:37:21 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id w68sm36619531yhe.14.2011.11.25.08.37.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 Nov 2011 08:37:21 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Nov 2011 16:37:09 +0000
Message-Id: <818ec081a3d45d44302ed548f39a7dfcdf5724fb.1322238977.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1322238977.git.otavio@ossystems.com.br>
References: <cover.1322238977.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1322238977.git.otavio@ossystems.com.br>
References: <cover.1322238977.git.otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/1] digitemp: fix build for non x86 architectures
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
X-List-Received-Date: Fri, 25 Nov 2011 16:44:01 -0000

 * fix Makefile to allow CC and CFLAGS override
 * clean binaries before build

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../digitemp/digitemp/makefile-fix.patch           |   20 ++++++++++++++++++++
 meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb |   11 ++++++++++-
 2 files changed, 30 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-support/digitemp/digitemp/makefile-fix.patch

diff --git a/meta-oe/recipes-support/digitemp/digitemp/makefile-fix.patch b/meta-oe/recipes-support/digitemp/digitemp/makefile-fix.patch
new file mode 100644
index 0000000..c0d552d
--- /dev/null
+++ b/meta-oe/recipes-support/digitemp/digitemp/makefile-fix.patch
@@ -0,0 +1,20 @@
+digitemp: allow override of CC and CFLAGS vars
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
+
+--- a/Makefile	2008-08-28 21:37:00.000000000 +0000
++++ b/Makefile	2011-11-24 22:22:39.882511272 +0000
+@@ -11,8 +11,9 @@
+ 
+ VERSION = 3.6.0
+ 
+-CC	= gcc
+-CFLAGS	= -I./src -I./userial -O2 -Wall # -g
++CC	?= gcc
++CFLAGS	?=  -O2 -Wall # -g
++CFLAGS += -I./src -I./userial
+ 
+ OBJS		=	src/digitemp.o src/device_name.o src/ds2438.o
+ HDRS		= 	src/digitemp.h src/device_name.h
diff --git a/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb b/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb
index e2ad691..9ebd9f6 100644
--- a/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb
+++ b/meta-oe/recipes-support/digitemp/digitemp_3.6.0.bb
@@ -4,10 +4,19 @@ DEPENDS = "libusb1"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=44fee82a1d2ed0676cf35478283e0aa0"
 
-SRC_URI = "http://www.digitemp.com/software/linux/digitemp-${PV}.tar.gz"
+PR = "r1"
+
+SRC_URI = "http://www.digitemp.com/software/linux/digitemp-${PV}.tar.gz \
+           file://makefile-fix.patch"
 
 inherit autotools
 
+EXTRA_OEMAKE = "ds9097 ds9097u"
+
+do_configure() {
+    rm digitemp_*
+}
+
 do_install() {
     install -d ${D}${sbindir}
     install digitemp_* ${D}${sbindir}
-- 
1.7.2.5



