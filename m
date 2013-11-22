Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 30E6D6B3D0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2013 14:50:57 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so706319eei.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Nov 2013 06:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U4cIPCbfjd9yJXlzjgMBLKjZj26aD4UX1ScydasfZ08=;
	b=gw2TKbtUBX6UOIq2Sgfi3r1f176AszfGb8CDOemx4Mlwg0ygWMAAhWp1LiQQTa/nj5
	aSlIMfHIYZFa7Vr9y7kqpNEUM73VhzXzaCkoMBdjkB1z5SosbLT+g9XZQzr8rmza6tvp
	dn16h/Ol7HWDOxFkLFdrjEaOCquOpmCa2HlutRHBQrcGgYCzuFJ68LA2KHuoW/AB7zPW
	Ep4iZJWo2BXhHo0W28XhHx/nURciTKSLVBBT35w4vwBYnCoa3iLvdAMGO+7hvQLcdY8/
	tDoNDgB7dXNXv230NovYElK3pS422XTAcmSaxqRLYfBao+OdpRUoyW55n6uH93X6iuqA
	prkA==
X-Received: by 10.14.172.133 with SMTP id t5mr16915049eel.35.1385131855730;
	Fri, 22 Nov 2013 06:50:55 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id i1sm78432047eeg.0.2013.11.22.06.50.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Nov 2013 06:50:54 -0800 (PST)
Date: Fri, 22 Nov 2013 15:51:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131122145101.GD3708@jama>
References: <CAP71Wjy9mGKjDnzAKED7zFUY6J1c_2-ysUpH8uHgczZe5zNi9A@mail.gmail.com>
	<20131121123904.GX3708@jama>
	<CAP71WjxW7KZp3D+gTEGV2ZzDfwPhwxqLUP5qw4Rj4XN_z1=cQA@mail.gmail.com>
	<20131121173050.GA3708@jama>
	<1385109648.23183.38.camel@bril0118.bri.st.com>
	<20131122105117.GB3708@jama>
	<1385122369.23183.107.camel@bril0118.bri.st.com>
MIME-Version: 1.0
In-Reply-To: <1385122369.23183.107.camel@bril0118.bri.st.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: making qt5 package machine specific
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
X-List-Received-Date: Fri, 22 Nov 2013 14:50:58 -0000
X-Groupsio-MsgNum: 47239
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zfZAIAilk/YNj2Pr"
Content-Disposition: inline

--zfZAIAilk/YNj2Pr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 22, 2013 at 12:12:49PM +0000, Andr=E9 Draszik wrote:
> Thanks Martin!
>=20
> On Fri, 2013-11-22 at 11:51 +0100, Martin Jansa wrote:
> > You can have recipes which use only qtbase-native and qmake only as
> > build tool and don't use target qtbase at all.
> >=20
> > Such recipes inherit qmake5_base to setup paths etc and shouldn't became
> > MACHINE_ARCH just because target qtbase (which they don't use at all) i=
s.
>=20
> OK.
>=20
> Would it be better / ok to move my patch into qt5.inc then?
>=20
> My only (maybe unjustified) concern with this is: What defines if some
> source code uses / can see configuration options from qtbase configure
> time when invoking qmake? Purely that projects own build system? I can't
> see anything in meta-qt5 that could affect this, unless I'm missing
> something.

You can add it to separate .bbclass and inherit it from qt5.inc

> In other words, could a recipe build sources that depend on the Qt
> configuration, without including qt5.inc?

Yes any recipe which inherits qmake5 and also has qtbase added in
DEPENDS should inherit this class if it wants PACKAGE_ARCH to be
automatically adjusted.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zfZAIAilk/YNj2Pr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKPb1UACgkQN1Ujt2V2gBwP8QCdFzqelQJ6cLcQu35ZjLF0B1a8
lXwAn1gCJ/64HSReCQT4OaqC41E+Usyi
=TY1o
-----END PGP SIGNATURE-----

--zfZAIAilk/YNj2Pr--
