Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ynezz@true.cz>) id 1PtHoO-0007qN-0U
	for openembedded-devel@openembedded.org; Sat, 26 Feb 2011 11:55:45 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 5B41C1D360A9;
	Sat, 26 Feb 2011 11:49:05 +0100 (CET)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Date: Sat, 26 Feb 2011 11:49:06 +0100
Message-Id: <1298717347-19637-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 1/2] jack: fix wrong configure check on the build host
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
X-List-Received-Date: Sat, 26 Feb 2011 10:55:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

| checking existing, conflicting JACK installs...
| You appear to have at least one existing installation of JACK.
| Complete or partial JACK installs exist in: /usr/lib

[...]

NOTE: package jack-0.118.0-r2: task do_configure: Failed

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/jack/files/remove-wrong-host-test.patch |   66 +++++++++++++++++=
++++++
 recipes/jack/jack_0.118.0.bb                    |    6 ++-
 2 files changed, 70 insertions(+), 2 deletions(-)
 create mode 100644 recipes/jack/files/remove-wrong-host-test.patch

diff --git a/recipes/jack/files/remove-wrong-host-test.patch b/recipes/ja=
ck/files/remove-wrong-host-test.patch
new file mode 100644
index 0000000..54c4a83
--- /dev/null
+++ b/recipes/jack/files/remove-wrong-host-test.patch
@@ -0,0 +1,66 @@
+| checking existing, conflicting JACK installs...
+|=20
+| !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
+| You appear to have at least one existing installation of JACK.
+| Complete or partial JACK installs exist in: /usr/lib
+
+[...]
+
+NOTE: package jack-0.118.0-r2: task do_configure: Failed
+
+Index: RELEASE_0_118_0/configure.ac
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- RELEASE_0_118_0.orig/configure.ac	2011-02-26 06:54:25.711716288 +010=
0
++++ RELEASE_0_118_0/configure.ac	2011-02-26 06:54:47.061718126 +0100
+@@ -3,51 +3,6 @@
+=20
+ AC_INIT(jackd/jackd.c)
+=20
+-
+-dnl
+-dnl Check for existing JACK installs
+-dnl=20
+-
+-AC_MSG_CHECKING([existing, conflicting JACK installs])
+-not_overwriting=3D0
+-installs=3D
+-for dir in /usr/lib /usr/local/lib /opt/lib ; do
+-    if test -d $dir ; then
+-	if test $(find $dir/ -name 'libjack.*' 2>/dev/null | wc -l) -gt 0 ; th=
en
+-	    if echo $prefix/lib | grep -vs $dir >/dev/null 2>&1 ; then
+-		not_overwriting=3D$(expr $not_overwriting + 1)
+-	    fi
+-	    installs=3D"$installs $dir"
+-	fi	   =20
+-    fi
+-done
+-
+-if test $not_overwriting -gt 0 ; then
+-    echo=20
+-    echo
+-    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!=
!"
+-    echo "You appear to have at least one existing installation of JACK=
."
+-    echo
+-    echo "Complete or partial JACK installs exist in:$installs"
+-    echo=20
+-    echo "Installing this version will leave at least one of these"
+-    echo "existing installations installed and this will probably break=
"
+-    echo "JACK on your machine. "
+-    echo
+-    echo "Before building, you should first remove the existing JACK"
+-    echo "installation(s). "
+-    echo
+-    echo "Alternatively use ./configure --prefix=3D... to force overwri=
ting"
+-    echo "the existing install."
+-    echo
+-    echo "WARNING: ON ANY DEBIAN-DERIVED DISTRIBUTION (Debian, Ubuntu e=
tc)"
+-    echo "CHANGING THE INSTALLATION PREFIX WILL NOT PRODUCE A WORKING J=
ACK"
+-    echo "INSTALL. Please contact the distribution packager for JACK an=
d"
+-    echo "ask them to fix their packaging."
+-    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!=
!"
+-    exit 1
+-fi
+-
+ AC_CONFIG_AUX_DIR(config)
+ AC_CANONICAL_TARGET
+=20
diff --git a/recipes/jack/jack_0.118.0.bb b/recipes/jack/jack_0.118.0.bb
index 5ca9d65..e979c7a 100644
--- a/recipes/jack/jack_0.118.0.bb
+++ b/recipes/jack/jack_0.118.0.bb
@@ -8,11 +8,13 @@ LICENSE =3D "GPLv2 LGPLv2.1"
=20
 DEPENDS =3D "alsa-lib"
=20
-PR =3D "r2"
+PR =3D "r3"
=20
 SVNPV =3D "${@'${PV}'.replace('.', '_')}"
 SRCREV =3D "4084"
-SRC_URI =3D "svn://subversion.jackaudio.org/jack/tags;module=3DRELEASE_$=
{SVNPV};proto=3Dhttp"
+SRC_URI =3D "svn://subversion.jackaudio.org/jack/tags;module=3DRELEASE_$=
{SVNPV};proto=3Dhttp \
+           file://remove-wrong-host-test.patch \
+           "
=20
 # This is not omap3 specific, but there is a strong correlation between =
using twl4030 and using omap3
 SRC_URI_append_omap3 =3D " file://jack_fix_TWL4030_alsa_capture.patch"
--=20
1.7.0.4



