Return-Path: <mns@gomspace.com>
X-Greylist: delayed 22644 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 31 May 2017 14:01:13 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0134.outbound.protection.outlook.com [104.47.2.134])
	by mail.openembedded.org (Postfix) with ESMTP id 9C52477FEC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 May 2017 14:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gomspace01.onmicrosoft.com; s=selector1-gomspace-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=gjHdOO1AMSvawzDDIPWPBSq75QcpPUIbZcoBgFT1Gxo=;
	b=B/dCSu/hp+D+0Z1M/I9LmhG4+omXxcks6KyAV+7GPWMHj68AKe406gGLLMIe07VHf3RvqiMrkh9Yc8r2RXHhMRxjLRudWSFl7GVz9BXH3C9b54tJxMy6pJ1KzK7C76pjj3xlg2Gfv1icxdZKxna/JMUmeWSEGDczElu+x8f/jXc=
Received: from AM5PR0402MB2769.eurprd04.prod.outlook.com (10.175.41.11) by
	AM5PR0402MB2770.eurprd04.prod.outlook.com (10.175.41.12) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1124.9; Wed, 31 May 2017 11:29:52 +0000
Received: from AM5PR0402MB2769.eurprd04.prod.outlook.com
	([fe80::5052:b387:3cc7:998]) by
	AM5PR0402MB2769.eurprd04.prod.outlook.com
	([fe80::5052:b387:3cc7:998%18]) with mapi id 15.01.1124.020;
	Wed, 31 May 2017 11:29:52 +0000
From: Martin Siegumfeldt <mns@gomspace.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: URL of devmem2
Thread-Index: AQHS2gEh8GCJjcUVkkGlr6oY36HmJQ==
Date: Wed, 31 May 2017 11:29:51 +0000
Message-ID: <AM5PR0402MB276909CFFFEB554754A018B5C4F10@AM5PR0402MB2769.eurprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=gomspace.com;
x-originating-ip: [2603:10a6:203:2:cafe::4c]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM5PR0402MB2770;
	7:+p3xfGMORsnUO/a8mxSHsqpavLQ/BLaAbGJGrcXFNd1mTXiq2rewlK24Y3xcmAUNw7pMeTd+8Xsdagp6v4ci8WFlfqdwOmYCaCfFq+UXo4evsyNyo/7vleTVfzTsNwB9X4agezkoD0zZecI9K6EQ6FCL7OYTdG5kK/5CrkCnk4hMnt/LeUdpIQTYOPRtTMYCFVPJYZzkePBXH4grZcNoDiJ65GVl80+wWuFkXuwF5okqkov0SxEv4yoa8ISiWZfoiOTK2ojh6Z2J2YuToFdvFdi96ihG2sh+Qx2iCRCTLOXNDemXEjVkmbxFTmFwHpzkHjCm1ng4vclhpdeiJp3NUQ==
x-ms-traffictypediagnostic: AM5PR0402MB2770:
x-ms-office365-filtering-correlation-id: 29ff81ff-cd67-47de-adc0-08d4a8185aad
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075);
	SRVR:AM5PR0402MB2770; 
x-microsoft-antispam-prvs: <AM5PR0402MB2770CF33C6D4F4C9608900EAC4F10@AM5PR0402MB2770.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700073)(100105000095)(100000701073)(100105300095)(100000702073)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(3002001)(100000703073)(100105400095)(10201501046)(93006095)(93001095)(6041248)(20161123562025)(20161123560025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123558100)(20161123555025)(2016111802025)(20161123564025)(6072148)(6043046)(100000704073)(100105200095)(100000705073)(100105500095);
	SRVR:AM5PR0402MB2770; BCL:0; PCL:0;
	RULEID:(100000800073)(100110000095)(100000801073)(100110300095)(100000802073)(100110100095)(100000803073)(100110400095)(100000804073)(100110200095)(100000805073)(100110500095);
	SRVR:AM5PR0402MB2770; 
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39840400002)(39410400002)(39400400002)(39450400003)(5640700003)(55016002)(6916009)(99286003)(3660700001)(33656002)(53936002)(189998001)(7116003)(5660300001)(478600001)(86362001)(74316002)(2906002)(7736002)(9686003)(2501003)(3280700002)(7696004)(6306002)(2900100001)(14454004)(305945005)(966005)(5250100002)(6436002)(2351001)(6506006)(25786009)(50986999)(81166006)(54356999)(8676002)(6116002)(102836003)(8936002)(110136004)(38730400002)(568214009)(42262002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM5PR0402MB2770;
	H:AM5PR0402MB2769.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: gomspace.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2017 11:29:51.8344 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 91ed1e54-6d8b-4599-84d8-65fe75fda3d1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0402MB2770
Subject: URL of devmem2
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
X-List-Received-Date: Wed, 31 May 2017 14:01:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

Is there any chance that=A0http://git.openembedded.org/meta-openembedded/co=
mmit/?id=3Dfc801961457fe2fbb24973bb43b302ad46044cb8=A0and=A0http://git.open=
embedded.org/meta-openembedded/commit/?id=3D6c584374a599f6f8d3607f20ecfc13a=
67ccf1da1=A0will be backported to release branches - in particular fido? la=
rtmaker domain seems no longer available - AFAICS all branches older than p=
yro is affected.

Thanks,
Martin


