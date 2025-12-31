Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E394EE57E9
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 08:13:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.82102.1767168776519933155
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Dec 2025 00:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QPhEpmPQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5460db3f62=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV4oIpY2396533
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 08:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=yIF6m33BOulmArp88XDIRqVzlfOhTyfCAOhmM9MRMiY=; b=QPhEpmPQaTIo
	LBcl4S7bHa6RKvlMXz1vnMu1cd4kxVVnuC50SMoy2C8S2D2emjEBkI4MxfjU+zUv
	vh/tT2Z8lcM9xkFrdymZRTXXC6/8r1OQb3zkAMqwBmhlPV+urWi/kmtF3FrdsrU5
	+nMN++THbMvZQlPCt23cFyeWLEKQyiKJTG7sGtlYB6bTTMeKdMjDZzebFPigNXGW
	JxtjTwbhWoaqY6G+wRb6ikFHeQ75gkwl5cKXotpo/24HoklDKU/ltkulIcycQpt9
	IAD28zbEW5+2D9HT0OzZwLM6jxBGg43yNNYsNbt2zNcWM3bnub3/lVVXsC3ZLA/o
	5c2XxSb8Xg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011009.outbound.protection.outlook.com [40.93.194.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4um96-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 08:12:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bk49fBZqv+DK0bnM4gRaoLh16NZOuCKN3KO32aJ6L+1n9CgUDT4D8BZnz0QSIBFErNus9LRnnYP52T+Ab54dQMwQquedAisLmToMvG3IPBd9W5pF0uW3WCzwK3TXQlzBu1FpoqU8t6MRGaMKrCt0447wNnpB65S0Th25N4yATziy7FOsD4+HmdJiCFr8v2tFsd+9uivptRrf2X6n98chmR3sJ+p75B8KEq5uQgx1fwDz2tFfvSLWPcIXrNs6xG0NtYQmX8k7ot1w7c8WXE1b5i+0986yr+mnUZLOoea0H/F6bQKb3VZFdx1BhzWU3RhGFXR8AFPE1dcHw8YAuRDOnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIF6m33BOulmArp88XDIRqVzlfOhTyfCAOhmM9MRMiY=;
 b=Ku42ROdbNZRqce/2bN72YPdZr46A6GbO7cx+dkQdH0WbKy+tJq2T6M457muWwcmLYHwf5JyJvInggX7MRBz6squ7rhGvTV3jcKa2YJ7osAjZqvoutziuWbPC3ZLoyXy1fLJV/eI1lGE5fL1Rlb2WlAJ7dqgGkf0thIhwMVLrKkP7VXCnRE8wl+FsUDD4gsNwe1PDTj9U32ZoubTKWLLAGiWtRJdtUwYBM+/Sb+LydS1uW6tWejYUbJi7ceAeYjYcuwdaSsb2nrbp4roJKddTXB3SPHXfTC8Ac421z68OltL/R7xqpcNDwYSqKfW35peIYDaVjT2i4NThyA9uNGip9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 08:12:52 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 08:12:51 +0000
Message-ID: <ea64bef2-30db-477f-bd9c-9dd27d6599d1@windriver.com>
Date: Wed, 31 Dec 2025 16:12:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] Many CVE_PRODUCTS patches
To: skandigraun@gmail.com,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <3d4935dc-f9b9-400e-831e-843104190500@gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <3d4935dc-f9b9-400e-831e-843104190500@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:3:17::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: d70c195d-db27-4889-54f3-08de48446477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RkVjdkd5N2hoNkNxbjB0eUJVdGZrT2ZwMURpTmQrSWdweWp0WFdraVVENWdT?=
 =?utf-8?B?ZVkxRmFCeDI4V1JHRlBBSHdLeEwwSVB1YkFsdzVYMS9hNzZtbEltMzhFQjlB?=
 =?utf-8?B?eXE4a2RuTURQRkk3NUlhRGdtQllxdVRGNHQ0VzQycVNSVFAzdHdZOStXdzZT?=
 =?utf-8?B?RHBGTE1lakkvRHNMUm8zQk1ZTFFqUUtMSzg3OHlTKzNiOHNJb0xOWUlsVU1z?=
 =?utf-8?B?VFJmZS9OaG9mYXNJMHY2bGwyYzR5bm1CdnE5TlB5djNhdnFuTWtFclRCRkdM?=
 =?utf-8?B?N25lVVQra09pOXFKby94RVVpalFzZmlkZ0FGdUdaNU93U0xsQzMrSHhBOWhm?=
 =?utf-8?B?L1BzeXYxWEFxZDNIWVFWdDZ0Wm9EMEdkWW5BT05GeDBPaUZlN3FnL2F5elJC?=
 =?utf-8?B?YlRsMkRFZVJxbjV1RHZpaVBGNEtIT2IzdWp3ZGRzMi9uTCtIc21yY2xOd3Nl?=
 =?utf-8?B?eUllSDdhVmNFalBBbVVkY3RWd09JZmFYUUJ5M29meVQxNzlLRVcrcGhwelVv?=
 =?utf-8?B?dU9WQ3g3SnBIaExCZjhRMEhLSHVmeE81djJJMGtoMEFJT1hzbVpGSVcwV1pW?=
 =?utf-8?B?RHgybzk1WlN3NG5Ucld2UVNRUVBXeGJIYUdHaThVMWp0M201V3REN0hhU0Zo?=
 =?utf-8?B?OEtHb1d0bkJkYnpIVXJEYlcxWGZpTG9UOFhKdHRKYXRLMGxleTN5dTRiYTNO?=
 =?utf-8?B?dktUTlZBUHN2YXRGN210eTlBcnVkM1lOb0h6aUFwWStiR0d2SHJCTFNmWDI1?=
 =?utf-8?B?RXVVQjVpYXhJZy9tc3NFTlpCSG5hbFczVktqam42c21rYkZjYWxkMktjUElX?=
 =?utf-8?B?WTNTRTFjRXZILzRhSkFZU2hMU3ZMeFl2ZSs0cE1mUW1WSFVXRG93WjlQNEM2?=
 =?utf-8?B?NFVFU1BOYTkxL2VPYzAwOFJtNG5MYUt4TldPWXlTV3dlRkwvekM3OVZGSTdM?=
 =?utf-8?B?MHIyUmVKa3FaMmMzVkZYMWtIVFQvK2pKcVd2amcwUDVRbjIxZkY4VXJac3Vw?=
 =?utf-8?B?Q2dvTDBVUzJNejdCajFOQjRwdzYzaHk2YWtrUmJ0NWFwN2htQUNvOWdiWlYz?=
 =?utf-8?B?T3pYOVlHd0lrbmhORDZXeWU3emlrOC9SRlRhZkpmZXFCVHZ6b3YraThiTHNp?=
 =?utf-8?B?c05ieDRjLzFzTHE4WlZwRG9NM3g3NFNWZkVSOUxJWitnL0VTOWxLK0RncGdY?=
 =?utf-8?B?eHd1bk5nR0U1SmdDWWNldkV1R0MwN0l0a25GV2UrTGdGUDFpRlpkalFHTkZM?=
 =?utf-8?B?WVl2N3U4cEo2ZVhtRTMyMGtPRFRhdGdiRlpMSVM3YWxxTXZGM3NVR0JaK1Vs?=
 =?utf-8?B?T3VGTmVndnVoMkFlN2YwZXRTY2ZFTWxyZVQ1S1JjRlYxTTROd2xWWGJZa1ps?=
 =?utf-8?B?dWpaRDJFMVZFaTEzdEs2VXpRQU41Q2wyVkZWTm0xaURzS0dmaWRBTk9PQnkw?=
 =?utf-8?B?NjJXNUdsblk2aGtDSjZEN1dxdUtYQlhMWkw2TGp0WFZXdlRNT3paMnk0anlE?=
 =?utf-8?B?SldadFBDUWhpVk8xWGhrSzJoR2ZSM0lRQUJiTzYvY3A5WHl4bWtYa0h1bjF3?=
 =?utf-8?B?RTJwS0VUdytaZUhyTEh4RTlxUjVTMTVzNDhabzFhdVJKUS9hOTBtTHAzMjNs?=
 =?utf-8?B?U0cvZWxldnFNckVKeGtoYnVsVlc2akJNT243Wm5VVnNwcVI0d01weFBnOGZT?=
 =?utf-8?B?MFBDLzcxVnpvSHAzN210Yzl5R0Q4Y1krSDNNSEplUXUxR2hYTmFVVStjOS82?=
 =?utf-8?B?WU9VNThtTHAzeWFuaEprdXJDL1N2Q3RqWHZzRlk0YUtrbFlORkFkWHJhcGNo?=
 =?utf-8?B?OUlHdFl1VXFQTEN0TlJLdThEK2xMMEx1TXZkZkZkVjdpYzV1Sjh4Y0hNQkpL?=
 =?utf-8?B?TkRrNXAvVVhYVFhIVmYrRGxsNS92K3pML3FudmtzZmRPV0wrYVoxczFQRkFZ?=
 =?utf-8?B?WUxLTG5mQjhLOWd6azhWazdRNWlURTB2QXFLbVVsc3dNb2dwNU90eXozTHB5?=
 =?utf-8?B?bGZWUVlrWTFnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NDc4N1h1azRSSEJaLzFGb2FXTGVlMENnQXZkaWNJV2I0Q04vK3JhNUtkTU5s?=
 =?utf-8?B?SHJCVlMxMXdCRlhxSG1PWmdsVGFCT2poQitudW5NTG1URTl2WWw5V28zYmdD?=
 =?utf-8?B?cHZBZjQxM1VhMy9TMWFwM2JNRUJ1RlVmREUrUHQwY0lDeE1XV2tLc1VhRmYw?=
 =?utf-8?B?NXlLdUtpMnFkdjQ1aWM0M0pxekp6TUFqVE4wZElXVFUxZ0ozeXZEcmhndzRK?=
 =?utf-8?B?RnYweVZoWEUwVU5UOVVKeVFYNjN2ZTgrTEZUZjlOTExzTjB0TEdlc1VqV3Ni?=
 =?utf-8?B?dDYreUt6Y0ViZHI1MlJ4N2NyTTUwQzZnTUphYnJReEhtcVoyKzJGUjJwQkhj?=
 =?utf-8?B?c1d0SzFnT1lFeFRWWDhqTG9zUnhjY0JqU2NyWUtsOFlDWGVMS0x6MWV4S0Y2?=
 =?utf-8?B?Y0JpN3VnSzBDUHY3T3pFTkRXa1Z6c08rQVFtYjVMRVZYLzB2SHpmY1JXRUkz?=
 =?utf-8?B?Um0xdVNMWVk4T01sUHllMERCelZnUWkrWHB5bzhPM0ZmNnpHNTRsc21QMWds?=
 =?utf-8?B?ZXRVZXlzTDMyRmVBUHFPQ1RmV2RQd3grT1VIZUlVcmdLcHVDV1VNSWtYRk9R?=
 =?utf-8?B?aE5rYXduc2NLZmxiNWo4eFJpTHJ4cTQrbjh6bHlkaVJhOU5pSXg3NStadStR?=
 =?utf-8?B?NEdURFlZc1NnOERxdFRyZmkrOFdMMjdxN2QweHI1UHBUZzVCZGFrTFg1TEs5?=
 =?utf-8?B?cEd4QW5nbHRscVpwSFdNSnJENExkWFBkcHdDaVBxT0l4aVpiV1ZWYUFOZVly?=
 =?utf-8?B?TjVFK0NYRGcyUWFjd2s1L2gxcElyRTBLd0pDb0J0Rjd1bTkvOWROcm93QlNJ?=
 =?utf-8?B?d1hwLzNBSGVBN3ZBUEdqdG9HVndpZHc4VGUvK1NCM0Q5SUo0MTVuUUx3QXFn?=
 =?utf-8?B?NElORlRpajBueWVIY29UaUlxTjZOajZXQ3lYekd2a2dUU2Y4T081ZDhKTC92?=
 =?utf-8?B?aUp6RXl3bWZjU1hsOFRJRk12Zzk1bWtESlBaYnBxZEJISzVwcjd3WTRnNGZ5?=
 =?utf-8?B?Zks5MXU1QVY1dnNXM0RucGxLQW51bzNzSHU0b3dZN1djOGlSNzBNdW8ycTkx?=
 =?utf-8?B?RW5WUm1Ca1lMenF2QmliaW9Ld0hYSHVYTW5lMkNVejFUOHZhZW94K3hQa0U1?=
 =?utf-8?B?cnRmWVlUY21mSmJPQldyNlBFUDVIUUJNM1Arci8xR21SSmwrYWdMVHNUeWJ4?=
 =?utf-8?B?eHFyV1Q2dFRoQmhjd243ZSt2VlF4bDNPNDRkZHZuZ2xoeWErRjkvby9kdkR5?=
 =?utf-8?B?Mm9uOW9Pc0EwKzZBZ0VtL0ZGVjRtL2xjY3E3bkRjNUlnTndOWUgrbkJ6WDJU?=
 =?utf-8?B?U1RoQ3dHRWthNCtpcER2WHlGWk1HSSthSlJEUll3a0tia2Z2eVRiK2x6cG51?=
 =?utf-8?B?bEdnbUxVcC85R1JxQWE3eWwrdTJ1eDAwc0tYVG5uZ0o2MXI0YlRWaG9KajUv?=
 =?utf-8?B?M0Z5NjgvSFNveTlIQnFuY0tvMmc2aDJzSVl3WE5ZWCttQmNHRWIwSVNNeWVJ?=
 =?utf-8?B?bGdzeEE1RFhock11djlhUWVlK2JwZUNzM0lJNm1lOHFzd0h6VjhwWUVwQjdr?=
 =?utf-8?B?TXRjYVpuRmdnVWx6UVVNRlNYTERubGVQTDh4Z3VoYTFvSC9ySXEvZjBHRTNs?=
 =?utf-8?B?emNSYTVhclhVQk9NeFRMSTV6eE9PL1h6RFlLSTlEc25Hd2NrZzE4T3FHZGJH?=
 =?utf-8?B?YnJrc0ZESGJEUHpqN2tVTGxxQUIzNmtteU84aktsdGhHTEIvSm9aZ2MxRmR6?=
 =?utf-8?B?TXpKK2RtYWNjY3hqVnNGZGJpMGxlWm5pTnQvajhXNEVCeVRncTVDazg0ekdy?=
 =?utf-8?B?TkhyVjJzZXVvWmZ2STE2Rm5yRVhzSEZMS1l4R0QrcWZ2Zit0UFNwSU1WQWc3?=
 =?utf-8?B?R3lMN0lWbU5kbmdJOE5Qa0VlMW1xNGZVQW5Dc1B6bGhLU3ViUVh6MCtFWFVi?=
 =?utf-8?B?VnRQV2x5QVlEbnE5SUdhWXVGdXFTL2NwRnZUZkVqTmVjU1V2TGhJMU50ZGd4?=
 =?utf-8?B?NmxKQnhsd1o3RU56ZXdlWmllMkY0VURzTCtNd3YwY0pZM1M4Q25WOW5ZL1RZ?=
 =?utf-8?B?U2Fac0xHUWtUalFMQkpjZFdEUkVYOGZiNmxqRmhkSDN5b0lWWFFhU1I2ZExt?=
 =?utf-8?B?WjV3cUtTSnBWWGlSTEZKY2tzUUZHeWZBVkd4YjhyZmgreU8yTThlQTFtSGVi?=
 =?utf-8?B?QW52Y1dHSWxMemZtKzMrQmZlNDJQblRRbWk0ckdRSVhwbzNiZDFxWVg5dzFI?=
 =?utf-8?B?b2xIeFlUck1hQldYWHV6U0VhUzV0VzU1dUpkZmJqZHhyblZ3R1l3WXNOT29j?=
 =?utf-8?B?ekJITzRRc1JLNFhIc0FRUzc4K0laVys5Smhxb1lkQWVCUVNLMm83QT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70c195d-db27-4889-54f3-08de48446477
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 08:12:51.6498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4nx5SRbYbJUc7wAws/Duxnc7igjrsKJZKyNCuTT784V3xFGpDK7scx58k+n49xMpbpgoVUj5XqeQJQ4p+djfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6097
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ObaHQtPPvlthqNexntkBgizgJpBo_R93
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=6954db07 cx=c_pps
 a=9d+VVJWglIGFt+56pYWlLw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=I3_OUXR1NXJddSaEKuEA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: pwzdChhVi9e8E06yTlnaul4UoGm4GNzE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3MCBTYWx0ZWRfX32uBd1VmRTkM
 QB71zH4X01rXXDjutKPINmXmd3tDl2rjqQfd4fCHsTsSPiNTgqR8n35x5g2F4+NI+Dc+AiWlNaf
 ngXyVJJwOeSV8sL3kO8Rx4gZNjJS28Kc/liCt4nfljbOE16Oa6jSUCV9bD7/50IDVxaO/q5YJ52
 V+gjdOfAF5nWDBmDrrXQ6+1EG8Z95SMrg9MDJuxP1DK+Ys9UV6h+5SdUrDqsz46VHbbsNaIrhwo
 mddXKRO2XIJwbSXSnUewF3fv+e0aunKVkMZYmj9c5lCc+I0ZkSEqwGkphOhonmA58UwIqctWX32
 iReMXP/Ud6aa7OMtbWqrdGtTUJC4DWFjMmsMn+h06XodYak8kBIDDwsFnCHV770BYSh13JOiDX0
 y88+O/gJ0TaqMVSBKbSRQkyVqC5aBxzKkq6NwhooSdUY989z8r7Tkm9n2jQFc9Q1xi43Npx2s/u
 87BmkkAmVF8C+bz0DrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 08:13:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123075

I think your finding is important.

Yet, I'd suggest we change the default value in pypi.bbclass, removing 
the 'python:' prefix.
That would set a more reasonable value.

Take NVD data as an example:
$ grep 'cpe:2.3:a:python:' ~/.cvedb/nvdcve-2.0-* | grep -v 
':python:python:' | wc -l
159

In all NVD data, from 2002 to 2025 (+ Modified, Recent), there are only 
159 lines that have 'python:' prefix.
That's a very small percentage. To be honest, the number is way below my 
initial guess.

So, could you please try changing the default value in pypi.bbclass to 
see how things work?

Regards,
Qi


On 12/30/25 23:51, Gyorgy Sarvari via lists.openembedded.org wrote:
> Apologies for this CVE_PRODUCT patch-tsunami.
>
> While reviewing an earlier submitted CVE patch, I was wondering why that
> CVE didn't show up in the CVE report - it turned out that almost all
> recipes using the pypi class use the default CVE_PRODUCT, however there
> are quite a few where it is not appropriate, making the cve-checker to
> miss relevant CVEs.
>
> For today I don't plan to spam further, but I'm only about halfway
> through my list for the master branch, about the same amount left for
> tomorrow-ish.
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123037): https://lists.openembedded.org/g/openembedded-devel/message/123037
> Mute This Topic: https://lists.openembedded.org/mt/116999150/7304865
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


