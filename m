Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25EC1C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 09:34:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.32916.1741772087515617684
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 02:34:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=516657e3b4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C6mkRh005810
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 09:34:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0emrcqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 09:34:46 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52C9XPo1020018
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 09:34:46 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0emrcqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Mar 2025 09:34:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4IShodwzba8JfzcimC13U04hSk6dbNMfH1Fz1WpdbnnSFqXXMQqVAPv/ueUWC/3ujcATe7bvHiHtJk3ajrJGF0bp09ljCgCyeE5+Uy44mIfZTABydRkszOSakXsREPKSay7di7edHjViXL4iXQz/9cP45VrGzqe4mEmSNZUuiAdOwyNckr2y2+dl5YLAyBe2fx1ZwvQeJFCZICuX/lAZzJjCqFdTvTZTCNkJB+QRgo6gsm9vvxISwOoWfjh4G0IN+Ffmg8m6jqQh07EmVrJicLPFdJstIa3HpjgmI35kblonocpU4DejUz1gHujQG7NbFW25ZDhqSjmzJ1OI2cppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0a4Sag8dXV4pE0xhRNAHfcX5jolQ5hdzWUGQmn8Dj0=;
 b=GNp3cHL+hQQktFmVd7s5MKDoR6j3QbDDKmZ14WYiM3XhbSPwIuPlNui1EBQQghg8U1Hc1bNFMR37leP75Y2ZImxvltn7/SMEJ0C6iOjgcf/qTN0OTaQ8faUCmwEK0gS0PNzWjZyH1sLzybfbrLb5kt9vmJnGIgeQk5k5D7skqYsS5gCVtciugClPInmsb5b7zHo0Ej9f+aulDmD1NXXKYOIkh+uyKcZHqp0HZsZ20IotXdbQot89OaXF9mgH+8hYy2HIf/RLMfNMddHmG6tm4PoHm4mN+lHaseOw0j7Goz+DcPupHCpWa6prHndQsbp6D4ovq1OEBjDmdzUTzDqNdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by CY8PR11MB7363.namprd11.prod.outlook.com (2603:10b6:930:86::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 09:34:43 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 09:34:42 +0000
Message-ID: <61f87478-1135-4cca-bac3-3ec8709e9e6a@windriver.com>
Date: Wed, 12 Mar 2025 17:34:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] minizip: Add new recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: mingli.yu@eng.windriver.com, openembedded-devel@lists.openembedded.org
References: <20250312033439.2958141-1-mingli.yu@eng.windriver.com>
 <CAMKF1srf3Gs+TesLXd=oC-pL95SQq5-UBP5HREWcmaicM1N3=Q@mail.gmail.com>
 <95e9c398-375c-4862-8c76-5122424c853e@windriver.com>
 <CAMKF1sp-ME40FKm+eMBhkvNhHY_FZWyiVQtdSuMnthp_Cv8=Gg@mail.gmail.com>
Content-Language: en-US
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CAMKF1sp-ME40FKm+eMBhkvNhHY_FZWyiVQtdSuMnthp_Cv8=Gg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYWP286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::18) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|CY8PR11MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: cb1a51f2-2a87-401e-39d8-08dd61491dec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|4022899009|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bURNWXB1K0kwQmNHT0pxTURDdmVDMTZuOFBINkhLejNSWkN1RVFSUUlTWlBR?=
 =?utf-8?B?bmFTVG0yVDkrSVI5R1FoVjdiNnpVRzF1dWhVMWgydDlGWWQzZnJEZkxiT1Vu?=
 =?utf-8?B?elpLWklzQzNZZCtHYmlrS25QQWpMUStmL2dJNlVjeEtMU29YZGN2UmVXRmw4?=
 =?utf-8?B?ZFI3MGg0YmEvcEg1SlZpK0UrRXRDVlN4RmdWZWozVlVkbmdMNHZYMlpEMkVn?=
 =?utf-8?B?RDRPaEI2UEljRHd6OUVvNFpHWkVLeUVHU0JyQ1NDaExtL0ZjdXIrSUN1MzRS?=
 =?utf-8?B?NHhIR0JSV282WnZDWkxWK3R1OEpsSWM3emJIRVFpMmVMQmRENmFDZkdGSkpt?=
 =?utf-8?B?TXl2QUdqWHlIdHRFVk93R2puZU1GaXNjV2pxNEt2bW5HbC9YSitPVFpGUmJU?=
 =?utf-8?B?WnhhWUtWc21rdy9naWpESE9VZ1Vnc0theW1ZaXdLa2tlSlRDYjlGUnI5bFdi?=
 =?utf-8?B?SzVWYjNjb2V4QTFYYU5Ya2c0ZWMzcXpYYmo4bFBwWVQ1ZTMvMi9aczJPZ2Zz?=
 =?utf-8?B?WmhnNEg5K1NIT1ZDM29lWTNJdjNmZkNqSEhLWVk0NzdQOExZSktUelhUbURR?=
 =?utf-8?B?cjhHQ1hyUDhxVDRyWHRDWnh1OUdzUGZQNG5JWW5Ha0c5VStoT3lHRTMwbHlG?=
 =?utf-8?B?Z1dFenZVMGhxazQvRjM5Zyt5L1gxbHh2KzRMYWlxUHBsMUJ1QzdNRnZmbm1T?=
 =?utf-8?B?WHZObUNGT3dQbHk4dTcxelM2a0U3ZldXbCtvY3NoWkwzS2hTOEdZeEF4K1VX?=
 =?utf-8?B?N1c5R3B6ZkZPUkM5SFJUMDdLbEFkdVRrdWxoRmFPUHNPTExDSFlEUFFuV2Z6?=
 =?utf-8?B?UUxUdVBVLzRTTUFXSTE0anM0OWs4L0tzYSt2RFNPTXZ1K0YwMngzMlJ4SitI?=
 =?utf-8?B?WEJYUW4weWJWakhPRlJrWVVKR0FTMHUvU0ZqWXZxSmF1TVF0cHNuMmVsK2Ra?=
 =?utf-8?B?Vlh5K21teEpneFlrcGhSNUtZYVcwM044dFNVN3J4OE5rZGV1dGZtV0YzcGJM?=
 =?utf-8?B?d1VyeXR1SU0xKytnYmY0emczMVJRUmI3QXFQb3RUc3MwYkg2cnlnMVJXMTl5?=
 =?utf-8?B?MjVTWGNtNFBUTzFCWlliL1N0OXdCT3pFTEllMExHeWxUTlNvMXk5VDRZdlNx?=
 =?utf-8?B?VzZOcXYvdlAwamRWTExxVlBZNjlZcmxhM0FCK21vdmNXelNIUmo4dEFPL01V?=
 =?utf-8?B?WWNFTWdWaVhWdHhrbmlxTzhTay90dEMzeTd4L0hUY25ITWg2V1N3bm5KaWFo?=
 =?utf-8?B?MTRXSXJHWkpDVjB1Sk1BR0JROW12UEhaRVFMQWFubUhPZDFXbEVxUVFlOTFL?=
 =?utf-8?B?VXhyUStWM2FoM2xva29zT1FZM2k1RmlPQUs1V0hiUUcrMklvazcrelFqN3Nu?=
 =?utf-8?B?UVlCN1FpaU40MzZEdGN3WlA3QlQxSTc2NzFJQkdPa2NpUmRtN0hpcUg1Yy9O?=
 =?utf-8?B?V1lzci9lVVczRlBJZDM2dnpaM20xQXJUVlRndCtFK24vRFgzZWZ3bkxRSzdU?=
 =?utf-8?B?KzdqRGliK3EydjA3WnluUHduQ0xRdE9PcCtoN2pWV1Y1c2M3SExFVnZTYWVO?=
 =?utf-8?B?YUNqaksrdWl3TXMxbHlXR0x2amthQmxrS2xZZnYyeW85cCtTbEx2ZmtxYVRu?=
 =?utf-8?B?Rk1Xc3UwTm9ndllOSkJyWWQrWGZqdWZEbkRab0xhWFNVclJnNnJLdkoxelB4?=
 =?utf-8?B?SmN5R0NtbUZncmN6VmIydkx5SlVNMVJmMDM1eUNRT1QyK2dPVlNBaE5icFQ3?=
 =?utf-8?B?UUdOSm1FZFIxZGJOOWlVSkRGRHg5djhBUitZZnNmRkZ4aFEzRXlMNFg1VzRK?=
 =?utf-8?B?MWt0MWtrZVZSM2NucU5IQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VGx1dVlmQW8zc3lPckphRk01UktnN09jcWc1S2pZVm9wdlJvZXBtRDN0TFFJ?=
 =?utf-8?B?VnpoOEpsL20zR01ldDlvbmlhSHpCQnltUjZxSy9RRzN6dFRwbG93QkxYNTFP?=
 =?utf-8?B?a0ZYMnAwcWhkcmZlNk1ndnprYzlSQitUM3B6UWphQU5PK3hPWkh1UWE0Z29o?=
 =?utf-8?B?YmZpU1p6QlJ5UXBvYjIya0NqTmZoc3lMSDd6Nm9ocjBwYlJuWCtveHovOWlG?=
 =?utf-8?B?KzhWckRydUw5YzR4eW0xZDU2dW1KTXNqQ1Q3U1ZLRVpIT05qK3dNYlZiQkh5?=
 =?utf-8?B?UGZ1a1doU3N1Q1FxOWNYRjBIQTMzcVZwSnhtL3lWWWIrbi80NXViZGdYZDJH?=
 =?utf-8?B?MmZTOEp3bGtFZWdEL2lqU1RkaWRIN3o2NVF4SmdpZ1pvVURlZWVPWk1nTVpp?=
 =?utf-8?B?L2haMy9QWTA3c08wUXloVmFqN2FUQy80RWIxY01jZy8xMGJabU5idklIYlBk?=
 =?utf-8?B?dC93M2Jlb05LQXN5MDVjMGUxbWFmMi8rRnhrZnVPN2ppVzlqcEMwWld1SitQ?=
 =?utf-8?B?dkViSVQ4ZDV6dXVEQXFIclFqQTNCVWJyMHNENFJHajBCR0R6S1VvMTRmSXFy?=
 =?utf-8?B?bHB3d3FQQldFdW1WT2Q0TVpRZmtMMXJXMXV0enFSeDZDSGtSVy9vRi9ieFF2?=
 =?utf-8?B?N3lMVm5OT25HbVc2YkU2dnBwcVBEMkZaeUY2RlFjdkQ4YUJSaHpEdVQxR2lF?=
 =?utf-8?B?RWdWK1BiTFVFOHBFQWxnUjg0OUduYlpLTGlBeUtSZXpEcDNUZGdCZ3RJTFUv?=
 =?utf-8?B?N0MzWmNIeUdzaE92djZud0E3SlZaSTFoZFlmUDhoSGNaM2pNTXBPM3N6bUFV?=
 =?utf-8?B?TG14Z0o1UEtsYm8rMXRxMDBxcHR2bnNpSWdHbHhmamUvdDBHdVZWNDFTMGNi?=
 =?utf-8?B?WGZuYjJKemtLa09XaUg4dVFBNTNuOXlvcGdlWHBtVHpIUWRraDJrQWJ0ZTlE?=
 =?utf-8?B?TndNNnZGWDBwTXNOV0plVU9FWXRoUXYzMUNFdU5ibzZ5eitwTk1JRHM3UmU5?=
 =?utf-8?B?aXEvRzRRUm1Fc21sK1lXa01rUk93RWFPcEZYejM3Vll2UU5xakVGYkloVzN0?=
 =?utf-8?B?MFNyRW82K2FIQTJJdmFXSE5vTytOeS9nbmdHM1hzVVRKOHZSNEdYT3ExUUJ4?=
 =?utf-8?B?YXUyUVBmc3RVUFVSQ0F5RzgvaHFTMEMzcnBLanVuSWs2Y1crdTVWalpjY003?=
 =?utf-8?B?dkdyWWlxd2ZFcVFzcXZwUDhtZlgvbS9NalZ3djBqanNaL0M4bVd0VG1aaTg5?=
 =?utf-8?B?SXB5MjExdnNIYWVHUGYyVHpQRXQrNVFMVVRmd2hjempCZFRtQlhzYUpQbi83?=
 =?utf-8?B?djU2SUMyZlFGSXMxR2JHd0FMNXZlZTRqUXpkQjNXR0txeWdwdEd3RE5PZSt6?=
 =?utf-8?B?anErdlhjanNxNVRIR1l4ZUwrVmtoZGx6dGplVUhkMUMwb2JhMXdtdUpyUjlK?=
 =?utf-8?B?UmlPUHk4N1NJUm9qYlhSUDB5cDdMWWl5MUdSTzI5YUZqOGo0WWIwNjZiZFRo?=
 =?utf-8?B?THhOS3BOb1VrVGNyV2JDaFUxN0VrZGd2d0xhVU1TR0RLTXdDN3RoTUp5RldN?=
 =?utf-8?B?bi9KUFIxUUFYYUFycVBkdXFrQ1RwUnZEY24rMExKK3pxK05sMkZzKzlyeEhL?=
 =?utf-8?B?VFNmRC9sQlpuRkVJOU9GRGZEaUw4aGhveUtCcnJuWmlqWE1nSHB6QWlvYUI1?=
 =?utf-8?B?Szg2SmZxeno3YTdKVklYN2hVY0dWMjJkbUhPdVR4NlFEd21qdDRoTG5KeC8w?=
 =?utf-8?B?aFlZeGxyTjFGMkt0eEtSN0s3bFFhSmlZVW5qcnp5K3JtaXV1ZEZQblc0VFJG?=
 =?utf-8?B?VEhCQ2dMcEN4NUlXQkF3a29oT2thdTYwOU5YV25VVzRPdmovOXprVW50SHpu?=
 =?utf-8?B?a1d0eUdTZHVDVkNVSWovbWI3NFB4UnBiSTkwSC9IdTE0MWYxdW1vNVB0OEZU?=
 =?utf-8?B?c0N0QkxDanRPU2JUWnk3dWNMOXAyZVhOcWU1WDluOEFQN1FvN2QxVjQvOTY5?=
 =?utf-8?B?aVdNVXdWUEdaUEFpVGI0MU8vSFZ3SkFIODRtajh4K2VEQzJobHJxZWR3VTZQ?=
 =?utf-8?B?N1NBYmY4VHZKSUF1QXNBb0k3NnVYcmV3c2hBRkI1MFFNZ3BkQkhpbmtOMjdz?=
 =?utf-8?B?Z3BrYVA2TTdYWC9HcVVEcnJHVlVWSDdqUVBGYktDeURVQTF4VENtY3Y0MmFG?=
 =?utf-8?B?b1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1a51f2-2a87-401e-39d8-08dd61491dec
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 09:34:42.7633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyBoCcyuMJGJ7lkeKPrRjvRmQ1NvUrX1VOfwmyY0osTLTyUyOw3izyUr4BP1Cs8qwsqW0krM3dliw6pwhAB3Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7363
X-Authority-Analysis: v=2.4 cv=J6Gq7BnS c=1 sm=1 tr=0 ts=67d15536 cx=c_pps a=coA4Samo6CBVwaisclppwQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=WNDY76dxAAAA:8 a=NEAV23lmAAAA:8 a=mdjDh3HbAAAA:8 a=fXms6y0vAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=mwO54qhJNwA5I9JmQoUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=hjw_Cx-fSxMA:10 a=HFDSX3BADwN2sFIQuyTb:22
 a=oWgShKPB4MB-ORB2x0Yq:22 a=c6Zb8eaUoX5VaqycxFvw:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: rrJVnH0kB_9kbFihaoL0VpoauFx4ehxK
X-Proofpoint-ORIG-GUID: hKICevmIohtSP5UaU5ktzHFhXONL9nkS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503120065
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 52C6mkRh005810
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 09:34:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115918



On 3/12/25 15:13, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>=20
> On Tue, Mar 11, 2025 at 10:37=E2=80=AFPM Yu, Mingli <mingli.yu@windrive=
r.com> wrote:
>>
>> Hi Khem,
>>
>> On 3/12/25 11:45, Khem Raj wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> its in meta-qt6, why do we want to promote it here into meta-oe ?
>>
>> Sorry for the noise!
>>
>> Adding the minizip recipe to a common layer such as meta-openembedded
>> may be convenient for user who don't want to depend on other layer suc=
h
>> as meta-qt6(https://code.qt.io/cgit/yocto/meta-qt6.git/).
>=20
> Are there use cases where more than meta-qt6 needs it ?
> that's what I am looking for

The request comes from one of our customer and it's convenient to use=20
this recipe if it's in a common layer rather than depends on meta-qt6.

Thanks,
Mingli

>=20
>>
>> Thanks,
>> Mingli
>>
>>>
>>> On Tue, Mar 11, 2025 at 8:34=E2=80=AFPM Yu, Mingli via lists.openembe=
dded.org
>>> <mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
>>>>
>>>> From: Mingli Yu <mingli.yu@windriver.com>
>>>>
>>>> minizip [1] uses zlib [2] to support compressed archives.
>>>>
>>>> minizip is not part of zlib, but is included in the zlib
>>>> distribution [1] as a third-party contribution in the contrib
>>>> directory.
>>>>
>>>> [1] https://github.com/madler/zlib/tree/master/contrib/minizip
>>>> [2] https://github.com/madler/zlib/tree/master
>>>>
>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>>>> ---
>>>>    meta-oe/recipes-core/minizip/minizip_1.3.1.bb | 23 ++++++++++++++=
+++++
>>>>    1 file changed, 23 insertions(+)
>>>>    create mode 100644 meta-oe/recipes-core/minizip/minizip_1.3.1.bb
>>>>
>>>> diff --git a/meta-oe/recipes-core/minizip/minizip_1.3.1.bb b/meta-oe=
/recipes-core/minizip/minizip_1.3.1.bb
>>>> new file mode 100644
>>>> index 0000000000..c9c92ad6bd
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-core/minizip/minizip_1.3.1.bb
>>>> @@ -0,0 +1,23 @@
>>>> +SUMMARY =3D "Minizip Compression Library"
>>>> +DESCRIPTION =3D "Minizip is a general-purpose, patent-free, lossles=
s data compression \
>>>> +library which is used by many different programs."
>>>> +HOMEPAGE =3D "http://www.winimage.com/zLibDll/minizip.html"
>>>> +SECTION =3D "libs"
>>>> +LICENSE =3D "Zlib"
>>>> +LIC_FILES_CHKSUM =3D "file://zip.h;beginline=3D14;endline=3D30;md5=3D=
8eaa8535a3a1a2296b303f40f75385e7"
>>>> +
>>>> +SRC_URI =3D "${SOURCEFORGE_MIRROR}/libpng/zlib/${PV}/zlib-${PV}.tar=
.gz"
>>>> +UPSTREAM_CHECK_URI =3D "http://zlib.net/"
>>>> +
>>>> +S =3D "${WORKDIR}/zlib-${PV}/contrib/minizip"
>>>> +
>>>> +SRC_URI[sha256sum] =3D "9a93b2b7dfdac77ceba5a558a580e74667dd6fede45=
85b91eefb60f03b72df23"
>>>> +
>>>> +PACKAGECONFIG ??=3D "demos"
>>>> +PACKAGECONFIG[demos] =3D "--enable-demos=3Dyes,,,"
>>>> +
>>>> +DEPENDS =3D "zlib"
>>>> +
>>>> +inherit autotools
>>>> +
>>>> +BBCLASSEXTEND =3D "native nativesdk"
>>>> --
>>>> 2.34.1
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#115908): https://lists.openembedded.org/g/openem=
bedded-devel/message/115908
>>>> Mute This Topic: https://lists.openembedded.org/mt/111654243/1997914
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/uns=
ub [raj.khem@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>

