Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PZqcB-0004XI-NZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 21:02:47 +0100
Received: by mail-fx0-f47.google.com with SMTP id 17so12727984fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 12:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=AJTPdKU9Y1zya7vNmqEPdO4gZbQvz5yIxEPW2FVlbps=;
	b=A5B55VsWN4TR5yW7UeBHSehFlh0bzXlN/APzH3dBsyTGx0yAe/bowpn/76SgVinSt0
	otdv2r65wWDCDmaObgPE4eAgW9M7wa+sbm2ngjmadxIY5jIgzf4Uvj0hZp+i5kTCj23Y
	BPyih2a58JOiPCiOgGaGhEaI243D1dNQcs0jQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=xU0Q+qepJRt5acHBLuqBNvjKsCfoT2Gyz8zQEfv/UMetdwnZyLFRI+HCpKQ9e/+Zgm
	UDYj2XHoG7zJ3E1KXt9PMeF2+9ot30pBvQlDleHRXoMnmdyxfg7EuE5Ac/mPPRyG4tQ+
	WKEghCJ/LdfCg50ApIFSLaueQXodcJpQ/j4Mw=
Received: by 10.223.74.5 with SMTP id s5mr203273faj.72.1294084940026;
	Mon, 03 Jan 2011 12:02:20 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id n2sm4879300fam.28.2011.01.03.12.02.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Jan 2011 12:02:17 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PZqbf-0000pC-RO; Mon, 03 Jan 2011 21:02:15 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Jan 2011 21:02:05 +0100
Message-Id: <1294084926-3115-11-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 11/12] glib-2.0: fix compilation for !IPv6
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
X-List-Received-Date: Mon, 03 Jan 2011 20:02:47 -0000

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 .../glib-2.0/glib-2.0-2.26.1/configure-ipv6.patch  |   92 ++++++++++++++++++++
 recipes/glib-2.0/glib-2.0_2.26.1.bb                |    3 +-
 2 files changed, 94 insertions(+), 1 deletions(-)
 create mode 100644 recipes/glib-2.0/glib-2.0-2.26.1/configure-ipv6.patch

diff --git a/recipes/glib-2.0/glib-2.0-2.26.1/configure-ipv6.patch b/recipes/glib-2.0/glib-2.0-2.26.1/configure-ipv6.patch
new file mode 100644
index 0000000..548e0dc
--- /dev/null
+++ b/recipes/glib-2.0/glib-2.0-2.26.1/configure-ipv6.patch
@@ -0,0 +1,92 @@
+From a619a217e3e5aa5345db631213aec5a3684a3001 Mon Sep 17 00:00:00 2001
+Subject: [PATCH] autodetect in6addr_{any,loopback} availability
+
+Fixes linking error on systems which choose not to support ipv6:
+./.libs/libgio-2.0.so: undefined reference to `in6addr_loopback'
+./.libs/libgio-2.0.so: undefined reference to `in6addr_any'
+
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+ configure.ac       |   31 +++++++++++++++++++++++++++++++
+ gio/ginetaddress.c |   16 ++++++++++++++--
+ 2 files changed, 45 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7114014..023db49 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1019,6 +1019,37 @@ if test $glib_native_win32 = no; then
+   AC_SUBST(LIBASYNCNS_LIBADD)
+ fi
+ 
++dnl handle --disable-ipv6
++AC_ARG_ENABLE(ipv6, AC_HELP_STRING([--disable-ipv6],[Disable IPv6 support]))
++if test "$ipv6" != "no"; then
++  AC_DEFINE(HAVE_IPV6, 1, [Define if IPv6 is available])
++
++  AC_MSG_CHECKING([for struct in6addr_any])
++  AC_TRY_LINK(
++   [#define IN_AUTOCONF
++     #include <sys/types.h>
++     #include <sys/socket.h>
++     #include <netinet/in.h>],
++   [struct in6_addr a = in6addr_any;
++    return a.s6_addr[0];],
++   [AC_MSG_RESULT(yes)
++    AC_DEFINE(HAVE_IN6ADDR_ANY, 1, [Define if in6addr_any is available])],
++   [AC_MSG_RESULT(no)]
++  )
++  AC_MSG_CHECKING([for struct in6addr_loopback])
++  AC_TRY_LINK(
++   [#define IN_AUTOCONF
++     #include <sys/types.h>
++     #include <sys/socket.h>
++     #include <netinet/in.h>],
++   [struct in6_addr a = in6addr_loopback;
++    return a.s6_addr[0];],
++   [AC_MSG_RESULT(yes)
++    AC_DEFINE(HAVE_IN6ADDR_LOOPBACK, 1, [Define if in6addr_loopback is available])],
++   [AC_MSG_RESULT(no)]
++  )
++fi
++
+ case $host in
+   *-*-solaris* )
+      AC_DEFINE(_XOPEN_SOURCE_EXTENDED, 1, Needed to get declarations for msg_control and msg_controllen on Solaris)
+diff --git a/gio/ginetaddress.c b/gio/ginetaddress.c
+index 0f67e4f..ed29be2 100644
+--- a/gio/ginetaddress.c
++++ b/gio/ginetaddress.c
+@@ -484,7 +484,13 @@ g_inet_address_new_loopback (GSocketFamily family)
+       return g_inet_address_new_from_bytes (addr, family);
+     }
+   else
+-    return g_inet_address_new_from_bytes (in6addr_loopback.s6_addr, family);
++    {
++#ifdef HAVE_IN6ADDR_LOOPBACK
++      return g_inet_address_new_from_bytes (in6addr_loopback.s6_addr, family);
++#else
++      return NULL;
++#endif
++    }
+ }
+ 
+ /**
+@@ -511,7 +517,13 @@ g_inet_address_new_any (GSocketFamily family)
+       return g_inet_address_new_from_bytes (addr, family);
+     }
+   else
+-    return g_inet_address_new_from_bytes (in6addr_any.s6_addr, family);
++    {
++#ifdef HAVE_IN6ADDR_ANY
++      return g_inet_address_new_from_bytes (in6addr_any.s6_addr, family);
++#else
++      return NULL;
++#endif
++    }
+ }
+ 
+ 
+-- 
+1.7.2.3
+
diff --git a/recipes/glib-2.0/glib-2.0_2.26.1.bb b/recipes/glib-2.0/glib-2.0_2.26.1.bb
index 8788258..caccfde 100644
--- a/recipes/glib-2.0/glib-2.0_2.26.1.bb
+++ b/recipes/glib-2.0/glib-2.0_2.26.1.bb
@@ -10,7 +10,7 @@ DEPENDS = "glib-2.0-native gtk-doc zlib"
 DEPENDS_virtclass-native = "gettext-native gtk-doc-native \
                             pkgconfig-native"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "\
   http://ftp.gnome.org/pub/GNOME/sources/glib/2.26/glib-${PV}.tar.bz2;name=archive \
@@ -21,6 +21,7 @@ SRC_URI = "\
   file://60_wait-longer-for-threads-to-die.patch \
   file://glib-mkenums-interpreter.patch \
   file://libglib2-fix-compilation-with-no-builtin-atomic.patch \
+  file://configure-ipv6.patch \
 "
 
 SRC_URI[archive.md5sum] = "17535accceef55bcb17a74d73f9c2aef"
-- 
1.7.2.3



