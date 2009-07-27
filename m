Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MVP9q-0008P8-BV
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jul 2009 14:18:22 +0200
Received: from tamarin.localnet (123-192-154-148.dynamic.kbronet.com.tw
	[123.192.154.148])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 3D8DC1B10C06
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2009 12:05:14 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Jul 2009 12:03:05 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.2.98; i686; ; )
MIME-Version: 1.0
Message-Id: <200907271203.05641.holger+oe@freyther.de>
Subject: [PATCH] gcc: Pass --enable-tls=no on uclibc builds
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
X-List-Received-Date: Mon, 27 Jul 2009 12:18:22 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=46rom 9edbdfdb41d61fc07e0d3e17cfde500e8ac40a4b Mon Sep 17 00:00:00 2001
=46rom: Holger Hans Peter Freyther <zecke@selfish.org>
Date: Mon, 27 Jul 2009 11:31:32 +0200
Subject: [PATCH] gcc: Pass --enable-tls=3Dno on uclibc builds

gcc is checking if GNU as supports TLS for the platform and then
turns on tls support on the compiler. The result is that __thread
is recognized and tls code gets emitted. This will lead to configure
scripts detecting tls (e.g. util-linux-ng) and the build breaking
with an undefined reference to ___tls_get_addr.

Introduce a get_gcc_uclibc_tls_setting python function, call it for
uclibc. A function is picked to support turning on TLS support once
uclibc is gaining a stable implementation.
=2D--
 recipes/gcc/gcc-common.inc           |    7 +++++++
 recipes/gcc/gcc-configure-common.inc |    4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/recipes/gcc/gcc-common.inc b/recipes/gcc/gcc-common.inc
index 6e777e6..9d6d04f 100644
=2D-- a/recipes/gcc/gcc-common.inc
+++ b/recipes/gcc/gcc-common.inc
@@ -15,6 +15,13 @@ def get_gcc_fpu_setting(bb, d):
         return "--with-float=3Dsoft"
     return ""
=20
+# The tls/ntpl support in uclibc is work in progress. For the current
+# targets we should build gcc with --enable-tls=3Dno. In the future we
+# might want to enable TLS for certain architectures and uclibc versions
+# so this is why this method exists.
+def get_gcc_uclibc_tls_setting(bb, d):
+    return "--enable-tls=3Dno"
+
 # We really need HOST_SYS here for some packages and TARGET_SYS for others.
 # For now, libgcc is most important so we fix for that - RP.
 SHLIBSDIR =3D "${STAGING_DIR_TARGET}/shlibs"
diff --git a/recipes/gcc/gcc-configure-common.inc b/recipes/gcc/gcc-configu=
re-
common.inc
index 9363585..bcc1c4f 100644
=2D-- a/recipes/gcc/gcc-configure-common.inc
+++ b/recipes/gcc/gcc-configure-common.inc
@@ -40,8 +40,8 @@ EXTRA_OECONF =3D "${@['--enable-clocale=3Dgeneric', '']
[bb.data.getVar('USE_NLS', d,
 # Build uclibc compilers without cxa_atexit support
 EXTRA_OECONF_append_linux               =3D " --enable-__cxa_atexit"
 EXTRA_OECONF_append_linux-gnueabi       =3D " --enable-__cxa_atexit"
=2DEXTRA_OECONF_append_linux-uclibc        =3D " --disable-__cxa_atexit"
=2DEXTRA_OECONF_append_linux-uclibcgnueabi =3D " --disable-__cxa_atexit"
+EXTRA_OECONF_append_linux-uclibc        =3D " --disable-__cxa_atexit=20
${@get_gcc_uclibc_tls_setting(bb, d)}"
+EXTRA_OECONF_append_linux-uclibcgnueabi =3D " --disable-__cxa_atexit=20
${@get_gcc_uclibc_tls_setting(bb, d)}"
 EXTRA_OECONF_FPU =3D "${@get_gcc_fpu_setting(bb, d)}"
 CPPFLAGS =3D ""
=20
=2D-=20
1.6.3.3



