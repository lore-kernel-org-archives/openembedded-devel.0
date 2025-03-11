Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2549C282EC
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 14:45:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10854.1741704305398013369
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 07:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5165a5991f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BAwH6K016613
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 14:45:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458b413jmt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 14:45:04 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52BEj4nx026574;
	Tue, 11 Mar 2025 14:45:04 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458b413jms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 14:45:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g66L2oYpilSI48ZdUzyS31iRZwe2ecDglGdXztsAQTxDAUzne7sAFwF19pDeCslZ10e4gPg0Ovy2flV9i9Rf4uueklfsT6BUSfcflPzl4Ny5RjF1u0B8ozFeQqoVpD5hZPEXtrGETw7KaORkED/6MOJcGnikzd1tZrv47w1ivvVV8Y7KAZtIRMNvVSrR3ty/Sc/PoNykGFb/cYOPyA2qBFWqlUvToh24xEUbilFL15fUXCoMRIVDShKa9Xc0BM4iOhY82LUezeGKtRjOjE6vTXBI1ViOZcM7VUv0VqNgPHPuRd1ra5AKXh1JpnGNmoJkOaNE89OXku9oVjUgAoiFHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7noiaP67LPkQQytY2Iv6BwBqyzBSKhgzvgPG38gHfDs=;
 b=Fg/aR49uR6SPeC7RHKRhVQp7/imbsqfLUiL7MmQ/yDirqj0PufyFBAiymT4o0lbFrUhgXHHuW5IvSeIT3RIl3Pvn9anmN61jftND02DXmQhIy0ulpIKdgDYcISQedMn055IAGpm5mVJqVbhR1GsEPkgzY3Xp78vP/dxRmm27fjI4hrMWj7pZCjYWlVUzzMk18QPyFfD566DoQjzYGpWbjIl7qix6QpPRzKZPdvwXGZeQ8kdAIkEVcJ23AzgunmYbQ5ZhDXw9vw5AOnEFrc6cIQMVYMD7v3PerS69piam8CGzICcNTsOZL8sneoTT8GYE4ioQyZOaNaLCGRcNKjtqzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ0PR11MB6719.namprd11.prod.outlook.com (2603:10b6:a03:478::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 14:44:59 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 14:44:59 +0000
Message-ID: <364f0756-e3ce-491e-aceb-84974ad8d58d@windriver.com>
Date: Tue, 11 Mar 2025 22:44:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] hiredis: remove runtime dependency on redis
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20250311070202.229491-1-yi.zhao@windriver.com>
 <36ed2d0e-fe5f-4705-84b8-43b1155f42e6@gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <36ed2d0e-fe5f-4705-84b8-43b1155f42e6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0020.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ0PR11MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: 956f8e39-f44c-4eab-b793-08dd60ab4ba3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dzlrN3Q1bkl5U3VBYzlRVU1WWndqU0VaQTgrVkh1ekFsdjBPVkMwMG9rcXpJ?=
 =?utf-8?B?MDlYdmdjV21Eb2U5NURJaWo4NHZ3RXVTZG5ZaFdueHVRVWgyR3dHL25mUTln?=
 =?utf-8?B?RWJHb1VIMG9TNjFTeit4VDZYNzlxanpaVGtxak44dmpvYWhKVXhLUkhpY242?=
 =?utf-8?B?a0dOaEFPQUpLbVhHNC8xNy9nSldNRytsd1grUmFXbVZSSnJYQlcvZVg5Vm9B?=
 =?utf-8?B?WTdJRDdSQlhIcTVVVDZFc1RTWlBNandEbGFVSFdRMVVGVkg0SnV0bEJVQzNS?=
 =?utf-8?B?RWE2ZVdOVXp0YmRkTHBNY2MyZXJhQXZsWTlja3VZQ2szWEdxZml2TXg1TFV4?=
 =?utf-8?B?Ylo4ZThoUkZIUmJjcmFaTGFBUjhIenE2NlBlVDU2aHhnaTJnd2ZEdFA5eWVH?=
 =?utf-8?B?YW9Uc1U3dTdnZ3J2dkErbnhBWFBKaHF4R3BFUTluR1pTMzQxOUlMS1d4SjVM?=
 =?utf-8?B?d0g2VTl1dll4cnNlYm53UnBEWjcxYUhDVXNTd0g1cmFIY3ZlZTRLaStkUDNG?=
 =?utf-8?B?WjNSbjljNFBvaldDYkZva1c0eWhyM3A2UlBpVGNzSFVjRTFDT21iV3NDMmxh?=
 =?utf-8?B?RHVheWx3L2hXRDMvQnpDd1FYek5Fd0ZzS3Y4MnFYaU1QNmZjMWhad2NDWlI3?=
 =?utf-8?B?MS9HVUpGZytGblJDMDRYVytNM2ZMcnQwUGl5eVBoMHZ0UmhHNlMyRXU3Q0Zw?=
 =?utf-8?B?MzRyUyt5MWpiTWd1M2pXYm5PcVNiSnZzTCsvRXlKeFI3aDlIVk1lS0dGVmRt?=
 =?utf-8?B?K01VRVFqaHh1SWVNVEJ3WXNUZmVLREpZb0pXVGRUWjllMklqT2E0dDltUHM1?=
 =?utf-8?B?bmVISUFVYlFROEJrM0x2TExqQVVUU1AzTWdianZUWHBjZjFHTTZlYnJLUEpG?=
 =?utf-8?B?QTlmQjN4RTAvZm5CTW5RbitzY3pRbHVVaVRCRUtMYjNheDZxajFIU1FOazR3?=
 =?utf-8?B?ek9DYXZMcnA3RUN5eTQ2R2l6ekZVR2tsaUFSdEhKMjFCUDRvaXI1L3F3YzFn?=
 =?utf-8?B?N1JlMml5bmRhOTBIMTJjVDJMajFOdzNUQXE1OEwzbFo5RnRaejJ3TlcrZ09G?=
 =?utf-8?B?RHZPeHcxQjZoUytDUS9pWHdkOFBjNjQ2V1R3c21xWElXejJFYTlkNitvQm42?=
 =?utf-8?B?RlJvSjFiVnRZQUE0KzlGaWFvcHZDeUpSRkxraGFTeWpaNE9wYVRvS01Mdk5Y?=
 =?utf-8?B?ZlhjRXNWSmVWN1c5YitUSW0yc3ZqUHZ5MVdUdmJ2c1M2SW5jSWVPZ3hTSDhv?=
 =?utf-8?B?WVdpcEFKdncweHVoVXdWc2w2OGZrMVhWb0RDcUhUZEZCb1p6Ym9aTDcxVlBj?=
 =?utf-8?B?NWZnUFZGd0lKY0M1VGl2NWtwMUJicDhBUVF3bGZKNUc0YkZhakRxTnFxSStk?=
 =?utf-8?B?UmlScUpzU2FkWE1TOXVNb0toVlVmeXg3R1NyeEl0RGhIYnVjZWIzRHdWcXNM?=
 =?utf-8?B?b2RYcHFKVXd0U1VYMmNadjFnVXdsOFZNRHZiOXY2UTZyT3ZiZXNkT3ZoUGtz?=
 =?utf-8?B?K1piWUZLZ1Z2RmlxTzFURFkzK0V1akxTdk11TGhrS2VFZlROc3VoT1Fvbmhj?=
 =?utf-8?B?OStOL2FORkthdVo1OTIxUWE5UHl2dndIQmxaU3dpNWNGQTVYOHdvbGFFK2hp?=
 =?utf-8?B?dEF1Mk85NXE3ZjBIdHVXcnMwSUVoWmN3Q21ramRYNnJXS3Z5TEtIcWdsY2lH?=
 =?utf-8?B?WUh3NGlrWmZrOW9LN2FvOUtsMnlRbkwrekhmQThJUzV3clJoQ2N4ZldtalRx?=
 =?utf-8?B?eFl1NThoWlppSElLdmM5ckhLYW9EaW1MVEZSRVNwYUE3cTFucXlYYTRXeEcx?=
 =?utf-8?B?Qmc5cm16RFhKU05tbVZlNWtwWjNYNlJzM1Nxb29qMlJwd0U2STh6YVh4Y2Q0?=
 =?utf-8?Q?gQ4jZ/w0FWf5W?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZC95OXB5WjhyVTBYTDRlclpkK1JsYmlqUkc5N1hUejN0RDZORnA1SDA0L2gx?=
 =?utf-8?B?c3FBeXV0STRIaVBXRjBzVkczUFRTWkRvOWpFNWpoTzFVMFZNSGxxOEpLNk14?=
 =?utf-8?B?WTFxaVdYSitDcmJ0dkF3ZkNHaXdLaVpFdnVheGlxemk1UzJDMlBNcE5QTlUw?=
 =?utf-8?B?VjBpSkEwUkpJd1R3QUZaZmQ2TGhrYTNuK1JxcDR1VkJOTGdUNEk0QjBiSHdx?=
 =?utf-8?B?THFjTXBrZW5HWmxiNCt5d1BoelZZd3FsL2s2RnloU0tkNzRMM1BxcGZSZERr?=
 =?utf-8?B?aGh0c0gvUElHOVo1LzJMOFRzdXdtUnpLeWZRWHY0YXZ3NUVOTGRuWUhxcnlu?=
 =?utf-8?B?QkF3K2kxb1JZbW94RkZ0NDlNaWl2SkIxc1VnV1NDRDVwWlRKNDdxZFBuKzh5?=
 =?utf-8?B?VUZPaDliSStyM093eENQSmc4TW5IQ0ZOaFd0ZGlyMDV1SlFKcFN6RG9oSzc2?=
 =?utf-8?B?TkNXdGhWM1U3ZXBIRzlaR2VVOWk4NWdWU3lhUG5SZncreWlLWDRvdWd2T0RW?=
 =?utf-8?B?RFV3SmQ5OWpaeVRMcWlJNWtQT0lFWVJ6aGh5aDlXWWRvUHI0V1NXK2RtOWhw?=
 =?utf-8?B?Tys3QkwzaUNwN1l3RTJENVg1dFVLY0hzVGRRakFOcVFCUG9EdjdJVDFJS05H?=
 =?utf-8?B?RjdGN3VWMC9JMDFMNFNtZWxYMHpZMG9LbTAxT2dHSW1PWUt0VnZHNU81SUc2?=
 =?utf-8?B?Zk1rT0FSM1pGc0dtazFkdnFOd054d3o4bVdSWjN5dFBtR0hnMmtrb2h0Y1BM?=
 =?utf-8?B?aHMyMytodUNiczE0MjVIdDFDTjY0Sk9adXBVL0lEYVBSZUo5U3pRd3BaR1ht?=
 =?utf-8?B?T3p6MFNHUEZudk5IQndaWDdUQUNzSzhJdExhSmF2U1o0TCtrZngrTnA1d1pj?=
 =?utf-8?B?WlV4eGFaOEJSdDRXM1pvQ21ienFGZGR6enR6bnJwdlBubGg4dXFQZmNkY0ly?=
 =?utf-8?B?Y0VEYnBtaWZ5TzFqc0s2R2xRemRFaXVBWTNSS3JadHlQVjNIVnE0RWxuTmRH?=
 =?utf-8?B?VllZVlg1RjBHdTJLTnlxRnR6akZkek5zOVdlaDBjcURHZEpnMFB0dlA1VFNm?=
 =?utf-8?B?dnBHMmUwUTZVYzZibWN6YlJ2cEw3SzRRb3NsZkNFN0xxd3dRVWtmaXdOM0xm?=
 =?utf-8?B?cnY1VjNSM1RTTVZYb1JLVjVNRzd2RUsrV0dWN081OC9FTVRXTlRUQUkrNVlt?=
 =?utf-8?B?RzZ6ZC9Rb2NxNWlyOGVkRmRsS3F2Nm1mSDVCeVg1U0xocG40dWNjSFNrTEJ5?=
 =?utf-8?B?MlEzYjZnVFk5MVllVmg0amRLVmRQd1BDVHIrNS9oZlhZNm9RRDFsZmFmOENP?=
 =?utf-8?B?M2RZbVBlMi8zZ2hEeGF3Mkxmb0dMVWJZWUxtM2cyS1NzbWdoUzJFTFNUc1Yr?=
 =?utf-8?B?N3AzK0NJOEQ4eDBoeStnNXNtQWtMRFcvc1BjQ2t4TU1yWjIxU1AvK29tc2Rt?=
 =?utf-8?B?Y0Z4RmJ4NFZWa2FuWjNBTDRhMmFXRXo3S3pPVWxQRTFiSFJvcERlZXdFeGNr?=
 =?utf-8?B?UXBpdGdGT29kVUtaRldpQnVETzVldDZZYWlOeGIxcThwck1RcjdkM1lJVGIy?=
 =?utf-8?B?VkNyN0NuWjZvMC83ZC9pS3RhSXNoK0pqVmloRDlBQmw4N21CSk1KZXRTaXpi?=
 =?utf-8?B?TnMxVWFEdVpZRk5rbmI3enptZ3BoaVhCbDRqaWQ4U2tidnVrUzI2OGVHajk1?=
 =?utf-8?B?RFVhNDkzd1lsUGpvQk9wMkZnSXdQYmYwcFF6eW0vWEt2TEhlRnNQZDFaSjdR?=
 =?utf-8?B?UEt5b0tTK1NBNFBHZVY3UDBOTDdwOUM3Y3B2ZnFUMFRzOWp2aVVmU0VxR2lZ?=
 =?utf-8?B?WnRENDBuYVFWQ0xOenYxdnFPdnd1S2M5RnpsMEVXUEZNa2NxRi9PWk9pZVNS?=
 =?utf-8?B?RVoyQnVhNlplbUhHb0ZpM0RUckhTZE9iSFJ5NDYxMENWY1RPQjNEbUg3eTBQ?=
 =?utf-8?B?L1lPSlJubEpFelJ2cFlSTkZyM3NIOFVTNmxmZGZzbEpubFRvT0k2aUx1VE9n?=
 =?utf-8?B?MzhBMTRYTlpRQTlEV1EvYUd4aUVOTXFQV1ZkSG15eTIrcm1IdVh1cmRPOUo0?=
 =?utf-8?B?ZTBVNk92YnlvYWhqcEI1RGwzckdQbGpCSDRiYXdPYmhoQ0doa2FwYkNrRWhn?=
 =?utf-8?Q?W2Qc8FQ4do5u3+54a+eU44Gwk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 956f8e39-f44c-4eab-b793-08dd60ab4ba3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 14:44:58.9249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5FwtohtrTjrgWxmcS4lqZm75F1uN/2W9syzxOEPxQTYEcNt5ZqPvrGQslZRaRbhGiDEnfHIxVdZzBHdC9W4G8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6719
X-Authority-Analysis: v=2.4 cv=JYNGrVKV c=1 sm=1 tr=0 ts=67d04c70 cx=c_pps a=vIBLTX18KUGM0ea88UIWow==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=A3lBjrIoiyFqjs0StIcA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 5taOp036u7o2W8_pY3mUMUGAIiffOpKx
X-Proofpoint-GUID: WFOgkv6zwiM49jKZnWca5pGlJuXyESr5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503110093
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 14:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115891


On 3/11/25 16:48, Gyorgy Sarvari wrote:
> On 11.03.25 08:02, Yi Zhao via lists.openembedded.org wrote:
>> Now hiredis can be used not only with Redis, but also with Valkey, an
>> open source key/value datastore that is fully compatible with Redis. As
>> Redis changed its license, many users have switched to Valkey. Therefore
>> remove this specified runtime dependency.
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb b/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
>> index d081242736..93273919e5 100644
>> --- a/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
>> +++ b/meta-oe/recipes-extended/hiredis/hiredis_1.2.0.bb
>> @@ -35,5 +35,4 @@ do_install_ptest() {
>>   
>>   FILES:${PN}-dev += "${datadir}/hiredis_ssl ${prefix}/build"
>>   
>> -RDEPENDS:${PN} = "redis"
>>   RDEPENDS:${PN}-ptest = "${@bb.utils.contains('PACKAGECONFIG', 'testssl', 'openssl-bin', '', d)}"
> It still depends on either valkey or redis at runtime, is it not?
> If yes, wouldn't it be better to set something like 'RPROVIDES =
> "virtual-redis"' (or something like that) in both valkey and redis
> recipes, and set that as RDEPENDS here?


Thanks. I will send V2.


//Yi



