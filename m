Return-Path: <Jonathan.Haigh@arm.com>
X-Greylist: delayed 82722 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 06 Jul 2018 10:36:30 UTC
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50050.outbound.protection.outlook.com [40.107.5.50])
	by mail.openembedded.org (Postfix) with ESMTP id 8F9CC6E660
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2018 10:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Q4REI9nsEN5cr7OnubD0BUJEYgENtJza0OtNVM7nlTE=;
	b=j7JBS/AlipvLEj4V/HkinAAha6KS8IRCwvVG6ufeW6WisqFYAhwCbC53R8k2w4a5WwUy3lstn4rev+ZZDAPiRqHnsUpWlUxUivbfL2b2xALB4h5BJzpIVW2ZvpdzgDWQ2e2p+PXb19fEnfmdNAdLRJZBHI1Lo25OBG/cRRVZGRg=
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com (10.164.43.30) by
	DB5PR08MB0374.eurprd08.prod.outlook.com (10.161.241.153) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.906.26; Fri, 6 Jul 2018 10:03:09 +0000
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::d004:d47f:8a18:ac18]) by
	DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::d004:d47f:8a18:ac18%3]) with mapi id 15.20.0930.016;
	Fri, 6 Jul 2018 10:03:08 +0000
From: Jonathan Haigh <Jonathan.Haigh@arm.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "ptsneves@gmail.com"
	<ptsneves@gmail.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [oe] [oe-core] kernel-devicetree.bbclass: DTBs with path
	components
Thread-Index: AQHUFE6Bvh/mLrl/6UCj68aO8kLK7KSBOfCAgACoDJ6AABZgPw==
Date: Fri, 6 Jul 2018 10:03:08 +0000
Message-ID: <DB5PR08MB088851624CB02A24CCD6190793470@DB5PR08MB0888.eurprd08.prod.outlook.com>
References: <DB5PR08MB0888F933BA080FF3A022792893400@DB5PR08MB0888.eurprd08.prod.outlook.com>,
	<39ba35a4-462f-75e0-68d8-8d7cbc6937be@gmail.com>,
	<DB5PR08MB08888E3CE7B9730575B6888E93470@DB5PR08MB0888.eurprd08.prod.outlook.com>
In-Reply-To: <DB5PR08MB08888E3CE7B9730575B6888E93470@DB5PR08MB0888.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Jonathan.Haigh@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR08MB0374;
	7:26Pt7QdFLLxSmKb4L0QLuZAFpYeu7bJDhpS0B3r0NKefELjZ0+ij0H1Dn1yfl9nBu42wKCKom4Raact+ymK0NRrMzleqXE/WUHuM+TI5jRv3K0w9oOpjpIF2nnbDXkhXQYh05pBlW4DXlqE7ySiNlvngz5cTp+cj3YjqqlXrwlzE6NPcufuKl8FP0JuMmjDAMDovVm2zfq19x+ZHtb5RIifKUv/ifd7VkEQvMw+Y6kthABo9nFTNMzob9xFeyMP/
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 64b662dc-077a-4a7f-f627-08d5e327ace4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:(223705240517415); BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:DB5PR08MB0374; 
x-ms-traffictypediagnostic: DB5PR08MB0374:
x-microsoft-antispam-prvs: <DB5PR08MB037474661A3C2DA866076B2693470@DB5PR08MB0374.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(223705240517415)(85827821059158)(264703809997249);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3231254)(944501410)(52105095)(3002001)(6055026)(149027)(150027)(6041310)(20161123560045)(20161123558120)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DB5PR08MB0374; BCL:0; PCL:0; RULEID:; SRVR:DB5PR08MB0374; 
x-forefront-prvs: 0725D9E8D0
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(366004)(136003)(346002)(39860400002)(396003)(199004)(40434004)(51914003)(189003)(446003)(7696005)(9686003)(105586002)(26005)(106356001)(6606003)(11346002)(33656002)(53936002)(99286004)(2501003)(39060400002)(476003)(966005)(72206003)(55016002)(19627405001)(4326008)(186003)(5250100002)(6246003)(2900100001)(6506007)(6436002)(8936002)(6306002)(81156014)(54896002)(53546011)(606006)(102836004)(2201001)(6116002)(486006)(7736002)(14454004)(81166006)(110136005)(229853002)(2940100002)(236005)(86362001)(2906002)(256004)(66066001)(8676002)(3846002)(97736004)(74316002)(5024004)(76176011)(25786009)(14444005)(316002)(478600001)(5660300001)(68736007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR08MB0374;
	H:DB5PR08MB0888.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: r13woUIKJxtaRLkRnR2glCqVNUMoNMy6dRoQHZsCm1Gni5Gvdc7XDMfhTPuS5TWpZWw96vbsm8RUX+qFmiJ+Mc4F1raiq2/i8JC282uM17Wma4z+u2eDIzqEOpvhqLR0R1EwkjKe/vfkAE6nXBal09qIdj7s6bUj7epOl84Wv0Yzof0J6hOh5x0kVh/a8UyZTcaVD7NKwJRHqZ/H7KRsNAdttyU+lvDOZsUFrKspSDAsBLZ+DHoNJlZfJiDzL4unpq0kFNYm8y2keJDrALVN9L1OKZIZ7HWTDoXZBoRoT5oxGSpxlJ9RpapFqABnB4rskDoALHGVzB65QyRLblpY0R3CY/zPXcxIK+XEuIkUFe0=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b662dc-077a-4a7f-f627-08d5e327ace4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2018 10:03:08.6268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB0374
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Fri, 06 Jul 2018 10:36:31 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I've just noticed that my patch never actually made it to the mailing list.=
 I'll try to send it again.

________________________________
From: Jonathan Haigh
Sent: 06 July 2018 10:18:04
To: Khem Raj; openembedded-devel@lists.openembedded.org; ptsneves@gmail.com=
; richard.purdie@linuxfoundation.org
Cc: Jeremy Johnson
Subject: Re: [oe] [oe-core] kernel-devicetree.bbclass: DTBs with path compo=
nents

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

