Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7347B72532
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 19:27:17 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id l15so22852981wiw.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 11:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gC7W4ABujL4njr/lLdavHVXNeDKq60ZVpJDUpMMG6d4=;
	b=EljHh2bGMb7yCXaH+QPRbTqQ5AakSEhNEEob1gkZZ89qoCPDO37qdFeCbhGR0UMx02
	AEpMEaOHEXBt6rz1ktKX08xZtMygukTX9BaBHfhWqmR+K5SPpI9ieP7pH7l1KJ4z/OJG
	V+AOZLxBw2yoIGvP/w5jkluJ6fYbS0x9jFeT3QczhWOwJLmZU7Cb2QFDtJ1fKLq2cKSO
	7XMX/IVJlObqrKlsJsOCuJHyGUOgcB3Qr+TCC9PijsDT18bV6srJlrEK6z6Xfb9qejpY
	skyourm6Vyb9wnnwLRh0+gU4ycEWJ3AXwSMmlofMxTwG/8Ip9VZGNN/1BpVvWZkCZTTd
	zXHw==
X-Received: by 10.194.94.1 with SMTP id cy1mr93742443wjb.127.1419881238236;
	Mon, 29 Dec 2014 11:27:18 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	cg8sm48977239wjc.1.2014.12.29.11.27.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Dec 2014 11:27:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 29 Dec 2014 20:27:27 +0100
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Message-ID: <20141229192727.GN2465@jama>
References: <BLU437-SMTP103211CFEBAA0286655746D6560@phx.gbl>
	<CAL0pqZ3JaOtsf7O3949Covz+eML93WWyHG4YkNZY+NkXA60XYg@mail.gmail.com>
	<20141229185352.GM2465@jama> <20141229185920.GA4672@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20141229185920.GA4672@mentor.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH v2] cyassl: add version 3.3.0, remove version 3.1.0
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
X-List-Received-Date: Mon, 29 Dec 2014 19:27:23 -0000
X-Groupsio-MsgNum: 53512
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v9g2r9e2kvGs7M7R"
Content-Disposition: inline

--v9g2r9e2kvGs7M7R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2014 at 01:59:21PM -0500, Joe MacDonald wrote:
> Hey Martin,
>=20
> [Re: [oe] [meta-networking][PATCH v2] cyassl: add version 3.3.0, remove v=
ersion 3.1.0] On 14.12.29 (Mon 19:53) Martin Jansa wrote:
>=20
> > On Mon, Dec 29, 2014 at 11:50:30AM -0700, Leah wrote:
> > > I was just wondering if this commit was recieved and/or approved?
> >=20
> > Received and not yet approved, look at master-next branch.
>=20
> I generally try to send out a message when I merge anything to
> master-next so as to let the submitter know it's been merged.  I do seem
> to be in the minority, but if possible it would also help me out if you
> could send an ack when you merge something for meta-networking into
> master so I know I can remove it from my working queue.  That usually
> only pops up when I've been offline for a few weeks, but it would really
> help with managing the mail queue.

You mean when you merge it to master not master-next, right? I usually
merge meta-networking changes to master-next only to include them in
next jenkins build and then leave them to you to merge them to master
when you want (unless I'm reporting build failures caused by them).

All merges to master-next are indicated by master-next bundle on
patchwork (and Archived status)
http://www.openembedded.org/wiki/Patchwork#Multiple_layers_sharing_the_same=
_oe_project_on_patchwork

I would like more people updating status of their patches on patchwork,
that includes you marking merged meta-networking patches. After updating
6 cyassl patches on patchwork I don't want to also send another batch of
e-mails for the amount of patches going into meta-oe, meta-smartphone,
meta-qt5 repos.

Regards,

> > > On Mon, Dec 22, 2014 at 2:29 PM, lchristina26 <lchristina26@hotmail.c=
om>
> > > wrote:
> > >=20
> > > > Signed-off-by: Leah <lchristina26@hotmail.com>
> > > > ---
> > > >  .../cyassl/{cyassl_3.1.0.bb =3D> cyassl_3.3.0.bb}                 =
   | 7
> > > > ++++---
> > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > >  rename meta-networking/recipes-connectivity/cyassl/{cyassl_3.1.0.b=
b =3D>
> > > > cyassl_3.3.0.bb} (74%)
> > > >
> > > > diff --git a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1=
=2E0.bb
> > > > b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> > > > similarity index 74%
> > > > rename from meta-networking/recipes-connectivity/cyassl/cyassl_3.1.=
0.bb
> > > > rename to meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.=
bb
> > > > index e3edab6..b6f852d 100644
> > > > --- a/meta-networking/recipes-connectivity/cyassl/cyassl_3.1.0.bb
> > > > +++ b/meta-networking/recipes-connectivity/cyassl/cyassl_3.3.0.bb
> > > > @@ -1,4 +1,4 @@
> > > > -SUMMARY =3D "CyaSSL Embedded SSL Library"
> > > > +SUMMARY =3D "CyaSSL Lightweight, Embedded SSL Library"
> > > >  DESCRIPTION =3D "CyaSSL is a lightweight SSL library written in C =
and \
> > > >                 optimized for embedded and RTOS environments. It ca=
n be \
> > > >                 Up to 20 times smaller than OpenSSL while still sup=
porting
> > > > \
> > > > @@ -11,7 +11,8 @@ LIC_FILES_CHKSUM =3D
> > > > "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> > > >
> > > >  SRC_URI =3D "http://www.yassl.com/${BP}.zip"
> > > >
> > > > -SRC_URI[md5sum] =3D "72477eb50697e759d309c49cb1aef18a"
> > > > -SRC_URI[sha256sum] =3D
> > > > "85a79009d2a7468910dfb1e4b975e0b00a42c695f4f1a2adc16d2507b5d0b03e"
> > > > +SRC_URI[md5sum] =3D "0303eb0f2f9065a1207d9104ab0eba7c"
> > > > +SRC_URI[sha256sum] =3D
> > > > "e51583ea1e4d64537553922d67a96360312811dffef58d4c05506aa98a296fe3"
> > > >
> > > >  inherit autotools
> > > > +
> > > > --
> > > > 1.9.1
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > >
> > > >
> > >=20
> > >=20
> > > --=20
> > >=20
> > > Leah Thompson
> > > www.wolfssl.com
> > > leah@wolfssl.com
> > > 406-570-1389
> > > Skype: lchristina26
> > > --=20
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> --=20
> -Joe MacDonald.
> :wq



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--v9g2r9e2kvGs7M7R
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlShqx8ACgkQN1Ujt2V2gBz9qQCgj7PD/JUvth7agpntbRSmpDhV
/LMAoJkFAR/IbLPTNcAYYtYPHtn0cLjW
=eJys
-----END PGP SIGNATURE-----

--v9g2r9e2kvGs7M7R--
