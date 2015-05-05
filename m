Return-Path: <B40290@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0116.outbound.protection.outlook.com [65.55.169.116])
	by mail.openembedded.org (Postfix) with ESMTP id 8E4F7601DC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 May 2015 03:30:12 +0000 (UTC)
Received: from BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) by
	BY2PR03MB442.namprd03.prod.outlook.com (10.141.141.145) with Microsoft
	SMTP Server (TLS) id 15.1.160.10; Tue, 5 May 2015 03:30:12 +0000
Received: from BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) by
	BY2PR03MB441.namprd03.prod.outlook.com ([10.141.141.142]) with mapi id
	15.01.0160.009; Tue, 5 May 2015 03:30:12 +0000
From: "B40290@freescale.com" <B40290@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH] polkit: do not hardcode the libdir
Thread-Index: AQHQhk9rhsFzr2VXdEW04N9JgIh/Sp1sQzMAgABZ+aA=
Date: Tue, 5 May 2015 03:30:10 +0000
Message-ID: <BY2PR03MB441E61C43434B3C0DE3568884D10@BY2PR03MB441.namprd03.prod.outlook.com>
References: <1430732876-15399-1-git-send-email-b40290@freescale.com>
	<CAMKF1so7KpzaY8Yog-s7hkgG1ujDxvgZL1wiPivTVmccF6=2-A@mail.gmail.com>
In-Reply-To: <CAMKF1so7KpzaY8Yog-s7hkgG1ujDxvgZL1wiPivTVmccF6=2-A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [199.59.231.64]
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB442;
x-microsoft-antispam-prvs: <BY2PR03MB442BD3359C1859BCEDB3D4584D10@BY2PR03MB442.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:BY2PR03MB442; BCL:0;
	PCL:0; RULEID:; SRVR:BY2PR03MB442; 
x-forefront-prvs: 0567A15835
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(13464003)(86362001)(1720100001)(102836002)(15975445007)(92566002)(2351001)(87936001)(19580405001)(2656002)(50986999)(66066001)(19580395003)(76176999)(106116001)(99286002)(77096005)(54356999)(450100001)(77156002)(62966003)(122556002)(76576001)(5001920100001)(2501003)(46102003)(2950100001)(107886002)(40100003)(74316001)(33656002)(2900100001)(5001960100002)(110136002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB442;
	H:BY2PR03MB441.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2015 03:30:10.6524 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB442
Subject: Re: [meta-oe][PATCH] polkit: do not hardcode the libdir
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
X-List-Received-Date: Tue, 05 May 2015 03:30:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Base_libdir is defined in meta/conf/bitbake.conf

export base_libdir =3D "${base_prefix}/${baselib}"



thanks,
Chunrong

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
Sent: Tuesday, May 05, 2015 4:22 AM
To: openembeded-devel
Subject: Re: [oe] [meta-oe][PATCH] polkit: do not hardcode the libdir

On Mon, May 4, 2015 at 2:47 AM,  <b40290@freescale.com> wrote:
> +-libprivdir =3D $(prefix)/lib/polkit-1
> ++libprivdir =3D $(prefix)/${base_libdir}/polkit-1

who defines base_libdir ?
--=20
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

