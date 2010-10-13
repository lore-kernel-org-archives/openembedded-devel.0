Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sean@chumby.com>) id 1P67gl-0008FJ-Bj
	for Openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 22:12:42 +0200
Received: by pxi18 with SMTP id 18so48805pxi.6
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 13:12:06 -0700 (PDT)
Received: by 10.142.50.18 with SMTP id x18mr1044812wfx.419.1287000725639;
	Wed, 13 Oct 2010 13:12:05 -0700 (PDT)
Received: from [192.168.10.100] (cm198.psi191.maxonline.com.sg
	[58.146.191.198])
	by mx.google.com with ESMTPS id q13sm12042866wfc.17.2010.10.13.13.12.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 Oct 2010 13:12:04 -0700 (PDT)
From: Sean Cross <sean@chumby.com>
Date: Thu, 14 Oct 2010 04:12:01 +0800
Message-Id: <6976AB00-560A-4D45-A6CA-33F03D38502C@chumby.com>
To: Openembedded-devel@lists.openembedded.org
Mime-Version: 1.0 (Apple Message framework v1081)
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: sean@chumby.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] c-ares: Fix configure script
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
X-List-Received-Date: Wed, 13 Oct 2010 20:12:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


The syntax of one of the AC_CHECK_FUNCS is incorrect.  Removing the
lines in question allows the package to configure and build.
---
 .../0001-remove-broken-configure.ac-commands.patch |   32 =
++++++++++++++++++++
 recipes/c-ares/c-ares_1.5.3.bb                     |    4 ++-
 2 files changed, 35 insertions(+), 1 deletions(-)
 create mode 100644 =
recipes/c-ares/0001-remove-broken-configure.ac-commands.patch

diff --git =
a/recipes/c-ares/0001-remove-broken-configure.ac-commands.patch =
b/recipes/c-ares/0001-remove-broken-configure.ac-commands.patch
new file mode 100644
index 0000000..799332a
--- /dev/null
+++ b/recipes/c-ares/0001-remove-broken-configure.ac-commands.patch
@@ -0,0 +1,32 @@
+diff -ur c-ares-1.5.3-stock/configure.ac c-ares-1.5.3/configure.ac
+--- c-ares-1.5.3-stock/configure.ac    2010-10-13 19:12:51.792124107 =
+0000
++++ c-ares-1.5.3/configure.ac  2010-10-13 19:25:12.932123380 +0000
+@@ -796,28 +796,6 @@
+ )
+=20
+=20
+-AC_CHECK_FUNCS([bitncmp \
+-  gettimeofday \
+-  if_indextoname
+-],[
+-],[
+-  func=3D"$ac_func"
+-  AC_MSG_CHECKING([deeper for $func])
+-  AC_LINK_IFELSE([
+-    AC_LANG_PROGRAM([[
+-    ]],[[
+-      $func ();
+-    ]])
+-  ],[
+-    AC_MSG_RESULT([yes])
+-    eval "ac_cv_func_$func=3Dyes"
+-    AC_DEFINE_UNQUOTED([AS_TR_CPP([HAVE_$func])], [1],
+-      [Define to 1 if you have the $func function.])
+-  ],[
+-    AC_MSG_RESULT([but still no])
+-  ])
+-])
+-
+=20
+ dnl check for inet_pton
+ AC_CHECK_FUNCS(inet_pton)
diff --git a/recipes/c-ares/c-ares_1.5.3.bb =
b/recipes/c-ares/c-ares_1.5.3.bb
index 0def152..fa75f3f 100644
--- a/recipes/c-ares/c-ares_1.5.3.bb
+++ b/recipes/c-ares/c-ares_1.5.3.bb
@@ -1,7 +1,9 @@
 DESCRIPTION =3D "c-ares is a C library that resolves names =
asynchronously."
 HOMEPAGE =3D "http://daniel.haxx.se/projects/c-ares/"
 SECTION =3D "libs"
-SRC_URI =3D "http://daniel.haxx.se/projects/c-ares/c-ares-${PV}.tar.gz"
+SRC_URI =3D "http://daniel.haxx.se/projects/c-ares/c-ares-${PV}.tar.gz =
\
+           file://0001-remove-broken-configure.ac-commands.patch \
+"
 LICENSE =3D "MIT"
 S =3D "${WORKDIR}/c-ares-${PV}"
 PR =3D "r1"
--=20
1.7.0.4




