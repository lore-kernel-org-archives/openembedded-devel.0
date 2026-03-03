Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83691E67A6E
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 06:24:35 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12436.1772519066172161875
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 22:24:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmwtechworks.in header.s=selector1 header.b=VjmD2hid;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.67, mailfrom: ashishkumar.mishra@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AGTvX0BM/RYM4Fsv3/MdojZrciDryBV8eS5C2NM02BuVhpYb47Th9M+AU8A+a9BIraGkZreGKqpcKqwVz6nIqqLdMImvCdOBNB/Y87LYLfcrpqPqBfKAQ7iPB7/ZwBL7nilOjsjPvMet96ea1MuZhbI5C7l3hLzXFeh2kbu0Jt1C3549Phkn5MWNNdmxNeU/H4HHgohv9JWRa0hgveR3jv6HnN1b9REIlXtEr374DNiXAZI54wFKOHP9TrPJdA/m6Z7JRH5eFu/+7gqkNfDOum3bxbj6K0aGiJX/3rrxw+OsDNwiJodz73mscOwAfDUbo3tadLmQ3fpawC6jvqDm8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmtS29jrvQbXGxa3caH3dbQhEqwRBL/VQIYG39g5Oyg=;
 b=VgPb8BCVNTZTPnFiEks/Q++6OGJ2qIa8hFjt9I0258PAYS4nfn03/+vsP0isA4DipDL4SbVidL1kwV/6delZUS8yJpQWvUbfenglmgQOCIb2tO/mMH7PS72zy1vnMnkp8js4UjesmghKFNPF6EPeCsij+L51s6IqjmPL8ex2TCW/muUndZkZekh3I8smpJLXzoPRIfiMm6jVeDAmcmQ4OJOkzQwT8juU++56SEd1bEt4IyWbyFdgi3x+7bft+BYdZ20Lc5u8jQKSHTdmxXZuXw0MZaTwPik2pJEKp+QHGF86sODJ4WEh1R3eXdrpVQW8TJFuA+gblyfpXHFO34qGzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmtS29jrvQbXGxa3caH3dbQhEqwRBL/VQIYG39g5Oyg=;
 b=VjmD2hidasKQ7wfgJ2KMas1uyogDSA6KobwcAOUXaURuRMblD+LScp4E1KFFct19rMtuz6Odi3Sm3my3Xc/KqcQFDQaEZGdW7+VmOh3Xz5AeNez//OQszpjeiVtR4ajnB/iyqySeE8tJozyDvZRqXLQkz3xHgTh2xjJJ0AQjE7f2Aj9BbSHLfLriomtwcpj0fEHYVP/B0Pi9F4xCoO1z/r5VW5fvBz6Y40tudjG75xtKxjw9ppn50jT7uA994sMrT3jacxff/vzXtL5E9/Q4bS1TC0ZxkfZRzz5gokh1LM7MAHtfjCBBKnwY37oTRc8BDx6ofXcZS+bSJPFsCO6jvA==
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:db::8) by
 MA5P287MB4715.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:185::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.16; Tue, 3 Mar 2026 06:24:18 +0000
Received: from PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::884b:d8b9:54fa:499b]) by PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
 ([fe80::884b:d8b9:54fa:499b%6]) with mapi id 15.20.9678.016; Tue, 3 Mar 2026
 06:24:18 +0000
From: AshishKumar Mishra <AshishKumar.Mishra@bmwtechworks.in>
To: Gyorgy Sarvari <skandigraun@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [RFC_V2] [meta-oe]: Improving ext* sparse image generation:
 migrating from img2simg to ext2simg_android for ext* filesystem
Thread-Topic: [oe] [RFC_V2] [meta-oe]: Improving ext* sparse image generation:
 migrating from img2simg to ext2simg_android for ext* filesystem
Thread-Index: AQHcoXa1y6CyTmcYfEWDmSeCI1swnrWPSzeAgA0dsa6AAAAahQ==
Date: Tue, 3 Mar 2026 06:24:18 +0000
Message-ID: 
 <PN0P287MB0358FDF34A96B429D64E46B2897FA@PN0P287MB0358.INDP287.PROD.OUTLOOK.COM>
References: <rGsP.1771488393837852960.eVnE@lists.openembedded.org>
 <a11b45eb-1ee0-4274-9780-5a86105a7a1f@gmail.com>
 <1030996.1771825388005282969@lists.openembedded.org>
 <1127752.1772426743792609011@lists.openembedded.org>
 <a19a9a63-5ac2-4da1-838e-b06e861c7bd7@gmail.com>
In-Reply-To: <a19a9a63-5ac2-4da1-838e-b06e861c7bd7@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB0358:EE_|MA5P287MB4715:EE_
x-ms-office365-filtering-correlation-id: 1e35d9b2-140c-4a24-0315-08de78ed7fff
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|4022899009|39142699007|31052699007|1800799024|376014|366016|13003099007|8096899003|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 8CxHO+Yu5+BG3BTgf2wcRegXK13bzKSQSOksXfqcfjco018reB4PExyI3o9kYAz5rsaH137atBB7AabGreGE/sRyocD7Rxg5esUUYrfM/jQfy6MXAtXK6l5nXuw//Yimy/129LxXxrmM4MBIzydlHO/1P/AMUyAr1w+nWdJrEZuKvXRmdc51sGZA0iXtPCX5dNpkohuUOaQ9fC6hg0ZLlNAS6nKlM18EpZ4f7xHXziXKHlLd5YYCLnhpodL7iURo/Lpq30XXktpw27LiuoUqnPA1+LtvkWcx9SDY3XoUO4lIBvCpevHcsE+TF59/XBOeAAuvKyqU72IjnSVTPf1UDchjp+lj9odQbJ4dwFEgit5aMdxkfBg3jNjiWRKe3kBdkB1iCRrGPyw3BMA4VsMzWHLpaSvzJXyv3baRxKtYnqnY6KaZhramVpfARSV5yoUULdFXh0WaQ92TNyptnKRk7bXGFB6yg1yp/LxykyMKHMe0ZgP7bGI5b1eDtbZLH1CAXwZIIc3hTD9q0NvkfUcXB9BTk1hi1pcc3d8oKMnNMxZRshXm7I7uct2F8MoXEwbiTEcKzvnvu2LKvpLjnikIywFktszpT0VU68cL/Dc81oweZmsSbfNb6nZlcM1ev0h9U0Y++5PHinhV+mxUaEy3c97t7wsKkoHinsBwrHz4/yPVLCuMaVPcC6sMPGHLRR4E+FfeImjgSBW58M5SM23hW7yOUiMfx/KpEQXV4HgT4Uo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB0358.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(39142699007)(31052699007)(1800799024)(376014)(366016)(13003099007)(8096899003)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?0S/w9zGpWZximFibBeJthmIJifLuFgX6DQaVHDpV+KIL2bPV0XpO7ykK/C?=
 =?iso-8859-1?Q?KtMt9Eublg2LwI/xUizPUNxwkCrWkvRWoche7COzFumaVhErCTjPJUpwpJ?=
 =?iso-8859-1?Q?KyGBqFi6PVJgSOYOxPtrwXiLQzbVR6FwhSCfdADxzFVvBd267ZinOecm2O?=
 =?iso-8859-1?Q?CzhTUZh5/FuQ1e5l2GNJa1O26SFpAujS4y3y73t5Rx6iSJBnXt9SdrNKHm?=
 =?iso-8859-1?Q?5415xWrw/116uUtSvVXO405aH+3AaifqNL6Z5ynq+BrkMQPUqUnyOR9FbW?=
 =?iso-8859-1?Q?K+H+GgkefyyuzbUzpPVaZQSxxwYjJX4ra7Zy8ikuNfKBN9T6x8lpI/eOm3?=
 =?iso-8859-1?Q?+WviV4lrgoxPmtYPXWKMJidJdlI1QrxAiL2ybLyMIGNUtNztiz4bDlK0DP?=
 =?iso-8859-1?Q?7XV/Zydo9oYEbD74M50KEcZ3gOdkVcm05KZn7boqsJf9uto7wb/E5SLby1?=
 =?iso-8859-1?Q?F0ocxkEJO4k/9SfnlaYDgIcrxade2/xDMFkBfs+ASAUoVqP6oL7C5Tbbnb?=
 =?iso-8859-1?Q?RLLlHcuZBqD00lN46BnpVucxNZbddd5tvukCv+64Off6/8KVxEXQqg9/mp?=
 =?iso-8859-1?Q?iZ/7DFnJAV+jyUFLTUyGeTIxMo0+3yIC2eeVTQzWsnJsNzXzuPiT2bCnIW?=
 =?iso-8859-1?Q?4sHgDO5+5Z/jiDJ9WKOh8y99WVyCBBpjE0yV/sE6CIL8x4ao0NhiT5FVkH?=
 =?iso-8859-1?Q?0/Dsf/UWGeaLSHjdoLUnajUqPIhhLxvH+1vhMsDA7hK3ly9flQnxoSwm9k?=
 =?iso-8859-1?Q?N+bt/j0YOevpTs+LyeK3JRwJmkzXI5dXY5tThKRu04En34C46gADTJ2qGA?=
 =?iso-8859-1?Q?rsuw1phwCfskm3hmtKHO9nfOzZCGli7TOuSjhY4Oiiw+CBHlOQKUstmQH/?=
 =?iso-8859-1?Q?HP6A1aq6H72JnZXsRH0hz/zksyw4a/TL9enzoKE7AgOxaUxmRNJ5VEHdVC?=
 =?iso-8859-1?Q?UQ+JRmA6dQ+z9m2ZMHkDwu74hEzfd/350FQ9OOymgUTAtPbcCsnW8dzkf3?=
 =?iso-8859-1?Q?YmvWCzpW/mdwgYwBDnI0xtNU7Eh1F50ISfhM323x+dGF/bUBEvbeVnhYlh?=
 =?iso-8859-1?Q?Be1yQDQxVj6CVJ4I6kel6EPIwcrI5xESjp+WLpnsWC5Oo69bkM3OeTXYyF?=
 =?iso-8859-1?Q?jqqM4gTNJl316KtzQHUsvSaA3xQStHZlwWPc4r27DSCuLZ3AwF58ZIu6FY?=
 =?iso-8859-1?Q?bCaErKt8IJSCAdcIN/a7brlhHutmJmAH2EH4g2aoz4m5Idjp7GszhfNtyN?=
 =?iso-8859-1?Q?cGJeLd0xhETDXrneJQy+o+0WpH5w7ZkiSntB00u/De48tjDHobBrJLAjSi?=
 =?iso-8859-1?Q?SP9pLvLQpYIJGENRcBBXmkH/RhGZRyYeoIUVWEKLgLewhjsP4j99Fb4KF9?=
 =?iso-8859-1?Q?5kBfA6SSwERhVQhroH3EbasVqsD8v/PBi0BNLCY+R8racprmGUmF3iFhQQ?=
 =?iso-8859-1?Q?KAy6CMw0Fnro3rzexCzfMke3DoAICApSSInqyBBzSuOvQ44G02y7yCr1aE?=
 =?iso-8859-1?Q?3LtVXltWbKojwEDAPBV1E+igHJKuffG3If44y7HexpL+MY/3CiZXHzwnNz?=
 =?iso-8859-1?Q?XqbFbdtpYVvjC3634KGcA/4Xfu+FN1c1RCWDKCMgSEyYg3aeOzAVPpwFA0?=
 =?iso-8859-1?Q?0wiZtQdu5oVKMV8a8CkqMIdqlYJJC66e/t/Hm9ipkzI0QBJYaWb2vTD4fS?=
 =?iso-8859-1?Q?fir97SknOYe8oXGCnvwn8wEMxek1qt29roi0VgOxZ67EDh+B35Eqa1y1V+?=
 =?iso-8859-1?Q?sd+yriy7Y2HDXJimvfkcWIiZrKzkpi0FFcIlN/Om92g/ISiObC21+ZUiCw?=
 =?iso-8859-1?Q?QqlBf7MMMjfJXOXAocqxqpBwU3jdTiA=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PN0P287MB0358FDF34A96B429D64E46B2897FAPN0P287MB0358INDP_"
MIME-Version: 1.0
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB0358.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e35d9b2-140c-4a24-0315-08de78ed7fff
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 06:24:18.2632
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GgKJcubEmQn8MP6hU4I6xjPpLDg0v2YfjvXkT00LD59Ddh67vIP9mrG9nLE7LukrcJm5G5lGRgbgcRGySIaO+TfTUHekHplmPfMgY0+7JvzBQs3YA83LkBTlrNzXloYw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4715
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 06:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124825

--_000_PN0P287MB0358FDF34A96B429D64E46B2897FAPN0P287MB0358INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Thanks Gyorgy
- Yes it worked fine
- w.r.t sharing the patch , will share it
   I thought that for RFC we need certain acceptance from maintainer / seni=
or members before actually sharing the patch
   But thanks for clarification , will clean it further and share it

Thanks Again !
- Ashish


________________________________
From: Gyorgy Sarvari <skandigraun@gmail.com>
Sent: Tuesday, March 03, 2026 11:50
To: AshishKumar Mishra <AshishKumar.Mishra@bmwtechworks.in>; openembedded-d=
evel@lists.openembedded.org <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [RFC_V2] [meta-oe]: Improving ext* sparse image generatio=
n: migrating from img2simg to ext2simg_android for ext* filesystem

Caution: "External email, be cautious especially with link(s), attachment(s=
) or QR code(s)".

On 3/2/26 05:45, AshishKumar Mishra via lists.openembedded.org wrote:
> Hi Gyorgy Sarvari ,
>
> w.r.t "What happens if you add "-Wl,-rpath=3D../${baselib}
> -Wl,-rpath=3D../../${baselib}" (or similar) to LDFLAGS?"
>
> Added below in
> meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse_1.0.bb
> as suggested
> BUILD_LDFLAGS +=3D "-Wl,-rpath,../${baselib} -Wl,-rpath,../../${baselib}"
> TARGET_LDFLAGS +=3D "-Wl,-rpath,../${baselib} -Wl,-rpath,../../${baselib}=
"
>

...and what happened? Did it work? Afterwards it came to my mind that
maybe it needs also $ORIGIN at the start, but that was just a passing
thought.

> Can i push the patch now in master for this functionality?
> or Is there any other process / feedback that i need to work?
>

It is not necessary to ask for permission to send your patches. Just
send them, and if anything needs to be changed, it will be pointed out.

> Based on additional feedback, can work on the current implementation
> and share the patches again
>
> Thanks,
> Ashish Kumar Mishra
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124798): https://ind01.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-devel%2Fm=
essage%2F124798&data=3D05%7C02%7Cashishkumar.mishra%40bmwtechworks.in%7C334=
9f5f5499e4df69abd08de78ed0bf2%7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C=
639081156658246502%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIw=
LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&s=
data=3Di7MjeCWP2Jowue8T1jjb05RE5v7kNpew%2FcEyl%2FBx2Pw%3D&reserved=3D0<http=
s://lists.openembedded.org/g/openembedded-devel/message/124798>
> Mute This Topic: https://ind01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.openembedded.org%2Fmt%2F117889188%2F6084445&data=3D05%7C0=
2%7Cashishkumar.mishra%40bmwtechworks.in%7C3349f5f5499e4df69abd08de78ed0bf2=
%7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C639081156658274819%7CUnknown%=
7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsI=
kFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DvY%2BJFLn7nOgqDm6CATBi=
LWCRAMwxBzx9Qq3FeN36Pms%3D&reserved=3D0<https://lists.openembedded.org/mt/1=
17889188/6084445>
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-devel%2Funsub&data=3D05%7=
C02%7Cashishkumar.mishra%40bmwtechworks.in%7C3349f5f5499e4df69abd08de78ed0b=
f2%7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C639081156658294537%7CUnknow=
n%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiI=
sIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DZL8%2FsQG1w5oAws4ipj=
dM1pMRZ4%2FRNmHWmdWiLLWLbPE%3D&reserved=3D0<https://lists.openembedded.org/=
g/openembedded-devel/unsub> [skandigraun@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_PN0P287MB0358FDF34A96B429D64E46B2897FAPN0P287MB0358INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks Gyorgy&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
- Yes it worked fine&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
- w.r.t sharing the patch , will share it&nbsp;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
&nbsp; &nbsp;I thought that for RFC we need certain acceptance from maintai=
ner / senior members before actually sharing the patch&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
&nbsp; &nbsp;But thanks for clarification , will clean it further and share=
 it&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks Again !</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
- Ashish&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Gyorgy Sarvari &lt;skandigraun@gmail.com&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, March 03, 2026 11:50<br>
<b>To:</b>&nbsp;AshishKumar Mishra &lt;AshishKumar.Mishra@bmwtechworks.in&g=
t;; openembedded-devel@lists.openembedded.org &lt;openembedded-devel@lists.=
openembedded.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [oe] [RFC_V2] [meta-oe]: Improving ext* sparse ima=
ge generation: migrating from img2simg to ext2simg_android for ext* filesys=
tem
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">Caution: &quot;External email, be cautious =
especially with link(s), attachment(s) or QR code(s)&quot;.<br>
<br>
On 3/2/26 05:45, AshishKumar Mishra via lists.openembedded.org wrote:<br>
&gt; Hi Gyorgy Sarvari ,<br>
&gt;<br>
&gt; w.r.t &quot;What happens if you add &quot;-Wl,-rpath=3D../${baselib}<b=
r>
&gt; -Wl,-rpath=3D../../${baselib}&quot; (or similar) to LDFLAGS?&quot;<br>
&gt;<br>
&gt; Added below in<br>
&gt; meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse_1.0=
.bb<br>
&gt; as suggested<br>
&gt; BUILD_LDFLAGS +=3D &quot;-Wl,-rpath,../${baselib} -Wl,-rpath,../../${b=
aselib}&quot;<br>
&gt; TARGET_LDFLAGS +=3D &quot;-Wl,-rpath,../${baselib} -Wl,-rpath,../../${=
baselib}&quot;<br>
&gt;<br>
<br>
...and what happened? Did it work? Afterwards it came to my mind that<br>
maybe it needs also $ORIGIN at the start, but that was just a passing<br>
thought.<br>
<br>
&gt; Can i push the patch now in master for this functionality?<br>
&gt; or Is there any other process / feedback that i need to work?<br>
&gt;<br>
<br>
It is not necessary to ask for permission to send your patches. Just<br>
send them, and if anything needs to be changed, it will be pointed out.<br>
<br>
&gt; Based on additional feedback, can work on the current implementation<b=
r>
&gt; and share the patches again<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Ashish Kumar Mishra<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#124798): <a data-auth=3D"NotApplicable" class=3D"O=
WAAutoLink" id=3D"OWA5595003f-747a-a42d-005a-9d41ddd57928" href=3D"https://=
lists.openembedded.org/g/openembedded-devel/message/124798">
https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-devel%2Fmessage%2F124798&amp;data=3D05%7=
C02%7Cashishkumar.mishra%40bmwtechworks.in%7C3349f5f5499e4df69abd08de78ed0b=
f2%7C970fa6fd10314cc68c56488f3c61cd05%7C0%7C0%7C639081156658246502%7CUnknow=
n%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiI=
sIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3Di7MjeCWP2Jowue8T=
1jjb05RE5v7kNpew%2FcEyl%2FBx2Pw%3D&amp;reserved=3D0</a><br>
&gt; Mute This Topic: <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" =
id=3D"OWAeddab496-38e1-0a59-e4e6-5fd1d43aa604" href=3D"https://lists.openem=
bedded.org/mt/117889188/6084445">
https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F117889188%2F6084445&amp;data=3D05%7C02%7Cashishkumar=
.mishra%40bmwtechworks.in%7C3349f5f5499e4df69abd08de78ed0bf2%7C970fa6fd1031=
4cc68c56488f3c61cd05%7C0%7C0%7C639081156658274819%7CUnknown%7CTWFpbGZsb3d8e=
yJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIs=
IldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DvY%2BJFLn7nOgqDm6CATBiLWCRAMwxBzx=
9Qq3FeN36Pms%3D&amp;reserved=3D0</a><br>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=
=3D"OWA407f88c8-e16e-86d2-bd0f-f0f5e7bdce64" href=3D"https://lists.openembe=
dded.org/g/openembedded-devel/unsub">
https://ind01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-devel%2Funsub&amp;data=3D05%7C02%7Cashis=
hkumar.mishra%40bmwtechworks.in%7C3349f5f5499e4df69abd08de78ed0bf2%7C970fa6=
fd10314cc68c56488f3c61cd05%7C0%7C0%7C639081156658294537%7CUnknown%7CTWFpbGZ=
sb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTW=
FpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&amp;sdata=3DZL8%2FsQG1w5oAws4ipjdM1pMRZ=
4%2FRNmHWmdWiLLWLbPE%3D&amp;reserved=3D0</a>&nbsp;[skandigraun@gmail.com]<b=
r>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</body>
</html>

--_000_PN0P287MB0358FDF34A96B429D64E46B2897FAPN0P287MB0358INDP_--

