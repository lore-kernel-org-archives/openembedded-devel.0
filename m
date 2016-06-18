Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id F281C605FE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jun 2016 14:41:31 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id b136so16307579qkg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jun 2016 07:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=sYoOJH8nrzrS5q+Gh/RRfE4Ie4TceDnY6Q2fLeOw8tI=;
	b=Ft9AyWpBROyB/BxmBnnt2j7t6Vs7sUdQKLaLL/qBp27D8KQb6pyQkvhTcnV6hyXRpv
	YOp2Qbc6mbPyK1i6qqlRyHFpNSQfR61XJLysgwVQRD9d/4uPyMo/rjRQ/2i1vNWlXT6V
	5b65G7KeRW9yJQs+Y09w9MLu0uHckCQ38EE4t8diUsnrlkbM64gCPsADKrF2DKL1ZLw4
	B8yexTg/bB4Gu9Uqp6dfhKSwvq68EjyMz/7d8zjUUE3TND8lGQ6yfaglqHWaD1Ndet+t
	Bz/OxKm6RjIpSi3lmSm1wy6vc3s1bY4yK+LQ1KezwhIyCL7G++eUgtO83DFpmopzOBD+
	IMuQ==
X-Gm-Message-State: ALyK8tIs/Sn/kLZlu9MqKXQnh67p4ZnXVYKTOXznm+EKlrNyl+S1NQdy7lt7ErplZH+8Xw==
X-Received: by 10.200.49.50 with SMTP id g47mr9665446qtb.76.1466260892169;
	Sat, 18 Jun 2016 07:41:32 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id f53sm742186qtf.25.2016.06.18.07.41.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 Jun 2016 07:41:31 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jun 2016 10:41:14 -0400
Message-Id: <1466260874-26128-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-networking][PATCH] lftp: fix issues with multiple signbit definitions and remove from the blacklist
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
X-List-Received-Date: Sat, 18 Jun 2016 14:41:34 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../lftp/files/fix-gcc-6-conflicts-signbit.patch   | 44 ++++++++++++++++++++++
 .../recipes-connectivity/lftp/lftp_4.6.3a.bb       |  4 +-
 2 files changed, 45 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/lftp/files/fix-gcc-6-conflicts-signbit.patch

diff --git a/meta-networking/recipes-connectivity/lftp/files/fix-gcc-6-conflicts-signbit.patch b/meta-networking/recipes-connectivity/lftp/files/fix-gcc-6-conflicts-signbit.patch
new file mode 100644
index 0000000..952232b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/lftp/files/fix-gcc-6-conflicts-signbit.patch
@@ -0,0 +1,44 @@
+--- lftp-4.6.3a/src/NetAccess.cc.orig	2016-06-18 10:25:51.063358981 -0400
++++ lftp-4.6.3a/src/NetAccess.cc	2016-06-18 10:26:04.143359209 -0400
+@@ -21,7 +21,7 @@
+ 
+ #include <errno.h>
+ #include <assert.h>
+-#include <math.h>
++#include <cmath>
+ #include <sys/types.h>
+ 
+ #include "NetAccess.h"
+--- lftp-4.6.3a/src/Speedometer.cc.orig	2016-06-18 10:24:58.895358073 -0400
++++ lftp-4.6.3a/src/Speedometer.cc	2016-06-18 10:25:10.879358281 -0400
+@@ -18,7 +18,7 @@
+  */
+ 
+ #include <config.h>
+-#include <math.h>
++#include <cmath>
+ #include <stdlib.h>
+ #include "Speedometer.h"
+ #include "misc.h"
+--- lftp-4.6.3a/src/FileCopy.cc.orig	2016-06-18 10:24:15.939357325 -0400
++++ lftp-4.6.3a/src/FileCopy.cc	2016-06-18 10:24:24.583357475 -0400
+@@ -36,7 +36,7 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <fcntl.h>
+-#include <math.h>
++#include <cmath>
+ #include <stddef.h>
+ #include "FileCopy.h"
+ #include "url.h"
+--- lftp-4.6.3a/src/ResMgr.cc.orig	2016-06-18 10:23:31.387356549 -0400
++++ lftp-4.6.3a/src/ResMgr.cc	2016-06-18 10:23:41.771356729 -0400
+@@ -23,7 +23,7 @@
+ #include <ctype.h>
+ #include <unistd.h>
+ #include <stdlib.h>
+-#include <math.h>
++#include <cmath>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <errno.h>
diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb b/meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb
index 187ccb5..b25db8b 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.6.3a.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "readline"
 
 SRC_URI = "http://fossies.org/linux/misc/lftp-${PV}.tar.gz \
+           file://fix-gcc-6-conflicts-signbit.patch \
           "
 SRC_URI[md5sum] = "2777dd514d21fe1da764bedd1d0ab36c"
 SRC_URI[sha256sum] = "a8b53e5ca2c1acbecd181c87f21a8673ca9038dc9f2be6ab8c23790bd91fd446"
@@ -24,6 +25,3 @@ PACKAGECONFIG[gnutls] = "--with-gnutls, --without-gnutls, gnutls"
 
 FILES_${PN}-dbg += "${libdir}/lftp/${PV}/.debug"
 RDEPENDS_${PN} = "perl bash readline"
-
-# http://errors.yoctoproject.org/Errors/Details/68625/
-PNBLACKLIST[lftp] ?= "BROKEN: fails to build with gcc-6"
-- 
1.9.1


