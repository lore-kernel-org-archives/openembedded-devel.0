Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2C75C6B6C3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 09:07:15 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so3298829ead.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2013 02:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3IJO2NYrrY53b3yxVz2I+TfyCigGGZWgmiiy5HuZ8s0=;
	b=YPy+3yLclyWpqY2GN4GxIs/w/zRGwMH4WZC6L3/SOWk06tJm/50xDXRplJkRYDK40O
	dZp4ez3QSUf6bYHSP1/BT5cQcn8SxbHWMsSqooMorO9Q++T9QcbUH8NSyMuhZXBATYQs
	oYc8ExpB/9GRn6fTEySv8bPgfzmhEdGMuGhrLR8+ZMBAPmsgA8j4cDObse/OzmZ1XzcR
	tHYoVqncFeoPl++DtdVIWpgdChFCuk3q3Oh3GHqLB9IEMUPYmTkl2HUZZ8JTea4zePWh
	ouHVF4s3HkQjciWYPHk2lwqa+GtbV8ZUIDVIrTW8+vYr8I/TIvtQtdfYVdQ0FKTkmRZj
	F7dA==
X-Received: by 10.15.63.2 with SMTP id l2mr32090eex.93.1379495235948;
	Wed, 18 Sep 2013 02:07:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bn13sm1109559eeb.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Sep 2013 02:07:14 -0700 (PDT)
Date: Wed, 18 Sep 2013 11:08:51 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130918090851.GI7313@jama>
References: <1378978655-2635-1-git-send-email-mike.looijmans@topic.nl>
	<52394067.6040205@topic.nl>
MIME-Version: 1.0
In-Reply-To: <52394067.6040205@topic.nl>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe][PATCH] ntfs-3g-ntfsprogs does not rdepend on util-linux-mount
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
X-List-Received-Date: Wed, 18 Sep 2013 09:07:15 -0000
X-Groupsio-MsgNum: 46230
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VkVuOCYP9O7H3CXI"
Content-Disposition: inline

--VkVuOCYP9O7H3CXI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 18, 2013 at 07:55:51AM +0200, Mike Looijmans wrote:
> =EF=BB=BFPing!
>=20
> Anything wrong with the patch? anyone reading this at all?

Looks good to me (well you don't need the PR bump anymore).

Waiting for ACK from meta-filesystems maintainer..

CC +Hongxu

> BTW, the same problem is in the exfat recipe, so I was going to send a=20
> patch for that as well.
>=20
>=20
> On 09/12/2013 11:37 AM, Mike Looijmans wrote:
> > ntfs-3g-ntfsprogs has no runtime dependency on util-linux-mount, for
> > example busybox mount will also do just fine. It might be less useful
> > without any mount program, but that's not the same as depending on it.
> >
> > The dependency broke several images because util-linux-mount behaves
> > differently than busybox mount, resulting in failure to mount ext2/3
> > volumes and network shares on user's systems.
> >
> > Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> > ---
> >   .../ntfs-3g-ntfsprogs_2013.1.13.bb                 |    3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntf=
s-3g-ntfsprogs_2013.1.13.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-=
ntfsprogs/ntfs-3g-ntfsprogs_2013.1.13.bb
> > index e084187..a34a791 100644
> > --- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-nt=
fsprogs_2013.1.13.bb
> > +++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-nt=
fsprogs_2013.1.13.bb
> > @@ -5,6 +5,7 @@ PROVIDES =3D "ntfsprogs ntfs-3g"
> >   LICENSE =3D "GPLv2 & LGPLv2"
> >   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f=
9f6552 \
> >                       file://COPYING.LIB;md5=3Df30a9716ef3762e3467a2f62=
bf790f0a"
> > +PR =3D "r1"
> >
> >   SRC_URI =3D "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz"
> >   S =3D "${WORKDIR}/ntfs-3g_ntfsprogs-${PV}"
> > @@ -23,7 +24,7 @@ EXTRA_OEMAKE =3D "LDCONFIG=3Decho"
> >   PACKAGES =3D+ "ntfs-3g ntfsprogs libntfs-3g"
> >
> >   FILES_ntfs-3g =3D "${base_sbindir}/*.ntfs-3g ${bindir}/ntfs-3g* ${bas=
e_sbindir}/mount.ntfs"
> > -RDEPENDS_ntfs-3g +=3D "fuse util-linux-mount"
> > +RDEPENDS_ntfs-3g +=3D "fuse"
> >
> >   FILES_ntfsprogs =3D "${base_sbindir}/* ${bindir}/* ${sbindir}/*"
> >   FILES_libntfs-3g =3D "${libdir}/*${SOLIBS}"
> >
>=20
>=20
>=20
> Met vriendelijke groet / kind regards,
>=20
> Mike Looijmans
>=20
> TOPIC Embedded Systems
> Eindhovenseweg 32-C, NL-5683 KH Best
> Postbus 440, NL-5680 AK Best
> Telefoon: (+31) =E2=80=93 (0)499 - 33.69.79
> Telefax: (+31) - (0)499 - 33.69.70
> E-mail: mike.looijmans@topic.nl
> Website: www.topic.nl
>=20
> Dit e-mail bericht en de eventueel daarbij behorende bijlagen zijn uitslu=
itend bestemd voor de geadresseerde, zoals die blijkt uit het e-mail berich=
t en/of de bijlagen. Er kunnen gegevens met betrekking tot een derde instaa=
n. Indien u als niet-geadresseerde dit bericht en de bijlagen ontvangt, ter=
wijl u niet bevoegd of gemachtigd bent om dit bericht namens de geadresseer=
de te ontvangen, wordt u verzocht de afzender hierover direct te informeren=
 en het e-mail bericht met de bijlagen te vernietigen. Ieder gebruik van de=
 inhoud van het e-mail bericht, waaronder de daarbij behorende bijlagen, do=
or een ander dan de geadresseerde is onrechtmatig jegens ons dan wel de eve=
ntueel in het e-mail bericht of de bijlagen voorkomende andere personen. TO=
PIC Embedded Systems is niet aansprakelijk voor enigerlei schade voortvloei=
end uit het gebruik en/of acceptatie van dit e-mail bericht of de daarbij b=
ehorende bijlagen.
>=20
> The contents of this message, as well as any enclosures, are addressed pe=
rsonally to, and thus solely intended for the addressee. They may contain i=
nformation regarding a third party. A recipient who is neither the addresse=
e, nor empowered to receive this message on behalf of the addressee, is kin=
dly requested to immediately inform the sender of receipt, and to destroy t=
he message and the enclosures. Any use of the contents of this message and/=
or the enclosures by any other person than the addressee or person who is e=
mpowered to receive this message, is illegal towards the sender and/or the =
aforementioned third party. TOPIC Embedded Systems is not  liable for any d=
amage as a result of the use and/or acceptance of this message and as well =
as any enclosures.
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VkVuOCYP9O7H3CXI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI5baMACgkQN1Ujt2V2gByFEQCgn+Ffxi2wfpBi4rNUDuNOcEAo
3vUAnRKMEqnXFhpJBNNKMcgBIX1fyWK2
=Sufr
-----END PGP SIGNATURE-----

--VkVuOCYP9O7H3CXI--
