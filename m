Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PW9JX-0001mZ-8A
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 16:12:15 +0100
Received: by ywi6 with SMTP id 6so3213039ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Dec 2010 07:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=drhlODCDJJstTjI2W8iry0vvk+EGzfIquirZJrNQr4w=;
	b=o8GFaCOo1Hp2lz51VC4TfPBcdaDwhZKTvTalCUQGumTYme0x6/t7D5hBWHozfBxIZ/
	EYyxt6oi+VLMqrvGUYmiQYqjRSxdhGFcGxeFWzmxXG3Evwu6FJAhb36Y/CtnLFb3Ni8x
	sdN4JjYmnSJHWBCs62MERB18xO3NIUj92LWbM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=NVyZh0Thp+VggzVHMDs2HIBbyZQBqhiI7OZXM2IoMcW2jaUgSzzh/72R/srq6YjZch
	DGiJ52AP+ZSG+rBcahdJLsZqjjNPeq8nGsMpmNPIav1cnYWaAz2rn9MQ08thprjsXJ9b
	Z2WsfUrp2wt3ML1yqauT9U49whsET3B8LqvJc=
Received: by 10.90.97.19 with SMTP id u19mr892177agb.166.1293203524778; Fri,
	24 Dec 2010 07:12:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Fri, 24 Dec 2010 07:11:44 -0800 (PST)
In-Reply-To: <1293177781-29292-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1293177781-29292-1-git-send-email-fransmeulenbroeks@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Dec 2010 07:11:44 -0800
Message-ID: <AANLkTi=VA+Q8msrkPGvzjXOBPn4m9nzLhrJ8D9NweZav@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] changed rm into rm -f to remove old libtool stuff
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
X-List-Received-Date: Fri, 24 Dec 2010 15:12:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 24, 2010 at 12:03 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> this keeps things working even if the files are not there
> (e.g. because configure is ran twice)
>
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com


> ---
> =C2=A0recipes/lesstif/lesstif_0.95.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/lftp/lftp_4.0.5.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/libfribidi/libfribidi_0.10.4.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A06 +++---
> =C2=A0recipes/libgee/libgee.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/rxtx/rxtx_2.1-7r2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/rxvt-unicode/rxvt-unicode_4.8.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/rxvt-unicode/rxvt-unicode_4.9.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/rxvt-unicode/rxvt-unicode_5.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/rxvt-unicode/rxvt-unicode_5.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/rxvt-unicode/rxvt-unicode_5.4.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/rxvt-unicode/rxvt-unicode_5.6.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/rxvt-unicode/rxvt-unicode_cvs.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/rxvt/rxvt_2.7.9.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/rxvt/rxvt_2.8.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A0recipes/util-linux-ng/util-linux-ng.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/xmms/xmms_1.2.10.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0.../xorg-driver/xf86-video-openchrome_0.2.904.bb =C2=A0 | =C2=A0 =
=C2=A02 +-
> =C2=A017 files changed, 19 insertions(+), 19 deletions(-)
>
> diff --git a/recipes/lesstif/lesstif_0.95.0.bb b/recipes/lesstif/lesstif_=
0.95.0.bb
> index 065bc97..407658a 100644
> --- a/recipes/lesstif/lesstif_0.95.0.bb
> +++ b/recipes/lesstif/lesstif_0.95.0.bb
> @@ -29,7 +29,7 @@ do_preconfigure() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ac_find_xft.m4 m4/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mv acinclude.m4 m4/
>
> - =C2=A0 =C2=A0 =C2=A0 rm aclocal.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f aclocal.m4
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e "s|LT_HAVE_FREETYPE|HAVEFREETYPE|" m=
4/acinclude.m4
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e "s|LT_HAVE_XRENDER|HAVEXRENDER|" m4/=
acinclude.m4
> diff --git a/recipes/lftp/lftp_4.0.5.bb b/recipes/lftp/lftp_4.0.5.bb
> index 11f181e..61e12bb 100644
> --- a/recipes/lftp/lftp_4.0.5.bb
> +++ b/recipes/lftp/lftp_4.0.5.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "http://ftp.yars.free.net/pub/source/lftp/l=
ftp-${PV}.tar.bz2;name=3Du1"
> =C2=A0EXTRA_OECONF =3D "--disable-largefile --disable-rpath --with-includ=
ed-readline=3Dno"
>
> =C2=A0do_configure_prepend () {
> - =C2=A0 =C2=A0rm ${S}/m4/iconv.m4
> + =C2=A0 =C2=A0rm -f ${S}/m4/iconv.m4
> =C2=A0}
>
> =C2=A0inherit autotools gettext
> diff --git a/recipes/libfribidi/libfribidi_0.10.4.bb b/recipes/libfribidi=
/libfribidi_0.10.4.bb
> index b83c484..cf93cab 100644
> --- a/recipes/libfribidi/libfribidi_0.10.4.bb
> +++ b/recipes/libfribidi/libfribidi_0.10.4.bb
> @@ -14,7 +14,7 @@ inherit autotools lib_package binconfig pkgconfig
>
> =C2=A0do_configure_prepend () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 # this version of libtool is old - we have to=
 nobble this file to get it to litoolize
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0rm ltconfig
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0rm aclocal.m4
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0rm acinclude.m4
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ltconfig
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f aclocal.m4
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f acinclude.m4
> =C2=A0}
> diff --git a/recipes/libgee/libgee.inc b/recipes/libgee/libgee.inc
> index 3b8d792..87220ca 100644
> --- a/recipes/libgee/libgee.inc
> +++ b/recipes/libgee/libgee.inc
> @@ -12,6 +12,6 @@ inherit autotools vala
> =C2=A0do_configure_prepend() {
> =C2=A0 =C2=A0 =C2=A0MACROS=3D"libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsu=
gar.m4 ltversion.m4"
> =C2=A0 =C2=A0 =C2=A0 for i in ${MACROS}; do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm m4/$i
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f m4/$i
> =C2=A0 =C2=A0 =C2=A0 done
> =C2=A0}
> diff --git a/recipes/rxtx/rxtx_2.1-7r2.bb b/recipes/rxtx/rxtx_2.1-7r2.bb
> index d2e78b1..c4944f6 100644
> --- a/recipes/rxtx/rxtx_2.1-7r2.bb
> +++ b/recipes/rxtx/rxtx_2.1-7r2.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "\
> =C2=A0 =C2=A0 "
>
> =C2=A0do_removebinaries_append() {
> - =C2=A0 =C2=A0 =C2=A0 rm acinclude.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f acinclude.m4
> =C2=A0}
>
> =C2=A0do_compile() {
> diff --git a/recipes/rxvt-unicode/rxvt-unicode_4.8.bb b/recipes/rxvt-unic=
ode/rxvt-unicode_4.8.bb
> index b246c56..bf4e1cd 100644
> --- a/recipes/rxvt-unicode/rxvt-unicode_4.8.bb
> +++ b/recipes/rxvt-unicode/rxvt-unicode_4.8.bb
> @@ -35,7 +35,7 @@ EXTRA_OEMAKE =3D "'XINC=3D-I${STAGING_INCDIR}' \
>
> =C2=A0do_configure () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mv autoconf/configure.in . || true
> - =C2=A0 =C2=A0 =C2=A0 rm autoconf/libtool.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f autoconf/libtool.m4
> =C2=A0 =C2=A0 =C2=A0 =C2=A0libtoolize --force
> =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo '#define RXVT_UTMP_FILE "${localstatedir}=
/run/utmp"' >> config.h
> diff --git a/recipes/rxvt-unicode/rxvt-unicode_4.9.bb b/recipes/rxvt-unic=
ode/rxvt-unicode_4.9.bb
> index bad8222..018514e 100644
> --- a/recipes/rxvt-unicode/rxvt-unicode_4.9.bb
> +++ b/recipes/rxvt-unicode/rxvt-unicode_4.9.bb
> @@ -34,7 +34,7 @@ EXTRA_OEMAKE =3D "'XINC=3D-I${STAGING_INCDIR}' \
>
> =C2=A0do_configure () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mv autoconf/configure.in . || true
> - =C2=A0 =C2=A0 =C2=A0 rm autoconf/libtool.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f autoconf/libtool.m4
> =C2=A0 =C2=A0 =C2=A0 =C2=A0libtoolize --force
> =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo '#define RXVT_UTMP_FILE "${localstatedir}=
/run/utmp"' >> config.h
> diff --git a/recipes/rxvt-unicode/rxvt-unicode_5.2.bb b/recipes/rxvt-unic=
ode/rxvt-unicode_5.2.bb
> index d125d37..518dafd 100644
> --- a/recipes/rxvt-unicode/rxvt-unicode_5.2.bb
> +++ b/recipes/rxvt-unicode/rxvt-unicode_5.2.bb
> @@ -36,7 +36,7 @@ EXTRA_OEMAKE =3D "'XINC=3D-I${STAGING_INCDIR}' \
>
> =C2=A0do_configure () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mv autoconf/configure.in . || true
> - =C2=A0 =C2=A0 =C2=A0 rm autoconf/libtool.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f autoconf/libtool.m4
> =C2=A0 =C2=A0 =C2=A0 =C2=A0libtoolize --force
> =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo '#define RXVT_UTMP_FILE "${localstatedir}=
/run/utmp"' >> config.h
> diff --git a/recipes/rxvt-unicode/rxvt-unicode_5.3.bb b/recipes/rxvt-unic=
ode/rxvt-unicode_5.3.bb
> index 7164e1c..ee09e6f 100644
> --- a/recipes/rxvt-unicode/rxvt-unicode_5.3.bb
> +++ b/recipes/rxvt-unicode/rxvt-unicode_5.3.bb
> @@ -35,7 +35,7 @@ EXTRA_OEMAKE =3D "'XINC=3D-I${STAGING_INCDIR}' \
>
> =C2=A0do_configure () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mv autoconf/configure.in . || true
> - =C2=A0 =C2=A0 =C2=A0 rm autoconf/libtool.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f autoconf/libtool.m4
> =C2=A0 =C2=A0 =C2=A0 =C2=A0libtoolize --force
> =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo '#define RXVT_UTMP_FILE "${localstatedir}=
/run/utmp"' >> config.h
> diff --git a/recipes/rxvt-unicode/rxvt-unicode_5.4.bb b/recipes/rxvt-unic=
ode/rxvt-unicode_5.4.bb
> index 6c15eb1..f68a511 100644
> --- a/recipes/rxvt-unicode/rxvt-unicode_5.4.bb
> +++ b/recipes/rxvt-unicode/rxvt-unicode_5.4.bb
> @@ -35,7 +35,7 @@ EXTRA_OEMAKE =3D "'XINC=3D-I${STAGING_INCDIR}' \
>
> =C2=A0do_configure () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mv autoconf/configure.in . || true
> - =C2=A0 =C2=A0 =C2=A0 rm autoconf/libtool.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f autoconf/libtool.m4
> =C2=A0 =C2=A0 =C2=A0 =C2=A0libtoolize --force
> =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo '#define RXVT_UTMP_FILE "${localstatedir}=
/run/utmp"' >> config.h
> diff --git a/recipes/rxvt-unicode/rxvt-unicode_5.6.bb b/recipes/rxvt-unic=
ode/rxvt-unicode_5.6.bb
> index 5b9c3da..8039ea1 100644
> --- a/recipes/rxvt-unicode/rxvt-unicode_5.6.bb
> +++ b/recipes/rxvt-unicode/rxvt-unicode_5.6.bb
> @@ -39,7 +39,7 @@ EXTRA_OEMAKE =3D "'XINC=3D-I${STAGING_INCDIR}' \
>
> =C2=A0do_configure () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mv autoconf/configure.in . || true
> - =C2=A0 =C2=A0 =C2=A0 rm autoconf/libtool.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f autoconf/libtool.m4
> =C2=A0 =C2=A0 =C2=A0 =C2=A0libtoolize --force
> =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo '#define RXVT_UTMP_FILE "${localstatedir}=
/run/utmp"' >> config.h
> diff --git a/recipes/rxvt-unicode/rxvt-unicode_cvs.bb b/recipes/rxvt-unic=
ode/rxvt-unicode_cvs.bb
> index 67ba216..d31b839 100644
> --- a/recipes/rxvt-unicode/rxvt-unicode_cvs.bb
> +++ b/recipes/rxvt-unicode/rxvt-unicode_cvs.bb
> @@ -38,7 +38,7 @@ EXTRA_OEMAKE =3D "'XINC=3D-I${STAGING_INCDIR}' \
>
> =C2=A0do_configure () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mv autoconf/configure.in . || true
> - =C2=A0 =C2=A0 =C2=A0 rm autoconf/libtool.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f autoconf/libtool.m4
> =C2=A0 =C2=A0 =C2=A0 =C2=A0libtoolize --force
> =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo '#define RXVT_UTMP_FILE "${localstatedir}=
/run/utmp"' >> config.h
> diff --git a/recipes/rxvt/rxvt_2.7.9.bb b/recipes/rxvt/rxvt_2.7.9.bb
> index f4840b7..6cd834b 100644
> --- a/recipes/rxvt/rxvt_2.7.9.bb
> +++ b/recipes/rxvt/rxvt_2.7.9.bb
> @@ -29,7 +29,7 @@ EXTRA_OEMAKE =3D "'XINC=3D-I${STAGING_INCDIR}' \
>
> =C2=A0do_configure () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mv autoconf/configure.in . || true
> - =C2=A0 =C2=A0 =C2=A0 rm autoconf/libtool.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f autoconf/libtool.m4
> =C2=A0 =C2=A0 =C2=A0 =C2=A0libtoolize --force
> =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo '#define RXVT_UTMP_FILE "${localstatedir}=
/run/utmp"' >> config.h
> diff --git a/recipes/rxvt/rxvt_2.8.0.bb b/recipes/rxvt/rxvt_2.8.0.bb
> index 0ed4392..99b4de2 100644
> --- a/recipes/rxvt/rxvt_2.8.0.bb
> +++ b/recipes/rxvt/rxvt_2.8.0.bb
> @@ -29,7 +29,7 @@ EXTRA_OEMAKE =3D "'XINC=3D-I${STAGING_INCDIR}' \
>
> =C2=A0do_configure () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mv autoconf/configure.in . || true
> - =C2=A0 =C2=A0 =C2=A0 rm autoconf/libtool.m4
> + =C2=A0 =C2=A0 =C2=A0 rm -f autoconf/libtool.m4
> =C2=A0 =C2=A0 =C2=A0 =C2=A0libtoolize --force
> =C2=A0 =C2=A0 =C2=A0 =C2=A0autotools_do_configure
> =C2=A0 =C2=A0 =C2=A0 =C2=A0echo '#define RXVT_UTMP_FILE "${localstatedir}=
/run/utmp"' >> config.h
> diff --git a/recipes/util-linux-ng/util-linux-ng.inc b/recipes/util-linux=
-ng/util-linux-ng.inc
> index fbc92e4..fa367d9 100644
> --- a/recipes/util-linux-ng/util-linux-ng.inc
> +++ b/recipes/util-linux-ng/util-linux-ng.inc
> @@ -80,7 +80,7 @@ do_configure_prepend_chinook-compat () {
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in =C2=A0lt~obsolete.m4 ltsugar.m4 libt=
ool.m4 ltoptions.m4 ltversion.m4
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${S}/m4/${i}
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${S}/m4/${=
i}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 done
> =C2=A0}
>
> diff --git a/recipes/xmms/xmms_1.2.10.bb b/recipes/xmms/xmms_1.2.10.bb
> index 0585a7f..34b1e07 100644
> --- a/recipes/xmms/xmms_1.2.10.bb
> +++ b/recipes/xmms/xmms_1.2.10.bb
> @@ -26,7 +26,7 @@ EXTRA_OECONF =3D "--disable-opengl --disable-esd \
>
> =C2=A0do_configure_prepend() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${WORKDIR}/acinclude.m4 ${S}
> - =C2=A0 =C2=A0 =C2=A0 rm ${S}/libxmms/acinclude.m4 || true
> + =C2=A0 =C2=A0 =C2=A0 rm -f ${S}/libxmms/acinclude.m4 || true
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for i in $(find . -name "Makefile*") ; do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e 's:MKINS=
TALLDIRS =3D @MKINSTALLDIRS@:MKINSTALLDIRS =3D @mkdir_p@:g' \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e 's:$(SH=
ELL) $(MKINSTALLDIRS):$(MKINSTALLDIRS):g' $i
> diff --git a/recipes/xorg-driver/xf86-video-openchrome_0.2.904.bb b/recip=
es/xorg-driver/xf86-video-openchrome_0.2.904.bb
> index 83bdf89..a1f2aca 100644
> --- a/recipes/xorg-driver/xf86-video-openchrome_0.2.904.bb
> +++ b/recipes/xorg-driver/xf86-video-openchrome_0.2.904.bb
> @@ -8,5 +8,5 @@ SRC_URI[archive.md5sum] =3D "f2481d98ef54febf5bffbb88a2a2=
426d"
> =C2=A0SRC_URI[archive.sha256sum] =3D "c7bdf7c48365b1d077a4be7ccc652cf3f7a=
0f385fddeb2d4fe71b00b6c6b7aea"
>
> =C2=A0do_configure_prepend() {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${S}/acinclude.m4 || true
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${S}/acinclude.m4 || true
> =C2=A0}
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


