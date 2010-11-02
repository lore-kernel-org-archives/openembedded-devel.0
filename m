Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDAWS-00027v-6M
	for openembedded-devel@lists.openembedded.org;
	Tue, 02 Nov 2010 07:39:10 +0100
Received: by iwn42 with SMTP id 42so7647635iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 23:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=29aHCog5mJZMX7g4U3GOmOd5b8JBbGITuwdhfQx3Dcs=;
	b=UtBAK9H2L+VpBBZ44I27MVc3O/eZHsDst4pDIlOmRzkU7F09XfLej1AZ+zFzxs+5zD
	EifPwRK059yPMZpketmrJUUzDm/Yr+Q7R1Uoo1RXt1Pg8kffgdXa84tSYS/qPAA/hPZ9
	Lc9CyKetCy2PVWpA80kjL9iFPgf7UI1PZ2yzU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=fhD2sMcZRdfnxoqf2OCHcyQe+EJjdwSwA5HqBoR3rIRoqsl/lDJkBYwQ04GRredYYM
	K6rX3Q9L2FPCSZkoL9JIjKhfgooFf3a+igIauO5l92mGtecQLF8m2jxihdkX1rt7x6gl
	FgFJO/gAVMq6uK1IJkLBKba7EKPXmRAA3M3gU=
MIME-Version: 1.0
Received: by 10.231.17.203 with SMTP id t11mr6267534iba.1.1288679898881; Mon,
	01 Nov 2010 23:38:18 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Mon, 1 Nov 2010 23:38:18 -0700 (PDT)
In-Reply-To: <4CCF64DD.9080709@gmail.com>
References: <4CCF64DD.9080709@gmail.com>
Date: Tue, 2 Nov 2010 07:38:18 +0100
Message-ID: <AANLkTin5-JTEH=Zk__6MWxY53t_WYufSX4x+w6sonE7t@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gphoto2_2.4.8.bb: Stop configure from looking in /usr/local/include
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
X-List-Received-Date: Tue, 02 Nov 2010 06:39:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/2 Graham Gower <graham.gower@gmail.com>:
> =A0* Point configure at where it can find jpeg.
> =A0* Explicitly disable cdk and aalib.
> =A0* Fix license while here.
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
> =A0recipes/gphoto2/gphoto2_2.4.8.bb | =A0 =A09 +++++++--
> =A01 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/gphoto2/gphoto2_2.4.8.bb b/recipes/gphoto2/gphoto2_2=
.4.8.bb
> index ea54713..836ea85 100644
> --- a/recipes/gphoto2/gphoto2_2.4.8.bb
> +++ b/recipes/gphoto2/gphoto2_2.4.8.bb
> @@ -1,7 +1,8 @@
> =A0DESCRIPTION =3D "gphoto2 is a command-line utility to fetch pictures f=
rom digital cameras"
> =A0SECTION =3D "console/utils"
> -LICENSE =3D "GPL"
> -DEPENDS =3D "libtool libgphoto2 popt"
> +LICENSE =3D "GPLv2+"
> +DEPENDS =3D "libtool libgphoto2 popt jpeg"

The original recipe would build without the depends on jpeg
adding it to depends should be mentioned in the commit message

> +PR =3D "r1"
>
> =A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/gphoto/gphoto2-${PV}.tar.bz2;name=
=3Dgphoto2 \
> =A0 =A0 =A0 =A0 =A0 =A0file://gphoto-popt-fixup.patch"
> @@ -11,6 +12,10 @@ SRC_URI[gphoto2.sha256sum] =3D "a2e2f70fd6051234cbc3d7=
6dc82df6991e8a07ead56aa8d5c4
>
> =A0inherit autotools
>
> +EXTRA_OECONF=3D"--without-cdk \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 --without-aalib \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 --with-jpeg-prefix=3D${STAGING_EXECPREFIXDI=
R}"
> +

I have some concerns here.
For configure it seems best to explicitly set and reset the flags in
it, otherwise you may just pick up whatever happened to be build
before.

from --help:

Optional Features:
  --disable-option-checking  ignore unrecognized --enable/--with options
  --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=
=3Dno)
  --enable-FEATURE[=3DARG]  include FEATURE [ARG=3Dyes]
  --disable-dependency-tracking  speeds up one-time build
  --enable-dependency-tracking   do not reject slow dependency extractors
  --enable-shared[=3DPKGS]  build shared libraries [default=3Dyes]
  --enable-static[=3DPKGS]  build static libraries [default=3Dyes]
  --enable-fast-install[=3DPKGS]
                          optimize for fast installation [default=3Dyes]
  --disable-libtool-lock  avoid locking (might break parallel builds)
  --disable-largefile     omit support for large files
  --disable-nls           do not use Native Language Support
  --disable-rpath         do not hardcode runtime library paths

Optional Packages:
  --with-PACKAGE[=3DARG]    use PACKAGE [ARG=3Dyes]
  --without-PACKAGE       do not use PACKAGE (same as --with-PACKAGE=3Dno)
  --with-pic              try to use only PIC/non-PIC objects [default=3Dus=
e
                          both]
  --with-gnu-ld           assume the C compiler uses GNU ld [default=3Dno]
  --with-gnu-ld           assume the C compiler uses GNU ld default=3Dno
  --with-libiconv-prefix[=3DDIR]  search for libiconv in DIR/include and DI=
R/lib
  --without-libiconv-prefix     don't search for libiconv in
includedir and libdir
  --with-libintl-prefix[=3DDIR]  search for libintl in DIR/include and DIR/=
lib
  --without-libintl-prefix     don't search for libintl in includedir and l=
ibdir
  --with-libgphoto2=3DPREFIX
                          where to find libgphoto2, "no" or "auto"
  --without-pthread         Don't use pthread
  --without-cdk           Do not use cdk
  --with-cdk-prefix=3DPREFIX
                          Location of cdk
  --without-jpeg          Do not use jpeg
  --with-jpeg-prefix=3DPREFIX
                          Location of jpeg
  --with-libexif=3DPREFIX   where to find libexif, "no" or "auto"
  --without-aalib         Do not use aalib
  --without-readline      Do not use readline

All things that are not mentioned in DEPENDS should (IMHO) be
explicitly be turned off.
And for the things in DEPENDS I would encourage to still add them.
E.g. --with-jpeg. Yes I know these will always be picked up when a
DEPENDS =3D "jpeg" is present, but making it explict does not hurt and
it trips an error if jpeg is not there and someone does a bitbake -b
of the recipe (instead of silently building a package without jpeg).

Thanks for your contribution & apologies for using your commit for a
rant on configure flags.

Frans.

> =A0do_configure_append() {
> =A0 =A0 =A0 =A0 find ${S} -name Makefile | xargs sed -i 's:/usr/include:$=
{STAGING_INCDIR}:'
> =A0}
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


