Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE0E9CA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 09:29:54 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.115])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3854.1790674183883563699
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 02:29:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=4YH4litW;
 spf=pass (domain: navimatix.de, ip: 52.101.69.115, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E0kVDktPiNbeBfXDhxJT2Dv2REzgPykPgSHv/045sXL57jebeFLP93yOSKgPzTCjPf4PU0waEvxLFiDRKmo48fFQ5yDQKIoxoJ12qi2tRKyRWLD54yuOZ5YxzuS5yfzTwB/PaHlT9QEklykEPFnItivY72oxeSS9HKgbncNjxT/VfSNl9F8+gYaYGgexIO3/KFyMx5GnLLFAlG9zxNiJR0vBxMcQDff8ztbs4wCupo6Y+VQJxZB6tc5DYt9zbniv669ROwnoFs4iga8B2/q7YwIWj51Cv3HbzQSOcHPkaBTrX1DGO4Dc9w/oHMb4zymVUYa2mqvPbAqpjnWVckZHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUe97Fbq09/FC8/nDhYGXmmBBJ2iWplSlR4qje3OSAM=;
 b=UjSfIK+DcXyBc8QQ9yrFx7Q3h0LYuqvMzFAl/kG66Fr1mrK6m458oGICZeTVgBv8iOJm23l5qc/SoYfNNrmQVyNLlxpwCpLnmewMx2ZrnYvvtNx6LgU/WzEgQ3VyPBR6SLAV5s3fybgyknMvphRRfhqbXJ2XA29QGM2KSvveXLYto95jdiSX1zOQOBHVywhxe6HnPVnZvNnr5RXJpmy8qlADgR6Egi+IY31eZivUtUM6bzt/0WVEXG1C9/iDoSW6l5ajHsuSmvOT0Z762E+4QemVpkZ+BGSJwfTSSbBquU93rsqGlnB97qCeeGtJR3S38JSV6iOWDHLoCj11Loc5IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUe97Fbq09/FC8/nDhYGXmmBBJ2iWplSlR4qje3OSAM=;
 b=4YH4litWECNvZ3WWIBrHHJpfe0N2YflFm7y/vsSLnGqWG0fIUibmIrDairDJBZEkTMUFTUVpyAERRpJt2OjUlejYtnoiFEzPd0HZ2kMFsgHUnlQmpg1pwwVpFfZxM/hbgaywbVnzFrQQuG8hgifbFt6L5BDe2/Byahx9dOJHBmo=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by VI0PR01MB12806.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:331::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 09:29:38 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%6])
 with mapi id 15.21.0451.024; Tue, 29 Sep 2026 09:29:38 +0000
Date: Tue, 29 Sep 2026 11:29:35 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] fwupd: create the fwupd-refresh user
Message-ID: <aruEqfFB1usll_BK@navimatix.de>
References: <20260927141257.8721-1-f_l_k@t-online.de>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="i2773uwtsyi5natf"
Content-Disposition: inline
In-Reply-To: <20260927141257.8721-1-f_l_k@t-online.de>
X-ClientProxiedBy: BE1P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::13) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|VI0PR01MB12806:EE_
X-MS-Office365-Filtering-Correlation-Id: da278352-a9af-457f-9aae-08df1e0c2e72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	I/s1mTXg0JzAqcfTaT9zAeUlXyUL1xDz5jFboHtu/Cir8L0OOmGXr0oVijBVPPEjvqrE+7CVJy9Zhi5nWvGwa+IavvJcIrUV8aDqDLsblIBK3whxgqVJ3TIXI96R0NFFwTpkAiH+7iQ/RjxjBZffyuqHSApwUhSw/L/C93149ieLiqjHF3QEIZQvI9Qt5X/pipNHrNQf+GutXy3Kp1gsi/mWo+NNG6YsdArUxLxYWwrofwn/fjtIn7GgmIo5pV0DbO3wkoYk3N+h0hsCJYK+XVt/w/TfzI0L0acw20oKABuRoq5pAod3AlF20cTwbrme262G24gT0eaylkq6vv1qahId5UvfL887XRAyy/Lu4Hg1d2c9R7flL4BOPWjUknDgU1Y0VyyVllxmtUwRj+gWxBb5HAd5iwphUvbu4Dk+Kfkcj66iMBIAmVXFh3aFLxz9GUQ65tmZAGEEvsId/Yrg2VNtzryX94404dd9eE2FhLiEd52W+OjglSafHeKW8LUhym1pBPRfFcmAPJadQwK1FKuSozqBDRPmGfjRyQImHwcmAYLus/4Jw5+6Vo2pun7/yp/PVQHTxr4EAvifb8dBMOCTVYXi8kwpR/3YWD4uGw4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?2W2r//RDb1YKVvbIDHEWEAEMIq0H5yH6ZbcGIaQd56KffKCjAQL6zbNe1y?=
 =?iso-8859-1?Q?njZ1UPajOHXUA/fHA3L6/zGlHUt/i82eT+0Y/BoK2CGfUDCLz7pFKk1aTU?=
 =?iso-8859-1?Q?L4YWikH9xFyoIBaE9HCqDGYXNPr6nFR8xnsj+N5UiCv8YAeHWZlMsPBSCy?=
 =?iso-8859-1?Q?AYSuFRNwSh6nYNn5eTgKLAqdFotrcsC8JuECHD6ExMEYizOp01UuzNhL4p?=
 =?iso-8859-1?Q?is8pm5Cl+tCsIdwJF+rSzCIIOeNhuiMqUVfijPITz5InHmb0ymH+5OO1Ze?=
 =?iso-8859-1?Q?U0O10NUicofgJYOIlT1G4CJl7om6l/t4JRfHkfKtOxst4OVBVtBCZGQAao?=
 =?iso-8859-1?Q?B/qeg0ht/t07069GqcrQfTAWhuzQJqDUJBTd+z2OHx6WrUgoia5A9G7oKV?=
 =?iso-8859-1?Q?bXYHblZ/p63RL98JyCFS0seNVCJ+Ij79DMJnNi0vYXpDhEcQAjbPkL2Qrs?=
 =?iso-8859-1?Q?ZgZvexbwTzkZ+n0SJUciTGaz40QPxAj0vc4h1BEnmi/UWNnhtWZDmm+/up?=
 =?iso-8859-1?Q?SQ1FDlFtvY9vXww5ooz+AcafffieVYB78QmkqVnUxidKx53KNm33b1pnEl?=
 =?iso-8859-1?Q?xO66wpNg5eWiMCtRGPKY4ytRU5rMnDOsvmP9T6EaLwwXD9ZWPmxgBJbMTd?=
 =?iso-8859-1?Q?9KEmYdxXg1WQ2I0LNruViZis4YBeoaiVM56lCUcGxRBtKU85bSLSdW6hSn?=
 =?iso-8859-1?Q?BocFMFsDvDT5PZYDwI7YLTO5FdzGKe5x83+2FUZeDGPuF4vmw6eTSyIjgs?=
 =?iso-8859-1?Q?vZkd3XebEnCvnzLP5wfVTc4CAo9XCYqN+KQK8m4fmESai659EfKCcSw0YV?=
 =?iso-8859-1?Q?J9s55voJ+k3GN2kueEpcEhipRIw+Z1ZtrLXCW9qQc4ffzgC9TdBmF+YzeT?=
 =?iso-8859-1?Q?YAMkG5cj+OLl1p9QoXUMG3xuYeyNzGYV5qta+w/u3Vcpbh4oM+EMhdMjdh?=
 =?iso-8859-1?Q?kID3MggIhtacKThWaIAO3tng9D6HqZQ7T3D/pqQwRY/6pZwpOsCOOo7c1O?=
 =?iso-8859-1?Q?t/JOvLONh2zQcWZSz+SBdfbZW/tq+J9e5FxKoIGAnHdJVnBK4gwOxf3Hs2?=
 =?iso-8859-1?Q?S6yFtVpN9cBc5q5SIeszgen1jItK/VpikorrG+mT0bse8WpyA6kPO68F9Y?=
 =?iso-8859-1?Q?dFdQ00SKIrUsE8xnMaWAjEiT0tLciwmDIRM9NLAAajN8QbHuLsRShApSf0?=
 =?iso-8859-1?Q?6HtZPhBsPAyvrputAVB2728+5OaQA1PRtG0B0eeQ2QHeB3nZV3VP3BzVvZ?=
 =?iso-8859-1?Q?72uyfq1BiGkk7Vg83tczJ6TXNtAGLDHQCMUWkVSAQ042/826rWZsxUhB4P?=
 =?iso-8859-1?Q?TWvfLB/1TPFG+M184/Ul857mVJQFpBjUakuTrCvxY2KwmWLilq9kQDLrY7?=
 =?iso-8859-1?Q?Df0UwhXV+WGoZAjHigN0HovvEGtwEYJCZfRMEnyNPetabeyq2f+cK8CRhg?=
 =?iso-8859-1?Q?r2wSn1dtMUJ2GMwx7N1M3xaiNtmVDLrjRJPBXFul+tyFem2uXpCr+AU8UA?=
 =?iso-8859-1?Q?Mpj3XRSaI4KqqifgwEN++On3KtihDJdkLa/9NKjvQn5Tiu3kSIgCjoCXd3?=
 =?iso-8859-1?Q?Oif5itBoy54bL0HKqIwziHZ8iXPuc92QcYCAvx0pHZPJdk28IBI3uWxBeW?=
 =?iso-8859-1?Q?c22x5QMTYgtLysTnbB4hAlGW5oY9Vs/ssjfDxh7MtvGT9DeDtWqTRIZZ7w?=
 =?iso-8859-1?Q?8mBpbsnQjR/lNZOQnCdZC75L0b2N9RT0SA8XvmIHA+ijXhscoxkfB0p1X2?=
 =?iso-8859-1?Q?sxjFY75r2gJLEKJo4bLB/CBQFED4Gd0ivKVYoLTqHR7MFBdTuCuka9xPF+?=
 =?iso-8859-1?Q?32U1J2k5hY6HJHT4q+Fsm+Zog38m090=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: da278352-a9af-457f-9aae-08df1e0c2e72
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:29:37.9328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vOYpkX33X5+oPS/XnAQnmfvYoylm/Rs3/izAdpIyR4vwqo073qEnn+9UYVNTILx4V58MVLBhRDSpDXa+3+fKhAd828KoL6UNhuoDY9QmTec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR01MB12806
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 09:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130476

--i2773uwtsyi5natf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [oe] [meta-oe][PATCH] fwupd: create the fwupd-refresh user
MIME-Version: 1.0

Markus Volk via lists.openembedded.org schrieb am So 27. Sep, 16:12 (+0200):
> @@ -36,6 +36,9 @@ GIR_MESON_DISABLE_FLAG =3D 'disabled'
> =20
>  EXTRA_OEMESON =3D "-Dvendor_ids_dir=3D${datadir}/hwdata"
> =20
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${localstatedir}/lib/fwupd --shell /sbin/nologin fwupd-refresh"
> +

Maybe ${sbindir} instead of /sbin?


Regards, J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--i2773uwtsyi5natf
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIaGAYJKoZIhvcNAQcCoIIaCTCCGgUCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghehMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
MQswCQYDVQQGEwJHQjEbMBkGA1UECAwSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHDAdT
YWxmb3JkMRowGAYDVQQKDBFDb21vZG8gQ0EgTGltaXRlZDEhMB8GA1UEAwwYQUFBIENlcnRp
ZmljYXRlIFNlcnZpY2VzMB4XDTE5MDMxMjAwMDAwMFoXDTI4MTIzMTIzNTk1OVowgYgxCzAJ
BgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQHEwtKZXJzZXkgQ2l0eTEe
MBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQDEyVVU0VSVHJ1c3QgUlNB
IENlcnRpZmljYXRpb24gQXV0aG9yaXR5MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
AgEAgBJlFzYOw9sIs9CsVw127c0n00ytUINh4qogTQktZAnczomfzD2p7PbPwdzx07HWezco
EStH2jnGvDoZtF+mvX2do2NCtnbyqTsrkfjib9DsFiCQCT7i6HTJGLSR1GJk23+jBvGIGGqQ
Ijy8/hPwhxR79uQfjtTkUcYRZ0YIUcuGFFQ/vDP+fmyc/xadGL1RjjWmp2bIcmfbIWax1Jt4
A8BQOujM8Ny8nkz+rwWWNR9XWrf/zvk9tyy29lTdyOcSOk2uTIq3XJq0tyA9yn8iNK5+O2hm
AUTnAU5GU5szYPeUvlM3kHND8zLDU+/bqv50TmnHa4xgk97Exwzf4TKuzJM7UXiVZ4vuPVb+
DNBpDxsP8yUmazNt925H+nND5X4OpWaxKXwyhGNVicQNwZNUMBkTrNN9N6frXTpsNVzbQdcS
2qlJC9/YgIoJk2KOtWbPJYjNhLixP6Q5D9kCnusSTJV882sFqV4Wg8y4Z+LoE53MW4LTTLPt
W//e5XOsIzstAL81VXQJSdhJWBp/kjbmUZIO8yZ9HE0XvMnsQybQv0FfQKlERPSZ51eHnlAf
V1SoPv10Yy+xUGUJ5lhCLkMaTLTwJUdZ+gQek9QmRkpQgbLevni3/GcV4clXhB4PY9bpYrrW
X1Uu6lzGKAgEJTm4Diup8kyXHAc/DVL17e8vgg8CAwEAAaOB8jCB7zAfBgNVHSMEGDAWgBSg
EQojPpbxB+zirynvgqV/0DCktDAdBgNVHQ4EFgQUU3m/WqorSs9UgOHYm8Cd8rIDZsswDgYD
VR0PAQH/BAQDAgGGMA8GA1UdEwEB/wQFMAMBAf8wEQYDVR0gBAowCDAGBgRVHSAAMEMGA1Ud
HwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwuY29tb2RvY2EuY29tL0FBQUNlcnRpZmljYXRlU2Vy
dmljZXMuY3JsMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29t
b2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4IBAQAYh1HcdCE9nIrgJ7cz0C7M7PDmy14R3iJv
m3WOnnL+5Nb+qh+cli3vA0p+rvSNb3I8QzvAP+u431yqqcau8vzY7qN7Q/aGNnwU4M309z/+
3ri0ivCRlv79Q2R+/czSAaF9ffgZGclCKxO/WIu6pKJmBHaIkU4MiRTOok3JMrO66BQavHHx
W/BBC5gACiIDEOUMsfnNkjcZ7Tvx5Dq2+UUTJnWvu6rvP3t3O9LEApE9GQDTF1w52z97GA1F
zZOFli9d31kWTz9RvdVFGD/tSo7oBmF0Ixa1DVBzJ0RHfxBdiSprhTEUxOipakyAvGp4z7h/
jnZymQyd/teRCBaho1+VMIIGkDCCBHigAwIBAgIRAJNhG7GFaX1Mm3w/sd+ASzYwDQYJKoZI
hvcNAQEMBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpOZXcgSmVyc2V5MRQwEgYDVQQH
EwtKZXJzZXkgQ2l0eTEeMBwGA1UEChMVVGhlIFVTRVJUUlVTVCBOZXR3b3JrMS4wLAYDVQQD
EyVVU0VSVHJ1c3QgUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTIxMDMyMjAwMDAw
MFoXDTM4MDExODIzNTk1OVowWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAJHlG/qqbTcrdccuXxSl2yyXtixG
j2nZ7JYt8x1avtMdI+ZoCf9KEXMarmefdprS5+y42V8r+SZWUa92nan8F+8yCtAjPLosT0eD
7J0FaEJeBuDV6CtoSJey+vOkcTV9NJsXi39NDdvcTwVMlGK/NfovyKccZtlxX+XmWlXKq/S4
dxlFUEVOSqvbnmbBGbc3QshWpUAS+TPoOEU6xoSjAo4vJLDDQYUHSZzP3NHyJm/tMxwzZypF
N9mFZSIasbUQUglrA8YfcD2RxH2QPe1m+JD/JeDtkqKLMSmtnBJmeGOdV+z7C96O3IvLOql3
9Lrl7DiMi+YTZqdpWMOCGhrN8Z/YU5JOSX2pRefxQyFatz5AzWOJz9m/x1AL4bzniJatntQX
2l3P4JH9phDUuQOBm2ms+4SogTXrG+tobHxgPsPfybSudB1Ird1uEYbhKmo2Fq7IzrzbWPxA
k0DYjlOXwqwiOOWIMbMuoe/s4EIN6v+TVkoGpJtMAmhkj1ZQwYEF/cvbxdcV8mu1dsOj+TLO
yrVKqRt9Gdx/x2p+ley2uI39lUqcoytti/Fw5UcrAFzkuZ7U+NlYKdDL4ChibK6cYuLMvDaT
QfXv/kZilbBXSnQsR1Ipnd2ioU9CwpLOLVBSXowKoffYncX4/TaHTlf9aKFfmYMc8LXd6JLT
ZUBVypaFAgMBAAGjggEgMIIBHDAfBgNVHSMEGDAWgBRTeb9aqitKz1SA4dibwJ3ysgNmyzAd
BgNVHQ4EFgQUp9eVd+tKwyfNk743TCaEIRR9XZgwDgYDVR0PAQH/BAQDAgGGMA8GA1UdEwEB
/wQFMAMBAf8wHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMBEGA1UdIAQKMAgwBgYE
VR0gADBQBgNVHR8ESTBHMEWgQ6BBhj9odHRwOi8vY3JsLnVzZXJ0cnVzdC5jb20vVVNFUlRy
dXN0UlNBQ2VydGlmaWNhdGlvbkF1dGhvcml0eS5jcmwwNQYIKwYBBQUHAQEEKTAnMCUGCCsG
AQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0GCSqGSIb3DQEBDAUAA4ICAQBw
pquT4ow8LyRHG6NgR4oUsFncHl+eWLMtEBwv90EpGCGGDDDjoO23j4Zw6tS+THzwgz4SyP0M
FQaMzHj40enm+z1Y29QIQCnJTeDOHWHKMRxeiFD8MBso+XgVM6z6MMDbbJ95btM/4eE3LyaB
uBbheiINaAVieIdxLq6+dVkm00kmvMdlARsTkEvr5a9nYhGAs8T5RBD1DozAv9r89WJcn+QY
X1M2l5vv0ws3Me1ziVSjC2cRhcae4seOFFjkRdJItzfk6H/Wm2FNv2XG8nE1nbgN8UCdhORO
lQGGQ9DN152RmSJ1A6KAJIldo3YrJNiO8J4JLAE5/Tl9CNUHtbdYTOZLCAZ95G1g2GELQ2DQ
1Xxo55iNojqUA4w1feORe86Dq2P08xzolHKepP1LGEw1gDGCkUYR0gVXLJExGd3dfEZDm0mm
U7vWb6vRyLso/GUawFD2MZS4kK8/igkPO2Pkjfd5HD7hknpPVhcuBaWxWj8Q7bjwVlxGwts6
sNZ+UJ5HC4c+11vVoV9cdbb93qpbWn/d+azhit6kRYdUmAUl8Bt5VRBMKCUnSaAAspxb9kFK
+cvm/MjErxN63YNEcMs2QKs3N862V8MQaoKqD+KsKnaLxF6pxRpOotenpfUTNE9GqxP9nI6i
9rSHf16VFwW4NnJ6yUgzHUMdIqtTge98VjCCBiowggQSoAMCAQICEHb3t/4teUvaYKSSf0s+
XMIwDQYJKoZIhvcNAQEMBQAwWjELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28gTGlt
aXRlZDExMC8GA1UEAxMoU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBSb290IFI0
NjAeFw0yMTAzMjIwMDAwMDBaFw0zNjAzMjEyMzU5NTlaMFgxCzAJBgNVBAYTAkdCMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxLzAtBgNVBAMTJlNlY3RpZ28gUHVibGljIEVtYWlsIFBy
b3RlY3Rpb24gQ0EgUjM2MIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAk7qaEDRX
E35PMot8PAmiNaWYblItPHGyt1+H+DUs2GAYHofsdeURmjngaB0C3GcUcrVav1HsGjJuoh77
nRif3O0gxUJGnIzj4ppKxxTsMNau8qvL+FnEkK6VrnqqnKIL3myjhJRdghUlK8Lgetl/3Pdz
KQ7JO2xPZFklrLRm8EQSuUdyccvb+auvRdSnwrxsOvV+9n18ZdeahL/RBxM7R31DhVkMPO19
EiQMj4PBl99wuWzXWL7yLgYh2/TJvIpSOf7waFcHkVYvfAPivV/ulUVaN2ncpSvlE4/TjA8d
5NXKOY+C7RcyD3UZIi6XVg7T81gOfnvE/eEGsyHmgjzLFDYpgBwVOd7jLQ9jhLX4hdRbm959
FrXQQrozzfTbyxRIwMwDqgUoPxIQVU9A7qXKu3yRXsn7OvnjYkYve6X0ZifTbjZaf4Hi/KXW
fNn67zqCt0eNONM2QB5bNqg14qLooRQcgRpSNAEB4UsSyhwsJqEhXz4QwPFWn/wwvEJ0FgYD
AgMBAAGjggFsMIIBaDAfBgNVHSMEGDAWgBSn15V360rDJ82TvjdMJoQhFH1dmDAdBgNVHQ4E
FgQUHwSkfkz2MrEJ4pF84WzfUr/PLv0wDgYDVR0PAQH/BAQDAgGGMBIGA1UdEwEB/wQIMAYB
Af8CAQAwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBEGA1UdIAQKMAgwBgYEVR0g
ADBPBgNVHR8ESDBGMESgQqBAhj5odHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3RpZ29QdWJs
aWNFbWFpbFByb3RlY3Rpb25Sb290UjQ2LmNybDB/BggrBgEFBQcBAQRzMHEwSgYIKwYBBQUH
MAKGPmh0dHA6Ly9jcnQuc2VjdGlnby5jb20vU2VjdGlnb1B1YmxpY0VtYWlsUHJvdGVjdGlv
blJvb3RSNDYucDdjMCMGCCsGAQUFBzABhhdodHRwOi8vb2NzcC5zZWN0aWdvLmNvbTANBgkq
hkiG9w0BAQwFAAOCAgEAWooWgE/1j6esLJfOKB48VUcFaafH6wZcbEln7ls6BP7IvAP2GDRF
33LtQhuVpt7qIqm/RXxWQLaC0yA14LE/pZZdm6CkkoWlTRgzZln6rM9dm2JvqyX2TLS0Z7P1
E6o9EmPx53bRNrnauUu2lYYfpODYq/5LzDPWBjGNK5QW4+oKCykPzzfSveoF5KTuW1xxy+da
EmtXm3hgYwYvTrB/7jHZU2hVbj/8DUAf/JCa/+AdQCtUE5XzKl6o5gGtWahY1yh9smQ3b48/
cto1QW+ZwGCHk5CLr5bDhe2uh2ifn8BXxBOf33D6YHjnrOUyNxi43QD2wZRwyL8arpu/Ljl4
H9zwIM0Q4vfbZuDghYLDnRVC1fGYBArWxw+uvoEMvO7lcc9MTezGkonPmanHYAcGffaIXpIQ
rQWtWS9Pb22jEy6YZCUiqH4YcqkelJHqJD1HBLVMOPaCn2wXgBbv9jvZQsP9yFrD6tKX//ue
D1V12I+L8qjUj17/ZRuxLcPDCF6vb/Svnu38Ejni16jHUO9G/YWFBZOuRbutUEgEp8hMXEzJ
XO43NzBthf80VV86GaC83nNy3TETFF2yav+ioLIK7Qd5NRnI4DXNQYPq6j8qkEnODayXA1bR
7V/qy4BrdrLHJf9NHMiANvCNiDn02MuniTPmb+rp4syaXK409MSG4PYwggVWMIIDvqADAgEC
AhEAsFHj29zvfVPWA2FcnDeJlzANBgkqhkiG9w0BAQsFADBYMQswCQYDVQQGEwJHQjEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMS8wLQYDVQQDEyZTZWN0aWdvIFB1YmxpYyBFbWFpbCBQ
cm90ZWN0aW9uIENBIFIzNjAeFw0yNjA3MDIwMDAwMDBaFw0yODA3MDEyMzU5NTlaMCoxKDAm
BgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEB
AQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUpuQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wb
v4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AHQAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH
+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63whIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9
xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4NEMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK
6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPhvLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQd
xilvAgMBAAGjggHHMIIBwzAfBgNVHSMEGDAWgBQfBKR+TPYysQnikXzhbN9Sv88u/TAdBgNV
HQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQC
MAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMCMFAGA1UdIARJMEcwOgYMKwYBBAGy
MQECAQoBMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vc2VjdGlnby5jb20vU01JTUVDUFMwCQYH
Z4EMAQUBAjBNBgNVHR8ERjBEMEKgQKA+hjxodHRwOi8vY3JsLnNlY3RpZ28uY29tL1NlY3Rp
Z29QdWJsaWNFbWFpbFByb3RlY3Rpb25DQVIzNi5jcmwwfQYIKwYBBQUHAQEEcTBvMEgGCCsG
AQUFBzAChjxodHRwOi8vY3J0LnNlY3RpZ28uY29tL1NlY3RpZ29QdWJsaWNFbWFpbFByb3Rl
Y3Rpb25DQVIzNi5jcnQwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLnNlY3RpZ28uY29tMCQG
A1UdEQQdMBuBGWpvZXJnLnNvbW1lckBuYXZpbWF0aXguZGUwDQYJKoZIhvcNAQELBQADggGB
AD6hnou447615g2A0y87bR6mtVI+C+wAFCqRqfrCgHu0dB29VPiVXIVYbPN7H6meSMNr2lFo
e81aZfbE7LMQj98hVKA/ljqWKJe6R5W1Tssv1568G9GJ0fvL1iGT74LuqcuYPt0LVH99Q1rH
MfCBKpsyFo7P3JwoqEkuIpbAhaQMYdTcOgeHMYOLrIdx/9wQ1BXjTa/Cajvc3QxJEb308wgJ
PBxhl8FWWm5MNOynBmRZPKeOeMF5113u6b03KTmXhBqSVeN2nZXEZ+B+wNcJv1dr4Sa0/k6p
tbjZcr9ZkK7QtCarYgLDbsSbcLRJMuXUSHf1yaLwihZWJ1asynbFEmv1SrRSQ+3Hv4megEeY
kYmW9Jiu9qh5z6S98F7JhsP4n6tGs24Xz7l2I/T+BmJMRglTeQnzBihH0kFPUanlApSKC99A
clKs/tfOX8HKHs79Bw3PjRjJDog4D4Pbkom8UwQ/m5sCuOf7v632pjK2jm3OErS3XZxIjnFV
4Gl+5jZ1zzGCAjswggI3AgEBMG0wWDELMAkGA1UEBhMCR0IxGDAWBgNVBAoTD1NlY3RpZ28g
TGltaXRlZDEvMC0GA1UEAxMmU2VjdGlnbyBQdWJsaWMgRW1haWwgUHJvdGVjdGlvbiBDQSBS
MzYCEQCwUePb3O99U9YDYVycN4mXMA0GCWCGSAFlAwQCAQUAoIGgMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDkyOTA5MjkzNFowLwYJKoZIhvcNAQkE
MSIEIDVMnWt5+zgHMilBRpJSHyvuIh3U+R3+r+2GH8aU5VNnMDUGCSqGSIb3DQEJDzEoMCYw
CwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzANBgkqhkiG9w0BAQEFAASC
AQCF0N9Mw0wkRL2uGa3xfsgYFsTBUtldRkzzXD30l6eReJKYXuFixF052c3XNkkW1zZyWkW1
7Egy7SM6D+Fw5rpsLOLJQL6x+3YccMt3xt0YigDWzzQr8knUdcaIfJjDD7Wg8JX8XWFvQOzG
k22pFwAMBBx5V8IIxe51ivlLaoS+DXc0RNwhFi1y6GzZ/U9FulEVANuA7+fhmTCPhZOqpbSx
rlBPptACSFy/877jiaFNwKyvx1NjFc9E4hP3Uj3UngU8kBp4D0fzm8Kw+gDHTXeTFGFwIpdx
DFtfi9Kdz/yxb6WOKJGA8xiXM90pxhxq+hZ+hdn7ZSOHLNC5N+lsUC4e

--i2773uwtsyi5natf--

