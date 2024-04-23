Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C74C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 03:28:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10413.1713842886059283369
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 20:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O0g888CY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4843b63244=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43N1p9KV023999
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Apr 2024 03:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=4erDB4gQ8tJTE8acA/u813YtfehQ4hBd8tueFvEtjZ4=; b=
	O0g888CYq3YDIymPVQSw9h2jo13V7i3NQ3BJb5wWDqtQO6hYyPlKncD2SNShq25p
	4G32tOWwXcsih2lJ4jx56ED9l8hHEsyXR5UmJ7MKk+Iy2ITMrEdsJI1dlkv1K1hk
	M5Xp41AIHl9PkgRhN71aZe40r1ASypx6ToXDvSr36ygz8vjiJ6ZnOvTQV3HQWHgU
	lpus1cKgVIwnFICG9/dK9MnpzEveWsQJ0X288PVT+nZNvBbNn65RgMsrjoZWhpzI
	5EGeacoqhHaUYllZxng9tOoSB3JXkins42lugXnDEmz3uDLkE6ld4hhOokT2NVTm
	KnJGyGhjB8tjxwzCGzV/pQ==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2168.outbound.protection.outlook.com [104.47.73.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xm4p7agqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Apr 2024 03:28:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLAVCqu74wHuZscEYhMvXW+8Oc/uCXAVeCKNXBSEtuGDt5bjAI89fAVsP+tWftrKOZrueLp2CHuwOoW5ESZsjWSB0tVuYbgGWe850n8br9rcNCefssjelVLYQj0mDiGpMYU/fwyKf6E10Pn7a3MNk6WRwsANAK9NGXBOiVLBqDxdxpesnI2t1NqEwPGTPeMNbFVk8O9yE93ldDCbpIepyPspmwzDGugbautdXLAsVVPSEcC7YrkTApdFVk3nwVTpmi32uE+/3kCL5p4r/7sg4m4AdxObdX/hsBB6dgKk5ciuwvqkqJpe7XhhFGD3kKs/nwoNjDPt3w7Om5ellTqPhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4erDB4gQ8tJTE8acA/u813YtfehQ4hBd8tueFvEtjZ4=;
 b=OY8BJhhHkMABk5juG6qzxt/7a0JQTLsD7Ja3KZPCbLaPztVZD3YzYK0D+EvW8YOGPFdpMzJosx8QGPiO2f5hdszxa9UzNw4dHymV/T2cbKObCLXCXktXhzMDh7V2fSBRDqDMnOqD+IpEanUeym0iBx4xrvzLywIWksK8oyDXG+krJrWRA/eRg/+p9MSWNYSz2hSKEpdOY+v0OHWaOj4l38rv1rPGBnYJP3/ZKbsfEY6QbLIqLE64HHnr3XVIH6ys3Jno4ZnMUwIx1wPyAE3zkfhXbbat6I11+OjHGqr/ySKw7eYH4pJ1+jwZ68bwTNjmuNKdwSZWmt1qWRTDYsF2+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 03:28:01 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::b674:9f45:8150:6b0]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::b674:9f45:8150:6b0%7]) with mapi id 15.20.7519.020; Tue, 23 Apr 2024
 03:28:00 +0000
Message-ID: <ec2fba36-f001-49d7-b52a-308ca62c3136@windriver.com>
Date: Tue, 23 Apr 2024 11:27:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-webserver][PATCH] apache2: fix multilib files
 confliction
To: Kai Kang <kai.kang@eng.windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <17C8A435646BE571.1215@lists.openembedded.org>
Content-Language: en-US
From: Kai <kai.kang@windriver.com>
In-Reply-To: <17C8A435646BE571.1215@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SE2P216CA0068.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:118::11) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|LV8PR11MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: f11d6338-43ea-4bfc-b7ab-08dc6345608f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?My9FOUhJektGRCtYa2dER3VjZXlaZ0VjS2pIeG81R2JGM2RwU1Yxb0psdXpQ?=
 =?utf-8?B?QkdYQjZlbWd3L1M4TXltSkEySHd4bnh6TVVEd2Y5UFgwRnV2R1ZtNHNGLzdt?=
 =?utf-8?B?eE8zQ2ZwR2ErTFRsMlRJMmtGQWlEUXAxd1hONlRYc3NyNTBabElHZ2VSR3Nj?=
 =?utf-8?B?dDlqcDBCMkNlS2NIbXFCWXN0bUx5UEUrYmhwdGIvL3VnS2JHNVBqRVh3Y1Vs?=
 =?utf-8?B?ZVlURlA3YzVueDhscGc4ekJMakRkNno1Ukt5ajdOZHkvd3ZwaVlpY0NzL3Fu?=
 =?utf-8?B?TklrL0g4ZzRpQUxFcDVXK3BQSE1obWJvbEdOWFNRdXozQzFob3ZESTRNV2tP?=
 =?utf-8?B?WDRQbFJRL0Q1Zy9VaUtCZjkvSWt0SHNuTmlTK0laaEVzcGxRTFR3MndUcGpJ?=
 =?utf-8?B?aU9sdWhEMjRrL1pDbzNQRGZIekZMeElrT2cxdklGWUhnOHRUQU42b2c0THBm?=
 =?utf-8?B?K2NBWDZIMGY1TXp4UThjK0pFR2ZwWEYyZmlQSDZpTlVFenBZZ0tKbS9oT0hs?=
 =?utf-8?B?WW1IczA1dWxkakRWR2xsT29IVlExOFRrWmZsREZIMElqZ2R4SGdUS0tsamd4?=
 =?utf-8?B?NUNEVlZydEs4UDRvVWszRW5xK2I2TFB3V1A1Z0lBV1llQ3pvVVdsVUsxRDBh?=
 =?utf-8?B?WXNhVHordkNqVng5RDNJRUxCTmx4Q3ZaYUpVQ1NQc3JiSHFCVkxaUEY0TVRO?=
 =?utf-8?B?VzQyU01rUkl4cXo5emFlM1RIRzN4WXgzU2c2QUxuUkdXODZ6MHNaTDNTT0oz?=
 =?utf-8?B?eExCU21FNUtkQUxuZmlLY2ZRRldjWU5Yb2ZiZXNiRGw1MVFuVHRzcktXdjVM?=
 =?utf-8?B?d1I2aDQ3M2NGTlh2eXNCQ1RXc1E4anVMeDI3Vk9YVFY2V0lDRTRYWVlvRlRY?=
 =?utf-8?B?RWJlOHI3NVNWZE5Tb0JhaFkxc0xnb09EVUpvYjFxd3RINWJIb0F4WFFRY3BH?=
 =?utf-8?B?eFdXMFN4YmFJbEJpenFZazl2UGhwN3F4dTBPRlYyV3c4dEdzUDRVbk40a3Qz?=
 =?utf-8?B?UlVNN1BFN1FPQjd5dnU1d3hQaStrSGl1L0oraVFPNE5ybm9XWk8vZ0N4R3Iy?=
 =?utf-8?B?RXpxNEpXU1dhaVNRbVoxemVGdU5EK2JpR3VVK0hUbmVoRDlVRzBTNGFVV1Nx?=
 =?utf-8?B?WmpaNzAxMDhuMnNCT253Sld1cUtPT0hsSEh4TGR4Zm0xZHVxcjYzKy9nUmty?=
 =?utf-8?B?cno5Z0RPVzFkRWVVRUxnMDVwQUFHYW9EdGRvZXlDVi9OUUdPdjVxSUNlZTZa?=
 =?utf-8?B?V3R5dkJsS1BBUzNGd1RFTnhzdVV5VkNBQytLaXlvVG9COVo3RkliSUNaVXhM?=
 =?utf-8?B?MDJJa2lHalMvQlB4cmxQdmx0UFdiZ3V3cVdTQ2VSZy9iaEE2Nk5mUVNGUWtM?=
 =?utf-8?B?QktPLzJFem0wVUd1clA2UzgyUkhDeXFTT3EvNWNXVEpzaDlZUFhyVkd1Sk1N?=
 =?utf-8?B?QVc2Vnl5cFpOa3l1YlFtdTh6SkxuVXZKYktJeTV2dGRSL1UyU2tick9qbFJQ?=
 =?utf-8?B?dXVHZzhFTkd1QmVONzhhVXJYQ0FlRG1ua2haZ1N5VkRndkRuMllOaCs3ZVds?=
 =?utf-8?B?aEVuZURFL1ZKenJhVXY2TkxYTDVOSzRjR0o4b1k0YzMwYWpOZWRtRTMzeC9E?=
 =?utf-8?Q?W6L5gN6oA6QwcdLEBuLDswDKWdNrMwK53PKGVnzxlwWM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MmVna2hwVDlZc0RwSGFBaFp5b0thMVFqQ29ac2VDQTZ0U0QxM2lQcHpMNmtm?=
 =?utf-8?B?aGVJNUNONmgxKzNSZnNKeEhGODhsSTQrSHh0WEdNeGt4RUlRN2xoWnRhOFRp?=
 =?utf-8?B?Z00yU1pXWTB4K1c5clM0ZnpOdldvWFdaUFVuc0cyR0J1VWE2SmtQMkJtQ2N0?=
 =?utf-8?B?Y3VGdkdpa1VTaFY0MTUvcjJBT0J0Mm45Sm41ZFJhbGJpeTNUQUZVV0Y1M0hs?=
 =?utf-8?B?N1R3MXl5QmZBQWdUN00rZ1A3NVhkNDFYaUZCWTJ1WG8vMld3cE5BUitJdzQ3?=
 =?utf-8?B?UHE5WDZOWVJadTVydTJZOGhIa01BRjBDUWwxNll4VFBmNldYM3p0Q1RsRXUx?=
 =?utf-8?B?c09lNWtuV3d4REZuVEtQT2FidWYvd3k4T0Z6d3liSVJDM2g2ZlZaVDdiaWgr?=
 =?utf-8?B?M2F3Y0FtVlRWVkhQSWJtd285YUg4RTFPSjYwTmFRcmM3UUFiL0YxMGpoSW13?=
 =?utf-8?B?clhnQ3gzdllGek1jZXJ5SndkTFBNMG1Ock13K3doYng4cjRWMk1zOGFVQmlo?=
 =?utf-8?B?RkFaVFhDS1U1TG1tbEJnMEwvR2pFeU1OdGt1NEZNS25mLzJUT3RsYUQyR1Ux?=
 =?utf-8?B?K3VrUkdYcU00U1NXaC8wYmVkK2NSZ1ZMSEZyWmFBOG9oelVvTTFDS0JET1FC?=
 =?utf-8?B?eWxscis4NE5CcXVPajg2ZEQyamJzWFZYam04cnJiRnAzWjBVVllZTFhtNXkv?=
 =?utf-8?B?emtWbStXT01GQ1orOGtkQTBIbTRDNTB1TjdnNDJRMWE0VUtDUm9iaWNjaEdt?=
 =?utf-8?B?NHpObzB6YUFxdS9BQnhaNWM4RlR1U0c4RzBnWHZ5bEhWYVNQNzQyT1EwYjQz?=
 =?utf-8?B?VEV1dTZBcEpUbDlNN0hMQi9nUXI1OXVCekRYOXZ5dHQyZlRaRzU5aDlBZU9E?=
 =?utf-8?B?UFppNkFKbENvQlp2S0YvWDlaVWJ3UkE2UW02T0Z1cmdqNWsxZkpOa3lKQVhH?=
 =?utf-8?B?bTdKMWJkazlGVnFLZFdMYUJ1b3hLOWxYSUNOc2RMMTJDU3c5aHV3bXRJVkhu?=
 =?utf-8?B?aWp5R1lNVW41cXloWmZSYlQ3UnNzOWdmNUhyeUR4ZHZtSkN5NDFqdmZWcGtw?=
 =?utf-8?B?TnB3ZWwzNFp4UHB4Y0FwaVlYL0JkbnduYWpBNmQvWTBOWFNhZjZrRk1KdDNy?=
 =?utf-8?B?aEJzUmwwMUpsT2M3R2U5UTBweXd6aVB4anFHUzRzZHFDVHJKUlV1R3NGb2Zj?=
 =?utf-8?B?b2pvQ0VJcmRIbWFaZDhBUFZ3dW93RDRYSTFOMU82aE9RaVNqbGhhL1pvMkJi?=
 =?utf-8?B?V3dsc3A0bXBNUldqRFVINmlVUjk2N2ZZUW9DRVY0bWt0cUdtUStnWFdBZWJV?=
 =?utf-8?B?YlFxbVJ6TzB0cnBEN0ZlMGhsSUtPTFFxSVBmbnIwSHZCZGhLVGY0RlZEVlAr?=
 =?utf-8?B?NTNPS1RURTZyL0FmcFNidy9DRXkzODkzKy9ZOUlXdklhc3VaQStvNXB0STZH?=
 =?utf-8?B?VWg4WUhscFdEalo2aGFBS2RORDY5UlJ6MGJZR3JFRXc2aGFvV0FIREVja0F0?=
 =?utf-8?B?aGU0NzlxNTVPMjFnOUxoWEhMR0haTTI5VTNsWTRLbnk2REpRMW1FSDJDOFNW?=
 =?utf-8?B?eUtPVjZZYjdkbU9tN0pXZm13MmdMVlh2bnZhQ3N3eEswZEJnQmdvZE5CQnZj?=
 =?utf-8?B?aVcxU3lpbkZFdTRYdGJjUE9KeVZZS050KzRTV0luY25ZZk01NTU0OUR6RUts?=
 =?utf-8?B?ZGdBNmJ0ai9mZzcyRkJFVVNtTnlvelVUWnR1SndJOXhBTjFxUzd1bXZEV1By?=
 =?utf-8?B?U3kwd2E1cGtpUnFzcGtXT2lFT29GQjN2YURMMVUvRE5yQ3pwTXFVVytEYmNo?=
 =?utf-8?B?aklhRDcvc0xIU0FvS0syUTFkeVB1ckFGbXVaakVlazVQVzMvQVR4Z0o3MmQ5?=
 =?utf-8?B?RWswamJBNVFSZkZVVklwTUpmY3dkams1TXBjWG9oUGZNdFhHNG9DejFVNVBk?=
 =?utf-8?B?TDJMZm5GbnNyOVlja2NCUHhNaXJzZHZjVXZTaUJId0duS0RGSktxb3pBdDNU?=
 =?utf-8?B?ZjBGckFFemxTNmtNOXpidWdFTmVxMFhHR0ZndklDTXNNMmZvSjBIRTU2bmE1?=
 =?utf-8?B?cWxjRDA0ZHVra0EvM2FpcnJUZXF4enoxZnhIdVhqcy9FcjNBUGhjOXdWMU1X?=
 =?utf-8?Q?ehI4643MyvL2MenfkdLhahN3d?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f11d6338-43ea-4bfc-b7ab-08dc6345608f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 03:28:00.7021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iMZ0sADiPAbJlKHqXpX0tOWL3FnMT9/KrzCtgxTAuLYlHaKtjoEqzX4rIf+zM2j/9aMdLX+FUNfA36xVjsb6wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8607
X-Proofpoint-ORIG-GUID: 4wfMr_bEDGTPcINZLpot5QmpNpff909E
X-Proofpoint-GUID: 4wfMr_bEDGTPcINZLpot5QmpNpff909E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-23_02,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404230009
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Apr 2024 03:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110111

On 4/22/24 23:36, Kai Kang wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> There are files confliction of apache2 when multilib enabled:

Please ignore it. v2 will be sent.

Regards,

Kai

>
> Error: Transaction test error:
>    file /usr/share/apache2/build/config.nice conflicts between attempted
>      installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp
>    file /usr/share/apache2/build/config_vars.mk conflicts between
>      attempted installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp
>
> Set 'installbuilddir' to install dir 'build' to ${libexecdir} to fix the
> confliction. And inherit bbclasses multilib_script and multilib_header
> to fix follow up conflictions:
>
>    file /usr/bin/apxs conflicts between attempted installs of
>      apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp
>    file /usr/include/apache2/ap_config_layout.h conflicts between
>      attempted installs of apache2-dev-2.4.58-r0.cortexa57 and lib32-apache2-dev-2.4.58-r0.armv7vet2hf_vfp
>
> Since multilib_script inherits update-alternatives, remove it from
> inherit line for beautification.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   .../recipes-httpd/apache2/apache2_2.4.59.bb   | 31 ++++++++++++-------
>   1 file changed, 19 insertions(+), 12 deletions(-)
>
> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
> index b96e8b4e1..1827d652f 100644
> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.59.bb
> @@ -31,7 +31,7 @@ SRC_URI[sha256sum] = "ec51501ec480284ff52f637258135d333230a7d229c3afa6f6c2f9040e
>   
>   S = "${WORKDIR}/httpd-${PV}"
>   
> -inherit autotools update-rc.d pkgconfig systemd update-alternatives
> +inherit autotools update-rc.d pkgconfig systemd multilib_script multilib_header
>   
>   DEPENDS = "openssl expat pcre apr apr-util apache2-native "
>   
> @@ -80,7 +80,10 @@ EXTRA_OECONF:class-native = "\
>       "
>   
>   do_configure:prepend() {
> -    sed -i -e 's:$''{prefix}/usr/lib/cgi-bin:$''{libexecdir}/cgi-bin:g' ${S}/config.layout
> +    # only modify layout Debian which is adopted
> +    sed -i -e '/Layout Debian/,/\Layout/ s#\(cgidir:\s*\).*#\1${libexecdir}/cgi-bin#g' \
> +        -e '/Layout Debian/,/\Layout/ s#\(installbuilddir:\s*\).*#\1${libexecdir}/${PN}/build#g' \
> +        ${S}/config.layout
>   }
>   
>   do_install:append:class-target() {
> @@ -119,14 +122,14 @@ do_install:append:class-target() {
>              -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-ffile-prefix-map[^ ]*,,g' \
>              -e 's,${HOSTTOOLS_DIR}/,,g' \
>              -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
> -           -e 's,APU_CONFIG = .*,APU_CONFIG = ,g' ${D}${datadir}/apache2/build/config_vars.mk
> +           -e 's,APU_CONFIG = .*,APU_CONFIG = ,g' ${D}${libexecdir}/${PN}/build/config_vars.mk
>   
>       sed -i -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
>              -e 's,${DEBUG_PREFIX_MAP},,g' \
>              -e 's,${RECIPE_SYSROOT},,g' \
>              -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g' \
>              -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
> -           -e 's,".*/configure","configure",g' ${D}${datadir}/apache2/build/config.nice
> +           -e 's,".*/configure","configure",g' ${D}${libexecdir}/${PN}/build/config.nice
>   
>       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
>           install -d ${D}${sysconfdir}/tmpfiles.d/
> @@ -143,6 +146,8 @@ do_install:append:class-target() {
>   
>       rm -rf ${D}${localstatedir} ${D}${sbindir}/envvars*
>       chown -R root:root ${D}
> +
> +    oe_multilib_header apache2/ap_config_layout.h
>   }
>   
>   do_install:append:class-native() {
> @@ -159,13 +164,13 @@ apache_sysroot_preprocess() {
>       install -m 755 ${D}${sbindir}/apachectl ${SYSROOT_DESTDIR}${sbindir}
>       sed -i 's!my $installbuilddir = .*!my $installbuilddir = "${STAGING_DIR_HOST}/${datadir}/${BPN}/build";!' ${SYSROOT_DESTDIR}${bindir_crossscripts}/apxs
>   
> -    sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> -    sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> -    sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> -    sed -i 's!^CFLAGS = -I[^ ]*!CFLAGS = -I${STAGING_INCDIR}/openssl!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> -    sed -i 's!^EXTRA_LDFLAGS = .*!EXTRA_LDFLAGS = -L${STAGING_LIBDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> -    sed -i 's!^EXTRA_INCLUDES = .*!EXTRA_INCLUDES = -I$(includedir) -I. -I${STAGING_INCDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> -    sed -i 's!--sysroot=[^ ]*!--sysroot=${STAGING_DIR_HOST}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
> +    sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
> +    sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
> +    sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
> +    sed -i 's!^CFLAGS = -I[^ ]*!CFLAGS = -I${STAGING_INCDIR}/openssl!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
> +    sed -i 's!^EXTRA_LDFLAGS = .*!EXTRA_LDFLAGS = -L${STAGING_LIBDIR}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
> +    sed -i 's!^EXTRA_INCLUDES = .*!EXTRA_INCLUDES = -I$(includedir) -I. -I${STAGING_INCDIR}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
> +    sed -i 's!--sysroot=[^ ]*!--sysroot=${STAGING_DIR_HOST}!' ${SYSROOT_DESTDIR}${libexecdir}/${PN}/build/config_vars.mk
>   }
>   
>   # Implications - used by update-rc.d scripts
> @@ -178,6 +183,8 @@ SYSTEMD_AUTO_ENABLE:${PN} = "enable"
>   ALTERNATIVE:${PN}-doc = "htpasswd.1"
>   ALTERNATIVE_LINK_NAME[htpasswd.1] = "${mandir}/man1/htpasswd.1"
>   
> +MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/apxs"
> +
>   PACKAGES = "${PN}-utils ${PN}-scripts ${PN}-doc ${PN}-dev ${PN}-dbg ${PN}"
>   
>   CONFFILES:${PN} = "${sysconfdir}/${BPN}/httpd.conf \
> @@ -200,7 +207,7 @@ FILES:${PN}-utils = "${bindir}/ab \
>   # We override here rather than append so that .so links are
>   # included in the runtime package rather than here (-dev)
>   # and to get build, icons, error into the -dev package
> -FILES:${PN}-dev = "${datadir}/${BPN}/build \
> +FILES:${PN}-dev = "${libexecdir}/${PN}/build \
>                      ${datadir}/${BPN}/icons \
>                      ${datadir}/${BPN}/error \
>                      ${includedir}/${BPN} \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110106): https://lists.openembedded.org/g/openembedded-devel/message/110106
> Mute This Topic: https://lists.openembedded.org/mt/105671896/3616933
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [kai.kang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
Kai Kang
Wind River Linux


