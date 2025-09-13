Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 725D1CAC58E
	for <webhook@archiver.kernel.org>; Sat, 13 Sep 2025 15:00:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6969.1757775638215733753
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Sep 2025 08:00:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=dPFpIZ9H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13514825db=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58DEo2WQ627296
	for <openembedded-devel@lists.openembedded.org>; Sat, 13 Sep 2025 08:00:37 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=6vmUfpsnKShewma12bf2kFvMZAktyKFS22zcR4+k1m0=; b=dPFpIZ9H3Rjc
	oCApLfhuoJEtX0LgrADdFudKE3S5LWFoPkxJpAz6U8h9ehyDPeAEuWoRwrpU50Sb
	PNQGMThzYOsHPXcgXOOm6xZbSXYqk5ahMkjQ17mdH1xh4AFXUzsMCx7z7D9cchQG
	XG/m1E2QXHj3YYv2G0Q32thTjyRNSVsXjGWJ+oKgPu226laiWZ1pWwcrhj3usdsf
	eS5yiaXIE1lLxdcBcUUj5twlSR/nX4Vm8tpDdmNx9T3EQd4R/7uVe+27xIUBo1ki
	Sdel+ppXtwo9+Wi+4pOaMIKtn0vHjp2q072TLKVsWAZwChKqCU512q2AvPQqMzPn
	l6hTdgwUpw==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2079.outbound.protection.outlook.com [40.107.94.79])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4953w289pt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 13 Sep 2025 08:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sacDd7jXPv98uouHnIxhdMJLypy1wrV2xJ7x0ujUL8ghYd4BIvl0yYcqE5HWHWY/fFZ9l2UIupC3PBUJ7LQQkrHnWHk//nrkRCbVdWQUs3K2borK/poNRn2ZASQpFSrzUv8Uxt5bk2XRZpzFmKSwDypfc9tCecEkVbO+EQwfXWTvYKnBEBPoMK7nCyPw9zpFNDblysq0qMJmWaF9SlrYGAxuWbX+XEph7oIfSDDn9qAKazJwmLdHPDpfHPDPOmJLBMWlIdG+XtVIQSbQANGFECX0xAAhqwD3XXu5X7nnp4hUo0bpopKY7fkPe6w+AKmWTGNk3CtYR0qBXl3pr6QCXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6vmUfpsnKShewma12bf2kFvMZAktyKFS22zcR4+k1m0=;
 b=tJPE/HCJVKMeW0bd0v+8hMRNRq6c8x/jrz61jh7mS33RQa9+mojUxDHrLsBHMO6hHiUKwQh1bEJ6pyWLyfPPFV0UtFJQRAqIDU0FYy5YCiI4uqfzDUNAZk5DghCl3T1he0UTfvl60dGmW3et+ZUvFobC/S59Rz+jWbjVR26YyYXw0kDN5QAefNXrBasfe8VZ2ZyzSU2ie9QXDlU6TstldEcpDWJTYcTYvyXqjnISBxHBLG7Sr0rWF0QXwOppr+4ymWdqaWgsm5/W6Fo6HBadtNY9RqZzgFhH9pUSKpBcwyjhiRJ2mDVH0jHP4FviR3YHX0qSvFJWn/3VHd6vcBGTXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SN7PR11MB7538.namprd11.prod.outlook.com (2603:10b6:806:32b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Sat, 13 Sep
 2025 15:00:34 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9115.017; Sat, 13 Sep 2025
 15:00:34 +0000
Message-ID: <1abed89e-313f-4262-91bc-cb39409a83bb@windriver.com>
Date: Sat, 13 Sep 2025 23:00:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-openembedded][scarthgap][PATCH 1/1] python3-posix-ipc:
 upgrade 1.2.0 -> 1.3.0
To: openembedded-devel@lists.openembedded.org
References: <185D1E8A510461B6.31077@lists.openembedded.org>
Content-Language: en-US
From: "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>
In-Reply-To: <185D1E8A510461B6.31077@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0187.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::11) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SN7PR11MB7538:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f0545d-f384-490f-a5df-08ddf2d64a8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|4022899009|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cXdObVhwSXpIUUptY1A4aDAwbFhrbE5rWlNFQzRMZmZuYUlWNVRiRzQySW9q?=
 =?utf-8?B?QUpQRTY4amg2RE1OZ29lcG5acUZpWmZLNUQwbFBGRENyMHhDT0kzcDFXbFRl?=
 =?utf-8?B?SEdvZjZ5eUdUcFo4SWsrOVVQbm56aGp3Y1NDWFdtSnpDZHErMFkrTnpKQjdK?=
 =?utf-8?B?bFAxSmR4TG10ZlJRc1YrNEIyNHp6QVpJbnB1UW9TMlljZ2JmMXB1bzdUdi80?=
 =?utf-8?B?b251SlMrQ0VPQmlvdFJiK2pjVHVhMk54VlpqQk1BM3ZUMXp2N0JMbWVSVk9T?=
 =?utf-8?B?SjZ4RGUvdERXRUFZYzYzQVJEMUx5Qm1CMmxqNDdxNzhrK2YwZ1IzeVFVdmFC?=
 =?utf-8?B?ZDZqc0haYXZlUFFIcWxldFNBL2JGT1oxRzFkSVpkTnFhelE0WmpQcnFubFUy?=
 =?utf-8?B?KzNqdDUxVGppTUIrS01PRkhWMlZIRlM5ZG9zcjR2L0NibkoxWmx4bXJqN2VY?=
 =?utf-8?B?NlR5bExwODZRV1BFVm9oT3hsTGVROVJFbS9pZ1g1b0JjbVUrY0pJdk8zKzM1?=
 =?utf-8?B?VWdsQ3lJZkZySmdCNlRWQ2dMeVhVbVZVS1hicTRTbGxXM2VNZ3puZ2dRUHV3?=
 =?utf-8?B?azM1VXZ4UURrZ0dibWxZYlJHMkhVT0RYTm9odFNPM3dIc3RBdjFOTnlSVTJu?=
 =?utf-8?B?cnNUdytpNndDWUFlMklPbFluU2FjZGthTTd4OC92SEExVDFLaElkbjhGa1BR?=
 =?utf-8?B?WTUzcG15bUg4ZDd5dXRRTU9lUmJnb0QwQUphOWY5TjVDY0Rnd2MxWERiTklV?=
 =?utf-8?B?RGxOUElyRCtvYjNHMU5uSzE4Q0NyWit2ZGdXdHJqVEo5MUkzZzJWYTZIbTFG?=
 =?utf-8?B?M2pnVFVPRzVtbzJMSEpSbzJIcnFtTzRvVGN2Q2wxSTcxK1RRL1B6WC9ISFFa?=
 =?utf-8?B?cThGb1dIcURGZzZ5K0dOTis2MTBXdkdGcG5DSGl6YllKd3NzL1J0TWw3T1pn?=
 =?utf-8?B?TFJSaHI5TjErV2VzbzZVNVR0UnBBdGZSMVMvcmdhY2lEd2o0Qk5QL2xoV21T?=
 =?utf-8?B?N1gwbzJ6UVVnNm10dGhVQ3lYbmNJWmdBa1puMHoxVytzS0lzSGxyYnJXYVVX?=
 =?utf-8?B?MjdBczdxRmk0TzBRS25DY1N5Q2VJaU1KZkpScU90cS9NcXFDSjRSVnpIUWlE?=
 =?utf-8?B?ejF0UnN0UWdJbFJWU3A3U0xYRzFlK1FxWkMzUTliVGlPSmg2MC9TTVZteGZH?=
 =?utf-8?B?Q1BwaXYybkRjRnJJa0svNXZVNzliUnJMTEhIRmkxOXU1azJ5WWp6VnZ3L1h0?=
 =?utf-8?B?Rk5mT3pGVFRPSmFTUnJpcHVldVJ4bmVTaWZMbFg5MzIwdGdkd0NHNUp0NFc3?=
 =?utf-8?B?cGpCYUdnUmptYlBYTnhrdjQxVHpiVkxBa2pQVUdldmRVb0JlMmpxTGpBUE4r?=
 =?utf-8?B?ek9VbWZ4MGJETjVpWi85VFJ3WnU5WVFnbUJVSVZBSXBKNmNEMkRFTHBhUkNI?=
 =?utf-8?B?NkF5OWNDazdUejdYaGNDdDFBeGwvOG9sVlpiTDlZeXN1RGVIQTNDekUyWVZp?=
 =?utf-8?B?bnRkU3B6SEJsR3paeTZLZUpiT2Y1bHRZUFloUjFFNWhVU3NLMDc3b2Z6Q2ZR?=
 =?utf-8?B?QkoxNHpxUEZyUmNlelhhL3p6MUhkdGN2eFhOalpxVmYwTlM2SlBsVklTYW42?=
 =?utf-8?B?MWhSUkxXR2pnMjNJN081bmRmdFd5TitxRUtqTVRvdno5U1hhN2QzMEcvcGla?=
 =?utf-8?B?dGJ1ek1TeU94S3lxSTJCUTl3cG11Wi8xM1FsSFRXK05Ra3pkd0Qrdmt5cW1h?=
 =?utf-8?B?OG9kbnoxemF2dFNFSnFkNUt0enowWmIraFBIRkZkMnFBbFpiRGczRFN3UFpV?=
 =?utf-8?B?ajJPNjUrKzB4OHJyU2x0c3JtTXVvSytMVk5sa0xzN2o5VFk3K2pQTEM3cWJy?=
 =?utf-8?Q?UowDWEsZ5BCji?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(4022899009)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?emVSR05JSHdwWkRtZ21qYmJzZ1o3OWFzTmlnby9NUmVWaTgzRko2djdKWFlY?=
 =?utf-8?B?NFhaMjJsY1ZwS29xZTh2ZE05MlpNTjhtYVlpRGNTa2lLWnFVK3BMekZsam82?=
 =?utf-8?B?MTBxOXBPODRCZmtZamJ4L3B2REVmNi94aTQ2NmVGN3RZRTRaSkh1amxCTGtF?=
 =?utf-8?B?WHpkUnlCZGRkYWc0RGI3NWYxL3kyZ3NBTnRLY0pRQUF5TkFvZWFTVVgwR0dx?=
 =?utf-8?B?QWQva0E4V1hxdVlPai9XQkVidmp6ejFWUGw4MUZUZmQvU3Y3S2xXcGlxRVFC?=
 =?utf-8?B?eHRQbUVlcGhBZWlFbHp3aEMwRXp2V0ZzamJ0ekRFbm9ZRFloK1duSGU1UUx2?=
 =?utf-8?B?TDQyRm1jMzVzbFJzcHU3eTZTc0lPdjFrdTUwNDVrbTZFKy9QbHBIZW55OTZx?=
 =?utf-8?B?VHRBUitKbFpraVF3WnZWZFdQeENFdHJ4ZFpWQ291SDlpdlRIdTd1Y1M3dHFw?=
 =?utf-8?B?UnN0NXNJZ3d6VUw3OFJoZUNoNEJkelJhOGhyU0VndVRGcVltZGY4OUlzbitL?=
 =?utf-8?B?Tmo2TzVpQ3phcE15eFFoVVF3eXZMaU02WkU2NVJ0Ynp1a0VYMHBGNHIrN0pM?=
 =?utf-8?B?dEQ1TUdDS2pyK29KMzVUY2hJVzIxd3hMcFpacUZwYmZVR2hZQyt6MEUxV0lY?=
 =?utf-8?B?c3ZDVDVWWThoaFpIaEVwNHNDekkzSC8rbzNtQkI3ZGQ0TWF2aDRFdGI1RHFG?=
 =?utf-8?B?aXB3R00zOHVlZ3M5RXpGVkNISm9ibDRuTGhBRjI4SGZPcWk1RmUwQ3Vwbkkx?=
 =?utf-8?B?d2tKQ2VPb0xCMVhBQVBhU2lpVDliVStkZVBGeHpYaWNjK2x0RzllSVd5K291?=
 =?utf-8?B?LzBhM3hMUjNWeTRwdFFHdDJDNVZldDJ1UDNTT1lWRVIxTW1oQkp5R1dsaUw5?=
 =?utf-8?B?NVZMVitOeDVFd3dNRUZsaEgwQ0t4S3hEZDFmeVNLMjREZUJhSHkyTWhiR3Jk?=
 =?utf-8?B?aUtkVkRsVkpPbzlWNDI1WnQyZjd5dnNKcUQrVGphVU1kYndnM2ZQSjE0TnhP?=
 =?utf-8?B?cWpQNDZ6OWtjUjVRRE1CZWdHZC9WN1IydCsrUE5oZ3V0REoyaVhJVC9CajFH?=
 =?utf-8?B?bmZVNkplM05MUzFkN2RZZWYrc2dwMWtQRFU1Qi9oQWdtL0JHZUc1U1h4SXdk?=
 =?utf-8?B?ZTZWMTZud1JPOUQvQWRGZ0VKamozQklPNllPaFJPWjZkbDVrMkxwT2NiNlJl?=
 =?utf-8?B?QnhCMG12cUJPNnVrVTU1ZW1mYnpFdXdiSkUyOGxyQmg2QXRCaXEzaEUrako2?=
 =?utf-8?B?UG5icytmNXVuNjB6WldPNjBsNG04aGNsaVFGc3VIOStBOUgrL3NZRTlvQ0xV?=
 =?utf-8?B?eXcrbm00cVpvanMzVGRkTGhyT2FLNEk4UXk4cGdxZTNNZzRrTHZmQ1dsSVk4?=
 =?utf-8?B?TjI2bUNyMXVNSUdSTVZCUHpBM2FtNHpvd2J4VUhnWU9sVzFlOGs5OGh0eWY5?=
 =?utf-8?B?d25FZDhrNUxXRlhWb28zd1RPWU44bDZwVjhmUXBVcUJGU3JkOFVwNm0xN2U5?=
 =?utf-8?B?cHJRUG9JVEk0M01sNE1aYnBnVlZtRDNKTDBEeSsvTXhMbVJlc1NGYzhXVHB3?=
 =?utf-8?B?R3lLK0tWSGJUS3dwWjVseHdJVGFKTzl4TEh5NlpLVm9JeW1oV0hsdG9ydDZE?=
 =?utf-8?B?R3RIYmZiYU12dDA2Z3RGZGFUQnE0V2FTTm9nRzVZaFNURmN1aHllOUVQWC9B?=
 =?utf-8?B?M1JYcXNLdHhnWDR2K0RiZmIrdDRTSGFrKzRGV1NiMS93YndiUUdZRFA0RjYv?=
 =?utf-8?B?c0VsK1JuVUZsT3FkUGFsd3BIU2dFQzE3M0h2Zy8vV0dFZE80ekFxRFkxSUpB?=
 =?utf-8?B?dHQxYnlHcFR4Vm9YUXFJRzlCUU5DZzF1UGc5eTZ1SEcrQXFHNFMvTGV4Tng4?=
 =?utf-8?B?V1BXaDdJcWhUTlRDSFZxQXUyT2NUUjExOEtiemtkb2krSTZXMmxkTE9WRGl6?=
 =?utf-8?B?L3Z2OVFYWFVmY2gxWldqam9JemRMelNQb0RDY2hsWEJRYk5ZOEVzRUdScUF3?=
 =?utf-8?B?Tk5YSU9RdkpWRmJhZllkRUdaN3U0RDVIMUZxb0FWbnRPSjlKcXN1TTVOdUhq?=
 =?utf-8?B?UDNOckU4c2dpM0J1WklpR3Nzc2RCQ3Bqc2NsTHJycE50TDI5dVNoRFRNK1V4?=
 =?utf-8?B?OUVvTDc1Y2lHNnROTWRRb3JLVitjUG9DYnAxaXVla1lqajRUeExaZDlSV25W?=
 =?utf-8?B?Umc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f0545d-f384-490f-a5df-08ddf2d64a8b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2025 15:00:34.7109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6snfVmAMumoh6lRuQkW0OqyDkSUMNyuh0FXOucsfJoJBBXFhm8N3pTHUcVQODaoDeQL6NRzzy+2VQQC2c7q9h0/8+HvGlweFp4LtZnB735g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7538
X-Proofpoint-GUID: ttxpW54-mtq8248S_ZGclGfo0KR7cwZD
X-Proofpoint-ORIG-GUID: ttxpW54-mtq8248S_ZGclGfo0KR7cwZD
X-Authority-Analysis: v=2.4 cv=PuaTbxM3 c=1 sm=1 tr=0 ts=68c58715 cx=c_pps
 a=XXikXukjthQYDL6FPtOYxQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8
 a=uZvujYp8AAAA:8 a=-w5ALONIAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=SQwMSQqdnu1qeZtuj4IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NK6dRPDLI4cA:10 a=SLzB8X_8jTLwj6mN0q5r:22 a=C79KhC8RY3WKb-qt5qOK:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDE0MyBTYWx0ZWRfX+mXX+fD6VW0f
 ERQczbWrAVYwnSpiIRSzzF6YO6dppYHQMzSKTZTI1QSjbtcXqvieUpBoTo8NfzH4hm2zkVuLkNu
 OKKzyvwTdqdJh2aVNBTMDPHwVTX3NWRuF6CHOou+pBqD3K3/R1PFEqSc+jDrPJtWCdMY50Rva5E
 CGxp3ccl4I1G8miWoOWpt4prn+nPjGW1GuvfDEHNUzztgwANW7UR8jp0ajApAM01nmbW45E7OlD
 PhhX3ChQWysa5QTvskTK4f/qOC1p4Xsg/MFOoFssrfdwc/G/OtvE/jsoUSx7ofNMo06888iy48L
 8i9qyKcrfxcn/ikil/Vx3eq4RLsW3k45q0586uhkvn2d6o5E3SP4YmSHlgad6k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-13_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58DEo2WQ627296
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 13 Sep 2025 15:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119387

ping

On 8/19/2025 4:43 PM, Yan, Haixiao (CN) via lists.openembedded.org wrote:
> From: Haixiao Yan <haixiao.yan.cn@windriver.com>
>
> Remove following patches, they have been fixed since 1.3.0.
> 0001-build_support-use-source-filename-instead-of-foo-for.patch
> 0002-build_support-handle-empty-max_priority-value-as-Non.patch
> 0003-build_support-use-does_build_succeed-in-compile_and_.patch
>
> Backport a patch to fix dicsovery fails when CC contains flags
>
> License-Update: update copyright statements to include contributors
>
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit f2dc694c52618c04880b28aceec48ff3a853558f)
> ---
>   ...x-cross-compilation-error-when-CC-is.patch | 53 ++++++++++++++++
>   ...e-source-filename-instead-of-foo-for.patch | 50 ---------------
>   ...ndle-empty-max_priority-value-as-Non.patch | 49 ---------------
>   ...e-does_build_succeed-in-compile_and_.patch | 62 ------------------=
-
>   ...pc_1.2.0.bb =3D> python3-posix-ipc_1.3.0.bb} | 14 +++--
>   5 files changed, 61 insertions(+), 167 deletions(-)
>   create mode 100644 meta-python/recipes-devtools/python/python3-posix-=
ipc/0001-build_support-fix-cross-compilation-error-when-CC-is.patch
>   delete mode 100644 meta-python/recipes-devtools/python/python3-posix-=
ipc/0001-build_support-use-source-filename-instead-of-foo-for.patch
>   delete mode 100644 meta-python/recipes-devtools/python/python3-posix-=
ipc/0002-build_support-handle-empty-max_priority-value-as-Non.patch
>   delete mode 100644 meta-python/recipes-devtools/python/python3-posix-=
ipc/0003-build_support-use-does_build_succeed-in-compile_and_.patch
>   rename meta-python/recipes-devtools/python/{python3-posix-ipc_1.2.0.b=
b =3D> python3-posix-ipc_1.3.0.bb} (41%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0001=
-build_support-fix-cross-compilation-error-when-CC-is.patch b/meta-python=
/recipes-devtools/python/python3-posix-ipc/0001-build_support-fix-cross-c=
ompilation-error-when-CC-is.patch
> new file mode 100644
> index 000000000000..c78d4ad726c6
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_=
support-fix-cross-compilation-error-when-CC-is.patch
> @@ -0,0 +1,53 @@
> +From 01134093c9150248f9ea8890a41e922159593a7f Mon Sep 17 00:00:00 2001
> +From: Haixiao Yan <haixiao.yan.cn@windriver.com>
> +Date: Fri, 8 Aug 2025 19:30:16 +0800
> +Subject: [PATCH] build_support: fix cross-compilation error when CC is=
 a
> + multi-part command
> +
> +Fix the following error when cross-compiling with an environment-defin=
ed CC
> +that includes flags:
> +
> +FileNotFoundError: [Errno 2] No such file or directory: 'x86_64-wrs-li=
nux-gcc
> +-m64 -march=3Dnehalem -mtune=3Dgeneric -mfpmath=3Dsse -msse4.2
> +-fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-=
security
> +-Werror=3Dformat-security
> +--sysroot=3D/build-1.3.0/tmp/work/corei7-64-wrs-linux/python3-posix-ip=
c/1.3.0/recipe-sysroot'
> +
> +This happened because the CC environment variable was treated as a sin=
gle
> +string instead of being split into arguments. The fix uses shlex.split=
() to
> +correctly parse CC into a list of compiler and flags, and then unpacks=
 it when
> +forming the subprocess command.
> +
> +Upstream-Status: Backport [https://github.com/osvenskan/posix_ipc/comm=
it/0113409]
> +
> +Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> +---
> + build_support/discover_system_info.py | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/build_support/discover_system_info.py b/build_support/dis=
cover_system_info.py
> +index d1b171e4f602..1c3741f5577c 100644
> +--- a/build_support/discover_system_info.py
> ++++ b/build_support/discover_system_info.py
> +@@ -1,6 +1,7 @@
> + import subprocess
> + import platform
> + import os
> ++import shlex
> +
> + # Set these to None for compile/link debugging or subprocess.PIPE to =
silence
> + # compiler warnings and errors.
> +@@ -49,7 +50,9 @@ def does_build_succeed(filename, linker_options=3D""=
):
> +     #   - Some versions of Linux place the sem_xxx() functions in lib=
pthread.
> +     #     Rather than testing whether or not it's needed, I just spec=
ify it
> +     #     everywhere since it's harmless to specify it when it's not =
needed.
> +-    cmd =3D [os.getenv("CC", "cc"),
> ++    cc =3D os.getenv("CC", "cc")
> ++    cmd =3D [
> ++           *shlex.split(cc),
> +            '-Wall',
> +            '-o',
> +            f'./build_support/src/{filename[:-2]}',
> +--
> +2.34.1
> +
> diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0001=
-build_support-use-source-filename-instead-of-foo-for.patch b/meta-python=
/recipes-devtools/python/python3-posix-ipc/0001-build_support-use-source-=
filename-instead-of-foo-for.patch
> deleted file mode 100644
> index 8bb726708654..000000000000
> --- a/meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_=
support-use-source-filename-instead-of-foo-for.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 09cfcf7de2aab873a13949d5a128ccfb9e54732d Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <martin.jansa@gmail.com>
> -Date: Mon, 5 May 2025 08:15:37 +0200
> -Subject: [PATCH] build_support: use source filename instead of 'foo' f=
or
> - discover tests
> -
> -* helps when debugging the issues
> -* use the same order of CC arguments in compile_and_run and
> -  does_build_succeed just for consistency
> -* use pthread in both compile_and_run and does_build_succeed functions
> -  it was added only to does_build_succeed in 5ec39f7af8cfd8525d225b130=
2fa93f7133b3849
> -  not sure if it was intentional
> -
> -Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> -Upstream-Status: Submitted [https://github.com/osvenskan/posix_ipc/pul=
l/77]
> ----
> - build_support/discover_system_info.py | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/build_support/discover_system_info.py b/build_support/dis=
cover_system_info.py
> -index bc4d174..6d059d9 100644
> ---- a/build_support/discover_system_info.py
> -+++ b/build_support/discover_system_info.py
> -@@ -60,7 +60,7 @@ def does_build_succeed(filename, linker_options=3D""=
):
> -     #     Rather than testing whether or not it's needed, I just spec=
ify it
> -     #     everywhere since it's harmless to specify it when it's not =
needed.
> -     cc =3D os.getenv("CC", "cc")
> --    cmd =3D "%s -Wall -o ./build_support/src/foo ./build_support/src/=
%s %s -lpthread" % (cc, filename, linker_options)
> -+    cmd =3D "%s -Wall -o ./build_support/src/%s ./build_support/src/%=
s %s -lpthread" % (cc, filename[:-2], filename, linker_options)
> -
> -     p =3D subprocess.Popen(cmd, shell=3DTrue, stdout=3DSTDOUT, stderr=
=3DSTDERR)
> -
> -@@ -73,7 +73,7 @@ def compile_and_run(filename, linker_options=3D""):
> -     # Utility function that returns the stdout output from running th=
e
> -     # compiled source file; None if the compile fails.
> -     cc =3D os.getenv("CC", "cc")
> --    cmd =3D "%s -Wall -o ./build_support/src/foo %s ./build_support/s=
rc/%s" % (cc, linker_options, filename)
> -+    cmd =3D "%s -Wall -o ./build_support/src/%s ./build_support/src/%=
s %s -lpthread" % (cc, filename[:-2], filename, linker_options)
> -
> -     p =3D subprocess.Popen(cmd, shell=3DTrue, stdout=3DSTDOUT, stderr=
=3DSTDERR)
> -
> -@@ -82,7 +82,7 @@ def compile_and_run(filename, linker_options=3D""):
> -         return None
> -
> -     try:
> --        s =3D subprocess.Popen(["./build_support/src/foo"],
> -+        s =3D subprocess.Popen(["./build_support/src/%s" % filename[:=
-2]],
> -                              stdout=3Dsubprocess.PIPE).communicate()[=
0]
> -         return s.strip().decode()
> -     except Exception:
> diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0002=
-build_support-handle-empty-max_priority-value-as-Non.patch b/meta-python=
/recipes-devtools/python/python3-posix-ipc/0002-build_support-handle-empt=
y-max_priority-value-as-Non.patch
> deleted file mode 100644
> index 54c8ddaba7ae..000000000000
> --- a/meta-python/recipes-devtools/python/python3-posix-ipc/0002-build_=
support-handle-empty-max_priority-value-as-Non.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From 8fc46d871639dbe799f6ff0a61b046412ef5dcc6 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <martin.jansa@gmail.com>
> -Date: Mon, 5 May 2025 08:16:30 +0200
> -Subject: [PATCH] build_support: handle empty max_priority value as Non=
e
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -When cross-compiling these tests they fail when the host cannot execut=
e
> -the binaries built for target.
> -
> -On my local ubuntu-22.04 docker container running
> -build_support/src/sniff_mq_prio_max results in:
> -posix_ipc-1.2.0 $ ./build_support/src/foo
> -bash: ./build_support/src/foo: cannot execute binary file: Exec format=
 error
> -which triggers the Exception in compile_and_run and returns None
> -
> -While on some other ubuntu-22.04 containers I see:
> -posix_ipc-1.2.0$ ./build_support/src/sniff_mq_prio_max
> -/usr/lib/ld-linux-aarch64.so.1: No such file or directory
> -
> -and the compile_and_run returns
> -b''
> -which then causes
> -posix_ipc-1.2.0/build_support/discover_system_info.py", line 244, in s=
niff_mq_prio_max
> -=C2=A0 =C2=A0 if max_priority < 0:
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^
> -
> -Handle the empty value the same as None to avoid this.
> -
> -Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> -Upstream-Status: Submitted [https://github.com/osvenskan/posix_ipc/pul=
l/77]
> ----
> - build_support/discover_system_info.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/build_support/discover_system_info.py b/build_support/dis=
cover_system_info.py
> -index 6d059d9..f8a3c83 100644
> ---- a/build_support/discover_system_info.py
> -+++ b/build_support/discover_system_info.py
> -@@ -223,7 +223,7 @@ def sniff_mq_prio_max():
> -         except ValueError:
> -             max_priority =3D None
> -
> --    if max_priority is None:
> -+    if not max_priority:
> -         # Looking for a #define didn't work; ask sysconf() instead.
> -         # Note that sys.sysconf_names doesn't exist under Cygwin.
> -         if hasattr(os, "sysconf_names") and \
> diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0003=
-build_support-use-does_build_succeed-in-compile_and_.patch b/meta-python=
/recipes-devtools/python/python3-posix-ipc/0003-build_support-use-does_bu=
ild_succeed-in-compile_and_.patch
> deleted file mode 100644
> index b36d1cdb3ae1..000000000000
> --- a/meta-python/recipes-devtools/python/python3-posix-ipc/0003-build_=
support-use-does_build_succeed-in-compile_and_.patch
> +++ /dev/null
> @@ -1,62 +0,0 @@
> -From 760374e778fc28193cfea1416a739e206f9201c6 Mon Sep 17 00:00:00 2001
> -From: Martin Jansa <martin.jansa@gmail.com>
> -Date: Mon, 5 May 2025 08:28:56 +0200
> -Subject: [PATCH] build_support: use does_build_succeed in compile_and_=
run
> -
> -* avoid the duplication and building the sniff_mq_prio_max.c twice
> -
> -Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> -Upstream-Status: Submitted [https://github.com/osvenskan/posix_ipc/pul=
l/77]
> ----
> - build_support/discover_system_info.py | 27 ++++++++++----------------=
-
> - 1 file changed, 10 insertions(+), 17 deletions(-)
> -
> -diff --git a/build_support/discover_system_info.py b/build_support/dis=
cover_system_info.py
> -index f8a3c83..f6e6c8c 100644
> ---- a/build_support/discover_system_info.py
> -+++ b/build_support/discover_system_info.py
> -@@ -72,22 +72,17 @@ def does_build_succeed(filename, linker_options=3D=
""):
> - def compile_and_run(filename, linker_options=3D""):
> -     # Utility function that returns the stdout output from running th=
e
> -     # compiled source file; None if the compile fails.
> --    cc =3D os.getenv("CC", "cc")
> --    cmd =3D "%s -Wall -o ./build_support/src/%s ./build_support/src/%=
s %s -lpthread" % (cc, filename[:-2], filename, linker_options)
> --
> --    p =3D subprocess.Popen(cmd, shell=3DTrue, stdout=3DSTDOUT, stderr=
=3DSTDERR)
> --
> --    if p.wait():
> -+    if does_build_succeed(filename, linker_options=3D""):
> -+        try:
> -+            s =3D subprocess.Popen(["./build_support/src/%s" % filena=
me[:-2]],
> -+                                 stdout=3Dsubprocess.PIPE).communicat=
e()[0]
> -+            return s.strip().decode()
> -+        except Exception:
> -+            # execution resulted in an error
> -+            return None
> -+    else:
> -         # uh-oh, compile failed
> -         return None
> --
> --    try:
> --        s =3D subprocess.Popen(["./build_support/src/%s" % filename[:=
-2]],
> --                             stdout=3Dsubprocess.PIPE).communicate()[=
0]
> --        return s.strip().decode()
> --    except Exception:
> --        # execution resulted in an error
> --        return None
> -
> -
> - def get_sysctl_value(name):
> -@@ -211,11 +206,9 @@ def sniff_mq_prio_max():
> -     # ref: http://www.opengroup.org/onlinepubs/009695399/basedefs/lim=
its.h.html
> -     DEFAULT_PRIORITY_MAX =3D 32
> -
> --    max_priority =3D None
> -     # OS X up to and including 10.8 doesn't support POSIX messages qu=
eues and
> -     # doesn't define MQ_PRIO_MAX. Maybe this aggravation will cease i=
n 10.9?
> --    if does_build_succeed("sniff_mq_prio_max.c"):
> --        max_priority =3D compile_and_run("sniff_mq_prio_max.c")
> -+    max_priority =3D compile_and_run("sniff_mq_prio_max.c")
> -
> -     if max_priority:
> -         try:
> diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.=
0.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.0.bb
> similarity index 41%
> rename from meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0=
.bb
> rename to meta-python/recipes-devtools/python/python3-posix-ipc_1.3.0.b=
b
> index 8147e4108b72..1da14bc3afa6 100644
> --- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.0.bb
> @@ -2,15 +2,17 @@ DESCRIPTION =3D "POSIX IPC primitives (semaphores, sh=
ared memory and message queue
>   HOMEPAGE =3D "http://semanchuk.com/philip/posix_ipc/"
>   SECTION =3D "devel/python"
>   LICENSE =3D "BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1a4f3bd729df04bf68f66ef877e=
9c7c9"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3d8df223c2614dbf1aabdc1ca2=
3cc10"
>  =20
>   PYPI_PACKAGE =3D "posix_ipc"
>  =20
> -SRC_URI[sha256sum] =3D "b7444e2703c156b3cb9fcb568e85d716232f3e78f04529=
ebc881cfb2aedb3838"
> +SRC_URI[sha256sum] =3D "6e559ac5bb5f6f233c396103f4868e383bbd8f4e54d208=
76910896f47d353448"
>  =20
>   SRC_URI +=3D " \
> -    file://0001-build_support-use-source-filename-instead-of-foo-for.p=
atch \
> -    file://0002-build_support-handle-empty-max_priority-value-as-Non.p=
atch \
> -    file://0003-build_support-use-does_build_succeed-in-compile_and_.p=
atch \
> -"
> +    file://0001-build_support-fix-cross-compilation-error-when-CC-is.p=
atch \
> +    "
> +
> +# Message queue support requires librt for proper linking
> +LDFLAGS +=3D "-lrt"
> +
>   inherit pypi python_setuptools_build_meta
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118999): https://lists.openembedded.org/g/openembed=
ded-devel/message/118999
> Mute This Topic: https://lists.openembedded.org/mt/114778163/8599992
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[Haixiao.Yan.CN@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

