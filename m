Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6C4C777026
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Sep 2015 18:49:21 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so27084756wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Sep 2015 11:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Be9rB6cWtNjdd4lBwqN5WuzmwdseLFGS1FwkWXZ4D08=;
	b=tFxy3WPB6N0/nIzUSZfBqohCd5TajOm5zuX0ca0qXLPfhP/ShFS1/Nf1vsYCRFBzCb
	u8jebvscmLP7G30iCO1il4kdWEhnGBjsV5OK89o4q7KOjp55MHURidKYtcYxpyGUBgI0
	JWeM1EwSaUpfgJgT+4530WxgWnwucNe/pahe2x3Ky8iRzGzFcnrXcFTuDViKaNEUz8G/
	W+ig+AwTs91DYPYwP2QRsnVLqkGIbDJe0a28C9mEGqZ+08+5N3n4hDdvF7s8TZ29T8ub
	UHPw2/x/1gP8vPcbkBeY4Fj7ZlEOf7gPESnZ7qYjlypwFnyGyGmZK/r3BSACz/yj+dAX
	ijZg==
X-Received: by 10.194.103.71 with SMTP id fu7mr24623831wjb.90.1441219760309;
	Wed, 02 Sep 2015 11:49:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	lg6sm33750784wjb.10.2015.09.02.11.49.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 02 Sep 2015 11:49:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 2 Sep 2015 20:49:40 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150902184940.GH2470@jama>
References: <1441192259-20483-1-git-send-email-ml@communistcode.co.uk>
	<20150902132330.GC2470@jama>
	<CAMKF1spnATGUXbzt8ymqgPjtqR2tkaeRybMiMG5MfgV-43GDCQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spnATGUXbzt8ymqgPjtqR2tkaeRybMiMG5MfgV-43GDCQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Jack Mitchell <jack@embed.me.uk>
Subject: Re: [PATCH] libjpeg-turbo: fix libturbojpeg packaging
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
X-List-Received-Date: Wed, 02 Sep 2015 18:49:23 -0000
X-Groupsio-MsgNum: 57183
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uJrvpPjGB3z5kYrA"
Content-Disposition: inline

--uJrvpPjGB3z5kYrA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 02, 2015 at 11:25:07AM -0700, Khem Raj wrote:
> On Wed, Sep 2, 2015 at 6:23 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > But more importantly I don't understand how dev-so and other files got
> > into libturbojpeg package when it's using:
> >
> > FILES_libturbojpeg =3D "${libdir}/libturbojpeg.so"
> >
> > So I think the problem is somewhere else.
>=20
> it uses PACKAGES =3D+ "jpeg-tools libturbojpeg" that could precede the
> default packages

yes, but FILES_libturbojpeg includes only one file, not the headers and
the staticdev files, so changing it to
FILES_libturbojpeg =3D "${libdir}/libturbojpeg${SOLIBS}"
should be enough to remove that INSANE_SKIP.

> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--uJrvpPjGB3z5kYrA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXnRMQACgkQN1Ujt2V2gBzp/QCgnew2s7r8ZlwTo5vomyA5kRmk
MxgAn2+fgVniDnsykw0C4vHtHK06c+Ed
=YLXt
-----END PGP SIGNATURE-----

--uJrvpPjGB3z5kYrA--
