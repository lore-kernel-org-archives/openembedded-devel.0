Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0F37B78461
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 05:07:36 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id k3so1006084pfc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 22:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nm0sB641QmjlgpKtH20w3cc2YVCd5KGagHcXR3HEgQo=;
	b=ZuE7bNqdjP/aJFYWTWUIP8aOePaPXzYVu4R0WAnXmLmwTW3RL2RelsXvSZRYQFIx47
	2wMWl0frYDID7Tce/o6gxLqGi1KDHRisJExZzyxHfHUEyWY2FUdH9Ll4D+tQn9sO7KBV
	cisRX23o4W7LxdwCy++Q5rJmLpQM2zT9J9sqUnaLNMv1NZ6bsZdgTimuvL2uKMyNtiva
	hCLf6giiZGsyEDl5Orhwei+hBBPs6SUvG3ep3jFh1+NR+zgFM4mx1//O6U4UmMHX7CE8
	nqpi5lCiPVjuaY6IodvcKlsPQUSVb1ERtY36nEF38Y/WksT0uQkkkA9QhW6M4P5CernC
	d/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nm0sB641QmjlgpKtH20w3cc2YVCd5KGagHcXR3HEgQo=;
	b=STcM1PMWYe5QI7KlRzvyp6SAoCd8nARslylCrxUrIW3e8AH1Snvk/s3ERDov/WYKgs
	d3EyMMpnw1tnOk1DQ/iFplXt6LzUfD2eFndRkFdmUNntqDrbS4zhhyW5MH9WSiR3OC6y
	fuqrWYY+OhbsSFtEex4cDDCcu5+AQoRGWDHaRZlRiAZ+Li+xSoMc/UwlC02NBynpyjrY
	KkdU7AXu4R9z4VPE03ljn0Af98HG6w5/usT38bWvKTWFHKZ9ojs693jUamDrvkdjxk05
	bnEVUErzWaBh1W8+boAc9r2vp/qw68EErKNJ3Xfky7xGUGoSO17ZHxtEMCNlwBXpTJH9
	hUyg==
X-Gm-Message-State: AHPjjUjGxTWUVpf6FiP/CzOXva+lQk6bPbwRQqFPGd6wYFdbfhjBsJmW
	4T15C0FJQ+jRmrIo
X-Google-Smtp-Source: ADKCNb62qxirBA/ysO0ntHkUvVEvszqmyow3PBieDAM3pbqoCmXrkoXSCMY+P7D/5rigT87eQzTSbw==
X-Received: by 10.84.233.133 with SMTP id l5mr960153plk.7.1504242458086;
	Thu, 31 Aug 2017 22:07:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id
	n66sm1797491pfi.44.2017.08.31.22.07.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Aug 2017 22:07:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Aug 2017 22:07:28 -0700
Message-Id: <20170901050728.37511-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170901050728.37511-1-raj.khem@gmail.com>
References: <20170901050728.37511-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] sblim-sfcb: Fix build with musl
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
X-List-Received-Date: Fri, 01 Sep 2017 05:07:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-need-for-error.h-when-it-does-not-exist.patch | 124 +++++++++++++++++++++
 .../sblim-sfcb/sblim-sfcb_1.4.9.bb                 |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/0001-Replace-need-for-error.h-when-it-does-not-exist.patch

diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/0001-Replace-need-for-error.h-when-it-does-not-exist.patch b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/0001-Replace-need-for-error.h-when-it-does-not-exist.patch
new file mode 100644
index 000000000..e72305023
--- /dev/null
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb-1.4.9/0001-Replace-need-for-error.h-when-it-does-not-exist.patch
@@ -0,0 +1,124 @@
+From 394bf0f1ed07419d40f6024363cc1ffc7ef61bc6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 31 Aug 2017 21:56:25 -0700
+Subject: [PATCH] Replace need for error.h when it does not exist
+
+helps fixing build on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ brokerUpc.c   |  5 ++++-
+ configure.ac  |  2 +-
+ httpAdapter.c |  4 +++-
+ support.c     | 14 +++++++++++++-
+ trace.c       |  4 +++-
+ 5 files changed, 24 insertions(+), 5 deletions(-)
+
+diff --git a/brokerUpc.c b/brokerUpc.c
+index 17cbd9b..fe2b347 100644
+--- a/brokerUpc.c
++++ b/brokerUpc.c
+@@ -20,8 +20,11 @@
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
++#ifdef HAVE_ERROR_H
+ #include <error.h>
+-
++#else
++#include <err.h>
++#endif
+ #include "support.h"
+ #include "native.h"
+ #include <sfcCommon/utilft.h>
+diff --git a/configure.ac b/configure.ac
+index ab2964e..d4915a1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -517,7 +517,7 @@ fi
+ # Checks for header files.
+ AC_HEADER_STDC
+ AC_HEADER_SYS_WAIT
+-AC_CHECK_HEADERS([fcntl.h limits.h netdb.h netinet/in.h stdlib.h string.h sys/socket.h sys/time.h unistd.h zlib.h])
++AC_CHECK_HEADERS([error.h fcntl.h limits.h netdb.h netinet/in.h stdlib.h string.h sys/socket.h sys/time.h unistd.h zlib.h])
+ AC_CHECK_HEADERS([cmpi/cmpimacs.h cmpi/cmpift.h cmpi/cmpidt.h],[],[AC_MSG_ERROR([Could not find required CPMI header.])])
+ 
+ # Checks for typedefs, structures, and compiler characteristics.
+diff --git a/httpAdapter.c b/httpAdapter.c
+index 2719e6c..e768972 100644
+--- a/httpAdapter.c
++++ b/httpAdapter.c
+@@ -71,7 +71,9 @@
+ #ifdef HAVE_UDS
+ #include <grp.h>
+ #endif
+-
++#ifndef __SOCKADDR_ARG
++# define __SOCKADDR_ARG         struct sockaddr *__restrict
++#endif
+ /* should probably go into cimRequest.h */
+ #define CIM_PROTOCOL_ANY     0
+ #define CIM_PROTOCOL_CIM_XML 1
+diff --git a/support.c b/support.c
+index c7bba8b..5b3eef1 100644
+--- a/support.c
++++ b/support.c
+@@ -32,7 +32,11 @@
+ #include "support.h"
+ #include <stdio.h>
+ #include <stdlib.h>
++#ifdef HAVE_ERROR_H
+ #include <error.h>
++#else
++#include <err.h>
++#endif
+ #include <errno.h>
+ #include "native.h"
+ #include "trace.h"
+@@ -331,17 +335,25 @@ loadQualifierDeclMI(const char *provider,
+   _SFCB_RETURN(NULL);
+ };
+ 
++
+ /****************************************************************************/
+ 
+ /** Exits the program with a memory allocation error message in case the given 
+  *  condition holds.
+  */
++#if HAVE_ERROR_H
+ #define __ALLOC_ERROR(cond) \
+   if ( cond ) { \
+     error_at_line ( -1, errno, __FILE__, __LINE__, \
+ 		    "unable to allocate requested memory." ); \
+   }
+-
++#else
++#define __ALLOC_ERROR(cond) \
++  if ( cond ) { \
++    err(1, "%s:%d: %s", __FILE__, __LINE__, \
++		    "unable to allocate requested memory." ); \
++  }
++#endif
+ /**
+  * flag to ensure MM is initialized only once
+  */
+diff --git a/trace.c b/trace.c
+index d7f30db..438af46 100644
+--- a/trace.c
++++ b/trace.c
+@@ -279,7 +279,9 @@ _sfcb_trap(int tn)
+   }
+ #endif
+ }
+-
++#ifndef SA_INTERRUPT
++# define SA_INTERRUPT 0x20000000 /* from GLIBC's <bits/sigaction.h> */
++#endif
+ sigHandler     *
+ setSignal(int sn, sigHandler * sh, int flags)
+ {
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index ddb1cba7f..c6b9f1019 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -21,6 +21,7 @@ SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \
            file://sblim-sfcb-1.4.8-default-ecdh-curve-name.patch \
            file://sblim-sfcb-1.4.9-fix-ftbfs.patch \
            file://0001-include-stdint.h-system-header-for-UINT16_MAX.patch \
+           file://0001-Replace-need-for-error.h-when-it-does-not-exist.patch \
 "
 
 SRC_URI[md5sum] = "28021cdabc73690a94f4f9d57254ce30"
-- 
2.14.1


