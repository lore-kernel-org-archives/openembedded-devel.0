Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 35B7B65E1B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 14:09:36 +0000 (UTC)
Received: by mail-wi0-f171.google.com with SMTP id hi2so5909429wib.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 07:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=LjtgfoMNOK1qyRuQl1PfYVKDJA+8toK4HnP1mGXkDbI=;
	b=TeeQv9EuifDbjoxz8ZWE377X8XaRxkVZhfWPA4UTeeuqb6ou89t5SYrYnA1t1/q6W+
	CIq0mFMi/KCMzpZ3Bg+ANjhKCRtHoLhaI0H1UQw0W8V3SIMjBmCZ1o3cvSjfhYfMZfJX
	gvDHuVMIY3tuPpwIUuvQQE4sfftX3XmHBiKUsSSCuDXEATiBDJ6OhZPzSsJbn1cvjLy+
	xwEG0+iMSUu0UE32bObcm/GRQXsKMrGS91cOxBKyAtHutHBJwMS4t/TbekRmmgqCaEdT
	pFjqqMkjwiAObUISLpiEhKtUmdtNlbJ6KM7iapjHic8Cg5xjq+e0JY6PTRzvty2m3HaG
	ukxw==
X-Received: by 10.180.75.49 with SMTP id z17mr32319975wiv.80.1407852577646;
	Tue, 12 Aug 2014 07:09:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	u10sm56639246wix.14.2014.08.12.07.09.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Aug 2014 07:09:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 12 Aug 2014 16:10:13 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140812141013.GP14848@jama>
References: <1407826864-32606-1-git-send-email-rongqing.li@windriver.com>
	<20140812115132.GK14848@jama>
	<2509223.ytjg6V1x30@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <2509223.ytjg6V1x30@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][meta-networking] ifenslave: add recipes
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
X-List-Received-Date: Tue, 12 Aug 2014 14:09:43 -0000
X-Groupsio-MsgNum: 51635
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jIondxHzhZPVGMQ8"
Content-Disposition: inline

--jIondxHzhZPVGMQ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2014 at 02:55:32PM +0100, Paul Eggleton wrote:
> On Tuesday 12 August 2014 13:51:32 Martin Jansa wrote:
> > On Tue, Aug 12, 2014 at 03:01:04PM +0800, rongqing.li@windriver.com wro=
te:
> > > From: Roy Li <rongqing.li@windriver.com>
> > >=20
> > > Signed-off-by: Roy Li <rongqing.li@windriver.com>
> > > ---
> > >=20
> > >  .../recipes-support/ifenslave/ifenslave_1.1.0.bb    |   19
> > >  +++++++++++++++++++ 1 file changed, 19 insertions(+)
> > >  create mode 100644
> > >  meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb>=20
> > > diff --git a/meta-networking/recipes-support/ifenslave/ifenslave_1.1.=
0.bb
> > > b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb new fi=
le
> > > mode 100644
> > > index 0000000..d6252a9
> > > --- /dev/null
> > > +++ b/meta-networking/recipes-support/ifenslave/ifenslave_1.1.0.bb
> > > @@ -0,0 +1,19 @@
> > > +SUMMARY =3D "Configure network interfaces for parallel routing"
> >=20
> > ^ dropped in master-next
> >=20
> > > +DESCRIPTION =3D "Configure network interfaces for parallel routing"
>=20
> I guess you meant DESCRIPTION (which is the same as SUMMARY) was dropped.
>=20
> > > +HOMEPAGE =3D
> > > "http://www.linuxfoundation.org/collaborate/workgroups/networking/bon=
ding
> > > " +SECTION =3D "network"
> > > +LICENSE =3D "GPLv2"
> > > +
> > > +SRC_URI =3D
> > > "http://ftp.debian.org/debian/pool/main/i/${BPN}-2.6/${BPN}-2.6_${PV}=
=2Eori
> > > g.tar.gz" +
> > > +do_compile() {
> > > +    ${CC} ifenslave.c -o ifenslave
> > > +}
> > > +do_install() {
> > > +    install -d "${D}${sbindir}"
> > > +    install -m 755 "${S}/ifenslave" "${D}${sbindir}/"
> > > +}
> > > +
> >=20
> > ^ moved next to LICENSE in master-next
> >=20
> > > +LIC_FILES_CHKSUM =3D
> > > "file://ifenslave.c;beginline=3D8;endline=3D12;md5=3Da9f0bd2324cdc1b3=
6d1f44f0e6
> > > 43a62a" +SRC_URI[md5sum] =3D "56126cd1013cefe0ce6f81613e677bdd"
>=20
> Ditto here, LIC_FILES_CHKSUM was moved, right?

Right for both of them, for some reason, my vim/screen got confused and
all my edits were shown on different line, sorry for confusion.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jIondxHzhZPVGMQ8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPqIEUACgkQN1Ujt2V2gByOAQCfbhQKKtqLSkLXNIQWaUmfZv/7
eYMAoJ51BqKwxt4XPbV7244gdKfDzJKs
=TunT
-----END PGP SIGNATURE-----

--jIondxHzhZPVGMQ8--
