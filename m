Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id E5B486064D
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Sep 2013 13:35:18 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id d10so2553969eaj.26
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Sep 2013 06:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JP7ZIJGTnrxmrbrB2Gf/WiYEM25ICSGLpdyKw9DXft0=;
	b=gi+5ZUW/ggoEEYa6ydlKkYac/sHApeLK5vv3Z70Udf+QoQdFSqAzI4jWU+J5bBZJ7W
	rTMU+Fr1Y2q3wpSQK9BoxXjsVL5f8xFJOK85lOWDShMyzlA9tqOdXIKLN9a5635tLukQ
	QImHEpbrb232aFN9HB+275ZCfZ6hpYtbtKfQ5XCtl+PkKQJ0cfkrJFXqJUqB30IAe+VP
	NzQJFn/ay7Dzey+7PAsJcFZs7zQkkYK7GHjyxHJMK8njWkqP6F8Fuo1bvzFQqXR0RzLw
	Ee/40U6FqNp5+WEhB/mDf3zDqb6jS1jw+PTcmtcmOj6TmHwZS57YI68BBLsmpuy3J+Uv
	OKlg==
X-Received: by 10.15.33.132 with SMTP id c4mr22081437eev.2.1378647320060;
	Sun, 08 Sep 2013 06:35:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p5sm13597665eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 08 Sep 2013 06:35:19 -0700 (PDT)
Date: Sun, 8 Sep 2013 15:36:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130908133642.GN11500@jama>
References: <1378235089-5251-1-git-send-email-pab@pabigot.com>
	<522C744B.6000809@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <522C744B.6000809@pabigot.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] vim: workaround nawk dependency problem with RPM
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
X-List-Received-Date: Sun, 08 Sep 2013 13:35:20 -0000
X-Groupsio-MsgNum: 46127
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fz0LNKsoEivY4NpG"
Content-Disposition: inline

--fz0LNKsoEivY4NpG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 08, 2013 at 07:57:47AM -0500, Peter A. Bigot wrote:
> Ping?  I see this is marked as New, Archived in patchwork so it doesn't=
=20
> show up for merge, but can't tell how it got archived.  Is there=20
> something wrong with it?

It's in jansa/in-test bundle, see
http://www.openembedded.org/wiki/Patchwork#Multiple_layers_sharing_the_same=
_oe_project_on_patchwork

>=20
> On 09/03/2013 02:04 PM, Peter A. Bigot wrote:
> > One of the examples has a #!/usr/bin/nawk which tells RPM to add that a=
s a
> > dep, which we don't want.
> >
> > Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> > ---
> >   meta-oe/recipes-support/vim/vim.inc | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-support/vim/vim.inc b/meta-oe/recipes-supp=
ort/vim/vim.inc
> > index d7336c2..991ba74 100644
> > --- a/meta-oe/recipes-support/vim/vim.inc
> > +++ b/meta-oe/recipes-support/vim/vim.inc
> > @@ -54,8 +54,9 @@ EXTRA_OECONF =3D " \
> >   "
> >  =20
> >   do_install_append() {
> > -    # Work around rpm picking up csh as a dep
> > +    # Work around rpm picking up csh or awk as a dep
> >       chmod -x ${D}${datadir}/${PN}/${VIMDIR}/tools/vim132
> > +    chmod -x ${D}${datadir}/${PN}/${VIMDIR}/tools/mve.awk
> >  =20
> >       # Install example vimrc from runtime files
> >       install -m 0644 ../runtime/vimrc_example.vim ${D}/${datadir}/${PN=
}/vimrc
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fz0LNKsoEivY4NpG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIsfWoACgkQN1Ujt2V2gBzULwCgnXWmFC95w8blyzqje6jzbgnt
DWoAnjEPY8O+2/mSle4fLagdMmCSuu0c
=3CCI
-----END PGP SIGNATURE-----

--fz0LNKsoEivY4NpG--
