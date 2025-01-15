Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D030C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 06:07:36 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.109])
 by mx.groups.io with SMTP id smtpd.web10.15135.1736921253394827461
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 22:07:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=DHFN4aVT;
 spf=pass (domain: navimatix.de, ip: 40.107.241.109, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zEZS4jiVndhgkVJkwkmurPZIJM1icysYzxyjxCiX3+CU/diUciJbDOj0FTYl7BLOukAPwb/Fog7qbqml1TmAmPUKi3Eg63zAQLV9STosinPA9JB4Q4YFjOuId/C5T+jmxJEQZSURXJVwYY+m4maUo2Bu7YiQt8U2fpvR7Q1Mt0ZR9jJ6ITzZHA3Fw19LWYi7cwHXjqxfA2zYkLPEZKmPMd2KLzleQIS7pyMYU+76MfnP4EeK3liJwDB/55ZNMzHk8MDhrbcNKeHdSmprG9Cm13AkW6kM+0ji92p1SoiYjcOeaLKF3ePIkK3ksmmmuW4D/fvY1fYDHHYcaH4hbfV95w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8B2hhPztJjL5FQAina9ZDhqBpVzKJb+GwFR5knPIQk=;
 b=Tj9wVhllkruGRkUzZlY+j44r9Q3alohYM1lgxMS3MjyzaS7zLBEsz6vpgoj+097gq7ZX1zj2sPccFFXNJ6fTOvIHW2jSsmtvlOPecmEsSBMdvsELwWgOceRAx79/KTeAh1d41l/6y4o2+AVjWLYZ02PSef0KaW6P2Puof4AIPdwVJcHtkFSRe20PyYFR/oGu7HFkdziBB+Uw2yiXiCT6ToxyfDJuMqkI19DO6Y7ZX3ymLvfLcjJrPWr+qSz3E2bKMPdTEC3JItV8eRSDkpGWHYtQIva45qXuPrt7iQHyv9AL1Df06BfkPu8YNBzeu5DSrzCXClnmEn/HFhqoLLIvNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8B2hhPztJjL5FQAina9ZDhqBpVzKJb+GwFR5knPIQk=;
 b=DHFN4aVTvAsOMiepePc3tghBw9SzvPIcKE62R/LV5CDTLip9imGTxnmDOIHgj2tSlnugVoaME+XImazYv58UGgxLrQEawewfTEDUozZdB/bvLPNwhIRi1ZoZaQJ/9cX/cGyldx35JFMX9P/Or0eo15FxurE07xAKHqP6//1knc0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AM7PR01MB7042.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:1b6::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.19; Wed, 15 Jan
 2025 06:07:28 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 06:07:28 +0000
Date: Wed, 15 Jan 2025 07:07:26 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: wangmy@fujitsu.com
CC: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe] [PATCH] smarty: update 4.5.5 -> 5.4.2
Message-ID: <r3pwhezfvqmgh43ejzkjroffsmdoupemdh3q4v6hplgk3zregq@tni3w2fjzwaf>
References: <1736911952-10934-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1736911952-10934-1-git-send-email-wangmy@fujitsu.com>
X-ClientProxiedBy: BE1P281CA0498.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::28) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AM7PR01MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ea4f446-1073-46a3-3461-08dd352ae3cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hUncMfCCzIEpvIMIm/y6fML3VXk+pu5p9AgoIlUEOcPcyzD0NhLAOFzTeqtn?=
 =?us-ascii?Q?ybKi3BPvcOhYDqDcZBvevU5/kAUQPRlT6cLKK791PiR/5mbvpJS2Gi0DF5vu?=
 =?us-ascii?Q?qaow0P0Y2aTeJ8JuOv1CulDfDNVY3tk7TYIJeGfRuTY2IxSjvnxzgwUMBI+n?=
 =?us-ascii?Q?Q0rCTfbdq10lr58dt6/XCLHo+rSNCNUj2+gEljY0UyodBFEqg9HBnV1ZN0jG?=
 =?us-ascii?Q?3uO3+2F2oK/26UI+VxghPeq5gvvSgxO4wVsTgi5pxqbvCmwkLzdIrwB4D1Qj?=
 =?us-ascii?Q?ySz4PNVlseildS6N6ywzN/k6fXXtjTUr0cK0d8KXm2J5ms9l+vejoGyzGbDb?=
 =?us-ascii?Q?UCOCJgvqWU7DrNS1dRgQbg6M/Y4CoAL9jra+CrktOmeI2unEyYBpTqZ5qvxo?=
 =?us-ascii?Q?02SXsWXcNUVlo7SHKZAd+d0aXJeRWQ48S8A8yzKEc0mTr1uHHL+X0uWl0c0Y?=
 =?us-ascii?Q?7E3xhNJVVegF4FtGoWdlNj3reSz9Uw7FtczKh74v56WRjAjSg2nKHN1MkfWb?=
 =?us-ascii?Q?0xrZ+4jdHdaZgZhuq3zIFIDvbZEBAGM+0/qbH9mqR2LB/EdOM0J2JbwYqF4J?=
 =?us-ascii?Q?s98mIvxwvKDIfOsT0x6GjXBad2KApcKnPPqdDRticPtxW5+MLnNT8zmJv5a+?=
 =?us-ascii?Q?zKkgXlgv2t+/Y0K2nt+X9S87Y2FU/P7LQnXomt4DRF3Nor6bNrW5bNL5DBXs?=
 =?us-ascii?Q?qKW3ywBgU7HqcocgQJubKfmdcQ5DR0IcfQ4cxCZqwfPQcmlJUi23cEKVyozu?=
 =?us-ascii?Q?ZDfVioUWUtGGeDS0/j3sKWyvpmzYy/hjNY9nmdA+YX+T+zX0VbRnlgM6GPqj?=
 =?us-ascii?Q?tg5AYZqhLXp+UI0WE/ePLFZf5PAPLBjFKQIGceyWot0AgTFkx6liF4gZ4rCp?=
 =?us-ascii?Q?yQ8EWWteYXPrbcxZvmEyUyz2fAyt/URGZ8BJUkgHERw6v/asV2uIsY650P8P?=
 =?us-ascii?Q?pSPVlO44QWecLZz87j5Jw1Kl2l1QzXAG3A1XGpUF/B0+P1E9ivwgyLAL1+Ss?=
 =?us-ascii?Q?FR6qeaTa6grYz5ZzSpbCvlZY7k91noqCwNHn1PoUeV9ejnrSax6l6AiPAERZ?=
 =?us-ascii?Q?f0mb7XOdH2zl3qlQn8HVxAaQgrhhQ+dolcjuckTi7XzYaj6uhj0isezJGI9+?=
 =?us-ascii?Q?XCc1+owEJnAnv/bmy8nJWCESMhrQb5AO4S1M92O2XMXQy5Ch5lzB/BwJ/ziH?=
 =?us-ascii?Q?Jge1azF6sL26KA55cEJXzXjXhtQdHjUY9NRxrKgug6yObLMXoxCyuN9PkBYw?=
 =?us-ascii?Q?1xFmnIirzo596PBuSeobTGPo1+XcktFE+rFR5CURuYMH6QJppLpdk4OSRfeV?=
 =?us-ascii?Q?kfdjIx10LVXCNIZUFiwV7uCp?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:de;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FUULHG8mJWxEV0KD5Y7BGF43XCVoFUh0LnOlj08gKoUCQRi/w0TMT178AMbo?=
 =?us-ascii?Q?wgiURzaOex1V8j9QPEi2f/nXdNdKUw/JpLekshvRmZwa/wu869hrP/X8G+JK?=
 =?us-ascii?Q?6O3m6gLEp2Be3fbMgszb7QIGvr/UycvUS6QR6g2hnIt406sn98cWA1VKrdAZ?=
 =?us-ascii?Q?vJspQZMat+XqHt7wnkjmOGeFczjRUv7nmq0ngxfCvbS2e/tAxqUu12WGrtuu?=
 =?us-ascii?Q?z95WQ308WUmf0JTMGA2K+uJxqQhwRqPhaEoMKlEMF0Mq8C7ohcuhVegbhjVT?=
 =?us-ascii?Q?NKQqKD9GNAHXoISc74IDHXc/9MvVlM9KaO7xM+erU9JYeWSYjPi+zUvXmTIh?=
 =?us-ascii?Q?WO6NSeRJhLgcHVazM3rFaQiOEGbgJu9Omt+AwlMBlx8g+UYJonL2DbpsR5XW?=
 =?us-ascii?Q?u/3/fh1EYJIixsuSJgD/WEpAgW1Fl+TrgkzAsdHTeQyigfrcFAmQm3fIyYhH?=
 =?us-ascii?Q?Uvp/P4k1vrXEWAb0fvQ5+I3PruAGznwElwP7RGHRZHB4CCSAZBIRLWiyQ8w3?=
 =?us-ascii?Q?QRvMP+tMo/oJQmt4f9ESNxMlzYIxS/qDra/kMLmY7EaG2UPHMjQFVNTyMUZW?=
 =?us-ascii?Q?Uts29GLuxBDOkKo3eoJZHo9SWSJXN2Tz3KOldS1Agd6EfjxjoZyUE+S3iD5/?=
 =?us-ascii?Q?ex0hGXMAEedBygyE9HV/mYV8mUis8gbuBpXniNjuAexnK4kp9vWV6PhoEnSs?=
 =?us-ascii?Q?C36Av3dGErSK2Bub596ZjQlJsiSn8dJT+4WHlXT1IAccs3Shobo1OpJf3oDN?=
 =?us-ascii?Q?ovpJ4dHvuz8qRXLkKwOQA0SEAxcVqG3xGd3FAzaoe+HYz7BaXWDEpBsC9OWX?=
 =?us-ascii?Q?YzYGQD/Bl1BhGmzz3jtumpJ5awNdhke00w94F/xikmrweWWwS4FqY8t11ePK?=
 =?us-ascii?Q?p14L9kOzJkaC+5+YVS53EaEwoIkUOc6Kyx59EujctV4BH2AkgOFdAE4nU0I/?=
 =?us-ascii?Q?pZLY0hCc9YdEcVKzu9kpfpILOV6fS9dzb91sNGxMFpAEmAK9Nw9xS4qRJG0q?=
 =?us-ascii?Q?cDQoreCDFgEU4eofy9laXRGOSyFhnQlCsOaulWxhOc4DI62bNzF+gdic27tu?=
 =?us-ascii?Q?Ek0IgD6jBTu6P14qHVAFNqEXAd01Fr0HPt7bYtcUThOi3sAvtVBnUkcRI9w3?=
 =?us-ascii?Q?YbiUF4gPge2zcvkCw2v34LM0pkddruzcmTqjTABfy8oiS/OjZ9iSMZrQtpll?=
 =?us-ascii?Q?GbVPNtshKNMi+TjWyMMFi8oAuhBiiyhOs9cXOX5GkDPBud1CaIeJwOofKxnD?=
 =?us-ascii?Q?XcsREov+R3NWgXmZOZmVXd8oqdrRqXxZlzb8qPuvzDDJwY36nwhxZRtYJDsX?=
 =?us-ascii?Q?5ESGdT91d8bJzd0WFbv16fSgt9sj9fkjUZw5Tg6N1QuE739AvCx94iYYjrSm?=
 =?us-ascii?Q?tKXbi3DzA2VR1e7awvMSpDeL0YEqrvQ8p5ti4VtAM+chynKBIHLS+wkKZALS?=
 =?us-ascii?Q?QC0I5L70ysJuDJTpqopYEglS+9rmEPjygrR0AmRMg1CeO6H1p9xVWxgIdIIN?=
 =?us-ascii?Q?nGrnzrAcy32wwgZ+mKJnmbISzM73YF+pGgw2wQoByqJWH5tEFMy2tbET8OB7?=
 =?us-ascii?Q?8e2Sa/VWvgz1R3/9oRYPcJ5kTGlYa9xZ1H2Szx6ZGT+0i9y2M6E4ynmwUjmn?=
 =?us-ascii?Q?Dw=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea4f446-1073-46a3-3461-08dd352ae3cd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 06:07:28.5006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGzbZpSQc+5rXjw7cc96y94TOUOhCB1p8Q6GOWDdsb+zWq1Qjwdt3j1p0Yk0GY4g2Ut4sffku1sTG4C/OVFNtMDpv/ICyMIcy+HslwOGNCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR01MB7042
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 06:07:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114883

wangmy via lists.openembedded.org schrieb am Mi 15. Jan, 11:32 (+0800):
>  S =3D "${WORKDIR}/git"

Shouldn't this be UNPACKDIR instead of WORKDIR?

S =3D "${UNPACKDIR}/git"

> +do_compile() {
> +	:
> +}
> +

How about:

do_compile[noexec] =3D "1"


Regards, J=C3=B6rg

--=20
Ich halte ihn zwar f=C3=BCr einen Schurken und das was er sagt f=C3=BCr
falsch =E2=80=93 aber ich bin bereit mein Leben daf=C3=BCr einzusetzen, da=
=C3=9F
er seine Meinung sagen kann.            (Voltaire)

Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

