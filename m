Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A7FC30653
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 21:00:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.381.1719435638835310056
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jun 2024 14:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6907e5632d=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45Q6jS0x031526
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 14:00:38 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywx4fv3qh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 14:00:37 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45QL0bgT003190;
	Wed, 26 Jun 2024 14:00:37 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywx4fv3qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 14:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wy8KGs/408V/CHhx4EE/yQ49ZALdbFqDAqOmZEIQMHK8/GRew+YKzTT77PC4Q7GfVjebYNQtjeJeaEr7SVYN8yHAXCtL8Lc+3CwjMcFLUsqehpHbvzkqy4n1UJMZDXmJcBweXR9OEpkg0aA+ghku1J2aJXM7oKjtSjLb1FSQTTT5U4WRGVDHFlweSlEexzlnfr5UCx1AHOsmKQiUnU/a5diITHdGpmorJn0ZtpSS19nkhXZCvMeYfTtaGiF/MgNrPFtV7kqzN4I0LLC2edJglfgWrp7sTc0TuwNEJPBXX70fEjlXd1sSd2gXAuAMjE5/zbrMJP6AQVJ1/xWuHeuD0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90L0rkWWjyWDk1wa2skyC4UIIlQV2+mkNNQVLqlHlXE=;
 b=YKeMS3nkv9CbKKJL/n7ZwVZexc1IcvNFmFalSU6wYz7bwFWuR0inpzLII2o8uTU3IswPdbce4GgevP6IgzazgKYZhxn1A7qibr5A4gUh97Ywq6hWDazNkB5/KvALdFXXH5yoqkZUgZZmImdHNdCLaxM6+aCuy4sd50rIfN5CaiPUSM6Y5MWGfnIgI6lNmR8jG+KLwI4qenmrEowDsZHcGToZkMttRK+AjWy4SoqdgHm4+V8Rhm2s9ROO4tBUYpusZmDFsxb9hN2m+JTbOk8ej3H5tSnEVmYIubqaRh+udMdkTX6Fujw5L9XciAhTVDTndCwuEKXTaU3sckr7GKTfeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CYXPR11MB8663.namprd11.prod.outlook.com (2603:10b6:930:da::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 21:00:26 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%6]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 21:00:26 +0000
Content-Type: multipart/alternative;
 boundary="------------AuOtIQ5CwNjSQAc0oOhWmxXV"
Message-ID: <c2ed1746-11e0-41ff-be93-19f0b00ed1d2@windriver.com>
Date: Wed, 26 Jun 2024 17:00:24 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] libee: remove recipe since libee is
 obsolete -- join the layer clean-up?
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240625162048.666209-1-Randy.MacLeod@windriver.com>
 <CAMKF1sqreoZ4rtcSL0ODP2Hn4uXRs8gMzQsg8dkOeUJh=tMF+g@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAMKF1sqreoZ4rtcSL0ODP2Hn4uXRs8gMzQsg8dkOeUJh=tMF+g@mail.gmail.com>
X-ClientProxiedBy: YQBPR0101CA0248.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::30) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CYXPR11MB8663:EE_
X-MS-Office365-Filtering-Correlation-Id: da6e817c-e4c6-406f-151d-08dc962300d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012|4022899007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bVRtRXpzZ1lqekZPRjhxckRCay8rbnZYNjBWeWdMb0ViZ1Ava1h1dkF1ZHp1?=
 =?utf-8?B?M3N0UysvMHFOc0RVdHZ6YTN5VmVuS3VCSmFSakFHVVhZeEZ1WndVNXZjSlNt?=
 =?utf-8?B?Y2kvVG4wVGgwRjAvR1Ayck5jQ09MVGFqMFpYMFdDenptRUYvZHNOYjdmYkh4?=
 =?utf-8?B?TjcxZk5sQ1Y0RlFCTGc5WkJXbEJiUU1PZGRleHRJRCtZa01kZmQwb3ZaeVBK?=
 =?utf-8?B?VXl3MEJ6a1Y3ek5FQnlGN21nZFc3Ky93YVpWODZJenREVnlEMG53RlR6OUNV?=
 =?utf-8?B?d2JtWUFHazd5SGFtZ0tYc3BSeitEMWJnYlk1M2loSWN5ZTJoVGJwdTZqWUZ4?=
 =?utf-8?B?SjVVR2lnQmtHY0cvZ1hWUCtaUDcwbFJLVmpFZTFHUVNLYi85R2tjSDVsdXJP?=
 =?utf-8?B?d01qeVY2MS9RYjNPWTBQaFlLZE1YR2IrS0JBb3dIcmRkZ2FnaVRLQzNtcldQ?=
 =?utf-8?B?aVBYWERoa1BtY1lFVHZMNXlhdHdNM005V05landVOG1tejlSYStQQ1g2UUVB?=
 =?utf-8?B?VEhqVUc4a0pNekxuSWdhUnJKSHBnQkNoUnZ0V201V2tNY2JnMVdTcUY5S1E5?=
 =?utf-8?B?S21hZUVYaVU3NGVpTk5NZWZNZ3cySW1xYzhreExHaTYyTENla0NYUFFGTHFk?=
 =?utf-8?B?VDRMM1drelpvbmFldEZ0R1BOSkkwVmg1bVkva1RFcUMyejR1WlJOV0JMaTNs?=
 =?utf-8?B?RTRQa0RmL2xUQ3BjU3RQVG9EemZFY3FQWTdwSTg0L1lQM1NqVS81OUFsajRO?=
 =?utf-8?B?amwzS0RDb04wbDFTckVKemxyTXRidVBEZyt1b1dXcE5BRVBQMm1LVDVTdjZY?=
 =?utf-8?B?aE5nNzFRMlpodTg5VDhtRnBKK2hqN2U3LzBaTmVrVmpWVHpRcnF2VTZzWFVv?=
 =?utf-8?B?blJsWjh4Q3hHTGVuRFNaem5lQko0QTJlU0MyOVVxT2x0ckY5K2VpY0hzQkVa?=
 =?utf-8?B?cFBmZ05Kb1ZSVHl1azhMcW1nS2ZYK3ZmU0ZBbWlWRzhSMVVYMnozdEV6R3hs?=
 =?utf-8?B?blFxempGMWlrQmJMaHZVRW40anArakVFMUpXWlNnMGdQekRtSTNnRG5Ub1hm?=
 =?utf-8?B?R0ZEOG5XU1Q4ZEZlNnFsY2RJeit1VVV3M3Bjb2NCYlJJUmlnWVUzclZIbThE?=
 =?utf-8?B?S0c0Q3pYYlByQXZSbEFOQ0RSZlpEL2JlVTlVVVFKZFBYekhhUkVDSlBsTFJ4?=
 =?utf-8?B?dVVwYzN5QXJLZ2hMaFllWE5MKzB1SzMyUVVyT1F1RVZvTkFSOEl3U0w1SnQz?=
 =?utf-8?B?T3lsaDBaT3Q5RXM5VnpqOXQraHNFZFJGM3lscjlBZmZXb0NUbGkwdVR6dzJ3?=
 =?utf-8?B?QkpNaWhlZEp3NWJKMXpnWnVIM2VtUWhud3Fqa1dDMXhTelBvL1lubEZkZ0Y2?=
 =?utf-8?B?UWpBMjNMTTFQNzQ5UnVXYTVjaDdxcno2YTl1KzdFNm1ON3VlQVhVM1RTUVJ6?=
 =?utf-8?B?UUU2cDhTa09HSWFHUXpaVXFFQVE4VXVtbFhCM2l2VWxzWWp3WnE2QVhMK3VG?=
 =?utf-8?B?YVhacW9Vb2pPaktsOXo2ZTkydk93OXRqMHdpcG5RREgvTzQxdjNHYmdKVjd4?=
 =?utf-8?B?bEEyVnBhais1R1hpZktER1p4WnZCdTdudlBrZk1xZVgrRTJ4K2M2T09ackRH?=
 =?utf-8?B?Wjd3ckNIbVUyRW80S0dYWkFtZDE1clZQZi8rTFRDeitLNlMzMEVWMXRlaFkv?=
 =?utf-8?B?dVFOQnE1TFFBWmFnUXMwM0VxTjFiWk5TNEI1b05jQU1ZTUhzM1VVOVJnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(1800799022)(366014)(376012)(4022899007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Wno4dmRjaG42eERvM3pNTzA3VjRSOFY5bFpwakRTVitsYmc0YndBTEtZeTc5?=
 =?utf-8?B?NkZHQ0x5QWtkMytURW40THpNOUlGVjNYZ3p3QXBVM3FsRlhrNXBJSmtLQkxJ?=
 =?utf-8?B?MHJocnF3L1ZYb2EwL0tyNmVzQXZQOUVkOVhUd1AwM1c0QkRFZkZsQTVCZUlX?=
 =?utf-8?B?MC9makR5ZVQ1SWVEd2MvdVAwSXRqTWxPaEkzSDREUXNUdFhDZ0d3aVQ1NUlU?=
 =?utf-8?B?QW5wZGhWTUFETG41c3BoOGR0T3pwL3ZWWFBnN1lBb0hPbGFJcDlSL2hxQmFw?=
 =?utf-8?B?eGlkUmZWTmNSV0xxSUIrTzZGYXhoa29PZGljOU5XSk9JNHo4ejlqN0tFaE5a?=
 =?utf-8?B?eDUwSTBuZ0YxMkp6VzVOc21GNUNLTjl4N3kvcGpoaEFKMHJWakFqSTY3cUVv?=
 =?utf-8?B?aU8vTTdpRWNlYkVkWXJieUlPajlEa2lwMms2cC9zT04vMjNoNzY5YUdCSHNT?=
 =?utf-8?B?TmdLVjhEaXFUcTZpYXFEeWg0eTJ3RkowbTJ4bkJ6MUxaMTVIMlc0MlZmV01G?=
 =?utf-8?B?OUc1OHJLTWI5Q29reFZyWldvZFF3d3dlSUdORnROTnFBbzlNazNRUTFUeDVo?=
 =?utf-8?B?QWdscHI3Z3RrK0ZMakVMN2JhalFkYTBrbVYwcm1WVEVvNVRhZEFuNTFvNkVi?=
 =?utf-8?B?Z2ZYbGdtMjBIdlZleUxHQVVlcDh4aThSMm9TMHBrSDE4NTVhVWQ3d2dDNXVl?=
 =?utf-8?B?YVVmZ2FHSS82MHZYdEo0QjVnRHpPVjczRXdWT3M0Rjh0YXh4SVFqaFR6UWgw?=
 =?utf-8?B?Q3pFN1IvdFp6YXhyUWZrVEFBQkM1UXdraHRDb2JKL1JIS243NkZzeXAvZVhr?=
 =?utf-8?B?ZjFLMHZBQ2JKZnNPdytnZmc2WngxSENSZEV6NUIyanBSOEFiSHNjUzhjekxI?=
 =?utf-8?B?elJKTkpIbVRlUmRWZ21NZE1USzRrWjBmZkFaUHhIeXRYRHU4Mzg3MVZIeGg5?=
 =?utf-8?B?QWxRdnVFd0xuUUtNYzk3VVlicFcyQVhRVWVXZGN0QmMxVEVVM2gyb1hVTWlF?=
 =?utf-8?B?a0x3c0drOWs4bWhxRXQ3ZzFBOTVBQ1JadWE1WmpLVDlMZ3I4RXd4eitON0NV?=
 =?utf-8?B?RDBLZ3pZYkUrM1RDRjkvMElCVnk2NVZ0MzJLb2p6TUpPNHBuS2pPWktqY0Vw?=
 =?utf-8?B?bENtSEdUWnFtR0IvQjJ0WFN6QzVpRUc2WVdZQ05ZYjBnNi96c0txUXVqaFAx?=
 =?utf-8?B?RlFCQUdmZ0YwTllBMFozeVVkNllmdmt4aHBFUkxYS0o2ejc4MDA5U0NzV0FO?=
 =?utf-8?B?dWtzRzVyd2xyb2RwTUFvNDh5YXNJM0NhSDBVc2oyWDZxMkppWlRUbUtKV3p5?=
 =?utf-8?B?KzVDUDQveTJ2MWhETm5aM0oxZmdLbm9Zbm9lZDBHekpHMGVncG9aYzdMMHlX?=
 =?utf-8?B?OU5PS0VwclRxN2F3RWdELzdXM1h1NG1EMXlYa1N6RFVLd05mTEJkTzBUZFZX?=
 =?utf-8?B?Zk1teXFuSUdpZkFYdXlwU0NlalRmNFZpSGxla1pYR0RlT0hHNDJIeEt2SzRM?=
 =?utf-8?B?dnpydHdxUFY4SUdFTW8vbHBGQTFkenlVUVVmSktDdnVFUXJEU2JPS2ZoRk5F?=
 =?utf-8?B?ckRxVm8xcnJlK1BJYWlCQytGcVp0ZkFEWlE1Q3FFK1ZtNlpRSWszcW90bkJC?=
 =?utf-8?B?ZVl4NlNUeFJmWit5YUpIbnZGU2ZZYXFjcXYvUzJlSm1VS1FtNjUzZGhmWUw0?=
 =?utf-8?B?Z1F1VzhISlEvTGxOaVdMRStmK2tscEdoZGlJWE5sQ2JrcFpkbjd0d3ZyK1JL?=
 =?utf-8?B?Y0lYTSsxTGJtRGxxeGNncXJsUGlRSGc4aDQ2MGNFQUk0OUF6K3JES2FQSmhT?=
 =?utf-8?B?amhibExPNW9FM0NPRE5KclZxTkYraW5IR0gxK0ZMNStRRWV5Nlc5NHpVM1gr?=
 =?utf-8?B?TnNYYmVvK3JBTGZaeVAzRTU1L0QrUGo5eXkzT1J4VVBjdHlzdmhMdnlDTHhF?=
 =?utf-8?B?c1VJQlR6Mkt3aEpTUTdaVFBpMFhYdjloQnY4eVJuMVJvTmZlMkwwQXF1OU1O?=
 =?utf-8?B?cWsyL0t1ZUFsUHFkZ041OHdwZERkY01aQ1NJL285anRZM3BuZ1plK3Z0c3h6?=
 =?utf-8?B?MHQranRoVVhiK091Z2NOMERPdGlGZTZTaVhUZUR3UXJBblVmbXNMLytIaWs5?=
 =?utf-8?B?R0lON09Lc2NTVStYRmUxNnlMNFZndVJjNENCaHNxSmI2OFlmcjNKLzU0TlB2?=
 =?utf-8?B?VUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da6e817c-e4c6-406f-151d-08dc962300d8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 21:00:26.3297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PDP8bm9bwByAvP8UV4pcEDUiMKm6ykIxGPEiNXfqbq6EQZB4qIoR8imsU6PRbV/Y0YzxBhxAGaerx7IOIdiz8eahzjb1bTxIR8n8Iasz8iU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8663
X-Proofpoint-GUID: LIrJ2BhgH9OMw6ZfK6_9lbKqTcrsp9MF
X-Proofpoint-ORIG-GUID: PjkcZeC_MF2izWVzZx7VlY0eLr6MSsrt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2406260154
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Jun 2024 21:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111116

--------------AuOtIQ5CwNjSQAc0oOhWmxXV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45Q6jS0x031526

On 2024-06-25 12:52 p.m., Khem Raj wrote:
> Thanks Randy, We need to find more such recipes and purge them


Yes, I'll be working on that a bit over the coming weeks.
In case anyone wants to join in the culling, err fun, below are the=20
filters to look for old recipes
along with comments on my plans for the older recipes in the meta-oe=20
layer of the meta-openembedded repo.

Removal summary for meta-oe layer:

recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb
recipes-devtools/json-spirit/json-spirit_4.08.bb
recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb
recipes-multimedia/xsp/xsp_1.0.0-8.bb

Any objections?

There isn't as much to remove as I hoped for.


../Randy


$ cd ../meta-openembedded.git

$ for i in `ls -d meta-*`; do \
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd $i; \
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git ls-tree -r --name-only HEAD | rg bb$ =
| while read filename; do \
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "$(git log -=
1 --format=3D"%ad" -- $filename) $filename"; \

 =C2=A0=C2=A0=C2=A0=C2=A0 done | \
 =C2=A0=C2=A0=C2=A0=C2=A0 cut -d" " -f 5- | sort -n | tee /tmp/$i.log; cd=
 -; \

done

$ egrep "^201|2020" /tmp/meta-* | Randy to add meta-oe comments

/tmp/meta-filesystems.log:2020 recipes-support/physfs/physfs_3.0.2.bb
/tmp/meta-gnome.log:2019 recipes-support/ibus/ibus-native.bb
/tmp/meta-initramfs.log:2020=20
recipes-core/images/initramfs-kexecboot-klibc-image.bb
/tmp/meta-initramfs.log:2020 recipes-core/images/meta-initramfs-image.bb
/tmp/meta-multimedia.log:2015=20
recipes-multimedia/opencore-amr/vo-aacenc_0.1.3.bb
/tmp/meta-multimedia.log:2015=20
recipes-multimedia/opencore-amr/vo-amrwbenc_0.1.3.bb
/tmp/meta-multimedia.log:2019 recipes-multimedia/juce/projucer_git.bb
/tmp/meta-multimedia.log:2020 recipes-multimedia/opusfile/opusfile_0.12.b=
b
/tmp/meta-networking.log:2012 recipes-support/tunctl/tunctl_1.5.bb
/tmp/meta-networking.log:2013=20
recipes-support/libmemcached/libmemcached_1.0.7.bb
/tmp/meta-networking.log:2016 recipes-support/ssmping/ssmping_0.9.1.bb
/tmp/meta-networking.log:2017=20
recipes-support/libmemcached/libmemcached_1.0.18.bb
/tmp/meta-networking.log:2018 recipes-support/netcat/netcat-openbsd_1.195=
.bb
/tmp/meta-networking.log:2020=20
recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb

Randy's meta-oe list of old packages and comments:

# remove - queued
/tmp/meta-oe.log:2015=20
recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb

# keep, update
/tmp/meta-oe.log:2016 recipes-devtools/dmalloc/dmalloc_5.5.2.bb

# keep update directfb2 ?
/tmp/meta-oe.log:2016 recipes-graphics/directfb/directfb_1.7.7.bb

# Update https://github.com/compuphase/minIni/tags
/tmp/meta-oe.log:2016 recipes-support/minini/minini_1.2.b.bb

# Keep? Need more analysis
/tmp/meta-oe.log:2017 recipes-extended/libexecinfo/libexecinfo_1.1.bb

# 4 hits:=20
https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Ddep=
ends%3Alibmng
# update?
/tmp/meta-oe.log:2017 recipes-graphics/libmng/libmng_2.0.3.bb

# old, slow? -> remove
/tmp/meta-oe.log:2018 recipes-devtools/json-spirit/json-spirit_4.08.bb

# no users -> remove?
/tmp/meta-oe.log:2018=20
recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb

# update to 1.1.1 from 20 months ago
/tmp/meta-oe.log:2018 recipes-graphics/xorg-app/bdftopcf_1.1.bb


# stable benchmark tool -> keep?
/tmp/meta-oe.log:2019 recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb

# keep?
/tmp/meta-oe.log:2019 recipes-core/emlog/kernel-module-emlog_git.bb

# keep. layer on logging - maintained rsyslog dev
/tmp/meta-oe.log:2019 recipes-extended/liblogging/liblogging_1.0.6.bb

# library that uses Freetype2 to simplify rendering fonts in OpenGL=20
applications.
# 3 dependencies in other layers:=20
https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Ddep=
ends%3Aftgl
#=C2=A0 so keep
/tmp/meta-oe.log:2019 recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb


# remove: X Server Nokia 770 extensions library
/tmp/meta-oe.log:2019 recipes-multimedia/xsp/xsp_1.0.0-8.bb

# unchanged for > 10 years:=20
https://repo.or.cz/libtar.git/shortlog/refs/heads/master
# libreport depends on it so keep
/tmp/meta-oe.log:2019 recipes-support/libtar/libtar_1.2.20.bb

# I can't bring myself to remove the cscope recipe!
/tmp/meta-oe.log:2020 recipes-devtools/cscope/cscope_15.9.bb

# keep. upstream still active (2023): https://github.com/dynup/kpatch/tag=
s
/tmp/meta-oe.log:2020 recipes-kernel/kpatch/kpatch_git.bb

# keep. upstream still maintained:=20
https://gitlab.xiph.org/xiph/libopusenc/-/commits/master/?ref_type=3DHEAD=
S
/tmp/meta-oe.log:2020 recipes-multimedia/libopusenc/libopusenc_0.2.1.bb

# keep. font.
/tmp/meta-oe.log:2021 recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.=
bb
# keep. font.
/tmp/meta-oe.log:2023 recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb


/tmp/meta-python.log:2017=20
recipes-devtools/python/python3-django-south_1.0.2.bb
/tmp/meta-python.log:2017=20
recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb
/tmp/meta-python.log:2017=20
recipes-devtools/python/python3-flask-xstatic_0.0.1.bb
/tmp/meta-python.log:2018=20
recipes-devtools/python/python3-flask-sijax_0.4.1.bb
/tmp/meta-python.log:2020 recipes-devtools/python/python3-asciitree_0.3.3=
.bb
/tmp/meta-python.log:2020 recipes-devtools/python/python3-docopt_0.6.2.bb
/tmp/meta-python.log:2020=20
recipes-devtools/python/python3-ipaddress_1.0.23.bb
/tmp/meta-python.log:2020=20
recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb
/tmp/meta-python.log:2020 recipes-devtools/python/python3-libconf_2.0.1.b=
b
/tmp/meta-python.log:2020=20
recipes-devtools/python/python3-pathtools3_0.2.1.bb
/tmp/meta-python.log:2020 recipes-devtools/python/python3-sijax_0.3.2.bb
/tmp/meta-python.log:2020 recipes-devtools/python/python3-speaklater_1.3.=
bb
/tmp/meta-python.log:2020=20
recipes-devtools/python/python3-tinyrecord_0.2.0.bb
/tmp/meta-python.log:2020 recipes-devtools/python/python3-visitor_0.1.3.b=
b
/tmp/meta-webserver.log:2020 recipes-support/fcgiwrap/fcgiwrap_git.bb


I'll continue with cleaning up old recipes in meta-oe so if someone wants=
 to
look at the other layers, please reply here so that we don't have two=20
people doing the
same work.


I already locally removed liblinebreak. It's unused but if people want=20
it they should add libunibreak
as I'll explain in my commit log.

> On Tue, Jun 25, 2024 at 9:20=E2=80=AFAM Randy MacLeod via
> lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org>  wrote:
>> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>>
>> libee had been used by rsyslog but the library never relly panned out.
>>
>> It has been declared to be obsolete:
>>     Early versions of rsyslog and liblognorm used it for representing =
structured content.
>>     However, this is long gone. We do not know of any other user. So l=
ibee should be of
>>     no further interest and is provided here solely for historical rea=
sons.
>> https://github.com/rsyslog/libee
>>
>> Also remove references to libee in:
>>     meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>>     meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>>
>> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
>> ---
>>   .../include/ptest-packagelists-meta-oe.inc    |  1 -
>>   .../packagegroups/packagegroup-meta-oe.bb     |  2 -
>>   meta-oe/recipes-support/libee/libee.inc       | 39 -----------------=
--
>>   meta-oe/recipes-support/libee/libee/ezapi1.sh | 14 -------
>>   .../libee/libee/libee-parallel-make.patch     | 20 ----------
>>   meta-oe/recipes-support/libee/libee/run-ptest |  3 --
>>   meta-oe/recipes-support/libee/libee_0.4.1.bb  |  4 --
>>   7 files changed, 83 deletions(-)
>>   delete mode 100644 meta-oe/recipes-support/libee/libee.inc
>>   delete mode 100755 meta-oe/recipes-support/libee/libee/ezapi1.sh
>>   delete mode 100644 meta-oe/recipes-support/libee/libee/libee-paralle=
l-make.patch
>>   delete mode 100755 meta-oe/recipes-support/libee/libee/run-ptest
>>   delete mode 100644 meta-oe/recipes-support/libee/libee_0.4.1.bb
>>
>> diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/met=
a-oe/conf/include/ptest-packagelists-meta-oe.inc
>> index eaa86c411..01bf975a1 100644
>> --- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>> +++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
>> @@ -17,7 +17,6 @@ PTESTS_FAST_META_OE =3D "\
>>       jq \
>>       leveldb \
>>       libcereal \
>> -    libee \
>>       libgpiod \
>>       libio-pty-perl \
>>       libmanette \
>> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.b=
b b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>> index bc40f56b9..e11afcd4e 100644
>> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
>> @@ -811,7 +811,6 @@ RDEPENDS:packagegroup-meta-oe-support =3D"\
>>       libcanberra \
>>       libssh \
>>       libssh2 \
>> -    libee \
>>       libusbgx-config \
>>       libusbgx \
>>       lockdev \
>> @@ -972,7 +971,6 @@ RDEPENDS:packagegroup-meta-oe-ptest-packages =3D "=
\
>>       oprofile-ptest \
>>       libteam-ptest \
>>       uthash-ptest \
>> -    libee-ptest \
>>       poco-ptest \
>>       cmocka-ptest \
>>       minicoredumper-ptest \
>> diff --git a/meta-oe/recipes-support/libee/libee.inc b/meta-oe/recipes=
-support/libee/libee.inc
>> deleted file mode 100644
>> index 592109b95..000000000
>> --- a/meta-oe/recipes-support/libee/libee.inc
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -SUMMARY =3D "An Event Expression Library inspired by CEE"
>> -DESCRIPTION =3D "The core idea of libee is to provide a small \
>> -but hopefully convenient API layer above the CEE standard."
>> -
>> -HOMEPAGE =3D"http://www.libee.org"
>> -SECTION =3D "base"
>> -
>> -LICENSE =3D "LGPL-2.1-or-later"
>> -LIC_FILES_CHKSUM =3D"file://COPYING;md5=3D1c2687de35e36ba3b999136236a=
66cd6"
>> -
>> -SRC_URI =3D"http://www.libee.org/download/files/download/${BPN}-${PV}=
.tar.gz\ -=20
>> file://libee-parallel-make.patch \ - file://run-ptest \ -=20
>> file://ezapi1.sh \ -"
>> -
>> -inherit autotools ptest pkgconfig
>> -
>> -DEPENDS +=3D "libestr"
>> -
>> -PACKAGECONFIG ??=3D"${@bb.utils.contains('DISTRO_FEATURES', 'ptest', =
'testbench', '', d)}"
>> -
>> -PACKAGECONFIG[debug] =3D "--enable-debug,--disable-debug,,"
>> -PACKAGECONFIG[testbench] =3D "--enable-testbench,--disable-testbench,=
,"
>> -
>> -TESTDIR =3D "tests"
>> -
>> -# We presume the tests we are going to install so just build them dir=
ectly.
>> -#
>> -do_compile_ptest() {
>> -    oe_runmake -C ${TESTDIR} genfile ezapi1
>> -}
>> -
>> -do_install_ptest() {
>> -    install -d ${D}${PTEST_PATH}
>> -    install -m 0755 ${B}/${TESTDIR}/genfile ${D}${PTEST_PATH}
>> -    install -m 0755 ${B}/${TESTDIR}/.libs/ezapi1 ${D}${PTEST_PATH}
>> -    install -m 0755 ${UNPACKDIR}/ezapi1.sh ${D}${PTEST_PATH}
>> -}
>> diff --git a/meta-oe/recipes-support/libee/libee/ezapi1.sh b/meta-oe/r=
ecipes-support/libee/libee/ezapi1.sh
>> deleted file mode 100755
>> index e9db5e614..000000000
>> --- a/meta-oe/recipes-support/libee/libee/ezapi1.sh
>> +++ /dev/null
>> @@ -1,14 +0,0 @@
>> -#!/bin/sh
>> -#
>> -echo ----------------------------------------------------------------=
-----------
>> -echo A very basic test for the event class
>> -echo ----------------------------------------------------------------=
-----------
>> -rm -f infile
>> -./genfile 100 > infile
>> -./ezapi1 -iinfile
>> -if [ $? -ne 0 ] ; then
>> -   echo "FAIL: $0"
>> -   exit 1
>> -fi
>> -echo "PASS: $0"
>> -rm -f infile
>> diff --git a/meta-oe/recipes-support/libee/libee/libee-parallel-make.p=
atch b/meta-oe/recipes-support/libee/libee/libee-parallel-make.patch
>> deleted file mode 100644
>> index 8bb23aafc..000000000
>> --- a/meta-oe/recipes-support/libee/libee/libee-parallel-make.patch
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -fix parallel compiling problem
>> -
>> -without specifying libee_convert_DEPENDENCIES =3D libee.la, libee_con=
vert
>> -can't find libee.la when linking as libee is not generated yet.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Yao Zhao<yao.zhao@windriver.com>
>> ----
>> -diff --git a/src/Makefile.am b/src/Makefile.am
>> -index 08aaa9e..f0c78f7 100644
>> ---- a/src/Makefile.am
>> -+++ b/src/Makefile.am
>> -@@ -46,5 +46,6 @@ libee_la_LDFLAGS =3D -version-info 0:0:0
>> - libee_convert_SOURCES =3D convert.c
>> - libee_convert_CPPFLAGS =3D  -I$(top_srcdir) $(LIBEE_CFLAGS) $(LIBEST=
R_CFLAGS) $(LIBXML2_CFLAGS)
>> - libee_convert_LDADD =3D $(LIBEE_LIBS) $(LIBXML2_LIBS) $(LIBESTR_LIBS=
)
>> -+libee_convert_DEPENDENCIES =3D libee.la
>> -
>> - include_HEADERS =3D
>> diff --git a/meta-oe/recipes-support/libee/libee/run-ptest b/meta-oe/r=
ecipes-support/libee/libee/run-ptest
>> deleted file mode 100755
>> index 3cb660764..000000000
>> --- a/meta-oe/recipes-support/libee/libee/run-ptest
>> +++ /dev/null
>> @@ -1,3 +0,0 @@
>> -#!/bin/sh
>> -#
>> -./ezapi1.sh
>> diff --git a/meta-oe/recipes-support/libee/libee_0.4.1.bb b/meta-oe/re=
cipes-support/libee/libee_0.4.1.bb
>> deleted file mode 100644
>> index ef2c20db5..000000000
>> --- a/meta-oe/recipes-support/libee/libee_0.4.1.bb
>> +++ /dev/null
>> @@ -1,4 +0,0 @@
>> -require ${BPN}.inc
>> -
>> -SRC_URI[md5sum] =3D "7bbf4160876c12db6193c06e2badedb2"
>> -SRC_URI[sha256sum] =3D "c0dac01938593deee06c3d161e4eda4ecc0fd7317e132=
1bd96e301aceb7fb027"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#111077):https://lists.openembedded.org/g/openembed=
ded-devel/message/111077
>> Mute This Topic:https://lists.openembedded.org/mt/106872902/1997914
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------AuOtIQ5CwNjSQAc0oOhWmxXV
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45Q6jS0x031526

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2024-06-25 12:52 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqreoZ4rtcSL0ODP2Hn4uXRs8=
gMzQsg8dkOeUJh=3DtMF+g@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">Thanks Randy, We need to fin=
d more such recipes and purge them</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Yes, I'll be working on that a bit over the coming weeks.<br>
      In case anyone wants to join in the culling, err fun, below are
      the filters to look for old recipes<br>
      along with comments on my plans for the older recipes in the
      meta-oe layer of the meta-openembedded repo.</p>
    <p>Removal summary for meta-oe layer:<br>
    </p>
    <p>recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb<br>
      recipes-devtools/json-spirit/json-spirit_4.08.bb<br>
      recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb<br>
      recipes-multimedia/xsp/xsp_1.0.0-8.bb<br>
      <br>
      Any objections?<br>
    </p>
    <p>There isn't as much to remove as I hoped for.</p>
    <p><br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
      $ cd ../meta-openembedded.git<br>
      <br>
      $ for i in `ls -d meta-*`; do \<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cd $i; \<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; git ls-tree -r --name-only HEAD | rg=
 bb$ | while read
      filename; do \<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &quot;$=
(git log -1 --format=3D&quot;%ad&quot; -- $filename)
      $filename&quot;; \</p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp; done | \<br>
      &nbsp;&nbsp;&nbsp;&nbsp; cut -d&quot; &quot; -f 5- | sort -n | tee =
/tmp/$i.log; cd -; \</p>
    <p>done<br>
    </p>
    <p>$ egrep &quot;^201|2020&quot; /tmp/meta-* | Randy to add meta-oe c=
omments<br>
    </p>
    <p>/tmp/meta-filesystems.log:2020
      recipes-support/physfs/physfs_3.0.2.bb<br>
      /tmp/meta-gnome.log:2019 recipes-support/ibus/ibus-native.bb<br>
      /tmp/meta-initramfs.log:2020
      recipes-core/images/initramfs-kexecboot-klibc-image.bb<br>
      /tmp/meta-initramfs.log:2020
      recipes-core/images/meta-initramfs-image.bb<br>
      /tmp/meta-multimedia.log:2015
      recipes-multimedia/opencore-amr/vo-aacenc_0.1.3.bb<br>
      /tmp/meta-multimedia.log:2015
      recipes-multimedia/opencore-amr/vo-amrwbenc_0.1.3.bb<br>
      /tmp/meta-multimedia.log:2019
      recipes-multimedia/juce/projucer_git.bb<br>
      /tmp/meta-multimedia.log:2020
      recipes-multimedia/opusfile/opusfile_0.12.bb<br>
      /tmp/meta-networking.log:2012 recipes-support/tunctl/tunctl_1.5.bb<=
br>
      /tmp/meta-networking.log:2013
      recipes-support/libmemcached/libmemcached_1.0.7.bb<br>
      /tmp/meta-networking.log:2016
      recipes-support/ssmping/ssmping_0.9.1.bb<br>
      /tmp/meta-networking.log:2017
      recipes-support/libmemcached/libmemcached_1.0.18.bb<br>
      /tmp/meta-networking.log:2018
      recipes-support/netcat/netcat-openbsd_1.195.bb<br>
      /tmp/meta-networking.log:2020
      recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb</p>
    <p>Randy's meta-oe list of old packages and comments:<br>
      <br>
      # remove - queued<br>
      /tmp/meta-oe.log:2015
      recipes-extended/sblim-cmpi-devel/sblim-cmpi-devel_2.0.3.bb<br>
      <br>
      # keep, update<br>
      /tmp/meta-oe.log:2016 recipes-devtools/dmalloc/dmalloc_5.5.2.bb<br>
      <br>
      # keep update directfb2 ?<br>
      /tmp/meta-oe.log:2016 recipes-graphics/directfb/directfb_1.7.7.bb&n=
bsp;
      <br>
      <br>
      # Update <a class=3D"moz-txt-link-freetext" href=3D"https://github.=
com/compuphase/minIni/tags">https://github.com/compuphase/minIni/tags</a>=
<br>
      /tmp/meta-oe.log:2016 recipes-support/minini/minini_1.2.b.bb&nbsp;&=
nbsp; <br>
      <br>
      # Keep? Need more analysis<br>
      /tmp/meta-oe.log:2017
      recipes-extended/libexecinfo/libexecinfo_1.1.bb <br>
    </p>
    <p># 4 hits:
<a class=3D"moz-txt-link-freetext" href=3D"https://layers.openembedded.or=
g/layerindex/branch/master/recipes/?q=3Ddepends%3Alibmng">https://layers.=
openembedded.org/layerindex/branch/master/recipes/?q=3Ddepends%3Alibmng</=
a><br>
      # update?<br>
      /tmp/meta-oe.log:2017 recipes-graphics/libmng/libmng_2.0.3.bb</p>
    <p># old, slow? -&gt; remove<br>
      /tmp/meta-oe.log:2018
      recipes-devtools/json-spirit/json-spirit_4.08.bb<br>
    </p>
    <p># no users -&gt; remove?<br>
      /tmp/meta-oe.log:2018
      recipes-extended/sblim-sfc-common/sblim-sfc-common_1.0.1.bb<br>
      <br>
      # update to 1.1.1 from 20 months ago<br>
      /tmp/meta-oe.log:2018 recipes-graphics/xorg-app/bdftopcf_1.1.bb</p>
    <p><br>
      # stable benchmark tool -&gt; keep?<br>
      /tmp/meta-oe.log:2019
      recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb<br>
    </p>
    <p># keep?<br>
      /tmp/meta-oe.log:2019
      recipes-core/emlog/kernel-module-emlog_git.bb<br>
      <br>
      # keep. layer on logging - maintained rsyslog dev<br>
      /tmp/meta-oe.log:2019
      recipes-extended/liblogging/liblogging_1.0.6.bb<br>
      <br>
      # library that uses Freetype2 to simplify rendering fonts in
      OpenGL applications.<br>
      # 3 dependencies in other layers:
<a class=3D"moz-txt-link-freetext" href=3D"https://layers.openembedded.or=
g/layerindex/branch/master/recipes/?q=3Ddepends%3Aftgl">https://layers.op=
enembedded.org/layerindex/branch/master/recipes/?q=3Ddepends%3Aftgl</a><b=
r>
      #&nbsp; so keep<br>
      /tmp/meta-oe.log:2019 recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb</p>
    <p><br>
      # remove: X Server Nokia 770 extensions library<br>
      /tmp/meta-oe.log:2019 recipes-multimedia/xsp/xsp_1.0.0-8.bb<br>
      <br>
      # unchanged for &gt; 10 years:
      <a class=3D"moz-txt-link-freetext" href=3D"https://repo.or.cz/libta=
r.git/shortlog/refs/heads/master">https://repo.or.cz/libtar.git/shortlog/=
refs/heads/master</a><br>
      # libreport depends on it so keep<br>
      /tmp/meta-oe.log:2019 recipes-support/libtar/libtar_1.2.20.bb</p>
    <p># I can't bring myself to remove the cscope recipe!<br>
      /tmp/meta-oe.log:2020 recipes-devtools/cscope/cscope_15.9.bb</p>
    <p># keep. upstream still active (2023):
      <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/dynup=
/kpatch/tags">https://github.com/dynup/kpatch/tags</a><br>
      /tmp/meta-oe.log:2020 recipes-kernel/kpatch/kpatch_git.bb</p>
    <p># keep. upstream still maintained:
      <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.xiph.org/=
xiph/libopusenc/-/commits/master/?ref_type=3DHEADS">https://gitlab.xiph.o=
rg/xiph/libopusenc/-/commits/master/?ref_type=3DHEADS</a><br>
      /tmp/meta-oe.log:2020
      recipes-multimedia/libopusenc/libopusenc_0.2.1.bb</p>
    <p># keep. font.<br>
      /tmp/meta-oe.log:2021
      recipes-graphics/ttf-fonts/ttf-noto-emoji_20200916.bb<br>
      # keep. font.<br>
      /tmp/meta-oe.log:2023
      recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb</p>
    <p><br>
    </p>
    <p>/tmp/meta-python.log:2017
      recipes-devtools/python/python3-django-south_1.0.2.bb<br>
      /tmp/meta-python.log:2017
      recipes-devtools/python/python3-flask-bootstrap_3.3.7.1.bb<br>
      /tmp/meta-python.log:2017
      recipes-devtools/python/python3-flask-xstatic_0.0.1.bb<br>
      /tmp/meta-python.log:2018
      recipes-devtools/python/python3-flask-sijax_0.4.1.bb<br>
      /tmp/meta-python.log:2020
      recipes-devtools/python/python3-asciitree_0.3.3.bb<br>
      /tmp/meta-python.log:2020
      recipes-devtools/python/python3-docopt_0.6.2.bb<br>
      /tmp/meta-python.log:2020
      recipes-devtools/python/python3-ipaddress_1.0.23.bb<br>
      /tmp/meta-python.log:2020
      recipes-devtools/python/python3-keras-preprocessing_1.1.2.bb<br>
      /tmp/meta-python.log:2020
      recipes-devtools/python/python3-libconf_2.0.1.bb<br>
      /tmp/meta-python.log:2020
      recipes-devtools/python/python3-pathtools3_0.2.1.bb<br>
      /tmp/meta-python.log:2020
      recipes-devtools/python/python3-sijax_0.3.2.bb<br>
      /tmp/meta-python.log:2020
      recipes-devtools/python/python3-speaklater_1.3.bb<br>
      /tmp/meta-python.log:2020
      recipes-devtools/python/python3-tinyrecord_0.2.0.bb<br>
      /tmp/meta-python.log:2020
      recipes-devtools/python/python3-visitor_0.1.3.bb<br>
      /tmp/meta-webserver.log:2020
      recipes-support/fcgiwrap/fcgiwrap_git.bb<br>
    </p>
    <p><br>
    </p>
    <p>I'll continue with cleaning up old recipes in meta-oe so if
      someone wants to<br>
      look at the other layers, please reply here so that we don't have
      two people doing the<br>
      same work.</p>
    <p><br>
    </p>
    <p>I already locally removed liblinebreak. It's unused but if people
      want it they should add libunibreak<br>
      as I'll explain in my commit log.<br>
    </p>
    <span style=3D"white-space: pre-wrap">
</span>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqreoZ4rtcSL0ODP2Hn4uXRs8=
gMzQsg8dkOeUJh=3DtMF+g@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
On Tue, Jun 25, 2024 at 9:20=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy.macleod=3Dwindriv=
er.com@lists.openembedded.org">&lt;randy.macleod=3Dwindriver.com@lists.op=
enembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">From: Randy MacLeod <a cla=
ss=3D"moz-txt-link-rfc2396E" href=3D"mailto:Randy.MacLeod@windriver.com">=
&lt;Randy.MacLeod@windriver.com&gt;</a>

libee had been used by rsyslog but the library never relly panned out.

It has been declared to be obsolete:
   Early versions of rsyslog and liblognorm used it for representing stru=
ctured content.
   However, this is long gone. We do not know of any other user. So libee=
 should be of
   no further interest and is provided here solely for historical reasons.
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rsyslog/lib=
ee">https://github.com/rsyslog/libee</a>

Also remove references to libee in:
   meta-oe/conf/include/ptest-packagelists-meta-oe.inc
   meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb

Signed-off-by: Randy MacLeod <a class=3D"moz-txt-link-rfc2396E" href=3D"m=
ailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a=
>
---
 .../include/ptest-packagelists-meta-oe.inc    |  1 -
 .../packagegroups/packagegroup-meta-oe.bb     |  2 -
 meta-oe/recipes-support/libee/libee.inc       | 39 -------------------
 meta-oe/recipes-support/libee/libee/ezapi1.sh | 14 -------
 .../libee/libee/libee-parallel-make.patch     | 20 ----------
 meta-oe/recipes-support/libee/libee/run-ptest |  3 --
 meta-oe/recipes-support/libee/libee_0.4.1.bb  |  4 --
 7 files changed, 83 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libee/libee.inc
 delete mode 100755 meta-oe/recipes-support/libee/libee/ezapi1.sh
 delete mode 100644 meta-oe/recipes-support/libee/libee/libee-parallel-ma=
ke.patch
 delete mode 100755 meta-oe/recipes-support/libee/libee/run-ptest
 delete mode 100644 meta-oe/recipes-support/libee/libee_0.4.1.bb

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-o=
e/conf/include/ptest-packagelists-meta-oe.inc
index eaa86c411..01bf975a1 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -17,7 +17,6 @@ PTESTS_FAST_META_OE =3D &quot;\
     jq \
     leveldb \
     libcereal \
-    libee \
     libgpiod \
     libio-pty-perl \
     libmanette \
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index bc40f56b9..e11afcd4e 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -811,7 +811,6 @@ RDEPENDS:packagegroup-meta-oe-support =3D&quot;\
     libcanberra \
     libssh \
     libssh2 \
-    libee \
     libusbgx-config \
     libusbgx \
     lockdev \
@@ -972,7 +971,6 @@ RDEPENDS:packagegroup-meta-oe-ptest-packages =3D &quo=
t;\
     oprofile-ptest \
     libteam-ptest \
     uthash-ptest \
-    libee-ptest \
     poco-ptest \
     cmocka-ptest \
     minicoredumper-ptest \
diff --git a/meta-oe/recipes-support/libee/libee.inc b/meta-oe/recipes-su=
pport/libee/libee.inc
deleted file mode 100644
index 592109b95..000000000
--- a/meta-oe/recipes-support/libee/libee.inc
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY =3D &quot;An Event Expression Library inspired by CEE&quot;
-DESCRIPTION =3D &quot;The core idea of libee is to provide a small \
-but hopefully convenient API layer above the CEE standard.&quot;
-
-HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"http://www.libee=
.org">&quot;http://www.libee.org&quot;</a>
-SECTION =3D &quot;base&quot;
-
-LICENSE =3D &quot;LGPL-2.1-or-later&quot;
-LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"file://C=
OPYING;md5=3D1c2687de35e36ba3b999136236a66cd6">&quot;file://COPYING;md5=3D=
1c2687de35e36ba3b999136236a66cd6&quot;</a>
-
-SRC_URI =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"http://www.libee.=
org/download/files/download/${BPN}-${PV}.tar.gz\-file://libee-parallel-ma=
ke.patch\-file://run-ptest\-file://ezapi1.sh\-">&quot;http://www.libee.or=
g/download/files/download/${BPN}-${PV}.tar.gz\
-           file://libee-parallel-make.patch \
-           file://run-ptest \
-           file://ezapi1.sh \
-&quot;</a>
-
-inherit autotools ptest pkgconfig
-
-DEPENDS +=3D &quot;libestr&quot;
-
-PACKAGECONFIG ??=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${=
@bb.utils.contains('DISTRO_FEATURES','ptest','testbench','',d)}">&quot;${=
@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'testbench', '', d)}&quot;=
</a>
-
-PACKAGECONFIG[debug] =3D &quot;--enable-debug,--disable-debug,,&quot;
-PACKAGECONFIG[testbench] =3D &quot;--enable-testbench,--disable-testbenc=
h,,&quot;
-
-TESTDIR =3D &quot;tests&quot;
-
-# We presume the tests we are going to install so just build them direct=
ly.
-#
-do_compile_ptest() {
-    oe_runmake -C ${TESTDIR} genfile ezapi1
-}
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}
-    install -m 0755 ${B}/${TESTDIR}/genfile ${D}${PTEST_PATH}
-    install -m 0755 ${B}/${TESTDIR}/.libs/ezapi1 ${D}${PTEST_PATH}
-    install -m 0755 ${UNPACKDIR}/ezapi1.sh ${D}${PTEST_PATH}
-}
diff --git a/meta-oe/recipes-support/libee/libee/ezapi1.sh b/meta-oe/reci=
pes-support/libee/libee/ezapi1.sh
deleted file mode 100755
index e9db5e614..000000000
--- a/meta-oe/recipes-support/libee/libee/ezapi1.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/sh
-#
-echo -------------------------------------------------------------------=
--------
-echo A very basic test for the event class
-echo -------------------------------------------------------------------=
--------
-rm -f infile
-./genfile 100 &gt; infile
-./ezapi1 -iinfile
-if [ $? -ne 0 ] ; then
-   echo &quot;FAIL: $0&quot;
-   exit 1
-fi
-echo &quot;PASS: $0&quot;
-rm -f infile
diff --git a/meta-oe/recipes-support/libee/libee/libee-parallel-make.patc=
h b/meta-oe/recipes-support/libee/libee/libee-parallel-make.patch
deleted file mode 100644
index 8bb23aafc..000000000
--- a/meta-oe/recipes-support/libee/libee/libee-parallel-make.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-fix parallel compiling problem
-
-without specifying libee_convert_DEPENDENCIES =3D libee.la, libee_conver=
t
-can't find libee.la when linking as libee is not generated yet.
-
-Upstream-Status: Pending
-
-Signed-off-by: Yao Zhao <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:yao.zhao@windriver.com">&lt;yao.zhao@windriver.com&gt;</a>
----
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 08aaa9e..f0c78f7 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -46,5 +46,6 @@ libee_la_LDFLAGS =3D -version-info 0:0:0
- libee_convert_SOURCES =3D convert.c
- libee_convert_CPPFLAGS =3D  -I$(top_srcdir) $(LIBEE_CFLAGS) $(LIBESTR_C=
FLAGS) $(LIBXML2_CFLAGS)
- libee_convert_LDADD =3D $(LIBEE_LIBS) $(LIBXML2_LIBS) $(LIBESTR_LIBS)
-+libee_convert_DEPENDENCIES =3D libee.la
-
- include_HEADERS =3D
diff --git a/meta-oe/recipes-support/libee/libee/run-ptest b/meta-oe/reci=
pes-support/libee/libee/run-ptest
deleted file mode 100755
index 3cb660764..000000000
--- a/meta-oe/recipes-support/libee/libee/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-#
-./ezapi1.sh
diff --git a/meta-oe/recipes-support/libee/libee_0.4.1.bb b/meta-oe/recip=
es-support/libee/libee_0.4.1.bb
deleted file mode 100644
index ef2c20db5..000000000
--- a/meta-oe/recipes-support/libee/libee_0.4.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[md5sum] =3D &quot;7bbf4160876c12db6193c06e2badedb2&quot;
-SRC_URI[sha256sum] =3D &quot;c0dac01938593deee06c3d161e4eda4ecc0fd7317e1=
321bd96e301aceb7fb027&quot;
--
2.34.1


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#111077): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/111077">https:=
//lists.openembedded.org/g/openembedded-devel/message/111077</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/106872902/1997914">https://lists.openembedded.org/mt=
/106872902/1997914</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------AuOtIQ5CwNjSQAc0oOhWmxXV--

