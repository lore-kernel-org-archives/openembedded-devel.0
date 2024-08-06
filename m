Return-Path: <nikhil.r@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB01C49EA1
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 13:27:20 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.73])
 by mx.groups.io with SMTP id smtpd.web10.7202.1722950829483566624
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 06:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=WjtmpIbX;
 spf=pass (domain: kpit.com, ip: 40.107.57.73, mailfrom: nikhil.r@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgd949VUXlYTG4o+KU15REar0Q5ii0FolHRXCg05S/mOKBTPSEqyqDsbin0Lzbo/T70PPMXnEXAqvygZm6/unjBEp01nwAttVzg9ojXeKhEDTxuPNdlolBtR7cRZj7wX0oHduLoa4ZNMufRSL7fTeF2Pu4Cj1HFUox57bKZW+3GZXnscxnrc94enBV57HLuHh4xR2WTk5KVsyGQ2lTuG21SkMS+2BlV9Sj0roX8OIHg+kjL4i4084AFOyp5VsLQ/J/hLHex/sb0qAZI9BZp99cSiT/a6J3ymYW7byEKGtmKqRDnP/eB62hIvlCyQchFE213pTaG3UhtwZ6cffDpDLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TD0qmpa/9Je0M8Fn3q7y2iKXrMofMDeqNju6DZMiH4=;
 b=yHK7GGcx4IVCC+0sYWHt1UFnvHeavN1J9lrjA9HX075qBkJ4lDMzVyMdHirl0J3qb7QZxuYncyyy4aFbH4OBvxpDuuhTRiltjek55Qx1SfE9jjYgJDfh0fmv7oHLP56TRwk30ilBZfDxkzZNSKJ5qChLwZDwxTh9xeB5BBjFWhyLNGOPH+hN7Dn4Cu6IB1KMHqPrcnejoVgIRUbjI7tfc4sgHYDwVSE34UYEOYp0Pvt3XeaeRsg49OjPa6XhJhgQt9oSy/t3O5WfSlN2IeMhS+evY39NUTn2w6XHn4KgSjiBPP0xLOM4YCz2dwDC5B5fT1Jc2won/Zug9+ndDAeWEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TD0qmpa/9Je0M8Fn3q7y2iKXrMofMDeqNju6DZMiH4=;
 b=WjtmpIbXx6a7jBgzLjSoFRdPzTkfmUxKOv93mwnaXeUGKFYC75+FZrrEZNOmllo8OZhj2w9+iFfQZ+0w7YSv89artVmxpzLdGap6HK+OJsISeq48KECx5Qag/N+zm0FLQpHDyDMcPif6hvH1u/4fkBnECfsf7q1pljjdyBjnxfU=
Received: from MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d1::12)
 by MA0PR01MB5756.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:49::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Tue, 6 Aug
 2024 13:26:59 +0000
Received: from MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d793:8439:6db7:9272]) by MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d793:8439:6db7:9272%3]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 13:26:59 +0000
From: Nikhil R <Nikhil.R@kpit.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>
Subject: Re: [oe][kirkstone][PATCH] opensc: Fix CVE CVE-2023-5992
Thread-Topic: [oe][kirkstone][PATCH] opensc: Fix CVE CVE-2023-5992
Thread-Index: AQHa6APQ0W7HxEhiTUedaWFvVUw7W7IaOBVN
Date: Tue, 6 Aug 2024 13:26:58 +0000
Message-ID: 
 <MAZPR01MB8950C73EC4B4044CAD8863F0EEBF2@MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM>
References: <20240806063939.527656-1-nikhil.r@kpit.com>
 <4b2a8bb2-c67e-4233-be35-605e8a946bde@gmail.com>
In-Reply-To: <4b2a8bb2-c67e-4233-be35-605e8a946bde@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAZPR01MB8950:EE_|MA0PR01MB5756:EE_
x-ms-office365-filtering-correlation-id: eb696d2b-2fea-4ad0-d3f9-08dcb61b72f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?3+XVgMdC9v1FP+cJgOotuGwsmPHqNz6bDM/kDzhkqNcCrvMYTxe/23ghzuzI?=
 =?us-ascii?Q?7fDhPPuKeKo1P3xl0YO4RnAmylxe2lD5G6g6eHq58Crm9r3rNn3he/gn3KYo?=
 =?us-ascii?Q?vN/Rivt5MC8U8oUu2trP45eSafgiD1dcbN3/1Pg5zG7VDHg8oOcMH41lYQdL?=
 =?us-ascii?Q?boLakFhGDWEPBMXTfVw9uDNmc5JfV/99CZyCd+SJe+xZyh+NM4MP+dbl7O0K?=
 =?us-ascii?Q?cPsSHKyUifXTqj35tI3lVvdJofDOWVpGLGI0We+368jPOoccBAo0C8yywnuJ?=
 =?us-ascii?Q?kxOr/muCnxn0hSY+ZOnWJw7SG3caBncKwMkA7Tf7veDHsgNJJ+MnloKGTiDK?=
 =?us-ascii?Q?weRz4k7//zzZc7hF662QYPJOqhmoPDK7KqMH6umRFWddKKpZuRmSvAt04r8G?=
 =?us-ascii?Q?Ck5Rpdl4O/FyEiawMB5PATatM2o/pKHPS2ac+1wJTinQBcTbhfBzeRL+3SMk?=
 =?us-ascii?Q?Eg/Xh/9BBNEtYGSAxj88C5vfuyXcttomdXlfN78tgjwqBiXRPQe66wDXOBZ1?=
 =?us-ascii?Q?Qf7Hz7CdMRN/jvSIgHPdPXda+RZPrmzPc429r7sl6r6GqBiE37j8BShqdHr5?=
 =?us-ascii?Q?Z0hFXIAwtjI0kDheGbQyuwnSyT3cIcpJRlwbSw9i+ufBwlwneJ/x3BTBOoK3?=
 =?us-ascii?Q?NSJEfqLp//1eJOlJektu6Sz0BZd+lV4rkpw9pdhezXMTSEE1ix2eiNTiE9vg?=
 =?us-ascii?Q?iSQXn6jiEGE96D1gYyW8PYq4WzUXFcTJW0NT7HmaYVzfuFuAXTkZFjQmAmqH?=
 =?us-ascii?Q?tvPvcaC5efR5GxGy0EAIjHFCcbaaVhW5P7AOlh3otdmsWz453Jdq04K/KG2L?=
 =?us-ascii?Q?6J+iIvDIWjX1btZcE+1TbCccCCQ+ugr6MqtQZfh7MBX5yptd1JAudXpsJBlS?=
 =?us-ascii?Q?7OIjOOfTvFY35Sfe8z29/NSUmV8myVJSMRx33cWB7RvLJHOF0sWBamxU8h1L?=
 =?us-ascii?Q?MzekMG7SSHJZ2vA4oQDw3S4LcD25wIHrAaS6Ms1HM3KfNkWGm5/0iHy61X0j?=
 =?us-ascii?Q?5zM9dumfvUhnEo8OwaVAvW1kRL0ldhumBwOvX25ruho1aTR6M75+x1A+2sSk?=
 =?us-ascii?Q?vYIBO7MBLBUq3Qo9Dnally0qkPuzaExVoCQZbYsFkt+ADcRKTdElNMpkJvTK?=
 =?us-ascii?Q?vMQTTCmSw3NRTKJ2YjQUkmJfXjawGoxgyR7Etpirk7y3Kab5JJosXAiAQBq0?=
 =?us-ascii?Q?YBuIzw46q/hjIsOMvtcBENmjkmRbVs64eaoII1MsZsnw6RxfvWEBuGdNmUX5?=
 =?us-ascii?Q?bhe61G8/KYuhbGM/iRbgeag4MOcjhwSv3+FfPxrvatkhGBAeHy81/qjTJgH6?=
 =?us-ascii?Q?9OMwf+5ZGBnvFL0xIB5F+THUt77nSxSqRD5JThUfNGToXuzfwo3nEdcOYOlJ?=
 =?us-ascii?Q?o/8tMmM=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?sOlAjK4M0En4BWAQwRY0dAKk5uBftC3FJ/5FCC4ZlxTjjFSZ6Shjc7394AYO?=
 =?us-ascii?Q?jAvPmfxLe7wyfmrGTV/ktS/67nyF5+L4pWbOwjvbKpDiz+Ddlqdu4kjc5y3g?=
 =?us-ascii?Q?RXYagYTathWtLThG3d+WNXq6PDzF6/LvzUzO3ULbD/H3+Zd63jjlRLbRDUQV?=
 =?us-ascii?Q?omwJ5K0aDq8ceISUWWrdyShYPLD6/BvrLjFPooxZHxAmGuezWfDfkqFcb/0W?=
 =?us-ascii?Q?D8l1RhS5VBmMvD3CxizVrW7n/GeFovX5YHt728YOLZNhXUWCvO2ZId/PrJZW?=
 =?us-ascii?Q?+hq0ujxkNQYoOd+P1EJd6yWypulNSco/0KQYz5Gs3Al9RVpBAsSTt6LJq/mH?=
 =?us-ascii?Q?aYSCUUloQcNyDisb9jyiK6sPJV1fLD+b4E00KgT4LPPVj+32RlfIkdORvW9T?=
 =?us-ascii?Q?JIqrSL+0hV0xjHiw4mlIggX4lvdCEI/+z88+PVyYcPPlw6w8iWlgRM1o0uBd?=
 =?us-ascii?Q?hF0fvqKOiYNxOB/6ueEyxMepNuvoasRaLTr9g5b5ovAV0oSFddI/EuaJt9BC?=
 =?us-ascii?Q?7vvl+anrlcNTUmLKKt7MiIZe45pOqkubFLj8tv0vH4+TkOHHAqdo9CFYmKC4?=
 =?us-ascii?Q?yYFqZpyVr9Zryt3FB5yTV/gFSuUFmSyj/DdIlFMpBhPFK03Wv3qGu5a+cx8j?=
 =?us-ascii?Q?gt03R7q62hlPP4spLVvJOz3MCvRBIwWkt+6e0i8ZM/xaBrd//vb1bUd3XFBS?=
 =?us-ascii?Q?FnxoYnAy+BH7IYepfG4Ey3Lq2p1eUDBPXJfkYsIDYOUoZ2UlTZWLZna8Ue/k?=
 =?us-ascii?Q?c7Av+x8IK4LYeGj+DAxSFbUv7yjoBKWF0Lr0oqtcRc7uTYdVTchKnPRFNejn?=
 =?us-ascii?Q?pNyv4F2vujh6hIkw4SAW5qRnJm29FhYHQtk4SAlKUdxJkVAbdETPtcR8GFbF?=
 =?us-ascii?Q?LKtH/PV1+m/v3eW238EgLx2J7SlQ6rdbq0B1GTzkFpRO6yREi/fuwOh3l4/C?=
 =?us-ascii?Q?u0N6UqSobfc04IV5xBUNrB+gKUCeDQrMHWJ3dW46+n3XeXvjX/T7+f6kpo7I?=
 =?us-ascii?Q?pGcbKNgpS1r+Ah66lOArxAsVak3g8q7RkRu6PwXisfvQHqMUHSFxMZFRmbBO?=
 =?us-ascii?Q?5v8Z8OlXLOexpmm1AD8t1RxEk+bQxdJnKnrzUGABpf5EdXnptjgC2iiinIYG?=
 =?us-ascii?Q?4ZEIi2Qt0JauSZ+u8crpPrcI1/zxo0jL1zQ5j1wufR//PUY3ZtNWY7c2CSWT?=
 =?us-ascii?Q?Yqzmdn3x4ICJvyvaBgTZnFBpJrtYu7U+lujDkzOelvJIFpiCZTecWAUbj8pa?=
 =?us-ascii?Q?T3pr3vM0ebD/BZHiuR6EUMko07kZg/dK2xsCM37LfjXTcp6/JsFCTTwRTAnF?=
 =?us-ascii?Q?HFno3q5HPdV52yNmmDk1gptCX+5gRdLg0T7tct3pjRPgZu23rQZ2V3MwWkpZ?=
 =?us-ascii?Q?Ex8naz4Ma2ustTyNB+T6lFibeLVcufGZAhT6TUjSE4tCPYd5O5HTBxE5xKKr?=
 =?us-ascii?Q?WXw74IM0Y2DUg9ex2AojUYtYkgC9TpFv35JYmWdm5nZBuDdr2Cf6/Fn1h68m?=
 =?us-ascii?Q?8g1HJ3ycjGZMbyuFZUmxVzE4ZT/nRZlZGzS9n6z8qDNL9na8D0xT3ARfA6E5?=
 =?us-ascii?Q?FfJ1u2RGOSnsH1uI540=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MAZPR01MB8950C73EC4B4044CAD8863F0EEBF2MAZPR01MB8950INDP_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAZPR01MB8950.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: eb696d2b-2fea-4ad0-d3f9-08dcb61b72f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 13:26:58.8392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PnYqXz1b9kpeqFxuVm3P1DlvpFZo4yAgoTE+KMoeCwUgxQ5U24bUOUWMHw23xYY6okrwgD+irk83Tmr7pUM2aA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB5756
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 13:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111583

--_000_MAZPR01MB8950C73EC4B4044CAD8863F0EEBF2MAZPR01MB8950INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

It was a resend , some issue with my mail

Sorry for the inconvenience

Thanks,
Nikhil
________________________________
From: akuster808 <akuster808@gmail.com>
Sent: Tuesday, August 6, 2024 6:53 PM
To: Nikhil R <Nikhil.R@kpit.com>; openembedded-devel@lists.openembedded.org=
 <openembedded-devel@lists.openembedded.org>
Cc: Ranjitsinh Rathod <Ranjitsinh.Rathod@kpit.com>
Subject: Re: [oe][kirkstone][PATCH] opensc: Fix CVE CVE-2023-5992

Caution: This email originated from outside of the KPIT. Do not click links=
 or open attachments unless you recognize the sender and know the content i=
s safe.

On 8/6/24 2:39 AM, Nikhil via lists.openembedded.org wrote:
> A vulnerability was found in OpenSC where PKCS#1
> encryption padding removal is not implemented as
> side-channel resistant. This issue may result in
> the potential leak of private data.
>
> Links: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits&data=3D05%7C02%7Cnik=
hil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242f=
f61502855c7%7C0%7C0%7C638585474039172084%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=
=3Dv1zXWJdAQKH%2FBg8GgbnqZQvSs83bGwgOc6G9tlMMv0o%3D&reserved=3D0<https://gi=
thub.com/OpenSC/OpenSC/pull/2948/commits>
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FOpenSC%2FOpenSC%2Fpull%2F3016&data=3D05%7C02%7Cnikhil.r%40kpit.com%=
7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7=
C0%7C638585474039184980%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DJ5nHjZsiJbZmN3=
v7RfQ%2FdesIPfDbVfKpcnUqVvws5d8%3D&reserved=3D0<https://github.com/OpenSC/O=
penSC/pull/3016>
>
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fgithub.com%2Fxhanulik%2FOpenSC%2Fcommit%2Fbb9bd627462af4d61943a33d6e54308e=
103618f0&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61=
aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039188910%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DDaRkHFwlHSpIEpXNSNSMxXaxXdzWGOqoMu0LqYCFdDM=
%3D&reserved=3D0<https://github.com/xhanulik/OpenSC/commit/bb9bd627462af4d6=
1943a33d6e54308e103618f0>
> Add the above commit to fix the below error
> Error:
> | ../../../git/src/pkcs11/mechanism.c: In function 'sc_pkcs11_decrypt':
> | ../../../git/src/pkcs11/mechanism.c:1093:24: error: 'rv' undeclared (fi=
rst use in this function)

Is this a v2 or just a resend?

- armin
>
> The below commits were not added as they are part
> of unittests
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2F708ce24c6b9f92a9f39bb7acc=
da601b2891304a3&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b=
08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63858547403919232=
5%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3D0vQBOHhjyIIqCfiCSq2zFEhTzAym7Wsub3T1=
jHcUMWs%3D&reserved=3D0<https://github.com/OpenSC/OpenSC/pull/2948/commits/=
708ce24c6b9f92a9f39bb7accda601b2891304a3>
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2FOpenSC%2FOpenSC%2Fpull%2F3016%2Fcommits%2F7309b37eb82496e7324671283=
a39f9291be09830&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b=
08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63858547403919577=
8%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DcXH3gbRXa87SGKXBjweq3O9dISPyKujB6ha%=
2BIZno%2B6Q%3D&reserved=3D0<https://github.com/OpenSC/OpenSC/pull/3016/comm=
its/7309b37eb82496e7324671283a39f9291be09830>
>
> Signed-off-by: Nikhil R <nikhil.r@kpit.com>
> ---
>   ...lement-the-C_DecryptFinalize-and-C_D.patch | 110 ++++++
>   .../opensc/opensc/CVE-2023-5992-1.patch       | 357 ++++++++++++++++++
>   .../opensc/opensc/CVE-2023-5992-2.patch       |  39 ++
>   .../opensc/opensc/CVE-2023-5992-3.patch       | 105 ++++++
>   .../opensc/opensc/CVE-2023-5992-4.patch       |  47 +++
>   .../opensc/opensc/CVE-2023-5992-5.patch       | 115 ++++++
>   .../opensc/opensc/CVE-2023-5992-6.patch       |  47 +++
>   .../opensc/opensc/CVE-2023-5992-7.patch       |  33 ++
>   .../opensc/opensc/CVE-2023-5992-8.patch       |  71 ++++
>   .../recipes-support/opensc/opensc_0.22.0.bb   |   9 +
>   10 files changed, 933 insertions(+)
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/0001-Preparing=
-to-implement-the-C_DecryptFinalize-and-C_D.patch
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-=
1.patch
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-=
2.patch
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-=
3.patch
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-=
4.patch
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-=
5.patch
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-=
6.patch
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-=
7.patch
>   create mode 100644 meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-=
8.patch
>
> diff --git a/meta-oe/recipes-support/opensc/opensc/0001-Preparing-to-impl=
ement-the-C_DecryptFinalize-and-C_D.patch b/meta-oe/recipes-support/opensc/=
opensc/0001-Preparing-to-implement-the-C_DecryptFinalize-and-C_D.patch
> new file mode 100644
> index 000000000..619ab522e
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/0001-Preparing-to-implement-t=
he-C_DecryptFinalize-and-C_D.patch
> @@ -0,0 +1,110 @@
> +From bb9bd627462af4d61943a33d6e54308e103618f0 Mon Sep 17 00:00:00 2001
> +From: Peter Popovec <popovec.peter@gmail.com>
> +Date: Mon, 20 Dec 2021 08:43:49 +0100
> +Subject: [PATCH] Preparing to implement the C_DecryptFinalize and
> + C_DecryptUpdate functions.
> +
> +The C_Decrypt() and pkcs15_prkey_decrypt() functions have been changed t=
o
> +allow pkcs15_prkey_decrypt() to be called from C_DecryptInit(),
> +C_DecryptUpdate() and C_DecryptFinalize().
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgithub.com%2Fxhanulik%2FOpenSC%2Fcommit%2Fbb9bd62746=
2af4d61943a33d6e54308e103618f0&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110=
059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63=
8585474039199071%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz=
IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DchY%2FOcThfZawDLg0w6d=
I9NUdqQMzYiMdHzW7Hyf9%2Fcg%3D&reserved=3D0<https://github.com/xhanulik/Open=
SC/commit/bb9bd627462af4d61943a33d6e54308e103618f0>]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +Comment: Refreshed hunk to match latest kirkstone
> +---
> + src/pkcs11/framework-pkcs15.c | 15 +++++++++++++
> + src/pkcs11/mechanism.c        | 42 ++++++++++++++++++++++++++++++-----
> + 2 files changed, 51 insertions(+), 6 deletions(-)
> +
> +diff --git a/src/pkcs11/framework-pkcs15.c b/src/pkcs11/framework-pkcs15=
.c
> +index 688cd84fdc..18f94271ed 100644
> +--- a/src/pkcs11/framework-pkcs15.c
> ++++ b/src/pkcs11/framework-pkcs15.c
> +@@ -4345,6 +4345,21 @@ pkcs15_prkey_decrypt(struct sc_pkcs11_se
> +       int rv, flags =3D 0, prkey_has_path =3D 0;
> +       CK_ULONG mask, good, rv_pkcs11;
> +
> ++      if (pulDataLen =3D=3D NULL) {
> ++              /* This is call from the C_DecyptInit function */
> ++              sc_log(context, "C_DecryptInit...");
> ++              return CKR_OK;
> ++      }
> ++      if (pEncryptedData =3D=3D NULL && ulEncryptedDataLen =3D=3D 0) {
> ++              /* This is call from the C_DecryptFinalize function */
> ++              sc_log(context, "C_DecryptFinalize...");
> ++              *pulDataLen =3D 0;
> ++              return CKR_OK;
> ++      }
> ++      /* DecryptUpdate: we assume this code is called only once per ses=
sion, either
> ++       * from the C_Decrypt function or from an application using the C=
_DecryptUpdate call
> ++       */
> ++
> +       sc_log(context, "Initiating decryption.");
> +
> +       if (!p11card)
> +diff --git a/src/pkcs11/mechanism.c b/src/pkcs11/mechanism.c
> +index 3035e8a763..a81b58fea6 100644
> +--- a/src/pkcs11/mechanism.c
> ++++ b/src/pkcs11/mechanism.c
> +@@ -1072,9 +1072,11 @@ sc_pkcs11_decrypt_init(sc_pkcs11_operati
> +                       LOG_FUNC_RETURN(context, (int) rv);
> +               }
> +       }
> +-
> +       operation->priv_data =3D data;
> +-      return CKR_OK;
> ++
> ++      /* The last parameter is NULL - this is call to INIT code in unde=
rlying functions */
> ++      return key->ops->decrypt(operation->session,
> ++                      key, &operation->mechanism, NULL, 0, NULL, NULL);
> + }
> +
> + static CK_RV
> +@@ -1084,14 +1086,42 @@ sc_pkcs11_decrypt(sc_pkcs11_operation_t
> + {
> +       struct signature_data *data;
> +       struct sc_pkcs11_object *key;
> ++      CK_RV rv;
> ++      CK_ULONG ulDataLen, ulLastDataLen;
> ++
> ++      /* PKCS#11: If pBuf is not NULL_PTR, then *pulBufLen must contain=
 the size in bytes.. */
> ++      if (pData && !pulDataLen)
> ++              return CKR_ARGUMENTS_BAD;
> ++
> ++      ulDataLen =3D pulDataLen ? *pulDataLen : 0;
> ++      ulLastDataLen =3D ulDataLen;
> +
> +       data =3D (struct signature_data*) operation->priv_data;
> +
> +       key =3D data->key;
> +-      return key->ops->decrypt(operation->session,
> +-                              key, &operation->mechanism,
> +-                              pEncryptedData, ulEncryptedDataLen,
> +-                              pData, pulDataLen);
> ++
> ++      /* Decrypt */
> ++      rv =3D key->ops->decrypt(operation->session, key, &operation->mec=
hanism,
> ++                      pEncryptedData, ulEncryptedDataLen, pData, &ulDat=
aLen);
> ++
> ++      if (pulDataLen)
> ++              *pulDataLen =3D ulDataLen;
> ++
> ++      if (rv !=3D CKR_OK)
> ++              return rv;
> ++
> ++      /* recalculate buffer space */
> ++      if (ulDataLen <=3D ulLastDataLen)
> ++              ulLastDataLen -=3D ulDataLen;
> ++      else
> ++              ulLastDataLen =3D 0;
> ++
> ++      /* DecryptFinalize */
> ++      rv =3D key->ops->decrypt(operation->session, key, &operation->mec=
hanism,
> ++                      NULL, 0, pData + ulDataLen, &ulLastDataLen);
> ++      if (pulDataLen)
> ++              *pulDataLen =3D ulDataLen + ulLastDataLen;
> ++      return rv;
> + }
> +
> + static CK_RV
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patch =
b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patch
> new file mode 100644
> index 000000000..8450ed010
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patch
> @@ -0,0 +1,357 @@
> +From b9e1d344df1f850a9b15bce6294f72c1620d0b45 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanuli=
k@redhat.com>
> +Date: Mon, 13 Nov 2023 13:54:54 +0100
> +Subject: [PATCH] Reimplement removing of PKCS#1 v1.5 padding to be time
> + constant
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits=
%2Fb9e1d344df1f850a9b15bce6294f72c1620d0b45&data=3D05%7C02%7Cnikhil.r%40kpi=
t.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C638585474039202218%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DiPX5r%2F=
gij2FkmH7YiZyjjq3X4bmfg3b5M3swdYu1oXc%3D&reserved=3D0<https://github.com/Op=
enSC/OpenSC/pull/2948/commits/b9e1d344df1f850a9b15bce6294f72c1620d0b45>]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +Comment: Refreshed hunks to match latest kirkstone
> +---
> + src/common/Makefile.am      |   6 +-
> + src/common/constant-time.h  | 128 ++++++++++++++++++++++++++++++++++++
> + src/libopensc/internal.h    |   4 +-
> + src/libopensc/padding.c     | 102 +++++++++++++++++++---------
> + src/libopensc/pkcs15-sec.c  |   5 +-
> + src/minidriver/minidriver.c |   4 +-
> + 6 files changed, 210 insertions(+), 39 deletions(-)
> + create mode 100644 src/common/constant-time.h
> +
> +diff --git a/src/common/Makefile.am b/src/common/Makefile.am
> +index 5153428dce..9ecbffe8fd 100644
> +--- a/src/common/Makefile.am
> ++++ b/src/common/Makefile.am
> +@@ -8,7 +8,8 @@ dist_noinst_DATA =3D \
> +       LICENSE.compat_getopt compat_getopt.txt \
> +       compat_getopt_main.c \
> +       README.compat_strlcpy compat_strlcpy.3
> +-noinst_HEADERS =3D compat_strlcat.h compat_strlcpy.h compat_strnlen.h c=
ompat_getpass.h compat_getopt.h simclist.h libpkcs11.h libscdl.h
> ++noinst_HEADERS =3D compat_strlcat.h compat_strlcpy.h compat_strnlen.h c=
ompat_getpass.h \
> ++      compat_getopt.h simclist.h libpkcs11.h libscdl.h constant-time.h
> +
> + AM_CPPFLAGS =3D -I$(top_srcdir)/src
> +
> +@@ -40,7 +41,8 @@ TIDY_FILES =3D \
> +       compat_report_rangecheckfailure.c \
> +       compat___iob_func.c \
> +       simclist.c simclist.h \
> +-      libpkcs11.c libscdl.c
> ++      libpkcs11.c libscdl.c \
> ++      constant-time.h
> +
> + check-local:
> +       if [ -x "$(CLANGTIDY)" ]; then clang-tidy -config=3D'' --checks=
=3D'$(TIDY_CHECKS)' -header-filter=3D.* $(addprefix $(srcdir)/,$(TIDY_FILES=
)) -- $(TIDY_FLAGS); fi
> +diff --git a/src/common/constant-time.h b/src/common/constant-time.h
> +new file mode 100644
> +index 0000000000..40c3e500c2
> +--- /dev/null
> ++++ b/src/common/constant-time.h
> +@@ -0,0 +1,128 @@
> ++/* Original source: https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2Fopenssl%2Fopenssl%2Fblob%2F9890cc42daff5e2d0c=
ad01ac4bf78c391f599a6e%2Finclude%2Finternal%2Fconstant_time.h&data=3D05%7C0=
2%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a=
26a242ff61502855c7%7C0%7C0%7C638585474039205497%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7=
C&sdata=3D2ZUT7z6e6fmVbnWkr%2BeO4r8DNFdkIFasKGZC4XByAuY%3D&reserved=3D0<htt=
ps://github.com/openssl/openssl/blob/9890cc42daff5e2d0cad01ac4bf78c391f599a=
6e/include/internal/constant_time.h> */
> ++
> ++#ifndef CONSTANT_TIME_H
> ++#define CONSTANT_TIME_H
> ++
> ++#include <stdlib.h>
> ++#include <string.h>
> ++
> ++#if !defined(inline)
> ++#if defined(__STDC_VERSION__) && __STDC_VERSION__ >=3D 199901L
> ++#define constant_inline inline
> ++#elif defined(__GNUC__) && __GNUC__ >=3D 2
> ++#elif defined(__GNUC__) && __GNUC__ >=3D 2
> ++#elif defined(_MSC_VER)
> ++#define constant_inline __inline
> ++#else
> ++#define constant_inline
> ++#endif
> ++#else                        /* use what caller wants as inline  may be=
 from config.h */
> ++#define constant_inline inline /* inline */
> ++#endif
> ++
> ++/*-
> ++ * The boolean methods return a bitmask of all ones (0xff...f) for true
> ++ * and 0 for false. For example,
> ++ *      if (a < b) {
> ++ *        c =3D a;
> ++ *      } else {
> ++ *        c =3D b;
> ++ *      }
> ++ * can be written as
> ++ *      unsigned int lt =3D constant_time_lt(a, b);
> ++ *      c =3D constant_time_select(lt, a, b);
> ++ */
> ++
> ++static constant_inline unsigned int
> ++value_barrier(unsigned int a)
> ++{
> ++      volatile unsigned int r =3D a;
> ++      return r;
> ++}
> ++
> ++static constant_inline size_t
> ++value_barrier_s(size_t a)
> ++{
> ++      volatile size_t r =3D a;
> ++      return r;
> ++}
> ++
> ++/* MSB */
> ++static constant_inline size_t
> ++constant_time_msb_s(size_t a)
> ++{
> ++      return 0 - (a >> (sizeof(a) * 8 - 1));
> ++}
> ++
> ++static constant_inline unsigned int
> ++constant_time_msb(unsigned int a)
> ++{
> ++      return 0 - (a >> (sizeof(a) * 8 - 1));
> ++}
> ++
> ++/* Select */
> ++static constant_inline unsigned int
> ++constant_time_select(unsigned int mask, unsigned int a, unsigned int b)
> ++{
> ++      return (value_barrier(mask) & a) | (value_barrier(~mask) & b);
> ++}
> ++
> ++static constant_inline unsigned char
> ++constant_time_select_8(unsigned char mask, unsigned char a, unsigned ch=
ar b)
> ++{
> ++      return (unsigned char)constant_time_select(mask, a, b);
> ++}
> ++
> ++static constant_inline size_t
> ++constant_time_select_s(size_t mask, size_t a, size_t b)
> ++{
> ++      return (value_barrier_s(mask) & a) | (value_barrier_s(~mask) & b)=
;
> ++}
> ++
> ++/* Zero */
> ++static constant_inline unsigned int
> ++constant_time_is_zero(unsigned int a)
> ++{
> ++      return constant_time_msb(~a & (a - 1));
> ++}
> ++
> ++static constant_inline size_t
> ++constant_time_is_zero_s(size_t a)
> ++{
> ++      return constant_time_msb_s(~a & (a - 1));
> ++}
> ++
> ++/* Comparison*/
> ++static constant_inline size_t
> ++constant_time_lt_s(size_t a, size_t b)
> ++{
> ++      return constant_time_msb_s(a ^ ((a ^ b) | ((a - b) ^ b)));
> ++}
> ++
> ++static constant_inline unsigned int
> ++constant_time_lt(unsigned int a, unsigned int b)
> ++{
> ++      return constant_time_msb(a ^ ((a ^ b) | ((a - b) ^ b)));
> ++}
> ++
> ++static constant_inline unsigned int
> ++constant_time_ge(unsigned int a, unsigned int b)
> ++{
> ++      return ~constant_time_lt(a, b);
> ++}
> ++
> ++/* Equality*/
> ++
> ++static constant_inline unsigned int
> ++constant_time_eq(unsigned int a, unsigned int b)
> ++{
> ++      return constant_time_is_zero(a ^ b);
> ++}
> ++
> ++static constant_inline size_t
> ++constant_time_eq_s(size_t a, size_t b)
> ++{
> ++      return constant_time_is_zero_s(a ^ b);
> ++}
> ++
> ++#endif /* CONSTANT_TIME_H */
> +diff --git a/src/libopensc/internal.h b/src/libopensc/internal.h
> +index 7531260c14..2a98f0e966 100644
> +--- a/src/libopensc/internal.h
> ++++ b/src/libopensc/internal.h
> +@@ -166,8 +166,8 @@ int _sc_card_add_xeddsa_alg(struct sc_ca
> +
> + int sc_pkcs1_strip_01_padding(struct sc_context *ctx, const u8 *in_dat,=
 size_t in_len,
> +               u8 *out_dat, size_t *out_len);
> +-int sc_pkcs1_strip_02_padding(struct sc_context *ctx, const u8 *data, s=
ize_t len,
> +-              u8 *out_dat, size_t *out_len);
> ++int sc_pkcs1_strip_02_padding_constant_time(sc_context_t *ctx, unsigned=
 int n, const u8 *data,
> ++              unsigned int data_len, u8 *out, unsigned int *out_len);
> + int sc_pkcs1_strip_digest_info_prefix(unsigned int *algorithm,
> +               const u8 *in_dat, size_t in_len, u8 *out_dat, size_t *out=
_len);
> +
> +diff --git a/src/libopensc/padding.c b/src/libopensc/padding.c
> +index ca47733a4e..ddb3061134 100644
> +--- a/src/libopensc/padding.c
> ++++ b/src/libopensc/padding.c
> +@@ -32,10 +32,13 @@
> + #include <string.h>
> + #include <stdlib.h>
> +
> ++#include "common/constant-time.h"
> + #include "internal.h"
> +
> + /* TODO doxygen comments */
> +
> ++#define SC_PKCS1_PADDING_MIN_SIZE 11
> ++
> + /*
> +  * Prefixes for pkcs-v1 signatures
> +  */
> +@@ -143,45 +146,82 @@ sc_pkcs1_strip_01_padding(struct sc_context *ctx, =
const u8 *in_dat, size_t in_le
> +       return SC_SUCCESS;
> + }
> +
> +-
> +-/* remove pkcs1 BT02 padding (adding BT02 padding is currently not
> +- * needed/implemented) */
> ++/* Remove pkcs1 BT02 padding (adding BT02 padding is currently not
> ++ * needed/implemented) in constant-time.
> ++ * Original source: https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2Fopenssl%2Fopenssl%2Fblob%2F9890cc42daff5e2d0c=
ad01ac4bf78c391f599a6e%2Fcrypto%2Frsa%2Frsa_pk1.c%23L171&data=3D05%7C02%7Cn=
ikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C638585474039208698%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sda=
ta=3Dri2Mtwz%2FavHG13ACpSdlI3ucHbNqOtofLco53NB%2B6KM%3D&reserved=3D0<https:=
//github.com/openssl/openssl/blob/9890cc42daff5e2d0cad01ac4bf78c391f599a6e/=
crypto/rsa/rsa_pk1.c#L171> */
> + int
> +-sc_pkcs1_strip_02_padding(sc_context_t *ctx, const u8 *data, size_t len=
, u8 *out, size_t *out_len)
> ++sc_pkcs1_strip_02_padding_constant_time(sc_context_t *ctx, unsigned int=
 n, const u8 *data, unsigned int data_len, u8 *out, unsigned int *out_len)
> + {
> +-      unsigned int    n =3D 0;
> +-
> ++      unsigned int i =3D 0;
> ++      u8 *msg, *msg_orig =3D NULL;
> ++      unsigned int good, found_zero_byte, mask;
> ++      unsigned int zero_index =3D 0, msg_index, mlen =3D -1, len =3D 0;
> +       LOG_FUNC_CALLED(ctx);
> +-      if (data =3D=3D NULL || len < 3)
> ++
> ++      if (data =3D=3D NULL || data_len <=3D 0 || data_len > n || n < SC=
_PKCS1_PADDING_MIN_SIZE)
> +               LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);
> +
> +-      /* skip leading zero byte */
> +-      if (*data =3D=3D 0) {
> +-              data++;
> +-              len--;
> ++      msg =3D msg_orig =3D calloc(n, sizeof(u8));
> ++      if (msg =3D=3D NULL)
> ++              LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);
> ++
> ++      /*
> ++       * We can not check length of input data straight away and still =
we need to read
> ++       * from input even when the input is not as long as needed to kee=
p the time constant.
> ++       * If data has wrong size, it is padded by zeroes from left and t=
he following checks
> ++       * do not pass.
> ++       */
> ++      len =3D data_len;
> ++      for (data +=3D len, msg +=3D n, i =3D 0; i < n; i++) {
> ++              mask =3D ~constant_time_is_zero(len);
> ++              len -=3D 1 & mask;
> ++              data -=3D 1 & mask;
> ++              *--msg =3D *data & mask;
> ++      }
> ++      // check first byte to be 0x00
> ++      good =3D constant_time_is_zero(msg[0]);
> ++      // check second byte to be 0x02
> ++      good &=3D constant_time_eq(msg[1], 2);
> ++
> ++      // find zero byte after random data in padding
> ++      found_zero_byte =3D 0;
> ++      for (i =3D 2; i < n; i++) {
> ++              unsigned int equals0 =3D constant_time_is_zero(msg[i]);
> ++              zero_index =3D constant_time_select(~found_zero_byte & eq=
uals0, i, zero_index);
> ++              found_zero_byte |=3D equals0;
> +       }
> +-      if (data[0] !=3D 0x02)
> +-              LOG_FUNC_RETURN(ctx, SC_ERROR_WRONG_PADDING);
> +-      /* skip over padding bytes */
> +-      for (n =3D 1; n < len && data[n]; n++)
> +-              ;
> +-      /* Must be at least 8 pad bytes */
> +-      if (n >=3D len || n < 9)
> +-              LOG_FUNC_RETURN(ctx, SC_ERROR_WRONG_PADDING);
> +-      n++;
> +-      if (out =3D=3D NULL)
> +-              /* just check the padding */
> +-              LOG_FUNC_RETURN(ctx, SC_SUCCESS);
> +
> +-      /* Now move decrypted contents to head of buffer */
> +-      if (*out_len < len - n)
> +-              LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);
> +-      *out_len =3D len - n;
> +-      memmove(out, data + n, *out_len);
> ++      // zero_index stands for index of last found zero
> ++      good &=3D constant_time_ge(zero_index, 2 + 8);
> ++
> ++      // start of the actual message in data
> ++      msg_index =3D zero_index + 1;
> ++
> ++      // length of message
> ++      mlen =3D data_len - msg_index;
> ++
> ++      // check that message fits into out buffer
> ++      good &=3D constant_time_ge(*out_len, mlen);
> ++
> ++      // move the result in-place by |num|-SC_PKCS1_PADDING_MIN_SIZE-|m=
len| bytes to the left.
> ++      *out_len =3D constant_time_select(constant_time_lt(n - SC_PKCS1_P=
ADDING_MIN_SIZE, *out_len),
> ++                      n - SC_PKCS1_PADDING_MIN_SIZE, *out_len);
> ++      for (msg_index =3D 1; msg_index < n - SC_PKCS1_PADDING_MIN_SIZE; =
msg_index <<=3D 1) {
> ++              mask =3D ~constant_time_eq(msg_index & (n - SC_PKCS1_PADD=
ING_MIN_SIZE - mlen), 0);
> ++              for (i =3D SC_PKCS1_PADDING_MIN_SIZE; i < n - msg_index; =
i++)
> ++                      msg[i] =3D constant_time_select_8(mask, msg[i + m=
sg_index], msg[i]);
> ++      }
> ++      // move message into out buffer, if good
> ++      for (i =3D 0; i < *out_len; i++) {
> ++              unsigned int msg_index;
> ++              // when out is longer than message in data, use some bogu=
s index in msg
> ++              mask =3D good & constant_time_lt(i, mlen);
> ++              msg_index =3D constant_time_select(mask, i + SC_PKCS1_PAD=
DING_MIN_SIZE, 0); // to now overflow msg buffer
> ++              out[i] =3D constant_time_select_8(mask, msg[msg_index], o=
ut[i]);
> ++      }
> +
> +-      sc_log(ctx, "stripped output(%"SC_FORMAT_LEN_SIZE_T"u): %s", len =
- n,
> +-             sc_dump_hex(out, len - n));
> +-      LOG_FUNC_RETURN(ctx, len - n);
> ++      free(msg_orig);
> ++      return constant_time_select(good, mlen, SC_ERROR_WRONG_PADDING);
> + }
> +
> + /* add/remove DigestInfo prefix */
> +diff --git a/src/libopensc/pkcs15-sec.c b/src/libopensc/pkcs15-sec.c
> +index 2ac6ca7ddf..a019af460f 100644
> +--- a/src/libopensc/pkcs15-sec.c
> ++++ b/src/libopensc/pkcs15-sec.c
> +@@ -308,8 +308,9 @@ int sc_pkcs15_decipher(struct sc_pkcs15_
> +
> +       /* Strip any padding */
> +       if (pad_flags & SC_ALGORITHM_RSA_PAD_PKCS1) {
> +-              size_t s =3D r;
> +-              r =3D sc_pkcs1_strip_02_padding(ctx, out, s, out, &s);
> ++              int s =3D r;
> ++              int key_size =3D alg_info->key_length;
> ++              r =3D sc_pkcs1_strip_02_padding_constant_time(ctx, key_si=
ze / 8, out, s, out, &s);
> +               LOG_TEST_RET(ctx, r, "Invalid PKCS#1 padding");
> +       }
> +
> +diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.c
> +index 3391994abe..5248d9758a 100644
> +--- a/src/minidriver/minidriver.c
> ++++ b/src/minidriver/minidriver.c
> +@@ -4582,9 +4582,9 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
> +                                         "sc_pkcs15_decipher: DECRYPT-IN=
FO dwVersion=3D%lu\n",
> +                                         (unsigned long)pInfo->dwVersion=
);
> +                               if (pInfo->dwPaddingType =3D=3D CARD_PADD=
ING_PKCS1)   {
> +-                                      size_t temp =3D pInfo->cbData;
> ++                                      unsigned int temp =3D pInfo->cbDa=
ta;
> +                                       logprintf(pCardData, 2, "sc_pkcs1=
5_decipher: stripping PKCS1 padding\n");
> +-                                      r =3D sc_pkcs1_strip_02_padding(v=
s->ctx, pbuf2, pInfo->cbData, pbuf2, &temp);
> ++                                      r =3D sc_pkcs1_strip_02_padding_c=
onstant_time(vs->ctx, prkey_info->modulus_length / 8, pbuf2, pInfo->cbData,=
 pbuf2, &temp);
> +                                       pInfo->cbData =3D (DWORD) temp;
> +                                       if (r < 0)   {
> +                                               logprintf(pCardData, 2, "=
Cannot strip PKCS1 padding: %i\n", r);
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patch =
b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patch
> new file mode 100644
> index 000000000..1d8bc1259
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patch
> @@ -0,0 +1,39 @@
> +From 1a6a18c51a1d6239850b61d19aed6424afd4912f Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanuli=
k@redhat.com>
> +Date: Thu, 16 Nov 2023 10:38:12 +0100
> +Subject: [PATCH] pkcs15-sec: Remove logging after PKCS#1 v1.5 depadding
> +
> +To prevent Marvin attack on RSA PKCS#1 v1.5 padding
> +when logging the return value, signaling the padding error.
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits=
%2F1a6a18c51a1d6239850b61d19aed6424afd4912f&data=3D05%7C02%7Cnikhil.r%40kpi=
t.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C638585474039211871%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3D85lGNhd1=
ZVO%2BryUZRPhW%2FOZou8jP6r6Zm8TeDi%2FRgCI%3D&reserved=3D0<https://github.co=
m/OpenSC/OpenSC/pull/2948/commits/1a6a18c51a1d6239850b61d19aed6424afd4912f>=
]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +Comment: Refreshed hunk to match latest kirkstone
> +---
> + src/libopensc/pkcs15-sec.c | 9 +++++----
> + 1 file changed, 5 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/libopensc/pkcs15-sec.c b/src/libopensc/pkcs15-sec.c
> +index a019af460f..f7ee819d65 100644
> +--- a/src/libopensc/pkcs15-sec.c
> ++++ b/src/libopensc/pkcs15-sec.c
> +@@ -308,13 +308,14 @@ int sc_pkcs15_decipher(struct sc_pkcs15_
> +
> +       /* Strip any padding */
> +       if (pad_flags & SC_ALGORITHM_RSA_PAD_PKCS1) {
> +-              int s =3D r;
> +-              int key_size =3D alg_info->key_length;
> ++              unsigned int s =3D r;
> ++              unsigned int key_size =3D (unsigned int)alg_info->key_len=
gth;
> +               r =3D sc_pkcs1_strip_02_padding_constant_time(ctx, key_si=
ze / 8, out, s, out, &s);
> +-              LOG_TEST_RET(ctx, r, "Invalid PKCS#1 padding");
> ++              /* for keeping PKCS#1 v1.5 depadding constant-time, do no=
t log error here */
> +       }
> +
> +-      LOG_FUNC_RETURN(ctx, r);
> ++      /* do not log error code to prevent side channel attack */
> ++      return r;
> + }
> +
> + /* derive one key from another. RSA can use decipher, so this is for on=
ly ECDH
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patch =
b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patch
> new file mode 100644
> index 000000000..d3846e5da
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patch
> @@ -0,0 +1,105 @@
> +From a8ac5930ab8f2da5cb93793d05389761c342f995 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanuli=
k@redhat.com>
> +Date: Thu, 16 Nov 2023 15:49:15 +0100
> +Subject: [PATCH] framework-pkcs15.c: Handle PKCS#1 v1.5 depadding
> + constant-time
> +
> +In order to not disclose time side-channel when the depadding
> +fails, do the same operations as for case when depadding ends
> +with success.
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits=
%2Fa8ac5930ab8f2da5cb93793d05389761c342f995&data=3D05%7C02%7Cnikhil.r%40kpi=
t.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C638585474039215146%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3Dx206N6Zb=
8coR7iTMmKuZRhlAlymSDrm83Py%2FtzaKWq8%3D&reserved=3D0<https://github.com/Op=
enSC/OpenSC/pull/2948/commits/a8ac5930ab8f2da5cb93793d05389761c342f995>]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +Comment: Refreshed hunks to match latest kirkstone
> +---
> + src/pkcs11/framework-pkcs15.c | 54 ++++++++++++++++++++++++++---------
> + 1 file changed, 41 insertions(+), 13 deletions(-)
> +
> +diff --git a/src/pkcs11/framework-pkcs15.c b/src/pkcs11/framework-pkcs15=
.c
> +index f75a3dbaec..632681df63 100644
> +--- a/src/pkcs11/framework-pkcs15.c
> ++++ b/src/pkcs11/framework-pkcs15.c
> +@@ -18,6 +18,7 @@
> +  * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307=
  USA
> +  */
> +
> ++#include "common/constant-time.h"
> + #include "config.h"
> + #include <stdlib.h>
> + #include <string.h>
> +@@ -4341,7 +4342,8 @@
> +       struct pkcs15_fw_data *fw_data =3D NULL;
> +       struct pkcs15_prkey_object *prkey;
> +       unsigned char decrypted[512]; /* FIXME: Will not work for keys ab=
ove 4096 bits */
> +-      int     buff_too_small, rv, flags =3D 0, prkey_has_path =3D 0;
> ++      int rv, flags =3D 0, prkey_has_path =3D 0;
> ++      CK_ULONG mask, good, rv_pkcs11;
> +
> +       sc_log(context, "Initiating decryption.");
> +
> +@@ -4415,27 +4417,53 @@
> +       rv =3D sc_pkcs15_decipher(fw_data->p15_card, prkey->prv_p15obj, f=
lags,
> +                       pEncryptedData, ulEncryptedDataLen, decrypted, si=
zeof(decrypted));
> +
> +-      if (rv < 0 && !sc_pkcs11_conf.lock_login && !prkey_has_path)
> ++      /* skip for PKCS#1 v1.5 padding prevent side channel attack */
> ++      if (!(flags & SC_ALGORITHM_RSA_PAD_PKCS1) &&
> ++                      rv < 0 && !sc_pkcs11_conf.lock_login && !prkey_ha=
s_path)
> +               if (reselect_app_df(fw_data->p15_card) =3D=3D SC_SUCCESS)
> +                       rv =3D sc_pkcs15_decipher(fw_data->p15_card, prke=
y->prv_p15obj, flags,
> +                                       pEncryptedData, ulEncryptedDataLe=
n, decrypted, sizeof(decrypted));
> +
> +       sc_unlock(p11card->card);
> +
> +-      sc_log(context, "Decryption complete. Result %d.", rv);
> ++      sc_log(context, "Decryption complete.");
> +
> +-      if (rv < 0)
> +-              return sc_to_cryptoki_error(rv, "C_Decrypt");
> ++      /* Handle following code in constant-time
> ++       * to prevent Marvin attack for PKCS#1 v1.5 padding. */
> +
> +-      buff_too_small =3D (*pulDataLen < (CK_ULONG)rv);
> +-      *pulDataLen =3D rv;
> +-      if (pData =3D=3D NULL_PTR)
> +-              return CKR_OK;
> +-      if (buff_too_small)
> +-              return CKR_BUFFER_TOO_SMALL;
> +-      memcpy(pData, decrypted, *pulDataLen);
> ++      /* only padding error must be handled in constant-time way,
> ++       * other error can be returned straight away */
> ++      if ((~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING) & constant_t=
ime_lt_s(sizeof(decrypted), rv)))
> ++              return sc_to_cryptoki_error(rv, "C_Decrypt");
> +
> +-      return CKR_OK;
> ++      /* check rv for padding error */
> ++      good =3D ~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING);
> ++      rv_pkcs11 =3D sc_to_cryptoki_error(SC_ERROR_WRONG_PADDING, "C_Dec=
rypt");
> ++      rv_pkcs11 =3D constant_time_select_s(good, CKR_OK, rv_pkcs11);
> ++
> ++      if (pData =3D=3D NULL_PTR) {
> ++              /* set length only if no error */
> ++              *pulDataLen =3D constant_time_select_s(good, rv, *pulData=
Len);
> ++              /* return error only if original rv < 0 */
> ++              return rv_pkcs11;
> ++      }
> ++
> ++      /* check whether *pulDataLen < rv and set return value for small =
output buffer */
> ++      mask =3D good & constant_time_lt_s(*pulDataLen, rv);
> ++      rv_pkcs11 =3D constant_time_select_s(mask, CKR_BUFFER_TOO_SMALL, =
rv_pkcs11);
> ++      good &=3D ~mask;
> ++
> ++      /* move everything from decrypted into out buffer constant-time, =
if rv is ok */
> ++      for (CK_ULONG i =3D 0; i < *pulDataLen; i++) { /* iterate over wh=
ole pData to not disclose real depadded length */
> ++              CK_ULONG msg_index;
> ++              mask =3D good & constant_time_lt_s(i, sizeof(decrypted));=
             /* i should be in the bounds of decrypted */
> ++              mask &=3D constant_time_lt_s(i, constant_time_select_s(go=
od, rv, 0)); /* check that is in bounds of depadded message */
> ++              msg_index =3D constant_time_select_s(mask, i, 0);
> ++              pData[i] =3D constant_time_select_8(mask, decrypted[msg_i=
ndex], pData[i]);
> ++      }
> ++      *pulDataLen =3D constant_time_select_s(good, rv, *pulDataLen);
> ++      /* do not log error code to prevent side channel attack */
> ++      return rv_pkcs11;
> + }
> +
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patch =
b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patch
> new file mode 100644
> index 000000000..e113df7c4
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patch
> @@ -0,0 +1,47 @@
> +From 32cdab44f6b1e6343f029879a8ab32de4f32743f Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanuli=
k@redhat.com>
> +Date: Mon, 8 Jan 2024 14:59:22 +0100
> +Subject: [PATCH] mechanism: Handle PKCS#1 v1.5 depadding constant-time
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits=
%2F32cdab44f6b1e6343f029879a8ab32de4f32743f&data=3D05%7C02%7Cnikhil.r%40kpi=
t.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C638585474039218933%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DwlIwj01U=
WFsUnKMzR9qAW0hHzK7kSjAygzZQatz%2BG8A%3D&reserved=3D0<https://github.com/Op=
enSC/OpenSC/pull/2948/commits/32cdab44f6b1e6343f029879a8ab32de4f32743f>]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +Comment: 1 hunk removed and refreshed hunks to match latest kirkstone
> +---
> + src/pkcs11/mechanism.c | 19 ++++++++++++++-----
> + 1 file changed, 14 insertions(+), 5 deletions(-)
> +
> +diff --git a/src/pkcs11/mechanism.c b/src/pkcs11/mechanism.c
> +index 03495265a4..d3f0434231 100644
> +--- a/src/pkcs11/mechanism.c
> ++++ b/src/pkcs11/mechanism.c
> +@@ -23,6 +23,7 @@
> + #include <stdlib.h>
> + #include <string.h>
> +
> ++#include "common/constant-time.h"
> + #include "sc-pkcs11.h"
> +
> + /* Also used for verification data */
> +@@ -844,7 +845,9 @@ sc_pkcs11_decr(struct sc_pkcs11_session
> +       rv =3D op->type->decrypt(op, pEncryptedData, ulEncryptedDataLen,
> +                              pData, pulDataLen);
> +
> +-      if (rv !=3D CKR_BUFFER_TOO_SMALL && pData !=3D NULL)
> ++      /* terminate session for any return value except CKR_BUFFER_TOO_S=
MALL,
> ++       * perform check in time side-channel free way to prevent Marvin =
attack */
> ++      if (!constant_time_eq_s(rv, CKR_BUFFER_TOO_SMALL) && pData !=3D N=
ULL)
> +               session_stop_operation(session, SC_PKCS11_OPERATION_DECRY=
PT);
> +
> +       return rv;
> +@@ -1107,6 +1107,10 @@ sc_pkcs11_decrypt(sc_pkcs11_operation_t
> +       if (pulDataLen)
> +               *pulDataLen =3D ulDataLen;
> +
> ++      /* Skip DecryptFinalize for PKCS#1 v1.5 padding to prevent time s=
ide-channel leakage */
> ++      if (((CK_MECHANISM_PTR)&operation->mechanism)->mechanism =3D=3D C=
KM_RSA_PKCS)
> ++              return rv;
> ++
> +       if (rv !=3D CKR_OK)
> +               return rv;
> +
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patch =
b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patch
> new file mode 100644
> index 000000000..7bb862194
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patch
> @@ -0,0 +1,115 @@
> +From 1fe1a78610b00b9db83a03396762c72c1371bd02 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanuli=
k@redhat.com>
> +Date: Wed, 22 Nov 2023 15:02:57 +0100
> +Subject: [PATCH] minidriver: Make CardRSADecrypt constant-time
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits=
%2F1fe1a78610b00b9db83a03396762c72c1371bd02&data=3D05%7C02%7Cnikhil.r%40kpi=
t.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C638585474039222236%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3D45wf78tN=
tkWO15anb%2FntZ%2BKbbZaqLE3aKnfLhVot0bI%3D&reserved=3D0<https://github.com/=
OpenSC/OpenSC/pull/2948/commits/1fe1a78610b00b9db83a03396762c72c1371bd02>]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +Comment: Refreshed hunks to match latest kirkstone
> +---
> + src/minidriver/minidriver.c | 37 +++++++++++++++++++++++--------------
> + 1 file changed, 23 insertions(+), 14 deletions(-)
> +
> +diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.c
> +index 5248d9758a..b99b6cff89 100644
> +--- a/src/minidriver/minidriver.c
> ++++ b/src/minidriver/minidriver.c
> +@@ -41,6 +41,7 @@
> + #include "cardmod.h"
> +
> + #include "common/compat_strlcpy.h"
> ++#include "common/constant-time.h"
> + #include "libopensc/asn1.h"
> + #include "libopensc/cardctl.h"
> + #include "libopensc/opensc.h"
> +@@ -4463,13 +4464,15 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
> +
> + {
> +       DWORD dwret;
> +-      int r, opt_crypt_flags =3D 0;
> ++      int r, opt_crypt_flags =3D 0, good =3D 0;
> +       unsigned ui;
> +       VENDOR_SPECIFIC *vs;
> +       struct sc_pkcs15_prkey_info *prkey_info;
> +       BYTE *pbuf =3D NULL, *pbuf2 =3D NULL;
> +       struct sc_pkcs15_object *pkey =3D NULL;
> +       struct sc_algorithm_info *alg_info =3D NULL;
> ++      unsigned int wrong_padding =3D 0;
> ++      unsigned int pbufLen =3D 0;
> +
> +       MD_FUNC_CALLED(pCardData, 1);
> +
> +@@ -4570,11 +4573,11 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
> +               goto err;
> +       }
> +
> ++      pbufLen =3D pInfo->cbData;
> +       if (alg_info->flags & SC_ALGORITHM_RSA_RAW)   {
> +               logprintf(pCardData, 2, "sc_pkcs15_decipher: using RSA-RA=
W mechanism\n");
> +               r =3D sc_pkcs15_decipher(vs->p15card, pkey, opt_crypt_fla=
gs, pbuf, pInfo->cbData, pbuf2, pInfo->cbData);
> +-              logprintf(pCardData, 2, "sc_pkcs15_decipher returned %d\n=
", r);
> +-
> ++              /* do not log return value to not leak it */
> +               if (r > 0) {
> +                       /* Need to handle padding */
> +                       if (pInfo->dwVersion >=3D CARD_RSA_KEY_DECRYPT_IN=
FO_VERSION_TWO) {
> +@@ -4586,13 +4589,9 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
> +                                       logprintf(pCardData, 2, "sc_pkcs1=
5_decipher: stripping PKCS1 padding\n");
> +                                       r =3D sc_pkcs1_strip_02_padding_c=
onstant_time(vs->ctx, prkey_info->modulus_length / 8, pbuf2, pInfo->cbData,=
 pbuf2, &temp);
> +                                       pInfo->cbData =3D (DWORD) temp;
> +-                                      if (r < 0)   {
> +-                                              logprintf(pCardData, 2, "=
Cannot strip PKCS1 padding: %i\n", r);
> +-                                              pCardData->pfnCspFree(pbu=
f);
> +-                                              pCardData->pfnCspFree(pbu=
f2);
> +-                                              dwret =3D SCARD_F_INTERNA=
L_ERROR;
> +-                                              goto err;
> +-                                      }
> ++                                      wrong_padding =3D constant_time_e=
q_s(r, SC_ERROR_WRONG_PADDING);
> ++                                      /* continue without returning err=
or to not leak that padding is wrong
> ++                                         to prevent time side-channel l=
eak for Marvin attack*/
> +                               }
> +                               else if (pInfo->dwPaddingType =3D=3D CARD=
_PADDING_OAEP)   {
> +                                       /* TODO: Handle OAEP padding if p=
resent - can call PFN_CSP_UNPAD_DATA */
> +@@ -4640,28 +4639,38 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D
> +               goto err;
> +       }
> +
> +-      if ( r < 0)   {
> ++      good =3D constant_time_eq_s(r, 0);
> ++      /* if no error or padding error, do not return here to prevent Ma=
rvin attack */
> ++      if (!(good | wrong_padding) && r < 0)   {
> +               logprintf(pCardData, 2, "sc_pkcs15_decipher error(%i): %s=
\n", r, sc_strerror(r));
> +               pCardData->pfnCspFree(pbuf);
> +               pCardData->pfnCspFree(pbuf2);
> +               dwret =3D md_translate_OpenSC_to_Windows_error(r, SCARD_E=
_INVALID_VALUE);
> +               goto err;
> +       }
> ++      dwret =3D constant_time_select_s(good, SCARD_S_SUCCESS, SCARD_F_I=
NTERNAL_ERROR);
> +
> +       logprintf(pCardData, 2, "decrypted data(%lu):\n",
> +                 (unsigned long)pInfo->cbData);
> +       loghex(pCardData, 7, pbuf2, pInfo->cbData);
> +
> +       /*inversion donnees */
> +-      for(ui =3D 0; ui < pInfo->cbData; ui++)
> +-              pInfo->pbData[ui] =3D pbuf2[pInfo->cbData-ui-1];
> ++      /* copy data in constant-time way to prevent leak */
> ++      for (ui =3D 0; ui < pbufLen; ui++) {
> ++              unsigned int mask, msg_index, inv_ui;
> ++              mask =3D good & constant_time_lt_s(ui, pInfo->cbData); /*=
 ui should be in the bounds of pbuf2 */
> ++              inv_ui =3D pInfo->cbData - ui - 1;
> ++              msg_index =3D constant_time_select_s(mask, inv_ui, 0);
> ++              pInfo->pbData[ui] =3D constant_time_select_8(mask, pbuf2[=
msg_index], pInfo->pbData[ui]);
> ++      }
> +
> +       pCardData->pfnCspFree(pbuf);
> +       pCardData->pfnCspFree(pbuf2);
> +
> + err:
> +       unlock(pCardData);
> +-      MD_FUNC_RETURN(pCardData, 1, dwret);
> ++      /* do not log return value to not leak it */
> ++      return dwret;
> + }
> +
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patch =
b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patch
> new file mode 100644
> index 000000000..5deeacc25
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patch
> @@ -0,0 +1,47 @@
> +From 306dc92bd4d2d74203f53cf3d9ea68c223115375 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanuli=
k@redhat.com>
> +Date: Fri, 24 Nov 2023 20:59:07 +0100
> +Subject: [PATCH] pkcs11-object: Remove return value logging
> +
> +To prevent Marvin attack on RSA PKCS#1 v1.5 padding
> +when logging the return value, signaling the padding error.
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits=
%2F306dc92bd4d2d74203f53cf3d9ea68c223115375&data=3D05%7C02%7Cnikhil.r%40kpi=
t.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C638585474039225383%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DWw6twdIV=
hAGYFgLBGs0hZp2udnjM2hXy4hl9mzFGEy0%3D&reserved=3D0<https://github.com/Open=
SC/OpenSC/pull/2948/commits/306dc92bd4d2d74203f53cf3d9ea68c223115375>]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +Comment: Two hunks removed from pkcs11-object.c and refreshed sc-pkcs11.=
h
> +---
> + src/pkcs11/pkcs11-object.c | 9 ++++++---
> + src/pkcs11/sc-pkcs11.h     | 5 +++++
> + 2 files changed, 11 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/pkcs11/pkcs11-object.c b/src/pkcs11/pkcs11-object.c
> +index f04c0b4c56..b023911213 100644
> +--- a/src/pkcs11/pkcs11-object.c
> ++++ b/src/pkcs11/pkcs11-object.c
> +@@ -930,7 +930,8 @@ CK_RV C_Decrypt(CK_SESSION_HANDLE hSessi
> +               rv =3D reset_login_state(session->slot, rv);
> +       }
> +
> +-      sc_log(context, "C_Decrypt() =3D %s", lookup_enum ( RV_T, rv ));
> ++      /* do not log error code to prevent side channel attack */
> ++      SC_LOG("C_Decrypt()");
> +       sc_pkcs11_unlock();
> +       return rv;
> + }
> +diff --git a/src/pkcs11/sc-pkcs11.h b/src/pkcs11/sc-pkcs11.h
> +index 66dfcdde67..510017ed2a 100644
> +--- a/src/pkcs11/sc-pkcs11.h
> ++++ b/src/pkcs11/sc-pkcs11.h
> +@@ -226,6 +226,11 @@
> + };
> + typedef struct sc_pkcs11_slot sc_pkcs11_slot_t;
> +
> ++#define SC_LOG(fmt) \
> ++      do { \
> ++              sc_log(context, (fmt)); \
> ++      } while (0)
> ++
> + /* Debug virtual slots. S is slot to be highlighted or NULL
> +  * C is a comment format string and args It will be preceded by "VSS " =
*/
> + #define DEBUG_VSS(S, ...) do { sc_log(context,"VSS " __VA_ARGS__); _deb=
ug_virtual_slots(S); } while (0)
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patch =
b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patch
> new file mode 100644
> index 000000000..7b41abc0e
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patch
> @@ -0,0 +1,33 @@
> +From aa6bf2b65fe432e8f234a132268b79ea54d5d74b Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanuli=
k@redhat.com>
> +Date: Fri, 24 Nov 2023 21:00:23 +0100
> +Subject: [PATCH] misc: Compare return value constant-time
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits=
%2Faa6bf2b65fe432e8f234a132268b79ea54d5d74b&data=3D05%7C02%7Cnikhil.r%40kpi=
t.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C638585474039228489%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DFuhfgrvC=
6wIKW%2F8FyZLmFAPVx3AC0%2F4JC%2FJQvNu4hWs%3D&reserved=3D0<https://github.co=
m/OpenSC/OpenSC/pull/2948/commits/aa6bf2b65fe432e8f234a132268b79ea54d5d74b>=
]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +---
> + src/pkcs11/misc.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/pkcs11/misc.c b/src/pkcs11/misc.c
> +index 5ca1176b1d..1d893d6181 100644
> +--- a/src/pkcs11/misc.c
> ++++ b/src/pkcs11/misc.c
> +@@ -23,6 +23,7 @@
> + #include <stdlib.h>
> + #include <string.h>
> +
> ++#include "common/constant-time.h"
> + #include "sc-pkcs11.h"
> +
> + #define DUMP_TEMPLATE_MAX     32
> +@@ -174,7 +175,7 @@ CK_RV reset_login_state(struct sc_pkcs11_slot *slot,=
 CK_RV rv)
> +                       slot->p11card->framework->logout(slot);
> +               }
> +
> +-              if (rv =3D=3D CKR_USER_NOT_LOGGED_IN) {
> ++              if (constant_time_eq_s(rv, CKR_USER_NOT_LOGGED_IN)) {
> +                       slot->login_user =3D -1;
> +                       pop_all_login_states(slot);
> +               }
> diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patch =
b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patch
> new file mode 100644
> index 000000000..3ad681ecb
> --- /dev/null
> +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patch
> @@ -0,0 +1,71 @@
> +From fd80ba7c00bb87f52a63f628509955ccee5b09e4 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D <vhanuli=
k@redhat.com>
> +Date: Mon, 5 Feb 2024 13:33:05 +0100
> +Subject: [PATCH] Fix constant-time comparison of negative values
> +
> +Thanks Coverity CID 414687
> +
> +CVE: CVE-2023-5992
> +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2FOpenSC%2Fpull%2F3016%2Fcommits=
%2Ffd80ba7c00bb87f52a63f628509955ccee5b09e4&data=3D05%7C02%7Cnikhil.r%40kpi=
t.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C638585474039232655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DJRq1GCbj=
G37VCUIyggF%2FUtBtUYYmuw2Iun8lOnIxFj4%3D&reserved=3D0<https://github.com/Op=
enSC/OpenSC/pull/3016/commits/fd80ba7c00bb87f52a63f628509955ccee5b09e4>]
> +Signed-off-by: nikhil r <nikhil.r@kpit.com>
> +---
> + src/common/constant-time.h    | 6 ++++++
> + src/minidriver/minidriver.c   | 4 ++--
> + src/pkcs11/framework-pkcs15.c | 4 ++--
> + 3 files changed, 10 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/common/constant-time.h b/src/common/constant-time.h
> +index 40c3e500c2..3f4446d4d8 100644
> +--- a/src/common/constant-time.h
> ++++ b/src/common/constant-time.h
> +@@ -125,4 +125,10 @@ constant_time_eq_s(size_t a, size_t b)
> +       return constant_time_is_zero_s(a ^ b);
> + }
> +
> ++static constant_inline unsigned int
> ++constant_time_eq_i(int a, int b)
> ++{
> ++      return constant_time_eq((unsigned int)a, (unsigned int)b);
> ++}
> ++
> + #endif /* CONSTANT_TIME_H */
> +diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.c
> +index a3c738966b..d146b42549 100644
> +--- a/src/minidriver/minidriver.c
> ++++ b/src/minidriver/minidriver.c
> +@@ -4660,7 +4660,7 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA pCardD=
ata,
> +                                       logprintf(pCardData, 2, "sc_pkcs1=
5_decipher: stripping PKCS1 padding\n");
> +                                       r =3D sc_pkcs1_strip_02_padding_c=
onstant_time(vs->ctx, prkey_info->modulus_length / 8, pbuf2, pInfo->cbData,=
 pbuf2, &temp);
> +                                       pInfo->cbData =3D (DWORD) temp;
> +-                                      wrong_padding =3D constant_time_e=
q_s(r, SC_ERROR_WRONG_PADDING);
> ++                                      wrong_padding =3D constant_time_e=
q_i(r, SC_ERROR_WRONG_PADDING);
> +                                       /* continue without returning err=
or to not leak that padding is wrong
> +                                          to prevent time side-channel l=
eak for Marvin attack*/
> +                               }
> +@@ -4710,7 +4710,7 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA pCardD=
ata,
> +               goto err;
> +       }
> +
> +-      good =3D constant_time_eq_s(r, 0);
> ++      good =3D constant_time_eq_i(r, 0);
> +       /* if no error or padding error, do not return here to prevent Ma=
rvin attack */
> +       if (!(good | wrong_padding) && r < 0)   {
> +               logprintf(pCardData, 2, "sc_pkcs15_decipher error(%i): %s=
\n", r, sc_strerror(r));
> +diff --git a/src/pkcs11/framework-pkcs15.c b/src/pkcs11/framework-pkcs15=
.c
> +index cb4df7a64f..11cfc51273 100644
> +--- a/src/pkcs11/framework-pkcs15.c
> ++++ b/src/pkcs11/framework-pkcs15.c
> +@@ -4627,11 +4627,11 @@ pkcs15_prkey_decrypt(struct sc_pkcs11_session *s=
ession, void *obj,
> +
> +       /* only padding error must be handled in constant-time way,
> +        * other error can be returned straight away */
> +-      if ((~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING) & constant_t=
ime_lt_s(sizeof(decrypted), rv)))
> ++      if ((~constant_time_eq_i(rv, SC_ERROR_WRONG_PADDING) & constant_t=
ime_lt_s(sizeof(decrypted), (size_t)rv)))
> +               return sc_to_cryptoki_error(rv, "C_Decrypt");
> +
> +       /* check rv for padding error */
> +-      good =3D ~constant_time_eq_s(rv, SC_ERROR_WRONG_PADDING);
> ++      good =3D ~constant_time_eq_i(rv, SC_ERROR_WRONG_PADDING);
> +       rv_pkcs11 =3D sc_to_cryptoki_error(SC_ERROR_WRONG_PADDING, "C_Dec=
rypt");
> +       rv_pkcs11 =3D constant_time_select_s(good, CKR_OK, rv_pkcs11);
> +
> diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/re=
cipes-support/opensc/opensc_0.22.0.bb
> index 770c2d686..16b3ec292 100644
> --- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
> +++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
> @@ -23,6 +23,15 @@ SRC_URI =3D "git://github.com/OpenSC/OpenSC;branch=3Dm=
aster;protocol=3Dhttps \
>              file://CVE-2023-40661-5.patch \
>              file://CVE-2023-40661-6.patch \
>              file://CVE-2023-40661-7.patch \
> +           file://CVE-2023-5992-1.patch \
> +           file://CVE-2023-5992-2.patch \
> +           file://CVE-2023-5992-3.patch \
> +           file://0001-Preparing-to-implement-the-C_DecryptFinalize-and-=
C_D.patch \
> +           file://CVE-2023-5992-4.patch \
> +           file://CVE-2023-5992-5.patch \
> +           file://CVE-2023-5992-6.patch \
> +           file://CVE-2023-5992-7.patch \
> +           file://CVE-2023-5992-8.patch \
>             "
>
>   # CVE-2021-34193 is a duplicate CVE covering the 5 individual
> --
> 2.25.1
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111517): https://apc01.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-devel%2Fm=
essage%2F111517&data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b=
08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63858547403923719=
3%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&sdata=3DDpmk904PdFG8SH3lmX5K6dRYq7VW05HT3gS2=
EiKyV6k%3D&reserved=3D0<https://lists.openembedded.org/g/openembedded-devel=
/message/111517>
> Mute This Topic: https://apc01.safelinks.protection.outlook.com/?url=3Dht=
tps%3A%2F%2Flists.openembedded.org%2Fmt%2F107747046%2F3616698&data=3D05%7C0=
2%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a=
26a242ff61502855c7%7C0%7C0%7C638585474039241914%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7=
C&sdata=3Da%2BwjwsdbfBw7ErUZ%2BpfPRc9JPohOt8bo2Jp8u9Pk%2F0U%3D&reserved=3D0=
<https://lists.openembedded.org/mt/107747046/3616698>
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%=
3A%2F%2Flists.openembedded.org%2Fg%2Fopenembedded-devel%2Funsub&data=3D05%7=
C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C638585474039245923%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C=
%7C&sdata=3DgolzqP%2B8HMS31xZjFqSIsboU4rf1nTAatBUBp3KaDT4%3D&reserved=3D0<h=
ttps://lists.openembedded.org/g/openembedded-devel/unsub> [akuster808@gmail=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MAZPR01MB8950C73EC4B4044CAD8863F0EEBF2MAZPR01MB8950INDP_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
It was a resend , some issue with my mail</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Sorry for the inconvenience&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Nikhil&nbsp;</div>
<div id=3D"Signature">
<div style=3D"background-color: rgb(255, 255, 255); margin: 0px;"></div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> akuster808 &lt;akuste=
r808@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, August 6, 2024 6:53 PM<br>
<b>To:</b> Nikhil R &lt;Nikhil.R@kpit.com&gt;; openembedded-devel@lists.ope=
nembedded.org &lt;openembedded-devel@lists.openembedded.org&gt;<br>
<b>Cc:</b> Ranjitsinh Rathod &lt;Ranjitsinh.Rathod@kpit.com&gt;<br>
<b>Subject:</b> Re: [oe][kirkstone][PATCH] opensc: Fix CVE CVE-2023-5992</f=
ont>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Caution: This email originated from outside of the=
 KPIT. Do not click links or open attachments unless you recognize the send=
er and know the content is safe.<br>
<br>
On 8/6/24 2:39 AM, Nikhil via lists.openembedded.org wrote:<br>
&gt; A vulnerability was found in OpenSC where PKCS#1<br>
&gt; encryption padding removal is not implemented as<br>
&gt; side-channel resistant. This issue may result in<br>
&gt; the potential leak of private data.<br>
&gt;<br>
&gt; Links: <a href=3D"https://github.com/OpenSC/OpenSC/pull/2948/commits">=
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits&amp;data=3D05%7C02%7Cnikhil.r=
%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff6150=
2855c7%7C0%7C0%7C638585474039172084%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=
=3Dv1zXWJdAQKH%2FBg8GgbnqZQvSs83bGwgOc6G9tlMMv0o%3D&amp;reserved=3D0</a><br=
>
&gt; <a href=3D"https://github.com/OpenSC/OpenSC/pull/3016">https://apc01.s=
afelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%2F=
OpenSC%2Fpull%2F3016&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80=
b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63858547=
4039184980%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB=
TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DJ5nHjZsiJbZmN3v7RfQ%2Fd=
esIPfDbVfKpcnUqVvws5d8%3D&amp;reserved=3D0</a><br>
&gt;<br>
&gt; Link: <a href=3D"https://github.com/xhanulik/OpenSC/commit/bb9bd627462=
af4d61943a33d6e54308e103618f0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fxhanulik%2FOpenSC%2Fcommit%2Fbb9bd627462af4d61943a33d6e54308e103618f0=
&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea=
5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039188910%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DDaRkHFwlHSpIEpXNSNSMxXaxXdzWGOqoMu0LqYCFdDM=
%3D&amp;reserved=3D0</a><br>
&gt; Add the above commit to fix the below error<br>
&gt; Error:<br>
&gt; | ../../../git/src/pkcs11/mechanism.c: In function 'sc_pkcs11_decrypt'=
:<br>
&gt; | ../../../git/src/pkcs11/mechanism.c:1093:24: error: 'rv' undeclared =
(first use in this function)<br>
<br>
Is this a v2 or just a resend?<br>
<br>
- armin<br>
&gt;<br>
&gt; The below commits were not added as they are part<br>
&gt; of unittests<br>
&gt; <a href=3D"https://github.com/OpenSC/OpenSC/pull/2948/commits/708ce24c=
6b9f92a9f39bb7accda601b2891304a3">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2FOpenSC%2FOpenSC%2Fpull%2F2948%2Fcommits%2F708ce24c6b9f92a9f39bb7accda=
601b2891304a3&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c1=
2b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039192=
325%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3D0vQBOHhjyIIqCfiCSq2zFEhTzAym7W=
sub3T1jHcUMWs%3D&amp;reserved=3D0</a><br>
&gt; <a href=3D"https://github.com/OpenSC/OpenSC/pull/3016/commits/7309b37e=
b82496e7324671283a39f9291be09830">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2FOpenSC%2FOpenSC%2Fpull%2F3016%2Fcommits%2F7309b37eb82496e7324671283a3=
9f9291be09830&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c1=
2b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039195=
778%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1=
haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DcXH3gbRXa87SGKXBjweq3O9dISPyKu=
jB6ha%2BIZno%2B6Q%3D&amp;reserved=3D0</a><br>
&gt;<br>
&gt; Signed-off-by: Nikhil R &lt;nikhil.r@kpit.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; ...lement-the-C_DecryptFinalize-and-C_D.patch | 110 ++++++=
<br>
&gt;&nbsp;&nbsp; .../opensc/opensc/CVE-2023-5992-1.patch&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | 357 ++++++++++++++++++<br>
&gt;&nbsp;&nbsp; .../opensc/opensc/CVE-2023-5992-2.patch&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; |&nbsp; 39 ++<br>
&gt;&nbsp;&nbsp; .../opensc/opensc/CVE-2023-5992-3.patch&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | 105 ++++++<br>
&gt;&nbsp;&nbsp; .../opensc/opensc/CVE-2023-5992-4.patch&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; |&nbsp; 47 +++<br>
&gt;&nbsp;&nbsp; .../opensc/opensc/CVE-2023-5992-5.patch&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | 115 ++++++<br>
&gt;&nbsp;&nbsp; .../opensc/opensc/CVE-2023-5992-6.patch&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; |&nbsp; 47 +++<br>
&gt;&nbsp;&nbsp; .../opensc/opensc/CVE-2023-5992-7.patch&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; |&nbsp; 33 ++<br>
&gt;&nbsp;&nbsp; .../opensc/opensc/CVE-2023-5992-8.patch&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; |&nbsp; 71 ++++<br>
&gt;&nbsp;&nbsp; .../recipes-support/opensc/opensc_0.22.0.bb&nbsp;&nbsp; |&=
nbsp;&nbsp; 9 +<br>
&gt;&nbsp;&nbsp; 10 files changed, 933 insertions(+)<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-oe/recipes-support/opensc/opensc/0=
001-Preparing-to-implement-the-C_DecryptFinalize-and-C_D.patch<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-oe/recipes-support/opensc/opensc/C=
VE-2023-5992-1.patch<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-oe/recipes-support/opensc/opensc/C=
VE-2023-5992-2.patch<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-oe/recipes-support/opensc/opensc/C=
VE-2023-5992-3.patch<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-oe/recipes-support/opensc/opensc/C=
VE-2023-5992-4.patch<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-oe/recipes-support/opensc/opensc/C=
VE-2023-5992-5.patch<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-oe/recipes-support/opensc/opensc/C=
VE-2023-5992-6.patch<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-oe/recipes-support/opensc/opensc/C=
VE-2023-5992-7.patch<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-oe/recipes-support/opensc/opensc/C=
VE-2023-5992-8.patch<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/0001-Preparing-to-i=
mplement-the-C_DecryptFinalize-and-C_D.patch b/meta-oe/recipes-support/open=
sc/opensc/0001-Preparing-to-implement-the-C_DecryptFinalize-and-C_D.patch<b=
r>
&gt; new file mode 100644<br>
&gt; index 000000000..619ab522e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/0001-Preparing-to-implemen=
t-the-C_DecryptFinalize-and-C_D.patch<br>
&gt; @@ -0,0 +1,110 @@<br>
&gt; +From bb9bd627462af4d61943a33d6e54308e103618f0 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Peter Popovec &lt;popovec.peter@gmail.com&gt;<br>
&gt; +Date: Mon, 20 Dec 2021 08:43:49 +0100<br>
&gt; +Subject: [PATCH] Preparing to implement the C_DecryptFinalize and<br>
&gt; + C_DecryptUpdate functions.<br>
&gt; +<br>
&gt; +The C_Decrypt() and pkcs15_prkey_decrypt() functions have been change=
d to<br>
&gt; +allow pkcs15_prkey_decrypt() to be called from C_DecryptInit(),<br>
&gt; +C_DecryptUpdate() and C_DecryptFinalize().<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/xhanulik/Ope=
nSC/commit/bb9bd627462af4d61943a33d6e54308e103618f0">https://apc01.safelink=
s.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Fxhanulik%2FOpenS=
C%2Fcommit%2Fbb9bd627462af4d61943a33d6e54308e103618f0&amp;data=3D05%7C02%7C=
nikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C638585474039199071%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&am=
p;sdata=3DchY%2FOcThfZawDLg0w6dI9NUdqQMzYiMdHzW7Hyf9%2Fcg%3D&amp;reserved=
=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;nikhil.r@kpit.com&gt;<br>
&gt; +Comment: Refreshed hunk to match latest kirkstone<br>
&gt; +---<br>
&gt; + src/pkcs11/framework-pkcs15.c | 15 +++++++++++++<br>
&gt; + src/pkcs11/mechanism.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 4=
2 ++++++++++++++++++++++++++++++-----<br>
&gt; + 2 files changed, 51 insertions(+), 6 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/pkcs11/framework-pkcs15.c b/src/pkcs11/framework-pkc=
s15.c<br>
&gt; +index 688cd84fdc..18f94271ed 100644<br>
&gt; +--- a/src/pkcs11/framework-pkcs15.c<br>
&gt; ++++ b/src/pkcs11/framework-pkcs15.c<br>
&gt; +@@ -4345,6 +4345,21 @@ pkcs15_prkey_decrypt(struct sc_pkcs11_se<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int rv, flags =3D 0, prkey_has_p=
ath =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CK_ULONG mask, good, rv_pkcs11;<=
br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pulDataLen =3D=3D NULL) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* This is call from the C_DecyptInit function */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; sc_log(context, &quot;C_DecryptInit...&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return CKR_OK;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pEncryptedData =3D=3D NULL &amp;&=
amp; ulEncryptedDataLen =3D=3D 0) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* This is call from the C_DecryptFinalize function */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; sc_log(context, &quot;C_DecryptFinalize...&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *pulDataLen =3D 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return CKR_OK;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* DecryptUpdate: we assume this code=
 is called only once per session, either<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * from the C_Decrypt function o=
r from an application using the C_DecryptUpdate call<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sc_log(context, &quot;Initiating=
 decryption.&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!p11card)<br>
&gt; +diff --git a/src/pkcs11/mechanism.c b/src/pkcs11/mechanism.c<br>
&gt; +index 3035e8a763..a81b58fea6 100644<br>
&gt; +--- a/src/pkcs11/mechanism.c<br>
&gt; ++++ b/src/pkcs11/mechanism.c<br>
&gt; +@@ -1072,9 +1072,11 @@ sc_pkcs11_decrypt_init(sc_pkcs11_operati<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LOG_FUNC_RE=
TURN(context, (int) rv);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; operation-&gt;priv_data =3D data=
;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return CKR_OK;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* The last parameter is NULL - this =
is call to INIT code in underlying functions */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return key-&gt;ops-&gt;decrypt(operat=
ion-&gt;session,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key, &amp;operat=
ion-&gt;mechanism, NULL, 0, NULL, NULL);<br>
&gt; + }<br>
&gt; +<br>
&gt; + static CK_RV<br>
&gt; +@@ -1084,14 +1086,42 @@ sc_pkcs11_decrypt(sc_pkcs11_operation_t<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct signature_data *data;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct sc_pkcs11_object *key;<br=
>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CK_RV rv;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CK_ULONG ulDataLen, ulLastDataLen;<br=
>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* PKCS#11: If pBuf is not NULL_PTR, =
then *pulBufLen must contain the size in bytes.. */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pData &amp;&amp; !pulDataLen)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return CKR_ARGUMENTS_BAD;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ulDataLen =3D pulDataLen ? *pulDataLe=
n : 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ulLastDataLen =3D ulDataLen;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data =3D (struct signature_data*=
) operation-&gt;priv_data;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key =3D data-&gt;key;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return key-&gt;ops-&gt;decrypt(operat=
ion-&gt;session,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; key, &amp;operation-&gt;mechanism,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pEncryptedData, ulEncryptedDataLen,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pData, pulDataLen);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Decrypt */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rv =3D key-&gt;ops-&gt;decrypt(operat=
ion-&gt;session, key, &amp;operation-&gt;mechanism,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pEncryptedData, =
ulEncryptedDataLen, pData, &amp;ulDataLen);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pulDataLen)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *pulDataLen =3D ulDataLen;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rv !=3D CKR_OK)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return rv;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* recalculate buffer space */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ulDataLen &lt;=3D ulLastDataLen)<=
br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ulLastDataLen -=3D ulDataLen;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ulLastDataLen =3D 0;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* DecryptFinalize */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rv =3D key-&gt;ops-&gt;decrypt(operat=
ion-&gt;session, key, &amp;operation-&gt;mechanism,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NULL, 0, pData +=
 ulDataLen, &amp;ulLastDataLen);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pulDataLen)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *pulDataLen =3D ulDataLen + ulLastDataLen;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rv;<br>
&gt; + }<br>
&gt; +<br>
&gt; + static CK_RV<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.pat=
ch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..8450ed010<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-1.patch<br>
&gt; @@ -0,0 +1,357 @@<br>
&gt; +From b9e1d344df1f850a9b15bce6294f72c1620d0b45 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D &lt;v=
hanulik@redhat.com&gt;<br>
&gt; +Date: Mon, 13 Nov 2023 13:54:54 +0100<br>
&gt; +Subject: [PATCH] Reimplement removing of PKCS#1 v1.5 padding to be ti=
me<br>
&gt; + constant<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenSC/OpenS=
C/pull/2948/commits/b9e1d344df1f850a9b15bce6294f72c1620d0b45">https://apc01=
.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%=
2FOpenSC%2Fpull%2F2948%2Fcommits%2Fb9e1d344df1f850a9b15bce6294f72c1620d0b45=
&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea=
5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039202218%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DiPX5r%2Fgij2FkmH7YiZyjjq3X4bmfg3b5M3swdYu1o=
Xc%3D&amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;nikhil.r@kpit.com&gt;<br>
&gt; +Comment: Refreshed hunks to match latest kirkstone<br>
&gt; +---<br>
&gt; + src/common/Makefile.am&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 6=
 +-<br>
&gt; + src/common/constant-time.h&nbsp; | 128 +++++++++++++++++++++++++++++=
+++++++<br>
&gt; + src/libopensc/internal.h&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 4 +-<br>
&gt; + src/libopensc/padding.c&nbsp;&nbsp;&nbsp;&nbsp; | 102 ++++++++++++++=
+++++---------<br>
&gt; + src/libopensc/pkcs15-sec.c&nbsp; |&nbsp;&nbsp; 5 +-<br>
&gt; + src/minidriver/minidriver.c |&nbsp;&nbsp; 4 +-<br>
&gt; + 6 files changed, 210 insertions(+), 39 deletions(-)<br>
&gt; + create mode 100644 src/common/constant-time.h<br>
&gt; +<br>
&gt; +diff --git a/src/common/Makefile.am b/src/common/Makefile.am<br>
&gt; +index 5153428dce..9ecbffe8fd 100644<br>
&gt; +--- a/src/common/Makefile.am<br>
&gt; ++++ b/src/common/Makefile.am<br>
&gt; +@@ -8,7 +8,8 @@ dist_noinst_DATA =3D \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LICENSE.compat_getopt compat_get=
opt.txt \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compat_getopt_main.c \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; README.compat_strlcpy compat_str=
lcpy.3<br>
&gt; +-noinst_HEADERS =3D compat_strlcat.h compat_strlcpy.h compat_strnlen.=
h compat_getpass.h compat_getopt.h simclist.h libpkcs11.h libscdl.h<br>
&gt; ++noinst_HEADERS =3D compat_strlcat.h compat_strlcpy.h compat_strnlen.=
h compat_getpass.h \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compat_getopt.h simclist.h libpkcs11.=
h libscdl.h constant-time.h<br>
&gt; +<br>
&gt; + AM_CPPFLAGS =3D -I$(top_srcdir)/src<br>
&gt; +<br>
&gt; +@@ -40,7 +41,8 @@ TIDY_FILES =3D \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compat_report_rangecheckfailure.=
c \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compat___iob_func.c \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; simclist.c simclist.h \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libpkcs11.c libscdl.c<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; libpkcs11.c libscdl.c \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; constant-time.h<br>
&gt; +<br>
&gt; + check-local:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -x &quot;$(CLANGTIDY)&quot;=
 ]; then clang-tidy -config=3D'' --checks=3D'$(TIDY_CHECKS)' -header-filter=
=3D.* $(addprefix $(srcdir)/,$(TIDY_FILES)) -- $(TIDY_FLAGS); fi<br>
&gt; +diff --git a/src/common/constant-time.h b/src/common/constant-time.h<=
br>
&gt; +new file mode 100644<br>
&gt; +index 0000000000..40c3e500c2<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/src/common/constant-time.h<br>
&gt; +@@ -0,0 +1,128 @@<br>
&gt; ++/* Original source: <a href=3D"https://github.com/openssl/openssl/bl=
ob/9890cc42daff5e2d0cad01ac4bf78c391f599a6e/include/internal/constant_time.=
h">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fopenssl%2Fopenssl%2Fblob%2F9890cc42daff5e2d0cad01ac4bf78c391f599a6e%2=
Finclude%2Finternal%2Fconstant_time.h&amp;data=3D05%7C02%7Cnikhil.r%40kpit.=
com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7=
C0%7C0%7C638585474039205497%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3D2ZUT7z=
6e6fmVbnWkr%2BeO4r8DNFdkIFasKGZC4XByAuY%3D&amp;reserved=3D0</a>
 */<br>
&gt; ++<br>
&gt; ++#ifndef CONSTANT_TIME_H<br>
&gt; ++#define CONSTANT_TIME_H<br>
&gt; ++<br>
&gt; ++#include &lt;stdlib.h&gt;<br>
&gt; ++#include &lt;string.h&gt;<br>
&gt; ++<br>
&gt; ++#if !defined(inline)<br>
&gt; ++#if defined(__STDC_VERSION__) &amp;&amp; __STDC_VERSION__ &gt;=3D 19=
9901L<br>
&gt; ++#define constant_inline inline<br>
&gt; ++#elif defined(__GNUC__) &amp;&amp; __GNUC__ &gt;=3D 2<br>
&gt; ++#elif defined(__GNUC__) &amp;&amp; __GNUC__ &gt;=3D 2<br>
&gt; ++#elif defined(_MSC_VER)<br>
&gt; ++#define constant_inline __inline<br>
&gt; ++#else<br>
&gt; ++#define constant_inline<br>
&gt; ++#endif<br>
&gt; ++#else&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 /* use what caller wants as inline&nbsp; may be from config.h */<br>
&gt; ++#define constant_inline inline /* inline */<br>
&gt; ++#endif<br>
&gt; ++<br>
&gt; ++/*-<br>
&gt; ++ * The boolean methods return a bitmask of all ones (0xff...f) for t=
rue<br>
&gt; ++ * and 0 for false. For example,<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (a &lt; b) {<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c =3D a;<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c =3D b;<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++ * can be written as<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int lt =3D constant_time_l=
t(a, b);<br>
&gt; ++ *&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c =3D constant_time_select(lt, a, b=
);<br>
&gt; ++ */<br>
&gt; ++<br>
&gt; ++static constant_inline unsigned int<br>
&gt; ++value_barrier(unsigned int a)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; volatile unsigned int r =3D a;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static constant_inline size_t<br>
&gt; ++value_barrier_s(size_t a)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; volatile size_t r =3D a;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/* MSB */<br>
&gt; ++static constant_inline size_t<br>
&gt; ++constant_time_msb_s(size_t a)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0 - (a &gt;&gt; (sizeof(a) * 8=
 - 1));<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static constant_inline unsigned int<br>
&gt; ++constant_time_msb(unsigned int a)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0 - (a &gt;&gt; (sizeof(a) * 8=
 - 1));<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/* Select */<br>
&gt; ++static constant_inline unsigned int<br>
&gt; ++constant_time_select(unsigned int mask, unsigned int a, unsigned int=
 b)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (value_barrier(mask) &amp; a) =
| (value_barrier(~mask) &amp; b);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static constant_inline unsigned char<br>
&gt; ++constant_time_select_8(unsigned char mask, unsigned char a, unsigned=
 char b)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (unsigned char)constant_time_s=
elect(mask, a, b);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static constant_inline size_t<br>
&gt; ++constant_time_select_s(size_t mask, size_t a, size_t b)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return (value_barrier_s(mask) &amp; a=
) | (value_barrier_s(~mask) &amp; b);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/* Zero */<br>
&gt; ++static constant_inline unsigned int<br>
&gt; ++constant_time_is_zero(unsigned int a)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return constant_time_msb(~a &amp; (a =
- 1));<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static constant_inline size_t<br>
&gt; ++constant_time_is_zero_s(size_t a)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return constant_time_msb_s(~a &amp; (=
a - 1));<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/* Comparison*/<br>
&gt; ++static constant_inline size_t<br>
&gt; ++constant_time_lt_s(size_t a, size_t b)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return constant_time_msb_s(a ^ ((a ^ =
b) | ((a - b) ^ b)));<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static constant_inline unsigned int<br>
&gt; ++constant_time_lt(unsigned int a, unsigned int b)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return constant_time_msb(a ^ ((a ^ b)=
 | ((a - b) ^ b)));<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static constant_inline unsigned int<br>
&gt; ++constant_time_ge(unsigned int a, unsigned int b)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ~constant_time_lt(a, b);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/* Equality*/<br>
&gt; ++<br>
&gt; ++static constant_inline unsigned int<br>
&gt; ++constant_time_eq(unsigned int a, unsigned int b)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return constant_time_is_zero(a ^ b);<=
br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static constant_inline size_t<br>
&gt; ++constant_time_eq_s(size_t a, size_t b)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return constant_time_is_zero_s(a ^ b)=
;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++#endif /* CONSTANT_TIME_H */<br>
&gt; +diff --git a/src/libopensc/internal.h b/src/libopensc/internal.h<br>
&gt; +index 7531260c14..2a98f0e966 100644<br>
&gt; +--- a/src/libopensc/internal.h<br>
&gt; ++++ b/src/libopensc/internal.h<br>
&gt; +@@ -166,8 +166,8 @@ int _sc_card_add_xeddsa_alg(struct sc_ca<br>
&gt; +<br>
&gt; + int sc_pkcs1_strip_01_padding(struct sc_context *ctx, const u8 *in_d=
at, size_t in_len,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; u8 *out_dat, size_t *out_len);<br>
&gt; +-int sc_pkcs1_strip_02_padding(struct sc_context *ctx, const u8 *data=
, size_t len,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; u8 *out_dat, size_t *out_len);<br>
&gt; ++int sc_pkcs1_strip_02_padding_constant_time(sc_context_t *ctx, unsig=
ned int n, const u8 *data,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; unsigned int data_len, u8 *out, unsigned int *out_len);<br>
&gt; + int sc_pkcs1_strip_digest_info_prefix(unsigned int *algorithm,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; const u8 *in_dat, size_t in_len, u8 *out_dat, size_t *out_l=
en);<br>
&gt; +<br>
&gt; +diff --git a/src/libopensc/padding.c b/src/libopensc/padding.c<br>
&gt; +index ca47733a4e..ddb3061134 100644<br>
&gt; +--- a/src/libopensc/padding.c<br>
&gt; ++++ b/src/libopensc/padding.c<br>
&gt; +@@ -32,10 +32,13 @@<br>
&gt; + #include &lt;string.h&gt;<br>
&gt; + #include &lt;stdlib.h&gt;<br>
&gt; +<br>
&gt; ++#include &quot;common/constant-time.h&quot;<br>
&gt; + #include &quot;internal.h&quot;<br>
&gt; +<br>
&gt; + /* TODO doxygen comments */<br>
&gt; +<br>
&gt; ++#define SC_PKCS1_PADDING_MIN_SIZE 11<br>
&gt; ++<br>
&gt; + /*<br>
&gt; +&nbsp; * Prefixes for pkcs-v1 signatures<br>
&gt; +&nbsp; */<br>
&gt; +@@ -143,45 +146,82 @@ sc_pkcs1_strip_01_padding(struct sc_context *ct=
x, const u8 *in_dat, size_t in_le<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return SC_SUCCESS;<br>
&gt; + }<br>
&gt; +<br>
&gt; +-<br>
&gt; +-/* remove pkcs1 BT02 padding (adding BT02 padding is currently not<b=
r>
&gt; +- * needed/implemented) */<br>
&gt; ++/* Remove pkcs1 BT02 padding (adding BT02 padding is currently not<b=
r>
&gt; ++ * needed/implemented) in constant-time.<br>
&gt; ++ * Original source: <a href=3D"https://github.com/openssl/openssl/bl=
ob/9890cc42daff5e2d0cad01ac4bf78c391f599a6e/crypto/rsa/rsa_pk1.c#L171">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fopenssl%2Fopenssl%2Fblob%2F9890cc42daff5e2d0cad01ac4bf78c391f599a6e%2=
Fcrypto%2Frsa%2Frsa_pk1.c%23L171&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7=
Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C=
0%7C638585474039208698%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3Dri2Mtwz%2Fa=
vHG13ACpSdlI3ucHbNqOtofLco53NB%2B6KM%3D&amp;reserved=3D0</a>
 */<br>
&gt; + int<br>
&gt; +-sc_pkcs1_strip_02_padding(sc_context_t *ctx, const u8 *data, size_t =
len, u8 *out, size_t *out_len)<br>
&gt; ++sc_pkcs1_strip_02_padding_constant_time(sc_context_t *ctx, unsigned =
int n, const u8 *data, unsigned int data_len, u8 *out, unsigned int *out_le=
n)<br>
&gt; + {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int&nbsp;&nbsp;&nbsp; n =3D =
0;<br>
&gt; +-<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int i =3D 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 *msg, *msg_orig =3D NULL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int good, found_zero_byte, m=
ask;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int zero_index =3D 0, msg_in=
dex, mlen =3D -1, len =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LOG_FUNC_CALLED(ctx);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (data =3D=3D NULL || len &lt; 3)<b=
r>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (data =3D=3D NULL || data_len &lt;=
=3D 0 || data_len &gt; n || n &lt; SC_PKCS1_PADDING_MIN_SIZE)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* skip leading zero byte */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*data =3D=3D 0) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; data++;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; len--;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msg =3D msg_orig =3D calloc(n, sizeof=
(u8));<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (msg =3D=3D NULL)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * We can not check length of in=
put data straight away and still we need to read<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * from input even when the inpu=
t is not as long as needed to keep the time constant.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * If data has wrong size, it is=
 padded by zeroes from left and the following checks<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * do not pass.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D data_len;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (data +=3D len, msg +=3D n, i =3D=
 0; i &lt; n; i++) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mask =3D ~constant_time_is_zero(len);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; len -=3D 1 &amp; mask;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; data -=3D 1 &amp; mask;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *--msg =3D *data &amp; mask;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // check first byte to be 0x00<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; good =3D constant_time_is_zero(msg[0]=
);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // check second byte to be 0x02<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; good &amp;=3D constant_time_eq(msg[1]=
, 2);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // find zero byte after random data i=
n padding<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; found_zero_byte =3D 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 2; i &lt; n; i++) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; unsigned int equals0 =3D constant_time_is_zero(msg[i]);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; zero_index =3D constant_time_select(~found_zero_byte &amp; equal=
s0, i, zero_index);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; found_zero_byte |=3D equals0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (data[0] !=3D 0x02)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; LOG_FUNC_RETURN(ctx, SC_ERROR_WRONG_PADDING);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* skip over padding bytes */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (n =3D 1; n &lt; len &amp;&amp; d=
ata[n]; n++)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Must be at least 8 pad bytes */<br=
>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (n &gt;=3D len || n &lt; 9)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; LOG_FUNC_RETURN(ctx, SC_ERROR_WRONG_PADDING);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n++;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (out =3D=3D NULL)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* just check the padding */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; LOG_FUNC_RETURN(ctx, SC_SUCCESS);<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Now move decrypted contents to hea=
d of buffer */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*out_len &lt; len - n)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; LOG_FUNC_RETURN(ctx, SC_ERROR_INTERNAL);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *out_len =3D len - n;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memmove(out, data + n, *out_len);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // zero_index stands for index of las=
t found zero<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; good &amp;=3D constant_time_ge(zero_i=
ndex, 2 + 8);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // start of the actual message in dat=
a<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msg_index =3D zero_index + 1;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // length of message<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mlen =3D data_len - msg_index;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // check that message fits into out b=
uffer<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; good &amp;=3D constant_time_ge(*out_l=
en, mlen);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // move the result in-place by |num|-=
SC_PKCS1_PADDING_MIN_SIZE-|mlen| bytes to the left.<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *out_len =3D constant_time_select(con=
stant_time_lt(n - SC_PKCS1_PADDING_MIN_SIZE, *out_len),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n - SC_PKCS1_PAD=
DING_MIN_SIZE, *out_len);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (msg_index =3D 1; msg_index &lt; =
n - SC_PKCS1_PADDING_MIN_SIZE; msg_index &lt;&lt;=3D 1) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mask =3D ~constant_time_eq(msg_index &amp; (n - SC_PKCS1_PADDING=
_MIN_SIZE - mlen), 0);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; for (i =3D SC_PKCS1_PADDING_MIN_SIZE; i &lt; n - msg_index; i++)=
<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msg[i] =3D const=
ant_time_select_8(mask, msg[i + msg_index], msg[i]);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // move message into out buffer, if g=
ood<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; *out_len; i++) {=
<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; unsigned int msg_index;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; // when out is longer than message in data, use some bogus index=
 in msg<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mask =3D good &amp; constant_time_lt(i, mlen);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; msg_index =3D constant_time_select(mask, i + SC_PKCS1_PADDING_MI=
N_SIZE, 0); // to now overflow msg buffer<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; out[i] =3D constant_time_select_8(mask, msg[msg_index], out[i]);=
<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sc_log(ctx, &quot;stripped output(%&q=
uot;SC_FORMAT_LEN_SIZE_T&quot;u): %s&quot;, len - n,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; sc_dump_hex(out, len - n));<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LOG_FUNC_RETURN(ctx, len - n);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(msg_orig);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return constant_time_select(good, mle=
n, SC_ERROR_WRONG_PADDING);<br>
&gt; + }<br>
&gt; +<br>
&gt; + /* add/remove DigestInfo prefix */<br>
&gt; +diff --git a/src/libopensc/pkcs15-sec.c b/src/libopensc/pkcs15-sec.c<=
br>
&gt; +index 2ac6ca7ddf..a019af460f 100644<br>
&gt; +--- a/src/libopensc/pkcs15-sec.c<br>
&gt; ++++ b/src/libopensc/pkcs15-sec.c<br>
&gt; +@@ -308,8 +308,9 @@ int sc_pkcs15_decipher(struct sc_pkcs15_<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Strip any padding */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pad_flags &amp; SC_ALGORITHM=
_RSA_PAD_PKCS1) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; size_t s =3D r;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; r =3D sc_pkcs1_strip_02_padding(ctx, out, s, out, &amp;s);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int s =3D r;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int key_size =3D alg_info-&gt;key_length;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; r =3D sc_pkcs1_strip_02_padding_constant_time(ctx, key_size / 8,=
 out, s, out, &amp;s);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; LOG_TEST_RET(ctx, r, &quot;Invalid PKCS#1 padding&quot;);<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.=
c<br>
&gt; +index 3391994abe..5248d9758a 100644<br>
&gt; +--- a/src/minidriver/minidriver.c<br>
&gt; ++++ b/src/minidriver/minidriver.c<br>
&gt; +@@ -4582,9 +4582,9 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; &quot;sc_pkcs15_decipher: DECRYPT-INFO dwVersion=3D%l=
u\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; (unsigned long)pInfo-&gt;dwVersion);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pInfo-&gt;dwPaddingType =3D=3D CAR=
D_PADDING_PKCS1)&nbsp;&nbsp; {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; size_t temp =3D pInfo-&gt;cbData;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; unsigned int temp =3D pInfo-&gt;cbData;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; logprintf(pCardData, 2, &quot;sc_pkcs15_decipher: stripping PKCS1=
 padding\n&quot;);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; r =3D sc_pkcs1_strip_02_padding(vs-&gt;ctx, pbuf2, pInfo-&gt;cbData, p=
buf2, &amp;temp);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; r =3D sc_pkcs1_strip_02_padding_constant_time(vs-&gt;ctx, prkey_info-&=
gt;modulus_length / 8, pbuf2, pInfo-&gt;cbData, pbuf2, &amp;temp);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; pInfo-&gt;cbData =3D (DWORD) temp;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; if (r &lt; 0)&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logprintf(pCardDa=
ta, 2, &quot;Cannot strip PKCS1 padding: %i\n&quot;, r);<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.pat=
ch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..1d8bc1259<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-2.patch<br>
&gt; @@ -0,0 +1,39 @@<br>
&gt; +From 1a6a18c51a1d6239850b61d19aed6424afd4912f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D &lt;v=
hanulik@redhat.com&gt;<br>
&gt; +Date: Thu, 16 Nov 2023 10:38:12 +0100<br>
&gt; +Subject: [PATCH] pkcs15-sec: Remove logging after PKCS#1 v1.5 depaddi=
ng<br>
&gt; +<br>
&gt; +To prevent Marvin attack on RSA PKCS#1 v1.5 padding<br>
&gt; +when logging the return value, signaling the padding error.<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenSC/OpenS=
C/pull/2948/commits/1a6a18c51a1d6239850b61d19aed6424afd4912f">https://apc01=
.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%=
2FOpenSC%2Fpull%2F2948%2Fcommits%2F1a6a18c51a1d6239850b61d19aed6424afd4912f=
&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea=
5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039211871%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C0%7C%7C%7C&amp;sdata=3D85lGNhd1ZVO%2BryUZRPhW%2FOZou8jP6r6Zm8TeDi%=
2FRgCI%3D&amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;nikhil.r@kpit.com&gt;<br>
&gt; +Comment: Refreshed hunk to match latest kirkstone<br>
&gt; +---<br>
&gt; + src/libopensc/pkcs15-sec.c | 9 +++++----<br>
&gt; + 1 file changed, 5 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/libopensc/pkcs15-sec.c b/src/libopensc/pkcs15-sec.c<=
br>
&gt; +index a019af460f..f7ee819d65 100644<br>
&gt; +--- a/src/libopensc/pkcs15-sec.c<br>
&gt; ++++ b/src/libopensc/pkcs15-sec.c<br>
&gt; +@@ -308,13 +308,14 @@ int sc_pkcs15_decipher(struct sc_pkcs15_<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Strip any padding */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pad_flags &amp; SC_ALGORITHM=
_RSA_PAD_PKCS1) {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int s =3D r;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int key_size =3D alg_info-&gt;key_length;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; unsigned int s =3D r;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; unsigned int key_size =3D (unsigned int)alg_info-&gt;key_length;=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; r =3D sc_pkcs1_strip_02_padding_constant_time(ctx, key_size=
 / 8, out, s, out, &amp;s);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; LOG_TEST_RET(ctx, r, &quot;Invalid PKCS#1 padding&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* for keeping PKCS#1 v1.5 depadding constant-time, do not log e=
rror here */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LOG_FUNC_RETURN(ctx, r);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* do not log error code to prevent s=
ide channel attack */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt; + }<br>
&gt; +<br>
&gt; + /* derive one key from another. RSA can use decipher, so this is for=
 only ECDH<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.pat=
ch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..d3846e5da<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-3.patch<br>
&gt; @@ -0,0 +1,105 @@<br>
&gt; +From a8ac5930ab8f2da5cb93793d05389761c342f995 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D &lt;v=
hanulik@redhat.com&gt;<br>
&gt; +Date: Thu, 16 Nov 2023 15:49:15 +0100<br>
&gt; +Subject: [PATCH] framework-pkcs15.c: Handle PKCS#1 v1.5 depadding<br>
&gt; + constant-time<br>
&gt; +<br>
&gt; +In order to not disclose time side-channel when the depadding<br>
&gt; +fails, do the same operations as for case when depadding ends<br>
&gt; +with success.<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenSC/OpenS=
C/pull/2948/commits/a8ac5930ab8f2da5cb93793d05389761c342f995">https://apc01=
.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%=
2FOpenSC%2Fpull%2F2948%2Fcommits%2Fa8ac5930ab8f2da5cb93793d05389761c342f995=
&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea=
5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039215146%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C0%7C%7C%7C&amp;sdata=3Dx206N6Zb8coR7iTMmKuZRhlAlymSDrm83Py%2FtzaKW=
q8%3D&amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;nikhil.r@kpit.com&gt;<br>
&gt; +Comment: Refreshed hunks to match latest kirkstone<br>
&gt; +---<br>
&gt; + src/pkcs11/framework-pkcs15.c | 54 ++++++++++++++++++++++++++-------=
--<br>
&gt; + 1 file changed, 41 insertions(+), 13 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/pkcs11/framework-pkcs15.c b/src/pkcs11/framework-pkc=
s15.c<br>
&gt; +index f75a3dbaec..632681df63 100644<br>
&gt; +--- a/src/pkcs11/framework-pkcs15.c<br>
&gt; ++++ b/src/pkcs11/framework-pkcs15.c<br>
&gt; +@@ -18,6 +18,7 @@<br>
&gt; +&nbsp; * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA&nbs=
p; 02111-1307&nbsp; USA<br>
&gt; +&nbsp; */<br>
&gt; +<br>
&gt; ++#include &quot;common/constant-time.h&quot;<br>
&gt; + #include &quot;config.h&quot;<br>
&gt; + #include &lt;stdlib.h&gt;<br>
&gt; + #include &lt;string.h&gt;<br>
&gt; +@@ -4341,7 +4342,8 @@<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct pkcs15_fw_data *fw_data =
=3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct pkcs15_prkey_object *prke=
y;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char decrypted[512]; /*=
 FIXME: Will not work for keys above 4096 bits */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int&nbsp;&nbsp;&nbsp;&nbsp; buff_too_=
small, rv, flags =3D 0, prkey_has_path =3D 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int rv, flags =3D 0, prkey_has_path =
=3D 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CK_ULONG mask, good, rv_pkcs11;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sc_log(context, &quot;Initiating=
 decryption.&quot;);<br>
&gt; +<br>
&gt; +@@ -4415,27 +4417,53 @@<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rv =3D sc_pkcs15_decipher(fw_dat=
a-&gt;p15_card, prkey-&gt;prv_p15obj, flags,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pEncryptedD=
ata, ulEncryptedDataLen, decrypted, sizeof(decrypted));<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rv &lt; 0 &amp;&amp; !sc_pkcs11_c=
onf.lock_login &amp;&amp; !prkey_has_path)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* skip for PKCS#1 v1.5 padding preve=
nt side channel attack */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(flags &amp; SC_ALGORITHM_RSA_PA=
D_PKCS1) &amp;&amp;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rv &lt; 0 &amp;&=
amp; !sc_pkcs11_conf.lock_login &amp;&amp; !prkey_has_path)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (reselect_app_df(fw_data-&gt;p15_card) =3D=3D SC_SUCCESS=
)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rv =3D sc_p=
kcs15_decipher(fw_data-&gt;p15_card, prkey-&gt;prv_p15obj, flags,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; pEncryptedData, ulEncryptedDataLen, decrypted, sizeof(decrypted))=
;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sc_unlock(p11card-&gt;card);<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sc_log(context, &quot;Decryption comp=
lete. Result %d.&quot;, rv);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sc_log(context, &quot;Decryption comp=
lete.&quot;);<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rv &lt; 0)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return sc_to_cryptoki_error(rv, &quot;C_Decrypt&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Handle following code in constant-=
time<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * to prevent Marvin attack for =
PKCS#1 v1.5 padding. */<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; buff_too_small =3D (*pulDataLen &lt; =
(CK_ULONG)rv);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *pulDataLen =3D rv;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pData =3D=3D NULL_PTR)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return CKR_OK;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (buff_too_small)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return CKR_BUFFER_TOO_SMALL;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(pData, decrypted, *pulDataLen)=
;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* only padding error must be handled=
 in constant-time way,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * other error can be returned s=
traight away */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((~constant_time_eq_s(rv, SC_ERROR=
_WRONG_PADDING) &amp; constant_time_lt_s(sizeof(decrypted), rv)))<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return sc_to_cryptoki_error(rv, &quot;C_Decrypt&quot;);<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return CKR_OK;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* check rv for padding error */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; good =3D ~constant_time_eq_s(rv, SC_E=
RROR_WRONG_PADDING);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rv_pkcs11 =3D sc_to_cryptoki_error(SC=
_ERROR_WRONG_PADDING, &quot;C_Decrypt&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rv_pkcs11 =3D constant_time_select_s(=
good, CKR_OK, rv_pkcs11);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pData =3D=3D NULL_PTR) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* set length only if no error */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; *pulDataLen =3D constant_time_select_s(good, rv, *pulDataLen);<b=
r>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* return error only if original rv &lt; 0 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return rv_pkcs11;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* check whether *pulDataLen &lt; rv =
and set return value for small output buffer */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mask =3D good &amp; constant_time_lt_=
s(*pulDataLen, rv);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rv_pkcs11 =3D constant_time_select_s(=
mask, CKR_BUFFER_TOO_SMALL, rv_pkcs11);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; good &amp;=3D ~mask;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* move everything from decrypted int=
o out buffer constant-time, if rv is ok */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (CK_ULONG i =3D 0; i &lt; *pulDat=
aLen; i++) { /* iterate over whole pData to not disclose real depadded leng=
th */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; CK_ULONG msg_index;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mask =3D good &amp; constant_time_lt_s(i, sizeof(decrypted));&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* i =
should be in the bounds of decrypted */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mask &amp;=3D constant_time_lt_s(i, constant_time_select_s(good,=
 rv, 0)); /* check that is in bounds of depadded message */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; msg_index =3D constant_time_select_s(mask, i, 0);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pData[i] =3D constant_time_select_8(mask, decrypted[msg_index], =
pData[i]);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *pulDataLen =3D constant_time_select_=
s(good, rv, *pulDataLen);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* do not log error code to prevent s=
ide channel attack */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rv_pkcs11;<br>
&gt; + }<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.pat=
ch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..e113df7c4<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-4.patch<br>
&gt; @@ -0,0 +1,47 @@<br>
&gt; +From 32cdab44f6b1e6343f029879a8ab32de4f32743f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D &lt;v=
hanulik@redhat.com&gt;<br>
&gt; +Date: Mon, 8 Jan 2024 14:59:22 +0100<br>
&gt; +Subject: [PATCH] mechanism: Handle PKCS#1 v1.5 depadding constant-tim=
e<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenSC/OpenS=
C/pull/2948/commits/32cdab44f6b1e6343f029879a8ab32de4f32743f">https://apc01=
.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%=
2FOpenSC%2Fpull%2F2948%2Fcommits%2F32cdab44f6b1e6343f029879a8ab32de4f32743f=
&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea=
5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039218933%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DwlIwj01UWFsUnKMzR9qAW0hHzK7kSjAygzZQatz%2BG=
8A%3D&amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;nikhil.r@kpit.com&gt;<br>
&gt; +Comment: 1 hunk removed and refreshed hunks to match latest kirkstone=
<br>
&gt; +---<br>
&gt; + src/pkcs11/mechanism.c | 19 ++++++++++++++-----<br>
&gt; + 1 file changed, 14 insertions(+), 5 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/pkcs11/mechanism.c b/src/pkcs11/mechanism.c<br>
&gt; +index 03495265a4..d3f0434231 100644<br>
&gt; +--- a/src/pkcs11/mechanism.c<br>
&gt; ++++ b/src/pkcs11/mechanism.c<br>
&gt; +@@ -23,6 +23,7 @@<br>
&gt; + #include &lt;stdlib.h&gt;<br>
&gt; + #include &lt;string.h&gt;<br>
&gt; +<br>
&gt; ++#include &quot;common/constant-time.h&quot;<br>
&gt; + #include &quot;sc-pkcs11.h&quot;<br>
&gt; +<br>
&gt; + /* Also used for verification data */<br>
&gt; +@@ -844,7 +845,9 @@ sc_pkcs11_decr(struct sc_pkcs11_session<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rv =3D op-&gt;type-&gt;decrypt(o=
p, pEncryptedData, ulEncryptedDataLen,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pData, pulDataLen);<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rv !=3D CKR_BUFFER_TOO_SMALL &amp=
;&amp; pData !=3D NULL)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* terminate session for any return v=
alue except CKR_BUFFER_TOO_SMALL,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * perform check in time side-ch=
annel free way to prevent Marvin attack */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!constant_time_eq_s(rv, CKR_BUFFE=
R_TOO_SMALL) &amp;&amp; pData !=3D NULL)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; session_stop_operation(session, SC_PKCS11_OPERATION_DECRYPT=
);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rv;<br>
&gt; +@@ -1107,6 +1107,10 @@ sc_pkcs11_decrypt(sc_pkcs11_operation_t<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pulDataLen)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; *pulDataLen =3D ulDataLen;<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Skip DecryptFinalize for PKCS#1 v1=
.5 padding to prevent time side-channel leakage */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (((CK_MECHANISM_PTR)&amp;operation=
-&gt;mechanism)-&gt;mechanism =3D=3D CKM_RSA_PKCS)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return rv;<br>
&gt; ++<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rv !=3D CKR_OK)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return rv;<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.pat=
ch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..7bb862194<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-5.patch<br>
&gt; @@ -0,0 +1,115 @@<br>
&gt; +From 1fe1a78610b00b9db83a03396762c72c1371bd02 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D &lt;v=
hanulik@redhat.com&gt;<br>
&gt; +Date: Wed, 22 Nov 2023 15:02:57 +0100<br>
&gt; +Subject: [PATCH] minidriver: Make CardRSADecrypt constant-time<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenSC/OpenS=
C/pull/2948/commits/1fe1a78610b00b9db83a03396762c72c1371bd02">https://apc01=
.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%=
2FOpenSC%2Fpull%2F2948%2Fcommits%2F1fe1a78610b00b9db83a03396762c72c1371bd02=
&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea=
5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039222236%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C0%7C%7C%7C&amp;sdata=3D45wf78tNtkWO15anb%2FntZ%2BKbbZaqLE3aKnfLhVo=
t0bI%3D&amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;nikhil.r@kpit.com&gt;<br>
&gt; +Comment: Refreshed hunks to match latest kirkstone<br>
&gt; +---<br>
&gt; + src/minidriver/minidriver.c | 37 +++++++++++++++++++++++------------=
--<br>
&gt; + 1 file changed, 23 insertions(+), 14 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.=
c<br>
&gt; +index 5248d9758a..b99b6cff89 100644<br>
&gt; +--- a/src/minidriver/minidriver.c<br>
&gt; ++++ b/src/minidriver/minidriver.c<br>
&gt; +@@ -41,6 +41,7 @@<br>
&gt; + #include &quot;cardmod.h&quot;<br>
&gt; +<br>
&gt; + #include &quot;common/compat_strlcpy.h&quot;<br>
&gt; ++#include &quot;common/constant-time.h&quot;<br>
&gt; + #include &quot;libopensc/asn1.h&quot;<br>
&gt; + #include &quot;libopensc/cardctl.h&quot;<br>
&gt; + #include &quot;libopensc/opensc.h&quot;<br>
&gt; +@@ -4463,13 +4464,15 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D<br>
&gt; +<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DWORD dwret;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r, opt_crypt_flags =3D 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r, opt_crypt_flags =3D 0, good =
=3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned ui;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VENDOR_SPECIFIC *vs;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct sc_pkcs15_prkey_info *prk=
ey_info;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BYTE *pbuf =3D NULL, *pbuf2 =3D =
NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct sc_pkcs15_object *pkey =
=3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct sc_algorithm_info *alg_in=
fo =3D NULL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int wrong_padding =3D 0;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int pbufLen =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MD_FUNC_CALLED(pCardData, 1);<br=
>
&gt; +<br>
&gt; +@@ -4570,11 +4573,11 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; goto err;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pbufLen =3D pInfo-&gt;cbData;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (alg_info-&gt;flags &amp; SC_=
ALGORITHM_RSA_RAW)&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; logprintf(pCardData, 2, &quot;sc_pkcs15_decipher: using RSA=
-RAW mechanism\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; r =3D sc_pkcs15_decipher(vs-&gt;p15card, pkey, opt_crypt_fl=
ags, pbuf, pInfo-&gt;cbData, pbuf2, pInfo-&gt;cbData);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; logprintf(pCardData, 2, &quot;sc_pkcs15_decipher returned %d\n&q=
uot;, r);<br>
&gt; +-<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* do not log return value to not leak it */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (r &gt; 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Need to =
handle padding */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pInfo-&=
gt;dwVersion &gt;=3D CARD_RSA_KEY_DECRYPT_INFO_VERSION_TWO) {<br>
&gt; +@@ -4586,13 +4589,9 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; logprintf(pCardData, 2, &quot;sc_pkcs15_decipher: stripping PKCS1=
 padding\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; r =3D sc_pkcs1_strip_02_padding_constant_time(vs-&gt;ctx, prkey_i=
nfo-&gt;modulus_length / 8, pbuf2, pInfo-&gt;cbData, pbuf2, &amp;temp);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; pInfo-&gt;cbData =3D (DWORD) temp;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; if (r &lt; 0)&nbsp;&nbsp; {<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logprintf(pCardData, 2=
, &quot;Cannot strip PKCS1 padding: %i\n&quot;, r);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pCardData-&gt;pfnCspFr=
ee(pbuf);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pCardData-&gt;pfnCspFr=
ee(pbuf2);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dwret =3D SCARD_F_INTE=
RNAL_ERROR;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto err;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; wrong_padding =3D constant_time_eq_s(r, SC_ERROR_WRONG_PADDING);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; /* continue without returning error to not leak that padding is wrong<=
br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; to prevent time side-channel leak for Marvin attack*=
/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (pInfo-&gt;dwPaddingType =3D=
=3D CARD_PADDING_OAEP)&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; /* TODO: Handle OAEP padding if present - can call PFN_CSP_UNPAD_=
DATA */<br>
&gt; +@@ -4640,28 +4639,38 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_D<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; goto err;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ( r &lt; 0)&nbsp;&nbsp; {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; good =3D constant_time_eq_s(r, 0);<br=
>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* if no error or padding error, do n=
ot return here to prevent Marvin attack */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(good | wrong_padding) &amp;&amp=
; r &lt; 0)&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; logprintf(pCardData, 2, &quot;sc_pkcs15_decipher error(%i):=
 %s\n&quot;, r, sc_strerror(r));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; pCardData-&gt;pfnCspFree(pbuf);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; pCardData-&gt;pfnCspFree(pbuf2);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; dwret =3D md_translate_OpenSC_to_Windows_error(r, SCARD_E_I=
NVALID_VALUE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; goto err;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dwret =3D constant_time_select_s(good=
, SCARD_S_SUCCESS, SCARD_F_INTERNAL_ERROR);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; logprintf(pCardData, 2, &quot;de=
crypted data(%lu):\n&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; (unsigned long)pInfo-&gt;cbData);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; loghex(pCardData, 7, pbuf2, pInf=
o-&gt;cbData);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*inversion donnees */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for(ui =3D 0; ui &lt; pInfo-&gt;cbDat=
a; ui++)<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pInfo-&gt;pbData[ui] =3D pbuf2[pInfo-&gt;cbData-ui-1];<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* copy data in constant-time way to =
prevent leak */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (ui =3D 0; ui &lt; pbufLen; ui++)=
 {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; unsigned int mask, msg_index, inv_ui;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; mask =3D good &amp; constant_time_lt_s(ui, pInfo-&gt;cbData); /*=
 ui should be in the bounds of pbuf2 */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; inv_ui =3D pInfo-&gt;cbData - ui - 1;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; msg_index =3D constant_time_select_s(mask, inv_ui, 0);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; pInfo-&gt;pbData[ui] =3D constant_time_select_8(mask, pbuf2[msg_=
index], pInfo-&gt;pbData[ui]);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pCardData-&gt;pfnCspFree(pbuf);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pCardData-&gt;pfnCspFree(pbuf2);=
<br>
&gt; +<br>
&gt; + err:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unlock(pCardData);<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MD_FUNC_RETURN(pCardData, 1, dwret);<=
br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* do not log return value to not lea=
k it */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dwret;<br>
&gt; + }<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.pat=
ch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..5deeacc25<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-6.patch<br>
&gt; @@ -0,0 +1,47 @@<br>
&gt; +From 306dc92bd4d2d74203f53cf3d9ea68c223115375 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D &lt;v=
hanulik@redhat.com&gt;<br>
&gt; +Date: Fri, 24 Nov 2023 20:59:07 +0100<br>
&gt; +Subject: [PATCH] pkcs11-object: Remove return value logging<br>
&gt; +<br>
&gt; +To prevent Marvin attack on RSA PKCS#1 v1.5 padding<br>
&gt; +when logging the return value, signaling the padding error.<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenSC/OpenS=
C/pull/2948/commits/306dc92bd4d2d74203f53cf3d9ea68c223115375">https://apc01=
.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%=
2FOpenSC%2Fpull%2F2948%2Fcommits%2F306dc92bd4d2d74203f53cf3d9ea68c223115375=
&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea=
5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039225383%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DWw6twdIVhAGYFgLBGs0hZp2udnjM2hXy4hl9mzFGEy0=
%3D&amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;nikhil.r@kpit.com&gt;<br>
&gt; +Comment: Two hunks removed from pkcs11-object.c and refreshed sc-pkcs=
11.h<br>
&gt; +---<br>
&gt; + src/pkcs11/pkcs11-object.c | 9 ++++++---<br>
&gt; + src/pkcs11/sc-pkcs11.h&nbsp;&nbsp;&nbsp;&nbsp; | 5 +++++<br>
&gt; + 2 files changed, 11 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/pkcs11/pkcs11-object.c b/src/pkcs11/pkcs11-object.c<=
br>
&gt; +index f04c0b4c56..b023911213 100644<br>
&gt; +--- a/src/pkcs11/pkcs11-object.c<br>
&gt; ++++ b/src/pkcs11/pkcs11-object.c<br>
&gt; +@@ -930,7 +930,8 @@ CK_RV C_Decrypt(CK_SESSION_HANDLE hSessi<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; rv =3D reset_login_state(session-&gt;slot, rv);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sc_log(context, &quot;C_Decrypt() =3D=
 %s&quot;, lookup_enum ( RV_T, rv ));<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* do not log error code to prevent s=
ide channel attack */<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SC_LOG(&quot;C_Decrypt()&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sc_pkcs11_unlock();<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rv;<br>
&gt; + }<br>
&gt; +diff --git a/src/pkcs11/sc-pkcs11.h b/src/pkcs11/sc-pkcs11.h<br>
&gt; +index 66dfcdde67..510017ed2a 100644<br>
&gt; +--- a/src/pkcs11/sc-pkcs11.h<br>
&gt; ++++ b/src/pkcs11/sc-pkcs11.h<br>
&gt; +@@ -226,6 +226,11 @@<br>
&gt; + };<br>
&gt; + typedef struct sc_pkcs11_slot sc_pkcs11_slot_t;<br>
&gt; +<br>
&gt; ++#define SC_LOG(fmt) \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do { \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; sc_log(context, (fmt)); \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } while (0)<br>
&gt; ++<br>
&gt; + /* Debug virtual slots. S is slot to be highlighted or NULL<br>
&gt; +&nbsp; * C is a comment format string and args It will be preceded by=
 &quot;VSS &quot; */<br>
&gt; + #define DEBUG_VSS(S, ...) do { sc_log(context,&quot;VSS &quot; __VA_=
ARGS__); _debug_virtual_slots(S); } while (0)<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.pat=
ch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..7b41abc0e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-7.patch<br>
&gt; @@ -0,0 +1,33 @@<br>
&gt; +From aa6bf2b65fe432e8f234a132268b79ea54d5d74b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D &lt;v=
hanulik@redhat.com&gt;<br>
&gt; +Date: Fri, 24 Nov 2023 21:00:23 +0100<br>
&gt; +Subject: [PATCH] misc: Compare return value constant-time<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenSC/OpenS=
C/pull/2948/commits/aa6bf2b65fe432e8f234a132268b79ea54d5d74b">https://apc01=
.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%=
2FOpenSC%2Fpull%2F2948%2Fcommits%2Faa6bf2b65fe432e8f234a132268b79ea54d5d74b=
&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea=
5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039228489%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DFuhfgrvC6wIKW%2F8FyZLmFAPVx3AC0%2F4JC%2FJQv=
Nu4hWs%3D&amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;nikhil.r@kpit.com&gt;<br>
&gt; +---<br>
&gt; + src/pkcs11/misc.c | 3 ++-<br>
&gt; + 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/src/pkcs11/misc.c b/src/pkcs11/misc.c<br>
&gt; +index 5ca1176b1d..1d893d6181 100644<br>
&gt; +--- a/src/pkcs11/misc.c<br>
&gt; ++++ b/src/pkcs11/misc.c<br>
&gt; +@@ -23,6 +23,7 @@<br>
&gt; + #include &lt;stdlib.h&gt;<br>
&gt; + #include &lt;string.h&gt;<br>
&gt; +<br>
&gt; ++#include &quot;common/constant-time.h&quot;<br>
&gt; + #include &quot;sc-pkcs11.h&quot;<br>
&gt; +<br>
&gt; + #define DUMP_TEMPLATE_MAX&nbsp;&nbsp;&nbsp;&nbsp; 32<br>
&gt; +@@ -174,7 +175,7 @@ CK_RV reset_login_state(struct sc_pkcs11_slot *sl=
ot, CK_RV rv)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slot-&gt;p1=
1card-&gt;framework-&gt;logout(slot);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (rv =3D=3D CKR_USER_NOT_LOGGED_IN) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (constant_time_eq_s(rv, CKR_USER_NOT_LOGGED_IN)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slot-&gt;lo=
gin_user =3D -1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pop_all_log=
in_states(slot);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; }<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.pat=
ch b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..3ad681ecb<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc/CVE-2023-5992-8.patch<br>
&gt; @@ -0,0 +1,71 @@<br>
&gt; +From fd80ba7c00bb87f52a63f628509955ccee5b09e4 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: =3D?UTF-8?q?Veronika=3D20Hanul=3DC3=3DADkov=3DC3=3DA1?=3D &lt;v=
hanulik@redhat.com&gt;<br>
&gt; +Date: Mon, 5 Feb 2024 13:33:05 +0100<br>
&gt; +Subject: [PATCH] Fix constant-time comparison of negative values<br>
&gt; +<br>
&gt; +Thanks Coverity CID 414687<br>
&gt; +<br>
&gt; +CVE: CVE-2023-5992<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/OpenSC/OpenS=
C/pull/3016/commits/fd80ba7c00bb87f52a63f628509955ccee5b09e4">https://apc01=
.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2FOpenSC%=
2FOpenSC%2Fpull%2F3016%2Fcommits%2Ffd80ba7c00bb87f52a63f628509955ccee5b09e4=
&amp;data=3D05%7C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea=
5%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C638585474039232655%7CUnknown=
%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6=
Mn0%3D%7C0%7C%7C%7C&amp;sdata=3DJRq1GCbjG37VCUIyggF%2FUtBtUYYmuw2Iun8lOnIxF=
j4%3D&amp;reserved=3D0</a>]<br>
&gt; +Signed-off-by: nikhil r &lt;nikhil.r@kpit.com&gt;<br>
&gt; +---<br>
&gt; + src/common/constant-time.h&nbsp;&nbsp;&nbsp; | 6 ++++++<br>
&gt; + src/minidriver/minidriver.c&nbsp;&nbsp; | 4 ++--<br>
&gt; + src/pkcs11/framework-pkcs15.c | 4 ++--<br>
&gt; + 3 files changed, 10 insertions(+), 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/common/constant-time.h b/src/common/constant-time.h<=
br>
&gt; +index 40c3e500c2..3f4446d4d8 100644<br>
&gt; +--- a/src/common/constant-time.h<br>
&gt; ++++ b/src/common/constant-time.h<br>
&gt; +@@ -125,4 +125,10 @@ constant_time_eq_s(size_t a, size_t b)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return constant_time_is_zero_s(a=
 ^ b);<br>
&gt; + }<br>
&gt; +<br>
&gt; ++static constant_inline unsigned int<br>
&gt; ++constant_time_eq_i(int a, int b)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return constant_time_eq((unsigned int=
)a, (unsigned int)b);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + #endif /* CONSTANT_TIME_H */<br>
&gt; +diff --git a/src/minidriver/minidriver.c b/src/minidriver/minidriver.=
c<br>
&gt; +index a3c738966b..d146b42549 100644<br>
&gt; +--- a/src/minidriver/minidriver.c<br>
&gt; ++++ b/src/minidriver/minidriver.c<br>
&gt; +@@ -4660,7 +4660,7 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA pCa=
rdData,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; logprintf(pCardData, 2, &quot;sc_pkcs15_decipher: stripping PKCS1=
 padding\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; r =3D sc_pkcs1_strip_02_padding_constant_time(vs-&gt;ctx, prkey_i=
nfo-&gt;modulus_length / 8, pbuf2, pInfo-&gt;cbData, pbuf2, &amp;temp);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; pInfo-&gt;cbData =3D (DWORD) temp;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; wrong_padding =3D constant_time_eq_s(r, SC_ERROR_WRONG_PADDING);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; wrong_padding =3D constant_time_eq_i(r, SC_ERROR_WRONG_PADDING);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; /* continue without returning error to not leak that padding is w=
rong<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; to prevent time side-channel leak for Marvin at=
tack*/<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +@@ -4710,7 +4710,7 @@ DWORD WINAPI CardRSADecrypt(__in PCARD_DATA pCa=
rdData,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; goto err;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; good =3D constant_time_eq_s(r, 0);<br=
>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; good =3D constant_time_eq_i(r, 0);<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* if no error or padding error,=
 do not return here to prevent Marvin attack */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(good | wrong_padding) &amp=
;&amp; r &lt; 0)&nbsp;&nbsp; {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; logprintf(pCardData, 2, &quot;sc_pkcs15_decipher error(%i):=
 %s\n&quot;, r, sc_strerror(r));<br>
&gt; +diff --git a/src/pkcs11/framework-pkcs15.c b/src/pkcs11/framework-pkc=
s15.c<br>
&gt; +index cb4df7a64f..11cfc51273 100644<br>
&gt; +--- a/src/pkcs11/framework-pkcs15.c<br>
&gt; ++++ b/src/pkcs11/framework-pkcs15.c<br>
&gt; +@@ -4627,11 +4627,11 @@ pkcs15_prkey_decrypt(struct sc_pkcs11_session=
 *session, void *obj,<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* only padding error must be ha=
ndled in constant-time way,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * other error can be retur=
ned straight away */<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((~constant_time_eq_s(rv, SC_ERROR=
_WRONG_PADDING) &amp; constant_time_lt_s(sizeof(decrypted), rv)))<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((~constant_time_eq_i(rv, SC_ERROR=
_WRONG_PADDING) &amp; constant_time_lt_s(sizeof(decrypted), (size_t)rv)))<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return sc_to_cryptoki_error(rv, &quot;C_Decrypt&quot;);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* check rv for padding error */=
<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; good =3D ~constant_time_eq_s(rv, SC_E=
RROR_WRONG_PADDING);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; good =3D ~constant_time_eq_i(rv, SC_E=
RROR_WRONG_PADDING);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rv_pkcs11 =3D sc_to_cryptoki_err=
or(SC_ERROR_WRONG_PADDING, &quot;C_Decrypt&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rv_pkcs11 =3D constant_time_sele=
ct_s(good, CKR_OK, rv_pkcs11);<br>
&gt; +<br>
&gt; diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe=
/recipes-support/opensc/opensc_0.22.0.bb<br>
&gt; index 770c2d686..16b3ec292 100644<br>
&gt; --- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb<br>
&gt; +++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb<br>
&gt; @@ -23,6 +23,15 @@ SRC_URI =3D &quot;git://github.com/OpenSC/OpenSC;br=
anch=3Dmaster;protocol=3Dhttps \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file://CVE-2023-40661-5.patch">file://CVE-2023-40661-5.p=
atch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file://CVE-2023-40661-6.patch">file://CVE-2023-40661-6.p=
atch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file://CVE-2023-40661-7.patch">file://CVE-2023-40661-7.p=
atch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-5992-1.patch">file://CVE-2023-5992-1.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-5992-2.patch">file://CVE-2023-5992-2.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-5992-3.patch">file://CVE-2023-5992-3.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-Preparing-to-implement-the-C_DecryptFinalize-and-C_D.patch"=
>
file://0001-Preparing-to-implement-the-C_DecryptFinalize-and-C_D.patch</a> =
\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-5992-4.patch">file://CVE-2023-5992-4.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-5992-5.patch">file://CVE-2023-5992-5.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-5992-6.patch">file://CVE-2023-5992-6.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-5992-7.patch">file://CVE-2023-5992-7.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-5992-8.patch">file://CVE-2023-5992-8.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;<br>
&gt;&nbsp;&nbsp; # CVE-2021-34193 is a duplicate CVE covering the 5 individ=
ual<br>
&gt; --<br>
&gt; 2.25.1<br>
&gt;<br>
&gt; This message contains information that may be privileged or confidenti=
al and is the property of the KPIT Technologies Ltd. It is intended only fo=
r the person to whom it is addressed. If you are not the intended recipient=
, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#111517): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/111517">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-devel%2Fmessage%2F111517&amp;data=3D05%7=
C02%7Cnikhil.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C638585474039237193%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C=
%7C&amp;sdata=3DDpmk904PdFG8SH3lmX5K6dRYq7VW05HT3gS2EiKyV6k%3D&amp;reserved=
=3D0</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10774704=
6/3616698">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fmt%2F107747046%2F3616698&amp;data=3D05%7C02%7Cnikhil.r%40=
kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff6150285=
5c7%7C0%7C0%7C638585474039241914%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sdata=3Da=
%2BwjwsdbfBw7ErUZ%2BpfPRc9JPohOt8bo2Jp8u9Pk%2F0U%3D&amp;reserved=3D0</a><br=
>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
penembedded.org%2Fg%2Fopenembedded-devel%2Funsub&amp;data=3D05%7C02%7Cnikhi=
l.r%40kpit.com%7Cd9110059b80b43d4c12b08dcb61aeea5%7C3539451eb46e4a26a242ff6=
1502855c7%7C0%7C0%7C638585474039245923%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4w=
LjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C0%7C%7C%7C&amp;sda=
ta=3DgolzqP%2B8HMS31xZjFqSIsboU4rf1nTAatBUBp3KaDT4%3D&amp;reserved=3D0</a>
 [akuster808@gmail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
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

--_000_MAZPR01MB8950C73EC4B4044CAD8863F0EEBF2MAZPR01MB8950INDP_--

