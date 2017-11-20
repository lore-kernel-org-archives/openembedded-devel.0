Return-Path: <Jonathan.Haigh@arm.com>
X-Greylist: delayed 953 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 20 Nov 2017 11:49:14 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0054.outbound.protection.outlook.com [104.47.2.54])
	by mail.openembedded.org (Postfix) with ESMTP id 115CB78824
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Nov 2017 11:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=BUBVBf4glSWYcoED7NYTFWpbSS1N/kw3j5QXeHaxmjY=;
	b=nk4KFnQxLzkvetAdNJvEVJSW1FLcE7dtaQCsPkgu8cYkUUY+7UVqPfs4eLrBXxHvelvjScRPRqLUt8iaEC1fGFAQ6DB9+sfISft9k5TrfiTBtS3dX6vbvhSewj2GNS9mjePKUqLzmGIM+CU9CTsc41ldrzgNrhiIwacLiVjq0Lg=
Received: from DB6PR0802MB2229.eurprd08.prod.outlook.com (10.172.227.138) by
	HE1PR0801MB2027.eurprd08.prod.outlook.com (10.168.95.16) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.239.5; Mon, 20 Nov 2017 11:33:21 +0000
Received: from DB6PR0802MB2229.eurprd08.prod.outlook.com
	([fe80::60b3:4357:98e2:c2f3]) by
	DB6PR0802MB2229.eurprd08.prod.outlook.com
	([fe80::60b3:4357:98e2:c2f3%15]) with mapi id 15.20.0239.007;
	Mon, 20 Nov 2017 11:33:20 +0000
From: Jonathan Haigh <Jonathan.Haigh@arm.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python] broken python-asn1crypto-native dependency 
Thread-Index: AQHTYfKQQwNgqj7f8EeW8wJ19kXU1Q==
Date: Mon, 20 Nov 2017 11:33:20 +0000
Message-ID: <DB6PR0802MB2229E38FAD3DA1099AC3EAEE93220@DB6PR0802MB2229.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Jonathan.Haigh@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; HE1PR0801MB2027;
	6:40uDQikm7GEWYkxMvLtTGynim7t7mx1DEbfX5Crp4z0jWh3XnflWubhhELp0c+COKufQNPnz9eCMpxXhK9sVae5fllTYg362cbHb/8OEzBysAfCb4ypwM0MBjSr7wtDGRpTrNaL6IRkYSbl/LrbsJoAP3C2A5dGGPIgEYODpIU9BWG/G+A5Sl1yjpubTKMjV/l/iD6ISkYYls3h8MkM6GdyhqV+4t1cMqcd3EDEtVYgVKoLfSLItP8EVRsFjJNR9I4/NA7M3WjZNyaFL08gG3RLaRt6BEAHbbk8rUHlDZC4QoKPhl9p8hzZjsHojA1vwo3ZfJsbroX4xaOJ7ndA47jOIUXiHvZfkerQ0qygRByw=;
	5:xZ7VDnK6Jafn7aT81nUmLSbtn/wvn1bXSi7ame5hQvutP6Sg6ybn8H2QokXmtujCmQ+1yUPb88ovbKDkNRSsvzJS8Od/fPfJl4VaseyiNECkryqUAFC81d889uQIZxx/4mouFWrlIITtbSGQIPgNjP7i6zcVJuHs5I/vN0CAN50=;
	24:Kw7AedykFVT3UAB0fyKbn8ieq5Sw5dV4MbuY5MzBAU6n8BDxZzuD0Hek6/AetOY4fyyrXcpYXTDODMsRZG4Z68i8qUOyNa5ZKXWNiJR48wg=;
	7:l1ffHdj1ZZzXhw3A3Bf4sqJ7cLSD1hy1ImdU4waZf6v9YDbKewuPXLFEmW3fFpdaWH8JjyJ2rghwzg21qTONQ5n8sUxGf2Fh8YUikgbD5ut8nN4Ge+6e0Fr9nWuWNorCWXhJe5RvYUdfB2ZmB7i3J4YOn2z4Gjex09MvPh8F8B2XZS1dtFZh+nbnAtAJP6D+WOgBmb0pz5tIsvhTUkQ7JYQtb+Gq+upkAg6gEjRT5OVCzTJiYq/FjYSjwQv8TjOl
x-ms-exchange-antispam-srfa-diagnostics: SSOS;SSOR;
x-ms-office365-filtering-correlation-id: 404409b5-0533-4e3f-40e1-08d5300a807f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(48565401081)(2017052603199);
	SRVR:HE1PR0801MB2027; 
x-ms-traffictypediagnostic: HE1PR0801MB2027:
x-microsoft-antispam-prvs: <HE1PR0801MB2027C1A9D69464FE914662FB93220@HE1PR0801MB2027.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(3231022)(93006095)(93001095)(10201501046)(3002001)(100000703101)(100105400095)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123555025)(20161123560025)(20161123558100)(20161123564025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:HE1PR0801MB2027; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:HE1PR0801MB2027; 
x-forefront-prvs: 04976078F0
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(39860400002)(376002)(189002)(40434004)(199003)(8676002)(68736007)(54356999)(5250100002)(8936002)(316002)(72206003)(5660300001)(53936002)(106356001)(105586002)(50986999)(81156014)(81166006)(5890100001)(2501003)(478600001)(66066001)(101416001)(97736004)(19627405001)(14454004)(2351001)(33656002)(7736002)(7696004)(99286004)(230783001)(102836003)(6116002)(3846002)(74316002)(189998001)(4743002)(86362001)(54896002)(25786009)(4326008)(5640700003)(6916009)(6436002)(9686003)(6606003)(6506006)(55016002)(3660700001)(2900100001)(2906002)(3280700002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0801MB2027;
	H:DB6PR0802MB2229.eurprd08.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404409b5-0533-4e3f-40e1-08d5300a807f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2017 11:33:20.5485 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB2027
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Simon Hughes <Simon.Hughes@arm.com>
Subject: [meta-python] broken python-asn1crypto-native dependency
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
X-List-Received-Date: Mon, 20 Nov 2017 11:49:15 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,


Recent changes to add the python-asn1crypto dependency to python-cryptograp=
hy (commit 74985f286eadd35f7e726c60a0616f423ae45000) has broken python-cryp=
tography-native builds because there's no recipe providing python-asn1crypt=
o-native.


I have a patch for this - adding BBCLASSEXTEND =3D "native" to python-asn1c=
rypto's recipe - which I will send with git send-email, although most of th=
e other python recipes also include nativesdk in BBCLASSEXTEND so maybe tha=
t should be added too (I don't know much about the SDK stuff).


Kind Regards,


Jonathan Haigh

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

