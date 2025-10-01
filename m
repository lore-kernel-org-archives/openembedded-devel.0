Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2F1CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 10:56:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14221.1759316158372484679
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Oct 2025 03:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iD69fzG/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=236923b97d=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5917IqqB1079323
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Oct 2025 10:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=vzN05ZjoRN3VWKcKcxNVHo
	Tr6XK0e8Bkas1Mo9pXbjM=; b=iD69fzG/D6uLJgbUPs9wuCahaxCpON2uZCvdcz
	EJX9hLMWU+ZozZj1595JcB5+ek3uWreIXhSgQynzSLZC0YgoomBwnbHWMlRS1E6f
	8t8GidEOAkH0RhNFm7AoPE0YuvAOXnYqJSqF3afFbnm0GtrXDZ+oPpOXTYvKwpRB
	BLHgnpS6Ur2YkY0Gjy5JJIcsP6LA5iykHlJVSdwv9l3NtgUQPijdzLa2ApmG4wt1
	0uCNmjZypgDEoDoetXqSbN9Pv6dJwiisN1AUNPRz+y8dFolrn3XFdmvrv47s71dB
	5uxGREa34lbn8Bx/SScKeCRI4WXCLl1bxAaeGWBqkKLTAbYw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010027.outbound.protection.outlook.com [52.101.85.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49e54wvwnb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Oct 2025 10:55:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RR0IcOb5A/+2rmMYaDnOB9ZSSXqL0UIeIOQ3PFekfNB+ruVbu4krrNHTzCrPrILHE1YjHjxMigQ8czPZXVtw0hRAnvWVxmxSTwiympZgusU7eUgBdyRJe09UkpzYu+l6eK/VRESPv4L6cXylCM1/nwggLmEEjAYcfbfMvxD2J1s0VkbpyPSSEM3fGaat+uGjWOSDD1Xa5ijpi0hakfdJMkT5B9HaKM35My93KoLTL15XT6gVRDdtID5o+L1U+d8ta2gE2Cd1eQdKmneHDYcJzQHZhUwHYfb1himPDzsYLSf6o7XhBdQTjLhrzz1pKdVf1I52TZtzdX82Nx1kvGPYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzN05ZjoRN3VWKcKcxNVHoTr6XK0e8Bkas1Mo9pXbjM=;
 b=ZqRrJi6tuDTg8XhxlXf3sQ7W4+aYUQyMP4YMoCcRcBmJ1oSTEUGT7e3rallzyMoOS6v6PMRSNSeKSXszaGs5iKOrpQKIKAfEmXwvhOOFuoq7Sm7emxVzMi8BqfoqrBLLxMVrCVdx0qLsADXtiI6l/J2+96MiGb2KFL3C13clJIabXJZPGX0ywKv1MmlD+zYhDwGdx9VSDziUsI8C0LkzbRpnt70HlCV2frKpzh3yDc63W1ks0F58rw6UPpSc8XkZS/V3yByw+MwOcoVAS4ECpsH2T9ob06/sgIpXnaGJzh2P4EZdvyEK6j1278UxHRnfoxLpwLuMEAAz03zbYGZb1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 by PH0PR11MB4791.namprd11.prod.outlook.com (2603:10b6:510:43::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 10:55:53 +0000
Received: from CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171]) by CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::3f03:81e3:3649:d171%7]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 10:55:52 +0000
Content-Type: multipart/alternative;
 boundary="------------XUBQjyAdFp1gK000DBtJ8siq"
Message-ID: <81c710e6-9a33-460d-93cf-fbad31562211@windriver.com>
Date: Wed, 1 Oct 2025 16:21:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][scarthgap][PATCH 1/1] Revert "mariadb: upgrade
 10.11.9 -> 10.11.12"
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20250926105137.3980107-1-yogita.urade@windriver.com>
 <7121a8c5-1148-45dd-80b3-38558b4070ed@gmail.com>
 <d6b18dfd-8f93-4256-a182-d5ce828ce321@windriver.com>
 <186A23AFED5E6B64.6422@lists.openembedded.org>
 <8c483402-ce57-493e-a344-3339cb04ee40@gmail.com>
Content-Language: en-GB
From: "Urade, Yogita" <yogita.urade@windriver.com>
In-Reply-To: <8c483402-ce57-493e-a344-3339cb04ee40@gmail.com>
X-ClientProxiedBy: BL1PR13CA0342.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::17) To CY8PR11MB7169.namprd11.prod.outlook.com
 (2603:10b6:930:90::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7169:EE_|PH0PR11MB4791:EE_
X-MS-Office365-Filtering-Correlation-Id: cd13cef8-60f7-47bd-935e-08de00d916c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|4022899009|13003099007|38350700014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bm1Sc1M0VDlCTlUyT0luc1VLcmFxcTB2UzVsSmk4c1dUMlRrNzFSMlR3TW8y?=
 =?utf-8?B?YnNuUkxyWWFMZTBvRS9FQXg2OVNrRlhFNERGYUlQYUpDR0ZhNWVkVloxd1lv?=
 =?utf-8?B?dEdZbW9xaFBhcjhzTjk4K3RmTmVtMmk3bU9nVmhrQnVaN0p6RndlYUVnaUQ3?=
 =?utf-8?B?bHBhbXpwUmRxdEVBeFV4VHg3WUswYldtZ0xzSm9oOVNNSGFDTVZEd3VWaS9I?=
 =?utf-8?B?MEYrbnpXVWVnYlRIUlFweXpsM0FiZ2pnenBaYmw1QzVqY09BVmtWQ0ZSclZt?=
 =?utf-8?B?VmhNSG9WcmFuNGI2Ym56VlBYa3lYdXhOUnRrcnNkQnpKOXVjdHhGQWhRWWgw?=
 =?utf-8?B?cng2OGJVUTMwRFRHUFA3Tkt1TjYrNjZ1MVRXbzMxMTg5aEZCckZsVGdxTHpq?=
 =?utf-8?B?MnQ0ZDRtVWswSXE1SDZiaFU5eDJVQUtjZEt3SEEvVFJBTFBhTWtFOS82NkNq?=
 =?utf-8?B?MkNLakhhVUxXbmY5NkVDTm1vejE2enhLbGZrU1RGTTllN0F0d3d3aE1XeVFw?=
 =?utf-8?B?RllKZ29obWZGQVN6d2JqSVBzT3BMcExkREhuVFI1UjJtUTdYTFkvRDVIZ3FM?=
 =?utf-8?B?Z2JTNDdxUGFXcTY3alBkTzROVDNYZjUwYWJZNmk4ZElYa0ViYXFaK0RVVzdK?=
 =?utf-8?B?VTMrakpiT3p4L29TM0gvV1Uvb05PdGJFamJDOGFLMFVaMldOdCtqenl0Wml5?=
 =?utf-8?B?d2dBTU0yQnp1SjFmalBPeTY2NGhOOFhmSm8zQjZsaWVJaHpLMTgzWm9yZTNH?=
 =?utf-8?B?Uk1NUnBPUUpIaENGOGpyd2orRkpCK1U0b2U0WEt4Rit0enQ3VjJodFpsWjBF?=
 =?utf-8?B?OUpXb2owSjZpbGN3SWVGNWZ5ZDZ2RGd3SEkxcTgrSFR6RE9hL1EwekFNWHZM?=
 =?utf-8?B?WElpWDV3WFJDOE5uZHl5bGxoYWFpZEJZVFQyQUkzeCtxQXdGSjN6QlVHNXF4?=
 =?utf-8?B?Q1BZRnRnMGFGaXhhSHFydUJJMXJUaGJ2eEo5L3J6M29oNVVaK3oxT2VkSFRi?=
 =?utf-8?B?dlprcVZ3NE5JNlRUUDlGNUVvdUNURjFwOHRSRjV1SnpDWk1icTkyd0JDdlBn?=
 =?utf-8?B?REQ3QnFmMGlCRHBUUTdEYm91R3VWU2JST3Z0d2o0RUp4TUF3ZSt2S2NlbTQr?=
 =?utf-8?B?QVFPY0NjMjREdkVaZTB6NWQ4VUwrOGs0Y3dIQ29VRTJKM2NFT09qeERKMllE?=
 =?utf-8?B?UDdhOVlKdkJ4VThWQ2xrSVJWK2cxQVNQeXBUV0Z5RTMyaDVFZkZsc3VzaWJ3?=
 =?utf-8?B?bjUyakgxMkIrZVBmT0IxY0xtcFRxdjRDWklWbTVqVHl1SVBqSi9jak1FUnk2?=
 =?utf-8?B?SitqUG5EeEQwNVpKemsvQXF4WUFMdDYrYmVyVUV0c1pDOEQzVS83SVpuNzdI?=
 =?utf-8?B?SWN5RnRmbGpQQ28zYzV3Wk43U0RreUEwNmpqVE1UN2xEZ2piOGNta0VFYURG?=
 =?utf-8?B?UnZ5NFlVdXd4aUgxZDQxVVB0eWdodmpQK1VmNVRTdU84N0U2c0lNckErWEpB?=
 =?utf-8?B?K3BKZkZ1Q1JYdVBad013Z2tUVUpUZEJ6bzYybVhScFk2Q2RNQ2ZWL2dyVURu?=
 =?utf-8?B?c2F2SC9SUnhTN0lmYkJOOURyTmV1Qk1YR1RnNVhlOFAwRThVa0ZOQ0NBekJG?=
 =?utf-8?B?UndXNHl3NnFHTTFkb3pNYk5PVGNZZmFkZlJmYk1BbkxMNW5FaUE3SWJWYTRP?=
 =?utf-8?B?WGpiNFdybmx0RldTZEdMZEtMWEJCT05VcG9Wd2tBZWJ0dTBNc0ZrWEZXY01Y?=
 =?utf-8?B?QlpjWlBRZzNHcTJ1ODBFREZaZ0VoZWRpUER6bmt3Qk5JaHpZSWo3cXZmTzRj?=
 =?utf-8?B?bDNXUVBjSFdFWW1DWVNqbmVMdFl5MVFZbXJzRXM4SkNSYzJxR0NYaWxZRkly?=
 =?utf-8?B?L2dDdkN2eHBaN0JiV0YxMVlDLzhBZG1wSlUzc2hjbzdLY0VoRUo1eDFLUFZv?=
 =?utf-8?B?TFNrZ2ZGWjF4SC9ZUnJXdERLdXBNZHhFczFIYUNQZXBncHB1UzJkMGV2Qng4?=
 =?utf-8?B?N1BoYU00bXdBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7169.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(4022899009)(13003099007)(38350700014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eExBWVEyeHEzaWErbDB2M3pzT0R0czlEdXg1U2E0aTMxWWpIWGdUWXl2QnUx?=
 =?utf-8?B?RHdiQU5GenE0bmNsZFUwbC9zdmU5V2g2bjNqRlZvUFR1WnpmcGxlZzNrTERH?=
 =?utf-8?B?dGtZdjdOdng3SERGSkVkM1FtaWY2emdaamM1Z1AwOTNMTUlPQ3dyWlJYS2JV?=
 =?utf-8?B?elphWkNvWjhMYlhMQVVvOHVnZjUrYmQ3V0hVV2JsREdHMHBTVEE2WjYrc1Ay?=
 =?utf-8?B?K3pVcmZOWis2WGIvQThXVEZDOW55Uk5Qd1RMWFd6ck5XdGlYT01CRW50TzR2?=
 =?utf-8?B?ZUloYnpMR1hscyt3MlhqOGlwYnZya2M0aHhER0ZrWHR4eis5TWdPVWovdjBM?=
 =?utf-8?B?d2p6SEdXcnVTMitmTHpGU2JNL25QWEdTRUpOaFVQWDZNOFMxN01obWx5Z1dY?=
 =?utf-8?B?bm82SmVzSTN6YWlzdlNZZW0rakxnbFNqLzQ5MzN3TmdoN1lHOXZJSU1xd09W?=
 =?utf-8?B?ZE5GV09HZitIZTNTS1dVYXJlNmNITjY0TXlmSjQzNXJRUHEvZEl5bHVOR2pW?=
 =?utf-8?B?cmRRU2NRVkFFNHU1QnhJUnFxSndpR0RwQ3NBRmRSS2Y4SVJ0MjRQaVpkaHZ4?=
 =?utf-8?B?NTZna2VPYWV1b0ViWVAzUTlvRHpPQ3FiQkpDM0Z6bEVJcm5nUVd6ZnhwWFdN?=
 =?utf-8?B?eDRNNFVPalNuSE12L2FGQTZSeGNPTlhUSWpxYU1mcUNTb2U3K3lHTHZVZ1Jk?=
 =?utf-8?B?UlkwalNnaWRueVhmUzlnS2NBS2F1U3M0cUJudVNHYzZVeVRWNElySDMwTngr?=
 =?utf-8?B?RjcrZGlCa2dIa3VHVUMyNXRKZ2c0ek9uT0hWNDBVaHBJYms4cjZnQWgxQlZR?=
 =?utf-8?B?cmlnZFF0ZTg1S1hNRVhzZWIzdEpCZEZvbEQxV2RpV2E1ajJtaFNheXVsUHk5?=
 =?utf-8?B?Y1Y0UDNtZVdJTDB1V3lwQnlGWmY1SEY0M2F0QWZxQTBNaElLQXhwanExSTB1?=
 =?utf-8?B?QjJoOTZXWVJMek0vMlRuWXpOU1pFRVZuQUtnWGlZZkFCcmlKRTR1ZEVkUDJK?=
 =?utf-8?B?SWdHckVVRlBnaEdjVG9xc2Q0alhhV2o5WXdVSGhZY3dmVmRJOEdaTCtKMitw?=
 =?utf-8?B?Ulh4Unl1LzRuSktGam00RGcydjZ2K0owRm9JaDlIelAvNENmUmtycVB2Vmhs?=
 =?utf-8?B?UUtLVHdFQzIxT2s4UjZ5TmZJTEZ1b3M5NGQ5bGo0T2crbk9ncG16aEFiRDRV?=
 =?utf-8?B?dk4vNitqL3Q3N2ZCcUs4NisydmxvNHQrdHB1QlpzWEQwbTg3VkVkc2lqcEpN?=
 =?utf-8?B?SEJ6eUJEa0IyRkgwT2dNT25SR3JYOWt6L1JVbmptUm1FUDhLRkZoMG9zT2xj?=
 =?utf-8?B?bjIxMXg5WUdnaFBTMm1QQUVhWG91VkV1RzFDZW9oeGdPbFVDT3ZhS2hUQUZF?=
 =?utf-8?B?UEtTUWZJR3NRNkw0MUJ5SzIyTjZMeXMxL1U3U3ZjZEdtWXFtcDUwekZ5Ynk5?=
 =?utf-8?B?dGI4a2ZnTjdyTTk1YkpHUUhWVll6NmFkOVpNUVg3OEtnUGRYcG1iSFdkcWVH?=
 =?utf-8?B?Qzh2YjZLK1ErN0FCNm8zbG5iUGJZQy9JcjlaSmxYOGNQaXFYOVA3OWZpNGxJ?=
 =?utf-8?B?SnZHWkNEbVc2N0tnOGIrSVhadjFvRTJpS1B5WnBmcnpnYmdWOXVEUGVVeFZZ?=
 =?utf-8?B?M28zUWxHcFFyUHZhbWh0MUliUEVIRTJZTXhGOGZkaG9CTEtUK08zZkNtMHdJ?=
 =?utf-8?B?Q21IVWJhUmQyMUtybGtMS3ptSGxoRlZNK2VRc1kxdTVnTm8zTG42NmlRdmRP?=
 =?utf-8?B?WkRQRnhBWURhWEFSR24xNGxzMmR0d0tKbGdLUlg3Wm9EMXFRNlhGaVJORk5v?=
 =?utf-8?B?TGFNVlovU0xUU2dtazNwUU02ZWczMWdaVnE5aUlycmx1ekIrTGNscmxMZWU0?=
 =?utf-8?B?Mm5CWHlEUjliQTIvKzVQSVR5amI4TWlIaGZWWjczNWxBNkVWQWRnVXNSWk50?=
 =?utf-8?B?aXVVdVdta0k1cW1nVEdpbnkyWk83QWNtQ0t4SFA0NUtBNDRTVGZOV25uR0Nw?=
 =?utf-8?B?NWxzb0tpQ3N6dXl0cVRXWGhQZStZVXVtMDBQUUN2RStsNGlQaThWeGlpV21u?=
 =?utf-8?B?bjMzZm9uRFlQejVKTVQ0RlAvR1d5aHZZaTQ5NXV2eC83L1UrMUo0eG1FR3BG?=
 =?utf-8?B?ZmNhU054SjltV3cvaXVEOThQeHdZOVgza3JnYmd0YkYvNXgrZ3VQRUswZzNh?=
 =?utf-8?B?cXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd13cef8-60f7-47bd-935e-08de00d916c4
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 10:55:52.7612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DjBUk1Clvr9k2YUFgRRqpRL3K7vZcAFkmTnZDfYWn4WEnUsuDc0zIt3trjczuBva1wJFvH6AgeBdcXb8f40fQ1fhg+I79mslf5DJVn45JfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4791
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAxMDA5MyBTYWx0ZWRfX8+WLb8EiukmV
 nNIU43aQ6+ziSiPbWCl0iYB1+F1ksd44hZHcHWfiqjEi2AL48W9s16Y4K1KuNkte/82+P2HGQ3r
 J5GlayYyfm4FGh0VX5DUx6RHHNjVg/W7sHlT933h0zLSeYMHddsGK+SuQls1ARty6BqnDL2tiq/
 RrEF3GOtV8Ri9cwTWakoMpiofkKYdXxnhJm/n+CSZKG5fZVIIotUd6bniIGyAm93X8yL715EGLy
 LKriN89fw54JochxWMdLazduljOh/E9ivWrUe8Trdpif/rktyxWjBdfwp0dsb+Ms8yEJ4PDWcWy
 q1bMh22mf5T6d0JnuSVRo6D4zFoA1CYfPKVIwGZJdBcQ48pY/O12js0aGdW6b3hksd7q/Mw558H
 XL0NHZDTJZtC2JZgiRvqXL9Hj4grhg==
X-Authority-Analysis: v=2.4 cv=ZNPaWH7b c=1 sm=1 tr=0 ts=68dd08bd cx=c_pps
 a=3isWwmYGSdluMw1j68YAZQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=hkEv4HZQAAAA:8 a=NEAV23lmAAAA:8 a=kmYkUENqAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=IK9VDP1wHxr0HX4uTGYA:9 a=QEXdDO2ut3YA:10
 a=estwG2eNYqAOIwiJ3NUA:9 a=YudC9rNQBEf4gvaC:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=NA03pvyaApPJG5valX87:22 a=p9kz6gysRiz6SGr9lVkz:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ofuwGpTZXtZEcfSTXZ-9EfaYVsil0Dmx
X-Proofpoint-GUID: EcYDvdEjqHnt5nJcAFG7duuTS6y0cOlF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2510010093
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Oct 2025 10:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120102

--------------XUBQjyAdFp1gK000DBtJ8siq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 01-10-2025 00:40, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 9/30/25 20:43, Gyorgy Sarvari via lists.openembedded.org wrote:
>> On 9/30/25 12:20, Urade, Yogita wrote:
>>> On 30-09-2025 15:35, Gyorgy Sarvari wrote:
>>>> CAUTION: This email comes from a non Wind River email account!
>>>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>>>
>>>> On 9/26/25 12:51, Urade, Yogita via lists.openembedded.org wrote:
>>>>> From: Yogita Urade<yogita.urade@windriver.com>
>>>>>
>>>>> This reverts commit 7b57b8f1069f29981623ee30c6dd24b7781ed958.
>>>>>
>>>>> This upgradation causes timeout issue to start the mysqld services.
>>>> Could you please give some info, how to reproduce this issue? Does it
>>>> need anything special?
>>>> I think it would be better to bisect the issue and try to find the
>>>> solution (if possible) rather than going backwards.
>>> To reproduce this issue, added following parameters in local.conf:
>>> DISTRO_FEATURES:append = " systemd usrmerge"
>>> DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
>>> VIRTUAL-RUNTIME_init_manager = "systemd"
>>> VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
>>>
>>> After booting to image ran the following command:
>>> root@qemux86-64:~# systemctl start mysqld
>>>   Job for mysqld.service failed because a timeout was exceeded.
>>>   See "systemctl status mysqld.service" and "journalctl -xeu
>>> mysqld.service" for details.
>>>
>>> Kindly let me know if you have any suggestions to fix this.
>> It seems that a colleague of yours has ran into this issue some time
>> ago:https://jira.mariadb.org/browse/MDEV-36051 - and at the first sight
>> I think the observations made about the contradictory comments about
>> stack-growing direction are correct.
>>
>> Try to add "-DSTACK_DIRECTION=-1" to EXTRA_OECMAKE, and give it a test
>> (maybe with some data and queries also). Since AFAIK Yocto is not too
>> widely used on SPARC and HP-UX (where the value of this macro should be
>> different), I think it could be just added to the recipe, if it works.
> Sorry for the spam: now I see that the STACK_DIRECTION is actually
> defined in the recipe, with a seemingly incorrect value. I think it
> could be removed from EXTRA_OECMAKE - if the macro is not defined, then
> cmake tries to guess it (and I think its guesses it correctly). Looking
> at git-blame, I think it might have gotten in accidentally, as a
> not-deleted debug option.
Thanks for helping me to resolve this issue.
After removing STACK_DIRECTION from EXTRA_OECMAKE I'm able to run mysqld 
services.

Kindly ignore this revert patch.

I'll send another patch to fix systemd failure.
>>> ../Yogita
>>>>> Signed-off-by: Yogita Urade<yogita.urade@windriver.com>
>>>>> ---
>>>>>   ..._10.11.12.bb => mariadb-native_10.11.9.bb} |  0
>>>>>   meta-oe/recipes-dbs/mysql/mariadb.inc         |  4 +-
>>>>>   ...-missing-includes-cstdint-and-cstdio.patch | 43 ++++++++++++-------
>>>>>   .../recipes-dbs/mysql/mariadb/mm_malloc.patch | 13 ++++++
>>>>>   .../mysql/mariadb/ppc-remove-glibc-dep.patch  | 43 +++++++++++++++++++
>>>>>   ...mariadb_10.11.12.bb => mariadb_10.11.9.bb} |  0
>>>>>   6 files changed, 87 insertions(+), 16 deletions(-)
>>>>>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.12.bb => mariadb-native_10.11.9.bb} (100%)
>>>>>   create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
>>>>>   create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
>>>>>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.12.bb => mariadb_10.11.9.bb} (100%)
>>>>>
>>>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
>>>>> similarity index 100%
>>>>> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb
>>>>> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
>>>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
>>>>> index 6e7c01a775..abcf0b3cda 100644
>>>>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
>>>>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
>>>>> @@ -17,13 +17,15 @@ SRC_URI ="https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \ 
>>>>> file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch 
>>>>> \ 
>>>>> file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch 
>>>>> \ file://ssize_t.patch \ + file://mm_malloc.patch \ 
>>>>> file://sys_futex.patch \ file://cross-compiling.patch \ 
>>>>> file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \ 
>>>>> file://lfs64.patch \ 
>>>>> file://0001-Add-missing-includes-cstdint-and-cstdio.patch \ "
>>>>> -SRC_URI[sha256sum] = "d61f23090cfc14f43e8a27c2d3ce7f80247e74481bb26a2d3a6308b8d194e167"
>>>>> +SRC_URI:append:libc-musl =" file://ppc-remove-glibc-dep.patch"
>>>>> +SRC_URI[sha256sum] = "0a00180864cd016187c986faab8010de23a117b9a75f91d6456421f894e48d20"
>>>>>
>>>>>   UPSTREAM_CHECK_URI ="https://github.com/MariaDB/server/releases"
>>>>>
>>>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
>>>>> index fa580d039a..7fc2377f19 100644
>>>>> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
>>>>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
>>>>> @@ -11,14 +11,27 @@ Upstream-Status: Pending
>>>>>   Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>>>   Signed-off-by: Mingli Yu<mingli.yu@windriver.com>
>>>>>   ---
>>>>> - storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h  | 1 +
>>>>> - .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h   | 1 +
>>>>> - storage/rocksdb/rocksdb/util/slice.cc                           | 2 +-
>>>>> - storage/rocksdb/rocksdb/util/string_util.h                      | 1 +
>>>>> - 4 files changed, 4 insertions(+), 1 deletion(-)
>>>>> + .../rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h   | 1 +
>>>>> + storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h   | 1 +
>>>>> + .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h    | 1 +
>>>>> + storage/rocksdb/rocksdb/util/slice.cc                            | 1 +
>>>>> + storage/rocksdb/rocksdb/util/string_util.h                       | 1 +
>>>>> + 5 files changed, 5 insertions(+)
>>>>>
>>>>> +diff --git a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
>>>>> +index 963c1d8e..73487edd 100644
>>>>> +--- a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
>>>>> ++++ b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
>>>>> +@@ -5,6 +5,7 @@
>>>>> +
>>>>> + #pragma once
>>>>> +
>>>>> ++#include <cstdint>
>>>>> + #include "rocksdb/rocksdb_namespace.h"
>>>>> +
>>>>> + struct CompactionIterationStats {
>>>>>   diff --git a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
>>>>> -index 7fb9d489..f7b4e6f0 100644
>>>>> +index c7f93b4c..3c2ab805 100644
>>>>>   --- a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
>>>>>   +++ b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
>>>>>   @@ -8,6 +8,7 @@
>>>>> @@ -42,20 +55,20 @@ index f356395f..32152217 100644
>>>>>    #include <vector>
>>>>>
>>>>>   diff --git a/storage/rocksdb/rocksdb/util/slice.cc b/storage/rocksdb/rocksdb/util/slice.cc
>>>>> -index 3c3656de..b18d7f5d 100644
>>>>> +index 6db11cc9..c26b6a21 100644
>>>>>   --- a/storage/rocksdb/rocksdb/util/slice.cc
>>>>>   +++ b/storage/rocksdb/rocksdb/util/slice.cc
>>>>> -@@ -12,7 +12,7 @@
>>>>> - #include <stdio.h>
>>>>> +@@ -8,6 +8,7 @@
>>>>> + // found in the LICENSE file. See the AUTHORS file for names of contributors.
>>>>>
>>>>>    #include <algorithm>
>>>>> --
>>>>>   +#include <cstdint>
>>>>> - #include "rocksdb/convenience.h"
>>>>>    #include "rocksdb/slice_transform.h"
>>>>> - #include "rocksdb/utilities/object_registry.h"
>>>>> -diff --git a/storage/rocksdb/rocksdb/util/string_util.h b/storage/rocksdb/rocksdb/util/string_util.h
>>>>> -index 7794dbb0..b480177e 100644
>>>>> + #include "rocksdb/slice.h"
>>>>> + #include "util/string_util.h"
>>>>> +
>>>>> +diff --git a/util/string_util.h b/util/string_util.h
>>>>> +index 55d106fff02..11178fd1d7b 100644
>>>>>   --- a/storage/rocksdb/rocksdb/util/string_util.h
>>>>>   +++ b/storage/rocksdb/rocksdb/util/string_util.h
>>>>>   @@ -6,6 +6,7 @@
>>>>> @@ -67,5 +80,5 @@ index 7794dbb0..b480177e 100644
>>>>>    #include <string>
>>>>>    #include <unordered_map>
>>>>>   --
>>>>> -2.40.0
>>>>> +2.25.1
>>>>>
>>>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
>>>>> new file mode 100644
>>>>> index 0000000000..56ed480d33
>>>>> --- /dev/null
>>>>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
>>>>> @@ -0,0 +1,13 @@
>>>>> +Upstream-Status: Pending
>>>>> +
>>>>> +--- a/storage/rocksdb/rocksdb/port/jemalloc_helper.h
>>>>> ++++ b/storage/rocksdb/rocksdb/port/jemalloc_helper.h
>>>>> +@@ -5,7 +5,7 @@
>>>>> +
>>>>> + #pragma once
>>>>> +
>>>>> +-#if defined(__clang__)
>>>>> ++#if defined(__clang__) && defined(__GLIBC__)
>>>>> + // glibc's `posix_memalign()` declaration specifies `throw()` while clang's
>>>>> + // declaration does not. There is a hack in clang to make its re-declaration
>>>>> + // compatible with glibc's if they are declared consecutively. That hack breaks
>>>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
>>>>> new file mode 100644
>>>>> index 0000000000..3787b74ad1
>>>>> --- /dev/null
>>>>> +++ b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
>>>>> @@ -0,0 +1,43 @@
>>>>> +Upstream-Status: Pending
>>>>> +
>>>>> +Remove glibc specific function dependencies
>>>>> +
>>>>> +Sourced from:https://git.alpinelinux.org/aports/tree/main/mariadb/ppc-remove-glibc-dep.patch
>>>>> +Signed-off-by: Khem Raj<raj.khem@gmail.com>
>>>>> +
>>>>> +diff --git a/include/my_cpu.h b/include/my_cpu.h
>>>>> +index f2e26fca..94599b74 100644
>>>>> +--- a/include/my_cpu.h
>>>>> ++++ b/include/my_cpu.h
>>>>> +@@ -24,17 +24,16 @@
>>>>> + */
>>>>> +
>>>>> + #ifdef _ARCH_PWR8
>>>>> +-#include <sys/platform/ppc.h>
>>>>> + /* Very low priority */
>>>>> +-#define HMT_very_low() __ppc_set_ppr_very_low()
>>>>> ++#define HMT_very_low() asm volatile("or 31,31,31")
>>>>> + /* Low priority */
>>>>> +-#define HMT_low() __ppc_set_ppr_low()
>>>>> ++#define HMT_low() asm volatile ("or 1,1,1")
>>>>> + /* Medium low priority */
>>>>> +-#define HMT_medium_low() __ppc_set_ppr_med_low()
>>>>> ++#define HMT_medium_low() asm volatile ("or 6,6,6")
>>>>> + /* Medium priority */
>>>>> +-#define HMT_medium() __ppc_set_ppr_med()
>>>>> ++#define HMT_medium() asm volatile ("or 2,2,2")
>>>>> + /* Medium high priority */
>>>>> +-#define HMT_medium_high() __ppc_set_ppr_med_high()
>>>>> ++#define HMT_medium_high() asm volatile("or 5,5,5")
>>>>> + /* High priority */
>>>>> + #define HMT_high() asm volatile("or 3,3,3")
>>>>> + #else
>>>>> +@@ -72,7 +71,7 @@ static inline void MY_RELAX_CPU(void)
>>>>> +   __asm__ __volatile__ ("pause");
>>>>> + #endif
>>>>> + #elif defined(_ARCH_PWR8)
>>>>> +-  __ppc_get_timebase();
>>>>> ++  __builtin_ppc_get_timebase();
>>>>> + #elif defined __GNUC__ && (defined __arm__ || defined __aarch64__)
>>>>> +   /* Mainly, prevent the compiler from optimizing away delay loops */
>>>>> +   __asm__ __volatile__ ("":::"memory");
>>>>> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb
>>>>> similarity index 100%
>>>>> rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb
>>>>> rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb
>>>>>
>>>>>
>>>>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#120082):https://lists.openembedded.org/g/openembedded-devel/message/120082
>> Mute This Topic:https://lists.openembedded.org/mt/115446396/6084445
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
--------------XUBQjyAdFp1gK000DBtJ8siq
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html data-lt-installed="true"><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body style="padding-bottom: 1px;">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 01-10-2025 00:40, Gyorgy Sarvari
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:8c483402-ce57-493e-a344-3339cb04ee40@gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On 9/30/25 20:43, Gyorgy Sarvari via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">On 9/30/25 12:20, Urade, Yogita wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
On 30-09-2025 15:35, Gyorgy Sarvari wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On 9/26/25 12:51, Urade, Yogita via lists.openembedded.org wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">From: Yogita Urade <a class="moz-txt-link-rfc2396E" href="mailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>

This reverts commit 7b57b8f1069f29981623ee30c6dd24b7781ed958.

This upgradation causes timeout issue to start the mysqld services.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Could you please give some info, how to reproduce this issue? Does it
need anything special?
I think it would be better to bisect the issue and try to find the
solution (if possible) rather than going backwards.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">To reproduce this issue, added following parameters in local.conf:
DISTRO_FEATURES:append = &quot; systemd usrmerge&quot;
DISTRO_FEATURES_BACKFILL_CONSIDERED += &quot;sysvinit&quot;
VIRTUAL-RUNTIME_init_manager = &quot;systemd&quot;
VIRTUAL-RUNTIME_initscripts = &quot;systemd-compat-units&quot;

After booting to image ran the following command:
root@qemux86-64:~# systemctl start mysqld
 Job for mysqld.service failed because a timeout was exceeded.
 See &quot;systemctl status mysqld.service&quot; and &quot;journalctl -xeu
mysqld.service&quot; for details.

Kindly let me know if you have any suggestions to fix this.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">It seems that a colleague of yours has ran into this issue some time
ago: <a class="moz-txt-link-freetext" href="https://jira.mariadb.org/browse/MDEV-36051">https://jira.mariadb.org/browse/MDEV-36051</a> - and at the first sight
I think the observations made about the contradictory comments about
stack-growing direction are correct.

Try to add &quot;-DSTACK_DIRECTION=-1&quot; to EXTRA_OECMAKE, and give it a test
(maybe with some data and queries also). Since AFAIK Yocto is not too
widely used on SPARC and HP-UX (where the value of this macro should be
different), I think it could be just added to the recipe, if it works.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Sorry for the spam: now I see that the STACK_DIRECTION is actually
defined in the recipe, with a seemingly incorrect value. I think it
could be removed from EXTRA_OECMAKE - if the macro is not defined, then
cmake tries to guess it (and I think its guesses it correctly). Looking
at git-blame, I think it might have gotten in accidentally, as a
not-deleted debug option.
</pre>
    </blockquote>
    Thanks for helping me to resolve this issue.&nbsp;<br>
    After removing STACK_DIRECTION from EXTRA_OECMAKE I'm able to run
    mysqld services.<br>
    <br>
    Kindly ignore this revert patch.<br>
    <br>
    I'll send another patch to fix systemd failure.<br>
    <blockquote type="cite" cite="mid:8c483402-ce57-493e-a344-3339cb04ee40@gmail.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">../Yogita
</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Signed-off-by: Yogita Urade <a class="moz-txt-link-rfc2396E" href="mailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com&gt;</a>
---
 ..._10.11.12.bb =&gt; mariadb-native_10.11.9.bb} |  0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  4 +-
 ...-missing-includes-cstdint-and-cstdio.patch | 43 ++++++++++++-------
 .../recipes-dbs/mysql/mariadb/mm_malloc.patch | 13 ++++++
 .../mysql/mariadb/ppc-remove-glibc-dep.patch  | 43 +++++++++++++++++++
 ...mariadb_10.11.12.bb =&gt; mariadb_10.11.9.bb} |  0
 6 files changed, 87 insertions(+), 16 deletions(-)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.12.bb =&gt; mariadb-native_10.11.9.bb} (100%)
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
 create mode 100644 meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.12.bb =&gt; mariadb_10.11.9.bb} (100%)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.11.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.11.9.bb
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index 6e7c01a775..abcf0b3cda 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -17,13 +17,15 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="https://archive.mariadb.org/${BP}/source/${BP}.tar.gz\file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch\file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch\file://ssize_t.patch\+file://mm_malloc.patch\file://sys_futex.patch\file://cross-compiling.patch\file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch\file://lfs64.patch\file://0001-Add-missing-includes-cstdint-and-cstdio.patch\">&quot;https://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch
\ file://ssize_t.patch \ + file://mm_malloc.patch \
file://sys_futex.patch \ file://cross-compiling.patch \
file://0001-sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
file://lfs64.patch \
file://0001-Add-missing-includes-cstdint-and-cstdio.patch \ &quot;</a>
-SRC_URI[sha256sum] = &quot;d61f23090cfc14f43e8a27c2d3ce7f80247e74481bb26a2d3a6308b8d194e167&quot;
+SRC_URI:append:libc-musl = <a class="moz-txt-link-rfc2396E" href="file://ppc-remove-glibc-dep.patch">&quot; file://ppc-remove-glibc-dep.patch&quot;</a>
+SRC_URI[sha256sum] = &quot;0a00180864cd016187c986faab8010de23a117b9a75f91d6456421f894e48d20&quot;

 UPSTREAM_CHECK_URI = <a class="moz-txt-link-rfc2396E" href="https://github.com/MariaDB/server/releases">&quot;https://github.com/MariaDB/server/releases&quot;</a>

diff --git a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
index fa580d039a..7fc2377f19 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
+++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Add-missing-includes-cstdint-and-cstdio.patch
@@ -11,14 +11,27 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
 Signed-off-by: Mingli Yu <a class="moz-txt-link-rfc2396E" href="mailto:mingli.yu@windriver.com">&lt;mingli.yu@windriver.com&gt;</a>
 ---
- storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h  | 1 +
- .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h   | 1 +
- storage/rocksdb/rocksdb/util/slice.cc                           | 2 +-
- storage/rocksdb/rocksdb/util/string_util.h                      | 1 +
- 4 files changed, 4 insertions(+), 1 deletion(-)
+ .../rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h   | 1 +
+ storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h   | 1 +
+ .../rocksdb/rocksdb/table/block_based/data_block_hash_index.h    | 1 +
+ storage/rocksdb/rocksdb/util/slice.cc                            | 1 +
+ storage/rocksdb/rocksdb/util/string_util.h                       | 1 +
+ 5 files changed, 5 insertions(+)

+diff --git a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
+index 963c1d8e..73487edd 100644
+--- a/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
++++ b/storage/rocksdb/rocksdb/db/compaction/compaction_iteration_stats.h
+@@ -5,6 +5,7 @@
+
+ #pragma once
+
++#include &lt;cstdint&gt;
+ #include &quot;rocksdb/rocksdb_namespace.h&quot;
+
+ struct CompactionIterationStats {
 diff --git a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
-index 7fb9d489..f7b4e6f0 100644
+index c7f93b4c..3c2ab805 100644
 --- a/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
 +++ b/storage/rocksdb/rocksdb/include/rocksdb/utilities/checkpoint.h
 @@ -8,6 +8,7 @@
@@ -42,20 +55,20 @@ index f356395f..32152217 100644
  #include &lt;vector&gt;

 diff --git a/storage/rocksdb/rocksdb/util/slice.cc b/storage/rocksdb/rocksdb/util/slice.cc
-index 3c3656de..b18d7f5d 100644
+index 6db11cc9..c26b6a21 100644
 --- a/storage/rocksdb/rocksdb/util/slice.cc
 +++ b/storage/rocksdb/rocksdb/util/slice.cc
-@@ -12,7 +12,7 @@
- #include &lt;stdio.h&gt;
+@@ -8,6 +8,7 @@
+ // found in the LICENSE file. See the AUTHORS file for names of contributors.

  #include &lt;algorithm&gt;
--
 +#include &lt;cstdint&gt;
- #include &quot;rocksdb/convenience.h&quot;
  #include &quot;rocksdb/slice_transform.h&quot;
- #include &quot;rocksdb/utilities/object_registry.h&quot;
-diff --git a/storage/rocksdb/rocksdb/util/string_util.h b/storage/rocksdb/rocksdb/util/string_util.h
-index 7794dbb0..b480177e 100644
+ #include &quot;rocksdb/slice.h&quot;
+ #include &quot;util/string_util.h&quot;
+
+diff --git a/util/string_util.h b/util/string_util.h
+index 55d106fff02..11178fd1d7b 100644
 --- a/storage/rocksdb/rocksdb/util/string_util.h
 +++ b/storage/rocksdb/rocksdb/util/string_util.h
 @@ -6,6 +6,7 @@
@@ -67,5 +80,5 @@ index 7794dbb0..b480177e 100644
  #include &lt;string&gt;
  #include &lt;unordered_map&gt;
 --
-2.40.0
+2.25.1

diff --git a/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
new file mode 100644
index 0000000000..56ed480d33
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/mm_malloc.patch
@@ -0,0 +1,13 @@
+Upstream-Status: Pending
+
+--- a/storage/rocksdb/rocksdb/port/jemalloc_helper.h
++++ b/storage/rocksdb/rocksdb/port/jemalloc_helper.h
+@@ -5,7 +5,7 @@
+
+ #pragma once
+
+-#if defined(__clang__)
++#if defined(__clang__) &amp;&amp; defined(__GLIBC__)
+ // glibc's `posix_memalign()` declaration specifies `throw()` while clang's
+ // declaration does not. There is a hack in clang to make its re-declaration
+ // compatible with glibc's if they are declared consecutively. That hack breaks
diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
new file mode 100644
index 0000000000..3787b74ad1
--- /dev/null
+++ b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Pending
+
+Remove glibc specific function dependencies
+
+Sourced from: <a class="moz-txt-link-freetext" href="https://git.alpinelinux.org/aports/tree/main/mariadb/ppc-remove-glibc-dep.patch">https://git.alpinelinux.org/aports/tree/main/mariadb/ppc-remove-glibc-dep.patch</a>
+Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
+
+diff --git a/include/my_cpu.h b/include/my_cpu.h
+index f2e26fca..94599b74 100644
+--- a/include/my_cpu.h
++++ b/include/my_cpu.h
+@@ -24,17 +24,16 @@
+ */
+
+ #ifdef _ARCH_PWR8
+-#include &lt;sys/platform/ppc.h&gt;
+ /* Very low priority */
+-#define HMT_very_low() __ppc_set_ppr_very_low()
++#define HMT_very_low() asm volatile(&quot;or 31,31,31&quot;)
+ /* Low priority */
+-#define HMT_low() __ppc_set_ppr_low()
++#define HMT_low() asm volatile (&quot;or 1,1,1&quot;)
+ /* Medium low priority */
+-#define HMT_medium_low() __ppc_set_ppr_med_low()
++#define HMT_medium_low() asm volatile (&quot;or 6,6,6&quot;)
+ /* Medium priority */
+-#define HMT_medium() __ppc_set_ppr_med()
++#define HMT_medium() asm volatile (&quot;or 2,2,2&quot;)
+ /* Medium high priority */
+-#define HMT_medium_high() __ppc_set_ppr_med_high()
++#define HMT_medium_high() asm volatile(&quot;or 5,5,5&quot;)
+ /* High priority */
+ #define HMT_high() asm volatile(&quot;or 3,3,3&quot;)
+ #else
+@@ -72,7 +71,7 @@ static inline void MY_RELAX_CPU(void)
+   __asm__ __volatile__ (&quot;pause&quot;);
+ #endif
+ #elif defined(_ARCH_PWR8)
+-  __ppc_get_timebase();
++  __builtin_ppc_get_timebase();
+ #elif defined __GNUC__ &amp;&amp; (defined __arm__ || defined __aarch64__)
+   /* Mainly, prevent the compiler from optimizing away delay loops */
+   __asm__ __volatile__ (&quot;&quot;:::&quot;memory&quot;);
diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb
similarity index 100%
rename from meta-oe/recipes-dbs/mysql/mariadb_10.11.12.bb
rename to meta-oe/recipes-dbs/mysql/mariadb_10.11.9.bb



</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#120082): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/120082">https://lists.openembedded.org/g/openembedded-devel/message/120082</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115446396/6084445">https://lists.openembedded.org/mt/115446396/6084445</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:skandigraun@gmail.com">skandigraun@gmail.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
  <lt-container></lt-container>
</html>

--------------XUBQjyAdFp1gK000DBtJ8siq--

