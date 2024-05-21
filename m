Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DEFDC25B74
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 21:19:49 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.80])
 by mx.groups.io with SMTP id smtpd.web11.201.1716326384089104960
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 14:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=AQ7p7wTd;
 spf=pass (domain: siemens.com, ip: 40.107.22.80, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRUkd7NSSqlvptmisEf+KEgi1IFQCB0yUqrWK0JY6EnnDGirc3leegfERtWFqxvQt2HILgy9liAUDPBaHt2y/LIASTyEI2YmvIsMTsEFkcVcj4levNky6AvRw0rYLz6tUZWBslHQYI21Oh4ncy6p7AGlSgVsK8LeSdvDjsfGG4ebn0wFaQluNRGw3Xh1e794hqa07pzu0TRvAoZP3bfwfXP/hodGIvB5viRtOcWLKlhuHIse3Ot2vQqEuIIgi43u5OpPp4nH/LyyNUz6G3W2mss9HPyNN3+ATLjm0vZhu9cUi7K6viD6brg22P6V0bTp784w80R7KaWjl4NEY9ZUuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xbSt9yHRC37Fa9RuKY4YrkYqGigm0RQ0ST76dwCOhbA=;
 b=lv18wqhAwQOIoFT03ZSXGdKmHeSkcymyOL0OmZlxQOaRAs8TCZvWrY+jnSdiHaQtA5JdEegZzP6aXq1v5qGgOrpGx5hg72O0h27TMp+xq1O2DvuHHuqzgpjCATb0IzG2AsqMubXrpqXo2FurilfQq55rwXxsCAJc6BVVsyJwMj6HorSlI9QT9XMCKJNf3hDHF9V8rcv1qDCTROiz+LiQvGQYcuvdxtYgyUklJzB8DttSEJL3jqj2Ka8qW0k2d47aOvu28Zre1BVtgeDhHd+ejPFNRK9Nlu4zl80DZkSXIVUmI7NUrE0HuW+jadb0Wikms2QyC2dUjnsKTMLMsGDyuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xbSt9yHRC37Fa9RuKY4YrkYqGigm0RQ0ST76dwCOhbA=;
 b=AQ7p7wTdj0GHNPSnRvFl1DWNTvO6wv8+Y7zQqDJUwIpXOX7GtnOOdIeJwMPwnvKHokSnbDiJPEbc6n/ZNL8IeT/kqQzzvmmgTV6KhWN5sMSINGSXf2FCZfVei9mVqhOLp5TE4nxjwCD/T0SMoKz1/ig8h0pGclMW/QHf4ySjjQfgr5vGu9OPa6/AK7bsYVK9rfqpW1ql8yCLzWY/p41vM38ParDZQfQtNqP1GrOf3T75NMdUF2JOaD87N20BCFnhydbmolwQhYq3Y+9zsjRC9OF9nBBhYbryftUR4W78O00U3sWMtojRZ2DDKKMdB6B8gelKTrRNam/C0G2d26hv5A==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAWPR10MB8041.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:37e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 21:19:40 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 21:19:40 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [meta-oe][master][scarthgap][PATCH] jemalloc: add +git to version
Thread-Topic: [meta-oe][master][scarthgap][PATCH] jemalloc: add +git to
 version
Thread-Index: AQHakJGDasLxNJzoT06I+KEqdVNcc7GiZ+mw
Date: Tue, 21 May 2024 21:19:40 +0000
Message-ID: 
 <AS1PR10MB5697AC61E6595506A658B336FDEA2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240417063502.6985-1-peter.marko@siemens.com>
In-Reply-To: <20240417063502.6985-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=eb5534da-a526-4c51-b83c-75085077a819;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-05-21T21:19:11Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAWPR10MB8041:EE_
x-ms-office365-filtering-correlation-id: 4daa1ed6-bbf5-46dd-0730-08dc79dbba09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?gbkoYBh9EUx/vy5CRv1PGXNQoJh2TCa3W8DmXv6Nmv/gqdCs55IT7Fe7swqj?=
 =?us-ascii?Q?7Vd+quRhygpPMAxdi2JpYvJ0h7tlopRck+/tokjStgLYKdmkw5aKAwISQHam?=
 =?us-ascii?Q?+3Z+gBVPE/E+bB/E4JlHaqKk65eVaEEKYe4Ecn9oeRR2nsdsd3iCutXmEH0G?=
 =?us-ascii?Q?0RZlieQhbfnfmUKQQASfWqnXUugzJp7wlDYCd7UyKBcQi+CHqQXkI61/kT4h?=
 =?us-ascii?Q?A/n/w+buit3iqipCZA0uZf3yFbcLjF+TK+31w/WFz+mQbMqvSsr3L64CLgHv?=
 =?us-ascii?Q?0GG9oeOqaFTiU9Xoom9A9p5JI0llyerKFHLSgeTQjfdoD58txlaIVBDghBtL?=
 =?us-ascii?Q?tNk/3LLdMwzR9lrGwCpptfCVK6Ix+OAzGPZIRvTvDNSssOz3WtOfWEDoFAjR?=
 =?us-ascii?Q?wyuRcIdxpPO1sZE/q4S9kuYzK3Ufuj5Wpbvimkavdx4Vg1Uh8+qSooyPEDG4?=
 =?us-ascii?Q?Ot9eu4vyWHhLMrM7s9pz93uJFOC3kAB8OpEuESrOk8UI8RybnwQT3AieWHJb?=
 =?us-ascii?Q?tW9hzKfNCBLtwSkI6Pax6DMAQ7X1pIJCh9sT+EM0fgOloiPZ9kKpVnLlUTw6?=
 =?us-ascii?Q?M9JPwzwGDdH6lzs7ucgk0eiHj4jP/gJYFl5DoIfEf3Bq4pQR4Uws+A85Tu6L?=
 =?us-ascii?Q?eZh5RhxftDEP82rtl2UFE3KFYDgy5tHSGTjgYYSx77HXBNPnpuPYXDJVNMZ5?=
 =?us-ascii?Q?YGnG3poMYfTf7M5u00sHiOzyvJls9j9+lZK6ZTm4f5ezDlcGgqhR1R9nk/n4?=
 =?us-ascii?Q?DXlmwSf+qHD/FHT4/J+lOqAnXVpSAPlkMugUvuPGwgWlTNObPGCtPYVynpY/?=
 =?us-ascii?Q?vwYeMAZ0d+jDTCKEz0bq0yjXqYTbp8VkPshbj7sFZNlBdmLxZ9/VAc/Bgu2h?=
 =?us-ascii?Q?BMN5XziBA2OXJqpL8/IZhz+ePYf/Nmdb7atwG0ZAP44vtUqlw0sMbqAfyD+d?=
 =?us-ascii?Q?y61H57EoX8FfVSoegP2ktfH7XPXBZ4F6Y4t5Q6BI1aNtvWQQOSkh+vzSHyUI?=
 =?us-ascii?Q?MZ+plr0RdtCBUMZqrZM5ExJ51UF1BYLxY5QNjxzykXL+1k6PcgsYVVdc49yN?=
 =?us-ascii?Q?1kZQJYIR7oum/ITRNBwfuc9M99v3b7WvjspCWyJtvnxIVI3tQmh5DSxELFjF?=
 =?us-ascii?Q?JDGCvMNLgNazgLNalKJYJkp5OnHgqt58mtcwTrCh9aJ/hRYNMV8oCESVnQKe?=
 =?us-ascii?Q?ybF4+phJo/70XCbpe1Et6G2sUfQ1KO93Sbk3+pIhcOvNUM5BQwqlEgKNyEaa?=
 =?us-ascii?Q?4BcKmlZXIRevaGLiMDpyBbUfU+TM5QTKwJL1vjhH3HBIAbnfYWs4sSmGhxaw?=
 =?us-ascii?Q?XiYGJD0mkceZQ346mga4Gzm69DrWYJWtZiYqgP/v9uKgcA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?cLfR7BbDFZRcEw1Oqfqtwdyzt19ZUtrZOFY9B+A7EZUubQk+DhcpTsiAwb1R?=
 =?us-ascii?Q?dHrgNBg6VDr0uyXepoLw/9kc9YFGe7pZvfeuJPD3iuK8uWxdphXLNIlCBZ8R?=
 =?us-ascii?Q?hQ/ABg1yN6UatR1KmWtSOvRRoLvCLw5uOJQ1XtR51dJpOJYO/vmCCfTQhFQm?=
 =?us-ascii?Q?57ynS46OduOkxXlaj1LTgoQbkOZkmAySfNhC526EfEGr0n8DkiRCkUMlUzta?=
 =?us-ascii?Q?e86JZWaY7T0MXnOcZCgUfgLyFiHA78kxS5wWiITLPWf1EBI9EWDyIK2uRo5C?=
 =?us-ascii?Q?mzVFgvSYOEfZtUW8+0SHaqDCBLcYfLVTGV3nZ03hwVDciRjRxtqjKKRoTY+v?=
 =?us-ascii?Q?TnXNa5m1GMz973j8ErTvwpItxdQTX/M+WsjAMcBwGY14kAoe/sktWB6Eu9Ut?=
 =?us-ascii?Q?7kJ+/0JtSBuVkp/tUOQVdTSvkFEHLF4VdlL7P51FLcZ/iwgtJw8pdqbX0SLD?=
 =?us-ascii?Q?FfPsKFe+EhWNPNunY5PN9A6A0mWBp4QuwM05tsNKvvcnIJ1mWOabiBzyVeQl?=
 =?us-ascii?Q?KkUdQ3tUt3w6Nhs+WF6Nq0ntEd/DSRiVbicrTFr/roB+FKGLoIkhYZjRxPtB?=
 =?us-ascii?Q?Yr5BIm2sST+NWMcl8878j1D086IF51s+a8mQumsittWFlLOWVgB6P4NBaK0M?=
 =?us-ascii?Q?VuR8R941IchdTZnQYu2l6LHkq43ZJxSIsKnV+PjnfZQKgcMtgkhdaReEMDVR?=
 =?us-ascii?Q?p8pXKcv8DeEKJBTI7+AbEC4lYT8aM3ntGGRHJTXgGZaAippiBD9AYJ+/maAy?=
 =?us-ascii?Q?bcSn9yw+sX13RwfjA0Rx4OPaaJsP8bV6ctfofuDzVQNK2MUE94t4vwES1lUT?=
 =?us-ascii?Q?CQs9/6wTro5GcjGyhwpOYAODD/oxt0eMkeyidfygxjoRbye718Kr6IcS6LCJ?=
 =?us-ascii?Q?E0G7UJerRY31ylrKAFb+/PQp1n/bxDS/UPM1A0Or/YW07h5YFZ/zxVbg17mX?=
 =?us-ascii?Q?JVLbWCNIKgkzcHVzmyPK6LjEoK9T2TUVVxfnZXzgGo1c5nRL+8shvcuHwjrB?=
 =?us-ascii?Q?RGa+VrrW+neSDhKx9GmC5J6rm87jF3db5tRJo2cPkxXiB8PT3wOF+I8D6MBh?=
 =?us-ascii?Q?yhrm5DzMGpHvUAUu4UF920AWVxYzGr8aR46kqII6C8HaUelBEio8njBj5ygg?=
 =?us-ascii?Q?jw0Al5l5kVnoLrbkC8an+bCTyBlaS2O8ggA6ir7VQQvaq2+vYTAzasZf0iae?=
 =?us-ascii?Q?B1YTJdqzN/kk+2ZWmskS629acr65xYpVKhL2qZaH4mYtRzn8l0z7ylb7O9wW?=
 =?us-ascii?Q?IqLwE8n4MvMN0h60PBYe9+SBhYZSwe5rkJ+k4hizXv41rbEz3RkrhSVJTa/q?=
 =?us-ascii?Q?KFQqE/tf95LKMQHQLLvE6Pm8CMgMu95BZfdyEYxaOJOkeOuPKMi3wTdZSwlF?=
 =?us-ascii?Q?aDD8gCRjSmsGkxDMiZbTFXgeKXPtqpayTvJkFcOmhy0i6uc808+a8ZWnUCVD?=
 =?us-ascii?Q?tERzt+oU7Dzd1CL8HrwF/KWWgL6NdHN8la8bAzcnV2iyOB28zdw0fVg+JNFS?=
 =?us-ascii?Q?0oEy0PzEB9LJAoCu+Vtxd2ENhBXFK/1rptVSQzhHTeecfqLx4e8AXFggOEIO?=
 =?us-ascii?Q?xndat4dnLB4qun5CmJvT2j7rOBBDbfY7FEQeQqK3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4daa1ed6-bbf5-46dd-0730-08dc79dbba09
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2024 21:19:40.5102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Maj5Fc8rgTEo+RLhsbBsPgNm6puUD2rJ0PYrLbrrhcUwHw56BfyPddOOlCE+sinMcL9Cl2zxYd3ZbJRXayBLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8041
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 21:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110477

Gentle ping

-----Original Message-----
From: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>=20
Sent: Wednesday, April 17, 2024 8:35
To: openembedded-devel@lists.openembedded.org
Cc: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
Subject: [meta-oe][master][scarthgap][PATCH] jemalloc: add +git to version

> From: Peter Marko <peter.marko@siemens.com>
>
> jemalloc was switched from tag to development branch
> 171 commits ahead.
> Adapt PV accordingly.
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb b/meta-o=
e/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
> index 7e0272f89..dca8de461 100644
> --- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
> +++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
> @@ -17,6 +17,7 @@ SRC_URI =3D "git://github.com/jemalloc/jemalloc.git;bra=
nch=3Ddev;protocol=3Dhttps \
>             file://run-ptest \
>             "
>  SRCREV =3D "630434bb0ac619f7beec927569782d924c459385"
> +PV .=3D "+git"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 2.30.2


