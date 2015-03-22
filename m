Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f171.google.com (mail-we0-f171.google.com
	[74.125.82.171])
	by mail.openembedded.org (Postfix) with ESMTP id C94996AC33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Mar 2015 15:55:02 +0000 (UTC)
Received: by weop45 with SMTP id p45so119331860weo.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Mar 2015 08:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=M1sO1psqZ/eZoZg4VAVoSW8x/WA7iADNoAJ4k1nFOl4=;
	b=fl+E1IxW0u7chYoSjwN1IUIthuirTl57R7xS+gXuOGBWrqYZWjS22baMECx9IL6Tdu
	/3WLxzqijZaPT4Z1c80bIdOcB1eybHz/hL/Wxe8vTet5uOOdir0tbenyhtloB5Qoqf4e
	WDQ+9xcSzPg/FEPmJ0s99LoX7vzcDrrsit6TK7bTdrlPBcLVQVNt6piLVb1iBmMPz92g
	e9GsTjbjS1bqZ/ii9LgFVBxaIW/w676Gh4TkpWHmqc2PtFtWK8DoLA6NYyk+gem/O84I
	GmYXSFsm5cpYdP7Z5mag0RJ7dZjJt+0EInJHmt8XZNvlhm2uXL4DYYoOv9ApctzRoaTL
	Acug==
X-Received: by 10.180.7.196 with SMTP id l4mr12080270wia.44.1427039703074;
	Sun, 22 Mar 2015 08:55:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	lu13sm7063257wic.10.2015.03.22.08.55.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 22 Mar 2015 08:55:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 22 Mar 2015 16:55:13 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150322155513.GN4738@jama>
References: <1426861220-30221-1-git-send-email-funman@videolan.org>
	<550E94BF.50908@videolan.org>
MIME-Version: 1.0
In-Reply-To: <550E94BF.50908@videolan.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] vim: add checksum
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
X-List-Received-Date: Sun, 22 Mar 2015 15:55:05 -0000
X-Groupsio-MsgNum: 54844
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5FetH82qe0Z6y/zI"
Content-Disposition: inline

--5FetH82qe0Z6y/zI
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2015 at 11:09:03AM +0100, Rafa=EBl Carr=E9 wrote:
> Hello,
>=20
> I couldn't reproduce the checksum error with a fresh build with an empty
> downloads/ folder.
>=20
> So this patch is apparently needed only when populating downloads/
> folder before fetching vim.
>=20
> I will investigate a bit more, I think the patch should actually be in
> bitbake
> (missing supports_checksum for Hg.py)

Should bitbake support checksums for hg? We don't use them for any other
SCM like git or svn, if we do that for hg, what will be included in th
checksum? Whole directory with hg checkout? Is it stable (e.g. doesn't
hg fetch everything and then checkout required revision like git does?)

I've included this patch in master-next, but now when I see that it's
fetched from hg I'll drop it.

> On 03/20/2015 03:20 PM, Rafa=EBl Carr=E9 wrote:
> > ---
> >  meta-oe/recipes-support/vim/vim_7.4.481.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >=20
> > diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb b/meta-oe/recip=
es-support/vim/vim_7.4.481.bb
> > index afdea84..ac59077 100644
> > --- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
> > +++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
> > @@ -10,6 +10,10 @@ SRC_URI =3D "hg://vim.googlecode.com/hg/;protocol=3D=
https;module=3Dvim \
> >             file://disable_acl_header_check.patch;patchdir=3D.. \
> >             file://vim-add-knob-whether-elf.h-are-checked.patch;patchdi=
r=3D.. \
> >  "
> > +
> > +SRC_URI[md5sum] =3D "5fd5d754581a673a25733c12367cf9d2"
> > +SRC_URI[sha256sum] =3D "e2cc416dabea503e9e5631afc21bb00dcbfb9d05481641=
b75f247fd89ff4d7e8"
> > +
> >  SRCREV =3D "v7-4-481"
> > =20
> >  S =3D "${WORKDIR}/vim/src"
> >=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--5FetH82qe0Z6y/zI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUO5eEACgkQN1Ujt2V2gByAUwCdGxqMpGabqHa4rXRMHUE5xk2U
PHYAoJ+yIoLgCVfVnvgUbhHvc42ZBsXm
=KouX
-----END PGP SIGNATURE-----

--5FetH82qe0Z6y/zI--
