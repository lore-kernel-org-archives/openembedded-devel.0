Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E29DF7037D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 09:24:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6F9OtrO008056
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Jul 2014 02:24:55 -0700 (PDT)
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.241]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0174.001;
	Tue, 15 Jul 2014 02:24:55 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "Li, Rongqing" <Rongqing.Li@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH][meta-oe] memstat: add memstat recipe
Thread-Index: AQHPoAldf35QkGU1jUyB18xT0hvDWJug3Paw
Date: Tue, 15 Jul 2014 09:24:54 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AABCA851B4@ALA-MBB.corp.ad.wrs.com>
References: <1404809042-10815-1-git-send-email-rongqing.li@windriver.com>
	<53BCAFF5.6080901@windriver.com>
	<8672BB614B4CCA40A6B3BDD6FD82050BA8B274A6@COSNADEXC13.usr.ingenico.loc>
	<53C4EA8C.9060308@windriver.com>
In-Reply-To: <53C4EA8C.9060308@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.143]
MIME-Version: 1.0
Subject: Re: [PATCH][meta-oe] memstat: add memstat recipe
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
X-List-Received-Date: Tue, 15 Jul 2014 09:25:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>=20
>=20
>=20
> On 07/15/2014 04:44 PM, Matthieu CRAPET wrote:
> > Hi,
> >
> > A manpage is included in the sources but not installed. This would be n=
ice to package it.

Sure, it make senses, I will add it and send v2.

Thanks,
Jackie

> >
> > Regards,
> > Matthieu
>=20
>=20
> Cc: HuangJie
>=20
> -Roy
> >
> >
> > -----Message d'origine-----
> > De : openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] De la part
> > de Rongqing Li Envoy=E9 : mercredi 9 juillet 2014 04:59 =C0 :
> > openembedded-devel@lists.openembedded.org
> > Objet : Re: [oe] [PATCH][meta-oe] memstat: add memstat recipe
> >
> > Drop this patch, HuangJ has sent out a similar patch
> >
> > -Roy
> >
> > On 07/08/2014 04:44 PM, rongqing.li@windriver.com wrote:
> >> From: Roy Li <rongqing.li@windriver.com>
> >>
> >> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> >> ---
> >>    meta-oe/recipes-devtools/memstat/memstat_1.0.bb |   24 ++++++++++++=
+++++++++++
> >>    1 file changed, 24 insertions(+)
> >>    create mode 100644 meta-oe/recipes-devtools/memstat/memstat_1.0.bb
> >>
> >> diff --git a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
> >> b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
> >> new file mode 100644
> >> index 0000000..8c8882e
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
> >> @@ -0,0 +1,24 @@
> >> +SUMMARY =3D "Display virtual memory allocation"
> >> +DESCRIPTION =3D "Lists all the processes, executables, and shared
> >> +libraries \ that are using up virtual memory. It's helpful to see
> >> +how the shared memory \ is used and which 'old' libs are loaded. "
> >> +HOMEPAGE =3D "http://memstattool.sourceforge.net/"
> >> +SECTION =3D "devtool"
> >> +
> >> +LICENSE =3D "GPLv2"
> >> +
> >> +S =3D "${WORKDIR}/memstattool"
> >> +
> >> +LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3D87be186443b1ac2cf=
a466f475e1ee0cb"
> >> +
> >> +SRC_URI =3D "http://sourceforge.net/projects/memstattool/files/${BPN}=
_${PV}.tar.gz \
> >> +          "
> >> +SRC_URI[md5sum] =3D "2c3acc0c62b2a18f6601b84e54aa7462"
> >> +SRC_URI[sha256sum] =3D
> "245d5fc7fb87bcfd14486cd34917cae2856e799559ac568434af12c4852bce94"
> >> +
> >> +do_install_append(){
> >> +    install -d ${D}${bindir}
> >> +    install -m 0755 memstat ${D}${bindir}
> >> +    install -d ${D}/etc
> >> +    install -m 0755 memstat.conf ${D}/etc }
> >>
> >
> > --
> > Best Reagrds,
> > Roy | RongQing Li
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
>=20
> --
> Best Reagrds,
> Roy | RongQing Li

