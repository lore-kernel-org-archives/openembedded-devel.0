Return-Path: <Jonathan.Haigh@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0046.outbound.protection.outlook.com [104.47.2.46])
	by mail.openembedded.org (Postfix) with ESMTP id AFFE160557
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jul 2018 16:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=G4Df2aDnQNcRe/gbbe+BEyeWjP6RJ23NaIxvpKfvm7k=;
	b=YpeCVuOummnVp56unJz58Nd0SSjPaSSmQr4BaLtVHHAAFXSqAfmwQI6+tzxiJ/zGEfhtqBFdbDM93hBf2mbMUiv2cyEDQmuAM8fvstYpudfffU3HG4EhWEgAch60lzW0zoyJ9H4L7XqZ+rDWqo3imQtjioT8nobfAZgih8czb3E=
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com (10.164.43.30) by
	DB5PR08MB1048.eurprd08.prod.outlook.com (10.166.14.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.930.21; Fri, 6 Jul 2018 09:18:05 +0000
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::d004:d47f:8a18:ac18]) by
	DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::d004:d47f:8a18:ac18%3]) with mapi id 15.20.0930.016;
	Fri, 6 Jul 2018 09:18:05 +0000
From: Jonathan Haigh <Jonathan.Haigh@arm.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "ptsneves@gmail.com"
	<ptsneves@gmail.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [oe] [oe-core] kernel-devicetree.bbclass: DTBs with path
	components
Thread-Index: AQHUFE6Bvh/mLrl/6UCj68aO8kLK7KSBOfCAgACoDJ4=
Date: Fri, 6 Jul 2018 09:18:04 +0000
Message-ID: <DB5PR08MB08888E3CE7B9730575B6888E93470@DB5PR08MB0888.eurprd08.prod.outlook.com>
References: <DB5PR08MB0888F933BA080FF3A022792893400@DB5PR08MB0888.eurprd08.prod.outlook.com>,
	<39ba35a4-462f-75e0-68d8-8d7cbc6937be@gmail.com>
In-Reply-To: <39ba35a4-462f-75e0-68d8-8d7cbc6937be@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Jonathan.Haigh@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR08MB1048;
	7:R+p4Z+r4RqK+O1z7k2SQ/OpecwVDg7U+5hQg96VSJGpLZJL10QpA5Ywb5vx2zRQS1CMRReqRVRlpi8/fgMJrbDDuO+s1jy7jnEQjTRT01J8Jf8CgpD66mmzjPGZ9sFE5cMeLn534qkYGy4mVCmpOonhtr0LfX8vLhq/fTkcGUsZ9bXMbUfUhqJ+gn2S+FLSq00c1W8wD3LBIKATl/4xBIUGCWp+W6QSDP0x4+CjcgVzDs+CwF0sXTItlNtmvvYbJ
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 5758578b-4bbf-41d2-17e3-08d5e3216166
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:(223705240517415); BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:DB5PR08MB1048; 
x-ms-traffictypediagnostic: DB5PR08MB1048:
x-microsoft-antispam-prvs: <DB5PR08MB104875ABA2840120C583186F93470@DB5PR08MB1048.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(223705240517415)(85827821059158)(264703809997249);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231254)(944501410)(52105095)(3002001)(93006095)(93001095)(10201501046)(6055026)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DB5PR08MB1048; BCL:0; PCL:0; RULEID:; SRVR:DB5PR08MB1048; 
x-forefront-prvs: 0725D9E8D0
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(136003)(376002)(366004)(39860400002)(346002)(189003)(199004)(40434004)(51914003)(14444005)(305945005)(105586002)(106356001)(74316002)(256004)(316002)(2201001)(6436002)(7736002)(26005)(5024004)(102836004)(6506007)(53546011)(55016002)(110136005)(81166006)(8676002)(81156014)(2900100001)(2906002)(2501003)(476003)(478600001)(8936002)(446003)(11346002)(486006)(86362001)(4326008)(53936002)(72206003)(966005)(99286004)(25786009)(39060400002)(66066001)(33656002)(7696005)(76176011)(97736004)(68736007)(6306002)(5660300001)(6246003)(5250100002)(14454004)(6116002)(229853002)(3846002)(9686003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR08MB1048;
	H:DB5PR08MB0888.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: +SNQYLqLR48G3kqzB57soJKO0cY7AP70pPN/7NoBG0YLbjS3pK19NPp6O7kGbE2JhJBoP2xEqaM8qf7aZjZHhSfXv0MqGdNCxTkAx6mhGStATcPNWxzBYx2crzbilLNSxYlIdKQuKCnQKcAAJ2ToGQpdkjXEocL1uh+LIqJSJaGsN1vBL6x/KfFVOgi58TjJ/BSKNLZarh/gpNaR4x/qHVcD418NL5v6CsSaPdAsbPe0TKsNOt7993CPa19Fr2blAQyJ9q8tuyyW27w1qTi8LW11hIB7FDF8bDZ2ie66of09cIylHPnONJaCZcWt5X935fNCmdwp4N0rKNeni/PhNa8IgdF7T+Hs+x6FbNFgwpQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5758578b-4bbf-41d2-17e3-08d5e3216166
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2018 09:18:04.9409 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB1048
Cc: Jeremy Johnson <Jeremy.Johnson@arm.com>
Subject: Re: [oe-core] kernel-devicetree.bbclass: DTBs with path components
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
X-List-Received-Date: Sat, 07 Jul 2018 16:47:08 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Thanks for the response.

Reverting 2e7f3b2b9318d1e5395ad58131eafb873f614326 works for me (my KERNEL_=
DEVICETREEs don't actually contain any full paths to DTBs or DTSs).

In the case where the warning is emitted  (a full path to the DTB/DTS) the =
current code still may not handle some cases properly - when a DTB/DTS is g=
iven as a full path but that full path is to a subdirectory of dts/. In tha=
t case the current code will use basename to strip off all but the filename=
, but if I understand correctly, any path components after the dts/ directo=
ry shouldn't be stripped. That case comes with a BitBake warning though, so=
 I guess maybe it's not supported and isn't important.


Paulo,

The scenario you've described is a bit different to what I was thinking abo=
ut. Each element in KERNEL_DEVICETREE is translated by normalize_dtb() and =
then passed straight to oe_runmake in do_compile_append() in kernel-devicet=
ree.bbclass. I'd guess that you need to do a bit more work to get your (tra=
nslated) dtb path to be a valid make target than putting the DTS in ${WORKD=
IR} (maybe putting your DTS in the kernel source's dts directory would do i=
t).

The cases I was thinking about were where KERNEL_DEVICETREE has paths to DT=
S or DTB files that are already in the kernel's dts directory.

Thanks,

Jonathan

From: Khem Raj <raj.khem@gmail.com>
Sent: 05 July 2018 23:41
To: Jonathan Haigh; openembedded-devel@lists.openembedded.org; ptsneves@gma=
il.com; richard.purdie@linuxfoundation.org
Subject: Re: [oe] [oe-core] kernel-devicetree.bbclass: DTBs with path compo=
nents


On 7/5/18 4:04 AM, Jonathan Haigh wrote:
> Hi,
>
>
> The recent oe-core commit  https://github.com/openembedded/openembedded-c=
ore/commit/2e7f3b2b9318d1e5395ad58131eafb873f614326 altered the normalize_d=
tb() function to always apply basename to the DTB (or DTS) passed in to con=
vert a potentially full path to a DTB/DTS into a make target.
>
>
> If I understand correctly, that's not the correct thing to do because the=
 make targets can contain directory components - and some of the DTBs in me=
ta-raspberrypi's KERNEL_DEVICETREE do contain directory components even tho=
ugh they're not full paths to the  DTBs (e.g. overlays/at86rf233.dtbo from =
meta-raspberrypi:conf/machine/include/rpi-base.inc).
>
>
> I think the normalize_dtb() function should just strip leading parts of D=
TB/DTSs to make them relative to the 'dts' directory. I have a patch to mak=
e this change that I will post shortly.
>


it has already been reverted today.
see
http://git.openembedded.org/openembedded-core/commit/?id=3D0d725c76c113dec4=
41a7319a6ee997e4ae8c4c88

please update to latest master.

>
> Regards,
>
>
> Jonathan
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any  purpose, or store or copy the information =
in any medium. Thank you.
>



IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

