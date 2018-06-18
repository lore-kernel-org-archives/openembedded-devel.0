Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 25955 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Jun 2018 21:50:11 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0053.outbound.protection.outlook.com [104.47.32.53])
	by mail.openembedded.org (Postfix) with ESMTP id 694257542D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jun 2018 21:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DsjJCvEovlwZU/h+zrRumKkGdbiVnWa0gfaIInbZk4s=;
	b=tpA0adGGJtmEQPNCrmFWQJ7IlxNofCL4Apw7WkdzIvcyFiXx/LsKHm/u3xViYi5TOlf9sRC4zjaQyg6JuRppIVOpoOVziBGfN0jc3bZrcsZJp8ZEvT1LXzyDEgRoeBDaoCS7jS9aFkq7Ld5/YabddhGpoZlOKbKPDAWYZxJM2Ac=
Received: from DM5PR02MB3863.namprd02.prod.outlook.com (52.132.139.146) by
	DM5PR02MB2457.namprd02.prod.outlook.com (10.168.194.143) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.863.19; Mon, 18 Jun 2018 19:15:46 +0000
Received: from DM5PR02MB3863.namprd02.prod.outlook.com
	([fe80::a980:cb7c:becd:294]) by DM5PR02MB3863.namprd02.prod.outlook.com
	([fe80::a980:cb7c:becd:294%5]) with mapi id 15.20.0863.016;
	Mon, 18 Jun 2018 19:15:45 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>, Armin Kuster
	<akuster808@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH 00/39] Sumo-next patch review
Thread-Index: AQHUBxE2f4QHBCrfd0uM/ClxAr8oSaRmFStggABOHhA=
Date: Mon, 18 Jun 2018 19:15:45 +0000
Message-ID: <DM5PR02MB3863F9C62314253576305FDFB9710@DM5PR02MB3863.namprd02.prod.outlook.com>
References: <cover.1529330340.git.akuster808@gmail.com>
	<DM5PR02MB3863CC1D2E4B15CB37B0ADDFB9710@DM5PR02MB3863.namprd02.prod.outlook.com>
In-Reply-To: <DM5PR02MB3863CC1D2E4B15CB37B0ADDFB9710@DM5PR02MB3863.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR02MB2457;
	7:tCA3dCbd8B/03okq515G35coDc9rLuvdcNJ6vvpZe12GFRqrmsJEAqbvE5zB3trJyqplnQpd2EQyi8+JEq5vM78rIUJ37MwQh8wNedsyJg5eWIJ06jo4rmUjF4dFdQgGs+gAQr7Q3VupSSZtwqjjGlf3/r0w1Qj+VG7ibzCIW+tbgETEU4dFWveYd12EDeyw3UwnFwaktiacIgL3Oct5bYjTGz+7rOF3p97fuWHpwETvjSNtieRTmuvQ0QNWMyC0
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(366004)(39860400002)(396003)(346002)(376002)(39380400002)(13464003)(199004)(189003)(105586002)(86362001)(6306002)(66066001)(9686003)(97736004)(55016002)(33656002)(2900100001)(5250100002)(3280700002)(2906002)(2501003)(3660700001)(229853002)(6436002)(6116002)(3846002)(68736007)(305945005)(14454004)(7736002)(5660300001)(25786009)(74316002)(2940100002)(6246003)(39060400002)(53936002)(11346002)(76176011)(7696005)(486006)(102836004)(316002)(476003)(53546011)(6506007)(26005)(110136005)(446003)(8676002)(99286004)(81156014)(8936002)(966005)(81166006)(478600001)(72206003)(106356001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2457;
	H:DM5PR02MB3863.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-office365-filtering-correlation-id: 98404332-78a3-4444-509b-08d5d54fe476
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(711020)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR02MB2457; 
x-ms-traffictypediagnostic: DM5PR02MB2457:
x-microsoft-antispam-prvs: <DM5PR02MB2457F8CCD0FB9E745D1D3C33B9710@DM5PR02MB2457.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(85827821059158)(264703809997249);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR02MB2457; BCL:0; PCL:0; RULEID:; SRVR:DM5PR02MB2457; 
x-forefront-prvs: 0707248B64
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: IyytxVWRC/8/ZU5gPL1oLA2S5ZyDb9NCcA5WyOejazxQAEnPBHUDi6ChjblCgOLxJEk0Lq2tdPMPP4yQQ+fkjZyT6H0Pw1zBJMtTuEM49MrRj/Fi0EyP1uZRDuW6s8wigy6E6KQjvyH0aC0dqgD0q/czMd7SZvlN69yGU/EZqOXB9aqqa2HgL6pyUqQsZKfyt1GWLwRF1n8hmkkzTn1S98LuuuG9Fq5YsYI11q7DUmZv1enqXvFsutoUxSJRCgjf2uoeVxH7bOVg942EBuNhe5oOY+2m+KQxwtXT2mPocikuvHpBGPMZODX2nSqQElpuK1PWV14wxljoKN1PsO47Hg==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98404332-78a3-4444-509b-08d5d54fe476
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2018 19:15:45.3684 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2457
Subject: Re: [PATCH 00/39] Sumo-next patch review
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jun 2018 21:50:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> Manjukumar Harthikote Matha
> Sent: Monday, June 18, 2018 7:38 AM
> To: Armin Kuster <akuster808@gmail.com>; openembedded-
> devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH 00/39] Sumo-next patch review
>=20
> Hi Armin,
>=20
>=20
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf
> > Of Armin Kuster
> > Sent: Monday, June 18, 2018 7:32 AM
> > To: akuster808@gmail.com; openembedded-devel@lists.openembedded.org
> > Subject: [oe] [PATCH 00/39] Sumo-next patch review
> >
> >
> > These are backports from master for sumo.
> > This is your chance to comment on this series for sumo.
>=20
>=20
> Can we get this sysvinit patch to backport as well?
> https://patchwork.openembedded.org/patch/150414/
>=20

Sorry Ignore this

Thanks,
Manju

<..>

