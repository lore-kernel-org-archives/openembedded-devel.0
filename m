Return-Path: <chris.laplante@agilent.com>
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr680081.outbound.protection.outlook.com [40.107.68.81])
	by mail.openembedded.org (Postfix) with ESMTP id A7BFD7F367
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 00:30:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=P6mlGgAQc4tFAuHmXfD5ZLSRf3/sF4FrSzPx4xyyMlxvWnHz4Ft3vS79eW/uQAV6QS1lDy5JX7p/QBzi+cEpVceEbCNW0k0YtbDAd3iWxdisYgf0U5ISoc0KKm6Fu3xBrK89l8N9rLe/GIoMuz82LzPin9IPZ/RIJ085SFer9IwtDi8J0P4ROptmURCiOQJZ0shPBzmKRBTNpKmjGN69bFd3kkrqmkykMLN/9VC9DhsGkC6yXRzL8Y4+DOPbXtT3uc0lj231dEENnC6+DRDPQt5S8vEd5gc/rRHiwCdMe/Q9JB9PbzcVPkQCwmOJKNL6klvEMuqQPhoXnVLOXI/jzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=hnucgukAphNOo+6b4gYTlunBBQBVQMEr9qxaxSfMTos=;
	b=Tu9GEspnkvriKElq8yuMrGYNAtG/HuTyrCt08E22Q7A19kJsnjbF1uhCEKnOFuITtahDKjdG32N6WFx62RFD8n456RNidbxTtbz8w+Y2I7kVAYiB52wOGwDi7vBZml5ExgL3u4NMJeDnjNOYU/tuLRHPZGHBaXaRyoTqZdqe4ZLhYztRbsiiLQ1atgIK7Jz+Rq4Mk+dY7mOJStuFaFmW2QABy8zaU5xitro3cizYO9x4pjMg7pHAARN8atKwkvKQaeNAs8Wd7/yChe4BNsm2pvBu62PjtpNd+h8Q66Wvw+wHxNYR2JR6OlivTY5nE25XMtPS6TdnSXiSAzswfm+c4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=hnucgukAphNOo+6b4gYTlunBBQBVQMEr9qxaxSfMTos=;
	b=rlEcKAriTIb5M+l6NFD9VnMu1nVKaFwDxhC4HRvEXqFJuPq7wYlXBy+Gvny+WeJOz+s+OZyNdA5HO3tFGbVgHb4Lht78UyW9A+Dvhjvs9QIvw+6buEX1DGeF5DNIp2FEhb2u+Js4s+6uGTrHGF1wKSH5GAmq3Q5Sfpf86tL9tts=
Received: from CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) by
	CY4PR12MB1783.namprd12.prod.outlook.com (10.175.62.145) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2451.26; Mon, 18 Nov 2019 00:30:02 +0000
Received: from CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::38c8:b362:f0b6:5134]) by
	CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::38c8:b362:f0b6:5134%8]) with mapi id 15.20.2451.029;
	Mon, 18 Nov 2019 00:30:02 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Khem Raj <raj.khem@gmail.com>, Richard Leitner
	<richard.leitner@skidata.com>, openembeded-devel
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java] merged changes to master
Thread-Index: AQHVm5owUGDSHTEPJUCi6fQ55Uff4KeMeqYAgAOcTAA=
Date: Mon, 18 Nov 2019 00:30:01 +0000
Message-ID: <CY4PR12MB1653BA06BA6C48B984A043738B4D0@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <cb700209-e8fa-ea77-0127-0f1669a2c452@skidata.com>
	<0c9f98fe3add2be003e3aeaf20b681e940fd47bb.camel@gmail.com>
In-Reply-To: <0c9f98fe3add2be003e3aeaf20b681e940fd47bb.camel@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [76.99.179.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3cf2b1cc-2ecc-43b7-bdb6-08d76bbe7365
x-ms-traffictypediagnostic: CY4PR12MB1783:
x-microsoft-antispam-prvs: <CY4PR12MB17836E87F805ABA7A1CFCF608B4D0@CY4PR12MB1783.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(979002)(376002)(136003)(396003)(39860400002)(346002)(366004)(29502001)(189003)(199004)(8676002)(4326008)(8936002)(76116006)(66446008)(66556008)(33656002)(6116002)(3846002)(66946007)(66476007)(66066001)(81156014)(81166006)(14454004)(446003)(11346002)(86362001)(45080400002)(55016002)(6436002)(478600001)(9686003)(7736002)(25786009)(6246003)(6306002)(4001150100001)(53546011)(64756008)(7696005)(5660300002)(110136005)(256004)(305945005)(2906002)(229853002)(316002)(6506007)(99286004)(102836004)(74316002)(476003)(186003)(52536014)(76176011)(71200400001)(26005)(71190400001)(486006)(966005)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1783;
	H:CY4PR12MB1653.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ywsRb79Y776MHt+TU2s9amo6ygyRtETpuHlmUuvnea7+eJ1u4UNIW6PFY44JMBoxJr+BklERC8KpZh9KHuNNM9G5lGngfvP4kncS0omacVnT86Xl1nP73sY3y9jAKRETmV2U/wUs2EMguWZhmTD9xnt69dbMljaaiI+NJz57rbr17hg/nJfOGnzvjMoK27bU5hh3tr76I9h96inU0NOTErQJVkEUp7UO4qE+2pd0X6q5DkLm2RsD/ltiabpnPAHpGD6oy5dmgp2+Z1hJfoUNPe31KbyvPHdwOkdnYQE02mhIWBHL0YagUKuLiSiUuQBYkMezugvROg50WOC14HwkYE8fb2Lt12QIISjl8fYACIaYfOP1xsy0hBy6ajELGZDGEYJn4MpjZWdKne40LjRwhTAGWo0obzFKvexBRjVdeeDFPs1MadnlOzNOVsTe8Ydq1uYJVTZKskb6HZ6n9orZzQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf2b1cc-2ecc-43b7-bdb6-08d76bbe7365
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 00:30:01.8581 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U2TTq0T76RIUDxtYnX/8pTnW0sKjGfeBwZO0+XR9rpSM74Kz4N4ssQ3wVQ4jSUBA3UZtTI1QlcoAWCRSzj/kNKpInv6fIIuHFrh4SovM8pE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1783
Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
Subject: Re: [meta-java] merged changes to master
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
X-List-Received-Date: Mon, 18 Nov 2019 00:30:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

> From: openembedded-devel-bounces@lists.openembedded.org <openembedded-dev=
el-bounces@lists.openembedded.org> On
> Behalf Of Khem Raj
> Sent: Friday, November 15, 2019 12:20 PM
> To: Richard Leitner <richard.leitner@skidata.com>; openembeded-devel <ope=
nembedded-devel@lists.openembedded.org>
> Cc: Ricardo Ribalda Delgado <ricardo@ribalda.com>
> Subject: Re: [oe] [meta-java] merged changes to master
>=20
> On Fri, 2019-11-15 at 10:50 +0100, Richard Leitner wrote:
> > Hi,
> > this is a note to let you know that I've just merged the following
> > patches from master-next to the master branch of the meta-java
> > repository at git://git.yoctoproject.org/meta-java.
> >
> > If any of them should be backported to any stable branches please get
> > in
> > contact with us by replying to this email. Thanks.
> >
>=20
>=20
> thans for this Richard, can you also peek into patchwork and see if all
> these patches are marked accordingly on patchwork?

Maybe not what you were directly asking about, but any idea why my patches =
are incorrectly attributed in Patchwork? E.g. https://patchwork.openembedde=
d.org/patch/165487/ or https://patchwork.openembedded.org/project/bitbake/p=
atches/?submitter=3D12924. Is it because of my company's usage of Microsoft=
 Exchange?

Thanks,
Chris

