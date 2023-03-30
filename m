Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706CDC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 04:10:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17294.1680149407695549290
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Mar 2023 21:10:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=bYB/oQCJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3453186718=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32U3fjeE000726
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 04:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=UWQ76dsGXGQwt2pjvP+pql7yQJCc6axLYDpOuKUzoQg=;
 b=bYB/oQCJS61+w3OHpNgs6TsHgWBuPBBfN3CIcLV02ZvcAy1VYdI41dbPskaBugnj4nka
 g0Vus9aljrJn9HuspVL5ThFNzXo9i8H+mcUGm1tSv5G/dTwpxVbXFTVHq/W0VP1JSFPW
 54WsyPOk9w1lcLdSRjdeHa0jm+corDkZO8nwn6mVMD/gGrYiP2u2ER8U2tSOb0UB8G4B
 YVba3zp17NHGcT4TtGruCzbaDeVuUBgOUiE4AAtevSm3Ny37aAy+UZunt2eYoHeRROXU
 0PJRaWcfuDPdq+oCWhHzlxliMic9FCgB2nDeUOMjpGub1mh24wfLi7LN3VcvKQeiaLZD 6w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php645u8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 04:10:06 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32U4A62w021528
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 04:10:06 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3php645u8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 04:10:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQ97+gLib3iwM8ZDwRGkbVoAu9fHKgxiKYYlXBt0b0WXHP7Uvcc3db/FRmyi4oGXmkecuQjaJZEFtj7TvvJ8Pj68C8535dfl92aPc6Kut/+1AuWONrCIgZxbyFKN0kjNO/s/DD549O7e3jA9g+k1uVL5uqStjgHWdtGeGgZU7IbxO4h/hDzCajpZRgxGRqiPP0o106o5l8Kj0ZrELomU0xwvMdGCrri2F0RiBhy3PC0aYpV7dCTOFH5aJArquBJYaGm/u3QZjYQPvfyeu3EZ/m8J8hqK9HchRKdt5WioIz0xW1BmsWP5Pip28qXvi80L/K8I8fDIOA6CY62Yi808xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UWQ76dsGXGQwt2pjvP+pql7yQJCc6axLYDpOuKUzoQg=;
 b=BQK+VQqNSC9cZvI1hO81ryKgqS40kiGELUng3mJJXHVVE4O7lbVaMiOav4xepfvhQePfMckymM4wfziXIOgnEj8BfOr0vnUk5Xn/6xOf1jaEk1bS1wuQa/NIFNtcfp64yGlDeQ77ZK//AwTEfvVGi45scH78qrhW6SHmso6ooxeyiCQNG+oBMIIfnFwC91zx3997TYj3GAG/MBASRuxENhFl1JT/VOUV6veSkEdj73Ng3eyxCqkD6DTk6w13IMtg17a0keD41BRIL+JD0F7WO+qi6wJuTyNurzch4g2BvBi764WIDq5kaVRA72XTW2XIc6mh2bbnqizvvTVVhYy15g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS0PR11MB6471.namprd11.prod.outlook.com (2603:10b6:8:c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.32; Thu, 30 Mar
 2023 04:10:03 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::da21:2571:f1ba:7f5b]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::da21:2571:f1ba:7f5b%6]) with mapi id 15.20.6254.022; Thu, 30 Mar 2023
 04:10:03 +0000
From: "Shinde, Yash" <Yash.Shinde@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        Yash Shinde
	<yashinde145@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "Kallapa, Umesh" <Umesh.Kallapa@windriver.com>,
        "Gowda, Naveen"
	<Naveen.Gowda@windriver.com>,
        "Kokkonda, Sundeep"
	<Sundeep.Kokkonda@windriver.com>,
        "Moodalappa, Shivaprasad"
	<Shivaprasad.Moodalappa@windriver.com>
Subject: RE: [meta-oe][PATCH] librelp: fix function inline errors in debug
 build
Thread-Topic: [meta-oe][PATCH] librelp: fix function inline errors in debug
 build
Thread-Index: AQHZYhRxkf9mYtuiKkWq5/5aJlZbLK8RwrEAgAALLPg=
Date: Thu, 30 Mar 2023 04:10:03 +0000
Message-ID: 
 <SJ1PR11MB61297C523AD0DD05C923C0AFEB899@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20230329075827.437650-1-yashinde145@gmail.com>
 <f6a4a396-84a6-9787-ad8a-d4e283a6442d@windriver.com>
In-Reply-To: <f6a4a396-84a6-9787-ad8a-d4e283a6442d@windriver.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|DS0PR11MB6471:EE_
x-ms-office365-filtering-correlation-id: 2c806f07-e0b7-49c4-3633-08db30d4a34a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qGg2OSjjqWVo94BPdXtnwYX/PnnnyR0RJrFQ38l98T52dl1CdnkM9eLNRI1aVy7EMyYj69BGa2GPMjESgh2E/qpkXjFa434nNE9njeZJQ8DKKZNiHK9o8Wi6l9UQ+WWjgNjCD2W8Bfl3WF9cQlntWD8se5Z0IKHH1qPRAO+j80Y2gLVkScI104uOxPNOW8qQ2ELtFPbyZdQ8wSWCIQF6nO/h8XkoXRz4ImTBj5MCpZK2qrEcW0p2+P2WzNevcQc7Q0HQLnjvzNPSGhhOrSzI1Hn3UcTSWNbGdWO1PQrClggB6CdRNDNqAUNkevPsJCBGn9Sjpz7bR/G4rqn3n132x076XkkW5ghgZFIobJu49eh6OCxzIhubfKurmPDNvJW9yKjjKvklxuD6Q/B9qCGjGPyrzctFHeP6kZ/nCm2Kp+O9LnIc7A0uiDx/5qc8untXzJkUZlBeRPCuM91vmRM+oZXovW/PuNvU5XuPp+o0hi04AZl6iLRwQfBH2GHYfZKzZ1sPJW1/whdv+NFdu088/3UtP1PSiOfExj/Phlcde5e+VK2jtWYaubcxBkAk3DmvHjQH6Tm6au6dsLvfWHPxHkIv0zXcUKSpwuEDsV67RHwjRpDz/+AIrEHFB4iJYXYloqfFHrfa5EK/25JdpJLfcw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(136003)(396003)(346002)(366004)(376002)(451199021)(86362001)(33656002)(38070700005)(166002)(2906002)(966005)(478600001)(71200400001)(55016003)(83380400001)(7696005)(107886003)(38100700002)(53546011)(110136005)(9686003)(316002)(66446008)(91956017)(8676002)(66476007)(64756008)(66946007)(122000001)(66556008)(41300700001)(186003)(26005)(52536014)(54906003)(76116006)(6506007)(5660300002)(8936002)(9326002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?310HAdNnf39Wio7azyWJhiz2DT8jYE9wbZmpRrddQcHTvwa2OlcSBw70?=
 =?Windows-1252?Q?XTVs6KSnyfPH0bOnESu3dxaX8goQ7+hjYQiGLIU8Z5wC4XWl99SSL8Sl?=
 =?Windows-1252?Q?ODKFZPRH8OokT4Ivdjry6IgzL/a1KDmrV50gCeRlPRL0GtCd9+ArkkZD?=
 =?Windows-1252?Q?2G0Ki8tDutr6X+ToZJbSUuHnX9tnsTSVbfnu/Hx2tsbgekC/cjMnLytg?=
 =?Windows-1252?Q?oQ1LxzF3o7AuLJgsjZcd9I06Z87DZ6SjgyzTRn6qp+0YTk7vdTeRbgyC?=
 =?Windows-1252?Q?ulKv+xrGXXiMpMyIkP/4HmfMTekHNebpB2xVw/eAByc7qTF4pyQy4vkc?=
 =?Windows-1252?Q?xegofftK/dm2yG9walCij9n6a9k7qJJiYUg0hFY2UilEmdfGEqco790b?=
 =?Windows-1252?Q?sNpiZv5Xj8KvDUbAMrXVWM4yhS5KdoZXnKgJ0gTI8a7rU9Rb9LYE1LVO?=
 =?Windows-1252?Q?egjNf1xsppAvI/OJghP32eVKHBGGJTej3ZRDwXwbtNg+CNxIOwyWQNCD?=
 =?Windows-1252?Q?hCL7u+W+uNXIp/aXr7DldfGkk7ojDr1AEmR5MPURpMPHwjkeJL/ni3db?=
 =?Windows-1252?Q?C5DxL6FifyJLsuagHB5hacBOYBHBD6oFhCRRXJ4gxndwvteyxeNGp7Fy?=
 =?Windows-1252?Q?8QhXQNixmbfgBo5sxOMe14d1SxWbu50fGBHWwhwISmoQzMRYN9WpNsJx?=
 =?Windows-1252?Q?/ytdbEZIKXFOeIiFPJqQHNCLpIeLRiMC8jvLkGRoNrqOappjw6rpgtBX?=
 =?Windows-1252?Q?/jtS9s0J4TChNTMe3KsQabKZcE56sEU10Uc0GnauiCLUy3rheSbi9GjT?=
 =?Windows-1252?Q?L1/YTNkBpE63Ay9/Bu0KoQRxgg/Q9JBHWlnB5PK+pYrNN7Ydm0l17T1Y?=
 =?Windows-1252?Q?oqhCsHyIjFF+xR/UkpkDyCdeutscF9HWbGXrPK9QRbf74w9xPFRGYHfY?=
 =?Windows-1252?Q?HrufLK8eY6+eCLn/q/84y3moKheXpzOQ8lwmjYLzveU8k/2fcuDk+0Fr?=
 =?Windows-1252?Q?Lo25PzG174n49zP/K7IQKKlvCC7r95eOVI6FVkeLYj4qerbn4D6BWJL5?=
 =?Windows-1252?Q?7KaWPIG9NmNuUirxWGJFfm9VNefsXXh1Jajocfb4lwFalfSh/jaBmQ56?=
 =?Windows-1252?Q?tHUknE7OmGxmInJ4VOCJMTI8/wvQ8Yqp76iLWSVRV2PiY2wpBti4/9vq?=
 =?Windows-1252?Q?6Umlr2nJoE6EtWc29x9RbDIITQJ7O6atQXwUG31Op50QRvU0smqIqG/A?=
 =?Windows-1252?Q?WUhTErm9tjwwbsH8o+zIwDG3OKTaW58+mNi52cX3wcteF56Xu+NPUROk?=
 =?Windows-1252?Q?k7OLVKdAwm21RURheJTwmx9k9J9/L3+bOZ2+AVxJa4d/q1wviH55ONLJ?=
 =?Windows-1252?Q?yk0NNSf0SQyGeNuAA26X9JUVh4QCynjkqYeYVykK9hBwCoqIQVv/Nykr?=
 =?Windows-1252?Q?KbewcRiZrQszj2MmGTvKBqexSaxgR5wkUZIYAIuTJmvnNLFirXP54Ox4?=
 =?Windows-1252?Q?m2i3FwPRxvFuFhQFJc9sxPf2kaU4c16CKrYbM0V5ISREHXKxbfys+oZx?=
 =?Windows-1252?Q?EgyztIXLk8am+f0Lb0najfBbjcwsMIFeHPVWsQK2HYdO4KrX0fZeGhg8?=
 =?Windows-1252?Q?+NnyylraFU/KPsJHwsjrPJ0PqChFbclZifJUI4D0gML12eC06kd/XhR+?=
 =?Windows-1252?Q?jrR5x+GNMaIVDWHUYOg8gqHvqMKEqlElxZLlClICecRWREvkfKjYKOVN?=
 =?Windows-1252?Q?9Ki1C6BO9kZ8d30CsqA=3D?=
Content-Type: multipart/alternative;
	boundary="_000_SJ1PR11MB61297C523AD0DD05C923C0AFEB899SJ1PR11MB6129namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c806f07-e0b7-49c4-3633-08db30d4a34a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 04:10:03.3472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eDl6ZLa3WWQZgHpfRtbReVDEfjmbN/xxm+T4GItOnmbPTFU8f2nkcvpKeVv6sf58Z3BGQ+dbHc0k92XoG/Iv1Em2aC5lStn9Nd7I1DNLyAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6471
X-Proofpoint-ORIG-GUID: 3K5UaQATCSywb7I9VjYngvbxbspY6fBb
X-Proofpoint-GUID: 3wi9GbFG5wxuhHK-p3IDE2zq7tqMoc05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_16,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303300032
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 04:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101826

--_000_SJ1PR11MB61297C523AD0DD05C923C0AFEB899SJ1PR11MB6129namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Yash,



First, if we're going to take this approach, you should revert my work-arou=
nd as part of this commit:

commit ca10312c4c7e88d67f4b487ae9afcbfdf92898d6
Author:     Randy MacLeod <Randy.MacLeod@...><mailto:Randy.MacLeod@...>
Date: Wed Mar 1 19:24:27 2023

    librelp: make inline errors be warnings in debug build
        ...

>Will send a v2 if needed.



BUT...

The problem isn't so much that the code doesn't get in-lined when doing a d=
ebug build but
that it fails to compile.  I think this is a compiler regressions since
I was not able to reproduce the error when compiling natively using Ubuntu-=
22.04 (gcc-11.3) but
was able to reproduce it using Fedora-37, gcc --version : gcc (GCC) 12.2.1 =
20221121 (Red Hat 12.2.1-4)


Does the change you made actually build with the two compiler versions abov=
e?

>I tested my changes on LINCD sources which have GCC 12.2. I didn=92t check=
ed the above mentioned versions.

Is there documentation that states that

static inline void



is not as portable as:



__attribute__((always_inline)) static inline void

I suspect there is not but I'm not a compiler geek!

>As you mentioned in https://github.com/rsyslog/librelp/issues/256#issue-16=
05905115, it only happens when using -Og not -O[0-3]  i.e without any optim=
izations and as per https://gcc.gnu.org/onlinedocs/gcc/Inline.html<https://=
gcc.gnu.org/onlinedocs/gcc/Inline.html#:~:text=3DGCC%20does%20not%20inline%=
20any%20functions%20when%20not%20optimizing%20unless%20you%20specify%20the%=
20%E2%80%98always_inline%E2%80%99%20attribute%20for%20the%20function%2C%20l=
ike%20this%3A> it=92s mentioned that:

GCC does not inline any functions when not optimizing unless you specify th=
e =91always_inline=92 attribute for the function, like this:
/* Prototype.  */ inline void foo (const char) __attribute__((always_inline=
));

>Please let me know if we are on the same page.


../Randy


Regards,
Yash

From: MacLeod, Randy<mailto:Randy.MacLeod@windriver.com>
Sent: 29 March 2023 19:06
To: Yash Shinde<mailto:yashinde145@gmail.com>; openembedded-devel@lists.ope=
nembedded.org<mailto:openembedded-devel@lists.openembedded.org>
Cc: Kallapa, Umesh<mailto:Umesh.Kallapa@windriver.com>; Gowda, Naveen<mailt=
o:Naveen.Gowda@windriver.com>; Kokkonda, Sundeep<mailto:Sundeep.Kokkonda@wi=
ndriver.com>; Moodalappa, Shivaprasad<mailto:Shivaprasad.Moodalappa@windriv=
er.com>; Shinde, Yash<mailto:Yash.Shinde@windriver.com>
Subject: Re: [meta-oe][PATCH] librelp: fix function inline errors in debug =
build

On 2023-03-29 03:58, Yash Shinde wrote:

With DEBUG_BUILD =3D "1", the following errors occur:



   src/relpsess.c:95:1: error:

      inlining failed in call to 'relpSessFreePermittedPeers': function not=
 considered for inlining [-Werror=3Dinline]



   src/tcp.c:146:1: error:

      inlining failed in call to 'relpTcpFreePermittedPeers': function not =
considered for inlining [-Werror=3Dinline]



   src/tcp.c:158:1: error:

      inlining failed in call to 'callOnAuthErr': function not considered f=
or inlining [-Werror=3Dinline]



Compiler does not inline any functions when not optimizing unless you speci=
fy the =91always_inline=92 attribute for the function. Add "__attribute__((=
always_inline))" to avoid these function inline errors.

Hi Yash,



First, if we're going to take this approach, you should revert my work-arou=
nd as part of this commit:

commit ca10312c4c7e88d67f4b487ae9afcbfdf92898d6
Author:     Randy MacLeod <Randy.MacLeod@windriver.com><mailto:Randy.MacLeo=
d@windriver.com>
Date: Wed Mar 1 19:24:27 2023

    librelp: make inline errors be warnings in debug build
        ...



BUT...

The problem isn't so much that the code doesn't get in-lined when doing a d=
ebug build but
that it fails to compile.  I think this is a compiler regressions since
I was not able to reproduce the error when compiling natively using Ubuntu-=
22.04 (gcc-11.3) but
was able to reproduce it using Fedora-37, gcc --version : gcc (GCC) 12.2.1 =
20221121 (Red Hat 12.2.1-4)



Does the change you made actually build with the two compiler versions abov=
e?
Is there documentation that states that

static inline void



is not as portable as:



__attribute__((always_inline)) static inline void

I suspect there is not but I'm not a compiler geek!

../Randy











Upstream-Status: Tracked by upstream bug: https://github.com/rsyslog/librel=
p/issues/256



Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com><mailto:Yash.Shinde@w=
indriver.com>

---

 ...02-librelp-fix-function-inline-error.patch | 59 +++++++++++++++++++

 1 file changed, 59 insertions(+)

 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0002-librelp-f=
ix-function-inline-error.patch



diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0002-librelp-fix-func=
tion-inline-error.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0002-lib=
relp-fix-function-inline-error.patch

new file mode 100644

index 000000000..60cf1b632

--- /dev/null

+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0002-librelp-fix-function-in=
line-error.patch

@@ -0,0 +1,59 @@

+From dc841f01fb6167ec9a80e373c5f4d2f5e3222ed6 Mon Sep 17 00:00:00 2001

+From: Yash Shinde <Yash.Shinde@windriver.com><mailto:Yash.Shinde@windriver=
.com>

+Date: Tue, 28 Mar 2023 04:06:58 +0000

+Subject: librelp: fix function inline errors in debug build

+

+With DEBUG_BUILD =3D "1", the following errors occur:

+

+   src/relpsess.c:95:1: error:

+      inlining failed in call to 'relpSessFreePermittedPeers': function no=
t considered for inlining [-Werror=3Dinline]

+

+   src/tcp.c:146:1: error:

+      inlining failed in call to 'relpTcpFreePermittedPeers': function not=
 considered for inlining [-Werror=3Dinline]

+

+   src/tcp.c:158:1: error:

+      inlining failed in call to 'callOnAuthErr': function not considered =
for inlining [-Werror=3Dinline]

+

+Compiler does not inline any functions when not optimizing unless you spec=
ify the =91always_inline=92 attribute for the function. Add "__attribute__(=
(always_inline))" to avoid these function inline errors.

+

+Upstream-Status: Tracked by upstream bug: https://github.com/rsyslog/libre=
lp/issues/256

+

+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com><mailto:Yash.Shinde@=
windriver.com>

+---

+

+diff --git a/src/relpsess.c b/src/relpsess.c

+index ee7b595..aa52b71 100644

+--- a/src/relpsess.c

++++ b/src/relpsess.c

+@@ -91,7 +91,7 @@ callOnErr(const relpSess_t *__restrict__ const pThis,

+

+

+ /* helper to free permittedPeer structure */

+-static inline void

++__attribute__((always_inline)) static inline void

+ relpSessFreePermittedPeers(relpSess_t *const pThis)

+ {

+        int i;

+diff --git a/src/tcp.c b/src/tcp.c

+index 7a75cc4..f4088c0 100644

+--- a/src/tcp.c

++++ b/src/tcp.c

+@@ -142,7 +142,7 @@ static int relpTcpChkPeerName(relpTcp_t *const pThis, =
void* cert);

+

+

+ /* helper to free permittedPeer structure */

+-static inline void

++__attribute__((always_inline)) static inline void

+ relpTcpFreePermittedPeers(relpTcp_t *const pThis)

+ {

+        int i;

+@@ -154,7 +154,7 @@ relpTcpFreePermittedPeers(relpTcp_t *const pThis)

+ }

+

+ /* helper to call onAuthErr if set */

+-static inline void

++__attribute__((always_inline)) static inline void

+ callOnAuthErr(relpTcp_t *const pThis, const char *authdata, const char *e=
msg, relpRetVal ecode)

+ {

+        pThis->pEngine->dbgprint((char*)"librelp: auth error: authdata:'%s=
', ecode %d, "

+



--

# Randy MacLeod

# Wind River Linux


--_000_SJ1PR11MB61297C523AD0DD05C923C0AFEB899SJ1PR11MB6129namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Helvetica;
	panose-1:2 11 5 4 2 2 2 2 2 4;}
@font-face
	{font-family:Mangal;
	panose-1:2 4 5 3 5 2 3 3 2 2;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<div>
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:7.5pt;mar=
gin-left:0cm;background:white">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">Hi Yash,<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:7.5pt;mar=
gin-left:0cm;background:white">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333"><o:p>&nbsp;</o:p></span></p>
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:7.5pt;mar=
gin-left:0cm;background:white">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">First, if we're going to take this approach, you should re=
vert my work-around as part of this commit:<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:7.5pt;mar=
gin-left:0cm;background:white">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">commit ca10312c4c7e88d67f4b487ae9afcbfdf92898d6<br>
Author:&nbsp;&nbsp;&nbsp;&nbsp; Randy MacLeod&nbsp;<a href=3D"mailto:Randy.=
MacLeod@..." target=3D"_blank"><span style=3D"color:#337AB7">&lt;Randy.MacL=
eod@...&gt;</span></a><br>
Date: Wed Mar 1 19:24:27 2023<br>
<br>
&nbsp;&nbsp;&nbsp; librelp: make inline errors be warnings in debug build<b=
r>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; ...<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:7.5pt;mar=
gin-left:0cm;text-indent:36.0pt;background:white">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">&gt;Will send a v2 if needed.<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:7.5pt;mar=
gin-left:0cm;background:white">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333"><o:p>&nbsp;</o:p></span></p>
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:7.5pt;mar=
gin-left:0cm;background:white">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">BUT...<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:7.5pt;mar=
gin-left:0cm;background:white">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">The problem isn't so much that the code doesn't get in-lin=
ed when doing a debug build but<br>
that it fails to compile.&nbsp; I think this is a compiler regressions sinc=
e<br>
I was&nbsp;<em><span style=3D"font-family:&quot;Helvetica&quot;,sans-serif"=
>not</span></em>&nbsp;able to reproduce the error when compiling natively u=
sing Ubuntu-22.04 (gcc-11.3) but<br>
<em><span style=3D"font-family:&quot;Helvetica&quot;,sans-serif">was</span>=
</em>&nbsp;able to reproduce it using Fedora-37, gcc --version : gcc (GCC) =
12.2.1 20221121 (Red Hat 12.2.1-4)<br>
<br>
<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:7.5pt;mar=
gin-left:36.0pt;background:white">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">Does the change you made actually build with the two compi=
ler versions above?<br>
<br>
&gt;I tested my changes on LINCD sources which have GCC 12.2. I didn=92t ch=
ecked the above mentioned versions.<br>
<br>
Is there documentation that states that<o:p></o:p></span></p>
<div style=3D"mso-element:para-border-div;border:solid #CCCCCC 1.0pt;paddin=
g:7.0pt 7.0pt 7.0pt 7.0pt;background:whitesmoke">
<pre style=3D"margin-bottom:7.5pt;background:whitesmoke;word-break:break-al=
l;border:none;padding:0cm"><span style=3D"font-family:Consolas;color:#33333=
3">static inline void<o:p></o:p></span></pre>
<pre style=3D"margin-bottom:7.5pt;background:whitesmoke;word-break:break-al=
l;border:none;padding:0cm"><span style=3D"font-family:Consolas;color:#33333=
3"><o:p>&nbsp;</o:p></span></pre>
<pre style=3D"margin-bottom:7.5pt;background:whitesmoke;word-break:break-al=
l;border:none;padding:0cm"><span style=3D"font-family:Consolas;color:#33333=
3">is not as portable as:<o:p></o:p></span></pre>
<pre style=3D"margin-bottom:7.5pt;background:whitesmoke;word-break:break-al=
l;border:none;padding:0cm"><span style=3D"font-family:Consolas;color:#33333=
3"><o:p>&nbsp;</o:p></span></pre>
<pre style=3D"margin-bottom:7.5pt;background:whitesmoke;word-break:break-al=
l;border:none;padding:0cm"><span style=3D"font-family:Consolas;color:#33333=
3">__attribute__((always_inline)) static inline void<o:p></o:p></span></pre=
>
</div>
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:7.5pt;mar=
gin-left:36.0pt;background:white">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">I suspect there is not but I'm not a compiler geek!<br>
<br>
&gt;As you mentioned in <a href=3D"https://github.com/rsyslog/librelp/issue=
s/256#issue-1605905115">
https://github.com/rsyslog/librelp/issues/256#issue-1605905115</a>, <i>it o=
nly happens when using -Og not -O[0-3]
</i>&nbsp;i.e without any optimizations and as per <a href=3D"https://gcc.g=
nu.org/onlinedocs/gcc/Inline.html#:~:text=3DGCC%20does%20not%20inline%20any=
%20functions%20when%20not%20optimizing%20unless%20you%20specify%20the%20%E2=
%80%98always_inline%E2%80%99%20attribute%20for%20the%20function%2C%20like%2=
0this%3A">
https://gcc.gnu.org/onlinedocs/gcc/Inline.html</a> it=92s mentioned that:<b=
r>
<br>
<i>GCC does not inline any functions when not optimizing unless you specify=
 the =91always_inline=92 attribute for the function, like this:</i>
<br>
/* Prototype.&nbsp; */ inline void foo (const char) __attribute__((always_i=
nline));<br>
<br>
&gt;Please let me know if we are on the same page.<br>
<br>
<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:7.5pt;mar=
gin-left:0cm;background:white">
<span style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333">../Randy<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<br>
Yash<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:Randy.MacLeod@windriver.com">MacLeod, Randy</a><br>
<b>Sent: </b>29 March 2023 19:06<br>
<b>To: </b><a href=3D"mailto:yashinde145@gmail.com">Yash Shinde</a>; <a hre=
f=3D"mailto:openembedded-devel@lists.openembedded.org">
openembedded-devel@lists.openembedded.org</a><br>
<b>Cc: </b><a href=3D"mailto:Umesh.Kallapa@windriver.com">Kallapa, Umesh</a=
>; <a href=3D"mailto:Naveen.Gowda@windriver.com">
Gowda, Naveen</a>; <a href=3D"mailto:Sundeep.Kokkonda@windriver.com">Kokkon=
da, Sundeep</a>;
<a href=3D"mailto:Shivaprasad.Moodalappa@windriver.com">Moodalappa, Shivapr=
asad</a>;
<a href=3D"mailto:Yash.Shinde@windriver.com">Shinde, Yash</a><br>
<b>Subject: </b>Re: [meta-oe][PATCH] librelp: fix function inline errors in=
 debug build</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On 2023-03-29 03:58, Yash Shinde wrote:<o:p></o:p></=
p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre>With DEBUG_BUILD =3D &quot;1&quot;, the following errors occur:</pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>&nbsp;&nbsp; src/relpsess.c:95:1: error:</pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inlining failed in call to 'relpSessFre=
ePermittedPeers': function not considered for inlining [-Werror=3Dinline]</=
pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>&nbsp;&nbsp; src/tcp.c:146:1: error:</pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inlining failed in call to 'relpTcpFree=
PermittedPeers': function not considered for inlining [-Werror=3Dinline]</p=
re>
<pre><o:p>&nbsp;</o:p></pre>
<pre>&nbsp;&nbsp; src/tcp.c:158:1: error:</pre>
<pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inlining failed in call to 'callOnAuthE=
rr': function not considered for inlining [-Werror=3Dinline]</pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Compiler does not inline any functions when not optimizing unless you =
specify the =91always_inline=92 attribute for the function. Add &quot;__att=
ribute__((always_inline))&quot; to avoid these function inline errors.</pre=
>
</blockquote>
<p>Hi Yash,</p>
<p><o:p>&nbsp;</o:p></p>
<p>First, if we're going to take this approach, you should revert my work-a=
round as part of this commit:</p>
<p>commit ca10312c4c7e88d67f4b487ae9afcbfdf92898d6<br>
Author:&nbsp;&nbsp;&nbsp;&nbsp; Randy MacLeod <a href=3D"mailto:Randy.MacLe=
od@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a><br>
Date: Wed Mar 1 19:24:27 2023<br>
<br>
&nbsp;&nbsp;&nbsp; librelp: make inline errors be warnings in debug build<b=
r>
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; ...</p>
<p><o:p>&nbsp;</o:p></p>
<p>BUT...</p>
<p>The problem isn't so much that the code doesn't get in-lined when doing =
a debug build but<br>
that it fails to compile.&nbsp; I think this is a compiler regressions sinc=
e <br>
I was <em><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">not</s=
pan></em> able to reproduce the error when compiling natively using Ubuntu-=
22.04 (gcc-11.3) but<br>
<em><span style=3D"font-family:&quot;Calibri&quot;,sans-serif">was</span></=
em> able to reproduce it using Fedora-37, gcc --version : gcc (GCC) 12.2.1 =
20221121 (Red Hat 12.2.1-4)</p>
<p><o:p>&nbsp;</o:p></p>
<p>Does the change you made actually build with the two compiler versions a=
bove?<br>
Is there documentation that states that </p>
<pre>static inline void</pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>is not as portable as:</pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>__attribute__((always_inline)) static inline void</pre>
<p>I suspect there is not but I'm not a compiler geek!</p>
<p>../Randy</p>
<p><o:p>&nbsp;</o:p></p>
<p><o:p>&nbsp;</o:p></p>
<p><o:p>&nbsp;</o:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<pre><o:p>&nbsp;</o:p></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Upstream-Status: Tracked by upstream bug: <a href=3D"https://github.co=
m/rsyslog/librelp/issues/256">https://github.com/rsyslog/librelp/issues/256=
</a></pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>Signed-off-by: Yash Shinde <a href=3D"mailto:Yash.Shinde@windriver.com=
">&lt;Yash.Shinde@windriver.com&gt;</a></pre>
<pre>---</pre>
<pre> ...02-librelp-fix-function-inline-error.patch | 59 ++++++++++++++++++=
+</pre>
<pre> 1 file changed, 59 insertions(+)</pre>
<pre> create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0002-libr=
elp-fix-function-inline-error.patch</pre>
<pre><o:p>&nbsp;</o:p></pre>
<pre>diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0002-librelp-fix=
-function-inline-error.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/000=
2-librelp-fix-function-inline-error.patch</pre>
<pre>new file mode 100644</pre>
<pre>index 000000000..60cf1b632</pre>
<pre>--- /dev/null</pre>
<pre>+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0002-librelp-fix-functi=
on-inline-error.patch</pre>
<pre>@@ -0,0 +1,59 @@</pre>
<pre>+From dc841f01fb6167ec9a80e373c5f4d2f5e3222ed6 Mon Sep 17 00:00:00 200=
1</pre>
<pre>+From: Yash Shinde <a href=3D"mailto:Yash.Shinde@windriver.com">&lt;Ya=
sh.Shinde@windriver.com&gt;</a></pre>
<pre>+Date: Tue, 28 Mar 2023 04:06:58 +0000</pre>
<pre>+Subject: librelp: fix function inline errors in debug build</pre>
<pre>+</pre>
<pre>+With DEBUG_BUILD =3D &quot;1&quot;, the following errors occur:</pre>
<pre>+</pre>
<pre>+&nbsp;&nbsp; src/relpsess.c:95:1: error:</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inlining failed in call to 'relpSessFr=
eePermittedPeers': function not considered for inlining [-Werror=3Dinline]<=
/pre>
<pre>+</pre>
<pre>+&nbsp;&nbsp; src/tcp.c:146:1: error:</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inlining failed in call to 'relpTcpFre=
ePermittedPeers': function not considered for inlining [-Werror=3Dinline]</=
pre>
<pre>+</pre>
<pre>+&nbsp;&nbsp; src/tcp.c:158:1: error:</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inlining failed in call to 'callOnAuth=
Err': function not considered for inlining [-Werror=3Dinline]</pre>
<pre>+</pre>
<pre>+Compiler does not inline any functions when not optimizing unless you=
 specify the =91always_inline=92 attribute for the function. Add &quot;__at=
tribute__((always_inline))&quot; to avoid these function inline errors.</pr=
e>
<pre>+</pre>
<pre>+Upstream-Status: Tracked by upstream bug: <a href=3D"https://github.c=
om/rsyslog/librelp/issues/256">https://github.com/rsyslog/librelp/issues/25=
6</a></pre>
<pre>+</pre>
<pre>+Signed-off-by: Yash Shinde <a href=3D"mailto:Yash.Shinde@windriver.co=
m">&lt;Yash.Shinde@windriver.com&gt;</a></pre>
<pre>+---</pre>
<pre>+</pre>
<pre>+diff --git a/src/relpsess.c b/src/relpsess.c</pre>
<pre>+index ee7b595..aa52b71 100644</pre>
<pre>+--- a/src/relpsess.c</pre>
<pre>++++ b/src/relpsess.c</pre>
<pre>+@@ -91,7 +91,7 @@ callOnErr(const relpSess_t *__restrict__ const pThi=
s,</pre>
<pre>+</pre>
<pre>+</pre>
<pre>+ /* helper to free permittedPeer structure */</pre>
<pre>+-static inline void</pre>
<pre>++__attribute__((always_inline)) static inline void</pre>
<pre>+ relpSessFreePermittedPeers(relpSess_t *const pThis)</pre>
<pre>+ {</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;</pre>
<pre>+diff --git a/src/tcp.c b/src/tcp.c</pre>
<pre>+index 7a75cc4..f4088c0 100644</pre>
<pre>+--- a/src/tcp.c</pre>
<pre>++++ b/src/tcp.c</pre>
<pre>+@@ -142,7 +142,7 @@ static int relpTcpChkPeerName(relpTcp_t *const pT=
his, void* cert);</pre>
<pre>+</pre>
<pre>+</pre>
<pre>+ /* helper to free permittedPeer structure */</pre>
<pre>+-static inline void</pre>
<pre>++__attribute__((always_inline)) static inline void</pre>
<pre>+ relpTcpFreePermittedPeers(relpTcp_t *const pThis)</pre>
<pre>+ {</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;</pre>
<pre>+@@ -154,7 +154,7 @@ relpTcpFreePermittedPeers(relpTcp_t *const pThis)=
</pre>
<pre>+ }</pre>
<pre>+</pre>
<pre>+ /* helper to call onAuthErr if set */</pre>
<pre>+-static inline void</pre>
<pre>++__attribute__((always_inline)) static inline void</pre>
<pre>+ callOnAuthErr(relpTcp_t *const pThis, const char *authdata, const ch=
ar *emsg, relpRetVal ecode)</pre>
<pre>+ {</pre>
<pre>+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pThis-&gt;pEngine-&gt;dbgp=
rint((char*)&quot;librelp: auth error: authdata:'%s', ecode %d, &quot;</pre=
>
<pre>+</pre>
</blockquote>
<p><o:p>&nbsp;</o:p></p>
<pre>-- </pre>
<pre># Randy MacLeod</pre>
<pre># Wind River Linux</pre>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_SJ1PR11MB61297C523AD0DD05C923C0AFEB899SJ1PR11MB6129namp_--

