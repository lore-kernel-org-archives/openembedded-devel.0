Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C67FCE077
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 13:19:20 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69608.1772111958679167472
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Feb 2026 05:19:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=dp+IGB+Y;
 spf=pass (domain: siemens.com, ip: 52.101.66.16, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCLV84Ms6sXTFu1264hthQPcGRrwWfceHN5jd0RNjywFZfdE2FbEOvAwGR9S6LKd6/RX8p7s9oDhhFHTdQy7GX2bLHlTzd/HsM90EU7Mh/rWo9QBgRzWKDTw9Y0jWJQzR/iSOz+emPjs2PqnllZGjk+4o6qjEb27ByxLVlWg/NTEL+Yv96u4DAB79oQziBvgLX2Le2tILxh6l8vE54um4q7IYDsBwEyWxGbMyIHA98hoRkKeQ7/97p3CMuec3q3QJzDz7Ziuwsxz1zo3x4fphYZ+oUxn//+ls0vYVNr0gb4L7rvmIggUxkyKW+OeEusHhKRxCbQRPeMUNsCVaD1YNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gIAnOBwZ2o/PXu7kJ3yxCnZnfVWhFP+NEM9wNE5W5sY=;
 b=JapyeUQWvVjIDWzFmaO374FdtHHVx14kQohTdE8upnSd/fXSBX2qCD7g3IM2m/CshZgnWehoTt97IdKtj/uDvfr4IJMpAlkU1R0+Qzhx0xkVhnBn9EK/0oyT3JTF8vMkG1KFq4K2khJvNJNy5aKLrKfT8mt6Q6T+w3YAR81I6TLHfLpcHC7ZpIcAsRlv1o02ML4ZB0ZqTlv5NVZFyXPIB1MhjaRj8zs/4Xg0pyMxaAMWRDmzqeyDskfQXz/tku8VHA1W8OTUsTe69gVLUsR+kSFgSGpMxFrfxYJgIKGFw/3V3O868KAvq98wG+QLqsho6bPPjlG50aOymXFJ4MG7aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIAnOBwZ2o/PXu7kJ3yxCnZnfVWhFP+NEM9wNE5W5sY=;
 b=dp+IGB+YJ1wNONt3xS8cOawB4D5axT3aHBM4GKXfmvrH/8bRaKQ3ojzXnKnHGlelpj/LBkkEThClJRzdcRul7g2+YeQQnrxQL1ww8sXzfYEBv8/oHlFCCbNt67xApskp0x0aozZ/8fLucRY7JkcrKGbvZShCLK3ouWx4rWQ4EOOShE36yolsvOZo/VpsGv93nrda5VhbvR4f/IScjLHN90Q0fsrsKsWwz8zgGH6qBddJAKqo7wQm8odXItcq5e1hGbQgGRDgzlOPxXoM0p2uHckFdKHLKpkHVj+LjRTxCqzOBEeUUpdu+6UWMkqkcrNl/Mf5oaw6OoZWe31qq7+9Iw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB7136.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:61c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 26 Feb
 2026 13:19:14 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%6]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 13:19:13 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "hetpat@cisco.com" <hetpat@cisco.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>,
	"vchavda@cisco.com" <vchavda@cisco.com>
Subject: RE: [oe] [meta-oe] [PATCH v1] googletest: Add CVE_PRODUCT to support
 product name
Thread-Topic: [oe] [meta-oe] [PATCH v1] googletest: Add CVE_PRODUCT to support
 product name
Thread-Index: AQHcpx6b+7Sg8ABc2EC8K94VN/Q6c7WU9jXg
Date: Thu, 26 Feb 2026 13:19:13 +0000
Message-ID: 
 <AS1PR10MB5697535CC7E3B36DD10036D0FD72A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260226125105.47526-1-hetpat@cisco.com>
 <20260226125105.47526-4-hetpat@cisco.com>
In-Reply-To: <20260226125105.47526-4-hetpat@cisco.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=4baa0f61-104f-46fb-980e-28a108c2e7c2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-02-26T13:17:14Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB7136:EE_
x-ms-office365-filtering-correlation-id: 1015bd2c-f096-404c-b8d3-08de7539a2dd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 HBEIkFDSu7FjW6boOHG1kl1nAzoLtAweDumOLxYwDd5k7MM/LCSwSD8LbmdoUfbNMBcYyRiiYFO0yZmRKgSP+7DWpCRwOW6e0KqIBxoCaS459OWzPcQJNGHBGPGy59VDJ80eF8/FOMaPD/4+3knW9s8yUTEC5F3+40E9cPyhA5sqXsmIRsmEyX2IEv54aN4IgTm56eLRPkBkzyZHbZMvjSWgJ/30wH9mvfVRkuJVYP3l865BBFouCFK22aCwBYsL13kIQdRsoND5i/VLO2jJakb+fxqf5d1b/7sYfwtBQ4u0fXDjyFfFNEpDYjVqZi87+WSJVIsNp7jjNrwbWjUd6Wqh5Q1g3LXLuJ04G9m67uT0AuvIWNGt76wFBEk3xRi9RlUl0bjqB0LAbeXJ2lPFwEUQ6eysfZDCIqXGySj+YDHTRfirDL1GWCuhGhVfJxVLbORl/MWgiDO5w3oa5cIctGZnt+fFEvnW1GzqMq+/G8FPTZnrfzwCj4BdXrghvXz57RJKJ9g+MkBFFf5SmNH8P8DP3Z6n5cT3V6Ll6pUVkXpsE8SiTqJafW5izg9iTHWG1McHtwG8liMy8qDHYrOa8XHwoUnVkjYsS+cbQLH4ndm6Zj9avQp1i+Bc9iszsZrGaBYAELeYz+FYmpFX6qCHeoSqqwLN9N5m8WAKlY95GELYGd47yZ8gnrKE60lnst4FAMAp8KIs7iFE99YOnSD+sERRIlYURwyGosGMvVhmtUI3lKMwbRhWGGQzMqMqYS/gl15KvsS8iTU848IDG6HunfCKYtdl5OrICIZn6wpaEPI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?SnpqaFcNzIT0MQkuheNAfEZhJF/iiZ8ct3Ay3Ie6hWIkauRbpZqJ8gd2kLKy?=
 =?us-ascii?Q?sM9JOM3ShNy5If+fy5iOLCFMNWCwIbqNqpMU2sd3AuRwWw0K7GnD0yzISgaQ?=
 =?us-ascii?Q?zCMAZJhj4GSy58hcysd4a5lm7TBXLJuFp+LcHJy7IDm22fUkSrgfz0189++u?=
 =?us-ascii?Q?yc5Ofm3T5BXndMsgXPfM2I0ghVuECwgW30Bw85uNCJYnlD/igGOPw7fNm5MZ?=
 =?us-ascii?Q?uPv/aj6qQA1M/LlhqtsHWiwzpHxIYvVP42QAA7FnlYBBlQpk4V/x5JvFzYFt?=
 =?us-ascii?Q?vsx3cu+GS0P6v3aFyDq+MqvOQ9zstYY0SOoTfOaONmfybGpvLNLtTOIg+FPK?=
 =?us-ascii?Q?HccTie/WdYGOXNAksTcPNQI+PNwgtV8N3ShRSvYiA2VtEFReVKu0Muq4/Itv?=
 =?us-ascii?Q?MpftuKK5f6AwPD0jYJDxr8uBBHAq1YscYc9Ang/DrXaJJws5nHvTEhbPinW4?=
 =?us-ascii?Q?ZlteXYYoziT3s8sc6erPcb1+hNmMkuzuHQNp9tBsWlvhU+s9t1UuXucwZvAN?=
 =?us-ascii?Q?0FSXwKvGUSYSmuibUhZlYX4EhovwRADcNXzFUQEtuqo02lWUuqzI+m6+e42s?=
 =?us-ascii?Q?dVtBglXmfGbxXfSFSz8fm6KO6VPqkOKptZg7Z1Acnmu57Wu9wU7zdnlq60x0?=
 =?us-ascii?Q?JHrA25mx2c03Fa6C6eOqdVX+6xvRlum3yOEDOMATlOxH/XlyGNboMsrqIuLw?=
 =?us-ascii?Q?Yj6V2xcWzWze6Kgb85AIv9h5yFBIadrbYbrksxEjuoXzBewD0H1++nOYS1z5?=
 =?us-ascii?Q?RW3Mj1lFdYBj9Dmpceo6Q57YhlkZCV4Sb/E64nXlz/xvSgIKy1J6Y2wj3drp?=
 =?us-ascii?Q?bWQ7NrMdutgUZ+ADpW9hPKQQyiXAqV1M7eM9KmdhxMVWkziWBB/E1bH6pUyf?=
 =?us-ascii?Q?kwAfCIZ/G1kwEf4QSwRT/FmZQ69lnorh8zPiuFg8asmRJoh800z8UcqMW7u1?=
 =?us-ascii?Q?Zm5ZFKyV0msqaRmTSy0cdD5hYu6hpyC9qXL8cdt4tybzRzxg9RA6EbrwR0ZV?=
 =?us-ascii?Q?sS14LpMFGMM9Br9Mh5r5XC/mDZlNOYanu2WBuac6EhuYJZUxo08bkVC7Yf6j?=
 =?us-ascii?Q?iV3ZOVs0zpzPyRVjRmSJhs7DvCFBhJsaYOs5ZgksI+iaLVjN29MueIoOxXM6?=
 =?us-ascii?Q?4wa0+bxMKUGuegLxel+qD8RRLBOkiEacqbZ6Ciw77+LFxCBmrc2y0Zwrp8l6?=
 =?us-ascii?Q?OcGPCs1uWwt4efXorka52ZDarQiQS6V4fZyxHttzV6ADQn8zSWQeXMIb16Nv?=
 =?us-ascii?Q?a+X9BsblEaS6VYjdawJGoGgPg1BmCNBkfxSJTMv8uY+ZB+K01f2qDkcrCPt2?=
 =?us-ascii?Q?i9rCGMToACzvIPUZoBHxjFPHh/PBK9xijFCgblRsBuU5yEvwsIr5gTd5+Yc6?=
 =?us-ascii?Q?a8NZHhGP4/7suH5bGHA04CQjN/O4miyKZq9T8QZJhJdXJ1SIkDRMmDdO2RG1?=
 =?us-ascii?Q?dtNCifOZPw6R7X4hKgLHRukfJ0mOASqB3bugP1C5YR5ocL7QvLVC+fS1ETga?=
 =?us-ascii?Q?a7HjTK+77xmkDuDGc3BTjP4WKeZPyccSwbzE16UxS0LYMxMaZNIsDD5yQrYo?=
 =?us-ascii?Q?mrXXbYo9RJ/8nJbCH+0yv0SrYSScQi+7M2ES4twNQX47pS2ehapo2kxqoV9R?=
 =?us-ascii?Q?0C3T1DmyAglv+7M/Mfel8BmZXNiHY0uahu/VNAc9nJHWNZoUT8Jcy+76UUND?=
 =?us-ascii?Q?MnlcHqZsVXye8eeEP4MnhK+UUkbwHT4IFf8yhLwjEsSLfJExWwd3NW5UkNms?=
 =?us-ascii?Q?jadRTLT2IQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1015bd2c-f096-404c-b8d3-08de7539a2dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2026 13:19:13.7469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ldlDzGxKIj6A5Hh4M5l/tqadW/3b62WVjjxvgjiv4VloIcv8MOrxVRQqZy16Sj4IIaSt9WDL6QAfl/DBavr2Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7136
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Feb 2026 13:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124677



> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org <openembedded-
> devel@lists.openembedded.org> On Behalf Of Het Patel via
> lists.openembedded.org
> Sent: Thursday, February 26, 2026 13:51
> To: openembedded-devel@lists.openembedded.org
> Cc: xe-linux-external@cisco.com; vchavda@cisco.com
> Subject: [oe] [meta-oe] [PATCH v1] googletest: Add CVE_PRODUCT to support
> product name
>=20
> From: Het Patel <hetpat@cisco.com>
>=20
> - Set CVE_PRODUCT to align with the NVD CPE and ensure correct CVE
> reporting.
>=20
> Signed-off-by: Het Patel <hetpat@cisco.com>
> ---
>  meta-oe/recipes-test/googletest/googletest_1.17.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-oe/recipes-test/googletest/googletest_1.17.0.bb b/meta-
> oe/recipes-test/googletest/googletest_1.17.0.bb
> index c8ed80053d..242f0ac7da 100644
> --- a/meta-oe/recipes-test/googletest/googletest_1.17.0.bb
> +++ b/meta-oe/recipes-test/googletest/googletest_1.17.0.bb
> @@ -35,3 +35,6 @@ do_configure:prepend() {
>      # there isn't python in HOSTTOOLS so "env python" fails
>      sed -i 's@^#!/usr/bin/env python$@#!/usr/bin/env python3@g'
> ${S}/googlemock/test/*py ${S}/googletest/test/*py
>  }
> +
> +# Add CVE_PRODUCT to match the NVD CPE product name
> +CVE_PRODUCT =3D "google:google_test"

Where is this CPE coming from?
Afaik there is no CVE for googletest to look at used CPEs.
Please add reference to the commit message.

