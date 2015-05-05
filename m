Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id CDA356AC3E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 13:42:44 +0000 (UTC)
Received: by wief7 with SMTP id f7so101555111wie.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 May 2015 06:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=lABQu2M6tiUd8w/WGf9XM00tk9sALjNjSpbNaG9cocQ=;
	b=lHd6HJ81dgzM6fcB5H5iGVbJA50cF/tG8m4EHrXb9pFBFTNCI6As/uG0EWdn6VJXqE
	Gz5Q4uaV7hXcsr0e7tQFW0G94pZ5baXpvjSDfoEMHL1BThIESSVrNO56DXSMw+FZ7w3C
	TODUDRvYThmKjVMuICPV53CVvHRB1xWfepBmDAfSfkU24nIs8xi7sQ5YOykZij3W83rT
	PIihkEFdSqxhoTPlPW9btceg7F4pGQl8OircjuAsG3ufgLLzkNO40f87xVxkXIvUSE0U
	+g8JUjV0NMEoxDAkn/aB5nwCgVpTUWs33otb+zWL1OAP8KloNYEx7JfRomMqZo8frZpI
	pxbA==
X-Received: by 10.194.77.180 with SMTP id t20mr52533921wjw.115.1430833365435; 
	Tue, 05 May 2015 06:42:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	wr2sm25644809wjb.45.2015.05.05.06.42.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 May 2015 06:42:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 5 May 2015 15:42:49 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150505134249.GC2378@jama>
References: <1430191635-13438-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1430191635-13438-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH][meta-oe] dialog: upgrade to 1.2-20150225
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 May 2015 13:42:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2015 at 11:27:15AM +0800, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>=20
> 1. upgrade it to 1.2-20150225
> 2. update the use-pkg-config-for-ncurses-detection.patch, use it only for
> dialog
> 3. dialog-static uses use-pkg-config-for-static-ncurses-detection.patch
> which outputs libraries suitable for static linking

Any idea why normal dialog now builds static library and tries to stage
it and fails?

ERROR: The recipe dialog is trying to install files into a shared area when=
 those files already exist. Those files and their manifest location are:
   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm/usr/lib/libdi=
alog.a
 Matched in manifest-qemuarm-dialog-static.populate_sysroot

>=20
> The difference between with --static and without --static is below:
>    $pkg-config --libs "ncurse"
>     -L${SYSROOT}/usr/lib64 -lncurses
>    $pkg-config --static --libs "ncurse"
>     -L${SYSROOT}/usr/lib64 -lncurses -ltinfo
>    $
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../dialog/dialog-static_1.1-20120706.bb           |  6 ----
>  .../dialog/dialog-static_1.2-20150225.bb           |  6 ++++
>  meta-oe/recipes-extended/dialog/dialog.inc         |  1 -
>  .../recipes-extended/dialog/dialog_1.1-20120706.bb |  4 ---
>  .../recipes-extended/dialog/dialog_1.2-20150225.bb |  6 ++++
>  .../use-pkg-config-for-ncurses-detection.patch     | 28 +++++++---------=
---
>  ...e-pkg-config-for-static-ncurses-detection.patch | 32 ++++++++++++++++=
++++++
>  7 files changed, 54 insertions(+), 29 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/dialog/dialog-static_1.1-201=
20706.bb
>  create mode 100644 meta-oe/recipes-extended/dialog/dialog-static_1.2-201=
50225.bb
>  delete mode 100644 meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
>  create mode 100644 meta-oe/recipes-extended/dialog/dialog_1.2-20150225.bb
>  create mode 100644 meta-oe/recipes-extended/dialog/files/use-pkg-config-=
for-static-ncurses-detection.patch
>=20
> diff --git a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.b=
b b/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
> deleted file mode 100644
> index 595f323..0000000
> --- a/meta-oe/recipes-extended/dialog/dialog-static_1.1-20120706.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require dialog.inc
> -
> -LDFLAGS +=3D "-static"
> -
> -SRC_URI[md5sum] =3D "2e538305977178eb085a9859511c299d"
> -SRC_URI[sha256sum] =3D "305aa1000680aa87bb2148a725f9107ef4cd29dcd6185b44=
d079cb87cf0ce2f5"
> diff --git a/meta-oe/recipes-extended/dialog/dialog-static_1.2-20150225.b=
b b/meta-oe/recipes-extended/dialog/dialog-static_1.2-20150225.bb
> new file mode 100644
> index 0000000..77d8841
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dialog/dialog-static_1.2-20150225.bb
> @@ -0,0 +1,6 @@
> +require dialog.inc
> +
> +LDFLAGS +=3D "-static"
> +SRC_URI +=3D"file://use-pkg-config-for-static-ncurses-detection.patch"
> +SRC_URI[md5sum] =3D "38ef59a7daa5459119cb06777c735e4b"
> +SRC_URI[sha256sum] =3D "6844b13a7a1fea568a8d5bb3004e1af90888cd4a5e8c2ded=
2c38f34fcc7397ff"
> diff --git a/meta-oe/recipes-extended/dialog/dialog.inc b/meta-oe/recipes=
-extended/dialog/dialog.inc
> index 995d6c0..1a6e8c5 100644
> --- a/meta-oe/recipes-extended/dialog/dialog.inc
> +++ b/meta-oe/recipes-extended/dialog/dialog.inc
> @@ -9,7 +9,6 @@ LICENSE =3D "LGPL-2.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37=
343"
> =20
>  SRC_URI =3D "ftp://invisible-island.net/dialog/dialog-${PV}.tgz \
> -           file://use-pkg-config-for-ncurses-detection.patch \

Why not keep it here and only add --static parameter to pkg-config call in =
followup patch applied only in dialog-static?

>            "
> =20
>  # hardcoded here for use in dialog-static recipe
> diff --git a/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb b/met=
a-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
> deleted file mode 100644
> index c87fb61..0000000
> --- a/meta-oe/recipes-extended/dialog/dialog_1.1-20120706.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -require dialog.inc
> -
> -SRC_URI[md5sum] =3D "2e538305977178eb085a9859511c299d"
> -SRC_URI[sha256sum] =3D "305aa1000680aa87bb2148a725f9107ef4cd29dcd6185b44=
d079cb87cf0ce2f5"
> diff --git a/meta-oe/recipes-extended/dialog/dialog_1.2-20150225.bb b/met=
a-oe/recipes-extended/dialog/dialog_1.2-20150225.bb
> new file mode 100644
> index 0000000..477be73
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dialog/dialog_1.2-20150225.bb
> @@ -0,0 +1,6 @@
> +require dialog.inc
> +
> +SRC_URI +=3D"file://use-pkg-config-for-ncurses-detection.patch"
> +
> +SRC_URI[md5sum] =3D "38ef59a7daa5459119cb06777c735e4b"
> +SRC_URI[sha256sum] =3D "6844b13a7a1fea568a8d5bb3004e1af90888cd4a5e8c2ded=
2c38f34fcc7397ff"
> diff --git a/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncu=
rses-detection.patch b/meta-oe/recipes-extended/dialog/files/use-pkg-config=
-for-ncurses-detection.patch
> index a2354ad..0a25a7f 100644
> --- a/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-de=
tection.patch
> +++ b/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-ncurses-de=
tection.patch
> @@ -8,33 +8,25 @@ file, and autoconf can not work, make a workaround in c=
onfigure file.
> =20
>  Signed-off-by: Roy Li <rongqing.li@windriver.com>
>  ---
> - configure |    6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> + configure | 5 ++---
> + 1 file changed, 2 insertions(+), 3 deletions(-)
> =20
>  diff --git a/configure b/configure
> -index 24e28c1..c78735d 100755
> +index 8afe3d7..a54bcc1 100755
>  --- a/configure
>  +++ b/configure
> -@@ -9976,8 +9976,8 @@ fi
> +@@ -11567,9 +11567,8 @@ fi
>  =20
>   if test "$NCURSES_CONFIG" !=3D none ; then
>  =20
>  -CPPFLAGS=3D"$CPPFLAGS `$NCURSES_CONFIG --cflags`"
> --LIBS=3D"`$NCURSES_CONFIG --libs` $LIBS"
> +-
> +-cf_add_libs=3D"`$NCURSES_CONFIG --libs`"
>  +CPPFLAGS=3D"$CPPFLAGS `pkg-config --short-errors --print-errors --cflag=
s "ncurses" 2>/dev/null`"
> -+LIBS=3D"`pkg-config --short-errors --print-errors --libs "ncurses" 2>/d=
ev/null` $LIBS"
> -=20
> - # even with config script, some packages use no-override for curses.h
> -=20
> -@@ -10096,7 +10096,7 @@ cat >>confdefs.h <<EOF
> - #define $cf_nculib_ROOT 1
> - EOF
> -=20
> --cf_cv_ncurses_version=3D`$NCURSES_CONFIG --version`
> -+cf_cv_ncurses_version=3D`pkg-config --short-errors --print-errors --mod=
version "ncurses"`
> -=20
> - else
> -=20
> ++cf_add_libs=3D"`pkg-config --short-errors --print-errors --libs "ncurse=
s" 2>/dev/null` $LIBS"
> + # Filter out duplicates - this happens with badly-designed ".pc" files.=
=2E.
> + for cf_add_1lib in $LIBS
> + do
>  --=20
>  1.7.10.4
> =20
> diff --git a/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-sta=
tic-ncurses-detection.patch b/meta-oe/recipes-extended/dialog/files/use-pkg=
-config-for-static-ncurses-detection.patch
> new file mode 100644
> index 0000000..3ed174c
> --- /dev/null
> +++ b/meta-oe/recipes-extended/dialog/files/use-pkg-config-for-static-ncu=
rses-detection.patch
> @@ -0,0 +1,32 @@
> +Subject: [PATCH] use pkg-config for ncurses detection.
> +
> +Upstream-Status: Inappropriate [configuration]
> +
> +This is a workaround to make dialog be able to build after ncurses-config
> +does not work, since the configure file is called directly in dialog bb
> +file, and autoconf can not work, make a workaround in configure file.
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + configure | 5 ++---
> + 1 file changed, 2 insertions(+), 3 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 8afe3d7..a54bcc1 100755
> +--- a/configure
> ++++ b/configure
> +@@ -11567,9 +11567,8 @@ fi
> +=20
> + if test "$NCURSES_CONFIG" !=3D none ; then
> +=20
> +-CPPFLAGS=3D"$CPPFLAGS `$NCURSES_CONFIG --cflags`"
> +-
> +-cf_add_libs=3D"`$NCURSES_CONFIG --libs`"
> ++CPPFLAGS=3D"$CPPFLAGS `pkg-config --short-errors --print-errors --cflag=
s "ncurses" 2>/dev/null`"
> ++cf_add_libs=3D"`pkg-config --short-errors --print-errors --static --lib=
s "ncurses" 2>/dev/null` $LIBS"
> + # Filter out duplicates - this happens with badly-designed ".pc" files.=
=2E.
> + for cf_add_1lib in $LIBS
> + do
> +--=20
> +1.7.10.4
> +
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

