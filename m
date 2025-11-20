Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE61CF8544
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 06:24:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28786.1763619839807615714
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 22:24:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=lczYEEwf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3419e170cb=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK5QTiJ2046758
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 06:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=UZisvGOALbGItWq6/oLuw3
	t2BWQwv9hAR85ElUgGkCE=; b=lczYEEwfZiUrtGOY6RZIrNjZ/zTQ0g6CymcZMy
	M1milBBCAIAG8m8+msZnvHXVCdzuAAw2iHVy/qyylwTupLGTuTAVojGbCQCFL5Br
	HzH8Z3Vl1Roxb7jM6o6tR32P4i//FL/RgFG8SVnYqim6klCqdxaTno42bGDEgUGo
	u0MO/MK1e4KqSg6aTcdcWTw2UAqFcy3W1jVuIhI2bOY5e6q2GcnmQnvziuHSnJnU
	y3/eFblGZm3jcc/4It/DuHnQnCIcByrsvEZmZTdEyUU05MuAgdexUQgAV16ZMvKO
	09n+VRMSXB+VuUHrbqgJ8QfoVXQaSaTpMNG7V1nw8LKmcJ3w==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010047.outbound.protection.outlook.com [52.101.201.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ahrs3r7m6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 06:23:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s6NuIOtglyKaOk5AbeqwOso9v+V4FYhqPmU97TNhpBukicqNPcSfBbEBayV9DoPjVKZLCfPBI9l6EzLzXfPS634FOwJiTbJsib+ibLcS+bhj8n8dwd4NAZ7GwiXmw3BhTYs1Pl3UqTJNDs2PT8xiHJHrdlnRbTdRAdb6AwknPiRykeWE0LvdRHD9hPTayE0e6isFhY4+McXXGvNU3sBY4ZLISRL46UVkopRNPXGzygqLzj6UFe9ZI3izjXuix93gEooL3CXRx1otRTRUMCMB+VoG21RDxJjK5M5BEqCeXV4KMyyzNcnGzlPpNHit0iJDU4NITvXvgQqqoX0laCKjGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZisvGOALbGItWq6/oLuw3t2BWQwv9hAR85ElUgGkCE=;
 b=dLcR5KoxTPxumqjm/b/3aFCjuVDxg0tzmuCDPdoGk5cSrZORniHuivl+GWUmjK9R8X73NH5bJ6xJ3FcBXKpM9bqOEHymK6G9HubeLVGuz8LMoJuJGAqb0kmN0DJoCG712Dg64Ud4tsEOG0ni2j6XfNh9rwZD8Z7dX5bgT+rMTT2npNcInDGSD7//ONpxM3/lXiCb3BsMelrSCuzBAvZHPwfHAY5ds2Mvkurc3hTByElxvq/66wFeWX+jFH5GwrlP5IZCrlP+7kZwHkeKBA5yQ2KShQSVpcvsx30igN7m+HcIWfkis6MixihiUhJFkWMuReXKVK3lDlZGYu/E5IOpfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CYYPR11MB8357.namprd11.prod.outlook.com (2603:10b6:930:c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 06:23:55 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 06:23:55 +0000
Content-Type: multipart/alternative;
 boundary="------------i6wL0QekVVR1us6LgLnm4e7U"
Message-ID: <489a414b-b0cc-4cb0-8309-6e150d4817d3@windriver.com>
Date: Thu, 20 Nov 2025 14:23:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] libtracefs: support reproducible builds
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1879A2400EFE656B.1255594@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <1879A2400EFE656B.1255594@lists.openembedded.org>
X-ClientProxiedBy: SG2P153CA0053.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::22)
 To DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CYYPR11MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: 823899f4-da63-4f66-b443-08de27fd6189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|366016|376014|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K0VldDhwWnBiL1QyTXpJK2dPUHhKRG5Gc2VhMERuZG95V2JjTGJPTkpsYUht?=
 =?utf-8?B?czUrV2R5aGtXNHFsN2o2T0JJdThuUWFIeVcvUnpacysxR2FxRVlNQnBxa2F2?=
 =?utf-8?B?aE1IYUN4elVicjloVTIyYm9wK254aCt6YzcyRlpyQ3NPZ2g2VHdnT2hQakdC?=
 =?utf-8?B?T3J5WEw3TC9BRjlZb1VMUEJrYjBUYi9nUkVQc2tWd0tpc0lZUGdGMStZMVJW?=
 =?utf-8?B?U3prVEtHcHE1VTRvb1F6anVucWx3eTBlMjNJalU1T2lNVDZjKytjU0JLMlps?=
 =?utf-8?B?YkNGZEJTN05tSlJ2dmVQS3FTZXowZUtpWVNnMTVkdGVINUNDQWtDQ3JBV3d1?=
 =?utf-8?B?L1VYcllVVlFVSng5emZXQitFTUdEYTVTWXgrYmJwb2Y2NXJwSDdzN1FTa213?=
 =?utf-8?B?RUlNN3N0YVYyTUJqY3Y1VSttanFkUU5sbXVndUlBaHRQM016aU5pYzA0MS83?=
 =?utf-8?B?WDhyQVhtMTlVN1JsZXZqeHZTSHFXRXBDQ0ZjaTR4OUtnMGZjM2R1MmdOdkc2?=
 =?utf-8?B?NmpZR2FMU01yV0VhWkszRStmV3g1dG5sNXRFc2FLWUdGSE42VVhPK3U3REM5?=
 =?utf-8?B?U3k2TDZjdzlvVENHakhvdUxhSWRyMHIweTN1VGJrejRhRC9XL0tyc041em9K?=
 =?utf-8?B?eGZ1eTNNVnNmK2ZNZmJONFJwRUtQUk9lUkFPVElKTG1qdHg4WkoyWlQ3Qlo1?=
 =?utf-8?B?KzdKSDB6Q21vSVpmYWlnbkwrWlZzaVdZMWlZWmpkTitNOXMyOFh4VWhjSEFt?=
 =?utf-8?B?NHhoNExMUVpCQTBPdndvMmRDb1htdDEzYjdpK0tSQUs2OUZMbGxiWFByVXl2?=
 =?utf-8?B?Tlc1cU9NNXZOOHgwcDNCb1prNU0weWY2OFFqODVlTGFaNmpsVFd0WTRwdFpH?=
 =?utf-8?B?NUEzSCtKa0h2bjRhcjZORUgyK2tMYm5tQWZXalZxSFMxZFlXMmtoRFNGdkhB?=
 =?utf-8?B?L1hRSzRyR2lYeFlkUkNUdUpTai9PM0JSWU9Jd2F0Yms2ZW41RldRdWp6L3R4?=
 =?utf-8?B?TTB6SWlxTXNRYkdic2NXRnZaeW9BY0ltYi80Zm9iSnVpNWJJSWJkRy9qMUw0?=
 =?utf-8?B?NDVHR01RclRrYzdSdVhZQndadFUvbDdldW96azAwbUpENEs4TmNxZUdXeEFr?=
 =?utf-8?B?aWdyRlE0d0FvQ3AzM2VNM21sRC9CMmlTdjF2ZGFCNm91SFRaL01XSUpybmpT?=
 =?utf-8?B?YjkwM25ZSDVYamxNb2NLU1kwUm5LMGpzRHFRNjNJb1JuT2ZySW9wMkt0ZEhP?=
 =?utf-8?B?VUJpSDhIaHdUVlJQbStTcXd1UTYvZ3dKT0RkSFduY2FKcjRmblhndGFEYVFV?=
 =?utf-8?B?Z0FYYlc0VHlzQzBOTEZJdzJMWS95eEcrR3hGRzMxOCs5cVE0N1pXRGJzWCt5?=
 =?utf-8?B?Z0IyMjBobmVSWnE5Y2pHaXFpejU4KzdiSytDNGxsVzhtSWdKSUlHZzlJZmd1?=
 =?utf-8?B?WkI3Zk9CSWRQWmJkV0t0Y2FVelJhcFU4UnNYb0QwMENMWE90YjUvaEpEb3hI?=
 =?utf-8?B?NWZBZjNsTmRBQnI5Q0Y5d2tLZWpXUk94LzdCVUdGdjEyQ3NuUExXaitwd2Nr?=
 =?utf-8?B?WmNJWTJCNEZ4VDNheCszVktEL2pvN3FqZWYvc1N1dGNoTGl2RHdxYzZYR1Mr?=
 =?utf-8?B?K2xMbkgrM3d5d1QwUXhWUzlkb0ttMS9pUXRndkVBMEdHaTV1TTFKdUVIM20w?=
 =?utf-8?B?dExEWHRvamcyTWlZNTlTRWcxdnJPMy9MNTlxRyt5alQvUE5DVlpwc0NJcGIr?=
 =?utf-8?B?UU5Ra1RqNVRKdklnQ3NadDRJN0swM29Ia3hyZ2sxMS8zd0h2bGlGUjZtWnBW?=
 =?utf-8?B?NTB4c095b2tRZEhXN09PcEJFeWlKNzlyUUgrcm5KVWt5NWpNZ2JhQzRVaC82?=
 =?utf-8?B?MGlyNjNvbHY2MVhYYUM5aGlMZlNjV0tnWEYzSDdBa1RHb3JaWHNwNnYzenpX?=
 =?utf-8?Q?tL0WxmL8XF0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(366016)(376014)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QmowQzNXbWpYVkY5WnpJam9Yc25PSnJwUEdET2h6M09JN3ZxZ1BCMkNDV01o?=
 =?utf-8?B?cTNBVFFiamFWQ3BnN1h6K2gvK0gxR09MQ2hTTk1VZC9lQ05ZaFVBbVF4ZjlO?=
 =?utf-8?B?Wko0bGJHS29rd21rdC8rV3JiemRnT2szdFBIYjFMS0tvQlM5NHVLaGdraU1M?=
 =?utf-8?B?cHdFUjZPbjl3VHRCcyttSmFkSzVtcnR5N3NSOTF3OE5IaVA5RWhESGZ4b0M2?=
 =?utf-8?B?aDVFY3JueXU1RWVub3FXVXpxdDl6REZxcTBrYnVjcFJRRi9KZUN5eUhuektL?=
 =?utf-8?B?UlZXdm1MT2tubTlveVRyazROSFNlRkJQWkNBVDJ2L2NocTJBWmpnWU1vMERn?=
 =?utf-8?B?bFBRclA2em9LTEJFaloyZjFZcEp3NVRwT0VaYXVxMG5PTk9YeE51SDZxd2s2?=
 =?utf-8?B?TW02VXlJOUpGYWwxODkwOUlROHNTOUdXK0h5Zi9lNXVwZDE4Yjc4U294RFR4?=
 =?utf-8?B?Rms1a1hJd2JNOU54N093cUdJK0RuUlpzSzZvTTZaRDNjRGtkaFN2dUp3N0xp?=
 =?utf-8?B?MUs1RGp4T1d3TkhMRkZkaDlmcndjSmJWL1ZsRFozV3JRdGphcTlJWEhTc1M5?=
 =?utf-8?B?ZkdhZSsrb1lDYW0xU2JpdTEzdEZHNEdwZFBDeGxqWC81K2hHUEFhUDFLaVM2?=
 =?utf-8?B?ZTYza1lLWDlmSFp5Z0VvV1JlNDZNNVdYMDA1OUg3RWlza3N2UXlUZGszNVFL?=
 =?utf-8?B?eCtpWmVwc2R5b0N0T1A1cDJTU0pqc0I3cmUwc2ZmNFpEMEV5ZnVaMThDL1VD?=
 =?utf-8?B?amE5SGliM0NiWlhqZzlIZThpY3NacnBGSEF0cnBvWU51dG5pRm10N3ZlWkZO?=
 =?utf-8?B?bkxJeitHVGZVVWoxSjJYeVgrdDhtbHR3SFZldnJQd0J4aFIxOC9qcTJBVFY0?=
 =?utf-8?B?ODBGajJhSUhCbENkUmMveTY5Sy9pLy81R3JFaHRIK2dydndhTk13KzFDbXZZ?=
 =?utf-8?B?UUx0MnpGejE1ajhTbXZXN1dIOXY0WDF4N2J4RVpsMUNoUWh5SXZCZW9FQmZ0?=
 =?utf-8?B?NWkxK2RDdi81NXE1TzlVT1hMdjdJRlZLbWs3MGFZOURoazNuTXZmNkNBVVM3?=
 =?utf-8?B?VkwrNVJOeC83S0JQNjdwZ2pnOXhCS1NIVU12VTI4S2NreFoxdXQ3RnlyWU9t?=
 =?utf-8?B?Z0k5N2psenl2NnhSZFFvQ2FJM0cyOFVkeEhnWXQ0ZG54aVllWE5PZHNQeTZj?=
 =?utf-8?B?V0hwRllQQjRxR0hwVnVNb1pLTE1XVFhWRG1GQmZNUDB4MjZFSUhHL3hSK094?=
 =?utf-8?B?bHozRTR5cFkrNzY4NVY0ZmZ2TitkMmU5OUgzZWNIaFV2Q29JTmU3ZnZZVXNm?=
 =?utf-8?B?clVmTThuOVhiRFFtRjNkaVI3UXppSnRraTZreDRBWVlMbDVTL0ROa0Fvai83?=
 =?utf-8?B?MjlJM3A2SUp1RVlhMUczamUzbDcwZzcwOW1tWnc0UDFUUXNFMnRNandZOFZJ?=
 =?utf-8?B?ekFXOEJieVZOdVNnQk81NnBxdU9UcnB5THBES1U5UWtUdVNXVjcyelhkMDBh?=
 =?utf-8?B?VFZKNlg0a3ZWV3I2WDI0V0kvM3dtTm5tTFl0ajRLNktKNGE4TXFIak91WnAx?=
 =?utf-8?B?d0hrNzh6c1lsc3pYbnBZM0NobmFyamw4ZERCSlY2b1U1RGUrLzQ5K1hCanNB?=
 =?utf-8?B?ZXhJaEZtREhUM2I2UENSY3NadHozNU5WMndpeFlxR2J2MUVkcytzNHU2UU1R?=
 =?utf-8?B?VzlKY25GSFFlQnlGVE5DZDBPTEVoMnVRam92OTk5SisydGNnSEpHc2MzeTR1?=
 =?utf-8?B?KzEvSGhyR1VWNDZEbzE2T2tyZmNvNXpVQzk4dStIU1VobmhtdWhnc2dNK2gx?=
 =?utf-8?B?djBwOE8xTmh2RHlrTUxVRDViRHh3eGIvSGdmdlhHQkcrS3l2VEJ6aGxzdVE1?=
 =?utf-8?B?Yy94ckFzWHMrY2VMQnRYNVdWZHViam90SDVLL2JuTDlPV0c4OXdVdFRIZG11?=
 =?utf-8?B?K3o2SVRsWmFraDNrTGNRSHRkaDUxODVPdllrb1cwZzVQSzlKcENVYldCQ1k2?=
 =?utf-8?B?ZDErUzVqb05NWDFCamxSRDYxTXF3Y3BRWCt5TnM3Y3BEUUZUVy8wYmJCbjBV?=
 =?utf-8?B?L0xJRmlTQlVLelhTcWhBSHE1YmpnazRlYm12Y21nakloYmlYSXIwYkl0M0xH?=
 =?utf-8?B?YWh6emIxcW53ODZvUjV0NVdRcmlCZFpaQkduUWsydUl4TDl2eGFvQStFb1Nn?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 823899f4-da63-4f66-b443-08de27fd6189
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 06:23:55.3170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QINq03cJjmC7bpFeNjohoBFaJRDQlJ/itIjD+2xXU5ZyA77ihXUUaiDHixwn9nrliV+y8mJ7lTynhVBLOXSQstvU9wpzt0GHpy5EYCZkugg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8357
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDAzNyBTYWx0ZWRfX4datf549nEJf
 7DHAO+HW2mjWw1KCQd8+Hw+IVkVcYmH4eqbHhFmaSXrUNvCgjm97881/JiAPRNtDtibS9CsiuXM
 /d1cI7adQ24s2lSg7sX2rzliRf9JsB1oGsRlzwd8ENwWga7oA/307Kv9e0/K9vBEZt5bXAjXPE3
 Z0hADBFzsLv2vygQN6ldhHCwkJub37CpPtD14q73nThGgyoeotnPKDy3Ne0oRTSowy6lN5qj4KT
 bZl+ncuR45irDJSQ+VLqwZ+uCyF/qfBF540VRYewiGumX2gfb3lLVeXhh1W35Md2DAFSwtBOpcG
 PLlGZfvzl6PLegR0UTO1jssls/9fXbcLxvKKM9jH9Ac1OZ3AQdTnmaFoB24NfA++Bby1WJ1YTJU
 Ha4Vr65EvrG6mw00XA82VrgqN7UGEQ==
X-Proofpoint-GUID: 0li16imub0HL5VBeAzcARavwj6kbG6KW
X-Proofpoint-ORIG-GUID: X6PY4ho4obA-1E9TQVeZe86SGnplwHvb
X-Authority-Analysis: v=2.4 cv=f61FxeyM c=1 sm=1 tr=0 ts=691eb3fe cx=c_pps
 a=6zE/HbjXcl5L3wBq6eN3xQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8 a=SZ0ezDmWT_ras1rcBvoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=6w_tTUe4vkv4zTqA5a8A:9
 a=U_pnIHLpAQ6DC_nf:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200037
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 06:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121929

--------------i6wL0QekVVR1us6LgLnm4e7U
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AK5QTiJ2046758

Hi, Khem, Richard

This issue and also refer=20
https://git.openembedded.org/openembedded-core/commit/?id=3D8898f97b4acc9=
d5c2c6583c91d05327f9093133e,

both issues caused by randomly mtime of the sources checkout by git.

So I thought maybe change the mtime of files during upack is better,=C2=A0=
=20
change=C2=A0 like this:

diff --git a/lib/bb/fetch2/git.py b/lib/bb/fetch2/git.py
index 0fcdb19df..c4da45fc6 100644
--- a/lib/bb/fetch2/git.py
+++ b/lib/bb/fetch2/git.py
@@ -752,6 +752,8 @@ class Git(FetchMethod):
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 else:
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 runfetchcmd("%s checkout %s" % (ud.basecmd,=20
ud.revision), d, workdir=3Ddestdir)

+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 runfe=
tchcmd("%s restore-mtime" % ud.basecmd, d,=20
workdir=3Ddestdir)
+
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return True

 =C2=A0=C2=A0=C2=A0=C2=A0 def clean(self, ud, d):

But restore-mtime is not a git command,=C2=A0 need to install=20
git-restore-mtime,=C2=A0 another option is modify all the files by "touch=
 -d=20
"last commit time"".

What is your suggestion? if you agree fix from fetch2/gitt.py,=C2=A0 I ca=
n=20
send a patch.

//changqing

On 11/20/25 14:12, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> [snip of Makefile]
>   # bison will create both sqlhist.tab.c and sqlhist.tab.h
> sqlhist.tab.h:
> sqlhist.tab.c: sqlhist.y sqlhist.tab.h
>      bison --debug -v --report-file=3Dbison.report -d -o $@ $<
> [snip]
>
> sources of libtracefs is fetched by git, the mtime of sqlhist.y,
> sqlhist.tab.c is random. so sometimes, sqlhist.tab.c is regenerated,
> sometimes, sqlhist.tab.c in original sources in used. bison used to
> gernerate sqlhist.tab.c by upstream libtracefs maybe has different
> version with the build host one. This make the final libtracefs.so not
> reproducible. This fix touch sqlhist.tab.c to make it has the newest
> mtime, and sqlhist.tab.c is not regenerated during build.
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb b/me=
ta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
> index b6bae96896..35eabc7b11 100644
> --- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
> +++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
> @@ -16,6 +16,10 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/libs/libtr=
ace/libtracefs.git;branch=3D${BP
>  =20
>   inherit pkgconfig bash-completion
>  =20
> +do_compile:prepend() {
> +    touch ${S}/src/sqlhist.tab.c
> +}
> +
>   do_install() {
>       oe_runmake install DESTDIR=3D${D} pkgconfig_dir=3D${libdir}/pkgco=
nfig
>   }
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#121928):https://lists.openembedded.org/g/openembedd=
ed-devel/message/121928
> Mute This Topic:https://lists.openembedded.org/mt/116387556/3616873
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------i6wL0QekVVR1us6LgLnm4e7U
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>Hi, Khem, Richard</p>
    <p>This issue and also refer
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/commit/?id=8898f97b4acc9d5c2c6583c91d05327f9093133e">https://git.openembedded.org/openembedded-core/commit/?id=8898f97b4acc9d5c2c6583c91d05327f9093133e</a>,</p>
    <p>both issues caused by randomly mtime of the sources checkout by
      git.&nbsp;</p>
    <p>So I thought maybe change the mtime of files during upack is
      better,&nbsp; change&nbsp; like this:</p>
    <p>diff --git a/lib/bb/fetch2/git.py b/lib/bb/fetch2/git.py<br>
      index 0fcdb19df..c4da45fc6 100644<br>
      --- a/lib/bb/fetch2/git.py<br>
      +++ b/lib/bb/fetch2/git.py<br>
      @@ -752,6 +752,8 @@ class Git(FetchMethod):<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else:<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runfetchcmd(&quot;%s checkout %s&quot; % (ud.basecmd,
      ud.revision), d, workdir=destdir)<br>
      &nbsp;<br>
      +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; runfetchcmd(&quot;%s restore-mtime&quot; % ud.basecmd, d,
      workdir=destdir)<br>
      +<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return True<br>
      &nbsp;<br>
      &nbsp;&nbsp;&nbsp;&nbsp; def clean(self, ud, d):<br>
    </p>
    <p>But restore-mtime is not a git command,&nbsp; need to install
      git-restore-mtime,&nbsp; another option is modify all the files by
      &quot;touch -d &quot;last commit time&quot;&quot;.</p>
    <p>What is your suggestion? if you agree fix from fetch2/gitt.py,&nbsp; I
      can send a patch.</p>
    <p>//changqing<br>
    </p>
    <div class="moz-cite-prefix">On 11/20/25 14:12, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1879A2400EFE656B.1255594@lists.openembedded.org">
      <pre wrap="" class="moz-quote-pre">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

[snip of Makefile]
 # bison will create both sqlhist.tab.c and sqlhist.tab.h
sqlhist.tab.h:
sqlhist.tab.c: sqlhist.y sqlhist.tab.h
    bison --debug -v --report-file=bison.report -d -o $@ $&lt;
[snip]

sources of libtracefs is fetched by git, the mtime of sqlhist.y,
sqlhist.tab.c is random. so sometimes, sqlhist.tab.c is regenerated,
sometimes, sqlhist.tab.c in original sources in used. bison used to
gernerate sqlhist.tab.c by upstream libtracefs maybe has different
version with the build host one. This make the final libtracefs.so not
reproducible. This fix touch sqlhist.tab.c to make it has the newest
mtime, and sqlhist.tab.c is not regenerated during build.

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
index b6bae96896..35eabc7b11 100644
--- a/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
+++ b/meta-oe/recipes-kernel/libtracefs/libtracefs_1.8.2.bb
@@ -16,6 +16,10 @@ SRC_URI = &quot;git://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git;branch=${BP
 
 inherit pkgconfig bash-completion
 
+do_compile:prepend() {
+    touch ${S}/src/sqlhist.tab.c
+}
+
 do_install() {
     oe_runmake install DESTDIR=${D} pkgconfig_dir=${libdir}/pkgconfig
 }
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#121928): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/121928">https://lists.openembedded.org/g/openembedded-devel/message/121928</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/116387556/3616873">https://lists.openembedded.org/mt/116387556/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------i6wL0QekVVR1us6LgLnm4e7U--

