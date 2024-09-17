Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86252CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 21:33:53 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.70])
 by mx.groups.io with SMTP id smtpd.web10.1616.1726608828153276955
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Sep 2024 14:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=ghxDa+uh;
 spf=pass (domain: siemens.com, ip: 40.107.247.70, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKL3TjKznLI/iNGZjmvDwHSxqHldQX8Rm79TIqFiQxg4sBLNymQAo1gmpbcdHjth3dKJHwMyMe0+XoOBBBnrfN3BJ1cV6QYDDevO+PPx8qzCARHFx8SoSIde8dWNlBjXVmodDO5zlG/9euSE0bzYbRtxvXwdYobNNjIikmjvp0402ldZsXtH8ugsA5AMsCJ7cziNNxrS+5AcrSN9lgSxAGVy3+vHGbkzGV8uhGmu8m9KfUfHwV+5W4/nPvTobzkyaZSV8OKBDFiHlmk1UQNIHgX/agSY9VdktoeCYSnt+vqCOP1XygGJ9BooK/DgsmQPKEXy4xYNX3SCrdSclFIlbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xuPGGpd/r82xfTdLEDCYBhjmGuNrhd2bAQfQIXODpCM=;
 b=jtTzr+1GYsFStK0pKOAtTVw6LIJ5daatvk/dkObm/y+QvmVOKK/F6Qe75heKDsBIYXVlb71oDlrcne2aMuKY507BDXuIxnjkoh7XFR5erT3L4mZBqjM8DPxortRvnnxoQ1iDdu5kPMXX7HM2MCOOwX14vRnm4twAGCQgr20vvZyUFIVyOxvXl4IKBA7dquBkx6upLfKt603fB/mGSXilHXBGKHRX93mc9HCEkHhElHYTWv2IdGapoX9Qm1spSanNDgBSRakX+alVwiSD0ai/XQb7acXbJbRtI+dIqLbgDriEOodoPB7G7IC6Uan5fvZMzSGGecZ26pYvOI1WQfozfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xuPGGpd/r82xfTdLEDCYBhjmGuNrhd2bAQfQIXODpCM=;
 b=ghxDa+uhB0rzJ6q7RBNvrucrDyfJgwIzcFzBut++kaC293IqFMELS5J+h0e6VK+H2e4E620VhWM75nU4Achn3nY2tBcAQkNwTrFdHBAN5l/iooKn4qXoWKmwDWy0nff6DunQPCaC7ANohdKXTEO3QafhkuJltz9s4LSNPKFVo4ONyzhEY95kJoe/bsQQ0VW7ygr1RBvozop2LqXai/CK3jlEAKpFSsRBE110AEdKnEAtoDODXi2Sa2tQ6DObFnstc22NtFh7HmvYjwBKB9ESnz9QGUGyhrslcMr3qecajBUjHyeDre0KiFE4iPhxSWDKoDMucVwGoMLuZEbj28XfmQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAXPR10MB5661.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:244::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Tue, 17 Sep
 2024 21:33:45 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 21:33:43 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [OE-core][scarthgap][PATCH 1/3] python3: upgrade 3.12.4 ->
 3.12.5
Thread-Topic: [oe] [OE-core][scarthgap][PATCH 1/3] python3: upgrade 3.12.4 ->
 3.12.5
Thread-Index: AQHbCUkCiIWLbaLRfkyI+S7TsBW4dbJcf9EA
Date: Tue, 17 Sep 2024 21:33:43 +0000
Message-ID: 
 <AS1PR10MB5697778ADDA131ACBDE90D39FD612@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <17F6257847D28171.3733@lists.openembedded.org>
In-Reply-To: <17F6257847D28171.3733@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=f50efc8f-e3ff-4e3b-93d9-e43b7f0d0cc4;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-09-17T21:33:10Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAXPR10MB5661:EE_
x-ms-office365-filtering-correlation-id: a66b9a1b-cffc-4087-4faa-08dcd76067be
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?3ZsqbKxK5mQ1xzQcyRaE3fLWKunrpynOjzuTh82GoWQFaDaQeXPVAxR34RWZ?=
 =?us-ascii?Q?NeKwm31BV+fja4JWz1mh4GdvSrCmdJR2saFlC5fVBB7MRgUsJvhNHwCb9I03?=
 =?us-ascii?Q?xMhWdPQGDLQZAcqykfjrrKt5beE47vLr4An1YS/JiBUHst++hQIAMNwRR1KR?=
 =?us-ascii?Q?sQ112L49iNcGwU5JBd30RPIP/+bR2C8HLCVf5NbeSBgDGZ7/OpA/xaiGqnS3?=
 =?us-ascii?Q?SyQLjVbwCNNMPndVkpg0X6H9msNd4TdPWYHcbBrkXp1OeprFhl/d6s4IYDYm?=
 =?us-ascii?Q?m+JvO3pm7wbrbyjtg3uDBeH603HxP+VdWhTyhy1ppZ2ZrE3Kh80V55vfU+vb?=
 =?us-ascii?Q?zVtSpicWg6eqNDnhq65PtZf4iSzMr0iKJRX83hVtN5mIRt894QE/IS+R/wM7?=
 =?us-ascii?Q?qoANT6o4E84jLJtBN/QenrB+9ZGns+ek2Eb6WNLl/IV418AzvuRwoM6xiebG?=
 =?us-ascii?Q?F9gqmti3itJXIkwTs/t2b7mBeBVFiiKKbOV1K50s8FLSIoN3OOB/GouSiNh2?=
 =?us-ascii?Q?7T9vU1vnncsrOJO7tDD6ZZk9ebOBLcoz9bu3fscVynxn4Gf2WHUBFPjU9oEx?=
 =?us-ascii?Q?ejzHe/iNepKMaVv3h/cUbmaoa3CuwZXf6Tc6AX7HSf2wF3JSd2i8dhs/QzpX?=
 =?us-ascii?Q?YMwMsfqgf735B9wikK4nVuOXiec0UDxjS6WnbFf3FkGWNd6mXTi0SU522dZe?=
 =?us-ascii?Q?LScNMsH9xGaV++wnsVLpwddPK43/IPBQOWsE9l4MZM/4s9s/1MjWaXiHEW1R?=
 =?us-ascii?Q?zw7Y2SVggIYN7DQaSSbVOJy9n8fzJxugZMnv2Yp3pZWMkbnWj9PkT0Leq5W7?=
 =?us-ascii?Q?zKGM2NcMNOAsWHQ0BIUHeWD1IrP9G2MEvg/kWJhPRV+N6KjgAy7XyGsGYTOM?=
 =?us-ascii?Q?kjt6b2ydoqOaduJmGw5cj+AFcImbrjWSni11c5NayMrkM8s16IU/7qvFoG1u?=
 =?us-ascii?Q?Xgg3pvyjOQvBMEeiW4dbZevn6+fG6Pw+viymK72h3sawzxN5wkJ3qTgzST98?=
 =?us-ascii?Q?nrb0+WThjXtDRLa2+4O871Y/xjkWCzR/i9zO465zjngEGZgM9aHqNOMaxkWt?=
 =?us-ascii?Q?tQjtczkA5Dv+DRRtd7qZYMDW1DAkBchad1EcA/RSsqtjH8kSU6GdX5h82GUw?=
 =?us-ascii?Q?QchhjkkSDmY7BWIzJBIeik3InNzFJad4XzYGmbjzdlARHtT5aWbuSOD6tGub?=
 =?us-ascii?Q?blcgD5wayHZaK5bcp5zSHr487Uhir2/xePJJd+FVhkGZFOz7+xKvU5ppMzFp?=
 =?us-ascii?Q?GIQ+qi074EeqcsRIuXhrD3Vzyaf56tpEFGxBrfuDbPH5XwHu4HN4gwrKlPlf?=
 =?us-ascii?Q?KKQQu1aCWq9VPig3k20Pe86DHorrieGoQHjrht9w888AK/bNIZ8gdNtc71QG?=
 =?us-ascii?Q?OMh1Wy8LX/A7M8btJH/AHWv+/OOneV64RXVSeP4ZSzjJ+nIkog=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?18QZ1s3rwM45kRNHARnYCkncXbhiZ/yC16GT/+KeIocrfNhda1ldKiJOWWuD?=
 =?us-ascii?Q?OC6dBbHR8J2Sn73OPlcWqTVQ/rDqVFVo50Rx4nXLAmiMTe9MbpsvoNSKI7KE?=
 =?us-ascii?Q?hSo/UfiD9HzHxQeeQzw48Jiu5B2yoMVu6LXQUMEbl7iHUXsAm1xfooJm2tHN?=
 =?us-ascii?Q?tYRfZlMaYPFj6tVS+u5O6jCTKkDIpY2Dz/JgHboDrLJeKbN+cmc6uFH00Yze?=
 =?us-ascii?Q?TbCm6+2P3na+dy1bE430O6imXHfHhbgAIz/OMe2dNdqqwtfhgqNt9dZR9TAu?=
 =?us-ascii?Q?6hpYeMgjga331irvOlsO80v5opRUESBK9f57o0Hea9k+UAybUpRxcoxMcp3Q?=
 =?us-ascii?Q?VlJdkHejARsRmPCE4pTzZ8jQ5qajZuXwo+zIg1YVCDaFLnPuY6sf74xctEgH?=
 =?us-ascii?Q?j4o+eUNyObZtTD7MdFVyPQFiSv442qPuYCWb4I+M0Xttf3Rv8eoR+LVFsP0a?=
 =?us-ascii?Q?dEkN3auWQuLYGs9leOCh85DkEJwg8q21OQFOcqz7QMAKEcfuzt9wzyBuhjDV?=
 =?us-ascii?Q?14dIwAZRngt24wMQp7Y9+wOSBusYd6Q3rGjhocMu6pYhdqPieYsnuWsfqbC0?=
 =?us-ascii?Q?S2o0v7vl3XdeI4tS9URylrBtMbGz9LL5oBJ5G7TgFlDCvxUtbHB+Vuw84snf?=
 =?us-ascii?Q?rZvNwO7FALQFlDpmMrHub1lFrx6RxVKa94c7UPBQBxCwXdwyMlZlgaxVJNeu?=
 =?us-ascii?Q?bXLJEWIITy5nXS2Xk7Z/ifDiV3rKTzDPaXFBM/yuTBthAyGshFrLB3YG+TAq?=
 =?us-ascii?Q?Gfq18ln8mahHZshESO4bBwhWG1Ij4ujJOzG/VOl8FKmWOWXXfqYATNwa3fWS?=
 =?us-ascii?Q?OCSVbRV+nOv/ZaLScDOeET8xIPaRntsp7iFrhzznEAPtp40wqmdcdGpuTL2L?=
 =?us-ascii?Q?/yKP3AGVtKReGNXyQReGTa6+hCTGdwnGG2aOtp5tleZzusMsJy63Wm6fOwER?=
 =?us-ascii?Q?U/x5/7lIhNNbyHDr+Uey46hCTb/S2QYPwzuz5il9BKWZDaoyiNqdw7SS8pOF?=
 =?us-ascii?Q?G8CTRNFp/VcIrTRHs4q664xHwqjggisk9bfBA2Shfuc9h3wWpaBZf2sZhqEr?=
 =?us-ascii?Q?cpiHN70RIbs4bvu92DrnKxyKrnsg+YM7S+p8N9GPYVbsnpJsIGEJF5bP9OuH?=
 =?us-ascii?Q?pu9ntNNPQn/4DUBaojifb7sIRWRknJKnCd3Pg28CJHe3Mz0NZ4ms5mIOQFVb?=
 =?us-ascii?Q?gd4x59DdWwolDYCCE574Hwjp6MDUEfeMAwEFuAkoMcc86mf09w0lvLvguLWZ?=
 =?us-ascii?Q?NlkGjYhWOtcv6HmFk0+M2i4Sf5NWiSiHDZLN+HBuYbfXGRvhi2zC8cSMv4Qg?=
 =?us-ascii?Q?eguuam5Zo33ZNTg/W5XZVzWaYP+Gbgj69cEBcBW0hS/0QEwBk7BWDHuDe1lg?=
 =?us-ascii?Q?yzPYoKJ/el1/TKyTnp/Y9eZtc5F5wzUfypBKatoyhyZHhcnsV3d4KTd21ICK?=
 =?us-ascii?Q?W5Ie46x/TPrFm6w6MoypbkUtuGSag8CCol/L0H15+qmEvYO3zFmGEnoTuARZ?=
 =?us-ascii?Q?xMxpdeFDW33DQ39j4Ui+6eyOwFewBHWLczcsLLz41NZQpb1RmEz2VSPHg3L9?=
 =?us-ascii?Q?cO/KCdhTKbWdAxZbFxIXII7P6nzWNTyLIJYFsS30?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a66b9a1b-cffc-4087-4faa-08dcd76067be
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2024 21:33:43.6506
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dd3+We1LCggrtDy4FKHBlNuzh1cD3NV1kF3KQUnT63wSlH/M+tkHtZVfsnF152AIybJ6O4ryQNYoP1kc1Iq41A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5661
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 21:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112352

Ignore this series, sent to wrong mailing list...

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Peter Marko via lists.openembedded.org
Sent: Tuesday, September 17, 2024 23:31
To: openembedded-devel@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>; Alexandre Belloni <alexandre.be=
lloni@bootlin.com>; Richard Purdie <richard.purdie@linuxfoundation.org>; Ma=
rko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
Subject: [oe] [OE-core][scarthgap][PATCH 1/3] python3: upgrade 3.12.4 -> 3.=
12.5

From: Trevor Gamblin <tgamblin@baylibre.com>

Changelog: https://docs.python.org/release/3.12.5/whatsnew/changelog.html

(From OE-Core rev: d9e2ebd6b24b802d1d4cd38b3b910e068c308809)

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python/{python3_3.12.4.bb =3D> python3_3.12.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.12.4.bb =3D> python3_3.12.5=
.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.12.4.bb b/meta/recipes-=
devtools/python/python3_3.12.5.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.12.4.bb
rename to meta/recipes-devtools/python/python3_3.12.5.bb
index 3ac83166ac..5c3b7a92f8 100644
--- a/meta/recipes-devtools/python/python3_3.12.4.bb
+++ b/meta/recipes-devtools/python/python3_3.12.5.bb
@@ -42,7 +42,7 @@ SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-config=
u.patch \
            "
=20
-SRC_URI[sha256sum] =3D "f6d419a6d8743ab26700801b4908d26d97e8b986e14f95de31=
b32de2b0e79554"
+SRC_URI[sha256sum] =3D "fa8a2e12c5e620b09f53e65bcd87550d2e5a1e2e04bf8ba991=
dcc55113876397"
=20
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
--=20
2.30.2


