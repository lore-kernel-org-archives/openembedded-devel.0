Return-Path: <can.wong@emerson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7A9C02198
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 15:58:26 +0000 (UTC)
Received: from mx0b-00300601.pphosted.com (mx0b-00300601.pphosted.com [148.163.142.35])
 by mx.groups.io with SMTP id smtpd.web11.45027.1738857503962814651
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 07:58:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@emerson.com header.s=email header.b=j9HZQ0w5;
 dkim=fail reason="dkim: body hash did not verify" header.i=@Emerson.com header.s=selector1 header.b=BLUbjNdh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: emerson.com, ip: 148.163.142.35, mailfrom: prvs=1132ee0a8d=can.wong@emerson.com)
Received: from pps.filterd (m0144092.ppops.net [127.0.0.1])
	by mx0b-00300601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 516FMFDO031253;
	Thu, 6 Feb 2025 15:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emerson.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=email; bh=KIhlWWDp9zllXB42vwqC+WtA+0
	uk3XOUyQeRCY80onE=; b=j9HZQ0w5B/erDMGjKC6p/Lsn2pS0FvTW5m5IVI6eoN
	1sta27p880gVgkXz52jhxLISSadGU5RM0mJK5a7cPNSsml21rXbN43LXGntAcAfz
	PDvIepsaNIv6lEiF71WLB3rhYHUY6FxwuXvfTdbshk7W0S0R1JD3oqMJnJ6fZ8I/
	cVzEqooxD2tjwtN3OYKD+17d6NaTauwelCvv0HyioAKQiekALlWSOd7wp8VxXIa7
	l8RDkv7Ukht5EQn7rYhfmejw2CG+aF8J2Yv3vGJaPDX4c+mtmlNR9yXhOZxe5MLd
	gz2Osyj+RNYMIRu0DhKhNdIHzHxK0swzxLs0WNBbxQvA==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0b-00300601.pphosted.com (PPS) with ESMTPS id 44mynngf4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 15:58:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1o/lShc2ajwUSTz0hWgkU7Q4lo/Z7B3pglZmT9Sfh+dhAnulxIw5bUhoJm43xOar8xI1x7W5TYTNbNTYefi5RJRR1Q18CiuB3uCH0ndAa4GhAATUikbVuV/AzQqcrK+D9DvbEzb4Ms4B6W7Dvg+WHsjOET28ZjlIYIwv0SPjp9B5ncMx4va7NvEimgfQUpiElSCh7fyUg6s0by3vdsQKMTq1OjUjaTreNyyYY4EVdX/6UM5g4/1O0QwhPKv6SWOub6K5V8hraomly9X7joDfgOIOuEe6B2x6HfOv2gdMFW297PgVohjQ7GiTN5K6/gMtzY48o6tCoOFP4PT8SV/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIhlWWDp9zllXB42vwqC+WtA+0uk3XOUyQeRCY80onE=;
 b=DKxwc6D0L1eihigQFPOLETX+2X6gnAKmAYPSQhkNCaG+xw+oAj5F3Wgb8J5T0rnTuHRos3fpOImAjeEMu2AFarUdkoVuSrBUKFt4oKCkjgVnH5roijgQ2tP1jQkLQyjPiJfNrrQ1wVA7J03qL2lMkzyQ4+GZnxlggZnBvtOtLa1BAao/Q+zsXjY/iAcTuCYMn+Q1sMDmq3bH5KwMQIdtcbC335yuf8/g37lkzNxGvmx1pr4+4Mwrh+M/xWtA/w1RRU4+GTLVRdCFDO86dV23hrbKmi1jKAYGmTAytaY4R+T1DXSN/aYFNqOOLSWo0eNRBzuyXhUef9WNw4nW3AH9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=emerson.com; dmarc=pass action=none header.from=emerson.com;
 dkim=pass header.d=emerson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Emerson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIhlWWDp9zllXB42vwqC+WtA+0uk3XOUyQeRCY80onE=;
 b=BLUbjNdhINRc87IYHuCIpXBgxcH8uFAPMEKqgMKLIyE6PDupIcmmMHrabtuEqq2CQS/maSqj49ToZOQxncqv1WqhfG4sWBTUuI7t4ota1h2VNYejtcvd+7ioW8tqUjJyoUPiKaLUrqEbz4wcF3UqQ34lREnjk/cX6vQCn79NeynQZLEiPehZNmfa80LU7Y1YmFoj+RYSIfI/+h16lYtbXRB0ONSrbz3y1YD8f3TZIfDNOFW1opNHDxpr2lnBrtNhdxcFis57yX1Fvqzu58pzUz9SG3kwniiCH0YZSVbC1WEtFIJI1WofiVQaUgyCzKV9B8g1vLkm6814ah0rK6B3fQ==
Received: from IA1PR10MB7418.namprd10.prod.outlook.com (2603:10b6:208:445::11)
 by SN7PR10MB6381.namprd10.prod.outlook.com (2603:10b6:806:26f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 15:58:20 +0000
Received: from IA1PR10MB7418.namprd10.prod.outlook.com
 ([fe80::76e:a3bb:ea4c:3f2e]) by IA1PR10MB7418.namprd10.prod.outlook.com
 ([fe80::76e:a3bb:ea4c:3f2e%4]) with mapi id 15.20.8422.009; Thu, 6 Feb 2025
 15:58:20 +0000
Message-ID: <7d47f427-666b-45e6-885b-142592284d30@emerson.com>
Date: Thu, 6 Feb 2025 10:58:20 -0500
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
Cc: can.canwong85@gmail.com
From: Can Wong <can.wong@emerson.com>
Subject: [meta-oe][scarthgap][PATCH] audit: fix build when systemd is enabled.
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BL1PR13CA0383.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::28) To IA1PR10MB7418.namprd10.prod.outlook.com
 (2603:10b6:208:445::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR10MB7418:EE_|SN7PR10MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: 51694f88-a0e8-4c1b-f0c4-08dd46c71415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RlA5NVNUdUJWQjBSZkM1UVNrZXlrZDhmdkxiZWE1NTRuQWdiU2h4VW9DRzJK?=
 =?utf-8?B?akk0dXA1TGJQcW5TS2UyNFZXaTVZTUo2cmwyK1NSMlpBcDFjU1g0M2NGSEdt?=
 =?utf-8?B?d0UxYzRtOVZNME1GYW1UTWpVVTl2TGl3M2FML3VFejdobFd0S2JRMEFtN0px?=
 =?utf-8?B?andDOEdvRkpzb1dPN2k5OW9wOURXdkIrWlpZaDZWYkZEWjBBNFpmcWs4Y1pM?=
 =?utf-8?B?RGhhUDIyZkl3bFZxK0Z6VkZMSVNURmp1ZEpxUmloUjNrVklGQ1V2NHd3NUxt?=
 =?utf-8?B?SVFlbUQ0NXBkcmd1dTRHU2RPWmVhOEErZHdYdlMxMzV1Tjg1ZXhwWFZrSk5D?=
 =?utf-8?B?c25iS2k4MWVPcTJ4QUNlR0drZFYrRHFaUkdreFRobzJBamNIZzU2bTc1ZVpm?=
 =?utf-8?B?Ky9aRm5NZ3lzL2lqdWxpWms5TllUVWpITjZpUElaNzN2YTEweGN6TC9HZ1Ra?=
 =?utf-8?B?OXlQKzNRVWxWMVRvbEJTMXg1TEJJMlRnVGpDUCt2QjdUV2loNWg1N2hmVFRX?=
 =?utf-8?B?QUFKTkVnK3B6SWs1ZXowaGN0ZUlHL050alZ1Z0ZzVzcybjhYWWFsRHFFZ0lF?=
 =?utf-8?B?NnRZUUdkaHpvOEllRUtwTEdJZUJxUWw0dE9BWU92VnFQZU1TaCs0WmZHa2lZ?=
 =?utf-8?B?ODh6cTQ2dC9LRWdTb1FFNnh2RzdJNTZZdnJkTFpTVktGbldYS0VNeXFrcExt?=
 =?utf-8?B?T0RoRkx2TUpsak5TWGZrdXd4UGJuR3ZieVk4dWRCS3U1K3VZTWJMVk5FZHZD?=
 =?utf-8?B?ZktJa2dLSGxKQnJONmdOV3dadGRuU2FjdEMwa2dpcVZ4aUtXeXI0SWpsVXN0?=
 =?utf-8?B?Q28vNXBUMnZVQjNUb1FQb3pldm5GbXFHbXJTanBYUXk0LzdkendzTU91MUx2?=
 =?utf-8?B?MDlROTVrR3Exd25FSTlwcWtQTEJJZmY3LzhzS3QxTGZCNEI2WEkzSEViaFMy?=
 =?utf-8?B?b0U1RlpIMmlzRi91MWk4UE1vMUQ4alpzbWpmQ2hQbG53SFBFTUI3ZzRDNWpN?=
 =?utf-8?B?MlkxV3cvbmxuZUszblhnSTlpTkYzRzBubDFSOXZYMk41a25OZTdicFJwR1dG?=
 =?utf-8?B?cFEyeWRIaDgya1YzRlRleCtSbnBSY2Nqc09pWVREV2thUnRSK3Q5VlRXQVhM?=
 =?utf-8?B?bGl6b1B6eGVDa0V0dnc1Q2lZSW1JYzVBZEhibkFZY0w0dzh1QjN6RHpWUWZZ?=
 =?utf-8?B?Q1JwYTM3S3dOK3A5ZWRyWlVIc2JIZURWRmlMSVV6MlFTTmY0VCtXdXpLNFlS?=
 =?utf-8?B?cVhrdjR2aVdSeXNSMEFpN2kwaHRjdVExSUtXMDhRNGpuWHN0clFLazN5MHdp?=
 =?utf-8?B?RVdvREhkTkxqS0xjK3lNTXlpT1lxR2h5QThTQzZ6MGVVUzkrNG1ZNDVNTXh2?=
 =?utf-8?B?TFIxRktBeXZkUEM5cm9NMEErNjdjMFhzSDVub2kvUUpvNTdTbElhYUg4Y0kr?=
 =?utf-8?B?RkpSSmJSV01XY3hScVdKZW5SbS93aUR4WWFwTHV5Z2NrVmtBUEsydHQwMjZK?=
 =?utf-8?B?MHFMSytDU3p6SU9BdnBRL1hRZTJoN0pRaXJSeFhTRjI2V2k3alJnaGhqZktM?=
 =?utf-8?B?QWJ3QnhDN2lGbXluSG95MUkzWHh5V1BiZm04U2hDMVBoU0haRGxZM1lGQXBF?=
 =?utf-8?B?M3ZiaXhlNTRFTEdCbGZpR3JBd0tnQURteHFzbzBUblFBVnBsNHIxQmFBbnlS?=
 =?utf-8?B?aHFEbGJMbWNZRDBYbER6TnlRNlJRT3RGQm1PSWtiM1RqaDlKaFpsblFoWHNo?=
 =?utf-8?B?aXRxRlNvbU1YQi8zSGVsZlJZb3ZTbE9ZeUVJanBRLzZ0Y2wzTjA2N3JzSFBV?=
 =?utf-8?B?dVJnSG9xbXdnN05hQnM3WWQyVmJpT1llaDdsMDNHek5Wb3I2U1pJSGdGUUZ2?=
 =?utf-8?Q?dRtG8GazbEH8r?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR10MB7418.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WmJ2M01ZUGFJNnBjakJPMkszT3UzcG9kQVE5V3ZTODFUMzFDQmI4bnh5MVNK?=
 =?utf-8?B?a1NPNXJnbHJZRlNwbHBxZVlpODFYbWNWOVB6SDZwSUR6Umc4bnBNVXZtWDhx?=
 =?utf-8?B?dEVJMWpySFl5K2ZzMmtuSEh5ZGljMUNmV1dqSmNmcUFvVDVOQ3lVTDZlblkx?=
 =?utf-8?B?bzZURERvWDlrM2I3dXExcGM0OWlMclJsYnlNbDFvaGZYRittMHZXTE43MXdG?=
 =?utf-8?B?WlU2Q09SYkFRU2F5MTZWcWJPU3pHMFFYRXA3NjVRL2hQTTdIOTE0bGVnYmkz?=
 =?utf-8?B?N05GOTdCT2dXWStKOHlqYUd2cVpyTEhLRkRTT09QQWJVNGw1OENYY1FJVjBK?=
 =?utf-8?B?eVFDL1ZkYjdDdlYxYWR4TE1jcTY2dE1NNWVqbkhuZGRUWjNRVUtSaFZaYUdY?=
 =?utf-8?B?bC8wRmZhNHhGZ1IxaWc3UnpNZmNvSnAxeFl5d0U2V3drNXlCWDFldVhtdmJu?=
 =?utf-8?B?NVVrUHh2c1BCbjRlejFXV1NMRjJSY0ZwWlBVS1dGd1dPTGgxRlN4aUMyVHpw?=
 =?utf-8?B?U0VOL0FLUDkvSGNZbXJZQlZuc3NWbXl1UjZ1S3U4SFVvd1pob1hjZGR1eGw1?=
 =?utf-8?B?Vm5SRGIxc016MWNyZXNrYm1QcDVkVTl0WDdOMlBSV0c5VzV0RlJiVVNEbUJF?=
 =?utf-8?B?WVlHeHZseG1hYWdQNWJmY2h1MzNKRTAxVWZQM0hITzVXeE8zSDlSQjZnQUxP?=
 =?utf-8?B?Rnc3NUd5QnFBVXkwcXJsZDUyaFBmSTZYSk43ZnpxbVREMTU2dSs1RFpIcm1l?=
 =?utf-8?B?T3k3L3pEUzNhaXhLVnNJYjhNVUx0WXpLbTM1RHpxNXBGZFQ0VldSRG1yTWRF?=
 =?utf-8?B?UURRbzIxUExsSGUyQ3RzU0dWSmttdTlxcmlUR2tEc01BVFo2bW9JMjlmZytp?=
 =?utf-8?B?c1dGWVNqZzNLakZzZndFMld5YjE1V2J2eUhET0t3ZnE2c0RaN3lRVnlzdW1I?=
 =?utf-8?B?ZGo1V2pzeXJZS3UwTGc1N1orM0NCR3R2dG96eFlPd2NpMExVMEpDZ3JXRWxG?=
 =?utf-8?B?K1dCRVlpMW9kSkRaUDd1cUNreVRyd016RENnZWUvV1k4aEdOSkEzZFNOekd4?=
 =?utf-8?B?NDZ6Q3ZTdzRGQk5RL1FYK25KZHM3Si9hd0xOZlBEQUp1R2Q2eVRoeVVQNlBt?=
 =?utf-8?B?K3FtS2ovQ2pFQmRRL1dicjFNeVNjdEp6aUYrMjg5SGl5a3VuMmwzc2I3MVNn?=
 =?utf-8?B?RHdmanlweEFoY0t3TTVOZjE3anhYSUp5dWEvVGpoOFRMaHo2Nk5aMzlwQjZX?=
 =?utf-8?B?aVRIcHhVaTIyYkZwQ2hNdGhBY0RsV0tKeGYxazNjTHcyaWVPN1FGSlhteFow?=
 =?utf-8?B?QXBGejZIVE1CVGJaZWt2bzRUSU5lRjI1dnhrQzZFTGViOG1TQjZxRW5pbXla?=
 =?utf-8?B?VkhNczM2dnp1R3dDU3FxN3FIOW5icXh1bGZhZ291VmxpaXI5QjY3ZGMvQkow?=
 =?utf-8?B?cVdlblhYL054OWJwNkNuaHNQdzc3S25Qbks3dEZCN1ZSUXpqemZ1cDMrenhH?=
 =?utf-8?B?WGRIMDNPd1A2UUZwTW1VYXJ3aEZyditUVjBzY01pbVcwUi9BUHY4bG5uUXlm?=
 =?utf-8?B?cHpuYXRpOXo1SnZ2dllQWWQrdnpDdm8zVjUzRzBWejBpWGNUMTBhTDdVUEhr?=
 =?utf-8?B?WE5tMmhLSHdReXFrS1JERUxEcEVib0pGT1JIU1VGWlVlUDdGR3ovL0J5ajda?=
 =?utf-8?B?NFhkVlNvZW16czZQSE9oOEMrRWZJWTdmNWRjN2JPMnNtQzhsa3kwdHpVQjA3?=
 =?utf-8?B?Njk5OENaU1NVWisyZ2hGaUt2Z2c0WmorRGVCdWUxS05ZdTUxTVprQUVueDdy?=
 =?utf-8?B?TDFWL0xhUHVNNHh4b0VndTZma3JBdEJpdkhnVW5TMkhJOW04V2VOMWd0Vkli?=
 =?utf-8?B?KzBSOFBZSGR3ME54TDl5ek1FRDdERFJDbnhGRlE2dTR5WWgwVEQraUFiVHZX?=
 =?utf-8?B?NGw0VXlValdIRzFpa1EvZmFiU0w0Y3lCd0UyalorOVlPSkVzbWlWUm11MVJR?=
 =?utf-8?B?WkR6eXNKSmpIZDM4bytyM0dXeUx2TTJvY2s5YytzRy9CekkrM01LdkZLcFNE?=
 =?utf-8?B?UkxrSnljQW0yZ2tPQ1kyKzhnU1RNSFZPVEF4OTY1WlNlQ3NwNWJkL3RKb1Zp?=
 =?utf-8?Q?1fmISI+6D7xxFdY8J3BSqj7Ru?=
X-OriginatorOrg: Emerson.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51694f88-a0e8-4c1b-f0c4-08dd46c71415
X-MS-Exchange-CrossTenant-AuthSource: IA1PR10MB7418.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 15:58:20.6838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eb06985d-06ca-4a17-81da-629ab99f6505
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9cTEEiMrRsTu+6id3w0/PDHW9FcgOPBkZNI+Yo8KRy9ulZZicjMMpoGEfnRaSefoYkiN2cs6lS4Ul6UR80OGwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6381
X-Proofpoint-GUID: slxHI4te4a3DT3KteMMa8yC_chpQZo5R
X-Proofpoint-ORIG-GUID: slxHI4te4a3DT3KteMMa8yC_chpQZo5R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_03,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502060129
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-00300601.pphosted.com id 516FMFDO031253
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 15:58:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115288

 From 8399cca17dffd1892e22745d40e2aeb522174645 Mon Sep 17 00:00:00 2001
From: Armin Kuster <akuster808@gmail.com>
Date: Sun, 13 Oct 2024 08:57:24 -0400
Subject: [PATCH] audit: fix build when systemd is enabled.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e68145b00260fc380242cd67579068427e501c10)
Signed-off-by: Can Wong <can.wong@emerson.com>
---
 =C2=A0meta-oe/recipes-security/audit/audit_4.0.1.bb | 6 ++++++
 =C2=A01 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-security/audit/audit_4.0.1.bb=20
b/meta-oe/recipes-security/audit/audit_4.0.1.bb
index a37ae3bb84..ade566d82f 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.1.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.1.bb
@@ -95,7 +95,13 @@ do_install:append() {

 =C2=A0=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('DISTRO_FEATURES', 'sys=
vinit', 'true',=20
'false', d)}; then
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -D -m 0755 ${WO=
RKDIR}/auditd ${D}/etc/init.d/auditd
+=C2=A0=C2=A0=C2=A0 fi
+
+=C2=A0=C2=A0=C2=A0 if ! ${@bb.utils.contains('DISTRO_FEATURES', 'systemd=
', 'true',=20
'false', d)}; then
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -rf ${D}${libdir}/sy=
stemd
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${systemd_unit=
dir}/system
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${B}/init.d/a=
uditd.service=20
${D}${systemd_unitdir}/system/
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${B}/init.d/a=
udit-rules.service=20
${D}${systemd_unitdir}/system/
 =C2=A0=C2=A0=C2=A0=C2=A0 fi

 =C2=A0=C2=A0=C2=A0=C2=A0 # Create /var/spool/audit directory for audisp-=
remote
--=20
2.43.0



