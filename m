Return-Path: <Jonathan.Haigh@arm.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0084.outbound.protection.outlook.com [104.47.2.84])
	by mail.openembedded.org (Postfix) with ESMTP id 42B0575048
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 08:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
	s=selector1-arm-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rzjNNWrQAlygrF0DRbL6SJoe0kf3ecCgUDNHFKBSA1U=;
	b=hNzcjXjn3z57aD/Y1b4NGMxIffPrcO05TT4D8cSJ2eInewmJA7+pB5+zOq2hgLBiMaiYIgzJSbqhBoBrkWJC83ZsnARITZzeJCphh6yTKtA66YkKqjzwNBMwhXP48ZfNvIsu+r4zF9epoe+1c2dZpTiT2B+XbnIgnsd16NJlyqE=
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com (10.164.43.30) by
	DB5PR08MB0568.eurprd08.prod.outlook.com (10.161.246.14) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.930.19; Mon, 9 Jul 2018 09:47:26 +0000
Received: from DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::d004:d47f:8a18:ac18]) by
	DB5PR08MB0888.eurprd08.prod.outlook.com
	([fe80::d004:d47f:8a18:ac18%3]) with mapi id 15.20.0930.022;
	Mon, 9 Jul 2018 09:47:26 +0000
From: Jonathan Haigh <Jonathan.Haigh@arm.com>
To: Khem Raj <raj.khem@gmail.com>, akuster808 <akuster808@gmail.com>
Thread-Topic: [oe] [PATCH] kernel-devicetree.bbclass: DTB make targets may
	contain path components
Thread-Index: AQHUFFH1NPowGlLtokWoO3sI/rlkxqSB/xp7gAC37gCAAD/aAIAAF70AgAOb+JM=
Date: Mon, 9 Jul 2018 09:47:26 +0000
Message-ID: <DB5PR08MB08883ADBE0DE087F7350F8BF93440@DB5PR08MB0888.eurprd08.prod.outlook.com>
References: <9a8e4137ac914b168091b71d755d54281530789529-12623-1-git-send-email-jonathan.haigh@arm.com>
	<DB5PR08MB0888D243F1C828A518CBA90C93470@DB5PR08MB0888.eurprd08.prod.outlook.com>
	<CAMKF1soy4zSM3+c=iun_u6OsY4YsP2Sp0NWfB-zatsTdjFUxZg@mail.gmail.com>
	<b3728620-31d6-455d-7ce3-1d86c9dcf66c@gmail.com>,
	<CAMKF1sqO9r7rSaymFd34na7LBgGmmwfyqb6xD-N+YHpGVc7PGw@mail.gmail.com>
In-Reply-To: <CAMKF1sqO9r7rSaymFd34na7LBgGmmwfyqb6xD-N+YHpGVc7PGw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Jonathan.Haigh@arm.com; 
x-originating-ip: [217.140.96.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB5PR08MB0568;
	7:V0lfPxKbq/w24tXC12j+j4QmpmgC3kbSxfbja2bXJ5wiqeoDdBD5nyu51eqY3ttHt4/rScaHLV8RihL+tX/dsPe837pqdXusPuj93tYXgG7bsNuD36qJWDv0B31rOfZFBaHciE/6cic2z6y1xLZXWc7IhpLC/tQGKVLElU1h+3BzkE1LwBS1PN+K2MgCz94Xbm1Xf5ZndO4+tVDeyKBoxiYfSZre3DwZKvZBee3Qxcu+tjJaPtTzcnoEHCUN8JKm
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-ms-office365-filtering-correlation-id: 3372ff9c-4895-4ae9-62b3-08d5e580fa53
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:(223705240517415); BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600053)(711020)(48565401081)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:DB5PR08MB0568; 
x-ms-traffictypediagnostic: DB5PR08MB0568:
x-microsoft-antispam-prvs: <DB5PR08MB0568BA2C858B34D14A257F4F93440@DB5PR08MB0568.eurprd08.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(180628864354917)(223705240517415)(85827821059158)(264703809997249);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231311)(944501410)(52105095)(93006095)(93001095)(3002001)(10201501046)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:DB5PR08MB0568; BCL:0; PCL:0; RULEID:; SRVR:DB5PR08MB0568; 
x-forefront-prvs: 07283408BE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(39860400002)(136003)(366004)(376002)(346002)(396003)(189003)(199004)(40434004)(81166006)(81156014)(6116002)(55016002)(16297215004)(68736007)(39060400002)(3846002)(33656002)(5250100002)(236005)(2906002)(105586002)(4326008)(99286004)(25786009)(9686003)(8936002)(6506007)(110136005)(54906003)(476003)(53546011)(186003)(102836004)(446003)(53936002)(8676002)(54896002)(6306002)(6246003)(106356001)(11346002)(66066001)(316002)(7736002)(93886005)(966005)(7696005)(26005)(74316002)(575784001)(14444005)(229853002)(5024004)(72206003)(256004)(14454004)(86362001)(478600001)(19627405001)(6606003)(606006)(5660300001)(486006)(6436002)(97736004)(76176011)(2900100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB5PR08MB0568;
	H:DB5PR08MB0888.eurprd08.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: l64hCdZi41KNchEvBKCM1GAE9vuoMlS350BK1ufN/FfL9K9VQFdNZ3cI8bHj3ISae1BAocA4jbkEHTThDMlTeNuZVhBD+o82KwYMrvuqr3rjrSvqQZKwhNTNh4J+AdYoDJIuDfdts5VKt8plDtdPNugFEYSi7tfQhTYvFEho++8VTOPnjMSLLiWFj84NY0fjHQMrwtCrcQP3BwHFOcs4bIPEtoSV70aI6+zwlSsx4V2ImOLTvSznUXDb/pY4RBCZ9CTB9uRXHI5c9mxZbAsX0SFV893JyfDUySk28GcxS6J3wyTdiLFgu0syEzf1/zwjRu5t1Ja1Gu6SZdhopdVRr6tnrvQAwCK+UN8biPDhVfg=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3372ff9c-4895-4ae9-62b3-08d5e580fa53
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2018 09:47:26.0295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB0568
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Jeremy Johnson <Jeremy.Johnson@arm.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devicetree.bbclass: DTB make targets may contain path components
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
X-List-Received-Date: Tue, 10 Jul 2018 08:16:26 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> This patch is fine however, you should rebase it on top of master as of t=
oday.
> secondly, this should be sent to oe-core mailing list since its
> changing that layer


Ah, okay, I'll do that. Thanks Khem.

________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: 07 July 2018 03:38:48
To: akuster808
Cc: Jeremy Johnson; Jonathan Haigh; openembeded-devel
Subject: Re: [oe] [PATCH] kernel-devicetree.bbclass: DTB make targets may c=
ontain path components



On Fri, Jul 6, 2018 at 6:13 PM akuster808 <akuster808@gmail.com<mailto:akus=
ter808@gmail.com>> wrote:


On 07/06/2018 02:25 PM, Khem Raj wrote:
> On Fri, Jul 6, 2018 at 12:02 PM Jonathan Haigh <Jonathan.Haigh@arm.com<ma=
ilto:Jonathan.Haigh@arm.com>> wrote:
>> normalize_dtb() turns DTS and DTB paths into values that can be used as
>> make targets. These make targets sometimes contain some directory compon=
ents
>> so 'basename' is not suitable for turning the paths into make targets -
>> we should only strip off leading directory components of the path up to
>> and including the 'dts' directory (if it exists). For example:
>> * 'overlays/at86rf233.dtbo' should not be changed.
>> * 'some/directory/path/dts/overlays/at86rf233.dtbo' should be changed to
>>   'overlays/at86rf233.dtbo' rather than just 'at86rf233.dtbo'
>>
>> Signed-off-by: Jonathan Haigh <jonathan.haigh@arm.com<mailto:jonathan.ha=
igh@arm.com>>
>> ---
>>  meta/classes/kernel-devicetree.bbclass | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/kernel-devicetree.bbclass b/meta/classes/kerne=
l-devicetree.bbclass
>> index 9866d84..0ffa8e9 100644
>> --- a/meta/classes/kernel-devicetree.bbclass
>> +++ b/meta/classes/kernel-devicetree.bbclass
>> @@ -12,9 +12,10 @@ KERNEL_DEVICETREE_BUNDLE ?=3D "0"
>>  normalize_dtb () {
>>          DTB=3D"$1"
>>          if echo ${DTB} | grep -q '/dts/'; then
>> -               bbwarn "${DTB} contains the full path to the the dts fil=
e, but only the dtb name should be used."
>> +               bbwarn "${DTB} contains the full path to the the dts fil=
e, but the path should be relative to the dts directory."
>> +               DTB=3D`echo "${DTB}" | sed 's,^.*/dts/,,'`
>>          fi
>> -       DTB=3D`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
>> +       DTB=3D`echo "${DTB}" | sed 's,\.dts$,.dtb,g'`
> This patch is fine however, you should rebase it on top of master as of t=
oday.
> secondly, this should be sent to oe-core mailing list since its
> changing that layer

this landed in master already. patch was posted earlier this week.

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=3D8b9264824689e99=
fb257901be3c0f91f79f920ef
>

They are different patches

>>          echo "${DTB}"
>>  }
>>
>> --
>> 2.7.4
>>
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org<mailto:Openembedded-devel@list=
s.openembedded.org>
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

