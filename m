Return-Path: <Jonathan.Haigh@arm.com>
X-Greylist: delayed 21568 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 05 Jul 2018 21:35:45 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0070.outbound.protection.outlook.com [104.47.2.70])
	by mail.openembedded.org (Postfix) with ESMTP id 7CFA778888
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jul 2018 21:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kMnkll4U8lw7YcIbfiNx8TToKjANC3J1AtE2IaCmEP8=;
	b=aavwIoGCURlA8gBfGTiNvlQgJyH54XiYeaXmt19drrrU5D1YcP48W0rAr5iZmNzfVAOV33Wco/inatqTZP+HvSBugb+EVtShJvo3rR24bkS+82lbiekLSC42eYJPTFez/JFUsacOraGIQwifVAWAo3Fe4qK1eHFV22ZxCM5JlDk=
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com (10.164.43.30) by
	DB5PR08MB0789.eurprd08.prod.outlook.com (10.164.42.151) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.930.19; Thu, 5 Jul 2018 11:04:23 +0000
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::d004:d47f:8a18:ac18]) by
	DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::d004:d47f:8a18:ac18%3]) with mapi id 15.20.0930.016;
	Thu, 5 Jul 2018 11:04:23 +0000
From: Jonathan Haigh <Jonathan.Haigh@arm.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "ptsneves@gmail.com"
	<ptsneves@gmail.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [oe] [oe-core] kernel-devicetree.bbclass: DTBs with path
	components
Thread-Index: AQHUFE6Bvh/mLrl/6UCj68aO8kLK7A==
Date: Thu, 5 Jul 2018 11:04:23 +0000
Message-ID: <DB5PR08MB0888F933BA080FF3A022792893400@DB5PR08MB0888.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Jonathan.Haigh@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR08MB0789;
	7:s9m6B8vKY882C5Tjc+YcMOb9CFNqLRsz0CzK9bAkJ9Xik0kNIhrRYTL7IucgYrj/OXiDrqrpqxZhieY1oLGEqt6dLh+84EIAqgH4VpLvIt2bwVxzynZlhRLcH6vuMXSlVXIII+6wTnBNdVCNuqJEgToALeTstslELDxu9YUEKvBQ9hwEcbrbFujDMUIuJooQLlNec23Ptcr2L2vETAzbVECMZ3SmkUj0hgrGXpvJ2q+q6VhWGrm7t8zdUQ68J979
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: d17ba043-e414-4105-5d9a-08d5e26710c5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:DB5PR08MB0789; 
x-ms-traffictypediagnostic: DB5PR08MB0789:
x-microsoft-antispam-prvs: <DB5PR08MB07891C882B7AEEEBC139791393400@DB5PR08MB0789.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(223705240517415);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:DB5PR08MB0789; BCL:0; PCL:0; RULEID:; SRVR:DB5PR08MB0789; 
x-forefront-prvs: 0724FCD4CD
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(346002)(136003)(396003)(366004)(376002)(40434004)(199004)(189003)(7736002)(68736007)(316002)(97736004)(53936002)(5660300001)(486006)(26005)(19627405001)(478600001)(7696005)(186003)(106356001)(102836004)(6116002)(105586002)(606006)(33656002)(476003)(39060400002)(3846002)(99286004)(110136005)(6506007)(25786009)(256004)(2501003)(5250100002)(966005)(5024004)(6436002)(14454004)(2906002)(6606003)(14444005)(72206003)(8676002)(81166006)(81156014)(2201001)(66066001)(236005)(8936002)(6306002)(54896002)(86362001)(74316002)(55016002)(9686003)(2900100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR08MB0789;
	H:DB5PR08MB0888.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: /mwEDt9t0t1Tq8pR0qt5/xKMAMldrsnwyJAZiqOb4c7Ge3ciRcPnUVpOtdY9/bDRFLNhk431gOG/0tGOQBPCWmCEQnh82QHgItMK/hRyOfYP39DVTiYHimlbxAa0RFi8tRhVjONlnu7jVR3SOmCOdTAdvsM3ApyP/xqAuVnxYOwT5efYr74TCtVc81pZ7bNwLDeol3nMCahEy1qtd5F9D1ggNFj1TPOCR0Pq5merrr7KkK6RyNAfpSNT7ciEFMKjPrmqdDHJ5vP3jFPakWY03+Vcx3pRdGlLSwdqYSZwuP/UT8WJYwq9skRvl1ZFRRIfZDk0MRRkJHRVeHkQaBn7las3vX4yXI7LEkTEIZTdlHM=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d17ba043-e414-4105-5d9a-08d5e26710c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2018 11:04:23.2500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB0789
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [oe-core] kernel-devicetree.bbclass: DTBs with path components
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
X-List-Received-Date: Thu, 05 Jul 2018 21:35:46 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,


The recent oe-core commit https://github.com/openembedded/openembedded-core=
/commit/2e7f3b2b9318d1e5395ad58131eafb873f614326 altered the normalize_dtb(=
) function to always apply basename to the DTB (or DTS) passed in to conver=
t a potentially full path to a DTB/DTS into a make target.


If I understand correctly, that's not the correct thing to do because the m=
ake targets can contain directory components - and some of the DTBs in meta=
-raspberrypi's KERNEL_DEVICETREE do contain directory components even thoug=
h they're not full paths to the DTBs (e.g. overlays/at86rf233.dtbo from met=
a-raspberrypi:conf/machine/include/rpi-base.inc).


I think the normalize_dtb() function should just strip leading parts of DTB=
/DTSs to make them relative to the 'dts' directory. I have a patch to make =
this change that I will post shortly.


Regards,


Jonathan

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

