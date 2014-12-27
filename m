Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4B7777264D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:37 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id et14so14737677pad.15
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=G9VGKXj5Sf09VT2zRiB9GJJ4swS6LOvG0yeU5aUhLWk=;
	b=keo3fJ0hKBdhcNI2MSejbrv0Mi4I5YEVVYNT7N+5+BBNhz70y2JpjZPS/VZf93BOy/
	OHIxhea103MqwsOz3NFYoL7OenXgxw02p5SxC4s39vqgzoULaocrfiIyuoqKeEHYKN9F
	Tx0e81CFcigxc3hkSJ19Hob5fWMTvUmLxqq0ZLgalIQNgvTz4RkeaksJHS7eL3ie4B9k
	vPDIP5SbIXgYwkOKUYOJL5wvlqfDOt9smUmnNaytB/JEDKEyuGD+gIDQZGTQy7l8NxC7
	8Om9dC/+n00tK2VqQe8VjXsELdaLc1uKgAQNo6j7qILyOVZqhiLnqd50GuE+gBJ2gc3z
	W4tQ==
X-Received: by 10.66.118.168 with SMTP id kn8mr12500762pab.45.1419700958129;
	Sat, 27 Dec 2014 09:22:38 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.36
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:37 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:22:00 -0800
Message-Id: <1721c79c955a70c51d71516a9fd379ac4ab01dee.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 13/27] sethdlc: fix host contamination
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
X-List-Received-Date: Sat, 27 Dec 2014 17:22:37 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

* Clean INCLUDES to fix the host contamination errors:

  In file included from /usr/src/linux/include/linux/posix_types.h:47:0,
  from /usr/src/linux/include/linux/types.h:17,
  from /usr/src/linux/include/linux/if.h:22,
  from sethdlc.c:23:
  /usr/src/linux/include/asm-generic/posix_types.h:91:3: \
    error: conflicting types for '__kernel_fsid_t'
  } __kernel_fsid_t;
  ^
  .../tmp/sysroots/qemumips/usr/include/asm/posix_types.h:26:3: \
    note: previous declaration of '__kernel_fsid_t' was here
  } __kernel_fsid_t;
  ^

* Correct LIC_FILES_CHKSUM to checkout license infos from sethdl.c
  instead of Makefile.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/sethdlc-fix-host-contamination.patch     | 42 ++++++++++++++++++++++
 .../recipes-connectivity/sethdlc/sethdlc.bb        |  3 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/sethdlc/files/sethdlc-fix-host-contamination.patch

diff --git a/meta-networking/recipes-connectivity/sethdlc/files/sethdlc-fix-host-contamination.patch b/meta-networking/recipes-connectivity/sethdlc/files/sethdlc-fix-host-contamination.patch
new file mode 100644
index 0000000..f25a02c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/sethdlc/files/sethdlc-fix-host-contamination.patch
@@ -0,0 +1,42 @@
+From 9a9137c3df5309ac359737d6ebd67fb4ff5f3cf2 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Mon, 24 Nov 2014 22:05:18 -0500
+Subject: [PATCH] sethdlc: fix host contamination
+
+Clean INCLUDES to fix the host contamination errors:
+
+  In file included from /usr/src/linux/include/linux/posix_types.h:47:0,
+  from /usr/src/linux/include/linux/types.h:17,
+  from /usr/src/linux/include/linux/if.h:22,
+  from sethdlc.c:23:
+  /usr/src/linux/include/asm-generic/posix_types.h:91:3: \
+    error: conflicting types for '__kernel_fsid_t'
+  } __kernel_fsid_t;
+  ^
+  .../tmp/sysroots/qemumips/usr/include/asm/posix_types.h:26:3: \
+    note: previous declaration of '__kernel_fsid_t' was here
+  } __kernel_fsid_t;
+  ^
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 0492f2b..97dec22 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ CC = gcc
+ CFLAGS = -O2 -Wall -W -Wno-long-long -pipe
+-INCLUDES = -I/usr/src/linux/include -I/usr/src/linux-2.6/include
++INCLUDES =
+ 
+ all:		sethdlc
+ 
+-- 
+1.7.9.5
+
diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
index cf74827..5e8d9d9 100644
--- a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
+++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
@@ -1,10 +1,11 @@
 DESCRIPTION = "set Linux HDLC packet radio modem driver port information"
 HOMEPAGE = "https://www.kernel.org/pub/linux/utils/net/hdlc"
 LICENSE = "GPLv2 & GPLv2+ "
-LIC_FILES_CHKSUM = "file://Makefile;md5=19aada31930b2be84bf7138420d77263"
+LIC_FILES_CHKSUM = "file://sethdlc.c;endline=10;md5=90f936879e9f8b755a138aeb348782eb"
 
 
 SRC_URI = "https://www.kernel.org/pub/linux/utils/net/hdlc/${BPN}-1.18.tar.gz \
+           file://sethdlc-fix-host-contamination.patch \
 "
 SRC_URI[md5sum] = "9016878156a5eadb06c0bae71cc5c9ab"
 SRC_URI[sha256sum] = "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706bd5b3d4f6ab6b04e"
-- 
1.9.1


