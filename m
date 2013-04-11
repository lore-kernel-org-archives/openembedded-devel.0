Received: from mail-pd0-f175.google.com ([209.85.192.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQIbY-0002Wk-5S
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 16:36:30 +0200
Received: by mail-pd0-f175.google.com with SMTP id g10so882319pdj.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 07:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=k3zP7HPEvjUlqWTm6fOJyD/8ufTXY/TBQt4JncNCi4Y=;
	b=ntYqdEzi7yXDlN/c+l+km8xclT/qqhxZrNVJYtG/ildY+UYxhdJ8hTNSOYJ/KFqCi/
	tX8elAUDiTRFw1AvBfhbZXwe/TWZiOctPewmWDhSj0eF7hiaF0gVyXxxw3cnFPa2xEfw
	TAHu4jUEIh7bXZ3hK63n8T2S00b0tvErOWYtvIRnNDoZ1CqiYSCvkqgm0w5nG6nqK2VZ
	gDKdxI9Xpsp8rab9nrOZxFVBd6aRwt4M1aTmZwwzxowLwE6FI3r3R1EXFRE+QTUmQaEp
	Vn9jD58Wz+ikmIz8RtHuQHmKfgbSd/FBWSGJsLBgsw7hKjZy+KNrLYIzvxu4/NEu9C2W
	0hEg==
X-Received: by 10.68.13.4 with SMTP id d4mr9262834pbc.49.1365689916491;
	Thu, 11 Apr 2013 07:18:36 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id gi10sm4375788pbc.40.2013.04.11.07.18.33
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 07:18:35 -0700 (PDT)
Date: Thu, 11 Apr 2013 16:18:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130411141828.GJ2477@jama>
References: <5156FDFD.1030606@pseudoterminal.org>
	<CAP9ODKr2wE7ZCr-2U=HWZ5KD0ywrmkGJtA_8f_PLsUghe_SEHw@mail.gmail.com>
	<51574B7B.1030204@pseudoterminal.org>
	<20130403050703.GB10679@jama.dyndns-home.com>
MIME-Version: 1.0
In-Reply-To: <20130403050703.GB10679@jama.dyndns-home.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: gst-ffmpeg configure-fix patch and yasm
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
X-List-Received-Date: Thu, 11 Apr 2013 14:36:47 -0000
X-Groupsio-MsgNum: 44077
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aznLbwQ42o7LEaqN"
Content-Disposition: inline

--aznLbwQ42o7LEaqN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 03, 2013 at 07:07:03AM +0200, Martin Jansa wrote:
> On Sat, Mar 30, 2013 at 09:30:51PM +0100, dv wrote:
> > On 03/30/13 17:40, Otavio Salvador wrote:
> > > On Sat, Mar 30, 2013 at 12:00 PM, dv <dv@pseudoterminal.org> wrote:
> > >> Hello,
> > >>
> > >> I noticed this part of the configure-fix.patch file for gst-ffmpeg 0=
=2E10.13:
> > >>
> > >> +  if test "x$disable_yasm" !=3D "xyes"; then
> > >> +    embffmpeg_configure_args=3D"$embffmpeg_configure_args --disable=
-yasm"
> > >> +  fi
> > >>
> > >> Shouldn't the test be:  if test "x$disable_yasm" =3D "xyes"  ?
> > >> To me, it seems as if this code adds --disable-yasm if disable_yasm =
is not
> > >> set to "yes", which is the complete opposite of the intended behavio=
r.
> > >>
> > >> Or am I missing some detail about shell script code here?
> > > I think you are right here. Maybe you could provide a fix for it?
> > > --
> > > Otavio Salvador                             O.S. Systems
> > > E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> > > Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
> > >
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >=20
> > No problem. Patch for the patch attached :)
>=20
> This patch is for oe-core, it needs to be resend to
> openembedded-core@lists.openembedded.org

Tom's patch was applied in oe-core
http://git.openembedded.org/openembedded-core/commit/?id=3Dda9515621134c26e=
54f43b96cdad0c6e6c5876bf

>=20
> > From 4624e30adb13ad361f886eeda4272a7235bedd61 Mon Sep 17 00:00:00 2001
> > From: Carlos Rafael Giani <dv@pseudoterminal.org>
> > Date: Sat, 30 Mar 2013 21:29:22 +0100
> > Subject: [PATCH] gst-ffmpeg: configure-fix patch used wrong test
> >=20
> > Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> > ---
> >  .../recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patc=
h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/confi=
gure-fix.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/confi=
gure-fix.patch
> > index 81029ca..2bb124b 100644
> > --- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fi=
x.patch
> > +++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fi=
x.patch
> > @@ -11,7 +11,7 @@ diff -r f2f8f74c6e30 configure.ac
> >           --enable-gpl"
> >     fi
> >  =20
> > -+  if test "x$disable_yasm" !=3D "xyes"; then
> > ++  if test "x$disable_yasm" =3D "xyes"; then
> >  +    embffmpeg_configure_args=3D"$embffmpeg_configure_args --disable-y=
asm"
> >  +  fi
> >  +
> > --=20
> > 1.8.2
> >=20
>=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aznLbwQ42o7LEaqN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEUEARECAAYFAlFmxjQACgkQN1Ujt2V2gByAXQCYlQNiM9zR0PUbObwyMdVKx0Pw
LwCfTUxdPWHG+ZMeaxdizvJAu8X9ppc=
=+OuD
-----END PGP SIGNATURE-----

--aznLbwQ42o7LEaqN--
