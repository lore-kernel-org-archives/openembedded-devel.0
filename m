Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A9EC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 06:32:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.5306.1741329152979930164
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Mar 2025 22:32:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51612f03a9=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5275jGhf003728
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Mar 2025 06:32:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456ct8awy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 06:32:31 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5276WV21007825;
	Fri, 7 Mar 2025 06:32:31 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2048.outbound.protection.outlook.com [104.47.51.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 456ct8awy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Mar 2025 06:32:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s3TXyJsRGioNgDs/9lY9Fuo0ZnQgKOstgbPsyDkDPdaIBLeK0i1TOujhWjtrJbYU5a7CuNi5WRRyBpAG27dxzKOjzIFUl3FDMdvc3tW2RnO37oTJksFdwYOnhSFaMUrY2dIquOygReJkTys5ytxpJs5JhiaGIv1BYYHnHJ70D5vPrPdGDEJqLvPIaU76l/JFUjrt504jC5LHdrLh0XJk5nWhBGYXi9wgdGxKCdi5Tdd1y774mfZMiIlq2mkmTzqA8lqm8poVlgtrYXELwOpUE+qBKIc+Q7xNKd8e3r3fod2GdrDpVWxCinQUHw0nHgbHgTeXhGuF3Yt7WEyyQLj+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fuYf1l9uV+VZVEwvTqRGTn9fYNwyEdKCspqbpH4V3Y=;
 b=jsn0X5iEyn9AprgTzBraV44apM0CsroqHztETRRBhtDs0Kp7uoP/czAP9NkPvOKdVhN02TMkXEFgva2T2I0Ofp5Y/TsrHX9qZqi84n4QS23DAzbBSBji3Kc44/ey5DkDR6GA5rDr9UROBiNWeTMxIaV/cKLzDgRXWLNOyFWripU2FUFnKbLNENUeWbk2YtbAPnn1bjPyrG3PXnuAg5t8D1QDnLxDwn5UtZ7wdvdfEnI0RHZxT3zCy/j8bxahVb2TgjuCKWVljCF+5RWwc9R/EKj4TICk9mAEQpf0CfWAj/wCBPSoU4Oi5SUidbNlnIUCtsBxfstBj5DYCPk6nJXDfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by DM4PR11MB6214.namprd11.prod.outlook.com (2603:10b6:8:ac::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.17; Fri, 7 Mar 2025 06:32:27 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%7]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 06:32:26 +0000
Message-ID: <944ca7d5-dc26-4ba3-85d0-6d467314d5e5@windriver.com>
Date: Fri, 7 Mar 2025 14:32:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] thin-provisioning-tools: use
 STAGING_LIBDIR_NATIVE variable for LIBCLANG_PATH
To: Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20250303191621.2421906-1-martin.jansa@gmail.com>
 <CAMKF1spURmMC9G5-3NwGrtsfoeE=HxbCN20G2-FPU+1xoPO80w@mail.gmail.com>
 <CA+chaQek5-=Ob4AA5PMi9tD8KME9pRpfvNicf=BvWxTniUwWjg@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CA+chaQek5-=Ob4AA5PMi9tD8KME9pRpfvNicf=BvWxTniUwWjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYBP286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::18) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|DM4PR11MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 583f5bd7-dee2-42b9-d1cd-08dd5d41d3be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TkZRcTdKcURNOG5rbml4blhySU83ZzdDaFJxeWtQbWpLeldRTDFsQlA4OFYy?=
 =?utf-8?B?TTk0aE9OSlVMSURnc2U1OEViWUc0bHBXbi9wM0Q2Qm0wVkZPbUs4cThZWGkx?=
 =?utf-8?B?MXRHYzlETlJlVjNIWVVCYjlvTHByQ25TU2JSSHR1TWFPSFVVaEpwemdmaUpV?=
 =?utf-8?B?ZmR4UmYzTkVqWTdKSDB5ZzZpZUFqNW9tdHJFV0lJOHIwMHpOOUJBMUw4bzFw?=
 =?utf-8?B?ZE4zcktPdEtmUmI5S095bmJoUzdvZmd1L2ljWTN2ckk2MTNwWGpXd1M0QzZS?=
 =?utf-8?B?VDJ0V0t1cG1Vd3BWNWhTS05obitUYXRTanNRV1pReUFmeGppalJtYUFEUHFr?=
 =?utf-8?B?b1gvVlRaMnloNGQ1L0lTalpmUWhNclk3QlV6YTlqendpQldZa3g5RDNRRXhu?=
 =?utf-8?B?QmdVRWhISlhaMXFtUDJQdFhDWmxKTElYWGI3T0dvR1B2NEM0OUd4YWZ1ME9S?=
 =?utf-8?B?YjVxeXVDaXVGY2Z6aUk4VFFYSHBxRTlRSVV6Ylg3MCtIRGcrZGNkejY5N2lk?=
 =?utf-8?B?eXk0bzIzY21hNHo2VG5uK0lVMGptVllQcHR5ajdkVE1TVDJ5ZVFDemFaNFQ2?=
 =?utf-8?B?WVh3UG0rT3YwZjExQUxPTm9pSnNZbmgraWNITTFlRm1mTVA4RWhud0VWZmtO?=
 =?utf-8?B?QXI2TjA0bGxVTmhCSEJ0M2ZCTGZ6K2dMZk9zeEt0K05TeSt4K1RjTHBicXEx?=
 =?utf-8?B?WnhyKzZacDZCS0RoalRJenl0UldidnV1OEUzTUhpZWZ5RGx4UDFKWmoydjI1?=
 =?utf-8?B?bjdTb1V2bnZxOVZWVnhSNURZYU9ManIxbUFITHo5Y3o3TlE5RVE1SHcwdm5I?=
 =?utf-8?B?VnNkczliaFVscURJYURVYUZ0SzRUNnIyRjJCQWlQY0ViNTdYM3BjekVDM3pv?=
 =?utf-8?B?MDgrOUJobkV6T1dsSnBjYUlOZ1JsRW9SRkVsQXI2MzdSU0Z5Z1EzWTNZdUhk?=
 =?utf-8?B?WDYyekNwTWNsQUNMMFNSaHhFQzZTR005N0dOT1lWbzhHZDVNZHo4cG5kYjF6?=
 =?utf-8?B?ZDUxNm1lQjlIRmprRVdxS0U3YTAwYXFHWUNubkROVVZvMlp2RkJBUENuTUNa?=
 =?utf-8?B?bmhYd1FoTnBFUnJTdC9sdEYzcitRS0ozdGZJaWdMVHljM0tKR1FaeGhWdFBp?=
 =?utf-8?B?dHNpNnVzYnY5eTFpWmY3WW14aytvWFVKdmc4RmpYci9QKzJmU1JXTVprbk1u?=
 =?utf-8?B?SEhqSE9IU2VmWG5SaEtXcUdKcENCenlmWjRVWTdHMlB5RWFxaVNsUFRxamxD?=
 =?utf-8?B?bk85bDN3YlRqU2N4M3NtZlcwRURIdTh2VGVoS080YVo4bGFUQTdyVElUdDlo?=
 =?utf-8?B?ZHpBU1BXMG96UFVzZC9BK25TeHMzaVNnTFo0d3dnTHVYOVVyS0lHeDZFTmp2?=
 =?utf-8?B?dkppTmtNMFpNY00vSFNVRS9XQXZUM3VYanZOYy90aVNyM29tZ0pLcmZFRi9S?=
 =?utf-8?B?akFIcTJaaUNTVnZrbUcxVmpyWDBQY3ZkVysrdVpNTEd0R296V3N0R2NHek9E?=
 =?utf-8?B?VVRvcWFuOEVORFdHM0Q4Wk4vdTVGYlhCYTIyNVN6ZWJRaUVrREc4SHMzaUZ6?=
 =?utf-8?B?SUdtOFR1Z1Rjbi9RSk5NUXpwMEVCT1RsYlE3eXIrR3Fyb2RoNEgvSTdVL0kz?=
 =?utf-8?B?ZFM4WFhPMGkyQWhLbWxFSytCMEdicVoxMXdyd2xyMkk5bTVVTUlMczFqUzdl?=
 =?utf-8?B?OE80eDRicEdFMkVxeGJnRTU0L2x5ODhJdGd1dWhRRW9ZenhxaU4xdlRoK1pj?=
 =?utf-8?B?WjgrTTB2NXMvYTFjTUwzaXU2ZUU5QWs3dHRDUHdSQXUyNjNNK3J1dEVpYUFp?=
 =?utf-8?B?VzFWNm5WM09UM1ZtYkdKdGJMZW55QW5rS1ExaFJIOXJabk0xV1NsdFB0YU9h?=
 =?utf-8?Q?Ryr4xxCy4obBe?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TWhobHllb2xFK3RxVGh1ZGpRb1NZVmV0YXlBcktMbk1FckVGWWxRY29LWXBZ?=
 =?utf-8?B?MVRHK0VNdmV6NGN2S1BHTml0NnpNck5FSkRYdlQ2Rm1Zd1NBb2pHMGhMZDJI?=
 =?utf-8?B?MUJSdEp2YlQ5M25SMWNucVlCNklXaHdkTERQYkRIYmlWUDBLQmhrcTRvNnBh?=
 =?utf-8?B?akFZM0pRU2Jna203YVZ2R00rRU9nTW9VNzU5a3JpMEYyS2dPTlo0QytZVjMz?=
 =?utf-8?B?dGpGNGFPSkZNNXNZRzRQTlZ3d2ZPZmRjRlhvQkFMSGU2TE1GQkJYR21BWFNV?=
 =?utf-8?B?RUR0WUNGNmNhdGhHa05ZOUdiVWc3RG0vaTZoSldUMFQ5aktvc29oVktlRC82?=
 =?utf-8?B?dlAzSnFaSDVNS2d2WWo3M0dPQ0ZBYkZROTUyQ3YveldZb2dtYUpSS005dUk1?=
 =?utf-8?B?cGp1SmJRUU9nLzhYOWROOXlUbWZob0N2MklOOVhNMXBodUJnOFkrM3FTZUFT?=
 =?utf-8?B?a0VPWHFzdmhJa0xXYWprS3krVEVBQzlWRmJMeUY5cDQwVTlRMmZSTTBSL1dt?=
 =?utf-8?B?ZXdteVh6eUpUcTVkY1dBaG5FdlFzMDhhWnE1V2dNMXJYa00wdDlyRUE5aUwy?=
 =?utf-8?B?MkJSZm9GdG0zenV2c2ZmbjdLZjlTZ2NJOXoxdERObk9ockZBNEt3VmtlWDhQ?=
 =?utf-8?B?dVlSYndhZ3hpYkNaRWIvM1VESWdTNHphZW5mUTcxL29oSHVHZGhLL0lrQlhC?=
 =?utf-8?B?czFrSnZMSU1NeHg4T09KMUVjbVFObzlDS3NST3A1ODhHenpqMExNSDE3cWNx?=
 =?utf-8?B?WHhJMjNnU0N2VmZnbHJQejE3OWRTNC9kdkRQS1JZWVFLb0wvNmxJT0IrVzB3?=
 =?utf-8?B?TEFocUI4aFpSTFVtcjl5bnNsZTdkVXVycmlkZVEyb2NWWnBYUVBDTFRBWFI3?=
 =?utf-8?B?Q2xYSTB3SEVoMzFsMXBMRDZqWHQ2MWV0dzhYektTTU14bkQ4TXFlU0toRWFm?=
 =?utf-8?B?dktVYWJHdjQwdGNaSVBUeHh4aE5VVW5KMVZvWUMrd0E0U09heXBUZ2IxeFdy?=
 =?utf-8?B?OEoxR1lzUmVldkRlWkN6T2xEdi94eXRHMmJaM2JZc2RKMDU3a29DdnNsWGpm?=
 =?utf-8?B?K2l5dC9BWTFUbmhFdG93R0ZGTXRRTzhFUjNrS1BaR25wdnRMNk9FdXZ1MzFx?=
 =?utf-8?B?RENEL2ErRmN4NjVBK0NCUnhkZW9mcFErYjlnTXZ6MFlKZ0xSR05pTE5zMmRO?=
 =?utf-8?B?V3VGZGVueUhNSGtmNUQ4MG52ZWRIWFQybEJOM3dwOG1nMDBEZUFrQmgrSklv?=
 =?utf-8?B?akhSRVQ3RWxxNFJ5Qi9zdjF1bldxWkoxaEJxOS9IUlFYT0tmSm9kN0FxQjlV?=
 =?utf-8?B?bitMcXJXQTZxM3o0cEoyZG1RYVhNNXdCRVVoWWFrQ2RQWGxhMDI1NEVVbjhV?=
 =?utf-8?B?V1VaL1FrVEduOUd1SUVKQ2RzVzUrWWcyWGRlT21aL25vb0J2alRaeWVVWnFt?=
 =?utf-8?B?SE1ySEtQaGlzQjY1YkZNSURlS20zTk5zcDZYejVIc05JRnh6MFMyUnhrQ0Mr?=
 =?utf-8?B?QnFIT1FYUGJWa3ZWbUNnYUJxMmlDNGFQYkpuR3hvaVg2YTkvYitSSGh1ZCt2?=
 =?utf-8?B?aWRZRkpLUDFRaEcxSDJUKytwMGUyVGxXWjIzUSs5ZE9GdURMK3FvdWpBdzhQ?=
 =?utf-8?B?MVZlZ3Z4RnhzNVRnQUZaYURNcWRNYTdCUk41QnNUQUxqZUs3V2pyaUMxaHJl?=
 =?utf-8?B?bnR4RVhaditSNVpRZEdQRU5EUWkwbjNmSTg4cXVTWW45bEc4dlV1ZkI1YW5J?=
 =?utf-8?B?OWZHelE5OGlqSHRNVHZvTXMyVExOcGFyb2ZVcGZkWHBQTkt3VVNyekxyd25s?=
 =?utf-8?B?VjN6aWtESmRiRFM3NWNNMk9FcGQ0cnpMdXNWU1Q4aHFDa2VQZ3lUTjc3OHZn?=
 =?utf-8?B?Sm5ZR2lqZ1NrYk5vcDZCdi9rc1FLTU1qYUpNNktGQjdVamtUZHo5NURSa0Z0?=
 =?utf-8?B?TkxNT3N4VnpSckd6WFhsMHJzcUNnak5tM2pBUytNUFRZN2Rvamt6dEZrbUdz?=
 =?utf-8?B?SXNFVHgvMDdhZnJXRkJTZXhmcS9IZ2preU1BbGk1enRVdFM2Z1NDZ1hFcHB2?=
 =?utf-8?B?Y0NSRm5sanZMT0pNWXNZWWROTHpKemNUWVp4SzByUmJtcTQwQkhRWk1EalFt?=
 =?utf-8?B?bGFGTllWU0pSd0VLWGpIU0wrZDB1MExvOEVQanloeXVmUDJRcnVlRXV0NUNw?=
 =?utf-8?B?QWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 583f5bd7-dee2-42b9-d1cd-08dd5d41d3be
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 06:32:26.7327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CRM/AZNSZevPsEx4xRERdpXiS44B7UqZJ3HvVXPVOV94WrZ6j+pGH1n4MA262HKMZfq9KGgKX5xZOWy7XGi5CJFWsYPnN/DM6UpGbOefX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6214
X-Proofpoint-GUID: uaOVEBOLnQBv-E38sVLShQUIE5N0oxuj
X-Proofpoint-ORIG-GUID: B4ZICAeQr0zFSKQwn6BINaCRVxTFpqvH
X-Authority-Analysis: v=2.4 cv=D4W9KuRj c=1 sm=1 tr=0 ts=67ca92ff cx=c_pps a=r1LLKbupV3Dgd2n8fS09vg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8 a=9x7dPHVGYbXPTkd1KSMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-07_02,2025-03-06_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503070045
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5275jGhf003728
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Mar 2025 06:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115779



On 3/7/25 14:30, Martin Jansa wrote:
> On Mon, Mar 3, 2025 at 8:27=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wr=
ote:
>>
>>
>>
>> On Mon, Mar 3, 2025 at 11:16=E2=80=AFAM Martin Jansa via lists.openemb=
edded.org <martin.jansa=3Dgmail.com@lists.openembedded.org> wrote:
>>>
>>> * hardcoding:
>>>    ${WORKDIR}/recipe-sysroot-native${libdir}
>>>    is just wrong when there is a better variable
>>>
>>> * This path won't be correct for multilib builds where target ${libdi=
r}
>>>    might be e.g. /usr/lib32 while native libdir is /usr/lib.
>>>
>>> * use STAGING_LIBDIR_NATIVE variable which uses correct ${libdir_nati=
ve}
>>>
>>> * fixes:
>>>    error: failed to run custom build command for `devicemapper-sys v0=
.3.0`
>>>
>>>    Caused by:
>>>      process didn't exit successfully: `lib32-thin-provisioning-tools=
/1.1.0/build/target/release/build/devicemapper-sys-88de590bc55acb43/build=
-script-build` (exit status: 101)
>>>      --- stderr
>>>      thread 'main' panicked at lib32-thin-provisioning-tools/1.1.0/so=
urces-unpack/cargo_home/bitbake/bindgen-0.69.4/lib.rs:622:31:
>>>      Unable to find libclang: "couldn't find any valid shared librari=
es matching: ['libclang.so', 'libclang-*.so', 'libclang.so.*', 'libclang-=
*.so.*'], set the `LIBCLANG_PATH` environment variable to a path where on=
e of these files can be found (invalid: [])"
>>>
>>> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>>> ---
>>>   .../thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb    | 2=
 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-=
provisioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/dynamic-lay=
ers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning=
-tools_1.1.0.bb
>>> index d0241c7016..1981a35934 100644
>>> --- a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisi=
oning-tools/thin-provisioning-tools_1.1.0.bb
>>> +++ b/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisi=
oning-tools/thin-provisioning-tools_1.1.0.bb
>>> @@ -20,7 +20,7 @@ inherit pkgconfig
>>>
>>>   DEPENDS +=3D "udev libdevmapper libdevmapper-native clang-native"
>>>
>>> -export LIBCLANG_PATH =3D "${WORKDIR}/recipe-sysroot-native${libdir}"
>>> +export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}"
>>
>>
>> Ah yes I had a hunch it will fail some usecases that=E2=80=99s for pat=
ch
>=20
> Is there a reason why this change wasn't included in your master-next
> branch yet?
>=20
> Robert confirmed it in the other thread.

Yes, and I can confirm that it can fix the errors you mentioned above.

// Robert


