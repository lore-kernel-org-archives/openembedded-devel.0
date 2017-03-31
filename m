Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1674B77E85
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 16:43:40 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 81so18583105pgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 09:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MpCV5PvYEqgCZIqacTkuFqQ2404yGw/2ko/cALJg4U8=;
	b=hLLDyN889X/Y7JvpdGHa7exUWc/RTZWaYf3ER+OhVTGAuN+NNPggzJDigz6fbLftMG
	pc4+xH6rYR6AXwS1xSfunIKlnINw5ZIOoJ5Au0DQdpfLwjmkgGZadXBdhApOYAN9oKuW
	fGBxqad0+Ax4puPe5ZrnAwWhWLGYp9+No3nX4qUtCYVaS8W4lUb3GnE/MIy2ypOyUKfD
	RRhdt5+ora7mQJLGCnCiTMBzlUk4DtitKJ71ZyDhunl8ZPNav2SvqpS4J1AZQYuPGwrx
	8fZxlvOznvh6hTJvI7DbmOgj49Y/Bu7cgNbthZ6AOFuSP1iIn5UWUSZslaaY87QdrRga
	qrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MpCV5PvYEqgCZIqacTkuFqQ2404yGw/2ko/cALJg4U8=;
	b=LbBpGuVqovtRVs5pDNiG+I+lS4EATytvzgFFN5j3OSv0mvasxjC44eoC1ATbsEDSjY
	hIxpVOoDoe2S+M26cvjIafb808XJPPQgvWxdoFyJrB+ZEVM/PYHbWulVZOlhd5yKuv0U
	+iUOMAAEEKCl4y5V+g5FaORM8oGwCOfWs0GXdVI0BSShkr5vzz376iYG2V2ND2FpxiUj
	KEAWEucWhuPTvWNvtKMUFiXmf6auHJb5jYHoHhYBjEFI0GNQmi8eLYlAB3DzsOm1+vTX
	Cw+53qoEUfk0y+mYGNK8uSdmshgxeKhx4TR3BVEVKlKF+one0vE6Bunpv+cWnMwS15M3
	obUQ==
X-Gm-Message-State: AFeK/H2iQIwQYrnAXM5DNkSM69QAkn2wYfMNqJV7US0RMuwpfbd+/oDeBhvkB0z/GqNxmA==
X-Received: by 10.84.247.23 with SMTP id n23mr4551705pll.39.1490978620721;
	Fri, 31 Mar 2017 09:43:40 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm11569706pfh.124.2017.03.31.09.43.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Mar 2017 09:43:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Mar 2017 09:42:35 -0700
Message-Id: <20170331164247.5052-31-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20170331164247.5052-1-raj.khem@gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 31/43] vpnc: Update to build from github SRC_URI
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
X-List-Received-Date: Fri, 31 Mar 2017 16:43:40 -0000

Fix build for musl
add packageconfig for crypto selection
Fix build with externalsrc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-search-for-log-help-in-build-dir.patch    | 26 +++++++++
 ... 0002-Fix-vpnc-install-for-cross-compile.patch} | 20 ++++++-
 ...003-error.h-is-specific-to-glibc-on-linux.patch | 30 ++++++++++
 ...Use-pkgconfig-instead-of-libgcrypt-config.patch | 30 ++++++++++
 ...ude-sys-ttydefaults.h-for-CEOT-definition.patch | 30 ++++++++++
 ...header-include-sequence-to-adjust-for-mus.patch | 40 +++++++++++++
 ...error-API-when-error.h-is-not-on-platform.patch | 66 ++++++++++++++++++++++
 ...0008-include-sysdep.h-before-net-if_tun.h.patch | 36 ++++++++++++
 .../recipes-connectivity/vpnc/vpnc/makeman.patch   | 11 ----
 .../recipes-connectivity/vpnc/vpnc_0.5.3.bb        | 41 +++++++++-----
 10 files changed, 302 insertions(+), 28 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc/0001-search-for-log-help-in-build-dir.patch
 rename meta-networking/recipes-connectivity/vpnc/vpnc/{vpnc-install.patch => 0002-Fix-vpnc-install-for-cross-compile.patch} (73%)
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc/0003-error.h-is-specific-to-glibc-on-linux.patch
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc/0004-Use-pkgconfig-instead-of-libgcrypt-config.patch
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc/0005-include-sys-ttydefaults.h-for-CEOT-definition.patch
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc/0006-sysdep-Add-header-include-sequence-to-adjust-for-mus.patch
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc/0007-add-error-API-when-error.h-is-not-on-platform.patch
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc/0008-include-sysdep.h-before-net-if_tun.h.patch
 delete mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc/makeman.patch

diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/0001-search-for-log-help-in-build-dir.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0001-search-for-log-help-in-build-dir.patch
new file mode 100644
index 000000000..184c7943b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0001-search-for-log-help-in-build-dir.patch
@@ -0,0 +1,26 @@
+From 48e16e9ae7d8e4c42282bd82cbbd9a6d346a5c00 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 2 Dec 2012 02:16:54 +0100
+Subject: [PATCH 1/8] search for log-help in build dir
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ makeman.pl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/makeman.pl b/makeman.pl
+index cf241a1..2d73432 100755
+--- a/makeman.pl
++++ b/makeman.pl
+@@ -30,7 +30,7 @@ my $vpnc = './vpnc';
+ # indenting lists (those originally starting with an asterisk). I hope
+ # this pays off when converting the manpage to HTML or such.
+ 
+-open my $LONGHELP, '-|', "$vpnc --long-help";
++open my $LONGHELP, '-|', "cat ./long-help";
+ my $vpnc_options    = '';
+ my $relative_indent = 0;
+ my $indent_needed   = 0;
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/vpnc-install.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0002-Fix-vpnc-install-for-cross-compile.patch
similarity index 73%
rename from meta-networking/recipes-connectivity/vpnc/vpnc/vpnc-install.patch
rename to meta-networking/recipes-connectivity/vpnc/vpnc/0002-Fix-vpnc-install-for-cross-compile.patch
index 3de65ec35..6f00d3b89 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc/vpnc-install.patch
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0002-Fix-vpnc-install-for-cross-compile.patch
@@ -1,6 +1,17 @@
---- a/Makefile~	2009-01-20 18:44:30.000000000 +0100
-+++ b/Makefile	2009-01-20 18:44:30.000000000 +0100
-@@ -119,21 +119,21 @@
+From d565b4a5e0045f1e40e0e462920ed5b8faca9eec Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sun, 2 Dec 2012 02:16:54 +0100
+Subject: [PATCH 2/8] Fix vpnc install for cross compile
+
+---
+ Makefile | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 69f5aca..a15782e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -133,21 +133,21 @@ install-common: all
  	else \
  		install vpnc-script $(DESTDIR)$(ETCDIR); \
  	fi
@@ -33,3 +44,6 @@
  
  uninstall :
  	rm -f $(DESTDIR)$(SBINDIR)/vpnc \
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/0003-error.h-is-specific-to-glibc-on-linux.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0003-error.h-is-specific-to-glibc-on-linux.patch
new file mode 100644
index 000000000..bb7730647
--- /dev/null
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0003-error.h-is-specific-to-glibc-on-linux.patch
@@ -0,0 +1,30 @@
+From 6b49020893f999df56392b49b1a289cb96a113a1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 29 Mar 2017 22:08:17 -0700
+Subject: [PATCH 3/8] error.h is specific to glibc on linux
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdep.h | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/sysdep.h b/sysdep.h
+index 137bf6d..6a323f0 100644
+--- a/sysdep.h
++++ b/sysdep.h
+@@ -37,9 +37,10 @@ int tun_read(int fd, unsigned char *buf, int len);
+ int tun_get_hwaddr(int fd, char *dev, uint8_t *hwaddr);
+ 
+ /***************************************************************************/
+-#if defined(__linux__) || defined(__GLIBC__)
++#if defined(__linux__)
++#if defined(__GLIBC__)
+ #include <error.h>
+-
++#endif
+ #define HAVE_VASPRINTF 1
+ #define HAVE_ASPRINTF  1
+ #define HAVE_ERROR     1
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/0004-Use-pkgconfig-instead-of-libgcrypt-config.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0004-Use-pkgconfig-instead-of-libgcrypt-config.patch
new file mode 100644
index 000000000..f70a13898
--- /dev/null
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0004-Use-pkgconfig-instead-of-libgcrypt-config.patch
@@ -0,0 +1,30 @@
+From 4d1dd61c04f52a7c796debbdea5fc9139ffa271d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 29 Mar 2017 22:45:05 -0700
+Subject: [PATCH 4/8] Use pkgconfig instead of libgcrypt-config
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index a15782e..b537046 100644
+--- a/Makefile
++++ b/Makefile
+@@ -63,10 +63,10 @@ RELEASE_VERSION := $(shell cat VERSION)
+ CC ?= gcc
+ CFLAGS ?= -O3 -g
+ CFLAGS += -W -Wall -Wmissing-declarations -Wwrite-strings
+-CFLAGS +=  $(shell libgcrypt-config --cflags) $(CRYPTO_CFLAGS)
++CFLAGS +=  $(shell pkg-config libgcrypt --cflags) $(CRYPTO_CFLAGS)
+ CPPFLAGS += -DVERSION=\"$(VERSION)\"
+ LDFLAGS ?= -g
+-LIBS += $(shell libgcrypt-config --libs) $(CRYPTO_LDADD)
++LIBS += $(shell pkg-config libgcrypt --libs) $(CRYPTO_LDADD)
+ 
+ ifeq ($(shell uname -s), SunOS)
+ LIBS += -lnsl -lresolv -lsocket
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/0005-include-sys-ttydefaults.h-for-CEOT-definition.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0005-include-sys-ttydefaults.h-for-CEOT-definition.patch
new file mode 100644
index 000000000..01783f45b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0005-include-sys-ttydefaults.h-for-CEOT-definition.patch
@@ -0,0 +1,30 @@
+From 1947ea776dc38c3377702dd89bd229670f4d948d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 29 Mar 2017 23:06:52 -0700
+Subject: [PATCH 5/8] include sys/ttydefaults.h for CEOT definition
+
+Fixes
+
+config.c:146:25: error: use of undeclared identifier 'CEOT'
+                if (llen == 0 && c == CEOT)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ config.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/config.c b/config.c
+index 804faa7..1883d12 100644
+--- a/config.c
++++ b/config.c
+@@ -31,6 +31,7 @@
+ #include <sys/types.h>
+ #include <sys/utsname.h>
+ #include <sys/wait.h>
++#include <sys/ttydefaults.h>
+ 
+ #include <gcrypt.h>
+ 
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/0006-sysdep-Add-header-include-sequence-to-adjust-for-mus.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0006-sysdep-Add-header-include-sequence-to-adjust-for-mus.patch
new file mode 100644
index 000000000..fa89df279
--- /dev/null
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0006-sysdep-Add-header-include-sequence-to-adjust-for-mus.patch
@@ -0,0 +1,40 @@
+From 56768fc0c2cbd6abcf28c9805ab516db8a0548d4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 29 Mar 2017 23:09:47 -0700
+Subject: [PATCH 6/8] sysdep: Add header include sequence to adjust for musl
+
+---
+ sysdep.h | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/sysdep.h b/sysdep.h
+index 6a323f0..0122b95 100644
+--- a/sysdep.h
++++ b/sysdep.h
+@@ -17,16 +17,20 @@
+  * __SKYOS__
+  *
+  */
++/* hack to make sure kernel headers understand that libc (musl)
++ * does define IFF_LOWER_UP et al.
++ */
++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO 0
+ 
+ #include <sys/types.h>
+ #include <sys/socket.h>
+-#include <netinet/in.h>
+ 
+ #if !defined(__CYGWIN__)
+-#include <net/if.h>
+-#include <net/if_arp.h>
++//#include <linux/if.h>
++//#include <net/if_arp.h>
+ #include <netinet/if_ether.h>
+ #endif
++#include <netinet/in.h>
+ 
+ #include "config.h"
+ 
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/0007-add-error-API-when-error.h-is-not-on-platform.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0007-add-error-API-when-error.h-is-not-on-platform.patch
new file mode 100644
index 000000000..de67b47a4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0007-add-error-API-when-error.h-is-not-on-platform.patch
@@ -0,0 +1,66 @@
+From b6a027fe4da6f66552b533f1314e5005b16c5455 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 29 Mar 2017 23:52:36 -0700
+Subject: [PATCH 7/8] add error() API when error.h is not on platform
+
+sign-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdep.c | 24 ++++++++++++++++++++++++
+ sysdep.h |  2 ++
+ 2 files changed, 26 insertions(+)
+
+diff --git a/sysdep.c b/sysdep.c
+index d8f181d..2518ec1 100644
+--- a/sysdep.c
++++ b/sysdep.c
+@@ -17,6 +17,7 @@
+     GNU General Public License for more details.
+  */
+ 
++#define _GNU_SOURCE
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <stdlib.h>
+@@ -794,3 +795,26 @@ int setenv(const char *name, const char *value, int overwrite)
+ 	return ret;
+ }
+ #endif
++
++#ifndef _ERROR_H_
++#define _ERROR_H_
++#include <stdarg.h>
++#include <stdio.h>
++#include <errno.h>
++
++void error(int status, int errnum, const char* format, ...)
++{
++	va_list ap;
++
++	fflush(stdout);
++	fprintf(stderr, "%s: ", program_invocation_name);
++	va_start(ap, format);
++	vfprintf(stderr, format, ap);
++	va_end(ap);
++	if (errnum)
++		fprintf(stderr, ":%d", errnum);
++	if (status)
++		exit(status);
++}
++#endif  /* _ERROR_H_ */
++
+diff --git a/sysdep.h b/sysdep.h
+index 0122b95..4e60064 100644
+--- a/sysdep.h
++++ b/sysdep.h
+@@ -44,6 +44,8 @@ int tun_get_hwaddr(int fd, char *dev, uint8_t *hwaddr);
+ #if defined(__linux__)
+ #if defined(__GLIBC__)
+ #include <error.h>
++#else
++void error(int status, int errnum, const char* format, ...);
+ #endif
+ #define HAVE_VASPRINTF 1
+ #define HAVE_ASPRINTF  1
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/0008-include-sysdep.h-before-net-if_tun.h.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/0008-include-sysdep.h-before-net-if_tun.h.patch
new file mode 100644
index 000000000..62ffdb7c9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc/0008-include-sysdep.h-before-net-if_tun.h.patch
@@ -0,0 +1,36 @@
+From 7f01847d14a1a3af50f49499743b0551ddef1311 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 29 Mar 2017 23:54:01 -0700
+Subject: [PATCH 8/8] include sysdep.h before net/if_tun.h
+
+Fixes duplicate defines in header errors
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdep.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/sysdep.c b/sysdep.c
+index 2518ec1..5624ef1 100644
+--- a/sysdep.c
++++ b/sysdep.c
+@@ -57,6 +57,8 @@
+ #include <sys/cygwin.h>
+ #endif
+ 
++#include "sysdep.h"
++
+ #if defined(__DragonFly__)
+ #include <net/tun/if_tun.h>
+ #elif defined(__linux__)
+@@ -69,7 +71,6 @@
+ #include <net/if_tun.h>
+ #endif
+ 
+-#include "sysdep.h"
+ 
+ #if !defined(HAVE_VASPRINTF) || !defined(HAVE_ASPRINTF) || !defined(HAVE_ERROR)
+ #include <stdarg.h>
+-- 
+2.12.1
+
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc/makeman.patch b/meta-networking/recipes-connectivity/vpnc/vpnc/makeman.patch
deleted file mode 100644
index f394e6abd..000000000
--- a/meta-networking/recipes-connectivity/vpnc/vpnc/makeman.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- vpnc-0.5.1/makeman.pl.old	2008-03-16 02:17:59.000000000 -0500
-+++ vpnc-0.5.1/makeman.pl	2008-03-16 02:29:34.000000000 -0500
-@@ -29,7 +29,7 @@ my $vpnc = './vpnc';
- # indenting lists (those originally starting with an asterisk). I hope
- # this pays off when converting the manpage to HTML or such.
- 
--open my $LONGHELP, '-|', "$vpnc --long-help";
-+open my $LONGHELP, '-|', "cat ../long-help";
- my $vpnc_options    = '';
- my $relative_indent = 0;
- my $indent_needed   = 0;
diff --git a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
index 1aff0458d..6f92acd06 100644
--- a/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
+++ b/meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
@@ -4,17 +4,39 @@ AUTHOR = "Maurice Massar vpnc@unix-ag.uni-kl.de"
 SECTION = "net"
 LICENSE = "GPL-2.0+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=173b74cb8ac640a9992c03f3bce22a33"
-DEPENDS = "libgcrypt"
 
-inherit perlnative
+DEPENDS += "libgcrypt"
 
-EXTRA_OEMAKE = "-e MAKEFLAGS="
-CFLAGS_append = ' -DVERSION=\\"${PV}\\"'
-LDFLAGS_append = " -lgcrypt -lgpg-error"
+PV .= "r550-2jnpr1"
+SRCREV = "b1243d29e0c00312ead038b04a2cf5e2fa31d740"
+SRC_URI = "git://github.com/ndpgroup/vpnc \
+           file://long-help \
+           file://default.conf \
+           file://0001-search-for-log-help-in-build-dir.patch \
+           file://0002-Fix-vpnc-install-for-cross-compile.patch \
+           file://0003-error.h-is-specific-to-glibc-on-linux.patch \
+           file://0004-Use-pkgconfig-instead-of-libgcrypt-config.patch \
+           file://0005-include-sys-ttydefaults.h-for-CEOT-definition.patch \
+           file://0006-sysdep-Add-header-include-sequence-to-adjust-for-mus.patch \
+           file://0007-add-error-API-when-error.h-is-not-on-platform.patch \
+           file://0008-include-sysdep.h-before-net-if_tun.h.patch \
+           "
+
+PACKAGECONFIG ?= "gnutls"
+
+PACKAGECONFIG[gnutls] = ",,gnutls"
+PACKAGECONFIG[openssl] = ",,openssl"
+
+S = "${WORKDIR}/git"
+
+inherit perlnative pkgconfig
+
+#EXTRA_OEMAKE = "-e MAKEFLAGS="
 
 do_configure_append () {
     # Make sure we use our nativeperl wrapper
     sed -i "1s:#!.*:#!/usr/bin/env nativeperl:" ${S}/*.pl
+    cp ${WORKDIR}/long-help ${S}
 }
 
 do_install () {
@@ -34,12 +56,3 @@ vpnc_sysroot_preprocess () {
 CONFFILES_${PN} = "${sysconfdir}/vpnc/default.conf"
 RDEPENDS_${PN} = "perl-module-io-file"
 RRECOMMENDS_${PN} = "kernel-module-tun"
-
-SRC_URI = "http://www.unix-ag.uni-kl.de/~massar/vpnc/vpnc-${PV}.tar.gz \
-           file://makeman.patch \
-           file://vpnc-install.patch \
-           file://long-help \
-           file://default.conf"
-
-SRC_URI[md5sum] = "4378f9551d5b077e1770bbe09995afb3"
-SRC_URI[sha256sum] = "46cea3bd02f207c62c7c6f2f22133382602baeda1dc320747809e94881414884"
-- 
2.12.1


