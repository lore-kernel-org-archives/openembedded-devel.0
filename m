Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SP5rV-00028U-L1
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 May 2012 07:42:57 +0200
Received: by wibhj13 with SMTP id hj13so2936544wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Apr 2012 22:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version:x-mailer;
	bh=ECUKatlWEerWAi0FUTN4ykLBpPnYeVACGkH3rKMoviA=;
	b=k3LqK8MFKQbNEBD1TCO8klw12h2/jmfs9oTnW6G7TnOZtrfPLoy5IB5zsKjvBit3b3
	58do3SoZwHix5BnTwPACzolQ87UNLKahQV/iaPJOMhpBKaLDfVDY91/falb/XQQl8pGz
	KOarXX2Xfi5yqn2LCBB9/FinbyfEbsGdLu9M5nY1LYqkXeewBOV3YCJH6/OhELFez2rY
	lU1MTeRACpEcTu8JKnS8JXyjOV2XdVnQus9J+IdWzpFkS8SK+JB3ssFVX+RhMlMBnljg
	jFPNPs+fMYTt68H3fi8JmsPG5J2wT/wzuq7wt56JnGqbSQNWfWkvplgF9LW/Z2dX34fc
	ghxg==
Received: by 10.216.134.155 with SMTP id s27mr2998955wei.80.1335850395036;
	Mon, 30 Apr 2012 22:33:15 -0700 (PDT)
Received: from [192.168.1.33] (240.Red-88-6-19.staticIP.rima-tde.net.
	[88.6.19.240])
	by mx.google.com with ESMTPS id n20sm53437295wiw.5.2012.04.30.22.33.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 22:33:14 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Tue, 1 May 2012 07:33:11 +0200
Message-Id: <038E6E1D-F89B-4F62-90DF-772C879515C2@gmail.com>
To: OpenEmbedded Developer Mailing List
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Apple Message framework v1257)
X-Mailer: Apple Mail (2.1257)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Solution for building omap3-console-image using gcc-4.5
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
X-List-Received-Date: Tue, 01 May 2012 05:42:57 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
      I've managed to build the omap3-console-image using gcc-4.5, using =
the overo-oe overo-2011.03 branch, by following these steps:

Step 01.00: Install the OE metatdata, and check out the overo-2011.03 =
branch:

$ git clone git://gitorious.org/gumstix-oe/mainline.git
$ git clone git://gitorious.org/gumstix-oe/mainline.git =
org.openembedded.dev
$ cd org.openembedded.dev
$ git checkout -b overo-2011.03 --track origin/overo-2011.03

The last known working commit id for the OE metadata:=20
commit 8b733a34c2dfd7838cd0fa59aa11937a180f18fd
Author: Neil MacMunn <neil@gumstix.com>
Date:   Wed Apr 25 14:53:41 2012 -0700

    obexd_0.34: update checksum values
   =20
    Signed-off-by: Neil MacMunn <neil@gumstix.com>

 Patch 01: Update checksums for libsamplerate-0.17.tar.gz

=46rom e659c8c56d3d00a20d8d5f67811061cef8e3c7c2 Mon Sep 17 00:00:00 2001
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Tue, 24 Apr 2012 21:50:14 +0400
Subject: [PATCH 1/3] Update checksums for libsamplerate-0.17.tar.gz

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 recipes/libsamplerate/libsamplerate0_0.1.7.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/libsamplerate/libsamplerate0_0.1.7.bb =
b/recipes/libsamplerate/libsamplerate0_0.1.7.bb
index 2a81e4b..7328f47 100644
--- a/recipes/libsamplerate/libsamplerate0_0.1.7.bb
+++ b/recipes/libsamplerate/libsamplerate0_0.1.7.bb
@@ -12,5 +12,5 @@ S =3D "${WORKDIR}/libsamplerate-${PV}"
 inherit autotools pkgconfig
=20
=20
-SRC_URI[md5sum] =3D "6731a81cb0c622c483b28c0d7f90867d"
-SRC_URI[sha256sum] =3D =
"78ed5d9ff1bf162c4a078f6a3e7432a537dd2f22dc58872b081fb01156027fcc"
+SRC_URI[md5sum] =3D "ad093e60ec44f0a60de8e29983ddbc0f"
+SRC_URI[sha256sum] =3D =
"e0a646224a0323ac63f56ef009b2d7fee11452a7b8af139b19ae71d2890dbc9c"
--=20
1.7.0.4


 Patch 02: Add libsamplerate0_0.1.8.bb recipe.z

=46rom 6b269dd066291af943d37b09d777f897fac390d3 Mon Sep 17 00:00:00 2001
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Tue, 24 Apr 2012 21:51:25 +0400
Subject: [PATCH 2/3] Add libsamplerate0_0.1.8.bb recipe.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 recipes/libsamplerate/libsamplerate0_0.1.8.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libsamplerate/libsamplerate0_0.1.8.bb

diff --git a/recipes/libsamplerate/libsamplerate0_0.1.8.bb =
b/recipes/libsamplerate/libsamplerate0_0.1.8.bb
new file mode 100644
index 0000000..faa368c
--- /dev/null
+++ b/recipes/libsamplerate/libsamplerate0_0.1.8.bb
@@ -0,0 +1,14 @@
+DESCRIPTION =3D "An audio Sample Rate Conversion library"
+SECTION =3D "libs"
+LICENSE =3D "GPL libsamplerate"
+
+PR =3D "r0"
+
+SRC_URI =3D "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz"
+S =3D "${WORKDIR}/libsamplerate-${PV}"
+
+inherit autotools pkgconfig
+
+
+SRC_URI[md5sum] =3D "1c7fb25191b4e6e3628d198a66a84f47"
+SRC_URI[sha256sum] =3D =
"93b54bdf46d5e6d2354b7034395fe329c222a966790de34520702bb9642f1c06"
--=20
1.7.0.4

 Patch 03: binutils/binutils.inc: Disable treat warnings as errors.

=46rom 13f8d3095a8a0176d41a35f05f237a49ffa84dc1 Mon Sep 17 00:00:00 2001
From: Elvis Dowson <elvis.dowson@gmail.com>
Date: Tue, 1 May 2012 09:19:07 +0400
Subject: [PATCH 3/3] binutils/binutils.inc: Disable treat warnings as =
errors.

This temporarily fixes an issue with building binutils.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 recipes/binutils/binutils.inc |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes/binutils/binutils.inc =
b/recipes/binutils/binutils.inc
index ab9e457..14275db 100644
--- a/recipes/binutils/binutils.inc
+++ b/recipes/binutils/binutils.inc
@@ -41,7 +41,9 @@ S =3D "${WORKDIR}/binutils-${PV}"
 B =3D "${S}/build.${HOST_SYS}.${TARGET_SYS}"
=20
 EXTRA_OECONF =3D "--program-prefix=3D${TARGET_PREFIX} \
-		--enable-shared"
+		--enable-shared \
+		--disable-werror \
+		"
=20
 # This is necessary due to a bug in the binutils Makefiles
 EXTRA_OEMAKE =3D "configure-build-libiberty all"
--=20
1.7.0.4

Step 02.00: Set the PREFERRED_VERSION for specific packages that you =
want to build.

To build using gcc-4.4.1 compiler, edit the local.conf file

#
# Specify the version of gcc that you want to build.
PREFERRED_VERSION_gcc =3D "4.5"
PREFERRED_VERSION_gcc-cross =3D "4.5"
PREFERRED_VERSION_gcc-cross-initial =3D "4.5"
PREFERRED_VERSION_gcc-cross-intermediate =3D "4.5"

#
# Specify the version of binutils that you want to build.
PREFERRED_VERSION_binutils =3D "2.21"
PREFERRED_VERSION_binutils-cross =3D "2.21"

The cross compiler will be located in
${OVEROTOP}/tmp/sysroots/x86_64-linux/usr/armv7a/bin

It is important to specify the correct version of binutils. By default, =
the overo-2011.03 branch defaults to using binutils-2.18.50.0.7, and you =
must explicitly specify using binutils-2.21, in order to get gcc-4.5.x =
to compile properly.

Best regards,

Elvis Dowson





