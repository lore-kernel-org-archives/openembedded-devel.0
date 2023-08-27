Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC1AC83F11
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 16:16:49 +0000 (UTC)
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (APC01-TYZ-obe.outbound.protection.outlook.com [40.107.117.40])
 by mx.groups.io with SMTP id smtpd.web10.569.1693153001570428854
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Aug 2023 09:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=gH4YT0Xl;
 spf=pass (domain: advantech.cz, ip: 40.107.117.40, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fv2rtuxUhW9t0B5BZLtvk2ZQVYQJfHzz1tXEBR/8MwOBTa99w0MPG1W2TjoEon3reklsQlTt5VdgRWQ/tChJcX7rsr66BSQPn9jwT3WUf7v0IdiISVqJZ8wT69GSMZUzdCZvQWUPLYboTLjpd7W2KfYtnyRdt2Q3MGs06hsruuPWOzk662sNWRR0c3xschy2Fe2F1KodcQM+tMCVh+wMVCIxaH1ie7rPcEr2kJxTmEzk/ZM0MSWjJYa2QSpNl/a8DoyNRnAsbHJOxiAF26I+XQJy5vB2SrFbyIQ8wm4xMaCIrLerbGKkbUiqix80IgEtLLZ4GfagZW1/LvWzQJxmUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g47c78hfc/dEVXTrBMBf6Sr+I2RF/krohxxKft3mfv8=;
 b=aSqzICzCh0XEkBrsKviej1VFab46+XVt+OQ4/O3ima/iqkgWl6isvnwVDq6rIYvi0Gv03bl8aLda8L83Utisggjoo/o3/gUiLyPvSKgJNa0ZcMNOJ00RmFSQ0eQRFEeLWQug6vbJkg+NVyepFPlpkzv0RtnAqaZavffPq6XKb2F/MpEKq2WxrkUemyhzqAVEzb4rPVQ7uOTaXX2USaIticqILoAMFxXkcNbByxf2yK2pte/bGAB4i2erG5VS6qc5p8lp+L+FztrJeA2r8HmTRJiZlvztu+VDMbS/1VgMR2pVWRhzABRJPJs/3HCPOoOHBRPgXtHsKTz1TE+Qu4varg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g47c78hfc/dEVXTrBMBf6Sr+I2RF/krohxxKft3mfv8=;
 b=gH4YT0XlAk3nIX2+LMrhl42KEslt4ztxjoLc+oBEz4HjfYfvaBbGEywvIDn59vCeWni8f8euL41A2GzOTJp61q5K/Nxp0kBRNp1s7Dn3vIT7LlyyXZxwEBJeFa2uKbrkZXsYSM+h4oHvQCRbNQXuRifPkmmfpCYOwWVHTIgjE0SJ2l0VpzmHYlz4ld2epb0myu3fIODF7/LoCTSi1Y5G8v1YpAeGubPzKlvI2aDLNxgmy+8U1f3EmDDxIfmyEyQ0JYAr2mUV4UtD1XyBuGOxypgpiOqAlpEyuizum0DQtFcon4f+FQDJANA/1UFfutz6xdRK6nk11HDiKnVLmNdJRA==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by TYZPR02MB6502.apcprd02.prod.outlook.com (2603:1096:400:424::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Sun, 27 Aug
 2023 16:16:36 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::5974:168:dff:f88c]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::5974:168:dff:f88c%7]) with mapi id 15.20.6699.034; Sun, 27 Aug 2023
 16:16:36 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-python][PATCH v2] python3-sdbus: add recipe
Thread-Topic: [meta-python][PATCH v2] python3-sdbus: add recipe
Thread-Index: AdnZAaqZnmU1HIMZTM6mm3zsbnvEzQ==
Date: Sun, 27 Aug 2023 16:16:36 +0000
Message-ID: 
 <TY2PR02MB367858B4673D00252E75C3DE81E1A@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|TYZPR02MB6502:EE_
x-ms-office365-filtering-correlation-id: c6af8ae3-ff27-4d56-17c1-08dba718fc9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qkiKBrjHjmKuAm/M+b3TYg9m6gvRbDVqL6/P46BPiMrB9p0NA1SM7Z/3Bz2LJ7p2iaL+HVJSeE1096dKXYiMdGCmuVKGKEcYRJMrK3e2UYOMKdn4sLKXfSaRt1k8BihwbqYgik07wD43dXLmcNWF2yErNuHsELjf2MDS0KNdogvj0y0EAz05VNrjGopIFj+4ZV1sC9iSOq7rtxIpHHV96V87G7H/mg69Y2Sb8vnQq9wYt4UlkstrF1MRWGFgoFGpTYE3du1iGxPXCZK/1Wr9uowz/MDyWXX/Z68XPfYAr7dGVDpRbVzQNxikROyrcMkyzdlWq6MtG2qbyuh8e6Zz4KmLht4J96E8p1z9p6zipU4pOnyo1GmKBD4p6DUOToIozwnX1xvAAKFBOVGLrGoJQzGakFfg5tIkkUtnZSrHfQcQV86bFBHRgvlLwRYrPc13VBC8C6FtHr1ak9/XEyXSyUVekO62fvVyRSvg9SabgH9fJvTonhxK9LNXYHlTQCO5omSVLiCwq7bmCvkv/2+TmGgI8+ln1gLHdkmjdkARTwLfEEe+8xy92LbZ/zFpaVYnjW7wGTjoQoSckVhpFx7nK3VOhvxR2yOg6l1b5tmNbvs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(39840400004)(396003)(376002)(1800799009)(186009)(451199024)(55016003)(71200400001)(7696005)(6506007)(9686003)(76116006)(52536014)(2906002)(86362001)(5660300002)(33656002)(44832011)(316002)(38100700002)(8936002)(41300700001)(66446008)(38070700005)(66946007)(64756008)(66556008)(66476007)(8676002)(6916009)(122000001)(478600001)(966005)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cjJ2alpvdW5nNmNZWkxRY2tBUy9jaHdxeHE0eVp1blpEYWdlaDBNUmJKU2VU?=
 =?utf-8?B?S0FRbUg1UGtTdDFFOFovVVAwWXRUVVZLNFlVL2NBLzd6dEdLL0U5VlZDam5T?=
 =?utf-8?B?bktMd01RNHhJSjBWdXovZnRaNHY3WXRBbWNaTmEvSlFBUFpPczJ0cG1LTEZO?=
 =?utf-8?B?UTJFVnpVUFRSOU0yTzRxR3ZucUJiOG5LWURLQVgyNzFQK0dOZ1JlT3gzNWlW?=
 =?utf-8?B?T0xpZ3FoWTNHaFF0QW5hZ3o5YnFhU3poTnl5M1ZMaW15VW9PR2ZCT0tSaHpi?=
 =?utf-8?B?YmlFNy9laktLbWpFVnllOXl3cjhYclFLaVBicmRPQ0ZqcEJTd24veHFxdi8w?=
 =?utf-8?B?TE5VN3o4Rmx2VUlSNnZFY1RuL1doRTVvaFlPTU5WZDVuNkJWcEhRRldGbnk4?=
 =?utf-8?B?N1VNRlQ0eDREYTVWSGdSaWM5eGJPd1YwZmxSQ2Z3Y2ZTQVIvSHdmelFOYUpk?=
 =?utf-8?B?NTlVc2VvdTNEVDMyeXh1SldRVTFKNjBKQ2xSOXMyUm9lc0tZMlBHc1g1Q3Ju?=
 =?utf-8?B?QUIvZmdMR2o4S3MxdzdtbnMyenlYQm9TVlJkR2JaTFJLdDRUV3JxdG10S1ph?=
 =?utf-8?B?T1JDQ3AwN0VPTzB5azdHYjlTUVFHOTVFL2VvMkN4eGwzQ3ZBdXZCbVlrUnBm?=
 =?utf-8?B?YW9qT2IxMDdSV1FmTk9tMDIzU0lSUzB5Y2NkVUZRdEN0aEU0NVdmQjNDbVBN?=
 =?utf-8?B?aUgzSWtia21sdFAyaVVXcUpZZGpJLzU1TGh1MmZZbkwxZ0YvUkF2cWtySzZD?=
 =?utf-8?B?eUFBZ0l5WTN2bGJ4VnNFbTd1dmdtb2VQTmdweEVBN0NQTWdjM0VYS09hRXdj?=
 =?utf-8?B?OVB6cll3SlFSNy81b1lmcWc0VTZKa1V6OGE5NXBUajBTemFHTXJFOE5zZ2g4?=
 =?utf-8?B?N09lNmJ3VEdsMjAwTEJWRkNaeXIxakszRHEvUUNqb3ZoTDFFUHhKSXQzbCsr?=
 =?utf-8?B?ckFiU0tDUXJIQ0RCK1Q2ZlcvTmIzNEpNbFdPZXZMSEZoR1RuT0N1c2Y3ckFw?=
 =?utf-8?B?WlZ5bHZlemRPT1JRWExtWDJjQjRrR2pCRVR1d2FsZmhWZWJYc1JxcXFEUXhE?=
 =?utf-8?B?SEpxQ04xME9Hd1pJNENJdVB0K2tWNFVKSlVCSXhLUkp6b0Vod1ExcHRkVmJJ?=
 =?utf-8?B?QnFJSFJXU2I5TGhIUk5WRTRQV1hIbnVMNkxFZ1BPeXpIZGpIUzV5SkQ2SjUz?=
 =?utf-8?B?NWdlT0VUNFp5THBFUU1adGc4azFTc1V1dEdBZkpvRFhROHAyT05XM3k3QjFh?=
 =?utf-8?B?WEQ5Kzd2SnFBL2NwbVliRFJZQW5kNTFrVmJVbG9HN3dNQURjVUxhY09UZWM5?=
 =?utf-8?B?RnIzRXczSU1EQ0tIN1FjeExQZlNwclNMQ29vWm5La29vRE1EZWtxSVhtMWd2?=
 =?utf-8?B?QlZTbk9zWnNnd3Z2OHdxVXNwL296bHYvVlp4OWFzdkkvVUg3Y05zcjNmQUoy?=
 =?utf-8?B?b2VIdDJjQ0tzTTJ5WUdsbkVKQXBReTkxRWFIR2s3eUhUeUYxZVVFOFVtMmxQ?=
 =?utf-8?B?bXFGd3d0WUIySllubk5NUmZlNlU5dDZTN2EwTFlTdmJDaVBPelJiVVBiYVFt?=
 =?utf-8?B?TWYyQXRPT0ZOREhOck9hVSs3SGR5YWx4YnVxL3NUY21wdkEyUEJ5azlwZGpT?=
 =?utf-8?B?Um8vREZtbXVIMlIxM1dyRWpqZytEQW5MdU45YVZ4YXI1T2pyQXErRkZOUXgy?=
 =?utf-8?B?YllLVWxkdVhNZ3VET3JOOVZyaXZuSjgzQTB4SCthUFlFQnY0MUI4b0F0RWhO?=
 =?utf-8?B?RHJzWTJzenJUWVFnSTZRb1cvYkMxWTkyemg1MWRDQXJJNUJtV3J6aVFBZnkz?=
 =?utf-8?B?ZVdoQnVTSWMxejI0QXUzZzlqYjE5Q0o2WDdjV1NybU9LUHpwTU9HbGtMd2xJ?=
 =?utf-8?B?SVNwVGRKMFBjOXlwNFAwcGdlL1B6MFNrVmgzR0MrWWhLT1VyL2ptcFRBbTdm?=
 =?utf-8?B?ZnhiQnlRL1BmNEFyMEpScFVxakV0OUs0V0RyUHdyMlV5d09HMlVlTlJjcitj?=
 =?utf-8?B?UnpoK05ERXRGTXE0UGVxbG1vVmJmREg4dWMyY0JJeGZVR3dCU0prM1Q3ekV6?=
 =?utf-8?B?V3o2L3ltMk9qaXFjMXlyRW1VUTVYQm9hRm9jK3N2U3k1cW5IMTRwU2M5WUF0?=
 =?utf-8?Q?aJj04qMvWR8DAKcKnyQNpwznr?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6af8ae3-ff27-4d56-17c1-08dba718fc9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2023 16:16:36.1756
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BSaV0qttnTSu7Mgt71T+Q6ya4frkIE8Eb0cTBdcjTGNlWeBH3H6MN+21BQjrUbNh4ZpkFayWS78sH4vbEWO4oQInt4vH/yjzFrVRHfjR/YQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6502
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Aug 2023 16:16:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104628

c2RidXMgaXMgYSBtb2Rlcm4gUHl0aG9uIGxpYnJhcnkgZm9yIHRoZSBzeXN0ZW1kIEQtQnVzDQpo
dHRwczovL2dpdGh1Yi5jb20vcHl0aG9uLXNkYnVzL3B5dGhvbi1zZGJ1cw0KaHR0cHM6Ly9weXRo
b24tc2RidXMucmVhZHRoZWRvY3MuaW8vZW4vbGF0ZXN0L2luZGV4Lmh0bWwNCg0KU2lnbmVkLW9m
Zi1ieTogUGV0ciBHb3R0aGFyZCA8cGV0ci5nb3R0aGFyZEBhZHZhbnRlY2guY3o+DQotLS0NCiAu
Li4vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZGJ1c18wLjExLjAuYmIgICB8IDEx
ICsrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCiBjcmVhdGUg
bW9kZSAxMDA2NDQgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
ZGJ1c18wLjExLjAuYmINCg0KZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtc2RidXNfMC4xMS4wLmJiIGIvbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zZGJ1c18wLjExLjAuYmINCm5ldyBmaWxlIG1vZGUgMTAw
NjQ0DQppbmRleCAwMDAwMDAwMDAuLjZhYmRhZDBiZQ0KLS0tIC9kZXYvbnVsbA0KKysrIGIvbWV0
YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zZGJ1c18wLjExLjAuYmIN
CkBAIC0wLDAgKzEsMTEgQEANCitTVU1NQVJZID0gIk1vZGVybiBQeXRob24gbGlicmFyeSBmb3Ig
dGhlIHN5c3RlbWQgRC1CdXMiDQorSE9NRVBBR0UgPSAiaHR0cHM6Ly9weXRob24tc2RidXMucmVh
ZHRoZWRvY3MuaW8vZW4vbGF0ZXN0LyINCitMSUNFTlNFID0gIkxHUEwtMi4xLW9yLWxhdGVyIg0K
K0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL1BLRy1JTkZPO2JlZ2lubGluZT04O2VuZGxpbmU9
ODttZDU9ZTc3OTg2ZGM4ZTJlZTIyZDQ0YTdjODYzZTk2ODUyYWUiDQorDQorU1JDX1VSSVtzaGEy
NTZzdW1dID0gImY4NmZiYWRhZTU0ZmVhNjQ0MWVjMmYyN2RjMjlkYWYwODUyNjlkNjZjNWQ5ZGYx
YTRmYmM5NDc0YTI0YjkxZDAiDQorDQorUkVRVUlSRURfRElTVFJPX0ZFQVRVUkVTID0gInN5c3Rl
bWQiDQorREVQRU5EUyArPSAic3lzdGVtZCINCisNCitpbmhlcml0IHB5cGkgc2V0dXB0b29sczMg
ZmVhdHVyZXNfY2hlY2sgcGtnY29uZmlnDQotLSANCjIuMzQuMQ0KDQo=

