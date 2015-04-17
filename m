Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 77949 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 17 Apr 2015 13:34:32 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0146.outbound.protection.outlook.com [207.46.100.146])
	by mail.openembedded.org (Postfix) with ESMTP id C68AD73D45
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2015 13:34:32 +0000 (UTC)
Received: from BN3PR0501MB1092.namprd05.prod.outlook.com (25.160.113.139) by
	BN3PR0501MB1361.namprd05.prod.outlook.com (25.160.183.26) with
	Microsoft SMTP
	Server (TLS) id 15.1.136.25; Fri, 17 Apr 2015 13:34:32 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com (25.160.113.12) by
	BN3PR0501MB1092.namprd05.prod.outlook.com (25.160.113.139) with
	Microsoft
	SMTP Server (TLS) id 15.1.136.25; Fri, 17 Apr 2015 13:34:31 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) by
	BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) with
	mapi id 15.01.0136.026; Fri, 17 Apr 2015 13:34:31 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] util-linux: Data file clash for lastb with sysvinit
Thread-Index: AdB4XT1KKxtJB05wQDO9bxnPLAE+XQAaROeAABLSKoA=
Date: Fri, 17 Apr 2015 13:34:31 +0000
Message-ID: <BN3PR0501MB109033F50D654EA92BA95C50BBE30@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <BN3PR0501MB1090943C5B3B41A6BF6D49E8BBE40@BN3PR0501MB1090.namprd05.prod.outlook.com>
	<CAMKF1sojoXmYGEXaNkj8H1Xwk_=CULvV=Dtn2adBuydu2Xbb3g@mail.gmail.com>
In-Reply-To: <CAMKF1sojoXmYGEXaNkj8H1Xwk_=CULvV=Dtn2adBuydu2Xbb3g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 005D6C2C009A00005D6D79
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bevenson@melinkcorp.com; 
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1092;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1361; 
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(979002)(6009001)(51704005)(164054003)(24454002)(13464003)(377454003)(54356999)(106356001)(92566002)(122556002)(102836002)(33656002)(19580405001)(19580395003)(50986999)(76176999)(15975445007)(1720100001)(2656002)(62966003)(40100003)(74316001)(87936001)(2950100001)(46102003)(86362001)(66066001)(110136001)(2501003)(450100001)(2900100001)(76576001)(99286002)(107886001)(2351001)(77156002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1092;
	H:BN3PR0501MB1090.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:ovrnspm; PTR:InfoNoRecords; LANG:en; 
x-microsoft-antispam-prvs: <BN3PR0501MB10926C1759AFD06CC95F95F1BBE30@BN3PR0501MB1092.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BN3PR0501MB1092; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0501MB1092; 
x-forefront-prvs: 0549E6FD50
received-spf: None (protection.outlook.com: melinkcorp.com does not designate
	permitted sender hosts)
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2015 13:34:31.2330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1092
X-OriginatorOrg: melinkcorp.com
Subject: Re: util-linux: Data file clash for lastb with sysvinit
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
X-List-Received-Date: Fri, 17 Apr 2015 13:34:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Khem,

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of Khem Raj
> Sent: Friday, April 17, 2015 12:24 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] util-linux: Data file clash for lastb with sysvinit
>=20
> On Apr 16, 2015 11:29 AM, "Bryan Evenson" <bevenson@melinkcorp.com>
> wrote:
> >
> > All,
> >
> > I've been working through several issues in order to get a clean
> > upgrade
> and I'm down to my last couple.  I found a conflict between sysvinit and =
util-
> linux that I have no idea how to handle and I'm looking for some help.  I=
'm
> using sysvinit for init and opkg for package management.
> >
> > I am upgrading a system that is on poky/dylan-1.4.4 up to
> poky/dizzy-1.7.1.  One of the errors I see during upgrade is the followin=
g:
> >
> > * check_data_file_clashes: Package util-linux wants to install file
> /usr/bin/lastb
> >         But that file is already provided by package  * sysvinit
> >
> > The chain I've found for the files on my system are:
> > /usr/bin/lastb -> last
> > /usr/bin/last -> /usr/bin/last.sysvinit
> >
> > When I check which package owns lastb ("opkg search /usr/bin/lastb")
> > opkg
> says util-linux has that file.  However, I don't see anything in the util=
-linux
> recipe that mentions lastb.  I don't know how this softlink is getting cr=
eated
> or how util-linux is the owner.
> >
> > Any ideas on how util-linux is getting ownership of lastb and how to
> resolve this conflict with sysvinit?
>=20
> Look for this file in your build  tree it should be clear then who provid=
es it.

I started a devshell for both util-linux and for sysvinit.  Both create the=
 softlink lastb in a Makefile.  I added lastb to the ALTERNATIVE_${PN} list=
 for both util-linux and for sysvinit.  After that util-linux installed wit=
hout conflict, however neither package claims ownership to /usr/bin/lastb. =
 "opkg search /usr/bin/lastb" produces no results, although each package cr=
eated their own alternative link for lastb.  Here is what is now installed =
on my system:

/usr/bin/last -> /usr/bin/last.sysvinit
/usr/bin/last.sysvinit
/usr/bin/last.util-linux
/usr/bin/lastb -> /usr/bin/lastb.sysvinit
/usr/bin/lastb.sysvinit -> last.sysvinit
/usr/bin/lastb.util-linux -> last.util-linux

It works, but I still don't fully understand how the update-alternatives cl=
ass works so I don't know if there is a better way to do this.  If you have=
 any suggestions let me know.

Thanks,
Bryan

> >
> > Regards,
> > Bryan
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

