Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 863 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 09 Aug 2018 22:44:02 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0043.outbound.protection.outlook.com [104.47.34.43])
	by mail.openembedded.org (Postfix) with ESMTP id 978C278E94
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 22:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=11NJDieGiTwmY/osPcNbTSX0Sw51yPo+/yFEU4hWGaE=;
	b=NeEBwZMZXA+VTrj8UCWcRQRlQygtcJW7siLGRBsNv8lIINA7Adva/3RtArIDiuGXttsZdTMRkXbmOvi7X2hXF2T/Mt6vHFBEmfSnKKSsTsf5pI8DetSFJ7NFLJziE9F5BIwXD308zJ1aJ7TzPcyRgu/JjzmoZWS0ThqsAtAIH3s=
Received: from BYAPR02MB4583.namprd02.prod.outlook.com (52.135.239.210) by
	BYAPR02MB5207.namprd02.prod.outlook.com (20.177.124.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1017.18; Thu, 9 Aug 2018 22:29:39 +0000
Received: from BYAPR02MB4583.namprd02.prod.outlook.com
	([fe80::8524:66ba:f3be:bce6]) by
	BYAPR02MB4583.namprd02.prod.outlook.com
	([fe80::8524:66ba:f3be:bce6%3]) with mapi id 15.20.1038.023;
	Thu, 9 Aug 2018 22:29:38 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>, akuster808
	<akuster808@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] wireshark_2.6.1.bb: Fix the configure error on git
	describe
Thread-Index: AQHUL+t7gplyp/fnkkOmtZtVaVJCLqS3ghQQgAB+nfA=
Date: Thu, 9 Aug 2018 22:29:38 +0000
Message-ID: <BYAPR02MB4583CD6155ED4DB4D20F9C79B9250@BYAPR02MB4583.namprd02.prod.outlook.com>
References: <1533778721-28693-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<4b304730-403e-daec-ca87-b7a4423a31dc@gmail.com>
	<BYAPR02MB458332A5F9D09A529BBB5342B9250@BYAPR02MB4583.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB458332A5F9D09A529BBB5342B9250@BYAPR02MB4583.namprd02.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR02MB5207;
	6:lKUA2l5IksED85puEdSEygso3rrufxHKVsMHaDBqbuQUved6A1WGZCWgxodF0yc1L9KY3J5v4OtpERNuo/u5aG//ji6oIuAf+TxnIJVyDxH/8f63C3S8a5W93im7MQFvU4AVjrB6GzX1DCoop1YnUd9WxafTGYbceTLtdjc1DV8wzjN0A/r07Yie7lNR2+OA7c00gvreL1AiXLRE454Ku0mw2RUGfB7S9FGBfZR7XkyEzG5DTXVTZXsaF7ktKuyCp5d5nrroALlg1n2Q7anzUweepAWWy8WS8xUyyXhZdtm99sAyWmoMtXPaNCiZ2Ew78bAZNmaUlUDM+W9EnmrYP/HJ05qPmRO7iqsvFpyUQnEvyn1StdEk3laGQf2Kw5pZcOD8cVrGMfbuZ46YaMrorTu3FOhjsHMQcm2oP7/7MppGGOPHfhQgseIbJMslUWUxpFsKwTmq+Vu6AP50bDcpnw==;
	5:RQDN5y87qJksVpZGxW3cm0dCQYIX+Ml50DjYa/CvCbSGoZDRGh4uWpaP0MklpYA7dhvhK+gRQ7rh5JccPL1axo0M5T7gOEyYcrk/t20e8OWoDulfvKXiUQpLwBn5X7d+P8Xhk2Rqb2I1PL52oqfu6APfST26U6lEdzIKUFIqxfY=;
	7:MOu91DQLzREtmGVlAC6oX6PyNrPCbTZFGL/4XizhrnMsQT1WU9kYiyfGkQxuWWJbzGm1eQYaNt2B8IDGJ3xmUcg5ovW6iEvDGoVSNjN/w+/NatPxA1i6UiOCEH697rTLkRZh+ODU80egjuuqPAyNoMEl3umY6h23uDRSKoZ3tZKy2tfWKlaX6htRr7Vd+yKPctb3sG7YGyWGTX81epT/0u+1p+i+YgVD1O4kiGO571SkF62+ogZyClZbF7frYduL
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(346002)(39850400004)(396003)(366004)(376002)(136003)(199004)(189003)(13464003)(2900100001)(102836004)(106356001)(486006)(76176011)(105586002)(478600001)(7696005)(53546011)(8936002)(72206003)(9686003)(2940100002)(25786009)(6506007)(26005)(5660300001)(86362001)(66066001)(68736007)(53936002)(229853002)(74316002)(97736004)(5250100002)(6436002)(6246003)(2501003)(110136005)(39060400002)(3846002)(33656002)(6116002)(446003)(305945005)(7736002)(81156014)(81166006)(55016002)(476003)(14454004)(316002)(11346002)(2906002)(256004)(14444005)(99286004)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5207;
	H:BYAPR02MB4583.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-office365-filtering-correlation-id: ee457f0e-4f03-4f43-9d1e-08d5fe479808
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR02MB5207; 
x-ms-traffictypediagnostic: BYAPR02MB5207:
x-microsoft-antispam-prvs: <BYAPR02MB52073FC77321C7C2DC4AA7DBB9250@BYAPR02MB5207.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(85827821059158)(264703809997249)(192813158149592); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(3231311)(944501410)(52105095)(93006095)(93001095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:BYAPR02MB5207; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB5207; 
x-forefront-prvs: 0759F7A50A
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: Woxtzj0hsOrN/VfjvXvzFX6+EUZBVGCjGlqtRaUCebzK+kcNZKZJ5sCifHshhsWnltUH9SYQ/x876c5iAndcTSHTWd3ke1kCOc6Ftp+367tExsKFLSAoWgJi5wc9Y+v0+YT4w2zQYn+vwwioX7UjpRp2/dkbRXPxp2HDm6CVc3qIovi8ccM1Op7IBuI9yd92ZuJ4ek9HO+P5Ow5bLIauKRxTVi5MkRrkPpOr105C+rIv9mHIKad2SSR8/KJmrYru997h10M+PZBk2bvdi/Zu9Jw7l7i0sZdMit/xTxbuBB39TBNOKMf0VIJfQoKGFOPyL7dXKPbugCFpkV+FBQvEOZ9sbAroWNMcVSJJ+LtE6Gk=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee457f0e-4f03-4f43-9d1e-08d5fe479808
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2018 22:29:38.7986 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5207
Subject: Re: [PATCH] wireshark_2.6.1.bb: Fix the configure error on git describe
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
X-List-Received-Date: Thu, 09 Aug 2018 22:44:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

>=20
> > -----Original Message-----
> > From: akuster808 [mailto:akuster808@gmail.com]
> > Sent: Thursday, August 09, 2018 7:16 AM
> > To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>;
> openembedded-
> > devel@lists.openembedded.org
> > Subject: Re: [oe] [PATCH] wireshark_2.6.1.bb: Fix the configure error
> > on git describe
> >
> > Manjukumar,
> >
> >
> > On 08/08/2018 06:38 PM, Manjukumar Matha wrote:
> > > This patch fixes the following error during do_configure task
> > >
> > > | fatal: No names found, cannot describe anything.
> > > | CMake Error at CMakeLists.txt:3086 (string):
> > > |   string begin index: 1 is out of range 0 - 0
> > > |
> > >
> > > Using --always is a fallback for fetching uniquely abbreviated
> > > commit object
> >
> > There is an upgrade to 2.6.2 sitting in master-next. Have you checked
> > that version?
> >
>=20
> Will try it out now and keep you posted
>=20

Still get the same issue on 2.6.2. I will send a patch based on 2.6.2

Thanks,
Manju

