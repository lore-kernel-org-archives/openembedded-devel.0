Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8320E702A1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 15:49:53 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hi2so2792850wib.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 08:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Vi2wpTAuUrXM7Yf3RUHlBFglMx/jsgUdk4nrjvWjcJ0=;
	b=TuUkdHPaxtFCvy8RIeij/6gcDlCf5t62q+K8QNyiKtGiM2a7eA1PrNw3xoHrx3MjHV
	l4tTLxFcLnxsbWm3KLDKizBaMwR/lL79TnxGk25jEIdQJOnXZwLQy3kI7ClvION1EEUW
	eOGQR2z0XRpCabb1AOPzinUkUZq7uGj8LaCmrYbnJylpm5+w94vfNWrRgHUovJ+FgueB
	49DwgIiVsOm/cRD10ql+QweibGYV5xqq6SOPwQi213epnuSSDKCvmbRcNIXaGQdpn3E+
	nNArP3abYIKl2tDRebiFtmWCURXY25boIEdd0UbnIiH26p/XyZehoLWMoqHqU7DUQRwh
	otmA==
X-Received: by 10.180.89.131 with SMTP id bo3mr24951197wib.49.1405352994519;
	Mon, 14 Jul 2014 08:49:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ub11sm32532933wib.1.2014.07.14.08.49.53 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jul 2014 08:49:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 14 Jul 2014 17:50:02 +0200
To: Koen Kooi <koen.kooi@linaro.org>
Message-ID: <20140714155002.GI2433@jama>
References: <1405327294-4030-1-git-send-email-koen.kooi@linaro.org>
	<1405327294-4030-2-git-send-email-koen.kooi@linaro.org>
	<20140714145409.GH2433@jama>
	<CAP0W-R=vm-7K+fZM2bbAqcPuUN4ZOdjiXGp9qCDywWMO7J+LPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP0W-R=vm-7K+fZM2bbAqcPuUN4ZOdjiXGp9qCDywWMO7J+LPw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] libhugetlbfs: fix packaging
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
X-List-Received-Date: Mon, 14 Jul 2014 15:49:56 -0000
X-Groupsio-MsgNum: 50917
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="07FIeBX8hApXX6Bi"
Content-Disposition: inline

--07FIeBX8hApXX6Bi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2014 at 05:04:48PM +0200, Koen Kooi wrote:
> On 14 July 2014 16:54, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > On Mon, Jul 14, 2014 at 10:41:34AM +0200, Koen Kooi wrote:
> > > Libhugetlbs doesn't generate proper .so.X libs, only two .so files.
> > Package those in ${PN} and silence the resulting QA warning. This fixes:
> > >
> > >  ERROR: QA Issue: libhugetlbfs-tests rdepends on libhugetlbfs-dev
> > >
> > > Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> > > ---
> > >  meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb | 6 +++++-
> > >  1 file changed, 5 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.=
bb
> > b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > index af7ed3e..d3b64bf 100644
> > > --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
> > > @@ -25,6 +25,7 @@ COMPATIBLE_HOST =3D
> > "(x86_64|powerpc|powerpc64|aarch64).*-linux*"
> > >
> > >  LIBARGS =3D "LIB32=3D${baselib} LIB64=3D${baselib}"
> > >  EXTRA_OEMAKE =3D "'ARCH=3D${TARGET_ARCH}' 'OPT=3D${CFLAGS}' 'CC=3D${=
CC}'
> > ${LIBARGS} V=3D1"
> > > +PARALLEL_MAKE_pn-${PN} =3D ""
> >
> > Is _pn override really needed?
> >
>=20
> It isn't, I only moved the line without noticing the override. Do you want
> me to respin?

Please do, thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--07FIeBX8hApXX6Bi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPD/CoACgkQN1Ujt2V2gBzpRwCfVHJDsZiKgE3ufmXlfhYgL7fD
yOkAnjWgAxH/HqrZNT0R8lO5YNIxRvjT
=1Hbr
-----END PGP SIGNATURE-----

--07FIeBX8hApXX6Bi--
