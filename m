Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B004CC30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 03:41:52 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.121])
 by mx.groups.io with SMTP id smtpd.web10.2417.1720064504322823531
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 20:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=xr4xiYyP;
 spf=pass (domain: navimatix.de, ip: 40.107.20.121, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqyndJUm/eu8tVy+YwoXzeenYIKS4efNSTQWYbMYaWqqV+emns2wzAFOtxwMZCXpiWDmbufq/iZnlpohDIW1jA8YaoPakRBp1kiXnXJhv5U5sB5xcK5ZFDpySbWhpctQLjzjMAGqRcnj1y2+xKiAf0rvzJTfzwU346S0WauHJWYeAeSOQEPd/mc5G/hvi7xcs3mW2mwoVBnIRU6m0x9j0yrvwPgNUOZ3DAdkeVcE1mogC1wA55MvM1lMfqWTtsiA/bLd986QhdSSmw1V8Bf1gMhcSHmVwYMFTml3P5pces0CDEDzlsEoMC+XYGZ2hptJH2JYLZ6zslkx+j4Y0qLvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/Z398ItPmVcLMEiAo3R/m1CBpVNgAbkfUPLXS2Q47o=;
 b=a3uNopzmKaUJCWhztkTa/Vlvxk2Bp4aS8+N1Sp4fsq6oPY9xD3Z0/zppgUgvVANErJni8nC39s+3Qo+RdSOpPMIUcBL/ww9gp+pg8NRUDsl9M2/WKpPBlK5qx1GF6bcTQEnLyqh0RaeUFefsadWpbCNrJwCv0ki4ROAf+kQoGL/E/GcClyCLtVpXL4FrGDZV+cXvXjy/jpu2AWeuaXHpDjeUbB6ohAkc1LHURy2BGzddHVIw1nfEkndXAOlbL6zl3mOyLMSoxSz9W9B2rCZa1zfjpZIhDs6cCxeiQ8BUYeIPnOy7M1QEk+PEX6YXAoesPmGbcFkFMBeG1elRKwctXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/Z398ItPmVcLMEiAo3R/m1CBpVNgAbkfUPLXS2Q47o=;
 b=xr4xiYyPml6Maip75MyJDHXqQj+xD1bDCSiUvcIHsWj5xuHkotILuOy/vjhF4BYzO3XCAveu0EZOt0x4dOdH9dVzlQ3XXjz+DQ7et0xxYh+/yXQdGNDzeu2uOwvdtf29IdKeqOFuXakflZMIIhx0127UuEAcHtrgnPa25rCe0rQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS4PR01MB9373.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4ee::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 03:41:41 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 03:41:41 +0000
Date: Thu, 4 Jul 2024 05:41:39 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: ninette@thehoodiefirm.com
Cc: openembedded-devel@lists.openembedded.org, 
	engineering@neighbourhood.ie
Subject: Re: [oe] [PATCH v2] apache2:apache2-native: Update CVE status
Message-ID: <twxvjz2rxrxu57g4hngza34g3athhaqoppgxffg7jbtt77ectq@zh35actoa6xs>
References: <CAG1aeW2+nEeB8A6viC0YUGx7J3wCHfxbDC5BGRn71OwiYwKCSA@mail.gmail.com>
 <20240703184836.23299-1-ninette@thehoodiefirm.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="dg5te5kwvnszetjx"
Content-Disposition: inline
In-Reply-To: <20240703184836.23299-1-ninette@thehoodiefirm.com>
X-ClientProxiedBy: BE0P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::21) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS4PR01MB9373:EE_
X-MS-Office365-Filtering-Correlation-Id: e9856817-dc44-40e6-91da-08dc9bdb3786
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?qSBaMyUswmIMoOnsWhw8PWTWWAUpL0mvaoZZBJnDwmSFodw6xsPDZJmQks?=
 =?iso-8859-1?Q?ABPslbeYCL3fwDzkdk74Fcj2dXAC9dUlf2oFFY/Vpnk8w8JOVP78vaqgT/?=
 =?iso-8859-1?Q?O4Vo2qXVTqbmBpEf/QQCPMb0Y4B1zBGzThoTSRJ0XZyo3X/l684ILHcO+A?=
 =?iso-8859-1?Q?yhj4K8+YNtaQtdGIY0xewmPFz4mQmAnE71xN8X5HjHfh5QEJujggXQ9aoK?=
 =?iso-8859-1?Q?t7zkdMpTOx2LOAdXC/M0d37gIstLv3XG/LOFjZB4l0L7UUWDfLASjG/rIs?=
 =?iso-8859-1?Q?s9IocsTGsepmgK5J8JBZPed+y7Ar0Z6IwOpmTAkQMtbbwANsFWvCE2Gxtn?=
 =?iso-8859-1?Q?xW75FGqJTIweVW40nt5TOTCFLwb8RKXOBaAQhtAKx2UOJoXnpbYF1GNru5?=
 =?iso-8859-1?Q?FLDm3C7twg+XISjmnsEvLvxVZQ2pXGLrqLIro7G96hru4IE+kbcJoPI6Ss?=
 =?iso-8859-1?Q?RCUp74JxqR2pXaUwJ1c3h2Rp0oU1KG+SUH8cussom/lRWRc8iT8iV0jiC4?=
 =?iso-8859-1?Q?mG3wEmFD4xaFtW7OsUJDLKrlBKhCSfq67LY+VxXBHmichPGlo2werpYtEQ?=
 =?iso-8859-1?Q?GtUGjuNe1wwcLUtI4xJrDvcNGGGpgDY5qxHBNfcimMS952u+UNaGdwFKWt?=
 =?iso-8859-1?Q?oxHKfLLE52m4BRHPQLgWPpfvEuKCBFJPuX2A3p45wR60tcewH+vCDTAnRy?=
 =?iso-8859-1?Q?7ssrHICMe5+5KKPJqpcg0Wt6P7kXIISNRRwyW8KZoK0mRPocXNQZvGXlWr?=
 =?iso-8859-1?Q?nNOunGnXrzo1Ri0juG5TVoji8BgsAUKWLszEXUAiFovNzJHMHHQwNMPD5w?=
 =?iso-8859-1?Q?1tojwg5w7WKwJlXgpcMidnWe8yGdIkbH+igXmaVvkmFKfyUBP12I2fxv/z?=
 =?iso-8859-1?Q?BMdb0nHTKGXrwCc6WASjIG+4YVW1k09lCaQMaL5ptHagEQnOnJnfDkVepl?=
 =?iso-8859-1?Q?CqNEWS/mWIy6mAE4p+VvlHjodH9/McnRgILuyGh1ehf+/cJviSnbRl0Qq3?=
 =?iso-8859-1?Q?PjvRjeg9vFsUUtWxeeDRuIB06M92TLUwo8dYw7dy3orS++bTrqYlXyzan7?=
 =?iso-8859-1?Q?AOK5jpPupyZrJkWv49gUealHHydmixyCDNUmye4BwRZrTTc7dj7/9JGMGq?=
 =?iso-8859-1?Q?LobFvjiuA0QnR13RLPoL2bwT3Y8GG5jk4OZItdJ0wnic+I0tFTMCe/ZcGW?=
 =?iso-8859-1?Q?mYsBT9W4W2b2BQOwgE3Tv/19+xlDYlAi1XG9S+M6vwxS75mTmq4UO7gOq5?=
 =?iso-8859-1?Q?XNBNIhwpQY19mL83QR8w2simYlXIoDY7cjjIa2lMhfXKcnuQId82t6OCId?=
 =?iso-8859-1?Q?LtyBo3pgRAMnJpXR/s8L/VBcujbMpK1DrrTXEvxD7VaOOE47BP3q0Ntwkp?=
 =?iso-8859-1?Q?BmapI1Ff+Fj4a5iihJjB1Zh4NTB64jqA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?kgRbns0hXsFON4LuQej+zF64s1pPluGPrNDYOWg1IDQrrY4VZ+WjCdddeU?=
 =?iso-8859-1?Q?LWU41JRzhYzBoSjW9lZ1ViBR1uMFpMKTKSppfghW021oixkk5D6PHyzQce?=
 =?iso-8859-1?Q?Xzy7cl6g5xQpW2ZTC9zNiU0LJxtG0VImPMvmja0FdgdwtLYMlp6qa8NWJR?=
 =?iso-8859-1?Q?R5WL0MVuyv9vi+sjL+ptGSQN3YN8RpY433oBfHfPF/kyfruuUoi/XYYkfD?=
 =?iso-8859-1?Q?+64O8cdmPht4++OSZt371MpR/rDQvFbrTmrFBdpXYwOWZobxYhEMeYHzCM?=
 =?iso-8859-1?Q?iPC6IltqMUIoBqeYVxS0+aWhCKlLw3lxFd2IyI3eZzPXyLpNkyKJ+LkNa9?=
 =?iso-8859-1?Q?gSRhCaX3J9R5kb6MwWIscKwUtXoWkQ9Z1XeBssqstUx7h327C03++F7UW9?=
 =?iso-8859-1?Q?/uE2kBfOi7PSBXjwHJQTim9jkNGAX/8jb9fPxC0UAtV+g69ufvCwLW7rFg?=
 =?iso-8859-1?Q?01nTVi+mZ4bYe0p9PuHZmZGkK9Igs7D4zy/Op3lGZnVPr1Xc49vq6KFNtz?=
 =?iso-8859-1?Q?Lq4p3ohTVtngQ4wGyjJ/LM03ve+qJiStbL0KMDcbRZm6iHm2wWXWUfBv1o?=
 =?iso-8859-1?Q?TvVt1ZiEbAlaUVexr9lgGnFz6du+CDFRSnE9u3m0IvHZPFPdLAEH9Wqvy3?=
 =?iso-8859-1?Q?8atLIZUsVZYiyT/EmTYQ57qhtn9kaGUSoahabmZocrv/E4rD6uu234Wh/G?=
 =?iso-8859-1?Q?mwWSx/Q0fPw6EbBGF7BTbsmSAGwOhMH0fV/Iyr+iC74hA0UT544yCxJzHh?=
 =?iso-8859-1?Q?SvUMUUhHFJkT1pn2nlZc1Xf29uwy0qThBZn2x7zhX9aCFzE/XlYxotgC3S?=
 =?iso-8859-1?Q?rMPhM0RCTtcOvqUxi8WT5fRnG3D7tJEBx4+F6E1PjuV1t9TN9kBJvfbdyd?=
 =?iso-8859-1?Q?Mg1jpJqp8wCzA6Bl47PYHBTck8Cm8MC4PQxU9vpC5W64gytWZIaAs84SSp?=
 =?iso-8859-1?Q?YeNtcbC2r2BF3e0eHLHJJtrFfd6LRsvpZS35erlQxMa6QNI9Gy7l+/gCse?=
 =?iso-8859-1?Q?MyYlW8L012JXDwpMlkgKOXWRLW1P/4hGaokHgcwJLOqmZtHqbcK0Qsz1Kz?=
 =?iso-8859-1?Q?oQ7YoSI5PIsOYVlDTrvt7wW2CAxrMehiAba1Ry5+/CNXYnTrJtoYRaef1R?=
 =?iso-8859-1?Q?LEZ0UuuxrEQP94bDC8aAOc3TknIOf8lvqz7VNKpW1H2EAAIWaeaoUb8a0K?=
 =?iso-8859-1?Q?LLOJjOBiLUbtLTjv7XJE2SJbOOCalre+VbQ4+GpU9wMB9j3YBqYbrZrOzW?=
 =?iso-8859-1?Q?7+aS20oQfrdpyt49aksI35v8UM/GSED/z6aoVpU/gm4dKLWy06BOewhgoR?=
 =?iso-8859-1?Q?R9BzXg4R6EBMjDqZxNSr2Q08mvqcwU6xttH25iu3+nI5Ya0yviI2kB0B89?=
 =?iso-8859-1?Q?iX+i5fuWBhrEddS4QFBLvCDiy6vwYSqeYd1KOKW/QJaQK4GOAw3BrBbu0U?=
 =?iso-8859-1?Q?8tpOkfvnZ94CJXFiQ5ro0XbNgubZ2HEsscD1Ca2hYuhxF494Ym3NuM7ZtG?=
 =?iso-8859-1?Q?Hjqg3BYiBvnMc+snLVmMAbXL5NOqRFr64yyJwzt38rBPhknBMwGZ9+xLMw?=
 =?iso-8859-1?Q?41v9IV4I39rFEOrprGR1UZHTjpeHAThqlu/dZlrPUwwUaEdVsJBDp9Sd7Q?=
 =?iso-8859-1?Q?UAPU8FdYmTf6er3zhG6p3limxrtFJhwPOsoFSzyVVnvX+G4HTbjBVhNQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e9856817-dc44-40e6-91da-08dc9bdb3786
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 03:41:41.2352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxxhepRCgSRtpTyvGnm4lCuoF0vqWrYuVrrPcEk+fc6pfH6rui6VqVEQW2rx+T8RNLD15hrSpZc/o6K2WQ8iREkEing6JEr3sdFwByhyAAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR01MB9373
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jul 2024 03:41:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111250

--dg5te5kwvnszetjx
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [oe] [PATCH v2] apache2:apache2-native: Update CVE status
MIME-Version: 1.0

Ninette Adhikari via lists.openembedded.org schrieb am Mi 03. Jul, 11:48 (G=
MT):
> Update CVE status for: CVE-1999-0289, CVE-2007-0450, CVE-2010-0425
>=20
> The current version (2.4.6) is not affected. It only applies for Windows.
>=20
> Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
> ---
>  meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb b/met=
a-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
> index 48bb773dd..265313b3f 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
> @@ -41,6 +41,9 @@ CVE_STATUS[CVE-2007-6421] =3D "cpe-incorrect: The curre=
nt version (2.4.59) is not
>  CVE_STATUS[CVE-2007-6422] =3D "cpe-incorrect: The current version (2.4.5=
9) is not affected by the CVE which affects versions from 2.2 (incl.) to 2.=
2.8 (excl.)"
>  CVE_STATUS[CVE-2007-6423] =3D "cpe-incorrect: The current version (2.4.5=
9) is not affected by the CVE which affects versions from 2.2.x to 2.2.7-de=
v"
>  CVE_STATUS[CVE-2008-2168] =3D "cpe-incorrect: The current version (2.4.5=
9) is not affected by the CVE which affects versions up to 2.2.6 (excl.)"
> +CVE_STATUS[CVE-1999-0289] =3D "not-applicable-platform: The current vers=
ion (2.4.6) is not affected. It only applies for Windows"
> +CVE_STATUS[CVE-2007-0450] =3D "not-applicable-platform: The current vers=
ion (2.4.6) is not affected. It only applies for Windows."
> +CVE_STATUS[CVE-2010-0425] =3D "not-applicable-platform: The current vers=
ion (2.4.6) is not affected. It only applies for Windows."

Maybe it's good to keep the CVE_STATUS lines sorted.


Regards J=F6rg

--dg5te5kwvnszetjx
Content-Type: application/pkcs7-signature
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIITyAYJKoZIhvcNAQcCoIITuTCCE7UCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG9w0BAQwFADCB
iDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcTC0plcnNleSBD
aXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVz
dCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMx
MjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQ
MA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVT
ZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY75tqSvysQTqoa
vIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHbSuejQkq6uIgy
miqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfqB6Mfi/Wlda43
zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC0x7C7aYivTox
uIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz6OX2ZebtQdHn
Kav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh
2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNVHQ8BAf8EBAMC
AYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
EQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwudXNlcnRy
dXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDB2BggrBgEF
BQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNvbS9VU0VSVHJ1
c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3AudXNlcnRydXN0
LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9
FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TE
oGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav
2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32
VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn2FlIl7tP
bDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F2nnBtN4t5jO3
ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORdsNmaV3z/sPKuI
n8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNKcIvyg2omAdeb
rMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVn
LernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVvJsmzNicwggWB
MIIEaaADAgECAhA5ckQ6+SK3UdfTbBDdMTWVMA0GCSqGSIb3DQEBDAUAMHsxCzAJBgNVBAYT
AkdCMRswGQYDVQQIDBJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcMB1NhbGZvcmQxGjAY
BgNVBAoMEUNvbW9kbyBDQSBMaW1pdGVkMSEwHwYDVQQDDBhBQUEgQ2VydGlmaWNhdGUgU2Vy
dmljZXMwHhcNMTkwMzEyMDAwMDAwWhcNMjgxMjMxMjM1OTU5WjCBiDELMAkGA1UEBhMCVVMx
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
DgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsG
AQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGyMQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBz
Oi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYHZ4EMAQUBAjBaBgNVHR8EUzBRME+gTaBLhklo
dHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFu
ZFNlY3VyZUVtYWlsQ0EuY3JsMIGKBggrBgEFBQcBAQR+MHwwVQYIKwYBBQUHMAKGSWh0dHA6
Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2Vj
dXJlRW1haWxDQS5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggEB
AANadCCx1OE0/PYv8CMHn1qrbn3u9yIQuut1yAVv1daof2ULxyGOm/M+XnSW1h+xcUukaNTB
qwJx6KTauuWjVL1LRXz9+sNvQfS1KdJF9yfgcCTiIMNjfKap+t/dD275tpVeLbRSWyJaQRhb
GVjarr8yry1mnaaiJqv1TERaHqjDNpEwU/Ex8XetmkdJK01qCP+ZOEHwRr/pEB/oEKYB08+P
CfWWWT0YVlwW3FdYpMi70zyynhyE0ZkxBuwh20CulXlafk9nzu1ly9HDU2MG6fnKLirJLOj1
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggK/MIICuwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggeQwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjQwNzA0MDM0MTM5WjAvBgkqhkiG9w0BCQQxIgQgN2r7ff/v
41VAVMQ18x8gYca2VNfPz8rl5FeRdJnIA9cweQYJKoZIhvcNAQkPMWwwajALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEB
BQAEggEAigCGD2iBeQvEvQrSWrd14cYDrir0GHcAKBQrgWRBf/r9UFsrUAKXBbCXq03Jwn2A
wqz7qCufc/rCO2yXiR6snDjkxioDrNcrCvkongD2kRl2f12z0RUFJKcB1TF8cyfBsNqCq4TB
gr4l6lanYzUX74m9xCc14kRfIhdC3GU+vW7vZxesupiSdH3aVaerDIrnaBOAZb87dRn7HIYc
sInGRFyT6f6QvKA3gMu0WUr0q8r5lAN2keqMdtvKk5G413hHFcun+GG1QDA2+XskFs8ieVv4
DWHUh2mXn/PRUrU+eL8exE9/xTO9viyf/URGG0kgvpQnJ7OkB4Zn+jFQ+IbD8A==

--dg5te5kwvnszetjx--

