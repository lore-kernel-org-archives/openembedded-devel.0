Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3925CCFB43F
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 14:12:24 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.83])
 by mx.groups.io with SMTP id smtpd.web10.54079.1728310341452423067
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Oct 2024 07:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=fVbulrVm;
 spf=pass (domain: infinera.com, ip: 40.107.94.83, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwoeZEJNuKttkef/dsqhYkUbB9AR7zY+2Dag/fJB9/Mn9+LGzsPgQ8AvRq1rfA01Z5Bf/PyPvBJqAGfzmNXjy0so9Dg33RA/EU3G2DNtfDkgIW5Q8/3gsx9y1GqcFzGhf7OLLsqJ2dAdHxRX33A8RTPI5QExyszkIEzRoxaaA+gNiifvcPUYzUcn9Zm7m65Ev5jyncG6DWQa0HNxOBgYraI7vc9CIGglfGt9KdUHsqipR50nIEUpJ1M6lhNlSf2Yh+gpCAoxLMflNk+ucYRPJLUYtvUkDqVF5X48Uq0Gwh/sbRcY5rt0B8yGVLWVnXFr4cZ+Ob/skThZ7qeEFO3WEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwoYqCykrC7fQU+nHg2XQUEPFsvJp831A/tGYPML058=;
 b=myDDbtpg50+NmKSOq1G6Ex8MOFdNQxNO24+JC3HPU7NV7JW7MMwDTehO+nvnQASHYVFZFGmyJf9P/2ZqF5+nQDlIfC3pzqg7sdCBqmbr4RAwVDmKSrRz/Zn3/GRg3+8LwpXlmufEbGLiIwUteQlz4UIyDvjeQmZ0NN82be6C0PiJ2qf4xiXJVoTVRnVS+Oz0O6K0goCtDI6ZsAk5jV6ExXCVMwdEa2wW4ue8S0fYzprnzkxl/1/JFodgQ2Mj6Q1KDPnkX6M/gUKWuy97ksiuMdlXexMfrYKKVqSdWciOPgd1r2k80EcIRliel9k1OVxpWNNSS5PrOf8Tb4Gig6XWwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwoYqCykrC7fQU+nHg2XQUEPFsvJp831A/tGYPML058=;
 b=fVbulrVm6aZNzMdsvmDb7tOuLx5QqPgrVSwqlKPuD18WAHHLXIml74sQwRPWApzRnqaG8u9FUxUCzy2Abb3QMpvkhIG8v3T+4cgKj42ygim3opgyfBM3nOTI0oQk+N/KAOS7t/+8KJLEpaXTKM9ADyMQluznlNZWO46Ysh9C6TIG/39lbkLmcm/slTqkjdFOl1l/tFBy/IIvdBC0GoEXTq10TjoWCEe0ZpZ/M09FuAovtGocn22U63WTHvLSOJ+DgtgGJKZWoGTTq86DQf8THaUphvNz2DQ8c6pkFsWNRyvqhU7jDq5z+KP8ZKV6qbBYE68kc9wtyjeTcGGDKs+Ibg==
Received: from DS7PR10MB5197.namprd10.prod.outlook.com (2603:10b6:5:3ab::19)
 by DS7PR10MB7130.namprd10.prod.outlook.com (2603:10b6:8:e2::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.22; Mon, 7 Oct 2024 14:12:16 +0000
Received: from DS7PR10MB5197.namprd10.prod.outlook.com
 ([fe80::9b1b:e457:4852:c406]) by DS7PR10MB5197.namprd10.prod.outlook.com
 ([fe80::9b1b:e457:4852:c406%6]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 14:12:16 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] scarthgap: How to revert zstd from ipk ?
Thread-Topic: [oe] scarthgap: How to revert zstd from ipk ?
Thread-Index: AQHbGLynh7wCkgiOPUGUNhn1PYPf2bJ7SqgAgAADsYCAAAHNAIAABDKA
Date: Mon, 7 Oct 2024 14:12:16 +0000
Message-ID: <96f2c5ff3ad9db1ab32f972dbf68a52eb18c1949.camel@infinera.com>
References: <ae23174dc7aa9aa7cd5e8fbfbc912bf8d6a3e4db.camel@infinera.com>
	 <CANNYZj9FdP6GUi_SzY1_041EHbtbtncM=oCMfN9w8DhAGQ93mA@mail.gmail.com>
	 <8da539dd2dbf56c0a402fb93b0794bec2295b8c3.camel@infinera.com>
	 <CANNYZj8nMQ2DhgLxXsAR-E2gaKDBKJ-4_RZoY012JbujFaMywg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8nMQ2DhgLxXsAR-E2gaKDBKJ-4_RZoY012JbujFaMywg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.0 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR10MB5197:EE_|DS7PR10MB7130:EE_
x-ms-office365-filtering-correlation-id: 15541778-24a0-45ca-4fb2-08dce6da0c9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?b01pR0t4OExsdUZSd1Y3NU5pemEwa2FIWEdRRGlramIxbWNlQjFKMC9lZE15?=
 =?utf-8?B?Z01JOWE2TWhBNHlVMUpuLy83RTA5dkF5UFVPTGRybnhuOTYzcXVTWEc5bWlv?=
 =?utf-8?B?dkRHNi9iQzZMOGlsUW5tU2FJaHFUdXZzY1VRTnpFTTl5M0YzdjFMZkgxYisy?=
 =?utf-8?B?alhaYTBSdnpEZGNqS3FWdFozYUdHMk1ONHNKN1RGUzNZbEcyOTVRRHNiU3oz?=
 =?utf-8?B?anJOTHN0YXBzd2dBWjV2YVl5dDdreTIxN2U3dnp2dTVqd2VCTGtKM05ZN3hY?=
 =?utf-8?B?MlNZcWN5SmtsNjFDOEtzUjNjSi9TMUJFTkxSU3g1ZkhxbmowWHRkOS9hSFpZ?=
 =?utf-8?B?b1FCbWVEcWloSmpJYlJJdVF2T2pYbFJLQXU3VExSR3Ftd3RZeDk1dnNYNDF2?=
 =?utf-8?B?MXgySlhzbWVFNWpWcFY2NGJpV1lDNWlpY1RSL0hyYlRzc3VXWWo0QnExM3VW?=
 =?utf-8?B?bmVvMnE0OVJXTFJhbTM0cVZwZzhQNnNPQVJWMFJFR1ZDM3FLYW1MZ2F2dEJs?=
 =?utf-8?B?Q0YzK2UwV0tER2toMlpUb1NkUDBYTXBuNk1kKzJ4NXpLODQrVGI2bkJNdWFh?=
 =?utf-8?B?Ykk0aUVHY215MjRwRDg3cXdpK3lFcnBreHlDZjE4MFM3OWRRVXpvaFBMTk90?=
 =?utf-8?B?Q0dqc0VMNG9tZTQ0NHJyaURPTlNxYVNhMDI3S09QRjhaYmVSMFdHT0FPQVFY?=
 =?utf-8?B?d3ZjV21mMGl5ZW5QRlFxZks0Ui9wVlp4Z2dKL214ZWIrSUc4OXZEamlqbTlJ?=
 =?utf-8?B?VXFud0FQWUlia0MvN3N3L3dDNnVPWE9FeWlxMDVsNm85N2crK1BIamNUMEkx?=
 =?utf-8?B?N2w0REExYzQ0NldrRSt4cjRDaHk0K2Z0T3poQWtpNEVqMXRLZVZlS0hFcS9S?=
 =?utf-8?B?L0lqckZZb01RR25vNytDMnQzLysvbjRjRXp3SFdEODMzcUR4bTFxcmdUaTNi?=
 =?utf-8?B?TUhjaVBtaEVkQUtPclA3a3VETi82S1hQb05Ic1oxVmQ2bWFndktLeHlqZGw2?=
 =?utf-8?B?Qk1DWHdMTjVMUDRXOGt3NHBXYnJqSVZnQ1owSG1nZ2tMWkZQQ0NoWjkyWlpP?=
 =?utf-8?B?TllDNHp4c1lXUDlRbnh3UlJWVXM0N0MxSVo5dEc3OHk0d0tZSDlNZk9DUndI?=
 =?utf-8?B?cXpadXpQSUJkRlM0QXhzaHhZOEl5d01zSUc0R1pFWEZBWTdNS0c2QUsrMHNR?=
 =?utf-8?B?RFdJVmxiajlsbUdGMVlaSllTOTRHUVhxUnpVMlRPdWVqOUlqcjErQ0Zkd2xw?=
 =?utf-8?B?UFdFa1NHUTZZbFdpQUZxeDU3NE1ydUEwRWptT09mQVhRNW9vM2RqUkJia3h3?=
 =?utf-8?B?dnRVZlFuUFhkMUhvMlZQQWJjTnhyamhSYUtrQVFscDdrS1VKYlJUU09UYlR1?=
 =?utf-8?B?Q3NqM2FQQnE5ZGRLSmJMTUZQN1cyOGZQeHJTV3JXRzZqT1hJSXExRXlrU09O?=
 =?utf-8?B?cW4yc1FqZ3ZrNStzWVAzQ1c1RFpWb2lyTkt0QVE0TWRkWk5ObnpEMjl1U0pw?=
 =?utf-8?B?Z3EwbFN4WUIvbnYrNjVxZ2ZaeE9SQkJ4M2ZGYTRxYjNIUmlpT3RucFRtSWh3?=
 =?utf-8?B?TUZCT2hjZU0wdnpJYkVnQ29tVCtxVWh2aW1Pa1g1RUVOVEN0MjVET1FXd25C?=
 =?utf-8?B?TlpwQlQrU01Tbk40b01jcU83cUJxOTVCOTdwYk9oWEx0V3EvZEpSRjVqQnF3?=
 =?utf-8?B?Q0dVQi9aTzZxRDdmVW9MZE1iYnp1WTJKRjBzVFlOVlpnRXNBYzRFRzFJTU5L?=
 =?utf-8?B?U2kxN25tZU8wZ0dmaDFCMXZDQXFzT3JCbHcvaEhEVEV1dG9yZ25tbWZjY0dG?=
 =?utf-8?B?a2h3Q0dFdG51TWxiL0YzUT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5197.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WXd1U1lyKzFsZlplV2xvQXVBUmd4ektndGYxcThJbDREV2RQZUNvRVFTRnd5?=
 =?utf-8?B?dUJ6aGxkT2loWjNNUm4vWERNTm9admIzWGVTY1lwVWE5V0dZWE1NZkVRN1Z5?=
 =?utf-8?B?M3RpRE9haU9oWFRVYk5IdmEyQUliRkFveDBhVzg3UGpUcGNDYkNvVHoxSjBw?=
 =?utf-8?B?bnBZK1l5RzRURFJ6SnExTzh4MWlubkhzbUlRTGZiL1VFTGRNNkVUQ081UkRC?=
 =?utf-8?B?emVvTHJJRXpESDRNOWpEOStDUWFXdDJDYXBFRllpRmVqLzZCbE9kYlM5VjBF?=
 =?utf-8?B?aWhxaXdpMld6RVlzbDNyLzYxRFEzN1d0L01xNzdsUi9lVlpCMnZqbWRVMGNk?=
 =?utf-8?B?V3ZsUEFkYUp1eWQ4bkw5dnBmdUVLNnEzWWp1WHhpTEtLZ2JOUGpFZU1URkt6?=
 =?utf-8?B?ZXBUNTVyV3p2UTVoN09zNXhWdlpXMkVHc0EwNWpPamp5TUwxazJPcmRkOS8z?=
 =?utf-8?B?cGk5S0t1bG43ejAxbEdsWkh0R0ppazVSOEpiRFQ3SjkwbkFZZm1NakNNcUtl?=
 =?utf-8?B?NWVETlo3QmhuaXhRWjJaNENzT2pkRDVqcXp4SEJIdUwzUG5Xc2gvdmVmcUp4?=
 =?utf-8?B?V214bWNuWm5Wb01NUnl1cXV2aEJYQVhpRjVVcFpLTUNiYkdlZVp6a0d2Z3Ix?=
 =?utf-8?B?b2FwdVNxQ1J0Q2tlNE1sU3hOMlIrWmlManlsdnZCVjRxMUNVMkgwNkpQT3Za?=
 =?utf-8?B?U3o4ZHdzbGZoVFFsUG5RVzhUUWVsMU9tZUg1Rk1pWTJoYlk5OVA5bHJRcEx0?=
 =?utf-8?B?dXViYkRXaWdwMWwyNmxzbFV2ZWN6blE2RTc1a3FtcVY5b0YzMDVtaXhCWmhX?=
 =?utf-8?B?SXp5elJPbTNqcHU4YlJsbzBQN21qb01yM3ZUV2NuNEMwRkVCUzd2clhVcExO?=
 =?utf-8?B?NVFIQU13dlpnaExrbUN1RDFXZWxPMTU4cm5sa0IwcHRmUG1XbjBYZ0xIL2dx?=
 =?utf-8?B?UTNybWdQblpqVTErOWtCV1RwaUFseDFZZlZBUU4zenZjdWg3K205NDdoVWJS?=
 =?utf-8?B?dXlDa2dySlJpSHh1U25UU2c1bXU1Y2NsOE53eWEyakhwUTZYY3NBc291RTla?=
 =?utf-8?B?S2JSWW9DNEw4U0J1NzJDMnZiMGdpZjB4NTRpZGhQaVM5TWhrSjNMbFJYMXFG?=
 =?utf-8?B?WjlsVXNVcXlNbzdmSzh5eXlMUWl5a3lPb04vUGtDWVNHMnl2ZmRVekhrZkp4?=
 =?utf-8?B?YytHT3NsUUdkWkpDRXc2S1B2K1dKMUc4S0hYRVowQS8yWkR0d005enF3dXcy?=
 =?utf-8?B?b3ZUYk9jVloxdlhsbUZLdG9MZE4xRndMLzFNTlUyVE9sZGNaaExxdXk0QXRv?=
 =?utf-8?B?S3JJT00vTS9YMkx3KzNudFNMMHBzUE55UGE4NWNhUGFPdjJDbkVUY1FOWDJF?=
 =?utf-8?B?UFhuc243cmFtRFRzcGNKT1ZLNFlsZk5wcmxMbFlGVVJocHRmcm1pZUZlRWhE?=
 =?utf-8?B?b1QzTHhHaENySmh0NUJNR05oWHRuZS9Ud3cyellNMWltRXUrT05vQ2RxcS96?=
 =?utf-8?B?dTNIVHpXMzFnMEVWZndDWFNDd3JzQWIwSTlHMjFUNFVRSzdRUVN5MmQzcUxs?=
 =?utf-8?B?R2VWU1c5WFJHU215M2t4RDhLYUVMWC9HTUNDdFkvbWJoNk5DMjdKTFQ4cVB5?=
 =?utf-8?B?aXlCVDAycUtQREFKYm8xRXBKRHdkRmVKYkNuZUlwRG5KLzZQdm5qbUhBVG43?=
 =?utf-8?B?b2ZIbHo1dXlNN2ZpMGhPckNpcWdKSk1BY0x5NEVINmFRdUN1SGx3MjI4czNn?=
 =?utf-8?B?VWxGQXR6aVQ3TG5HMzVxbFgvK2ttU1F1RThxcWlMQlJPZHJEVmxEZWFxS3FD?=
 =?utf-8?B?R0pqdmhqM1dQbmh5a3pmK0RKNDI4VVYrek5yeGhpdjEwK3Ryb0pDL3loUmVD?=
 =?utf-8?B?U29XNVJXdHFodzJub3J4aGpwTVFTOXR4WThPbnpCbnQ4WmQ3UEJCUEVLdXpL?=
 =?utf-8?B?ejgzUGZhcW5CSWZWUzZTOHBtcEZlaUhSeExiU3k1OVJlTGVHbTdhMHNLT3Rw?=
 =?utf-8?B?aUlLQVJaZjY0cUFmempZU0VPNEthMi9NKzdMYTNJU3E1V3hrNnViN0JZUHlJ?=
 =?utf-8?B?d2FncUU1cXBIVzQremRTVjB4UGdxcVgvT3JDL1VSbHlrT1Vnb3diZVZjY0hs?=
 =?utf-8?Q?uKVWPAR8quJH78drhjxxfCweB?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <562E0E6BFDB0AC42B8F28024AB010E9B@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5197.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15541778-24a0-45ca-4fb2-08dce6da0c9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 14:12:16.8547
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DSY64ad/F7J2W2+FRZL86TdM9fQcG82P8ocG+pSJlBMhPnUcyTblNW3HDP93gjeMbd1VUAyy8lZCkmf8QfJvAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7130
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Oct 2024 14:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112699

T24gTW9uLCAyMDI0LTEwLTA3IGF0IDE1OjU3ICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gTW9uLCA3IE9jdCAyMDI0IGF0IDE1OjUwLCBKb2FraW0gVGplcm5sdW5kDQo+IDxK
b2FraW0uVGplcm5sdW5kQGluZmluZXJhLmNvbT4gd3JvdGU6DQo+ID4gQWxsIGlwa3MgSSBoYXZl
IGNoZWNrZWQgaGFzIGNvbXByZXNzaW9uIHpzdGQgZm9yIGRhdGEsIGFzc3VtaW5nIGFsbCBvZiB0
aGVuIGFyZSBBVE0uDQo+ID4gDQo+ID4gb3BrZyBpdHNlbGYgaXMgYnVpbHQgd2l0aG91dCB6c3Rk
IGFuZCBidWlsZCBmYWlsIGluIHRoZSBlbmQgd2hlbiB0cnlpbmcNCj4gPiBnZW5lcmF0ZSBhbmQg
aW1hZ2UsIGhlcmUgaXMgb25lIHN1Y2ggZXJyb3IgbXNnOg0KPiANCj4gbWV0YS9jbGFzc2VzLWds
b2JhbC9wYWNrYWdlX2lway5iYmNsYXNzIHByZXNyaWJlcyB6c3RkIGNvbXByZXNzaW9uIGZvcg0K
PiBvcGtnIHBhY2thZ2VzLiBJIHdvdWxkbid0IHJlY29tbWVuZCB0cnlpbmcgdG8gY2hhbmdlIHRo
YXQgYmVjYXVzZQ0KPiB0aGF0J3MgdGhlIG9ubHkgdGVzdGVkIG9wdGlvbi4NCg0KSSBzZWUgbm93
LCB0aGVyZSBpcyANCiMgUHJvZ3JhbSB0byBiZSB1c2VkIHRvIGJ1aWxkIG9wa2cgcGFja2FnZXMN
CiAgT1BLR0JVSUxEQ01EID8/PSAnb3BrZy1idWlsZCAtWiB6c3RkIC1hICIke1pTVERfREVGQVVM
VFN9IicNCmJ1dCBiZWZvcmUgc2NhcnRoZ2FwIGl0IHdhczoNCiAgT1BLR0JVSUxEQ01EID8/PSAn
b3BrZy1idWlsZCAtWiB4eiAtYSAiJHtYWl9ERUZBVUxUU30iJw0KSSB3aWxsIHRyeSB0aGlzIGFz
IHdlIGRvbid0IHdhbnQgYW4gZXh0cmEgTUIgb3Igc28gb24gdGFyZ2V0Lg0KDQpUaGFua3MNCiAg
ICAgICAgSm9ja2UNCj4gDQo+IEFsZXgNCg0K

