Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC08C4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 12:43:51 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.43])
 by mx.groups.io with SMTP id smtpd.web11.19475.1713271427442067130
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 05:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=nvhJSsZB;
 spf=pass (domain: siemens.com, ip: 40.107.13.43, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LLAr6FfKeF+45PlUgI2D5Wst6QDYHY4zT5e3++AX1Be6H+Z7FcdCy7aS41vz43SfKSk/DMNFLEHEyYl1kA93Bl/SV1hQCtJRf1VAiILsHHoNF6EY3UYcg/rzDFn0HmZ7WP8eVTf/DVts28/9T/zN/tj7TWy8ugCPHZGBaol/cnYCKVRbCAmaw1NcCs/tdEsJXpshyxczNJK6dswNzt+NqTfM3YidWYGNHG//mGF+GxThg/ig0KHS2rejLzaeInyBeBIoOw3Bw+euoQRBLQdIAfwSsZ6CwxfQVH2ADQWdf2Fq3atmyhHz0/nNKf9H0cBOwR9lULJcquc91XceIG5RdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DT9LlUJ1Qg3WDq2FTljE4xCum94qJc5CSwqNFC7CcXs=;
 b=c8vD+k8c/Dvf+e7vAvcO1/aPjX+93EX9rN6VEOJOBxX/U3oXaP+fJIxag4WAeiBE+q66J6r5bAerkyKlN+jGBf12OpfDMT7/9NKPLJe5zFkOQgOQ9+U0C+E7YfW3KP7MZgNBGsW76wqQqd4P2wTrCecwMAsv6kAmoVg7glTxQWokTeMSMmVYjHrg2lHU/pe8M7T8xqDGJqkvX2mmbNfrNFe6fxPzQVKtgZ6amWC6krsk7Ph3OfvWNezV63jFAIL7W/+x/cxUIYDv6zHGQ45F0xMj7L4bQ+BWxQJjsMWkicCTKATsdp/hss9b0V9aOux6wTi98iLzndjSkQTBqENLZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DT9LlUJ1Qg3WDq2FTljE4xCum94qJc5CSwqNFC7CcXs=;
 b=nvhJSsZBig7ffP9Bt4skhFrXv71VCuqjJMbxm+UbbQeeClYKiTOyy8HySO+x6Q7h1orL7eRoVxEgCu5eDJIM9gV4of0PCslbdwaGRVL3FNyib2F5aeVuNDAxDUGyOvK8tiZoflvRCtNew8WPGRY1MZJRJkbARpc2RtB8M85pl2T09ywiiXVz4F8j4JF1VkQYnM5WqmtNMyEnLAA/ycg4qNFA+yKQe3TotzBIT5KCbH2zpcsugR+qWLH8rvXPL39mqD1Z9VcFFRrnI1IcXlnoawduJd2SR0IJo2dfRXWVipOHEw4iAUDu+3qQ865aWHwE6U7cy2/1NY7+UWH6GYUTBQ==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PA4PR10MB7962.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:270::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 12:43:43 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7452.049; Tue, 16 Apr 2024
 12:43:43 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] jemalloc: Update to tip of dev branch
Thread-Topic: [oe] [meta-oe][PATCH] jemalloc: Update to tip of dev branch
Thread-Index: AQHajIXae3c3nXC5S0Kz1ZkZlDIjT7Fq3Zgw
Date: Tue, 16 Apr 2024 12:43:43 +0000
Message-ID: 
 <AS1PR10MB56974A2ED47120F1E54B23CFFD082@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240412030220.3073678-1-raj.khem@gmail.com>
In-Reply-To: <20240412030220.3073678-1-raj.khem@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=3403246e-0018-4bee-a12b-c75e3b97d7d0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-16T12:40:53Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PA4PR10MB7962:EE_
x-ms-office365-filtering-correlation-id: 4fd7e283-6337-4ced-7d52-08dc5e12d9e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RmFoGnUyq1TszzrNVFvGV6Ab2VcHNM+Q7BSwA8se4t7Q372m/zBAnNMIgzVqVxE1Nd3D95ByMdf9S0L5BYo7vE4WWEHh3u4Yjw2L68bmX9AYzfQgx8e2+wM34yJGfTj3UW3q+NKR/2KsJaKG9faA17kxdlHesNmQfBVClnWIXSrKO1+O18tk/+ioq8KTDoSt+MPTOR8s0yvHM4ReXcl7/8AvXCWHXNM1UmVv9X18vYjVU7nE9NkukElT6+SsC0AOhwsHyI3llN16ojj9I0/lJopJI1QEs3Ab5jfRL18DUyUj+cC9Y1DHGi10gfG0FZ0n02cHfDz9PYS25OtxzLBp52Vk7Rq7Tq3AqglYUsNNFHjbcrrpeu+VMTnE7SC0Oa+JoVyLEtu9lkC370ndgGGU7nLy4pdn4fFfopadMAXznjRFSvrf9JNpNFw/A6g5ZNF7SnNfn+uVTgyNQDtJzBBRU0nEv1s8WwBGEyrcQFwk0vPWsAcdfrWtf2dcTe+bH4RxaOV8E3bb7hD010k+Imd/02ZOT1h9++ecJoN1VWvItY08GHJzvjZ3QRJq4uj1Ck4wWHdZAh/y/mp4wWaYqr66Bfp2XWuKDxTodl8x6lDU1tvEYSzWYdh1l6v1TT6fQhoAcCwEFZI29n9FFDUBcgC5n9syaNRizipaDi/xE1Znvpq7y+zzzGed+8wMNGFap2uHOci20qC2ZUXrwM1TIzn29g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?OW7FtQu2iM1+KT0XTnnP0S3+u50FAvMl0/Rb6UG2pjJUTdE4RgCn498knwDl?=
 =?us-ascii?Q?rY1ZxECbEn/ZzVdzdfTloJ/k+8laVwDCczftg3FMXnP6tqtkgTINYx8eDuTx?=
 =?us-ascii?Q?oovwRW3LN6D4h6ktDKngESPD8ajyq5RucRwiD0+SQZ6q/ATZHeYgFpOnYXF0?=
 =?us-ascii?Q?7SHhMYqCMksW3R84J7S+P7qECr2s5N6eKpn9xQKd7XYaLW4Qh81e3w4UsT2Z?=
 =?us-ascii?Q?BPgVh3U/QeuF36nSUDSfi+xZmKjJK/F919ocicvc7LoQfAQ5yVYAGSU1jgYo?=
 =?us-ascii?Q?BbM3GpLwLVLTTS5zyUTTSDJx5or2Sp3DuUCexilqgy1/b81B/Pohb3fR1Meg?=
 =?us-ascii?Q?Cn9AMybMoMzAQCz7n4xJQwKwgrszxBo2XV9uKfGaz4s2N0SDNJlb7BFm3aAm?=
 =?us-ascii?Q?KqwCTVHs81HT86ArX53ZdzQwC1HDXg8DdFUtI9g9MT+Ab2dQ6X5H6SwAA011?=
 =?us-ascii?Q?oDiVcUrZxgk05QHYB6/PYGzWU0oKlb/DFvG8oYv7DYXJOw/l5KO2gDrC44zc?=
 =?us-ascii?Q?mj2XZc7IuY3hgREsB/90P8gVUHJ5BhtUbyraZMBDuYpVV81HaJMmRTsAF4Ge?=
 =?us-ascii?Q?xa/rBVRTn3tcO/WGV+R79dm4ns5UWWiBa5XGSv3LlvJbGLXc58UqKAVOu10j?=
 =?us-ascii?Q?HVMSFGsS1xoZ7ues3ZD0VASDVwmvMg6g8yohoMR93usr4+FqNtodIczbOOJs?=
 =?us-ascii?Q?GVSdCix5yB8zTP8llMC8ygQVHVzRaFpN/aXS4F5awmQn5+TOCfewxMTQkx2p?=
 =?us-ascii?Q?GQkUqiEUvz5x+okoNbhu644RaYsmOkvqHhxQngcvZ6fXw1dFIrIr7U/QqAMg?=
 =?us-ascii?Q?OH7AHlutHoyLwdcvpWW2fJjqX0itI4sxf12M2YfE7LGTUGzqbcrYD9wT8Fcp?=
 =?us-ascii?Q?1jeX8dEtupSEXk4t0VuVZQ0oHt9GLabJwASKhUR8lNRzeP/vPgeH88KQFQaF?=
 =?us-ascii?Q?YRwEf5+XFO/tFUeys8IvSlov4ZTNUkKXO5eEitvpsfkKCD528Ir78HROOXMY?=
 =?us-ascii?Q?mn34MNgQqygfKQRiuAfqoyHYYMAaiKORq6KlR/RVLUvP529J2p6QGyWRBguK?=
 =?us-ascii?Q?9xICpUJRHdd/4X4gbk90Sgrp2+VtPp355tE2O/m02bIrX3WEvyb8nDF5LIC8?=
 =?us-ascii?Q?9WHEE6cgF1tPhv70jjtAExWPqOCXO4RXv6lbiTwMjv2NflEguer7VugVzwDO?=
 =?us-ascii?Q?Iy5MnZY5GC4F11VUSk8wWabS528cX/0FMOkBCQO6/myXhXrY+dYQa9XD9Hup?=
 =?us-ascii?Q?5maQZ/U/v4nRRkX/4WI3DzVhpu+ajqyffUjEhYE8CfxuhSUh6osmyw6gjm6l?=
 =?us-ascii?Q?9nitNfYkEiAVwlM5BkB+u23tl+ys/LcE83QJEHJlXI03Hxx1gEHKPUTjhGGA?=
 =?us-ascii?Q?lazfqWtItdaS/sCCLn6xuzBSQroJRNRCk5VnQOsWyvkW1+edvkhq0DtBoPKq?=
 =?us-ascii?Q?gKgz09K39fuQ09p3WAD9HuTnw3MIqJadzDIpJ0rZE/t6M9aVK9UcpWjgXq1X?=
 =?us-ascii?Q?cvQR11uU7tDf9IwKFfR1duNmrGC6dRae2nsc8bzeTdwoqDyAnQVvSLv2fz7L?=
 =?us-ascii?Q?SBz4ejzGt6dC4PDjPva94JJ7Gysp/7F2lXQEtvPv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd7e283-6337-4ced-7d52-08dc5e12d9e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2024 12:43:43.7764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PGsEc6dEn6h3m/O7+uwO8rovD5NKl7qR2HymZOHsnRdgcYeDhQvjIsulTY0eInFTH2iWEn9eBBlBISh1WQiGbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB7962
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 12:43:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109977

Hello,

Could we revert this patch together with related part of related commit?
https://git.openembedded.org/meta-openembedded/commit/?h=3Dscarthgap&id=3D9=
2bcaa8c1b5f7e2bdd607eafe59ea2d5799ba7d6

Dev branch is unstable and not really suitable for new LTS release.

Thanks for considering this.
  Peter

