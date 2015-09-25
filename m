Return-Path: <zhenhua.luo@freescale.com>
X-Greylist: delayed 1971 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 25 Sep 2015 10:36:17 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0135.outbound.protection.outlook.com [65.55.169.135])
	by mail.openembedded.org (Postfix) with ESMTP id 5650376FF2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Sep 2015 10:36:17 +0000 (UTC)
Received: from BN3PR03MB1367.namprd03.prod.outlook.com (10.163.34.153) by
	BN3PR03MB1367.namprd03.prod.outlook.com (10.163.34.153) with Microsoft
	SMTP Server (TLS) id 15.1.274.16; Fri, 25 Sep 2015 10:03:25 +0000
Received: from BN3PR03MB1367.namprd03.prod.outlook.com ([10.163.34.153]) by
	BN3PR03MB1367.namprd03.prod.outlook.com ([10.163.34.153]) with mapi id
	15.01.0274.009; Fri, 25 Sep 2015 10:03:25 +0000
From: Luo Zhenhua <zhenhua.luo@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] lvm2: make sure services files are
	installed in systemd_unitdir folder
Thread-Index: AQHQ9SqtFF0CLcL4oEG4xX5m8yRyt55IclcAgASWGXA=
Date: Fri, 25 Sep 2015 10:03:25 +0000
Message-ID: <BN3PR03MB1367BD89BEE9B39B9515287EE4420@BN3PR03MB1367.namprd03.prod.outlook.com>
References: <1442921963-19530-1-git-send-email-zhenhua.luo@freescale.com>
	<CAEGpDuYv+=n3HZFDSh2drU4EBH7pt_O2WkvvCftqA45ASzWTpA@mail.gmail.com>
In-Reply-To: <CAEGpDuYv+=n3HZFDSh2drU4EBH7pt_O2WkvvCftqA45ASzWTpA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=zhenhua.luo@freescale.com; 
x-originating-ip: [199.59.225.131]
x-microsoft-exchange-diagnostics: 1; BN3PR03MB1367;
	5:8qu7e9jQ39VXF5p4DFTzEdDiG6TL2wVIVv/Rc2KA/1mKgDDNVM8aNWZhutfXPXwQJysEe+FEztK2gfMXPiLyw6XM9WuBtiO0rw7DJUMjfk0mtzsfZUsixZVJi7/lRpREgem6PXptZFfYXUvY0kMOeg==;
	24:9POf4FPIv8EBkHSKvfX8/yL656EycAWb/nEBTNsPn1VIt/2cQivC7tAMclhyydHacg//Y79vypRMrKr6lgviUmjwpxBd09kV+3evUEikv3U=;
	20:0fxULQGMxk9AVLKGVTjrlKRBp9LvuEviZKLxYwYJpkKE5H+9Y86WZpo6m4CS8KJWm/SEQ+TLuLGBERvuiGxYsA==
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR03MB1367;
x-microsoft-antispam-prvs: <BN3PR03MB1367C16979C6CFBEACFF328FE4420@BN3PR03MB1367.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(520078)(3002001);
	SRVR:BN3PR03MB1367; BCL:0; PCL:0; RULEID:; SRVR:BN3PR03MB1367; 
x-forefront-prvs: 07106EF9B9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(377424004)(164054003)(199003)(13464003)(377454003)(76576001)(5001960100002)(2950100001)(97736004)(81156007)(189998001)(5001860100001)(10400500002)(5007970100001)(86362001)(16601075003)(4001540100001)(40100003)(122556002)(19580405001)(5004730100002)(5003600100002)(19580395003)(5001830100001)(92566002)(106116001)(74316001)(2501003)(46102003)(101416001)(587094005)(105586002)(5001920100001)(64706001)(2351001)(102836002)(11100500001)(66066001)(87936001)(107886002)(99286002)(2900100001)(76176999)(1720100001)(50986999)(77156002)(106356001)(54356999)(5002640100001)(33656002)(68736005)(450100001)(62966003)(110136002)(77096005)(15975445007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1367;
	H:BN3PR03MB1367.namprd03.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: freescale.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2015 10:03:25.5783 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1367
Subject: Re: [meta-oe][PATCH] lvm2: make sure services files are installed in systemd_unitdir folder
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
X-List-Received-Date: Fri, 25 Sep 2015 10:36:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks, v2 is out.=20


Best Regards,

Zhenhua

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> Of Pau Espin Pedrol
> Sent: Tuesday, September 22, 2015 8:01 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH] lvm2: make sure services files are ins=
talled
> in systemd_unitdir folder
>=20
> Hi,
>=20
> Same stuff I have been proposing in other patches lately: How about using
> "systemd_system_unitdir" instead of "systemd_unitdir/system" ? You can fi=
nd
> it in bitbake.conf
>=20
> Pau Espin Pedrol
> mail/jabber: pespin.shar@gmail.com
> http://blog.espeweb.net
>=20
> 2015-09-22 13:39 GMT+02:00 Zhenhua Luo <zhenhua.luo@freescale.com>:
>=20
> > Make sure the services files are installed in
> > ${D}/${systemd_unitdir}/system, fixed the following build error:
> > | sed: can't read
> > .../lvm2/2.02.125-r0/image/lib/systemd/system/blk-availability.service
> > : No such file or directory
> > |   sed -i -e 's:/usr/bin/true:/bin/true:g'
> > .../lvm2/2.02.125-r0/image/lib/systemd/system/blk-availability.service
> >
> > Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> > ---
> >  meta-oe/recipes-support/lvm2/lvm2.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc
> > b/meta-oe/recipes-support/lvm2/lvm2.inc
> > index 2b2d8ed..1968ac9 100644
> > --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> > +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> > @@ -39,7 +39,7 @@ do_install_append() {
> >      # Install machine specific configuration file
> >      install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
> >      sed -i -e 's:@libdir@:${libdir}:g' ${D}${sysconfdir}/lvm/lvm.conf
> > -    oe_runmake 'DESTDIR=3D${D}' install install_systemd_units
> > +    oe_runmake 'DESTDIR=3D${D}'
> > systemd_unit_dir=3D${D}/${systemd_unitdir}/system install
> > install_systemd_units
> >      sed -i -e 's:/usr/bin/true:${base_bindir}/true:g'
> > ${D}${systemd_unitdir}/system/blk-availability.service
> >  }
> >
> > --
> > 2.4.3
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

