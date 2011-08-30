Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QyPGx-0006ke-Nz
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 16:26:39 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QyPCF-000471-9S from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 07:21:47 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 30 Aug 2011 16:21:44 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A5068A5992@eu2-mail.mgc.mentorg.com>
In-Reply-To: <j3ip7m$dn9$1@dough.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [meta-oe][PATCH 1/1] debianutils: Add version 2.30 (initial
	recipe)
Thread-Index: AcxnGmt99Dfp0yVzSEGwYcP4iOBi5wABaf2A
References: <cover.1314710438.git.noor_ahsan@mentor.com><6fd3391284356229f914262016ff77276d88f054.1314710438.git.noor_ahsan@mentor.com>
	<j3ip7m$dn9$1@dough.gmane.org>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] debianutils: Add version 2.30 (initial recipe)
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
X-List-Received-Date: Tue, 30 Aug 2011 14:26:40 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
Of
> Koen Kooi
> Sent: Tuesday, August 30, 2011 6:40 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH 1/1] debianutils: Add version 2.30
> (initial recipe)
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 30-08-11 15:24, Noor, Ahsan schreef:
> > From: Noor Ahsan <noor_ahsan@mentor.com>
> >
> > * Imported from oe.dev commit id
> 280a17bc1d8132f97cf6a89b8bc08a32380fa357. * Merged .bb and .inc file
> >
> > Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com> ---
> .../debianutils/debianutils_2.30.bb                |   49
> ++++++++++++++++++++
>=20
> > +pkg_prerm_${PN} () { +for app in add-shell  installkernel  mkboot
> remove-shell run-parts  savelog  sensible-browser  sensible-editor
> sensible-pager  tempfile  which ; do +   update-alternatives --remove
> $app $app.${PN} +done +} + +pkg_postinst_${PN} () { +#!/bin/sh +for
app
> in add-shell
> > installkernel  mkboot  remove-shell ; do +    update-alternatives --
> install ${sbindir}/$app $app $app.${PN} 100 +done +for app in savelog
> sensible-browser  sensible-editor  sensible-pager  which ; do +
> update-alternatives --install ${bindir}/$app $app $app.${PN} 100 +done
> +for app in
> > run-parts  tempfile ; do +    update-alternatives --install
> ${base_bindir}/$app $app $app.${PN} 100 +done +}
>=20
> The *insts are inconsistent, one has a shebang, the other doesn't and
> neither are safe to use in a cross environment.

Koen BTW this is directly coming from oe.dev.

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFOXOg2MkyGM64RGpERAjJ9AJ49QdImds18J3+35yKjLGJnKq/WzQCeJmGa
> U0+Ri3DkNyu52JW5LJ9+QcU=3D
> =3Dl6E5
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


