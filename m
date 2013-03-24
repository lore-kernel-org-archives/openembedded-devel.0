Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1UJfNZ-00029H-A4
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Mar 2013 08:30:45 +0100
Received: from mail106-co9-R.bigfish.com (10.236.132.228) by
	CO9EHSOBE007.bigfish.com (10.236.130.70) with Microsoft SMTP Server id
	14.1.225.23; Sun, 24 Mar 2013 06:12:43 +0000
Received: from mail106-co9 (localhost [127.0.0.1])	by
	mail106-co9-R.bigfish.com (Postfix) with ESMTP id 9D6443C01A9	for
	<openembedded-devel@lists.openembedded.org>;
	Sun, 24 Mar 2013 06:12:43 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -6
X-BigFish: VS-6(zz98dI9371I103dK542I1432Izz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz17326ah8275dh19a27bh8275bhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail106-co9 (localhost.localdomain [127.0.0.1]) by mail106-co9
	(MessageSwitch) id 1364105561930191_20265;
	Sun, 24 Mar 2013 06:12:41 +0000 (UTC)
Received: from CO9EHSMHS010.bigfish.com (unknown [10.236.132.237])	by
	mail106-co9.bigfish.com (Postfix) with ESMTP id E0CC83202E5	for
	<openembedded-devel@lists.openembedded.org>;
	Sun, 24 Mar 2013 06:12:41 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS010.bigfish.com
	(10.236.130.20) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Sun, 24 Mar 2013 06:12:41 +0000
Received: from 039-SN2MPN1-013.039d.mgd.msft.net ([169.254.3.50]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0328.011;
	Sun, 24 Mar 2013 06:12:40 +0000
From: Liu Ting-B28495 <B28495@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] lio-utils: initial add 4.1
Thread-Index: AQHOJt8/Czk+RU7tukWD34R4Gnlhr5i0X0AQ
Date: Sun, 24 Mar 2013 06:12:39 +0000
Message-ID: <AF604684617F454390621992F367F16901C6D024@039-SN2MPN1-013.039d.mgd.msft.net>
References: <1363160982-31939-1-git-send-email-b28495@freescale.com>
	<20130322092456.GQ3219@jama>
In-Reply-To: <20130322092456.GQ3219@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.185.78]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [meta-oe][PATCH] lio-utils: initial add 4.1
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
X-List-Received-Date: Sun, 24 Mar 2013 07:30:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Friday, March 22, 2013 5:25 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] lio-utils: initial add 4.1
>=20
> On Wed, Mar 13, 2013 at 03:49:42PM +0800, b28495@freescale.com wrote:
> > From: Ting Liu <b28495@freescale.com>
> >
> > lio-utils (lio-utils.git) provide a simple low-level configuration
> > tool set for the Target+iSCSI (LIO).
>=20
> Applied, thanks!
>=20

Not see it on the git tree yet :-)

> >
> > lio-utils use the configFS kernel API that is available with LIO,
> > which provides a clean interface for controlling the kernel level
> > Target engine and its fabric module subsystems.
> >
> > Signed-off-by: Ting Liu <b28495@freescale.com>
> > ---
> >  meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb |   59
> ++++++++++++++++++++
> >  1 files changed, 59 insertions(+), 0 deletions(-)  create mode 100644
> > meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
> >
> > diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
> > b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
> > new file mode 100644
> > index 0000000..bbedb78
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
> > @@ -0,0 +1,59 @@
> > +SUMMARY =3D "lio-utils"
> > +DESCRIPTION =3D "a simple low-level configuration tool set for the
> Target+iSCSI (LIO)"
> > +HOMEPAGE =3D "http://linux-iscsi.org/index.php/Lio-utils"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D
> "file://debian/copyright;md5=3Dc3ea231a32635cbb5debedf3e88aa3df"
> > +
> > +PV =3D "4.1+git${SRCPV}"
> > +
> > +SRC_URI =3D "git://risingtidesystems.com/lio-utils.git"
> > +SRCREV =3D "28bd928655bdc7bd3cf380f0196630690c51e05f"
> > +S =3D "${WORKDIR}/git"
> > +
> > +inherit distutils
> > +
> > +EXTRA_OEMAKE +=3D "DESTDIR=3D${D}"
> > +
> > +do_compile() {
> > +    cd ${S}/tcm-py
> > +    distutils_do_compile
> > +
> > +    cd ${S}/lio-py
> > +    distutils_do_compile
> > +
> > +    if test -d ${S}/tools; then
> > +        oe_runmake -C ${S}/tools
> > +    fi
> > +}
> > +
> > +do_install() {
> > +    cd ${S}/tcm-py
> > +    distutils_do_install
> > +
> > +    cd ${S}/lio-py
> > +    distutils_do_install
> > +
> > +    SITE_PACKAGES=3D${D}/${PYTHON_SITEPACKAGES_DIR}
> > +    install -d ${D}/${sbindir}
> > +    for var in tcm_node tcm_dump tcm_loop tcm_fabric lio_dump lio_node=
;
> do
> > +        if [ ! -h ${D}/${sbindir}/${var} ];then
> > +            chmod a+x ${SITE_PACKAGES}/${var}.py
> > +            ln -s ${PYTHON_SITEPACKAGES_DIR}/${var}.py
> ${D}/${sbindir}/${var}
> > +        fi
> > +    done
> > +
> > +    if test -d ${S}/tools; then
> > +        oe_runmake -C ${S}/tools install
> > +    fi
> > +
> > +    install -d ${D}/etc/target/
> > +    install -d ${D}/etc/init.d/
> > +    install -m 755 ${S}/scripts/rc.target ${D}/etc/init.d/
> > +    install -m 755 ${S}/conf/tcm_start.default
> ${D}/etc/target/tcm_start.sh
> > +    install -m 755 ${S}/conf/lio_start.default
> > +${D}/etc/target/lio_start.sh }
> > +
> > +RDEPENDS_${PN} +=3D "python-stringold python-subprocess python-shell \
> > +    python-datetime python-textutils python-crypt python-netclient
> python-email"
> > +
> > +FILES_${PN} +=3D "${sbindir}/* /etc/init.d/* /etc/target/*"
> > --
> > 1.7.3.4
> >
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



