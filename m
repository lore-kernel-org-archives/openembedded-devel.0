Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1R0ugd-0002ww-IT
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 14:23:31 +0200
Received: from nat-dem.mentorg.com ([195.212.93.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1R0ubn-0002JJ-P7 from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Sep 2011 05:18:31 -0700
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 6 Sep 2011 14:18:25 +0200
Message-ID: <989A078976CDAD4CB2DC976EEF70E2A506BAB26C@eu2-mail.mgc.mentorg.com>
In-Reply-To: <CACVrrM=sjt0b0Fn1bP-L2rbpZ8rFXRH3ACb=zPwuSh5R-AB-Aw@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [oe] [meta-oe][PATCH v2 1/1] python-lxml: Add version 2.2.8
	(initial recipe)
Thread-Index: Acxr/R6Gxji5zzLiRq2HgKHfE1TkRAAkcR8g
References: <noor_ahsan@mentor.com><c0474b5644b7bdf87555b5aaba317d4288e0c6fc.1315235172.git.noor_ahsan@mentor.com>
	<CACVrrM=sjt0b0Fn1bP-L2rbpZ8rFXRH3ACb=zPwuSh5R-AB-Aw@mail.gmail.com>
From: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2 1/1] python-lxml: Add version 2.2.8 (initial recipe)
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
X-List-Received-Date: Tue, 06 Sep 2011 12:23:31 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf =
Of
> Michael Lippautz
> Sent: Monday, September 05, 2011 11:53 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH v2 1/1] python-lxml: Add version
> 2.2.8 (initial recipe)
>=20
> I probably missed the initial submission of this patch (sorry for
> this), but...
>=20
> 2011/9/5 Noor, Ahsan <noor_ahsan@mentor.com>:
> > From: Noor Ahsan <noor_ahsan@mentor.com>
> >
> > * Imported from oe.dev commit id
> bc6a94559157e6fcc190a22a259c0f757b8664ae.
> > * Tested with MACHINE =3D 'qemuppc'
> >
> > Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> > Reviewed-by: Paul Menzel <paulepanter@users.sourceforge.net>
> > ---
> > =A0.../recipes-devtools/python/python-lxml_2.2.8.bb =A0 | =A0 32
> ++++++++++++++++++++
> > =A01 files changed, 32 insertions(+), 0 deletions(-)
> > =A0create mode 100644 meta-oe/recipes-devtools/python/python-
> lxml_2.2.8.bb
> >
> > diff --git a/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
> b/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
> > new file mode 100644
> > index 0000000..b1aac3f
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/python/python-lxml_2.2.8.bb
> > @@ -0,0 +1,32 @@
> > +DESCRIPTION =3D "Powerful and Pythonic XML processing library
> combining \
> > +libxml2/libxslt with the ElementTree API."
> > +HOMEPAGE =3D "http://codespeak.net/lxml"
> > +LICENSE =3D "BSD"
> > +LIC_FILES_CHKSUM =3D
> "file://LICENSES.txt;md5=3D7de92baeb3b7bfaebe72404155fdb346"
> > +SRCNAME =3D "lxml"
> > +
> > +DEPENDS =3D "libxml2 libxslt"
> > +RDEPENDS_${PN} +=3D "libxml2 libxslt python-compression"
> > +
> > +SRC_URI =3D
> "http://pypi.python.org/packages/source/l/${SRCNAME}/${SRCNAME}-
> ${PV}.tar.gz;name=3Dlxml"
> > +SRC_URI[lxml.md5sum] =3D "d6c612d63a84d79440912a1b29d3b981"
> > +SRC_URI[lxml.sha256sum] =3D
> "89b73925b5e3295dcf4675cb948007a20eb029fe35c9a162ae19ec11f1abafe5"
> > +
> > +S =3D "${WORKDIR}/${SRCNAME}-${PV}"
> > +
> > +inherit setuptools
> > +
> > +DISTUTILS_BUILD_ARGS +=3D " \
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --with-xslt-
> config=3D'${STAGING_BINDIR_NATIVE}/pkg-config libxslt' \
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --with-xml2-
> config=3D'${STAGING_BINDIR_NATIVE}/xml2-config' \
> > +"
>=20
> Shouldn't this be STAGING_BINDIR_CROSS? BINDIR_NATIVE usually refers
> to native libs and linking against them using setuptools may fail
> (kind of) silently.
>=20
> > +
> > +DISTUTILS_INSTALL_ARGS +=3D " \
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --with-xslt-
> config=3D'${STAGING_BINDIR_NATIVE}/pkg-config libxslt' \
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --with-xml2-
> config=3D'${STAGING_BINDIR_NATIVE}/xml2-config' \
> > +"
>=20
> Same here.


I have incorporated this change in new patch.

>=20
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
>=20
> I don't know about native then. Basically one would have to
> switch/create a 2nd recipe?

Yes this is basically to use same recipe for native package building.

>=20
> > +RDEPENDS_${PN}_virtclass-native =3D "libxml2-native libxslt-native"
> > +
> > +
> > --
> > 1.7.0.4
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> devel
> >
>=20
> Regards,
>   Michael
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


