Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PaT2V-0004bF-Hr
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Jan 2011 14:04:31 +0100
Received: by iyj18 with SMTP id 18so14588857iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Jan 2011 05:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=gPMP+hpwa9uPfIXcx8jCSqANweeBTM6puXpnWjO3dJ0=;
	b=H58LdG4KR0O+xxSDj1ur/PHtHOScihnQP+SSZTGacgEQjURp3gVeG7+A+8e7Pwtbtv
	8YjBYnAlMRu1PpzzlVWhCQOenxvqFOfcORVHUWQdyCH0Z0Sdciok5hu87orWe1jFeWYy
	q4nWx9mPU7XvveO+FNrnKEO22/kE+eMfOHui4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=JL/a+tPAkAt/hhU3ufn4YOy7YsJuf7H/c7ObclFKUV8ZukHNiXWFEy0iFLNuwLztza
	j0uxzIFjfyOEQilnoE8ChyOZwK/YA77oFH4C/iqunIC8W16C8/wjuOWf/JHPJSmN4W+Q
	t2cMuGB+Dnh9Qq6gX4VOBHkbLdJPORuE+oH4I=
MIME-Version: 1.0
Received: by 10.231.15.202 with SMTP id l10mr6959467iba.19.1294232646406; Wed,
	05 Jan 2011 05:04:06 -0800 (PST)
Received: by 10.231.38.11 with HTTP; Wed, 5 Jan 2011 05:04:06 -0800 (PST)
In-Reply-To: <1294231700-27043-1-git-send-email-obi@opendreambox.org>
References: <1294231700-27043-1-git-send-email-obi@opendreambox.org>
Date: Wed, 5 Jan 2011 14:04:06 +0100
Message-ID: <AANLkTi=HkzhDQt2BWZNf2WBM1hED=-51w3F89gyC3pLP@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] qt4: fix incorrect pkg-config files
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
X-List-Received-Date: Wed, 05 Jan 2011 13:04:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/5 Andreas Oberritter <obi@opendreambox.org>:
> * Previously, include statements were generated like this:
> =A0-I.../mipsel-oe-linux/usr/include/qtopia/QtCore
> =A0-I.../mipsel-oe-linux/usr/include/qtopia/QtCore/qt4-embedded/QtCoreE
> =A0-I.../mipsel-oe-linux/usr/include/qtopia/QtCore/qtopia
>
> * The sed rules ignored QT_LIBINFIX.
> * The sed rules incorrectly used QT_BASE_NAME instead of QT_DIR_NAME.
>
> * Now, they look like this, which is what an application expects:
> =A0-I.../mipsel-oe-linux/usr/include/qtopia/QtCore
> =A0-I.../mipsel-oe-linux/usr/include/qtopia
>
> * Tested with qt4-embedded on mipsel
>
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> =A0recipes/qt4/qt4.inc | =A0 12 +++++-------
> =A01 files changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
> index ac1fc83..52fa146 100644
> --- a/recipes/qt4/qt4.inc
> +++ b/recipes/qt4/qt4.inc
> @@ -285,15 +285,13 @@ do_install() {
> =A0 =A0 =A0 =A0 =A0 =A0${D}${libdir}/pkgconfig/*.pc
> =A0 =A0 for name in ${QT_LIB_NAMES}; do
> =A0 =A0 =A0 =A0 =A0 =A0sed -i -e /Requires/s#"${name}"#"${name}${QT_LIBIN=
FIX}"#g ${D}${libdir}/pkgconfig/*.pc
> + =A0 =A0 =A0 =A0 =A0 if [ -f ${D}${libdir}/pkgconfig/${name}${QT_LIBINFI=
X}.pc ]; then
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed -i -e /^includedir=3D/s#"/${name}"## \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-e /^Cflags:/s#"${QT_DIR_NAM=
E}"#"${name}"# \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${D}${libdir}/pkgconfig=
/${name}${QT_LIBINFIX}.pc
> + =A0 =A0 =A0 =A0 =A0 fi
> =A0 =A0 done
>
> - =A0 =A0 =A0 # QT abuses $includedir to point to its headers, which brea=
ks pkgconfig sysroot, so manually fix it up here:
> - =A0 =A0 =A0 for pc in ${D}${libdir}/pkgconfig/*.pc ; do
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed -i -e "s:prefix}include/${QT_BASE_NAME}=
/$(basename $pc .pc):prefix}/include:" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-e "s,Cflags: ,Cflags: -IP{i=
ncludedir}/${QT_BASE_NAME}/$(basename $pc .pc) ," \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0-e 's:IP{:I${:g' $pc
> - =A0 =A0 =A0 done
> -
> =A0 =A0 install -d ${D}/${libdir}/fonts
> =A0 =A0 touch ${D}/${libdir}/fonts/fontdir
> =A0}
> --
> 1.7.2.3
>
>
wouldn't this need an INCPR bump or so?

Frans


