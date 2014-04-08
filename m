Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2FC5E65D63
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 08:52:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s388qPEh001014
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 Apr 2014 01:52:25 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.109]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0169.001;
	Tue, 8 Apr 2014 01:52:25 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH 3/3] collectd: explicitly disable
	libsensors support
Thread-Index: AQHPUwSfghxBn6UKP0GRYE2eXugy/JsHaW8A
Date: Tue, 8 Apr 2014 08:52:25 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAB5BDE175@ALA-MBA.corp.ad.wrs.com>
References: <cover.1396941241.git.jackie.huang@windriver.com>
	<b9df73e738c282a73199a2d9361550aa259f1eb8.1396941241.git.jackie.huang@windriver.com>
	<5343B315.2070508@dominion.thruhere.net>
In-Reply-To: <5343B315.2070508@dominion.thruhere.net>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 3/3] collectd: explicitly disable libsensors support
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
X-List-Received-Date: Tue, 08 Apr 2014 08:52:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Koen Kooi
> Sent: Tuesday, April 08, 2014 4:28 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH 3/3] collectd: explicitly disable libse=
nsors support
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> jackie.huang@windriver.com schreef op 08-04-14 09:54:
> > From: Ming Liu <ming.liu@windriver.com>
> >
> > To avoid an implicit build result.
>=20
> Should this be a PACKAGECONFIG option?

Yeah, it make sense, I will change it to be a PACKAGECONFIG option, thanks!

Thanks,
Jackie

>=20
> >
> > Signed-off-by: Ming Liu <ming.liu@windriver.com> Signed-off-by: Jackie
> > Huang <jackie.huang@windriver.com> ---
> > .../recipes-extended/collectd/collectd_5.2.2.bb    |    1 + 1 file
> > changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb
> > b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb index
> > 4eed2b6..00010c7 100644 ---
> > a/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb +++
> > b/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb @@ -35,6 +35,7
> > @@ EXTRA_OECONF =3D " \ --disable-perl --with-libperl=3Dno
> > --with-perl-bindings=3Dno \
> > --with-libgcrypt=3D${STAGING_BINDIR_CROSS}/libgcrypt-config \
> > --disable-notify_desktop \ +                --with-libsensors=3Dno \ "
> >
> > do_install_append() {
> >
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>=20
> iD8DBQFTQ7MVMkyGM64RGpERAmj+AJ4rqJPUBZ4FIn97cJQZbe7N+dplBwCeJY3v
> vw+CKp3dZdL5QvuP/4jReao=3D
> =3DyGBZ
> -----END PGP SIGNATURE-----
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

