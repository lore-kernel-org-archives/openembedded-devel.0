Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6B877E44
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Jul 2017 02:47:15 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2017 19:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; 
	d="scan'208,217";a="125446922"
Received: from scdalrym-mobl1.amr.corp.intel.com ([10.254.189.219])
	by fmsmga005.fm.intel.com with ESMTP; 11 Jul 2017 19:47:15 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
Message-Id: <5AFCBA1A-8712-4230-83AD-B80B5AC4A086@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Tue, 11 Jul 2017 19:47:14 -0700
In-Reply-To: <CALatG=7O0bTra4a6OcidOVeRG3HMFhKY4YY8eahQkYwoeW3F0g@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
References: <1499791478-2407-1-git-send-email-liu.ming50@gmail.com>
	<1499791478-2407-2-git-send-email-liu.ming50@gmail.com>
	<C483BBAB-ADAB-4944-8339-192A9A934C65@linux.intel.com>
	<CALatG=7O0bTra4a6OcidOVeRG3HMFhKY4YY8eahQkYwoeW3F0g@mail.gmail.com>
X-Mailer: Apple Mail (2.3273)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe/meta-perl] [PATCH 1/8] libsombok3: add recipe
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
X-List-Received-Date: Wed, 12 Jul 2017 02:47:16 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Jul 11, 2017, at 7:08 PM, Ming Liu <liu.ming50@gmail.com> wrote:
>=20
> Hi, Tim:
>=20
> Are you sure about that? libsombok3 is actually not a perl module, it =
has the same name "libsombok3" on debian/ubuntu distributions.
>=20

I reviewed too quickly and did not notice this was being targeted for =
meta-oe/recipes-devtools

Regards,
Tim
> the best,
> thank you
>=20
> 2017-07-12 0:32 GMT+02:00 Tim Orling <timothy.t.orling@linux.intel.com =
<mailto:timothy.t.orling@linux.intel.com>>:
>=20
> > On Jul 11, 2017, at 9:44 AM, liu.ming50@gmail.com =
<mailto:liu.ming50@gmail.com> wrote:
> >
> > From: Ming Liu <peter.x.liu@external.atlascopco.com =
<mailto:peter.x.liu@external.atlascopco.com>>
> >
> > Sombok - Unicode Text Segmentation Package.
> >
> > It's being depended by libunicode-linebreak-perl.
> >
> > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com =
<mailto:peter.x.liu@external.atlascopco.com>>
> > ---
> > ...01-configure.ac-fix-cross-compiling-issue.patch | 31 =
++++++++++++++++++++++
> > .../libsombok3/libsombok3_2.4.0.bb <http://libsombok3_2.4.0.bb/>     =
            | 25 +++++++++++++++++
> > 2 files changed, 56 insertions(+)
> > create mode 100644 =
meta-oe/recipes-devtools/libsombok3/libsombok3/0001-configure.ac-fix-cross=
-compiling-issue.patch
> > create mode 100644 =
meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb =
<http://libsombok3_2.4.0.bb/>
>=20
> This is not following Debian naming, it should be =
libsombok3-perl_2.4.0.bb <http://libsombok3-perl_2.4.0.bb/>
>=20
> >
> > diff --git =
a/meta-oe/recipes-devtools/libsombok3/libsombok3/0001-configure.ac-fix-cro=
ss-compiling-issue.patch =
b/meta-oe/recipes-devtools/libsombok3/libsombok3/0001-configure.ac-fix-cro=
ss-compiling-issue.patch
> > new file mode 100644
> > index 0000000..1a69287
> > --- /dev/null
> > +++ =
b/meta-oe/recipes-devtools/libsombok3/libsombok3/0001-configure.ac-fix-cro=
ss-compiling-issue.patch
> > @@ -0,0 +1,31 @@
> > +=46rom 9c2ffe825e28d63e2a771135f297e8ffac0dbe81 Mon Sep 17 00:00:00 =
2001
> > +From: Ming Liu <liu.ming50@gmail.com <mailto:liu.ming50@gmail.com>>
> > +Date: Tue, 11 Jul 2017 14:35:30 +0200
> > +Subject: [PATCH] configure.ac <http://configure.ac/>: fix =
cross-compiling issue
> > +
> > +Avoid checking for file existence when cross compiling.
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
> > +
> > +Signed-off-by: Ming Liu <liu.ming50@gmail.com =
<mailto:liu.ming50@gmail.com>>
> > +---
> > + configure.ac <http://configure.ac/> | 3 ---
> > + 1 file changed, 3 deletions(-)
> > +
> > +diff --git a/configure.ac <http://configure.ac/> b/configure.ac =
<http://configure.ac/>
> > +index 9978852..06b16e3 100644
> > +--- a/configure.ac <http://configure.ac/>
> > ++++ b/configure.ac <http://configure.ac/>
> > +@@ -120,9 +120,6 @@ AC_ARG_WITH(unicode-version,
> > +   AC_HELP_STRING(--with-unicode-version=3DVERSION,
> > +   [version of Unicode Standard @<:@default=3Dcurrent =
version@:>@]),
> > +   =
UNICODE_VERSION=3D$withval,UNICODE_VERSION=3D$DEFAULT_UNICODE_VERSION)
> > +-AC_CHECK_FILE([lib/$UNICODE_VERSION.c],
> > +-  AC_MSG_RESULT($UNICODE_VERSION),
> > +-  AC_MSG_ERROR(Unknown Unicode version $UNICODE_VERSION.))
> > + AC_SUBST(UNICODE_VERSION)
> > +
> > + # check if code to debug memory allocation is enabled.
> > +--
> > +2.7.4
> > +
> > diff --git a/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb =
<http://libsombok3_2.4.0.bb/> =
b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb =
<http://libsombok3_2.4.0.bb/>
> > new file mode 100644
> > index 0000000..b83e86a
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/libsombok3/libsombok3_2.4.0.bb =
<http://libsombok3_2.4.0.bb/>
>=20
> > @@ -0,0 +1,25 @@
> > +SUMMARY =3D "Sombok - Unicode Text Segmentation Package."
> > +DESCRIPTION =3D "Sombok library package performs Line Breaking =
Algorithm described in \
> > +Unicode Standard Annex #14 (UAX #14).  East_Asian_Width informative =
\
> > +properties defined by Annex #11 (UAX #11) may be concerned to =
determin \
> > +breaking positions.  This package also implements "default" =
Grapheme \
> > +Cluster segmentation described in Annex #29 (UAX #29)."
> > +LICENSE =3D "Artistic-1.0 | GPLv1+"
> > +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D5b122a36d0f6dc55279a0ebc69f3c60b"
> > +
> > +SRC_URI =3D =
"git://github.com/hatukanezumi/sombok.git;protocol=3Dhttps =
<http://github.com/hatukanezumi/sombok.git;protocol=3Dhttps> \
> > +           file://0001-configure.ac-fix-cross-compiling-issue.patch =
\
> > +          "
> > +
> > +inherit autotools pkgconfig
> > +
> > +# sombok-2.4.0
> > +SRCREV =3D "0098d85a037ef5c99a648a3669a077781a45e8cc"
> > +
> > +S =3D "${WORKDIR}/git"
> > +B =3D "${S}"
> > +
> > +# Disable libthai support
> > +EXTRA_OECONF =3D "--disable-libthai"
> > +
> > +BBCLASSEXTEND =3D "native"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org =
<mailto:Openembedded-devel@lists.openembedded.org>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel =
<http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>=20
>=20


