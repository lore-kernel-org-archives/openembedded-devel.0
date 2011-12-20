Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1Rd2zF-0001CO-1e
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 17:56:21 +0100
Received: by iakh37 with SMTP id h37so6908739iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 08:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Yj5rsU7lIcA9pWdyN//nd4GpayOV/TcolSKIycWYu4g=;
	b=QoGLUYkF/C1liEM2XNDk9EauyvQ/sF/ocNEJFBUYhi6H4QUFQUszpczA2V5+wCn5lb
	ijPZKar7yj1xbPuqI+3LZbjY4rMZD4fxrrx8KJAqP8JUXBAe9oG5OD+rDIuCCIN8Qd/p
	T6YZjv3yaCT+od1Ocjvj8amRHuqXW+8L22sKA=
Received: by 10.50.157.135 with SMTP id wm7mr3054935igb.39.1324399755144; Tue,
	20 Dec 2011 08:49:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.173.33 with HTTP; Tue, 20 Dec 2011 08:48:55 -0800 (PST)
In-Reply-To: <CACrTVgL5P7JaXceNC+QYdcwDMWmwVFAXehA3DFdZesh0595K1g@mail.gmail.com>
References: <1324378880-6009-1-git-send-email-sylvain.pare@gmail.com>
	<jcq1o2$phe$1@dough.gmane.org>
	<CACrTVgL5P7JaXceNC+QYdcwDMWmwVFAXehA3DFdZesh0595K1g@mail.gmail.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Tue, 20 Dec 2011 17:48:55 +0100
Message-ID: <CACrTVgKyu7Kq_TZmkFRHQMknimKmvitTW4eEbj=PtTbiFSt1EA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH v3][meta-oe] vlc: rework dependencies
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
X-List-Received-Date: Tue, 20 Dec 2011 16:56:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

sorry I checked at the wrong place..
thank you for applying.
Regards,
Sylvain

2011/12/20 Sylvain Par=E9 <sylvain.pare@gmail.com>

> I am not skilled for further discution about that.
> But does my patch is ok otherwise ?
>
>
> 2011/12/20 Koen Kooi <koen@dominion.thruhere.net>
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 20-12-11 12:01, Sylvain 'GarthPS' Par=E9 schreef:
>> > * re-adds dropped depends as they are available now * adds libxpm as
>> > dependency as current vlc's config depends on it. * bumps PR * NOTE
>> about
>> > ENTERPRISE_DISTRO : is that supposed to be still used or should this b=
e
>> > replaced by something which respects COMMERCIAL_LICENSE setting ?
>>
>> ENTERPRISE_DISTRO tries to guard against these things:
>>
>> 1) patent problems (e.g. GPLv3 patent clause)
>> 2) 'security' (e.g. GPLv3 Tivo clause)
>> 3) royalties for codecs (e.g. MPEG-LA)
>>
>> Sometimes you get big parts of 3 included in the silicon price,so I'm no=
t
>> sure how usefull it is to put only MPEG-LA things in ENTERPRISE_DISTRO,
>> maybe we need a different variable for that.
>>
>> regards,
>>
>> Koen
>>
>> >
>> > Signed-off-by: Sylvain 'GarthPS' Par=E9 <sylvain.pare@gmail.com> ---
>> > meta-oe/recipes-multimedia/vlc/vlc.inc       |    5 ++---
>> > meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb |    2 ++ 2 files
>> changed, 4
>> > insertions(+), 3 deletions(-)
>> >
>> > diff --git a/meta-oe/recipes-multimedia/vlc/vlc.inc
>> > b/meta-oe/recipes-multimedia/vlc/vlc.inc index aecfb3a..7353f90 100644
>> > --- a/meta-oe/recipes-multimedia/vlc/vlc.inc +++
>> > b/meta-oe/recipes-multimedia/vlc/vlc.inc @@ -3,9 +3,8 @@ HOMEPAGE =3D
>> > "http://www.videolan.org" LICENSE =3D "GPLv2" SECTION =3D "multimedia"
>> >
>> > -DEPENDS =3D "libfribidi libtool libgcrypt gst-plugins-bad virtual/lib=
sdl
>> > qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \ -" -#
>> > ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag
>> > liba52 mpeg2dec', d)}" +DEPENDS =3D "libfribidi libtool libgcrypt
>> > gst-plugins-bad virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor
>> > faad2 ffmpeg flac libxpm \ +
>> > ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag
>> > liba52 mpeg2dec', d)}"
>> >
>> > SRC_URI =3D
>> > "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2=
"
>> >
>> > diff --git a/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb
>> > b/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb index fb69e05..9f53159
>> > 100644 --- a/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb +++
>> > b/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb @@ -5,6 +5,8 @@
>> > LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Ded7e492ee44e70125a5d42e1183=
54a13"
>> >
>> > require vlc.inc
>> >
>> > +PR =3D "r1" + # work around build failure EXTRA_OECONF +=3D "
>> > --enable-libxml2=3Dno"
>> >
>>
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.4.11 (Darwin)
>> Comment: GPGTools - http://gpgtools.org
>>
>> iEYEARECAAYFAk7wikIACgkQMkyGM64RGpGs2wCgjvwnSaMyqYyPvVfX729PhKFl
>> EQUAoI1GgigRW8YbPItLcG0irfcQLGpU
>> =3DeiUh
>> -----END PGP SIGNATURE-----
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>

