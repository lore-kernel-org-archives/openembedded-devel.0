Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08CFCA0FFD
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 11:24:39 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.134])
 by mx.groups.io with SMTP id smtpd.web11.48709.1756725877596480639
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Sep 2025 04:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=M1xZb03v;
 spf=pass (domain: navimatix.de, ip: 40.107.162.134, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xEuskAWcBHhDTNlr6FPLt6wlI9fmQt2evFh5rQ4pFQqBV6kmQMf4RmeDg4mwXpBxtCHPSQmHMY2jeqV1JBU8evGycycpFlC/YTNSyhZOjoxuK3D7/Kda7zURaJI36QdJzawTMU5bbojXs9Z2S0OKeI+8/q/CEz15YQeW9IFWJFrJX2ZZGlL/FoZI+CL5sVX023ewrXiF+HWLvYLmjZx85BDKgBR2A+Iz6bWFqkO4/ua8WKLOokCZVpHX4vLbbcFDP23f247vB+gTovDfeeRHJp2nT3oNQ8iWzCMIYi6hmcfKHpHcjdaqFKy341B0UvviOoFaWPnXNW4OoaU2WOANCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UP/DKhGF2x+BEcA9YnMpKBzHzu2WvhwFVo7riPJ2+Gs=;
 b=Ku8U2oCHdaPNMT4Kxgi0hmKxPceA82ytgKnhidzSah6lU6Bs+IqnK7jvhGf2LvQATMY1AQq+kdduoEJfOhiYe08eKpxX4OoJ4i9pEKQBOk/jMqgajre9hTnALQ+yHtK8lhamJFPYWgx4r7sW2xz/gxFcAKGlzeRBJjmh1mISJBfPv1axqx5kV1J6na/tuFb5fRUwUbI9xezAF5Xs6oAgPRgh0owWVHRDaTxrLPAR6RH8Dj8WQDB8JkjIZQTLOKKK7Tk9Vd0ie6fDDiCEIRue/ZlWKeTYCC7t4uXmsB2mXePPns658lT67dV1R08+aGhCIEmV8cJmjCAsyDL1Bv2cbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UP/DKhGF2x+BEcA9YnMpKBzHzu2WvhwFVo7riPJ2+Gs=;
 b=M1xZb03vsRzA6XbmfjjtoAnBpSxgLZprPQ5ohNgA6YURCkFH8ANljIx3WrKhrI4YoRm2tKDlFgpNjawR1KGilhg5NdkmyKa0XPskm9W2BVyQehb6MYwYAXL+3Ez1VCqA1zdWhQHpfVTmBrfKv+AarS0oseowVsEXERvCTabS4Gk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from PAXPR01MB8552.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:22f::12) by DU2PR01MB8752.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2ff::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 11:24:32 +0000
Received: from PAXPR01MB8552.eurprd01.prod.exchangelabs.com
 ([fe80::4e21:cdff:f882:4f32]) by PAXPR01MB8552.eurprd01.prod.exchangelabs.com
 ([fe80::4e21:cdff:f882:4f32%3]) with mapi id 15.20.9073.021; Mon, 1 Sep 2025
 11:24:31 +0000
Date: Mon, 1 Sep 2025 13:24:24 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: yocto@lists.yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: No meta-openembedded/krikstone updates since 2025-07-13
Message-ID: <mtcyc6sh3ncw36xq2ngxwfzqjo4jwakclrwsitncnjxeb3nke4@czy7r2g73dwr>
Content-Type: multipart/signed; micalg=sha256;
	protocol="application/pkcs7-signature"; boundary="5k434okv2eq7aqmk"
Content-Disposition: inline
X-ClientProxiedBy: BE1P281CA0362.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::8) To PAXPR01MB8552.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:22f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR01MB8552:EE_|DU2PR01MB8752:EE_
X-MS-Office365-Filtering-Correlation-Id: 512ac05c-632f-4ec8-3b6e-08dde94a1ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?FEWJ3zDkdV45DemjmpBgVlv4Fs2zk+orWWs4aF8f5AQMU7KrGzbykulcDZ?=
 =?iso-8859-1?Q?Aucw5qk4NccERAPt9j1P3Fm/zHvyiVYjhZ7Daegox3w/Ei5SfPMuAByC5j?=
 =?iso-8859-1?Q?HJcJn8tgWqTazkIQfnKkqdOsfjujFwTpmwz5uSQTjNgo4Ff9MuO09Nrl7v?=
 =?iso-8859-1?Q?sStlVdDrYoJpWD3PD3teJmfB4f+QWpa/6PyVLAhNymlrC+7i0MEtZU1n93?=
 =?iso-8859-1?Q?w6JJ12X13cmXxURqcBqm1Wi1nbScEXs+daY8COVX/1u/1w300X6wAXDyGk?=
 =?iso-8859-1?Q?ZZhb7tsSo59a0R8aRX3tW5QBjKO0wrxZCojMP7PY5Efldi+FhfR81IOHAj?=
 =?iso-8859-1?Q?8NVSeRVFbJGRa4b3g0m8WVgNO+EGEDHMA1DBoYOZj4F2OpB2D7f2Z9gRUV?=
 =?iso-8859-1?Q?jJ4epy13xPKvGE55+3jeMCNr/gZv09Gq9kLdffek5j9PabS573aJKf5KXy?=
 =?iso-8859-1?Q?iaTz9RkPPbwJgEAL1HR6ldNiRWhPKRoSvYMlDzdSiNhhtwF0oSj0+B1iLY?=
 =?iso-8859-1?Q?ErO26hNdIZgHLa2y+EJotRMEgUqddu8ikB+3ca0zP9owNQKvi95fwxNyhb?=
 =?iso-8859-1?Q?P1OnN3TlIqVDVHT48TvX08lXyEM98To47QMF03KyiNdWwP4GXAtdexVqV7?=
 =?iso-8859-1?Q?+AnILXo37M1XQeHCkuWPV6uAOzjfeKq9gUTpBqjgGf6YBVnhB0aJ5yyT1g?=
 =?iso-8859-1?Q?QioANUfdpLPc9iUBwnfoMuJ4+YrJDQH0OK2wTuAq6NBUVYjeA/1WoHR4mX?=
 =?iso-8859-1?Q?P4/5WmQ3bgaKpSP8NItRKtQrmeqqBlFGH7DQgGyeP1rW6Cm85gwF9KQgqW?=
 =?iso-8859-1?Q?Tgl+tSwsRIJ8PgaURwC3pTelDItgLMBPqte8yzE07gHFfMmfFpJbqehqov?=
 =?iso-8859-1?Q?1z8Q6fw5/1XSrUF+TibVztCeBXK1NzjeZwfWaQy8P/oqJGLiWvdwUmUjfB?=
 =?iso-8859-1?Q?t1NAJ8krg+XDS0YZw9Tn/j79gKssTA3jyTEmjrI55JcgxBRavIy3zc70GY?=
 =?iso-8859-1?Q?VJBoe1AOflR1GfIH/WoictbZOLFrgUMyY1DuXskjCcICT8E0mpgwK+WLQb?=
 =?iso-8859-1?Q?e/+gqLQyhNcHC5D/2ERfAma2mtfVGr26tstXx0PNuhabblMinN//rl9Oge?=
 =?iso-8859-1?Q?ChkQrgUP7KnBFSGwcPyOkfY+sPdkpQtUibO6HCv0T2uuaEba5g5UTmJ1op?=
 =?iso-8859-1?Q?P4rYxr96O1leO2DP5PMI+/JzgGBDLCmRUwgo+wkcz6gnRSGBQwBfezA+Al?=
 =?iso-8859-1?Q?BFL9NEgZvyGQ+1HOXs4y4SDzatnR6G1mv2d7xmbGBZ5+NI308qpuNJsZuW?=
 =?iso-8859-1?Q?57igis0PpYDxQnVxUtK8bk+RKD+J0T9+dcrzxPT/HIv5qluw3varih0W9J?=
 =?iso-8859-1?Q?bnbxTz1E3XUqHoSqxFYIFG9xXZm9SRNfKG8qaRJcypNTm5/wvxXE4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR01MB8552.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?MwXd1ig1gQoSR9YWkPrEhTdKqFCQ6wd5/gEhHSpOaOZZczKDhf+FpkUUjP?=
 =?iso-8859-1?Q?dM14pP7ueWo8W2OD3KqhAwmx7plZpyPa4S/tRtEupHUp3HtHapPIM9QhZ/?=
 =?iso-8859-1?Q?+SL+5qUsxPap2RHmUN9KiGDca+1sJnBSq7UeHMbW/88MkTyYvjeKIhTrfV?=
 =?iso-8859-1?Q?sbK55Vuek786MaarNT9t9uZXRsJujRSX9PKzub8Acb0qTNZnK45iV3zmYq?=
 =?iso-8859-1?Q?3wJW/QK47b4grUdbuPufAjpvs3wSpo5UUUNcJuB5jiorKsRQAbvYIDo2Eq?=
 =?iso-8859-1?Q?mGeDUrMKEHj+JNfx+7Grk7zzn8u8btH39bsWb+5ESETR23237v2oOWIdB7?=
 =?iso-8859-1?Q?KwUu+YeZmmLk4GTLdXGEHUwhptpV1JRilh0QE10e3J90xz7ru4x4ttAuzG?=
 =?iso-8859-1?Q?nldTHceXrld0sm58D2jpd3gYgJmuq3UWZFt04O/k2bXi0e9StvkEAAJ0yl?=
 =?iso-8859-1?Q?cqRd59kWxFJMJIbrU0OYkKgBApxcau7vUcV0Ij0jwCYs9LssuqMZdAfsSG?=
 =?iso-8859-1?Q?S1vPVaa7qpnw/hnHpMsFIpFUDFyLcqMB4ZruXZdkkND9R1utjIpmGLH6He?=
 =?iso-8859-1?Q?wu9Ol2N+FA/55rXfylzS1ODtBX4XDDW7Ehvoikr/ADzSaPPibbUeEq7J11?=
 =?iso-8859-1?Q?pqO/NMujrdbmwBhfqfT6ZRW5JvprPTG9vxIcCS6tYZCFyL5UTyJkH7xbh8?=
 =?iso-8859-1?Q?nXVAwCBLa8O/StQahystg0lwJj530KCq0zTXgjvcv2PdUvBWM5tM4ALCpb?=
 =?iso-8859-1?Q?+dR2NSZR6mS3KpSOdXkfCZZ4SqaoiihOmVuzNi7Gocz2Cnd5SsiLEjyRHd?=
 =?iso-8859-1?Q?2frPT8ZiI+VVXjo6S6AK/iiCcpyFa5e4oF+4C+yTPY+5YTt0Z1bKrkULc7?=
 =?iso-8859-1?Q?pjtLDSmLaRTylpr5a0Kcc9XZ8Q7i+VfCDtBRN3LPRZWrpQdFa2GKDui878?=
 =?iso-8859-1?Q?FDS6ianFM8opwOkAhiVRRClL6s4+6XSI6iZaYSZS5showSC0ktb2DcEmJf?=
 =?iso-8859-1?Q?wJCdegQnxvnCqt4B6es6Iuppt9DcfDhiPBm/RXwnf7OCjV7wACCawq38Ue?=
 =?iso-8859-1?Q?l9Y7Q0qRLlAJ/bJVLRd88cT1/6qkHiycq0FjyQzyilwko/G4AGCnweQLj7?=
 =?iso-8859-1?Q?Tbx1JByuTXqVlJjFg+ISJAR+LuWJj1o1aAEFQ92m0wBsgwWrJvJY2iPWoa?=
 =?iso-8859-1?Q?1ToS0708SjuwTEnVHmaIg7z9zHh0gbqHhWw2dvegctl+50gOFY46URVBNh?=
 =?iso-8859-1?Q?9N1fLVWNUYnD1hEb/8wiaA+U/1XOBcdF0rnqKR9Uw6Bvg8rVxqghgq/eY3?=
 =?iso-8859-1?Q?BznA1Js1XDOuYW2u9sMOv1nrHScN4mnorx1N58AoUs8vurywwCVk8b5BNL?=
 =?iso-8859-1?Q?Nhjp8Ha+3kCFSdBWKoDO6xhslkRE/+1cLNPmsP/VHcPbU01h3qekKoEsqS?=
 =?iso-8859-1?Q?dgnFNalq/5sx0AQpqcvS3jLrJ2SSfc+ndvtxfzFGZw1gNPUaCNKrDJmO/p?=
 =?iso-8859-1?Q?4FbE8DZYKncyyw2PNjB0imToueThpoRmb+okuTpcAmpV9H1Z7kps1WiqiG?=
 =?iso-8859-1?Q?8c+FBom6ixGm7MmNu8ov10EknIPQMZiRh0beEDEWFUYxCxixa/er5fIgXT?=
 =?iso-8859-1?Q?ecUz4BERADB2AolGEODDt8FqEvTE+D4bc7TDeLyUk/KFu5Jp34DpfOvg?=
 =?iso-8859-1?Q?=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 512ac05c-632f-4ec8-3b6e-08dde94a1ee3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR01MB8552.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 11:24:31.6235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r26rK9emt68xenw5Rn9p7qsRPVuR6EmJdE/LdkBeK71dmDNeIG7YDLT9hQ+avIHVDpkr0L8pleywNbcfjx9BeNxbeuYWpJ5IQ/taTQ2QJvM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR01MB8752
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Sep 2025 11:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119158

--5k434okv2eq7aqmk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: No meta-openembedded/krikstone updates since 2025-07-13
MIME-Version: 1.0

Hi,

there are some patches for Kirkstone on the mailing list openembedded-devel,
but no updates of the Git branch at
https://git.openembedded.org/meta-openembedded/log/?h=3Dkirkstone, since
7=A0weeks. Is a push missing?


Kind regards, J=F6rg

--=20
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

--5k434okv2eq7aqmk
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIIThAYJKoZIhvcNAQcCoIITdTCCE3ECAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0B
BwGgghDNMIIFgTCCBGmgAwIBAgIQOXJEOvkit1HX02wQ3TE1lTANBgkqhkiG9w0BAQwFADB7
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
jnZymQyd/teRCBaho1+VMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkqhkiG
9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkxFDASBgNVBAcT
C0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5ldHdvcmsxLjAsBgNVBAMT
JVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTgxMTAyMDAwMDAw
WhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFu
Y2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4w
PAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBF
bWFpbCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY7
5tqSvysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEibivHb
SuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHKRhBhVFHdJDfq
B6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFbme/SoY9WAa39uJORHtbC
0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManRy6XcCFJE6k/LHt3ndD3sA3If/JBz
6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMCAwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5
v1qqK0rPVIDh2JvAnfKyA2bLMB0GA1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNV
HQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYI
KwYBBQUHAwQwEQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9j
cmwudXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNy
bDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNlcnRydXN0LmNv
bS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcwAYYZaHR0cDovL29jc3Au
dXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEAQUR1AKs5whX13o6VbTJxaIwA3RfX
ehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFuSUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2
f102qxxvM3TEoGg65FWM89YN5yFTvSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGW
MeK1w+vnKhav2VuQVHwpTf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF
8Co2AOlVEf32VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bw
c/Tn2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZGXq6F
2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMGquITn/2fORds
NmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmdWC+XszE19GUi8K8plBNK
cIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4hYbDOO6qHcfzy/uY0fO5ssebmHQR
EJJA3PpSgdVnLernF6pthJrGkNDPeUI05svqw1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVv
JsmzNicwggUwMIIEGKADAgECAhEA/OH3TxzsxiYnBai43hD2fjANBgkqhkiG9w0BAQsFADCB
ljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMH
U2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJT
QSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTAeFw0yNDA2MDQw
MDAwMDBaFw0yNjA3MDMyMzU5NTlaMCoxKDAmBgkqhkiG9w0BCQEWGWpvZXJnLnNvbW1lckBu
YXZpbWF0aXguZGUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDNxFyhl/UuZdUp
uQiuqZBMSU/pN5SMIj4lkvTlrtp2jl4Q77wbv4vXdXIFWqKd3qtut55G0ptK4nXs1ARrh3AH
QAYwB0vW+PHVNPLs9yombnTeMgnEv/RQDFkH+DxoKdY5+DRUmcVO/tYl6ExMEBj6oh6b/63w
hIkC61WRETH3FpRCRbyNBD73OWt0KzxoKzW9xmdqfhNtylLcIFMzuv9C1WAqJ3mLbFHYaW4N
EMMckPZJWWYzvA2nwCCryerE3J9z4ZbSK0OK6DDRN9gW/H7+/4pHSIhdooGfQEdgLj+Z4ZPh
vLMF5DncBD8k5DOK8mlDxCKp4GsrLLuBfLQdxilvAgMBAAGjggHiMIIB3jAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQU3lTOaS6cJRsIzzEjdtC4j6GPtWIw
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
+9s6RvytgsBtk1dB4lJEMe32RnTa4ABWg2VpdqmG7wjr2BlUCzLzuxUxggJ7MIICdwIBATCB
rDCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UE
BxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAPzh908c
7MYmJwWouN4Q9n4wDQYJYIZIAWUDBAIBBQCggaAwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjUwOTAxMTEyNDIzWjAvBgkqhkiG9w0BCQQxIgQgf44oJzUP
cgXmZU9BnjKiBe/WUoDuCHF5EOcJ+iuTQfYwNQYJKoZIhvcNAQkPMSgwJjALBglghkgBZQME
ASowCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA0GCSqGSIb3DQEBAQUABIIBAJJ7vxkB4Y0w
Xg1KmKu1powYw226GpbejfK/6vJNjIiq0dqyYD2MFwdJYLHuDN5tk0i2KCvBv5tDCqFEZXX9
0F5n+83PYVeSxpYLUTttq68hRtsU3l5hennnqDTNGLMxNOoQqQDuj/7bJDWXHmeCtn/jfzkH
Iohg/bxGsqsovbgnRqTfRU9b6dKKdX+G40PjisaLl/sWVfWA+PCRltq07jZceK1s0+iKngaS
n7AORv9OTounoNyi0lkhT9laVbFtu2MajI8fYufizWDRlZk5wHg+zLrsOiIkMhRRvH6cRdgL
teo7FWNU5xYuFwSjiTmPdwkrmQbgr5C1G10t+dz2/5E=

--5k434okv2eq7aqmk--

