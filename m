Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1P25GB-0003qf-3u for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 18:48:34 +0200
Received: from f053033104.adsl.alicedsl.de ([78.53.33.104]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1P25Fx-00041k-4q for openembedded-devel@lists.openembedded.org;
	Sat, 02 Oct 2010 16:48:17 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 02 Oct 2010 18:48:15 +0200
Message-ID: <1286038095.3743.9.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] python-{native}-2.6.5: Fix parallel build.
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
X-List-Received-Date: Sat, 02 Oct 2010 16:48:34 -0000
X-Groupsio-MsgNum: 24291
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-IEXSN/kRYtHFMmV6H58q"

--=-IEXSN/kRYtHFMmV6H58q
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Date: Sat, 2 Oct 2010 12:51:03 +0200

Randomly the build failed for me with the following error message.

    libpython2.6.so: undefined reference to `_PyParser_Grammar'

The applied patch in [5] tried to fix this problem, but it turns out that t=
his was due to a possible race and already known in OpenOffice too [3].

R. David Murray (dmalcolm) <dmalcolm@fedoraproject.org> fixed this in Fedor=
a [1] and I applied his patch.

I reported this issue upstream [4] and this will only be fixed in Python 2.=
7, so we have to keep this patch for Python 2.6.

[1] http://pkgs.fedoraproject.org/gitweb/?p=3Dpython.git;a=3Dcommitdiff;h=
=3Db95f6cc2ca6a009f97436c6aa16cfd70547353d9
[2] http://www.openoffice.org/issues/show_bug.cgi?id=3D114866
[3] http://doc.services.openoffice.org/wiki/RedTinderboxStatusInEIS
[4] http://bugs.python.org/issue10013
[5] http://patchwork.openembedded.org/patch/1899/

Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
---
 .../python/python-2.6.5/20-fix-parallel-make.patch |   40 ++++++++++++++++=
++++
 recipes/python/python-native_2.6.5.bb              |    2 +-
 recipes/python/python_2.6.5.bb                     |    5 +-
 3 files changed, 44 insertions(+), 3 deletions(-)
 create mode 100644 recipes/python/python-2.6.5/20-fix-parallel-make.patch

diff --git a/recipes/python/python-2.6.5/20-fix-parallel-make.patch b/recip=
es/python/python-2.6.5/20-fix-parallel-make.patch
new file mode 100644
index 0000000..1f7b24e
--- /dev/null
+++ b/recipes/python/python-2.6.5/20-fix-parallel-make.patch
@@ -0,0 +1,40 @@
+upstream: <http://bugs.python.org/issue10013>
+comment: As in the comment in the issue tracker this is fixed for py3k a l=
ittle differently <http://svn.python.org/view?view=3Drev&revision=3D84068>.=
 This patch is taken from Fedora.
+
+diff -up Python-2.7/Makefile.pre.in.fix-parallel-make Python-2.7/Makefile.=
pre.in
+--- Python-2.7/Makefile.pre.in.fix-parallel-make	2010-07-22 15:01:39.56799=
6932 -0400
++++ Python-2.7/Makefile.pre.in	2010-07-22 15:47:02.437998509 -0400
+@@ -198,6 +198,7 @@ SIGNAL_OBJS=3D	@SIGNAL_OBJS@
+=20
+ #########################################################################=
#
+ # Grammar
++GRAMMAR_STAMP=3D	$(srcdir)/grammar-stamp
+ GRAMMAR_H=3D	$(srcdir)/Include/graminit.h
+ GRAMMAR_C=3D	$(srcdir)/Python/graminit.c
+ GRAMMAR_INPUT=3D	$(srcdir)/Grammar/Grammar
+@@ -515,10 +516,24 @@ Modules/getpath.o: $(srcdir)/Modules/get
+ Modules/python.o: $(srcdir)/Modules/python.c
+ 	$(MAINCC) -c $(PY_CFLAGS) -o $@ $(srcdir)/Modules/python.c
+=20
++# GNU "make" interprets rules with two dependents as two copies of the ru=
le.
++#=20
++# In a parallel build this can lead to pgen being run twice, once for eac=
h of
++# GRAMMAR_H and GRAMMAR_C, leading to race conditions in which the compil=
er
++# reads a partially-overwritten copy of one of these files, leading to sy=
ntax
++# errors (or linker errors if the fragment happens to be syntactically va=
lid C)
++#
++# See http://www.gnu.org/software/hello/manual/automake/Multiple-Outputs.=
html
++# for more information.
++#
++# Introduce ".grammar-stamp" as a contrived single output from PGEN to av=
oid
++# this:
++$(GRAMMAR_H) $(GRAMMAR_C): $(GRAMMAR_STAMP)
+=20
+-$(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
++$(GRAMMAR_STAMP): $(PGEN) $(GRAMMAR_INPUT)
+ 		-@$(INSTALL) -d Include
+ 		-$(HOSTPGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
++		touch $(GRAMMAR_STAMP)
+=20
+ $(PGEN):	$(PGENOBJS)
+ 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
diff --git a/recipes/python/python-native_2.6.5.bb b/recipes/python/python-=
native_2.6.5.bb
index 76fbbb6..12c2252 100644
--- a/recipes/python/python-native_2.6.5.bb
+++ b/recipes/python/python-native_2.6.5.bb
@@ -11,11 +11,11 @@ SRC_URI =3D "http://www.python.org/ftp/python/${PV}/Pyt=
hon-${PV}.tar.bz2 \
            file://10-distutils-fix-swig-parameter.patch \
            file://11-distutils-never-modify-shebang-line.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
+           file://20-fix-parallel-make.patch
            file://debug.patch \
            file://nohostlibs.patch"
 SRC_URI[md5sum] =3D "6bef0417e71a1a1737ccf5750420fdb3"
 SRC_URI[sha256sum] =3D "62da62eb685621ede2be1275f11b89fa0e0be578db8daa5320=
d0a7855c0a9ebc"
-
 S =3D "${WORKDIR}/Python-${PV}"
=20
 inherit native
diff --git a/recipes/python/python_2.6.5.bb b/recipes/python/python_2.6.5.b=
b
index ecd9f78..2c26512 100644
--- a/recipes/python/python_2.6.5.bb
+++ b/recipes/python/python_2.6.5.bb
@@ -3,7 +3,7 @@ DEPENDS =3D "python-native db gdbm openssl readline sqlite3=
 tcl zlib\
            ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}"
 DEPENDS_sharprom =3D "python-native db readline zlib gdbm openssl"
 # set to .0 on every increase of INC_PR
-PR =3D "${INC_PR}.0"
+PR =3D "${INC_PR}.1"
=20
 SRC_URI =3D "\
   http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
@@ -14,8 +14,9 @@ SRC_URI =3D "\
   file://04-default-is-optimized.patch \
   file://05-enable-ctypes-cross-build.patch \
   file://06-ctypes-libffi-fix-configure.patch \
+  file://20-fix-parallel-make.patch \
   file://99-ignore-optimization-flag.patch \
-  file://sitecustomize.py \
+  file://sitecustomize.py
 "
 SRC_URI[md5sum] =3D "6bef0417e71a1a1737ccf5750420fdb3"
 SRC_URI[sha256sum] =3D "62da62eb685621ede2be1275f11b89fa0e0be578db8daa5320=
d0a7855c0a9ebc"
--=20
1.7.1


--=-IEXSN/kRYtHFMmV6H58q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkynYkoACgkQPX1aK2wOHVhMXgCfe7cp3cqi5unRid32r87GscQH
bb0AnjAZzAs3QPBkqBvA2JXQJTobQWob
=aVTx
-----END PGP SIGNATURE-----

--=-IEXSN/kRYtHFMmV6H58q--
