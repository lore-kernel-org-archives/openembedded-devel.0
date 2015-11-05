Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id D5939770DF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Nov 2015 11:16:01 +0000 (UTC)
Received: by wmll128 with SMTP id l128so9282280wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Nov 2015 03:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ULTLVu5b7x85ye9dFys4x+NXA15DqZfFjuUq7A2GBH8=;
	b=olDk8OZG68cRW9sWcRfyYWKtTgWO205nnu55ffYFOsiMfthQ9L89u+Bsh0FBYFaQDu
	uXg+M2kDdl67fTB5+/3SZjPfnkrluEyGHlWEIpr+UE3P9yMpsLwAKAJjdAOTASUsUFis
	tbm4T3/9zkKqj5XQYKpM1miq3sjqdNwFwvS3Y4XNG5POMwqv5JO8OVeyfjJUIEbQCClg
	gSccoOpSTrvnRgc3IEdYH3oPmYFNLemri8bpJxVr13ptRsaRd+P3tcwFaIFShLgoMApE
	YbCDDArzvksdscMuUs4Li6rQYnj3Ucb16egPXj+4AQdDALQBis5HFc/4eSTMkLFHzw4J
	rKnA==
X-Received: by 10.28.94.132 with SMTP id s126mr2979526wmb.30.1446722161203;
	Thu, 05 Nov 2015 03:16:01 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id r9sm6413970wjz.35.2015.11.05.03.15.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Nov 2015 03:16:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Nov 2015 12:16:11 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151105111611.GC2556@jama>
References: <1446652999-24545-1-git-send-email-funman@videolan.org>
	<1446652999-24545-3-git-send-email-funman@videolan.org>
	<20151104222547.GA2556@jama> <563B3682.6000407@videolan.org>
MIME-Version: 1.0
In-Reply-To: <563B3682.6000407@videolan.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-multimedia][PATCH 3/3] VLC: drop gnome-vfs, it will be removed from upstream in VLC 3.0
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
X-List-Received-Date: Thu, 05 Nov 2015 11:16:02 -0000
X-Groupsio-MsgNum: 58338
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
Content-Disposition: inline

--E/DnYTRukya0zdZ1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 05, 2015 at 11:59:14AM +0100, Rafa=EBl Carr=E9 wrote:
> Hello,
>=20
> On 04/11/2015 23:25, Martin Jansa wrote:
> > On Wed, Nov 04, 2015 at 05:03:19PM +0100, Rafa=EBl Carr=E9 wrote:
> >> ---
> >=20
> > Is it still used in 2.2.1 version? we aren't using 3.0 yet:
>=20
> Yes, that module is still present in 2.2 (2.2.1 and future 2.2.X versions=
).
>=20
> I'm testing the waters here, as I couldn't build gnome-vfs, and since
> that module
> is being removed from upstream (again, in future 3.0 version but not
> 2.2.X), I
> didn't bother to add a PACKAGECONFIG knob for it.
>=20
> With this patch the gnome-vfs module will still if gnome-vfs is present,
> although it will not load at runtime if gnome-vfs is not installed (witho=
ut
> preventing the rest of VLC to work properly).
>=20
> It would be in the same position than the libarchive, dvdnav, samba,
> ssh2 modules, etc
> which coincidentally implement the capabilities that the deprecated (in
> gnome) gnome-vfs
> provides :)
>=20
> So this simple patch fixes my build failure and at the same time reduces
> future work for when
> VLC 3.0 will be released.
>=20
>=20
> What do you think?

NAK it's not acceptable to make gnome-vfs support undeterministic in
2.2.x just because some future 3.0 recipe won't use it.

We already have too many autodetected dependencies again, last bunch
added by new 1394 recipes in meta-multimedia:
vlc-2.2.1: vlc rdepends on libavc1394, but it isn't a build dependency? [bu=
ild-deps]
vlc-2.2.1: vlc rdepends on libdvdnav, but it isn't a build dependency? [bui=
ld-deps]
vlc-2.2.1: vlc rdepends on libupnp, but it isn't a build dependency? [build=
-deps]

Add PACKAGECONFIG for it please and to get bonus points add
PACKAGECONFIG for deps from QA issues above.

> Thanks for the feedback
>=20
> >>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-mul=
timedia/recipes-multimedia/vlc/vlc.inc
> >> index ad5c81d..dddbb5b 100644
> >> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> >> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> >> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f=
5fce4486a80fdaf4a4263"
> >>  DEPENDS =3D "libfribidi libtool libgcrypt libgcrypt-native \
> >>     virtual/libsdl libsdl-image dbus dbus-glib libxml2 gnutls \
> >>     tremor faad2 ffmpeg flac libxpm libxinerama fluidsynth alsa-lib \
> >> -   libdvdcss libdvdread lua-native lua libidn gnome-vfs \
> >> +   libdvdcss libdvdread lua-native lua libidn \
> >>     libdc1394 libraw1394 avahi libjpeg-turbo xz libmodplug mpeg2dec \
> >>     libmtp libopus orc libsamplerate0 libusb1 schroedinger taglib \
> >>     tiff xcb-util-keysyms samba"
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY7OnsACgkQN1Ujt2V2gBxYtwCglMYhITawTfryLu6J71ci0tZ9
CSUAoJXbEogl16B2PZ5KGGoBCvzELkxv
=MwFQ
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--
