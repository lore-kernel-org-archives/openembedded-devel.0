Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.81])
 by mx.groups.io with SMTP id smtpd.web11.146.1616174233467935957
 for <Openembedded-devel@lists.openembedded.org>;
 Fri, 19 Mar 2021 10:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=s1zJOiKX;
 spf=pass (domain: kpit.com, ip: 40.107.139.81, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jo5Ly2UNrs46W2Rx7QLZmcfy75ATQWzegOu5P7V4b12YRG36VS8uFywxSsuRbzNM3J8lCcgh5JShzy/8DK0zpYMjCb4DYphvWQ1MCXkkPASIfgV1Oysy+zPBSVVerIqLDYtLT+rtFzfIaVZs+OMI04VfK5s86zWI/GmKsOoMArwqMG17eBY9LIULOufoq7F+Wu4dgvv4/G0H071uvdWnMlWxXpHgP4XnA23+mxDY/6TSM/lnVckzDi6bXS/57b8wFxn3pXK3Ap3qUTZvdOB02l2W113NH9KhD2FqdIxCv7kNVwMQGJg23zkjiWYtsCwP1qetzYXCTCHt3SP7J1F1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dz5Xe4Kgtuf2yhoyYlarBOWAWVlUXChRCZ0KvmMjzIM=;
 b=e4f0Ef3EKcnpivtPjZxf8iTDi+QIp3OAiKX+cd44xCEz1E2cTIjChkVwRp819diXHjRZGtVtJP8mMMG6SXIlJ+h6CwjEx/fgAZQApsk88eAb897RI6qXeudhy96eq6MW+JW8l8zap9ZZLC8XrAY4RflrtzaDZ801rmIHQURWt5h9T12eirxo3YVymTdgBK78e4L+Hwq/BJ9wRHuFgXx0qkNlDgeg5qd3f7DRy51jg76tG3QPNRYfIrbrJlba+Yhf6a6uol+t5z3ydQd0ZwrP0ypyo+v7g8cYQLfHSDJkm49+oGpSF/Q25CbSLqvzR8/dFWWjIHLtyFoYOJr4uf7E/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dz5Xe4Kgtuf2yhoyYlarBOWAWVlUXChRCZ0KvmMjzIM=;
 b=s1zJOiKXn1IIeq6o2p91hhVt8dZBtXLKmNqRg0w3KcmoJxG9f1CfIYWU9/9k8BB/0EmoO7rRhoB3taajG/1I3ib1Ttdt91nXj+08OrI0TRzhDNxiTxYZOuyTsme+/jmrtG1sWNqNHmckHPZHpRvM24FejBQR79B8PvDYVEaOvKo=
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::17)
 by BMXPR01MB2629.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 17:16:59 +0000
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da]) by BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 17:16:59 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Khem Raj <raj.khem@gmail.com>, "Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
CC: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>, Nisha Parrakat
	<Nisha.Parrakat@kpit.com>
Subject: Re: [meta-networking][meta-oe][master][dunfell][PATCH] mdns: Whitelisted CVE-2007-0613 for mdns
Thread-Topic: [meta-networking][meta-oe][master][dunfell][PATCH] mdns:
 Whitelisted CVE-2007-0613 for mdns
Thread-Index: AQHXFK59VajwF5lYP0Crt62Z8CX2OKqLXsDsgAA1L4CAAAm7yA==
Date: Fri, 19 Mar 2021 17:16:59 +0000
Message-ID: 
 <BMXPR01MB322133C4D35B77124D00104699689@BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM>
References: <20210309063513.10410-1-Sana.Kazi@kpit.com>
 <BMXPR01MB3221CE7ACA0211ED19B9164399689@BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM>,<c9489c74-f9c3-976a-c1e6-645afe9c2f4a@gmail.com>
In-Reply-To: <c9489c74-f9c3-976a-c1e6-645afe9c2f4a@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=kpit.com;
x-originating-ip: [2401:4900:52b6:10e2:808d:e144:aea7:8434]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cb5a4382-2324-47dd-7eb1-08d8eaface17
x-ms-traffictypediagnostic: BMXPR01MB2629:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BMXPR01MB26296E73AFE4EDE5C649C4AD99689@BMXPR01MB2629.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 AvpgQHO24IHFVPXGdd9d5z62CCu0YqScF28hmzJQrrt3NwW5SSflpiBrkuH8Nq1IasKkQNiMm9t9VNjLFypYYLnuLJPMShLCOSxDiEImyIUIbGpYIYncfquSnYibbK6e6vN3X8Yv4089cIjngS7CGWeTUAvaF2nfElXwcoysVSz74Q6XMEpsfLfxMLkmQ7iqJC/mIvR93sGaDgGV+zsSpfmWdJ0kusjnrC2drN9GqTyW5LhaUUVJxeqXOC4oeFbHLynivzFRPIYjWq2Gqmyv8T2ODVIuOTSbLyEqbsaTZN7qTbXhbi0K147/V25/r6IH/7mfB93OotlzcYM29ECwPxcmzR8rEIJyQiDKXvHoiVjJSuFLxJUBo2qIcC3nAacpqBLlORXSyfyHLmE/fg5N02kaGqlv5ZuYi+Dgsu11YbyryfwtXFp3iFJSbfK2CnhqvoUYTkWXH8H7S5+6q/k8PWkRPAq0W1hgf7oKMc/XS6hwoxpJtzCE0W28CBCJvCnv5yGPWoUhJD9gA3lOH6aLVxBHPDDIGztZ1o0hsb8+nFjPxh7pyznZpXSvZBZyASufdudnAQ7BY43JRU4q//7VkAf48LxRM2FqCWRlYXY2myapwqWBcyv2b0YNWLhMGlAHy8guUGeWwSlQStZGs6taEPPNCuaUtEZZi42PG/p/SV9kctMxfO+GtMZ3aQXUgMKQqPVzmpVB+dzAMcftRv2UFFqBuEWy6Zdr1rQsojxMzh4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39850400004)(346002)(376002)(396003)(2906002)(71200400001)(54906003)(55016002)(316002)(9686003)(45080400002)(64756008)(66556008)(8676002)(66446008)(66476007)(76116006)(107886003)(38100700001)(8936002)(19627405001)(478600001)(4326008)(110136005)(966005)(66946007)(7696005)(66574015)(86362001)(30864003)(53546011)(6506007)(52536014)(5660300002)(186003)(83380400001)(166002)(33656002)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?Po9MRyvcuygzgbPKEjDe65HBXKBD/t2QeiBBFq1bXx9UkfXnp3eJcgvuhN/f?=
 =?us-ascii?Q?Fz18hZNk5Mzj44wdPyWxiC2ydjfEEL7i1gDg2Xb7SfXP4fiEmogx7k1pNF1+?=
 =?us-ascii?Q?DuwUhT8JrfvgrUJVI0iJAzBpEmnuBtUb2+QrrylJjf6Cd3Pe5ISAUOF2nmPO?=
 =?us-ascii?Q?NrSzNJ/jnTMPP/GHCeyzUR3GwjOSr+YOx7mbhDEmZ6yYDdmA3jYLaOHmqoqa?=
 =?us-ascii?Q?0dXssWVZtwICliUvZh2/tpDnwi0+LeJjGZsLrewE6P8VV1vcYEK/96bKiovc?=
 =?us-ascii?Q?9exMF6IZzOScU8t2tp5m6xuku6DeQkryTj8Sl6EcYDqN+vHWkxDY7lrz5TAp?=
 =?us-ascii?Q?l74O/j8gr1yVUiTphqbZ3azZUGxQNl4i9GQvdm+ZczCeVd6vxDFcO2JVdcih?=
 =?us-ascii?Q?h9WG7VFBM3HfO0vWRa4AT98FcxJoxXOeDoDs3JNL7FwqWnhYo4jnBKmCc/yl?=
 =?us-ascii?Q?Z+di15PgCoD3YdPCAJ9r2aIW/bd2p1msKK0XoI/wXrwDR/thcA/VpMhW42W2?=
 =?us-ascii?Q?Rf6695anqR9WQ93aoFqwaGGy02Ex7nkKNqLmjWUhcr5peBJewdXs5gKj1R5D?=
 =?us-ascii?Q?X1O1BX3CbxYSAih8hMOUgYeT2cKa81zi5gQc5Lv5cCK4VAgFIsgIcjp8RShZ?=
 =?us-ascii?Q?KSmlY00Br4+JLtQNNsiPgmBtxOjSzfrN+P5gQkCI6OpjUdVHhL+Kqf71EMAd?=
 =?us-ascii?Q?hj+qpT0ySDdli6uXydmXjSIQi+FdSNrX0I6ys37+twUGjo5zWaIkoRfH4Awq?=
 =?us-ascii?Q?2ZS9EERbxh57RZtamCBkQQzl1vgS4KaGm5IPcIcp3VyBMz0SSeLbYgmWrMBk?=
 =?us-ascii?Q?WEfwOguSScSbkA05PZHJPsve8593rEaH1YIa3Pqx46amECpHfSASdjGOEhnJ?=
 =?us-ascii?Q?YF+mYgyxsao7xns19WCm1AG33ji0kUYTDsJuQG9UBPKdty26HBIPR8QKxksb?=
 =?us-ascii?Q?V9chRZ2ibxxAGQwzg1gURQiDtZvgKrH8hZatzmtifAA+COz+ZBvVN6/VeLNZ?=
 =?us-ascii?Q?VGiX86Ykt7CEZP/bOjFrYdqI58tXHkl6GmTYgGG2PFODQWk2wiMZz449DO5f?=
 =?us-ascii?Q?h+k7UVOgOyWHRjG9ONpapDJKu4f1e/ijpxSe6OSwpnIKY7/3yEhEbX4aOVA3?=
 =?us-ascii?Q?qhLyJr1IhU7eL79Yf05XqBcaL4EpXEakaQ1IK0+HpRbINS5e3DtF4gk3Y13Y?=
 =?us-ascii?Q?9evh93WuZkyQ3Q58eGIGOCaeKwYoxoa/UURWDRaAHtz51KS7WVD48/lMGxJw?=
 =?us-ascii?Q?SAhq9hwT2/ipggVl0Y51zymc+1+LoaXgJ3xlrmEYE8z9jIxXPFPfaPOvIXCf?=
 =?us-ascii?Q?+k6qGWpwvyJGwf7t4nVZzxAL4+giu+EGH44CKTY0ahnLZDxJeG8XmGegmPEz?=
 =?us-ascii?Q?f5ZQjczfslww2ykoGxOnhqz1cDuw?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5a4382-2324-47dd-7eb1-08d8eaface17
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 17:16:59.1046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5an2cVCfxmxDAMwduVk92sc/OhXG7dfiFdRZKzFAI+Q3EGwcEZcNSaZtms8bGHf0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2629
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB322133C4D35B77124D00104699689BMXPR01MB3221INDP_"

--_000_BMXPR01MB322133C4D35B77124D00104699689BMXPR01MB3221INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

It is merged in dunfell but not yet in master. Are you planning to merge it=
 in master?

 Thanks & Regards,

 Sana Kazi
 KPIT Technologies Limited


________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Friday, March 19, 2021 10:11 PM
To: Sana Kazi <Sana.Kazi@kpit.com>; Openembedded-devel@lists.openembedded.o=
rg <Openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][meta-oe][master][dunfell][PATCH] mdns: White=
listed CVE-2007-0613 for mdns

Hello Sana

It was in latest pull from Armin which was merged today
it should be in already in dunfell now. Let us know if not.

On 3/19/21 6:31 AM, Sana Kazi wrote:
> Hi Team,
>
> Could you please review below patch to be upstreamed for mdns
>
>
> Thanks & Regards,
>
> Sana Kazi
>   KPIT Technologies Limited
>
>
>
> ------------------------------------------------------------------------
> *From:* Sana Kazi <Sana.Kazi@kpit.com>
> *Sent:* Tuesday, March 9, 2021 12:06 PM
> *To:* Openembedded-devel@lists.openembedded.org
> <Openembedded-devel@lists.openembedded.org>; raj.khem@gmail.com
> <raj.khem@gmail.com>
> *Cc:* Nisha Parrakat <Nisha.Parrakat@kpit.com>; Aditya Tayade
> <Aditya.Tayade@kpit.com>; Harpritkaur Bhandari
> <Harpritkaur.Bhandari@kpit.com>
> *Subject:* [meta-networking][meta-oe][master][dunfell][PATCH] mdns:
> Whitelisted CVE-2007-0613 for mdns
> CVE-2007-0613 is not applicable as it only affects Apple products
> i.e. ichat,mdnsresponder, instant message framework and MacOS.
> Also, https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fwww.exploit-db.com%2Fexploits%2F3230&amp;data=3D04%7C01%7CSana.Kazi%40kpit=
.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%=
7C0%7C0%7C637517688742865584%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DzEEydQaidbn=
LPHjwC8eq4k%2Fb%2FThn53dRfqsUwy5KU%2FE%3D&amp;reserved=3D0
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.=
exploit-db.com%2Fexploits%2F3230&amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%=
7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7=
C0%7C637517688742865584%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DzEEydQaidbnLPHjw=
C8eq4k%2Fb%2FThn53dRfqsUwy5KU%2FE%3D&amp;reserved=3D0> shows the part of co=
de
> affected by CVE-2007-0613 which is not preset in upstream source code.
> Hence, CVE-2007-0613 does not affect other Yocto implementations and
> is not reported for other distros can be marked whitelisted.
> Links:
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fvulmo=
n.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=3D04%7C01%7CSan=
a.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242=
ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3DeAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;reserved=3D0
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fvulm=
on.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=3D04%7C01%7CSa=
na.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3DeAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;reserved=3D0>
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.i=
ncibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-2007-0613&amp;da=
ta=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C1000&amp;sdata=3D5qInEtds3j9aCQPBzoNNgwnjrpkNc%2BlkDXmk2gvoHOA%3D&amp;re=
served=3D0 <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fwww.incibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-2007-0=
613&amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf=
5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;sdata=3D5qInEtds3j9aCQPBzoNNgwnjrpkNc%2BlkDXmk2gvoHOA=
%3D&amp;reserved=3D0>
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecur=
ity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;data=3D04%7C01%7CSana.=
Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff=
61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D=
QW82iXTsR0a1LvT5gIku8EJux9cOlpzzGCVIOCa1FFQ%3D&amp;reserved=3D0
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecu=
rity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;data=3D04%7C01%7CSana=
.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242f=
f61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3DQW82iXTsR0a1LvT5gIku8EJux9cOlpzzGCVIOCa1FFQ%3D&amp;reserved=3D0>
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fubunt=
u.com%2Fsecurity%2FCVE-2007-0613&amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%=
7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7=
C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DFMQ7vLzfqsCYHu7p=
9B4JSH1abFYkWeWQOk3yMuB%2BnQ0%3D&amp;reserved=3D0
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fubun=
tu.com%2Fsecurity%2FCVE-2007-0613&amp;data=3D04%7C01%7CSana.Kazi%40kpit.com=
%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%=
7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DFMQ7vLzfqsCYHu7=
p9B4JSH1abFYkWeWQOk3yMuB%2BnQ0%3D&amp;reserved=3D0>
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fvulmo=
n.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=3D04%7C01%7CSan=
a.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242=
ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3DeAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;reserved=3D0
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fvulm=
on.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=3D04%7C01%7CSa=
na.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3DeAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;reserved=3D0>
> ---
>   .../recipes-protocols/mdns/mdns_1310.40.42.bb       | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
> b/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
> index 445ed87e4..60bc26bf1 100644
> --- a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
> +++ b/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb
> @@ -27,6 +27,19 @@ SRC_URI[sha256sum] =3D
> "bea29e1616cd56ccb8f88c0fad2bcdc4031f4deb2d899c793e2f27a838
>
>   CVE_PRODUCT =3D "apple:mdnsresponder"
>
> +# CVE-2007-0613 is not applicable as it only affects Apple products
> +# i.e. ichat,mdnsresponder, instant message framework and MacOS.
> +# Also, https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Fwww.exploit-db.com%2Fexploits%2F3230&amp;data=3D04%7C01%7CSana.Kazi%40k=
pit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855=
c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D7RyM%2Bx=
WeWU864nFuczXCD5AfylR3G0mL17Yeh5Nodgo%3D&amp;reserved=3D0
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.=
exploit-db.com%2Fexploits%2F3230&amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%=
7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7=
C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D7RyM%2BxWeWU864n=
FuczXCD5AfylR3G0mL17Yeh5Nodgo%3D&amp;reserved=3D0> shows the part of code
> +# affected by CVE-2007-0613 which is not preset in upstream source code.
> +# Hence, CVE-2007-0613 does not affect other Yocto implementations and
> +# is not reported for other distros can be marked whitelisted.
> +# Links:
> +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fvu=
lmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=3D04%7C01%7C=
Sana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a=
242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sda=
ta=3DeAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;reserved=3D=
0
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fvulm=
on.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=3D04%7C01%7CSa=
na.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3Dfh4GpdLsYilHYJgEcMicpxx7wSuX%2BrCe6rxosiIHs%2B0%3D&amp;reserved=3D0>
> +#
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.i=
ncibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-2007-0613&amp;da=
ta=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C1000&amp;sdata=3DHE4%2FBCOYYIwDEuyNr3P0NZMhAJQm7V9BrxVkYDtKmEk%3D&amp;re=
served=3D0 <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fwww.incibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-2007-0=
613&amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf=
5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;sdata=3DHE4%2FBCOYYIwDEuyNr3P0NZMhAJQm7V9BrxVkYDtKmEk=
%3D&amp;reserved=3D0>
> +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fse=
curity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;data=3D04%7C01%7CSa=
na.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3DqAwcUbbb0SGYvixtamLooD4aqCM27Y%2BHhl7K26lHPCg%3D&amp;reserved=3D0
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecu=
rity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;data=3D04%7C01%7CSana=
.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242f=
f61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3DqAwcUbbb0SGYvixtamLooD4aqCM27Y%2BHhl7K26lHPCg%3D&amp;reserved=3D0>
> +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fvu=
lmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=3D04%7C01%7C=
Sana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a=
242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sda=
ta=3Dfh4GpdLsYilHYJgEcMicpxx7wSuX%2BrCe6rxosiIHs%2B0%3D&amp;reserved=3D0
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fvulm=
on.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;data=3D04%7C01%7CSa=
na.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3Dfh4GpdLsYilHYJgEcMicpxx7wSuX%2BrCe6rxosiIHs%2B0%3D&amp;reserved=3D0>
> +CVE_CHECK_WHITELIST +=3D "CVE-2007-0613"
> +
>   PARALLEL_MAKE =3D ""
>
>   S =3D "${WORKDIR}/mDNSResponder-${PV}/mDNSPosix"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only
> for the person to whom it is addressed. If you are not the intended
> recipient, you are not authorized to read, print, retain copy,
> disseminate, distribute, or use this message or any part thereof. If you
> receive this message in error, please notify the sender immediately and
> delete all copies of this message. KPIT Technologies Ltd. does not
> accept any liability for virus infected mails.
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_BMXPR01MB322133C4D35B77124D00104699689BMXPR01MB3221INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
It is merged in dunfell but not yet in master. Are you planning to merge it=
 in master?</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div></div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div><span style=3D"font-family: Arial, sans-serif; font-size: 10pt; color:=
 black;">&nbsp;</span><span style=3D"font-family: Arial, sans-serif; font-s=
ize: 10pt;"><font color=3D"#003366">Thanks &amp; Regards,</font></span><br>
</div>
<div style=3D"text-align:start; background-color:rgb(255,255,255); font-siz=
e:11pt; font-family:Calibri,sans-serif; margin:0px">
<span style=3D"margin:0px; font-size:12pt; font-family:Arial,sans-serif; co=
lor:black; background-color:white"></span></div>
<div style=3D"margin:0px; font-size:15px; text-align:start; background-colo=
r:rgb(255,255,255)">
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0px"><sp=
an style=3D"margin:0px; font-size:10pt; font-family:Arial,sans-serif; color=
:black; background-color:white">&nbsp;</span><span style=3D"margin:0px; fon=
t-size:10pt; font-family:Arial,sans-serif; color:rgb(0,51,102); background-=
color:white">Sana
 Kazi<br>
<span style=3D"color:rgb(0,51,102); font-family:Arial,sans-serif; font-size=
:10pt">&nbsp;KPIT Technologies Limited</span><br>
</span></p>
</div>
<div><br>
<br>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khem=
@gmail.com&gt;<br>
<b>Sent:</b> Friday, March 19, 2021 10:11 PM<br>
<b>To:</b> Sana Kazi &lt;Sana.Kazi@kpit.com&gt;; Openembedded-devel@lists.o=
penembedded.org &lt;Openembedded-devel@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [meta-networking][meta-oe][master][dunfell][PATCH] mdns=
: Whitelisted CVE-2007-0613 for mdns</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hello Sana<br>
<br>
It was in latest pull from Armin which was merged today<br>
it should be in already in dunfell now. Let us know if not.<br>
<br>
On 3/19/21 6:31 AM, Sana Kazi wrote:<br>
&gt; Hi Team,<br>
&gt; <br>
&gt; Could you please review below patch to be upstreamed for mdns<br>
&gt; <br>
&gt; <br>
&gt; Thanks &amp; Regards,<br>
&gt; <br>
&gt; Sana Kazi<br>
&gt;&nbsp; &nbsp;KPIT Technologies Limited<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; ----------------------------------------------------------------------=
--<br>
&gt; *From:* Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
&gt; *Sent:* Tuesday, March 9, 2021 12:06 PM<br>
&gt; *To:* Openembedded-devel@lists.openembedded.org <br>
&gt; &lt;Openembedded-devel@lists.openembedded.org&gt;; raj.khem@gmail.com =
<br>
&gt; &lt;raj.khem@gmail.com&gt;<br>
&gt; *Cc:* Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Aditya Tayade <b=
r>
&gt; &lt;Aditya.Tayade@kpit.com&gt;; Harpritkaur Bhandari <br>
&gt; &lt;Harpritkaur.Bhandari@kpit.com&gt;<br>
&gt; *Subject:* [meta-networking][meta-oe][master][dunfell][PATCH] mdns: <b=
r>
&gt; Whitelisted CVE-2007-0613 for mdns<br>
&gt; CVE-2007-0613 is not applicable as it only affects Apple products<br>
&gt; i.e. ichat,mdnsresponder, instant message framework and MacOS.<br>
&gt; Also, <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fwww.exploit-db.com%2Fexploits%2F3230&amp;amp;data=3D04%7C0=
1%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637517688742865584%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;amp;sdata=3DzEEydQaidbnLPHjwC8eq4k%2Fb%2FThn53dRfqsUwy5KU%2FE%3D&amp;amp;r=
eserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.exp=
loit-db.com%2Fexploits%2F3230&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com=
%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%=
7C0%7C637517688742865584%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DzEEydQaidbn=
LPHjwC8eq4k%2Fb%2FThn53dRfqsUwy5KU%2FE%3D&amp;amp;reserved=3D0</a>
<br>
&gt; &lt;<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fwww.exploit-db.com%2Fexploits%2F3230&amp;amp;data=3D04%7C01%7C=
Sana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a=
242ff61502855c7%7C0%7C0%7C637517688742865584%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp=
;sdata=3DzEEydQaidbnLPHjwC8eq4k%2Fb%2FThn53dRfqsUwy5KU%2FE%3D&amp;amp;reser=
ved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fwww.exploit-db.com%2Fexploits%2F3230&amp;amp;data=3D04%7C01%7CSana.Kazi%4=
0kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff615028=
55c7%7C0%7C0%7C637517688742865584%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DzE=
EydQaidbnLPHjwC8eq4k%2Fb%2FThn53dRfqsUwy5KU%2FE%3D&amp;amp;reserved=3D0</a>=
&gt;
 shows the part of code<br>
&gt; affected by CVE-2007-0613 which is not preset in upstream source code.=
<br>
&gt; Hence, CVE-2007-0613 does not affect other Yocto implementations and<b=
r>
&gt; is not reported for other distros can be marked whitelisted.<br>
&gt; Links:<br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;amp;da=
ta=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C1000&amp;amp;sdata=3DeAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4=
%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fvulmon.=
com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;amp;data=3D04%7C01%7CS=
ana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DeAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;amp;rese=
rved=3D0</a>
<br>
&gt; &lt;<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;am=
p;data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%=
7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C1000&amp;amp;sdata=3DeAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%=
2FZ4%3D&amp;amp;reserved=3D0">https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0=
613&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d=
8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DeAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ=
998sPA%2B%2FZ4%3D&amp;amp;reserved=3D0</a>&gt;<br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fwww.incibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-20=
07-0613&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb=
708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6375176887428755=
86%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D5qInEtds3j9aCQPBzoNNgwnjrpkNc%2Bl=
kDXmk2gvoHOA%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.inc=
ibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-2007-0613&amp;amp;=
data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C=
3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C1000&amp;amp;sdata=3D5qInEtds3j9aCQPBzoNNgwnjrpkNc%2BlkDXmk2gvoHOA%3D&=
amp;amp;reserved=3D0</a>
 &lt;<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fwww.incibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-20=
07-0613&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb=
708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6375176887428755=
86%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D5qInEtds3j9aCQPBzoNNgwnjrpkNc%2Bl=
kDXmk2gvoHOA%3D&amp;amp;reserved=3D0">https://apc01.safelinks.protection.ou=
tlook.com/?url=3Dhttps%3A%2F%2Fwww.incibe-cert.es%2Fen%2Fearly-warning%2Fvu=
lnerabilities%2Fcve-2007-0613&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com=
%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%=
7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D5qInEtds3j9=
aCQPBzoNNgwnjrpkNc%2BlkDXmk2gvoHOA%3D&amp;amp;reserved=3D0</a>&gt;<br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;amp;data=
=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539=
451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpb=
GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7=
C1000&amp;amp;sdata=3DQW82iXTsR0a1LvT5gIku8EJux9cOlpzzGCVIOCa1FFQ%3D&amp;am=
p;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;amp;data=3D04%7C01%7CSan=
a.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242=
ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sd=
ata=3DQW82iXTsR0a1LvT5gIku8EJux9cOlpzzGCVIOCa1FFQ%3D&amp;amp;reserved=3D0</=
a>
<br>
&gt; &lt;<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;amp;=
data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C=
3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C1000&amp;amp;sdata=3DQW82iXTsR0a1LvT5gIku8EJux9cOlpzzGCVIOCa1FFQ%3D&am=
p;amp;reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;amp;=
data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C=
3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C1000&amp;amp;sdata=3DQW82iXTsR0a1LvT5gIku8EJux9cOlpzzGCVIOCa1FFQ%3D&am=
p;amp;reserved=3D0</a>&gt;<br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fubuntu.com%2Fsecurity%2FCVE-2007-0613&amp;amp;data=3D04%7C01%7CSan=
a.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242=
ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sd=
ata=3DFMQ7vLzfqsCYHu7p9B4JSH1abFYkWeWQOk3yMuB%2BnQ0%3D&amp;amp;reserved=3D0=
">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fubuntu.=
com%2Fsecurity%2FCVE-2007-0613&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.co=
m%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0=
%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DFMQ7vLzfqs=
CYHu7p9B4JSH1abFYkWeWQOk3yMuB%2BnQ0%3D&amp;amp;reserved=3D0</a>
<br>
&gt; &lt;<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fubuntu.com%2Fsecurity%2FCVE-2007-0613&amp;amp;data=3D04%7C01%7=
CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;am=
p;sdata=3DFMQ7vLzfqsCYHu7p9B4JSH1abFYkWeWQOk3yMuB%2BnQ0%3D&amp;amp;reserved=
=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fu=
buntu.com%2Fsecurity%2FCVE-2007-0613&amp;amp;data=3D04%7C01%7CSana.Kazi%40k=
pit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855=
c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DFMQ7=
vLzfqsCYHu7p9B4JSH1abFYkWeWQOk3yMuB%2BnQ0%3D&amp;amp;reserved=3D0</a>&gt;<b=
r>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;amp;da=
ta=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C1000&amp;amp;sdata=3DeAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4=
%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fvulmon.=
com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;amp;data=3D04%7C01%7CS=
ana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DeAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;amp;rese=
rved=3D0</a>
<br>
&gt; &lt;<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;am=
p;data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%=
7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C1000&amp;amp;sdata=3DeAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%=
2FZ4%3D&amp;amp;reserved=3D0">https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0=
613&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d=
8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7=
CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi=
LCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DeAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ=
998sPA%2B%2FZ4%3D&amp;amp;reserved=3D0</a>&gt;<br>
&gt; ---<br>
&gt;&nbsp; &nbsp;.../recipes-protocols/mdns/mdns_1310.40.42.bb&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | 13 +++++++++++++<br>
&gt;&nbsp; &nbsp;1 file changed, 13 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb=
 <br>
&gt; b/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb<br>
&gt; index 445ed87e4..60bc26bf1 100644<br>
&gt; --- a/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb<br>
&gt; +++ b/meta-networking/recipes-protocols/mdns/mdns_1310.40.42.bb<br>
&gt; @@ -27,6 +27,19 @@ SRC_URI[sha256sum] =3D <br>
&gt; &quot;bea29e1616cd56ccb8f88c0fad2bcdc4031f4deb2d899c793e2f27a838<br>
&gt; <br>
&gt;&nbsp; &nbsp;CVE_PRODUCT =3D &quot;apple:mdnsresponder&quot;<br>
&gt; <br>
&gt; +# CVE-2007-0613 is not applicable as it only affects Apple products<b=
r>
&gt; +# i.e. ichat,mdnsresponder, instant message framework and MacOS.<br>
&gt; +# Also, <a href=3D"https://apc01.safelinks.protection.outlook.com/?ur=
l=3Dhttps%3A%2F%2Fwww.exploit-db.com%2Fexploits%2F3230&amp;amp;data=3D04%7C=
01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;amp;sdata=3D7RyM%2BxWeWU864nFuczXCD5AfylR3G0mL17Yeh5Nodgo%3D&amp;amp;rese=
rved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.exp=
loit-db.com%2Fexploits%2F3230&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com=
%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%=
7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D7RyM%2BxWeW=
U864nFuczXCD5AfylR3G0mL17Yeh5Nodgo%3D&amp;amp;reserved=3D0</a>
<br>
&gt; &lt;<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fwww.exploit-db.com%2Fexploits%2F3230&amp;amp;data=3D04%7C01%7C=
Sana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a=
242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp=
;sdata=3D7RyM%2BxWeWU864nFuczXCD5AfylR3G0mL17Yeh5Nodgo%3D&amp;amp;reserved=
=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.exploit-db.com%2Fexploits%2F3230&amp;amp;data=3D04%7C01%7CSana.Kazi%40kp=
it.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c=
7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D7RyM%=
2BxWeWU864nFuczXCD5AfylR3G0mL17Yeh5Nodgo%3D&amp;amp;reserved=3D0</a>&gt;
 shows the part of code<br>
&gt; +# affected by CVE-2007-0613 which is not preset in upstream source co=
de.<br>
&gt; +# Hence, CVE-2007-0613 does not affect other Yocto implementations an=
d<br>
&gt; +# is not reported for other distros can be marked whitelisted.<br>
&gt; +# Links:<br>
&gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;amp=
;data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7=
C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7C=
TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0=
%3D%7C1000&amp;amp;sdata=3DeAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2=
FZ4%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fvulmon.=
com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;amp;data=3D04%7C01%7CS=
ana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637517688742875586%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DeAkjsIawSp2YHJL3bqORC%2B%2FRdxYVRKFIJ998sPA%2B%2FZ4%3D&amp;amp;rese=
rved=3D0</a>
<br>
&gt; &lt;<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;am=
p;data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%=
7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C1000&amp;amp;sdata=3Dfh4GpdLsYilHYJgEcMicpxx7wSuX%2BrCe6rxosiIHs%2B0=
%3D&amp;amp;reserved=3D0">https://apc01.safelinks.protection.outlook.com/?u=
rl=3Dhttps%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&=
amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf=
5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;amp;sdata=3Dfh4GpdLsYilHYJgEcMicpxx7wSuX%2BrCe6rxosiI=
Hs%2B0%3D&amp;amp;reserved=3D0</a>&gt;<br>
&gt; +# <br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fwww.incibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-20=
07-0613&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb=
708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6375176887428855=
78%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DHE4%2FBCOYYIwDEuyNr3P0NZMhAJQm7V9=
BrxVkYDtKmEk%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.inc=
ibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-2007-0613&amp;amp;=
data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C=
3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C1000&amp;amp;sdata=3DHE4%2FBCOYYIwDEuyNr3P0NZMhAJQm7V9BrxVkYDtKmEk%3D&=
amp;amp;reserved=3D0</a>
 &lt;<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Fwww.incibe-cert.es%2Fen%2Fearly-warning%2Fvulnerabilities%2Fcve-20=
07-0613&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb=
708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6375176887428855=
78%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DHE4%2FBCOYYIwDEuyNr3P0NZMhAJQm7V9=
BrxVkYDtKmEk%3D&amp;amp;reserved=3D0">https://apc01.safelinks.protection.ou=
tlook.com/?url=3Dhttps%3A%2F%2Fwww.incibe-cert.es%2Fen%2Fearly-warning%2Fvu=
lnerabilities%2Fcve-2007-0613&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com=
%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%=
7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DHE4%2FBCOYY=
IwDEuyNr3P0NZMhAJQm7V9BrxVkYDtKmEk%3D&amp;amp;reserved=3D0</a>&gt;<br>
&gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;amp;d=
ata=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3=
539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C1000&amp;amp;sdata=3DqAwcUbbb0SGYvixtamLooD4aqCM27Y%2BHhl7K26lHPCg%3D&a=
mp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;amp;data=3D04%7C01%7CSan=
a.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a242=
ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sd=
ata=3DqAwcUbbb0SGYvixtamLooD4aqCM27Y%2BHhl7K26lHPCg%3D&amp;amp;reserved=3D0=
</a>
<br>
&gt; &lt;<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;amp;=
data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C=
3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CT=
WFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%=
3D%7C1000&amp;amp;sdata=3DqAwcUbbb0SGYvixtamLooD4aqCM27Y%2BHhl7K26lHPCg%3D&=
amp;amp;reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2007-0613&amp;=
amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5cae=
f%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C1000&amp;amp;sdata=3DqAwcUbbb0SGYvixtamLooD4aqCM27Y%2BHhl7K26lHPCg=
%3D&amp;amp;reserved=3D0</a>&gt;<br>
&gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;amp=
;data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7=
C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7C=
TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0=
%3D%7C1000&amp;amp;sdata=3Dfh4GpdLsYilHYJgEcMicpxx7wSuX%2BrCe6rxosiIHs%2B0%=
3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fvulmon.=
com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;amp;data=3D04%7C01%7CS=
ana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Dfh4GpdLsYilHYJgEcMicpxx7wSuX%2BrCe6rxosiIHs%2B0%3D&amp;amp;reserved=
=3D0</a>
<br>
&gt; &lt;<a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&amp;am=
p;data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf5caef%=
7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C1000&amp;amp;sdata=3Dfh4GpdLsYilHYJgEcMicpxx7wSuX%2BrCe6rxosiIHs%2B0=
%3D&amp;amp;reserved=3D0">https://apc01.safelinks.protection.outlook.com/?u=
rl=3Dhttps%3A%2F%2Fvulmon.com%2Fvulnerabilitydetails%3Fqid%3DCVE-2007-0613&=
amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7Ca14a00000eb0436f8fb708d8eaf=
5caef%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637517688742885578%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;amp;sdata=3Dfh4GpdLsYilHYJgEcMicpxx7wSuX%2BrCe6rxosiI=
Hs%2B0%3D&amp;amp;reserved=3D0</a>&gt;<br>
&gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2007-0613&quot;<br>
&gt; +<br>
&gt;&nbsp; &nbsp;PARALLEL_MAKE =3D &quot;&quot;<br>
&gt; <br>
&gt;&nbsp; &nbsp;S =3D &quot;${WORKDIR}/mDNSResponder-${PV}/mDNSPosix&quot;=
<br>
&gt; -- <br>
&gt; 2.17.1<br>
&gt; <br>
&gt; This message contains information that may be privileged or confidenti=
al <br>
&gt; and is the property of the KPIT Technologies Ltd. It is intended only =
<br>
&gt; for the person to whom it is addressed. If you are not the intended <b=
r>
&gt; recipient, you are not authorized to read, print, retain copy, <br>
&gt; disseminate, distribute, or use this message or any part thereof. If y=
ou <br>
&gt; receive this message in error, please notify the sender immediately an=
d <br>
&gt; delete all copies of this message. KPIT Technologies Ltd. does not <br=
>
&gt; accept any liability for virus infected mails.<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_BMXPR01MB322133C4D35B77124D00104699689BMXPR01MB3221INDP_--
