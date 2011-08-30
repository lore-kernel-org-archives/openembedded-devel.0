Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1QyNVw-0002eM-Bv
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 14:34:00 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1QyNRE-0003G3-95 from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 05:29:08 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 30 Aug 2011 14:29:05 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A5068A595D@eu2-mail.mgc.mentorg.com>
In-Reply-To: <j3iio6$u5s$1@dough.gmane.org>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [meta-oe][PATCH 1/3] bonnie++: Add version 1.03c (initial
	recipe)
Thread-Index: AcxnCw2CZcF8HwU+Qmq6fgycRGjR7QABNGog
References: <cover.1314691875.git.noor_ahsan@mentor.com><ef49be97f8e75115c1b001694f676f52a53a70c6.1314691875.git.noor_ahsan@mentor.com>
	<j3iio6$u5s$1@dough.gmane.org>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] bonnie++: Add version 1.03c (initial recipe)
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
X-List-Received-Date: Tue, 30 Aug 2011 12:34:00 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
Of
> Koen Kooi
> Sent: Tuesday, August 30, 2011 4:49 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH 1/3] bonnie++: Add version 1.03c
> (initial recipe)
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 30-08-11 12:58, Noor, Ahsan schreef:
> > From: Noor Ahsan <noor_ahsan@mentor.com>
> >
> > * Imported from oe.dev commit id
> 44985d56bc556786812a0a02d6219afd31a7381d. * Merge .bb and .inc file.
> >
> > Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com> --- meta-
> oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb |   30
> ++++++++++++++++++++ .../bonnie/files/gcc-4.3-fixes.patch
> |   19 ++++++++++++ 2 files changed, 49 insertions(+), 0 deletions(-)
> create mode 100644
> > meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb create mode
100644
> meta-oe/recipes-benchmark/bonnie/files/gcc-4.3-fixes.patch
> >
> > diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
> b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb new file mode
> 100644 index 0000000..2067307 --- /dev/null +++ b/meta-oe/recipes-
> benchmark/bonnie/bonnie++_1.03c.bb @@ -0,0 +1,30 @@ +DESCRIPTION =3D
> "Tests large file IO and
> > creation/deletion of small files." +HOMEPAGE =3D
> "http://www.coker.com.au/bonnie++/" +LICENSE =3D "GPL v2"
>=20
> without spaces please
>=20
> > +LIC_FILES_CHKSUM =3D
> "file://copyright.txt;md5=3Dcd4dde95a6b9d122f0a9150ae9cc3ee0" + =
+SRC_URI
> =3D "http://www.coker.com.au/bonnie++/bonnie++-${PV}.tgz \ +
> file://gcc-4.3-fixes.patch \ +           " +SRC_URI[md5sum] =3D
> "77a1ba78f37bdd7f024b67e1e36ad151" +SRC_URI[sha256sum] =3D
> > "c674f1182f4c20f1e6d038feceb0a6617fc3e7658dfbbac89396043b49612a26" +
> +SCRIPTS =3D "bon_csv2html bon_csv2txt" +EXES =3D "bonnie++ zcav"
>=20
> And move those 2 below the inherit line please.
>=20
> > + +inherit autotools + +do_install () { +        install -d ${D}/bin
> +        install -d ${D}/sbin +        install -m 0755 ${EXES}
> ${D}/sbin +        install -m 0755 ${SCRIPTS} ${D}/bin +} + +PACKAGES
> +=3D "bonnie-scripts" + +FILES_${PN} =3D "/sbin" +FILES_bonnie-
> scripts=3D"/bin" + +TARGET_CC_ARCH
> > +=3D "${LDFLAGS}"
>=20
> and move this one above do_install please. The general idea is to
group
> them by usage and TARGET_CC_ARCH is a configure/compile thing.
>=20
>=20
> regards,
>=20
> Koen


Hi,

The recipe is verified on oe-styliz.py script and the formatting is done
by that script. Your recommendations are conflicting with oe-stylize.
Kindly update oe-stylize according to your recommendation so that it
give output according to your expectations.

Thanks.

Regards,
Noor


