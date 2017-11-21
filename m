Return-Path: <Jonathan.Haigh@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0040.outbound.protection.outlook.com [104.47.2.40])
	by mail.openembedded.org (Postfix) with ESMTP id 6862E7839D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Nov 2017 10:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Wd0uZbBpj/Hlr60eiUe5AvkyJPVL6tMhCdF0n3We6qE=;
	b=FA1/ipcGMc9sOe0l7YU3gaXtu5l686iBUzMgVV4aZJQepztKo/gWrL73xwPEWrmEzFtM7St8foK92xa3JLOAPsx/fPghDwWo9f8hsb7ndsbcM213cECd2Qw4gl1PO/pZCvHf5VDQosUfidmWyfUgrDrmKAdxw21W0S6yOiI5whQ=
Received: from DB6PR0802MB2229.eurprd08.prod.outlook.com (10.172.227.138) by
	DB6PR0801MB2021.eurprd08.prod.outlook.com (10.168.86.14) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.239.5; Tue, 21 Nov 2017 09:46:10 +0000
Received: from DB6PR0802MB2229.eurprd08.prod.outlook.com
	([fe80::60b3:4357:98e2:c2f3]) by
	DB6PR0802MB2229.eurprd08.prod.outlook.com
	([fe80::60b3:4357:98e2:c2f3%15]) with mapi id 15.20.0239.007;
	Tue, 21 Nov 2017 09:46:11 +0000
From: Jonathan Haigh <Jonathan.Haigh@arm.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Thread-Topic: [oe] [meta-python] broken python-asn1crypto-native dependency
Thread-Index: AQHTYfKQQwNgqj7f8EeW8wJ19kXU1aMdkVKAgAEF1qk=
Date: Tue, 21 Nov 2017 09:46:10 +0000
Message-ID: <DB6PR0802MB2229DFB5D97979F6E6BD77DA93230@DB6PR0802MB2229.eurprd08.prod.outlook.com>
References: <DB6PR0802MB2229E38FAD3DA1099AC3EAEE93220@DB6PR0802MB2229.eurprd08.prod.outlook.com>,
	<CAP9ODKqN74bNH5OipCfA0kj4TESGudmgkeMn26pqT_PgLPgj8A@mail.gmail.com>
In-Reply-To: <CAP9ODKqN74bNH5OipCfA0kj4TESGudmgkeMn26pqT_PgLPgj8A@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Jonathan.Haigh@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB6PR0801MB2021;
	6:CNMhRtUSFfCLywVAgrxZUobjD/TcAbB3VDTSxhhWPmFbBNfaysrLg5oDuspMNfQS9Df//zHZ73fC5WINCEolrEtmFYLtZopF9Yg23rcP0TZpO4CqRDqb4kKzgJmjriYA4NadNcvKyYanLA5IN357/2lyDHiSeQ50+H13E9INYvf/F71Zoo6As3/7pS2VR1oSlFwGYBhFt5vryxzhIpPQOjpBYNHamy/am9UvZXE1bcaIWY8QHtX/bnXM1McfqdLKX55MxO2T0Re7ZxGM3Kow+ukwY2w8OEZ3eHBKm2769W/Q2XhBBS3Z15B5Dly8e02QmJFjIZxPMkn1qXVyOCXkY+vu5XE7V3DGkkY1TclDge0=;
	5:k5AHEnnE4RpHIXB/pS4dn/tVk3ricxKKyygpkAGykWwL6nz9VTKJ8QLVDEcED9QuOxrkolkvetTSwyImiZ3T9tb35YokKBPYfXxvrA/fsYrYuy7I6I6hjCgv7NDeyJT4dO5XY5swvbPdAhU17lhactF0hrEdB/aRu98LtG8p2jw=;
	24:P8UBMZerfDzqjxum7WZTc69luuaDKSG9Wuc0fT7mWsIDXbfXx6QPbB1VYPTJTYoS5VA/vdnc2zKl/lkjOj1BBspxys6KnKjJsmgMCcOwnzU=;
	7:GGG88lvWZlNuB+cMaTQqXsI08tvhLKJa8mf8DgLNcI6u/zFgf5yc3pSM+m5pAdBz9MKpjyPgfKUJpipxwHTX/UyXVTpRGKJlNWFCsvHbrjrejaAXj4iiWr/CkYC1r/SVZT2hasdwN0wk5ddSdUTiLUtJTIYbZIx3T/70bSY8QkvQOR+VyJd6sqDwGikDGRypTSc8e1O5flNUh3q8J3GRgOqKEf5hiceUq6MxbULM2iBU4M/rZ8XUcZEv8SYOqVNY
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-ms-office365-filtering-correlation-id: 67616835-cefb-4f29-8978-08d530c4b28e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(48565401081)(2017052603199);
	SRVR:DB6PR0801MB2021; 
x-ms-traffictypediagnostic: DB6PR0801MB2021:
x-microsoft-antispam-prvs: <DB6PR0801MB20219F7DE260FBB144C1D49F93230@DB6PR0801MB2021.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(264703809997249)(166494164430575); 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(93006095)(93001095)(3231022)(10201501046)(3002001)(6055026)(6041248)(20161123555025)(20161123558100)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DB6PR0801MB2021; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DB6PR0801MB2021; 
x-forefront-prvs: 049897979A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(376002)(39860400002)(199003)(189002)(40434004)(24454002)(105586002)(4326008)(230783001)(6246003)(101416001)(53386004)(81166006)(33656002)(54356999)(76176999)(50986999)(8676002)(81156014)(6606003)(14454004)(2950100002)(6916009)(3660700001)(5660300001)(25786009)(8936002)(7696004)(606006)(74316002)(966005)(72206003)(106356001)(19627405001)(5890100001)(66066001)(3280700002)(7736002)(2906002)(53546010)(68736007)(5250100002)(478600001)(6506006)(2900100001)(86362001)(54906003)(6436002)(6306002)(9686003)(54896002)(55016002)(6116002)(236005)(102836003)(229853002)(3846002)(97736004)(16297215004)(316002)(189998001)(99286004)(53936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0801MB2021;
	H:DB6PR0802MB2229.eurprd08.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67616835-cefb-4f29-8978-08d530c4b28e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2017 09:46:10.9266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2021
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Simon Hughes <Simon.Hughes@arm.com>
Subject: Re: [meta-python] broken python-asn1crypto-native dependency
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
X-List-Received-Date: Tue, 21 Nov 2017 10:00:39 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Great, thanks Otavio.

________________________________
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
Sent: 20 November 2017 18:08:47
To: Jonathan Haigh
Cc: openembedded-devel@lists.openembedded.org; Simon Hughes
Subject: Re: [oe] [meta-python] broken python-asn1crypto-native dependency

Hello Jonathan,

On Mon, Nov 20, 2017 at 9:33 AM, Jonathan Haigh <Jonathan.Haigh@arm.com> wr=
ote:
> I have a patch for this - adding BBCLASSEXTEND =3D "native" to python-asn=
1crypto's recipe - which I will send with git send-email, although most of =
the other python recipes also include nativesdk in BBCLASSEXTEND so maybe t=
hat should be added too (I don't know much about the SDK stuff).

I had it in my queue, so I sent it.

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

