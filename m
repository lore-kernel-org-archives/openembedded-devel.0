Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 79DBD7579D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jun 2015 17:24:50 +0000 (UTC)
Received: by wgbgq6 with SMTP id gq6so108914745wgb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jun 2015 10:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=vH3i2+gIKekt9kJSnAJBr9haKz6cGQHkNiHsSi5BJ2w=;
	b=pvRiIWaWbEXX6bKQfVUQuTHPFYxsIDyYntTtCw5wHAa6SAlmMIry7GOxtMYEmubObM
	zmCZu+g4exJzyltULVfltCC7DKCSgQU7PETwQ7qVHJpgB465F/1jZAK1xvPiTyhmZHXo
	oCpXAkqLBdPGyWhOCXduNTNd0bo/2evd4GzWsLdWhmOQc1mPatB2z6thVsGtU3HHebtk
	2rMpl4XXxYUDdkzhPYeSky92lcvfN/E9r/rodsQy5D9Prgs6J59Vlhpz5tqXzCan/L5N
	NlFYXfYcyjYUXVkkxyzEaOL9w5zqGULTA9JsYWlcA9D06Ze6/kk3hV7NeigSYHBmUtqZ
	iCGg==
X-Received: by 10.180.91.40 with SMTP id cb8mr252228wib.64.1433784291776;
	Mon, 08 Jun 2015 10:24:51 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	jc17sm2049882wic.13.2015.06.08.10.24.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jun 2015 10:24:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 8 Jun 2015 19:24:56 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150608172456.GE2384@jama>
References: <1433782597-24380-1-git-send-email-raj.khem@gmail.com>
	<20150608170503.GD2384@jama>
	<CAMKF1spH5Fovxv6vp0S2T27GHt0BFqO6Tmm1ig3gJZ4+0M5peg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spH5Fovxv6vp0S2T27GHt0BFqO6Tmm1ig3gJZ4+0M5peg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH 1/2] qtbase: Fix build with musl
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
X-List-Received-Date: Mon, 08 Jun 2015 17:24:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2015 at 01:13:08PM -0400, Khem Raj wrote:
> On Mon, Jun 8, 2015 at 1:05 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Mon, Jun 08, 2015 at 09:56:36AM -0700, Khem Raj wrote:
> >> This is a generic fix to accomodate musl which is adhering to posix
> >> and doesnt have legacy to carry, so lets invert the conditional so the
> >> special legacy case of glibc is checked and else part then covers rest
> >> of cases which are newer glibc/uclibc and musl
> >
> > Can you prepare the patch in:
> > https://github.com/meta-qt5/qtbase/commits/b5.4-shared
> > and generate it with format-patch?
> >
> > This way it's hard to see what's the real change and what's just
> > formating from different diff.
>=20
> you are basically asking for git based workflow for generating patches
> and not do
> quilt based  patch refresh updates ?

yes

> I want to understand the process

If it's too much to ask, I'll just update b5.4* branches in
https://github.com/meta-qt5/qtbase myself before applying this patch,
but basically when I'm upgrading to newer version, I usually want to use
git to just rebase the patches for newer revision (or completely new
branch like now when upgrading from 5.4 to 5.5 and having up2data
patches in qtbase git repository is very useful, when I'm done I just
git format-patch them to refresh .patch files in meta-qt5.

For new meta-qt5 patches it's simple, I can just use git am to add them
in meta-qt5/qtbase, for refreshing patches I need to be more careful not
to forget to do this, before I do next version/revision upgrade.

> > Thanks
> >
> >>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >>  .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  | 43 ++++++++++---=
---------
> >>  1 file changed, 19 insertions(+), 24 deletions(-)
> >>
> >> diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch =
b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> >> index 0f6bcbe..d54079c 100644
> >> --- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> >> +++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
> >> @@ -51,10 +51,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.co=
m>
> >>   create mode 100644 mkspecs/linux-oe-g++/qmake.conf
> >>   create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
> >>
> >> -diff --git a/configure b/configure
> >> -index 6ce6753..0a00d6d 100755
> >> ---- a/configure
> >> -+++ b/configure
> >> +Index: git/configure
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +--- git.orig/configure
> >> ++++ git/configure
> >>  @@ -316,6 +316,16 @@ getQMakeConf()
> >>       getSingleQMakeVariable "$1" "$specvals"
> >>   }
> >> @@ -128,7 +128,7 @@ index 6ce6753..0a00d6d 100755
> >>
> >>   TEST_COMPILER=3D$QMAKE_CONF_COMPILER
> >>
> >> -@@ -3216,7 +3234,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" =3D "no" ]; then
> >> +@@ -3216,7 +3234,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" =3D "no" ]
> >>           exit 1
> >>       fi
> >>   fi
> >> @@ -152,7 +152,7 @@ index 6ce6753..0a00d6d 100755
> >>   # build qmake
> >>   if true; then ###[ '!' -f "$outpath/bin/qmake" ];
> >>       echo "Creating qmake..."
> >> -@@ -3725,14 +3751,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake=
" ];
> >> +@@ -3725,14 +3751,14 @@ if true; then ###[ '!' -f "$outpath/bin/
> >>           fi
> >>
> >>           [ "$CFG_SILENT" =3D "yes" ] && CC_TRANSFORM=3D's,^,\@,' || C=
C_TRANSFORM=3D
> >> @@ -175,10 +175,10 @@ index 6ce6753..0a00d6d 100755
> >>
> >>           if [ "$CFG_RELEASE_QMAKE" =3D "yes" ]; then
> >>               setBootstrapVariable QMAKE_CFLAGS_RELEASE
> >> -diff --git a/mkspecs/features/configure.prf b/mkspecs/features/config=
ure.prf
> >> -index 6b37a04..dcf6025 100644
> >> ---- a/mkspecs/features/configure.prf
> >> -+++ b/mkspecs/features/configure.prf
> >> +Index: git/mkspecs/features/configure.prf
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> +--- git.orig/mkspecs/features/configure.prf
> >> ++++ git/mkspecs/features/configure.prf
> >>  @@ -63,12 +63,12 @@ defineTest(qtCompileTest) {
> >>       }
> >>
> >> @@ -194,11 +194,10 @@ index 6b37a04..dcf6025 100644
> >>               log("yes$$escape_expand(\\n)")
> >>               msg =3D "test $$1 succeeded"
> >>               write_file($$QMAKE_CONFIG_LOG, msg, append)
> >> -diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/q=
make.conf
> >> -new file mode 100644
> >> -index 0000000..2ad2810
> >> +Index: git/mkspecs/linux-oe-g++/qmake.conf
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>  --- /dev/null
> >> -+++ b/mkspecs/linux-oe-g++/qmake.conf
> >> ++++ git/mkspecs/linux-oe-g++/qmake.conf
> >>  @@ -0,0 +1,40 @@
> >>  +#
> >>  +# qmake configuration for linux-g++ with modifications for building =
with OpenEmbedded
> >> @@ -240,11 +239,10 @@ index 0000000..2ad2810
> >>  +isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG =3D $(OE_QMAKE_QT_CONFIG)
> >>  +
> >>  +load(qt_config)
> >> -diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-=
g++/qplatformdefs.h
> >> -new file mode 100644
> >> -index 0000000..dd12003
> >> +Index: git/mkspecs/linux-oe-g++/qplatformdefs.h
> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>  --- /dev/null
> >> -+++ b/mkspecs/linux-oe-g++/qplatformdefs.h
> >> ++++ git/mkspecs/linux-oe-g++/qplatformdefs.h
> >>  @@ -0,0 +1,100 @@
> >>  +/*******************************************************************=
*********
> >>  +**
> >> @@ -334,10 +332,10 @@ index 0000000..dd12003
> >>  +
> >>  +#undef QT_SOCKLEN_T
> >>  +
> >> -+#if defined(__GLIBC__) && (__GLIBC__ >=3D 2)
> >> -+#define QT_SOCKLEN_T            socklen_t
> >> -+#else
> >> ++#if defined(__GLIBC__) && (__GLIBC__ < 2)
> >>  +#define QT_SOCKLEN_T            int
> >> ++#else
> >> ++#define QT_SOCKLEN_T            socklen_t
> >>  +#endif
> >>  +
> >>  +#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >=3D 500)
> >> @@ -346,6 +344,3 @@ index 0000000..dd12003
> >>  +#endif
> >>  +
> >>  +#endif // QPLATFORMDEFS_H
> >> ---
> >> -2.4.2
> >> -
> >> --
> >> 2.1.4
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

