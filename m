Received: from mail-pb0-f44.google.com ([209.85.160.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UNGBE-0003sA-2s
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 07:24:16 +0200
Received: by mail-pb0-f44.google.com with SMTP id wz12so642562pbc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Apr 2013 22:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5ATXSfCaay4bvi52c2FA26TQiXdqbDgHX+MjeMSYRHY=;
	b=gklc72Sinm/ccFmK7CeWMs/cJIGTyyHaEiNRcTHLAOiCjB2zFgVE4pBBIjF+FUptju
	1CB9sfMJvkkifEtCfxdtmWbYJjPnbcEyW8rCV9s/+b+zBlun7o8TGZ1OmfKNJzbjy4Ye
	QxYZncUCPM77FqViBG2yP+4qjWbPnaAk9NH1WyT+kPjwSAxZUMq2Xt8k+8VMq9wofK5y
	DAP1PztAD5R+foUgzkQubtE/TcgDne0ySckeLdVkBv5zYP+p0MwO5Hk0oeh7gwWrEHyz
	fgBCZCoOEXBEmtNyc6NSNW31jxypRjtIyMgvNHhHLdhYx4zOg/xf2Lug2enKjo+Lu69u
	4kHA==
X-Received: by 10.68.247.72 with SMTP id yc8mr424877pbc.23.1364965624155;
	Tue, 02 Apr 2013 22:07:04 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id bs1sm4463736pbc.8.2013.04.02.22.07.01
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 02 Apr 2013 22:07:03 -0700 (PDT)
Date: Wed, 3 Apr 2013 07:07:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130403050703.GB10679@jama.dyndns-home.com>
References: <5156FDFD.1030606@pseudoterminal.org>
	<CAP9ODKr2wE7ZCr-2U=HWZ5KD0ywrmkGJtA_8f_PLsUghe_SEHw@mail.gmail.com>
	<51574B7B.1030204@pseudoterminal.org>
MIME-Version: 1.0
In-Reply-To: <51574B7B.1030204@pseudoterminal.org>
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
X-List-Received-Date: Wed, 03 Apr 2013 05:24:16 -0000
X-Groupsio-MsgNum: 43860
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline

--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 30, 2013 at 09:30:51PM +0100, dv wrote:
> On 03/30/13 17:40, Otavio Salvador wrote:
> > On Sat, Mar 30, 2013 at 12:00 PM, dv <dv@pseudoterminal.org> wrote:
> >> Hello,
> >>
> >> I noticed this part of the configure-fix.patch file for gst-ffmpeg 0.1=
0.13:
> >>
> >> +  if test "x$disable_yasm" !=3D "xyes"; then
> >> +    embffmpeg_configure_args=3D"$embffmpeg_configure_args --disable-y=
asm"
> >> +  fi
> >>
> >> Shouldn't the test be:  if test "x$disable_yasm" =3D "xyes"  ?
> >> To me, it seems as if this code adds --disable-yasm if disable_yasm is=
 not
> >> set to "yes", which is the complete opposite of the intended behavior.
> >>
> >> Or am I missing some detail about shell script code here?
> > I think you are right here. Maybe you could provide a fix for it?
> > --
> > Otavio Salvador                             O.S. Systems
> > E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> > Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> No problem. Patch for the patch attached :)

This patch is for oe-core, it needs to be resend to
openembedded-core@lists.openembedded.org

> From 4624e30adb13ad361f886eeda4272a7235bedd61 Mon Sep 17 00:00:00 2001
> From: Carlos Rafael Giani <dv@pseudoterminal.org>
> Date: Sat, 30 Mar 2013 21:29:22 +0100
> Subject: [PATCH] gst-ffmpeg: configure-fix patch used wrong test
>=20
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  .../recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch =
| 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configu=
re-fix.patch b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configu=
re-fix.patch
> index 81029ca..2bb124b 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.=
patch
> +++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.=
patch
> @@ -11,7 +11,7 @@ diff -r f2f8f74c6e30 configure.ac
>           --enable-gpl"
>     fi
>  =20
> -+  if test "x$disable_yasm" !=3D "xyes"; then
> ++  if test "x$disable_yasm" =3D "xyes"; then
>  +    embffmpeg_configure_args=3D"$embffmpeg_configure_args --disable-yas=
m"
>  +  fi
>  +
> --=20
> 1.8.2
>=20

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFbuPcACgkQN1Ujt2V2gBxR7wCcCXhC7QeJ7jBITNzksl2seP9/
tfUAnjimCa7yt4MPx34qh4Jl2O1mZKL3
=xwN0
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
