Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0ovi-0000oY-0r
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 07:46:58 +0100
Received: by eaal10 with SMTP id l10so972065eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 22:38:35 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.14.95.141 as permitted sender) client-ip=10.14.95.141; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.14.95.141 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.14.95.141])
	by 10.14.95.141 with SMTP id p13mr610743eef.73.1330065515853 (num_hops
	= 1); Thu, 23 Feb 2012 22:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hjYnAlmj6mES41aH7qFRz/9lrZhGB3k9FI2ANcOmYrU=;
	b=U5xeof9hZu2P/ol4xro+X7nQez6rFqlPWJ+7P4LEYpf9zmhKGJiPBPoW7eTwBySLic
	q4ZOb3Fo51cSrCH/uvyVEaE/jK05lxIulO/TktwkCusdYE1ypEgw9adN8DV9qvevr76M
	LFFdi/oyJ6L5rrU/0erQkswAdvF85Eln0MP4o=
Received: by 10.14.95.141 with SMTP id p13mr454691eef.73.1330065515742;
	Thu, 23 Feb 2012 22:38:35 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s48sm14661257eem.0.2012.02.23.22.38.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 22:38:34 -0800 (PST)
Date: Fri, 24 Feb 2012 07:38:32 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120224063832.GF3769@jama.jama.net>
References: <1315576997-18349-1-git-send-email-Martin.Jansa@gmail.com>
	<CAEsOVNc5A2dwjKpnu2X0cbXu+_+UXfhNFHBAQE4+QWbZ_wiCVA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEsOVNc5A2dwjKpnu2X0cbXu+_+UXfhNFHBAQE4+QWbZ_wiCVA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] udev-173: use tar.gz instead of git checkout
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
X-List-Received-Date: Fri, 24 Feb 2012 06:46:58 -0000
X-Groupsio-MsgNum: 37426
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3y/CVJp2vtgPOhvS"
Content-Disposition: inline

--3y/CVJp2vtgPOhvS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2012 at 04:27:42AM +0000, McClintock Matthew-B29882 wrote:
> On Fri, Sep 9, 2011 at 9:03 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > * today it's easier to find right tar.gz stored somewhere then working =
git.kernel.org
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > =A0meta-oe/recipes-core/udev/udev_173.bb | =A0 =A09 ++++-----
> > =A01 files changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta-oe/recipes-core/udev/udev_173.bb b/meta-oe/recipes-co=
re/udev/udev_173.bb
> > index e1383d3..df39d42 100644
> > --- a/meta-oe/recipes-core/udev/udev_173.bb
> > +++ b/meta-oe/recipes-core/udev/udev_173.bb
> > @@ -16,11 +16,10 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75141926=
0aa954499f7abaabaa882bbe \
> > =A0# Needed for udev-extras
> > =A0DEPENDS =3D "gperf-native usbutils acl glib-2.0"
> >
> > -SRCREV =3D "${PV}"
> > =A0PR =3D "r0"
> >
> > =A0# version specific SRC_URI
> > -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/hotplug/udev.git;proto=
col=3Dgit \
> > +SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}=
=2Etar.gz \
>=20
> This tarball is no longer availabe... did they pull
> 'http://kernel.org/pub/linux/utils/kernel/hotplug/udev-173.tar.gz' for
> some reason?

I don't know.. I'm using 181 now..

Cheers,

>=20
> -M
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3y/CVJp2vtgPOhvS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9HMGgACgkQN1Ujt2V2gBwkIACdHgzOiGnUABKVXlgNJE/ypGg8
F/cAoLRGlX3hU/EgZUMrussj5IUXET1l
=89sQ
-----END PGP SIGNATURE-----

--3y/CVJp2vtgPOhvS--
