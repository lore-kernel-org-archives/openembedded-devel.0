Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 644CB78621
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 16:23:02 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id d8so1937645pgt.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 09:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fTvk9VBE5sLYrCyAwlkcDJEAMdnsK6jZ1jhjGWQbh/M=;
	b=jFH4CD3aJAIPILfPnCPnwIzJ8hV5QuLHLcOiDMr4kd/p00ujaNGNE3nn8b2koquNXT
	uD5IcM/xqb8Bwq9xCm9T+e6SPb2JIfNdkxPuklAOldR095NJ9J6UXSTdGNzCurQ6O8Xj
	k2gKLSzpyKqsPlRg4dN8kvbggnVpX8+0OEEszhfqBKUBPnCBv8fLFZ54+/kKWkBFSP4a
	VWGXioWTVyruwW+a7ssebsd1kR/hV0/r+sUkyx6zubjG7CkFotT9Xzx16VKBPpGj2rmP
	JdxmiX1wQ4sEhztdYLxEBlaSlCT2SZtBaQm7H/XK48bBpti44JeycL2tbfhHxqk34SZE
	MnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fTvk9VBE5sLYrCyAwlkcDJEAMdnsK6jZ1jhjGWQbh/M=;
	b=MXx2464qo9gSBmZO5C6UxJIi9GtwQc6+Nm2fvQFvJPvyr+qZnfdJeGjdFWeyTvScnd
	dwZJxAto/SxbBxVNDfuMVHwibqN6rtYu5v7q0EPckyF/NdI7n6ab4+qPjDPGwzXDktPo
	fbydXoj4oSnwasORq7XXR5LF1gEBmDTiI8kVRoIcEyh5VjLKWk/zqJUC6C3LhTOy9fEK
	4kxQuojBEFyd39SCRAStQat7hv+EIDSO/thn1DDJIRRn7sc0mdfVHL/jBoWZ5JhzG61g
	3XKuPCMpkT7GhQ6Te0qCooYtn++wRz9FMn+46uKf0/A6XldKmcUi2NYGR4ILrprJHPP2
	9tHg==
X-Gm-Message-State: AHPjjUjQJNK90M1rkuHVEBKki2oA04ddBFit85fdc4mJrNd0sxUNmUFm
	PZcWYb9YBEmF4Bjt
X-Google-Smtp-Source: ADKCNb6jj6OKhNUxX/wE573vJLiwyITyHPrDqrrhS9GvdmzVL1IeITxnxToRgNDtpffXzhXszsy0xA==
X-Received: by 10.84.217.206 with SMTP id d14mr25213040plj.157.1505406184036; 
	Thu, 14 Sep 2017 09:23:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id
	b68sm33288473pfk.23.2017.09.14.09.23.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Sep 2017 09:23:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Sep 2017 09:22:55 -0700
Message-Id: <20170914162255.43165-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170914162255.43165-1-raj.khem@gmail.com>
References: <20170914162255.43165-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] ypbind-mt: Upgrade to 2.4
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
X-List-Received-Date: Thu, 14 Sep 2017 16:23:03 -0000

Fix build with musl along the way

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-dns_hosts-Fix-build-with-musl.patch       | 67 ++++++++++++++++++++++
 .../nis/{ypbind-mt_1.38.bb => ypbind-mt_2.4.bb}    | 10 +++-
 2 files changed, 74 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-support/nis/ypbind-mt/0001-dns_hosts-Fix-build-with-musl.patch
 rename meta-networking/recipes-support/nis/{ypbind-mt_1.38.bb => ypbind-mt_2.4.bb} (84%)

diff --git a/meta-networking/recipes-support/nis/ypbind-mt/0001-dns_hosts-Fix-build-with-musl.patch b/meta-networking/recipes-support/nis/ypbind-mt/0001-dns_hosts-Fix-build-with-musl.patch
new file mode 100644
index 000000000..643b0a940
--- /dev/null
+++ b/meta-networking/recipes-support/nis/ypbind-mt/0001-dns_hosts-Fix-build-with-musl.patch
@@ -0,0 +1,67 @@
+From 5452961750275b1e3f7c95e9528338f0ee0357ad Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 14 Sep 2017 09:17:35 -0700
+Subject: [PATCH] dns_hosts: Fix build with musl
+
+Add NETDB_* defines which are not available in musl
+remove need for sys/cdefs.h by remove __P
+Add _GNU_SOURCE for missing u_char definition
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ lib/Makefile.am | 2 +-
+ lib/dns_hosts.c | 9 ++++++++-
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 977a8db..35cb5b3 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -8,7 +8,7 @@
+ noinst_LIBRARIES = libcompat.a
+ noinst_HEADERS = ypbind3_binding.h
+ 
+-AM_CFLAGS = -D_REENTRANT=1 @WARNFLAGS@
++AM_CFLAGS = -D_GNU_SOURCE -D_REENTRANT=1 @WARNFLAGS@
+ AM_CPPFLAGS = -I$(srcdir) @TIRPC_CFLAGS@ @NSL_CFLAGS@ -DLOCALEDIR=\"$(localedir)\"
+ 
+ libcompat_a_SOURCES = dns_hosts.c res_options.h ypbind3_binding_dup.c \
+diff --git a/lib/dns_hosts.c b/lib/dns_hosts.c
+index fd421fd..6067879 100644
+--- a/lib/dns_hosts.c
++++ b/lib/dns_hosts.c
+@@ -64,6 +64,7 @@
+ 
+ #include <sys/param.h>
+ #include <sys/socket.h>
++#include <sys/types.h>
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ #include <arpa/nameser.h>
+@@ -84,6 +85,12 @@ extern struct hostent *_gethtbyaddr(const char *, int, int);
+ #ifndef LOG_AUTH
+ # define LOG_AUTH 0
+ #endif
++#ifndef NETDB_SUCCESS
++# define NETDB_SUCCESS 0
++#endif
++#ifndef NETDB_INTERNAL
++# define NETDB_INTERNAL -1
++#endif
+ 
+ #define MULTI_PTRS_ARE_ALIASES 1	/* XXX - experimental */
+ 
+@@ -101,7 +108,7 @@ static char hostbuf[8*1024];
+ static struct in_addr host_addr;
+ 
+ #ifdef RESOLVSORT
+-static void addrsort __P((char **, int));
++static void addrsort (char **, int);
+ #endif
+ 
+ #if PACKETSZ > 1024
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb b/meta-networking/recipes-support/nis/ypbind-mt_2.4.bb
similarity index 84%
rename from meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
rename to meta-networking/recipes-support/nis/ypbind-mt_2.4.bb
index b9c0aa700..9822f455e 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_2.4.bb
@@ -21,6 +21,7 @@ DEPENDS = " \
            yp-tools \
            ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
           "
+DEPENDS_append_libc-musl = " bsd-headers nss"
 RDEPENDS_${PN} += "yp-tools"
 
 # ypbind-mt now provides all the functionality of ypbind
@@ -30,9 +31,10 @@ PROVIDES += "ypbind"
 SRC_URI = "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
            file://ypbind.init \
            file://ypbind.service \
-"
-SRC_URI[md5sum] = "094088c0e282fa7f3b3dd6cc51d0a4e1"
-SRC_URI[sha256sum] = "1930ce19f6ccfe10400f3497b31867f71690d2bcd3f5b575199fa915559b7746"
+           file://0001-dns_hosts-Fix-build-with-musl.patch \
+           "
+SRC_URI[md5sum] = "1aeccd0d11c064d5d59c56941bca682b"
+SRC_URI[sha256sum] = "a2e1fa8fc992a12b289c229e00e38c20d59070c3bcf08babf40c692515c340e0"
 
 inherit systemd update-rc.d
 
@@ -42,6 +44,8 @@ INITSCRIPT_PARAMS = "start 44 3 5 . stop 70 0 1 2 6 ."
 
 CACHED_CONFIGUREVARS = "ac_cv_prog_STRIP=/bin/true"
 
+CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/nss3"
+
 do_install_append () {
     install -d ${D}${sysconfdir}/init.d
     install -d ${D}${sysconfdir}/rcS.d
-- 
2.14.1


