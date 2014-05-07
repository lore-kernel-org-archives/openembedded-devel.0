Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4D9C360781
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 16:56:47 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id u14so1797003lbd.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 May 2014 09:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oJzRO6yoHzIE+gfVc5BwA2UWdiZTZxqZSAXL9CY8RJA=;
	b=yPROvUo5vbjevam0Z1oxoTjv6siAVxo/HjkbjI9FvoM/hhFPLME/vvjkWb01Gb0X8B
	r7Nx6pXyrlKjr9vZEv92hCPZk2SCh/Jx8kgrjE1CCek2DlmN38HSgdCD6kibmflo+z9u
	DHMAcxUtRQJP61jaSLO5ZiLQSg5YTKS2aLc+cW8K8KvRQE+RyUjEJfWqwOSJRisELTBk
	t+rhIAKCd5Kbu/sn6UeJXQd3E5+hMWmPPdgB+KuOyqtgeIsoQMGsUzlTCgemTvJtIrkj
	Kkg96DBT9U4RDntt4dqtl7jfygcvhP3uTjAVhvV1OE6C6cL4yJ74Ylo5QWxLfrmtW1Z+
	qE9Q==
X-Received: by 10.112.146.202 with SMTP id te10mr2283871lbb.75.1399481808413; 
	Wed, 07 May 2014 09:56:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	qf1sm17615672lbc.8.2014.05.07.09.56.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 May 2014 09:56:47 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 7 May 2014 18:57:09 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140507165709.GI30955@jama>
References: <1399414836-16702-1-git-send-email-nickdademo@gmail.com>
	<20140506222845.GE30955@jama>
	<CANR6C555Le4jbMW=h3wrSedJgHKWZDnW6WZoz48GJo2dDwd_4A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANR6C555Le4jbMW=h3wrSedJgHKWZDnW6WZoz48GJo2dDwd_4A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] opencv: Bump SRCREV to 2.4.9 release tag, PV is now 2.4.9+git.
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
X-List-Received-Date: Wed, 07 May 2014 16:56:48 -0000
X-Groupsio-MsgNum: 49776
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="D6z0c4W1rkZNF4Vu"
Content-Disposition: inline

--D6z0c4W1rkZNF4Vu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2014 at 11:57:09PM +1000, Nick D'Ademo wrote:
> The recipe successfully builds without errors (multilib build) - however,=
 I
> also had no dependencies issues with the previous version of the recipe
> either (2.4.8+git).

Have you tried building opencv before and after building jasper nad libdc13=
94 in the same sysroot and comparing opencv output?

>=20
>=20
> On Wed, May 7, 2014 at 8:28 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
>=20
> > On Wed, May 07, 2014 at 08:20:36AM +1000, Nick D'Ademo wrote:
> > > Signed-off-by: Nick D'Ademo <nickdademo@gmail.com>
> >
> > Does it fix this issue reported in test-dependencies report?
> >
> > opencv/libopencv-highgui/latest lost dependency on  jasper libdc1394
> >
> > > ---
> > >  meta-oe/recipes-support/opencv/opencv_2.4.bb |    4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bbb/meta-oe/re=
cipes-support/opencv/
> > opencv_2.4.bb
> > > index df512f6..43e6a2b 100644
> > > --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
> > > +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
> > > @@ -9,12 +9,12 @@ ARM_INSTRUCTION_SET =3D "arm"
> > >
> > >  DEPENDS =3D "python-numpy libtool swig swig-native python bzip2 zlib
> > glib-2.0"
> > >
> > > -SRCREV =3D "a4b34e7ae10351fc4d30dc55995679340efc488e"
> > > +SRCREV =3D "df8e28283f09825cca0c2902160b7abebcfe1b64"
> > >  SRC_URI =3D "git://github.com/Itseez/opencv.git;branch=3D2.4 \
> > >             file://opencv-fix-pkgconfig-generation.patch \
> > >  "
> > >
> > > -PV =3D "2.4.8+git${SRCPV}"
> > > +PV =3D "2.4.9+git${SRCPV}"
> > >
> > >  S =3D "${WORKDIR}/git"
> > >
> > > --
> > > 1.7.9.5
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--D6z0c4W1rkZNF4Vu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNqZeUACgkQN1Ujt2V2gBzufgCfaktM8FXqImxjnGRTsf425LKf
xhoAn04vR8qlhLeOBUC7ZO3d7VTsUhNf
=XaFE
-----END PGP SIGNATURE-----

--D6z0c4W1rkZNF4Vu--
