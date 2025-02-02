Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D61C0218F
	for <webhook@archiver.kernel.org>; Sun,  2 Feb 2025 21:46:45 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.66])
 by mx.groups.io with SMTP id smtpd.web11.74086.1738532799656580315
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 13:46:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=V5oDyz86;
 spf=pass (domain: siemens.com, ip: 40.107.159.66, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgM0RgsxXEHPLx5g9Q+AuGbv46dSF35thX7YRaoyJTdXvFJlzXpcDet8KXWMxeihAUdpoHg/I2mQq/o+0OpkHWxqZWEuR8GuX6lSFcqFDnPEQZ9SwNWhoeVvzUc+P6R6gO/HXEPjPJZUgW1eLwo+tqux9gc1tp3LMOGjLzBWkIBusmssz/oaaC20zEjL2rM60oNJVwQZf5sfPuqb0Iz4b2W1y1KsFEWmabWMtI8gxHJ1AS1gcip7spEGFBRRjyJZDRPXBYTeHqjoftg8vIqqqo/nR0saLzgXGXNkRJ0zavpXuqfDZ+sFDBaZXlq45rFa6NypXw0AJc0n4FNsodtjFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UuonusZiszKyThjoXRfRatVkOlJVzReWGn8Hnh8O1rc=;
 b=YOQ5TXj9wdFZML/ne22FjWEdJk9m4UQ7pgdjURNwZQrR1x0JyrtldlTw2W9Oh4zVTCyNeaKzsl/LNL3vkUtXjdUrgBXdfpyVjiNocf3YqQcWPGEdDPRPE+vyg0hYkyO8L3L0kRnDysFJ8BV2Gn2g5cK9+/PRoz0/bhguaEBLZV7Mp95/yBinLkajJxR9BMuesc5wWdMeLNpF5kUtajeFE8sTbs0tVNANJjJMUvz/PeWodpdZ13TlS1dSVzdImIsmanYcEPyN1DgbvMU8FccOW7r1lRc6I7PGOLwHRBID/nJIcUjAMikuxweJD4A0vIhlNxuoRQO6x1fpfNulxfn2Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UuonusZiszKyThjoXRfRatVkOlJVzReWGn8Hnh8O1rc=;
 b=V5oDyz86GlKp218fveO2l0aDM2QnIMrfvW5oievAGc80xxSQpMefsk+vJZmyNfR43OCLQFFvdE7n+tRtjmQSZlGj01C9rd2srHe5QMJoRnvzcM4pUgQqrIQNx1IZUnakib0b/d8wPOMrxe6RcOdf69KPu93w87DA+7gJXJw7UBXHXk0kHF1xwvTfIEo9XSt8dSotbVBkz3W7hgmtj2dI4UsjlzpQYZ+v8begBjdDyoNuhqCTCGuOvIZy6SamrT621hse/XRnBtb3obu6Gsc9t609NcFVhFLRiEvQFyNAWGNBYyN8ZQGEP1KPWqkrK/op1plbM/hZo65A7FTth8IEgg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB6174.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:54b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.8; Sun, 2 Feb
 2025 21:46:33 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8422.005; Sun, 2 Feb 2025
 21:46:33 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Christian Eggers <ceggers@arri.de>, "peter.kjellerstedt@axis.com"
	<peter.kjellerstedt@axis.com>, Yi Zhao <yi.zhao@windriver.com>, Yi Zhao
	<yi.zhao@eng.windriver.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "Qi.Chen@windriver.com"
	<Qi.Chen@windriver.com>
Subject: RE: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
Thread-Topic: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPENDS
Thread-Index: 
 AQHbDMIt3bntBRVM80a3hbvtyvq5VrJlvNcAgAILqACAChDZAIAACeFQgGD7WmKAAIcJgIAAASPAgAAClICAYfTCQA==
Date: Sun, 2 Feb 2025 21:46:33 +0000
Message-ID: 
 <AS1PR10MB5697AA3044A3C1B61426B039FDEA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240922073618.1359707-1-yi.zhao@windriver.com>
 <2746495.vuYhMxLoTh@n9w6sw14>
 <PA4PR10MB5707F3BA475C5BF809C08D34FD352@PA4PR10MB5707.EURPRD10.PROD.OUTLOOK.COM>
 <2168139.9o76ZdvQCi@n9w6sw14>
In-Reply-To: <2168139.9o76ZdvQCi@n9w6sw14>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=2806f1b3-2acb-4c6a-8825-30fa32351ec5;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-02-02T21:45:39Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB6174:EE_
x-ms-office365-filtering-correlation-id: 28f36a94-8026-449e-67cc-08dd43d30f52
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|13003099007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?2K5rgB/7l/ieEoMxwUgWBPD5NPYUaLRx5pxF+gnBj8wwMyuQPYr3URm0ognC?=
 =?us-ascii?Q?zvt06YdfOHpNrkmYyZLX4+kzLUF4QEFDSNq2iayPez5n8DFV97ojbHa225Ap?=
 =?us-ascii?Q?FOjbKuqYYyjVFPMVNMwdWOPnHRsx1J7dugcKHEZnHfj1qaaZFcvqVqJBI2Ll?=
 =?us-ascii?Q?Ios2X9LwPz2go6MXyvfQJq+3tl7qnJs2PHfyihlIFrvz/VHZsHSlg2Pki46F?=
 =?us-ascii?Q?mZUCI2ZJVqo1EZ8u8wkrpdqQIWNs3xw4PTOioazxOacCDBuSoltO4SWt34Bk?=
 =?us-ascii?Q?vqdtlSw/Sj2XMhUckeK7VHqoxRS0Y30ZNHI+ZAv+1sITbwWPaoER2sdzwX1m?=
 =?us-ascii?Q?s67L2IKC+LkNEMVVl5FZFQw2x8oQpUCo6yXQLnRjMasDO2duBGbf7NSvDQlL?=
 =?us-ascii?Q?B4xopuSReeXd0eL1azjon0mx/GYIo/uLzSJkKJOh6Itk1LU96xQwbAZahWCF?=
 =?us-ascii?Q?o509owIF31QCK4KD9MMlQukhxHBEW6n6V8f8EeYoJyId4aSuhISJXSlmaVzT?=
 =?us-ascii?Q?btZHp4d+MUSQ7loqjYJIepI6pAcYwwvTjrvmywI7WgSvHEa/JkhwIFoBzGW5?=
 =?us-ascii?Q?0Q3W3YK30NonawqME/ykS0VJkAYfFHJ868SLI0eTlExhbgH2FhLiDf1eLt8j?=
 =?us-ascii?Q?3QiPI8soj35/d6drKZ0pUs4Zlx0EML2R3uAXhfa7Q1zX8JJFIpiUGSkOdv47?=
 =?us-ascii?Q?PkkKmgULYdqzoTZ2slycy6hmNFnDycy9AbTrxnqbJuEJGK8HoexQqc3/OwSX?=
 =?us-ascii?Q?PT9eg5G8lD/2SsDiXSiX4TnXjiz8Wtn+KBwrC9l0LZDPGUpNiBF1TYiKGKu5?=
 =?us-ascii?Q?6bTO7nNm4+FMRJeJ0zqOu0G08p8lQfMKucm0UxNC7BlU34ECfY9pAcKmgDOM?=
 =?us-ascii?Q?2aDyX0dQkcFJz/CdEEYQQHABSFJfj5xujkpCsIYPN9aZXPcPw0DMoB25qUMc?=
 =?us-ascii?Q?/DPiSrXz0gm/xDIbmEeLV53LxpGzBGZqnwzSNehjdNya4FZy79Tz0RV6ZVAV?=
 =?us-ascii?Q?1AjzgX71Dx9wlbJMFcspP+2n700uTNoqPn1rbkGoMJf7Rxt0G+sUCr4KO5Po?=
 =?us-ascii?Q?7YK5AaBRGwJMGFH28xxW7AX36osSKd16brSImlpCm2K5RWbQqr9WA3Z2hP+r?=
 =?us-ascii?Q?A9B/+zB4wYS3XBkLkUm3P5mKSyzw6SluKCs/t5fQduh4l0HKMa7IkXYD53BM?=
 =?us-ascii?Q?ul3UY7cuszaMWNyzei6JpBp8vAQZX8ldpaI+5Rl52sdEFhkRhKEyEIdR93x2?=
 =?us-ascii?Q?jV5WmFCDhX5+jJRe4AiBkYSlgHLppv6UQzAhLxPCEuLx6kOBELKifF3AR5+y?=
 =?us-ascii?Q?BHE6yKmrF3r3CGQbeEG3eQImGhuqtWmjjOsGnaI2/Uk1gi9KWu2RChowcjl9?=
 =?us-ascii?Q?RuZmRcjON8C0N71WoLxjS06tatfc?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?hrmIFaQmZ1FAdvqUhalY24yERssWk2oIzDRzKMLBj1TxQjkycZnUB5AontSO?=
 =?us-ascii?Q?khY5a7hHk7XIW1QlqWKqLgxYjW0NZQ2NLyPe7kAdeUmcF6b1NRdWcOvXvx4V?=
 =?us-ascii?Q?QBqm2aG48kA5QPtOso/N2DCUIrI/8zSzfRH4qogxQnJZacTbnuWeByirKOuR?=
 =?us-ascii?Q?JaojE9r8QRrsac3pg+I2Z3ZsqeWWfCQ2bFDAYcKgQigcPEoUNZVSTzukNJBS?=
 =?us-ascii?Q?ZrZvvLRFmhYQ26tcR4/VWDmlWLGLpLvi2d8nvjK0ttIchABe6fg3HVYIXrs/?=
 =?us-ascii?Q?Li1SB7hwSs/kI/e1+kytUwSEGUvwQKp6oLKhoco5dcn+z/YPN49NZo6GMwmI?=
 =?us-ascii?Q?efUyZyi0opId8S6wUr47BbmDgb4m2+52ucVU4Z167D1k6nVsoPgFW7l+shaR?=
 =?us-ascii?Q?KTluyzPGftGdiIhadOF3e1omLwVGSMUFoqDA09ztUB7IL/5UA/4CpqekrYmF?=
 =?us-ascii?Q?/RmQbEpw2IqMyVcCD5RLfgcmoAg/ERbLuleIqbdEQoL1D7fGgMRvIoI07wjb?=
 =?us-ascii?Q?b/HRLr/gk4lNQwZz68j2chHoTnHSBhMcLtRQVKX2d3Fyk2Te4yWV0UsejaT+?=
 =?us-ascii?Q?56KIsA3DrlMoOelfyw8g+YwB1rLOziYgWYHwffJZkwEJmpID/Z6cZ26VjedW?=
 =?us-ascii?Q?dheLlvlCiRslU6XIwL/8WSVBuubusGsv1mf0EA3hcxIJdBuau0dcVsjOcdXP?=
 =?us-ascii?Q?/gHOy7eqclpWBkQGEHtKMhZDWDnMWZUD33I3XAZIF9NngsHpX2unbK136loS?=
 =?us-ascii?Q?k8q7oBDPfFZ4uDOUTyQ7cZV3Rny0LonL8WERnHuQ2Pl2V2R5Eq6Bw14ymed/?=
 =?us-ascii?Q?NhyH9jowVuSPyvEcVh+vS9C+SEvD0utlMlc637ODdch0EyV3PX+F0DMgvofs?=
 =?us-ascii?Q?UTEIoDSdXD0hba91Ke7f+76sBE+RUtH00BzsRJ15eBch5r14aKjoFtkcn/3D?=
 =?us-ascii?Q?A8yvSAke682U/bDIo3ZENRI0+aPiNk53NqzzVhgj5+9oEx5N0hOirF9X/wbp?=
 =?us-ascii?Q?kQjuL5OZzDunzLj6F34n+clNHla1tqNlLgJFKcnRSXzwyE+WXsvKh55IcmHZ?=
 =?us-ascii?Q?695Gma/pjY9kt3qQ6a/H1ZrsCZWeQkAuoVlkwKhbDuueNzBRRJXpAlGjUYrx?=
 =?us-ascii?Q?6YYE9AuV9S+DBxBdv77fey6F3ncw4zB0K18o5/R3Q8SY402vhIS9KpibvTV7?=
 =?us-ascii?Q?W4X1MHj9H1AfpaH+eau3G0UNcZe9N0L2BblepscekuNGZdvn3ynRJYNY59he?=
 =?us-ascii?Q?E49aPYWSritcmIn/OHVsSPXqyL6TasiY5+lF6UkM8YNcsgOWBl5vAxJ/Hdu4?=
 =?us-ascii?Q?db0sCkMjD+pRTuKAi7JfO6RGkVxSWDJoolijw/f3Px59NzNMBJnOFbigPk5s?=
 =?us-ascii?Q?y7YzwbZneRFFxwFoz5jvxGAMp8qSePY+3mRjK+e/FAl9uLzMtNEOPtL+adYF?=
 =?us-ascii?Q?gG9WKgy+n89VoUYd+TAJ/Zy64J1s49Z4mMjHbZJLMQ90I4eWAAi7Amvpftio?=
 =?us-ascii?Q?6VSelvwRbPDUG6AqMzTjYBD9MXzEOVR+aln/K81vklUGnclUpVTNDhsljnyU?=
 =?us-ascii?Q?tmukOXLYplC82/0OquG5upwG7CGrsEDvdjw4MHiW?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f36a94-8026-449e-67cc-08dd43d30f52
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2025 21:46:33.0567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lEmL6jcXQy8m1bQJ9BGHc0U9d/hbLmK4cXfvKOIzly/bhMOrenhD2y/o45GXCC3EMNBUmZ8SIjP9kJpZxMHXYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6174
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 21:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115228

I have now sent revert as part of a larger refactoring of protobuf recipes.
https://lists.openembedded.org/g/openembedded-devel/message/115221

Peter

> -----Original Message-----
> From: Christian Eggers <ceggers@arri.de>
> Sent: Monday, December 2, 2024 14:52
> To: peter.kjellerstedt@axis.com; Yi Zhao <yi.zhao@windriver.com>; Yi Zhao
> <yi.zhao@eng.windriver.com>; openembedded-devel@lists.openembedded.org;
> Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-devel@lists.openembedded.org; Qi.Chen@windriver.com
> Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to RDEPEN=
DS
>=20
> Hi Peter,
>=20
> On Monday, 2 December 2024, 14:48:43 CET, Marko, Peter wrote:
> > Hello,
> >
> > > -----Original Message-----
> > > From: Christian Eggers <ceggers@arri.de>
> > > Sent: Monday, December 2, 2024 14:39
> > > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> > > peter.kjellerstedt@axis.com; Yi Zhao <yi.zhao@windriver.com>; Yi Zhao
> > > <yi.zhao@eng.windriver.com>; openembedded-
> > > devel@lists.openembedded.org
> > > Cc: openembedded-devel@lists.openembedded.org; Qi.Chen@windriver.com
> > > Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp to
> > > RDEPENDS
> > >
> > > Hi Qi,
> > >
> > > On Monday, 2 December 2024, 06:35:22 CET, Chen Qi via
> > > lists.openembedded.org wrote:
> > > > Before we rework the abseil-cpp and protobuf recipes, a possible
> > > > improvement for this patch is that we list the needed libraries in
> > > > RDEPENDS manually.
> > >
> > > my main concern was (as you already may have guessed) not having the =
full
> > > set of
> > > absl libraries in my rootfs, as only some of them are required.  But =
I cannot tell
> > > which is the best option to achieve this.
> >
> > If you want full abseil-cpp in your rootfs, please use IMAGE_INSTALL fo=
r that.
> > Packages should pull only their real dependencies, not something you ne=
ed for
> other reasons.
> > You use-case seems to be to develop application with abseil-cpp library=
 but not
> installing it explicitly.
> > SDK images need to install (or depend on) additional packages compared =
to
> release images.
> sorry, but I meant it the other way around:
>=20
> "I do not like having the full set of abseil-cpp libraries in my rootfs o=
nly because
> I use protobuf in my application".
>=20
> Sorry for the confusion.
>=20
> regards,
> Christian
>=20
>=20
> >
> > Peter
> >
> > >
> > > regards,
> > > Christian
> > >
> > > >
> > > > Regards,
> > > > Qi
> > > >
> > > > On 12/2/24 13:21, Chen Qi via lists.openembedded.org wrote:
> > > > > I'll explain in more details what the problem is and why this pat=
ch is
> > > > > correct, given the current status of abseil-cpp recipe.
> > > > >
> > > > > In protobuf's abseil-cpp.cmake file, there's a hardcoded list of =
absl
> > > > > targets used by protobuf:
> > > > > https://github.com/protocolbuffers/protobuf/blob/main/cmake/absei=
l-
> > > cpp.cmake#L56
> > > > >
> > > > >
> > > > > This value in turn is parsed and used to replace the
> > > > > @_protobuf_PC_REQUIRES@ in protobuf.pc.cmake.
> > > > >
> > > > > Here's the generated probobuf.pc file's contents:
> > > > > """
> > > > > $ cat  ../build/protobuf.pc
> > > > > prefix=3D/usr
> > > > > exec_prefix=3D/usr
> > > > > libdir=3D/usr/lib64
> > > > > includedir=3D/usr/include
> > > > >
> > > > > Name: Protocol Buffers
> > > > > Description: Google's Data Interchange Format
> > > > > Version: 25.3.0
> > > > > Requires: absl_absl_check absl_absl_log absl_algorithm absl_base
> > > > > absl_bind_front absl_bits absl_btree absl_cleanup absl_cord
> > > > > absl_core_headers absl_debugging absl_die_if_null
> > > > > absl_dynamic_annotations absl_flags absl_flat_hash_map
> > > > > absl_flat_hash_set absl_function_ref absl_hash absl_layout
> > > > > absl_log_initialize absl_log_severity absl_memory absl_node_hash_=
map
> > > > > absl_node_hash_set absl_optional absl_span absl_status absl_statu=
sor
> > > > > absl_strings absl_synchronization absl_time absl_type_traits
> > > > > absl_utility absl_variant utf8_range
> > > > > Libs: -L${libdir} -lprotobuf
> > > > > Cflags: -I${includedir} -DPROTOBUF_USE_DLLS
> > > > > Conflicts: protobuf-lite
> > > > > """
> > > > >
> > > > > Let me use "absl_hash" and "absl_absl_log" in the above list as e=
xamples.
> > > > >
> > > > > """
> > > > > $ find ../../../abseil-cpp/20240116.2/packa
> > > > > ges-split/ -name "libabsl_hash.so.*"
> > > > > ../../../abseil-cpp/20240116.2/packages-split/libabsl-
> > > hash/usr/lib64/libabsl_hash.so.2401.0.0
> > > > >
> > > > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> > > dbg/usr/lib64/.debug/libabsl_hash.so.2401.0.0
> > > > >
> > > > > $ find ../../../abseil-cpp/20240116.2/packa
> > > > > ges-split/ -name "libabsl_absl_log.so.*"
> > > > > $
> > > > > """
> > > > >
> > > > > See? The current package splitting of abseil-cpp does not match w=
hat
> > > > > protobuf assumes. And I thinks protobuf's assumption is correct,
> > > > > because there's really a absl_absl_log.pc file generated by absei=
l-cpp.
> > > > >
> > > > > And there's the contents and location of absl_absl_log.pc:
> > > > > """
> > > > > $ cat
> > > > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> > > dev/usr/lib64/pkgconfig/absl_absl_log.pc
> > > > > prefix=3D/usr
> > > > > exec_prefix=3D${prefix}
> > > > > libdir=3D/usr/lib64
> > > > > includedir=3D/usr/include
> > > > >
> > > > > Name: absl_absl_log
> > > > > Description: Abseil absl_log library
> > > > > URL: https://abseil.io/
> > > > > Version: 20240116
> > > > > Requires: absl_log_internal_log_impl =3D 20240116
> > > > > Libs: -L${libdir}
> > > > > Cflags: -I${includedir} -DNOMINMAX
> > > > > """
> > > > >
> > > > > And there's the contents for the absl_log_internal_log_impl:
> > > > > """
> > > > > $ cat ../../../abseil-cpp/20240116.2/packag
> > > > > es-split/abseil-cpp-dev/usr/lib64/pkgconfig/absl_log_internal_log=
_impl.pc
> > > > > prefix=3D/usr
> > > > > exec_prefix=3D${prefix}
> > > > > libdir=3D/usr/lib64
> > > > > includedir=3D/usr/include
> > > > >
> > > > > Name: absl_log_internal_log_impl
> > > > > Description: Abseil log_internal_log_impl library
> > > > > URL: https://abseil.io/
> > > > > Version: 20240116
> > > > > Requires: absl_log_internal_conditions =3D 20240116,
> > > > > absl_log_internal_message =3D 20240116, absl_log_internal_strip =
=3D
> > > > > 20240116, absl_absl_vlog_is_on =3D 20240116
> > > > > Libs: -L${libdir}
> > > > > Cflags: -I${includedir} -DNOMINMAX
> > > > > """
> > > > >
> > > > > We can then find the absl_log_internal_conditions library:
> > > > > """
> > > > > $ find ../../../abseil-cpp/20240116.2/packages-split/ -name
> > > > > "*absl_log_internal_message*"
> > > > > ../../../abseil-cpp/20240116.2/packages-split/libabsl-log-interna=
l-
> > > message/usr/lib64/libabsl_log_internal_message.so.2401.0.0
> > > > >
> > > > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> > > dev/usr/lib64/libabsl_log_internal_message.so
> > > > >
> > > > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> > > dev/usr/lib64/pkgconfig/absl_log_internal_message.pc
> > > > >
> > > > > ../../../abseil-cpp/20240116.2/packages-split/abseil-cpp-
> > > dbg/usr/lib64/.debug/libabsl_log_internal_message.so.2401.0.0
> > > > >
> > > > > """
> > > > >
> > > > > What does all above mean? It means that abseil-cpp is not splitte=
d
> > > > > reasonably. This could be proven by the absl_absl_log.pc file as
> > > > > described above.
> > > > >
> > > > > So, given the current situation of abseil-cpp, Yi's solution is
> > > > > correct. Before abseil-cpp is re-splitted according to its pc fil=
es,
> > > > > which then could possibly lead to automatic parsing of the protob=
uf.pc
> > > > > file to add extra RDEPENDS automatically in protobuf recipe, we n=
eed
> > > > > to have Yi's solution. And we need to use RDEEPNDS instead of
> > > > > RRECOMMENDS (see the 'Requires' directive in corresponding .pc fi=
les).
> > > > >
> > > > > Regards,
> > > > > Qi
> > > > >
> > > > > On 10/1/24 20:42, Peter Marko via lists.openembedded.org wrote:
> > > > >>> -----Original Message-----
> > > > >>> From: openembedded-devel@lists.openembedded.org
> > > <openembedded-
> > > > >>> devel@lists.openembedded.org> On Behalf Of Peter Kjellerstedt v=
ia
> > > > >>> lists.openembedded.org
> > > > >>> Sent: Tuesday, October 1, 2024 14:00
> > > > >>> To: Yi Zhao <yi.zhao@windriver.com>; Yi Zhao
> > > > >>> <yi.zhao@eng.windriver.com>
> > > > >>> Cc: openembedded-devel@lists.openembedded.org
> > > > >>> Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp=
 to
> > > > >>> RDEPENDS
> > > > >>>
> > > > >>>> -----Original Message-----
> > > > >>>> From: Yi Zhao <yi.zhao@windriver.com>
> > > > >>>> Sent: den 25 september 2024 04:17
> > > > >>>> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Yi Zhao
> > > > >>> <yi.zhao@eng.windriver.com>
> > > > >>>> Cc: openembedded-devel@lists.openembedded.org
> > > > >>>> Subject: Re: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cp=
p to
> > > > >>> RDEPENDS
> > > > >>>>
> > > > >>>> On 9/24/24 03:02, Peter Kjellerstedt wrote:
> > > > >>>>>> -----Original Message-----
> > > > >>>>>> From: openembedded-devel@lists.openembedded.org
> > > <openembedded-
> > > > >>> devel@lists.openembedded.org> On Behalf Of Yi Zhao
> > > > >>>>>> Sent: den 22 september 2024 09:36
> > > > >>>>>> To: openembedded-devel@lists.openembedded.org
> > > > >>>>>> Subject: [oe] [meta-oe][PATCH 1/2] protobuf: add abseil-cpp =
to
> > > > >>> RDEPENDS
> > > > >>>>>> Since commit[1], the libraries of abseil-cpp have been split=
ted into
> > > > >>>>>> separate packages. When protobuf is installed into the image=
,
> > > > >>>>>> only 48
> > > > >>>>>> abseil libraries are installed as runtime dependencies. But =
the
> > > > >>>>>> output
> > > > >>>>>> of 'pkg-config --libs protobuf' lists 66 abseil-cpp librarie=
s are
> > > > >>>>>> required. Add abseil-cpp to RDEPENDS to ensure that all requ=
ired
> > > > >>>>>> abseil-cpp libraries are installed.
> > > > >>>>>>
> > > > >>>>>> [1] https://git.openembedded.org/meta-
> > > > >>>
> > > openembedded/commit/?id=3Ddd6421e65eb75c35a904f4b487ba022075035
> > > > >>> ecc
> > > > >>>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > > > >>>>>> ---
> > > > >>>>>>    meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb | 2 =
++
> > > > >>>>>>    1 file changed, 2 insertions(+)
> > > > >>>>>>
> > > > >>>>>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25=
.4.bb
> > > > >>> b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> > > > >>>>>> index cc5204de4..354b3213a 100644
> > > > >>>>>> --- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> > > > >>>>>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
> > > > >>>>>> @@ -106,6 +106,8 @@ FILES:${PN}-lite =3D "${libdir}/libproto=
buf-
> > > > >>> lite${SOLIBS}"
> > > > >>>>>>    # CMake requires protoc binary to exist in sysroot, even =
if it
> > > > >>>>>> has wrong
> > > > >>> architecture.
> > > > >>>>>>    SYSROOT_DIRS +=3D "${bindir}"
> > > > >>>>>>
> > > > >>>>>> +RDEPENDS:${PN} =3D "abseil-cpp"
> > > > >>>>>> +RDEPENDS:${PN}-lite =3D "abseil-cpp"
> > > > >>>>> This defeats the whole purpose of splitting up the abseil
> > > > >>>>> libraries. What triggered this change? Was it an actual
> > > > >>>>> runtime error, or were you only looking at the output
> > > > >>>>> from pkg-config --libs protobuf?
> > > > >>>>>
> > > > >>>>> Since the .pc files are in the protobuf-dev package, which
> > > > >>>>> depends on the abseil-cpp-dev package, all abseil libraries
> > > > >>>>> should be available if you are actually building on target
> > > > >>>>> or with an SDK.
> > > > >>>> Our customer reported this issue. Here is his description:
> > > > >>>> The abseil libraries will be included in the SDK, but not on t=
he
> > > > >>>> target.
> > > > >>>> The application is building with SDK. The yocto build is addin=
g
> > > > >>>> protobuf
> > > > >>>> to the image (no explicit abseil libraries are added). If an
> > > > >>>> application
> > > > >>>> then are built using the SDK it can not be executed on target =
as
> > > > >>>> libraries are missing.
> > > > >>> Can we at least change the dependency to a recommendation so
> > > > >>> that it can be avoided via BAD_RECOMMENDATIONS? Because as it
> > > > >>> is, it penalizes everyone that use protobuf for the case where
> > > > >>> one provides an SDK with protobuf.
> > > > >>>
> > > > >>> My suggestion would be to change it to:
> > > > >>>
> > > > >>> # Recommend abseil-cpp so that all its libraries are installed =
in case
> > > > >>> # protobuf is provided as part of an SDK. Everyone else should =
add
> > > > >>> # BAD_RECOMMENDATIONS +=3D "abseil-cpp" to their configuration.
> > > > >>> RRECOMMENDS:${PN} =3D "abseil-cpp"
> > > > >>> RRECOMMENDS:${PN}-lite =3D "abseil-cpp"
> > > > >>>
> > > > >> I think that's also not the right way to do this.
> > > > >> Adding unnecessary stuff to release images to satisfy SDK needs =
is
> > > > >> wrong.
> > > > >>
> > > > >> I also wonder if the problem is not at the SDK level.
> > > > >> If you build an sdk, there is explicitly installed package base =
and
> > > > >> additional required dependencies of those packages.
> > > > >> The dependencies may not be complete and fully usable, only thei=
r
> > > > >> parts sufficient for the explicitly installed stuff is present.
> > > > >> Are the sdk users assuming that full abseil-cpp is installed and=
 thus
> > > > >> using also parts not needed for protobuf?
> > > > >> The proper solution would be probably to include abseil-cpp
> > > > >> explicitly in SDK used in that way.
> > > > >>
> > > > >> Peter
> > > > >>
> > > > >>>> //Yi
> > > > >>>>
> > > > >>>>>>    RDEPENDS:${PN}-compiler =3D "${PN}"
> > > > >>>>>>    RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
> > > > >>>>>>    RDEPENDS:${PN}-ptest =3D "bash
> > > > >>> ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protob=
uf',
> > > > >>> '', d)}"
> > > > >>>>> //Peter
> > > > >>> //Peter
> > > > >>
> > > > >>
> > > > >>
> > > > >
> > > > >
> > > > >
> > > > >
> > > >
> > > >
> > >
> > >
> > >
> >
> >
>=20
>=20
>=20


