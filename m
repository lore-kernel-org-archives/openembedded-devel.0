Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E18365D8B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Apr 2014 01:49:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3B1n99j014130
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Apr 2014 18:49:09 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.2.109]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0169.001;
	Thu, 10 Apr 2014 18:49:08 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] bonnie++: update to version 1.03e
Thread-Index: AQHPVJbdV/hxr8d9YUCZkm4yhXVuEZsLpw3A
Date: Fri, 11 Apr 2014 01:49:08 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AAB5BE36AE@ALA-MBA.corp.ad.wrs.com>
References: <1396938662-31887-1-git-send-email-jackie.huang@windriver.com>
	<20140410082826.GM2132@jama>
In-Reply-To: <20140410082826.GM2132@jama>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.135]
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] bonnie++: update to version 1.03e
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
X-List-Received-Date: Fri, 11 Apr 2014 01:49:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Martin Jansa
> Sent: Thursday, April 10, 2014 4:28 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] bonnie++: update to version 1.03e
>=20
> On Tue, Apr 08, 2014 at 02:31:02PM +0800, jackie.huang@windriver.com wrot=
e:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > Changes:
> > * use BPN in the file name in SRC_URI.
> > * install binaries in bindir and sbindir instead of base_bindir and bas=
e_sbindir.
>=20
> Please use -M when sending renames.

Ok, I will send v2 with -M option.

Thanks,
Jackie

>=20
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > ---
> >  meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb |   32 ------------=
--------
> >  meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb |   30 ++++++++++++=
++++++
> >  2 files changed, 30 insertions(+), 32 deletions(-)  delete mode
> > 100644 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
> >  create mode 100644 meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
> >
> > diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
> > b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
> > deleted file mode 100644
> > index bff0d72..0000000
> > --- a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03c.bb
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -SUMMARY =3D "Tests large file IO and creation/deletion of small files"
> > -HOMEPAGE =3D "http://www.coker.com.au/bonnie++/"
> > -LICENSE =3D "GPLv2"
> > -LIC_FILES_CHKSUM =3D "file://copyright.txt;md5=3Dcd4dde95a6b9d122f0a91=
50ae9cc3ee0"
> > -
> > -SRC_URI =3D "http://www.coker.com.au/bonnie++/bonnie++-${PV}.tgz \
> > -           file://gcc-4.3-fixes.patch \
> > -"
> > -SRC_URI[md5sum] =3D "77a1ba78f37bdd7f024b67e1e36ad151"
> > -SRC_URI[sha256sum] =3D "c674f1182f4c20f1e6d038feceb0a6617fc3e7658dfbba=
c89396043b49612a26"
> > -
> > -inherit autotools
> > -
> > -SCRIPTS =3D "bon_csv2html bon_csv2txt"
> > -EXES =3D "bonnie++ zcav"
> > -
> > -TARGET_CC_ARCH +=3D "${LDFLAGS}"
> > -
> > -do_install () {
> > -    install -d ${D}/bin
> > -    install -d ${D}/sbin
> > -    install -m 0755 ${EXES} ${D}/sbin
> > -    install -m 0755 ${SCRIPTS} ${D}/bin
> > -}
> > -
> > -PACKAGES =3D+ "bonnie-scripts"
> > -
> > -FILES_${PN} =3D "${base_sbindir}"
> > -FILES_bonnie-scripts =3D "${base_bindir}"
> > -
> > -
> > -
> > diff --git a/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
> > b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
> > new file mode 100644
> > index 0000000..b986823
> > --- /dev/null
> > +++ b/meta-oe/recipes-benchmark/bonnie/bonnie++_1.03e.bb
> > @@ -0,0 +1,30 @@
> > +SUMMARY =3D "Tests large file IO and creation/deletion of small files"
> > +HOMEPAGE =3D "http://www.coker.com.au/bonnie++/"
> > +SECTION =3D "benchmark/tests"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://copyright.txt;md5=3Dcd4dde95a6b9d122f0a91=
50ae9cc3ee0"
> > +
> > +SRC_URI =3D "http://www.coker.com.au/bonnie++/${BPN}-${PV}.tgz \
> > +           file://gcc-4.3-fixes.patch \ "
> > +SRC_URI[md5sum] =3D "750aa5b5051263a99c6c195888c74968"
> > +SRC_URI[sha256sum] =3D "cb3866116634bf65760b6806be4afa7e24a1cad6f145c8=
76df8721f01ba2e2cb"
> > +
> > +inherit autotools
> > +
> > +SCRIPTS =3D "bon_csv2html bon_csv2txt"
> > +EXES =3D "bonnie++ zcav"
> > +
> > +TARGET_CC_ARCH +=3D "${LDFLAGS}"
> > +
> > +do_install () {
> > +	install -d ${D}/${bindir}
> > +	install -d ${D}/${sbindir}
> > +	install -m 0755 ${EXES} ${D}/${sbindir}
> > +	install -m 0755 ${SCRIPTS} ${D}/${bindir} }
> > +
> > +PACKAGES =3D+ "bonnie-scripts"
> > +
> > +FILES_${PN} =3D "${sbindir}"
> > +FILES_bonnie-scripts =3D "${bindir}"
> > --
> > 1.7.9.5
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

