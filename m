Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id E1D9A7197B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 12:53:31 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id b75so116911lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 05:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=rbDFWjICu4S29S3aYnFL2hV7jRdUR+5Tu1x2Ens2TX0=;
	b=nmMPZTXbyX9toJwsR7TXYfk28fHlFoa+2cVt61H19bNM1+Uh7JK9P/Mt0W/WbPCAXZ
	mnjv+p+N1OiTMHc9G6b1MTE6stid8UMEoH2Cp2ae6SQgrt+pecv9TIGZrt9f+GDWUKQ5
	cWy4kxDIApglvs8SYQIqP0K35zT4Rzq3yjY2uhxW9m1ZgddQvcTmwAIWcqF9Vi1uPLrH
	uo++/MjwOLiYIeI9061FY59D6A8aWuq79snNQASi68/7b7kTKFbj8Fgrng1KFjf0WUdU
	vbafHt2YmTvqbvseaVVLpbXk8htjcUsAJnu1oSvBDDV7dEWialPKJ/q1BTNHPzPqFpsc
	gP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=rbDFWjICu4S29S3aYnFL2hV7jRdUR+5Tu1x2Ens2TX0=;
	b=ZrVImy3OCuRMvgLUvl6F4pyWPt+WPGZO7WBmWwKBB3mtmkrHATcAXss5aKirksAYG0
	tviiK8mA1pydBW1Hj6zYu2eW8ZzOzZ5bQgKePnQHUCnLdBHrxPGNamqQ9cvh4ViG0/kJ
	2Cgi9ydKXWFDFV3uqYiK+eIV0bqijMmECaMUbq6eiRzKKq882RUR1ap/OEcdrcnVnVaR
	HtaKCX51yr3yqAJwPcrQd3ey+V3/rQcIVuadlYEHmKVOxkcLzlN1uWDjneQ3AQAJBsfk
	CdnG6nCzlYmLnMDIKA8CSWwU5xsLZVvPHpbUc7vcf9qGNP9KWiQBwawDU+b4edv9UJ6H
	s0cg==
X-Gm-Message-State: ABUngveUkoYVZbz217r3pVlddXtEQFfeBssWnv+5NvcLIiPWazE1eGfZNAosyCWBdCkMQw==
X-Received: by 10.194.176.201 with SMTP id ck9mr302298wjc.199.1476968012533;
	Thu, 20 Oct 2016 05:53:32 -0700 (PDT)
Received: from localhost.localdomain (m77-218-240-141.cust.tele2.se.
	[77.218.240.141]) by smtp.gmail.com with ESMTPSA id
	wn5sm36943035wjb.42.2016.10.20.05.53.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 20 Oct 2016 05:53:31 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Oct 2016 14:53:33 +0200
Message-Id: <1476968013-3849-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-networking] [PATCH V2] atftp: fixes musl libc build
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
X-List-Received-Date: Thu, 20 Oct 2016 12:53:33 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The patches derive from buildroot:
https://git.busybox.net/buildroot/commit/?id=ef33c008e3c5048d1442f8b0f6336db2fa8d79a1

Adjust __BEGIN_DECLS/__END_DECLS defines according to:
http://wiki.musl-libc.org/wiki/FAQ

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 .../atftp/atftp-0.7_add_missing_defines.patch      | 65 ++++++++++++++++++++++
 .../atftp/atftp-0.7_add_missing_include.patch      | 43 ++++++++++++++
 meta-networking/recipes-daemons/atftp/atftp_git.bb |  3 +
 3 files changed, 111 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/atftp/atftp/atftp-0.7_add_missing_defines.patch
 create mode 100644 meta-networking/recipes-daemons/atftp/atftp/atftp-0.7_add_missing_include.patch

diff --git a/meta-networking/recipes-daemons/atftp/atftp/atftp-0.7_add_missing_defines.patch b/meta-networking/recipes-daemons/atftp/atftp/atftp-0.7_add_missing_defines.patch
new file mode 100644
index 0000000..7af3a7e
--- /dev/null
+++ b/meta-networking/recipes-daemons/atftp/atftp/atftp-0.7_add_missing_defines.patch
@@ -0,0 +1,65 @@
+From 6d597493131b19aa78c1cecd63ac4e266bb50df8 Mon Sep 17 00:00:00 2001
+From: Peter Liu <peter.x.liu@external.atlascopco.com>
+Date: Thu, 20 Oct 2016 14:31:30 +0200
+Subject: [PATCH] argz.h: fix compiling (add missing defines)
+
+Use extern "C" instead of __BEGIN_DECL/__END_DECL macros, these macros
+are defined in sys/cdefs.h for glibc and this header is not available
+on all libc.
+
+Also define __attribute_pure__ if it's not defined.
+
+Upstream-Status: Pending
+
+Signed-off-by: Peter Liu <peter.x.liu@external.atlascopco.com>
+---
+ argz.h | 22 ++++++++++++++++++++--
+ 1 file changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/argz.h b/argz.h
+index 582be55..11e1431 100644
+--- a/argz.h
++++ b/argz.h
+@@ -48,12 +48,28 @@
+ # define __const const
+ #endif
+ 
++#ifndef __attribute_pure__
++# define __attribute_pure__
++#endif
++
+ #ifndef __error_t_defined
+ typedef int error_t;
+ #endif
+ 
++#ifndef __THROW
++# ifndef __GNUC_PREREQ
++#  define __GNUC_PREREQ(maj, min) (0)
++# endif
++# if defined __cplusplus && __GNUC_PREREQ (2,8)
++#  define __THROW throw ()
++# else
++#  define __THROW
++# endif
++#endif
+ 
+-__BEGIN_DECLS
++#ifdef __cplusplus
++extern "C" {
++#endif
+ 
+ /* Make a '\0' separated arg vector from a unix argv vector, returning it in
+    ARGZ, and the total length in LEN.  If a memory allocation error occurs,
+@@ -200,6 +216,8 @@ argz_next (__const char *__argz, size_t __argz_len,
+ }
+ #endif /* Use extern inlines.  */
+ 
+-__END_DECLS
++#ifdef __cplusplus
++}
++#endif
+ 
+ #endif /* argz.h */
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/atftp/atftp/atftp-0.7_add_missing_include.patch b/meta-networking/recipes-daemons/atftp/atftp/atftp-0.7_add_missing_include.patch
new file mode 100644
index 0000000..851626c
--- /dev/null
+++ b/meta-networking/recipes-daemons/atftp/atftp/atftp-0.7_add_missing_include.patch
@@ -0,0 +1,43 @@
+From 77e399899d9d7297d23c321811b628febdf0fd92 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 16 Apr 2015 22:43:49 +0200
+Subject: [PATCH] tftp.h/tftpd.h: fix compile (missing include)
+
+Upstream-Status: Pending
+
+Add sys/types.h include for u_char typedef.
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
+---
+ tftp.h  | 1 +
+ tftpd.h | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/tftp.h b/tftp.h
+index 12bd6aa..32a3f63 100644
+--- a/tftp.h
++++ b/tftp.h
+@@ -19,6 +19,7 @@
+ 
+ #include <sys/time.h>
+ #include <sys/times.h>
++#include <sys/types.h>
+ #include "tftp_def.h"
+ #include "config.h"
+ 
+diff --git a/tftpd.h b/tftpd.h
+index 945065e..60d3a49 100644
+--- a/tftpd.h
++++ b/tftpd.h
+@@ -20,6 +20,7 @@
+ #include <pthread.h>
+ #include <arpa/tftp.h>
+ #include <arpa/inet.h>
++#include <sys/types.h>
+ #include "tftp_io.h"
+ 
+ /*
+-- 
+2.1.4
+
diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb b/meta-networking/recipes-daemons/atftp/atftp_git.bb
index b222c34..fc1ca96 100644
--- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
+++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
@@ -14,7 +14,10 @@ SRC_URI = "git://git.code.sf.net/p/atftp/code \
            file://atftpd.init \
            file://atftpd.service \
            file://atftp-0.7-sorcerers_apprentice.patch \
+           file://atftp-0.7_add_missing_defines.patch \
+           file://atftp-0.7_add_missing_include.patch \
 "
+
 S = "${WORKDIR}/git"
 
 inherit autotools update-rc.d systemd
-- 
1.9.1


