Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D5DCCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 02:33:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6597.1760495579352772170
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 19:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=EWPqLWfq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23831c5e59=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F2UGfu1613797
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 02:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=c0N7cN4m84AuohwbdGiQ5zM8ScGhYmAnhpQKpbRjMRg=; b=EWPqLWfq62V+
	xVLTngenvsx4biveO8COncb6Y1o+Ys0c6FQFIUqQ9n24CO4+MlIVeDJj1euoRdUx
	dH0m/rB9ij4T0tlgg3DBWrARnXnr2WPOHBORJtmz/26IszuwgbhCluAN+ClL971v
	VsjouQZ/4S17ypjPCtd9s8/W3AGqF8xvjNGPwATm0nida1Z5U1W73OE710K+fMRH
	Ky1lck8nVHYDpGuBoprdsMPpFj26NYXqhjdROKWwAY9byA9/u//SvuEHE4c13ZbE
	QYIYZp5S5rWaNtWJ90gzsT9lPKHpR+Xv1WxJeULDRF29G6vYfNz8nju+jlsj4bCe
	uKBPztxntw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011057.outbound.protection.outlook.com [40.93.194.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qcewm9vn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 02:32:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITaoRMdrGrKOu8N18PVaHl2iDw4juPN9kyVa9X6KdEzBOncDyqw6ovxR9oNN1HA0D+ak/ohFAOSUJaYqtehUsYPrSMQjRk/8JjyUAtpDChDpGM1uADcb68oGJgf97Hfkbz0M4DhsEm09r5R7GCqG2G/8ziqErcP31hVPrejNuZAh1h7pLz3WGRTN1ZwDagWhdyvGxoQ9vSdMBFr8jeTode2r16wPfWHpFH4kNA9N3JEnIibNphfxfsHzWptrFwVz2ig0Gw283bsUXuAyiEAOvtvdY6cQT5HTld09C7/ZKfdHqQW/jv2eZsMyHsMwJ+kvTr4exLQekXc/km19H4wOyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0N7cN4m84AuohwbdGiQ5zM8ScGhYmAnhpQKpbRjMRg=;
 b=BKewr/K9RJbqnfiZNo++6Tpz5sVNXG3r/89ktPFE54K1f2D92DvQrjMvSNzNO04z7Iwo/5XiEZJLkJUgQKREP3AtkoZ7CUVW275R4lUSGsV8wPHFhLgAQxmq2qsQC4Kgph/tE+IS5LGnDk9LoOfKEANf0vBhTtJrg2yU8HlFC9OP2ACztJru+ywWwFruVgpf/SmwNIKxz4FI1aAMu0YtRnH1dv5huPeKE43ZskLFI9H0rjqujTsQsChJ4jV9UcgfGQryuU9bUXsQ07gZaqMz99v4di+3aP0q2Eekzwgm05uMpMYM5PpWQ8vsKjxcnCCs7CxS9vdy94Hzgb+nnYVNlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by MW3PR11MB4700.namprd11.prod.outlook.com (2603:10b6:303:2d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Wed, 15 Oct
 2025 02:32:55 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::89ea:ecfa:c345:3fc6%6]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 02:32:55 +0000
From: guocai.he.cn@windriver.com
To: skandigraun@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][kirkstone][PATCH V2] libnet: backport patch to remove configure time SOCK_PACKET check
Date: Wed, 15 Oct 2025 10:32:39 +0800
Message-Id: <20251015023239.2742022-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <9d4fbe3f-f7e0-4e2c-a5ea-ce2fe9387d39@gmail.com>
References: <9d4fbe3f-f7e0-4e2c-a5ea-ce2fe9387d39@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0028.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::15) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|MW3PR11MB4700:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb47bec-fd29-4bdb-17bb-08de0b93255b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UVd3THl2U0F4SHEycWF5NHlLKy9RajdSOUFqdXBDSlNHcG92cWJKaWhsam9M?=
 =?utf-8?B?RWxBU3ZCSkI1dXJmVDJ0NWkwa0JjUzJoUldJem1KWmlxZkFzK2FLRnViTG9m?=
 =?utf-8?B?QW91VWlCbWcyV3JSaHVhSnNSQU8vQjdibVNoYWJybE1hczlLSWRDK3daM1VI?=
 =?utf-8?B?bUx4ZXJFdVlENjhndGtuUXF6dFRmbW1ZZllwbTV5ZFF4WlViY3UxR0hZUkRS?=
 =?utf-8?B?bHJQcStsQTJyMENUblFWMHVqR3pmb09xMUMvVzl6V2t6bUdTWjVseXFsbGFo?=
 =?utf-8?B?UXAwQVBONkphSDRSZmtrWW1wd1BJUXh3ZmZ5V0VZYlNrN050Q254Y3dSYVU2?=
 =?utf-8?B?Wk5qUHNsQTZyRXN0OGVGblc4QkIvdlJoYmhkeHRuMEo2YWdSc1Ntc0dzVERj?=
 =?utf-8?B?OUcvRlRyaENOZW1LdlI5T1VEQUNaUStLSXRlR0l1V2VoaGwxR2dablR3REFs?=
 =?utf-8?B?S0tpVDZSUHBnNy9WWEdrSjdRNjRMaHYzcGJJcjdmQnhGS0ZaSzJ6NjhUSVNl?=
 =?utf-8?B?cTViOSt3RjNqOXh2SEJsbEFWbzhwMjc5RTl0MGVTSGNtS1R2eWxvM1o4R2NF?=
 =?utf-8?B?ZW50dXlDd1pBYWplOVdTZVo0N0ZZM0FWTTgveEZ3Z0o0Rml4LzF5YTdUYUpo?=
 =?utf-8?B?MkJuN1NPcitaNE9JV2ViQnBmd3VzT0VzcDlpM1V6UXZydklDUGk0bVZ6MEYz?=
 =?utf-8?B?bkMyYWI1WGd1Ky9pRGdSWjJjS1ozeWxNeDFTZ1lnNVJBaTRVclRacUxqYTRz?=
 =?utf-8?B?YW5ERS82bWZOeW0wTG54RDJGQy9oUTQzK3dNLytES3k3emN0ais5cWRRRTJW?=
 =?utf-8?B?NFFyUlpQbjV5c08xeEN0VGlxZ05jNUREeWs2RkFZVmhkS1B3NjhraGhBd2FP?=
 =?utf-8?B?WVVYenN3MzNFVjFuV0U4WC8zQXJyVWlVN2xXV0VKWkJhbEhia1ZyOGpoOWNR?=
 =?utf-8?B?S0lteWpFend5R3FLNXdzM3hTVFVzaFgrd2lsQkttRHFwbkFYc3Z2cERRejZ0?=
 =?utf-8?B?cklEaWdRSk83VGkvak5nMklpTlFqNUhNN1I2T0FvaExTamJQS29YN1pvVVVa?=
 =?utf-8?B?cmNybDRJQjZyZXNnNlVheC8vNjNvay9iUUNZN0pPS0xoTDNYZ1VrZHEySjF6?=
 =?utf-8?B?TW9UdStlUDk3aUpVcDF4MGJPOXI3T1ZEUThSUUR4eGFQa2duSFNqWkpQc3JB?=
 =?utf-8?B?WmlXVTF0VWY5OVNOVlljU2VSWlZlOGVKSmU5OXJsMlppNGd0NmpNd1FUamF6?=
 =?utf-8?B?bHJ3RDA4RXpjWUFPdkpDZzBZWk1SZGpqdzh4blJWZTNHSzZJaTFnUXZMRHJG?=
 =?utf-8?B?b0VQd0pneHN5UXBxKzNpbHA3S01kaFZ3WU11NlRMQWt0WWFwMDlrOFVIUkVE?=
 =?utf-8?B?WFZqZWdyNnZaS0lFVzBYMUF1QUJJSWVWZ21xR0dzdm5qTHducUFUTGRTV05N?=
 =?utf-8?B?bVJEZHN3RjZhWndEZGdoTS9EL242U0VIbEZPczIwamxlSU1JaURWUkxMbkNq?=
 =?utf-8?B?bEFPZGlkcDBjN2FsdlFYM3dLS1JJcXBLOUVNNzI5Nnk3KzNhMm5jOFBCU3VI?=
 =?utf-8?B?eWgwT01qTkFuM25GSEpFSDQwaVZmbnlXMDRFc1dLblFMYnJzUFNGcGJWNjRD?=
 =?utf-8?B?VFhBeEZXRU9MSHJRbG9hTHJKNWRBWVBXbzVTMlNnc0dmQTFZRGNUTXcza2tF?=
 =?utf-8?B?UmI0aE4yc2h0ckpYaFZjbjNBRDJrWitZOW9DbEVVdlVQbGR2U2F2RUhnWmti?=
 =?utf-8?B?MllYQWQ4WDFEaWtrMXJaaFF5QzVIR1RLckMrR21Hd2dtUTh1ZUxVOXFsMld6?=
 =?utf-8?B?ck1lOHdaaGEwL2RUb3E1RnloTnBtdFVKOTBVWndLSjh3WnYzZ1NuckdGZmtF?=
 =?utf-8?B?a3NRYVlZNURmN2FHNzBzWElLWUp5bENyc3NOQ3IxL2t5cWNYV0V1QXJQM2Vk?=
 =?utf-8?B?ZEY2MUFoUkJNdGszQVd3OXdmWGJWcnNDVEhuZ3c4VksxMWpNbUhxQ0dCV3pl?=
 =?utf-8?B?aGE4SklhVVdqdkRJa0RHUTNHckF3eUxzZk4xQ0o1UTlqVlVGUTlRc3R0NUN6?=
 =?utf-8?Q?TQ93R1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dlFoN1ZFcDZkMjNBYThUeThwdzFVV0dmKzJBUmgwOHBUMW9QS3dWMXJsdlV2?=
 =?utf-8?B?c0lvZlZ6RUxkdFVKRkMxQUtsOEJWbWtjMWJ5NUJqdEZYcm9IV0J5cG1tbVFW?=
 =?utf-8?B?L3RQaUx3U09VMjZBem81dFV5VHNLS3o1V0F1QTVUSGNJVk9NUDdwZy8zcXR3?=
 =?utf-8?B?YW5NS3JvQkVORjFVZ3Q4bk1tNzQzWDB5QktyZG9OMTJONVVYWG1FWlBHTjds?=
 =?utf-8?B?ZWp0M0F6eUZJcnc2UGgraGtlN3lmcFNyYlVMcURnUEQxazJDS05MS3dQWk0v?=
 =?utf-8?B?WXczNWZvVCsvV094aFltZlVvMUluQ2JCVnNYQU1McUgwcDRTV3BleTVwOTBa?=
 =?utf-8?B?dTJudjVDVkMwcTZxcHMwbTJMek5UZzJIaVJxSUI2OVYwalJ4R2lUS2Z4R25L?=
 =?utf-8?B?dnVYZFpuSExTNnFPVVNvTVJDb21yMTJWMTBETTM3c3FXUXQ0YjB4aXYzWnJX?=
 =?utf-8?B?VXRMVzgxeE5aVDhBSUFHS2oxbVB2aEJTY0hBSklaTVYwTSt6N0NVQU1TS2tP?=
 =?utf-8?B?ZGh5OHZxUXY5MERubkxjZ3F5VlkyenhJY25YWjRVeGtCSkRPcGlxUGZKUTdl?=
 =?utf-8?B?N29aNkY2Tzc3MlcxQWQvOWtFTCtMb1dRdHpuNmk5cUMwdUhOQnpVck1mMUZG?=
 =?utf-8?B?QVVTTHF6dFpHQnpYUFRqd0w2NEE4WElJeW9IK0N3UzZoNXlxSmRhbjJNU1lw?=
 =?utf-8?B?OGNiSWx4dHhTR3p5d2tKbzdhYmFmaVFoSHBPVnMzZ0dMVkdGYUY3TG9TempX?=
 =?utf-8?B?RVJmbDEyV2ZDK0VxdGNLcGI4eHZ5eGlZREZqRFN5anBqUEExNVA0Q25DNkkz?=
 =?utf-8?B?OFdVRVBMVmdVNU1KTWxwVENoRVQ4SXpHSkhRbVRpRElGZG5CNDd2VkdnbUF5?=
 =?utf-8?B?RUNldHlCbUI2dFBrQTVTSkp2N0UySEdHbWJyeFlhQzZyZjdEMEMvSG80VEZ5?=
 =?utf-8?B?VENMR1BHQXlsbXVTaCtFN01Fb1JmcUc4ZCtqa01KZVAxWVlERVZldDRQdEhx?=
 =?utf-8?B?MVNwcTE4c2ZCTEM1MmtEY0loMjY1TUpveDQrTG1EblF0NE9xWE9JUHBIVU9Q?=
 =?utf-8?B?azE4aVRkWmsxS09JR29YKzR0NnhKSENqdHg2elhVZHVrY3FLOTJncGVETXBq?=
 =?utf-8?B?Z0YvOEJMbjhRM3NJMWcrWWJhNjFzb1JYQm5xQnAvS3NIb0haNzkzWk9KdVd0?=
 =?utf-8?B?QWt1TUdWNXBjc1I1T0dsSTdIZkdwQlFubDl5US90Y3BTS3lCSzhNWlVvV2pT?=
 =?utf-8?B?WXVkK2hJTm5hUURSQzZmMDN5b3FqdVh1RmtiV0E2Nm5IdXlkRTNDWGxhU3dN?=
 =?utf-8?B?cVUySnM4WTQvS0YvZTNWcGN6U2dFUDE5bTFKU08rZTFkUWdadmF5RVNFcWl6?=
 =?utf-8?B?QnA4SFhLaUVqZitNWWc4TWtzVVVuSzE1UU9DbCtKb1d6ZjNuaXYwc1pFR1or?=
 =?utf-8?B?VVVzOThlaThuOEhFYi9lMWZabWZoUXlKK2FHMzNHQmtzaHI2MEQvVURaU0Y3?=
 =?utf-8?B?TVVXcXVackkzc2xMZXdvZmJLSi9QQmd0Q1pjZit4dHc1c1gzNzdKVExrdGp3?=
 =?utf-8?B?TGtLcEtyUUk5eWFBS2E5TGZDSGJGZ3RIcXRPa1A2enZmUXFPV0w2VjllRHJt?=
 =?utf-8?B?bjBlNHVpRnlsaTJBNE0vK2VYLzY4bysxUVE5a05RcFNBTnllQXl0RUtTQXVo?=
 =?utf-8?B?QkV0VHRXS1lkUGZURmx2L2htVVd3Wm9tcGZuNlUyUTNoNjZzOVJ0RTdNbTN1?=
 =?utf-8?B?eTErKy9nVmZ2L0lEMEQvcEpSUEpXT2RIZy80bnFQeWQzUERVYXlHM0d3cFBS?=
 =?utf-8?B?M3I0dk9VcFBUZnNVZy9SY2xkQnVYMm9HbXdyR2JFMEE0R2lNZmNKMHRzWGJP?=
 =?utf-8?B?T285NTFVUFdIZVJmeUFueWxyeXN3MkZURGlRZUZhcTNneVQvOXJWOW43VEVI?=
 =?utf-8?B?YUVoN1lZVjlPNE5JN3hVZlVQK1d6STl3L1VpYU5nQXRvSEJibjRQemQxUk90?=
 =?utf-8?B?dVU0STl0dHRzYTF5ZlF4SGVJZHNpUTdVQ3VsRm1IMHNoUjB6N2NuYUh6R0gv?=
 =?utf-8?B?U1l2MlFsM3F6YWZzRExnbHdWaURNQ3F2TzhXSnZPdFBKR3VyN2V1anNrNCtS?=
 =?utf-8?B?dVBwWDFRV3B4WWZWQ3RPZXFONjFSdHN2cUVyUEI4SWhHQi9PeVpBQS9YWkQx?=
 =?utf-8?B?aHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb47bec-fd29-4bdb-17bb-08de0b93255b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 02:32:55.3387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EdXT33na1NHDk2BE3rVKvbizhKprXNdlVDEjUeFZz6omT6XChhnHwC13T4Yzb3sjBmkwSutXXx8mXG+t/Ctqz8rUetwIqtfYy/EHO2UxKTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4700
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 9T3si3uVpUZAEzLey0dE4Em4Umdr-jjB
X-Proofpoint-ORIG-GUID: ogjHWnCVMwvs3NeSHlmPvCtRdy4sPh8Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDAxNiBTYWx0ZWRfXxwQaO/v06tbF
 FOgy0/2A/ApaUY6w/PYfecR7CV3fWOJIgTi07JqAgcBqSqLQmU96VEbGqCHSXmxYvPPrCkBDBjH
 GvtQuJJenkjIuF91hHAhd2fn7yu7zxfmKvIOSaVnRvcSEdPgFeuCm9fL+IkimZQZcFh8eEF+yyw
 SAXgTnO17KjWh1/nwVxzDQfii2bdu42aAiLEboRhX6wq6IAJpsX+F+Z5vlvGs1n7XnjoOBAfLeV
 oQoXoqPhUfMy/7up017rz9FjDi0DlJdSkSm467j2yV8Hmg+1uUK/WOrvY7EM06qxkiUS0cRiJ7V
 l23OMjzuE+4ZqsBjfLg6rILQVVBskiKGbV+/O13eZBaZu2C1SH/XUgWAtnS8y7KlvtqZ8IO/ITy
 9lnZqBS4mmduplvlYwlc0me7XzmFjA==
X-Authority-Analysis: v=2.4 cv=M+xA6iws c=1 sm=1 tr=0 ts=68ef07da cx=c_pps
 a=vEsArsaSdKs0mJrCYyxDvw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=WQhEN21ruoYlkoZ7464A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150016
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59F2UGfu1613797
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 02:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120678

From: Guocai He <guocai.he.cn@windriver.com>

Backport [1] to fix the do_configure error like below:

checking for packet socket (PF_PACKET)... ./pf_packet-test:
/lib/x86_64-linux-gnu/libc.so.6: version 'GLIBC_2.34' not found

[1] https://github.com/libnet/libnet/commit/19979c4541ddcc817c64ea911a309=
ee71a8cc250

Signed-off-by: Qi Chen <Qi.Chen@windriver.com>
Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
V2:
Correct the mail client's settings about charset
---
 ...move-support-for-SOCK_PACKET-sockets.patch | 251 ++++++++++++++++++
 .../libnet/libnet_1.2-rc3.bb                  |   1 +
 2 files changed, 252 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet/0001-Remov=
e-support-for-SOCK_PACKET-sockets.patch

diff --git a/meta-oe/recipes-connectivity/libnet/libnet/0001-Remove-suppo=
rt-for-SOCK_PACKET-sockets.patch b/meta-oe/recipes-connectivity/libnet/li=
bnet/0001-Remove-support-for-SOCK_PACKET-sockets.patch
new file mode 100644
index 0000000000..2fc7ecd180
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnet/libnet/0001-Remove-support-for-=
SOCK_PACKET-sockets.patch
@@ -0,0 +1,251 @@
+From dd77c43a9773edb895bfe9074315e83a19cac471 Mon Sep 17 00:00:00 2001
+From: Guocai He <guocai.he.cn@windriver.com>
+Date: Tue, 26 Aug 2025 06:15:41 +0000
+Subject: [PATCH] Remove support for SOCK_PACKET sockets
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The current code has a build-time check to verify that PF_PACKET sockets
+are supported on Linux systems and if not, fallback on SOCK_PACKET socke=
ts.
+
+The test implementation relies on FTM (Feature Test Macros) to detect
+glibc and its version to include correct headers.
+But, some libc such as the musl libc do not have such macros, making the
+test program compilation fail and libnet fallback on SOCK_PACKET.
+
+Since PF_PACKET support is present in kernel for more than 20 years now,
+the simplest solution and safe choice is to just drop support for
+SOCK_PACKET and assume PF_PACKET is always available on any Linux system.
+
+Signed-off-by: Herv=C3=A9 Boisse <admin@netgeek.ovh>
+
+Upstream-Status: Backport [19979c4541ddcc817c64ea911a309ee71a8cc250]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
+---
+ acinclude.m4            | 87 -----------------------------------------
+ configure.ac            |  3 --
+ src/libnet_link_linux.c | 19 +--------
+ win32/config.h          |  1 -
+ 4 files changed, 1 insertion(+), 109 deletions(-)
+
+diff --git a/acinclude.m4 b/acinclude.m4
+index 064b582..f8ab967 100644
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -25,93 +25,6 @@ AC_DEFUN([AC_LIBNET_LINUX_PROCFS],
+                   [Define if you have the Linux /proc filesystem.])
+     fi])
+=20
+-dnl
+-dnl Checks to see if this linux kernel has a working PF_PACKET
+-dnl
+-dnl usage:
+-dnl
+-dnl     AC_LIBNET_CHECK_PF_PACKET
+-dnl
+-dnl results:
+-dnl
+-dnl     HAVE_PACKET_SOCKET (DEFINED)
+-dnl
+-
+-AC_DEFUN([AC_LIBNET_CHECK_PF_PACKET],
+-[
+-    AC_MSG_CHECKING(for packet socket (PF_PACKET))
+-    AC_CACHE_VAL(libnet_cv_have_packet_socket,
+-
+-        [
+-    cat > pf_packet-test.c << EOF
+-#include <stdio.h>
+-#include <errno.h>
+-#include <stdlib.h>
+-#include <netinet/in.h>
+-#include <sys/socket.h>
+-#include <features.h>    /* for the glibc version number */
+-#if __GLIBC__ >=3D 2 && __GLIBC_MINOR >=3D 1
+-#include <netpacket/packet.h>
+-#include <net/ethernet.h>     /* the L2 protocols */
+-#else
+-#include <asm/types.h>
+-#include <linux/if_packet.h>
+-#include <linux/if_ether.h>   /* The L2 protocols */
+-#endif
+-=20
+-#ifndef SOL_PACKET
+-#define SOL_PACKET 263
+-#endif  /* SOL_PACKET */
+-=20
+-int
+-main(int argc, char **argv)
+-{
+-    int fd;
+-=20
+-    fd =3D socket(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL));
+-    if (fd =3D=3D -1)
+-    {
+-        if (errno =3D=3D EPERM)
+-        {
+-            /* user's UID !=3D 0 */
+-            printf("probably");
+-            exit (EXIT_FAILURE);
+-        }
+-        printf("no");
+-        exit (EXIT_FAILURE);
+-    }
+-    printf("yes");
+-    exit (EXIT_SUCCESS);
+-}
+-EOF
+-    ${CC-cc} -o pf_packet-test $CFLAGS pf_packet-test.c >/dev/null 2>&1
+-
+-    # Oopz 4.3 BSD doesn't have this.  Sorry.
+-    if test ! -x ./pf_packet-test ; then
+-        libnet_cv_have_packet_socket=3Dchoked
+-    else
+-        libnet_cv_have_packet_socket=3D`./pf_packet-test`;
+-    fi
+-    if test $libnet_cv_have_packet_socket =3D choked; then
+-        AC_MSG_RESULT(test program compile choked... assuming no)
+-    elif test $libnet_cv_have_packet_socket =3D yes; then
+-        AC_MSG_RESULT(yes)
+-    elif test $libnet_cv_have_packet_socket =3D probably; then
+-        AC_MSG_RESULT(test program got EPERM... assuming yes)
+-    elif test $libnet_cv_have_packet_socket =3D no; then
+-        AC_MSG_RESULT(no)
+-    fi
+-
+-    rm -f pf_packet-test* core core.pf_packet-test
+-
+-    ])
+-
+-    if test $libnet_cv_have_packet_socket =3D yes -o $libnet_cv_have_pa=
cket_socket =3D probably; then
+-        AC_DEFINE(HAVE_PACKET_SOCKET, 1,
+-          [Define if we're running on a Linux system with PF_PACKET soc=
kets.])
+-    fi
+-])
+-
+ dnl
+ dnl Looks for a previous libnet version and attempts to determine which=
 verion
+ dnl it is.  Version 0.8 was the first version that actually knew intern=
ally
+diff --git a/configure.ac b/configure.ac
+index 4751f62..ad002b9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -51,7 +51,6 @@ AC_LIBNET_ENDIAN_CHECK
+ dnl AC_LBL_LIBRARY_NET
+=20
+ AC_SUBST(ENDIANESS)
+-AC_SUBST(HAVE_PACKET_SOCKET)
+ AC_SUBST(ADDITIONAL_LIBS)
+ AC_SUBST(LIBNET_CONFIG_DEFINES)
+ AC_SUBST(LIBNET_CONFIG_LIBS)
+@@ -87,7 +86,6 @@ if test -n "${with_link_layer}"; then
+         snoop) AC_LIBOBJ([libnet_link_snoop]) ;;
+         dlpi)  AC_LIBOBJ([libnet_link_dlpi]) ;;
+         linux) AC_LIBOBJ([libnet_link_linux])
+-	       AC_LIBNET_CHECK_PF_PACKET
+ 	       AC_LIBNET_LINUX_PROCFS ;;
+         none) AC_LIBOBJ([libnet_link_none]) ;;
+         *) AC_MSG_ERROR([Invalid link type "${with_link_layer}"]) ;;
+@@ -115,7 +113,6 @@ elif test "${ac_cv_header_sys_dlpi_h}" =3D "yes" ; t=
hen
+ elif test "${ac_cv_header_linux_socket_h}" =3D "yes" ; then
+     AC_LIBOBJ([libnet_link_linux])
+     AC_MSG_RESULT(found link layer linux)
+-    AC_LIBNET_CHECK_PF_PACKET
+     AC_LIBNET_LINUX_PROCFS
+ elif test "${cross_compiling}" !=3D "yes" -a -c /dev/bpf0 ; then       =
    # check again in case not readable
+     AC_LIBOBJ([libnet_link_bpf])
+diff --git a/src/libnet_link_linux.c b/src/libnet_link_linux.c
+index 3c6df3c..1dd2a42 100644
+--- a/src/libnet_link_linux.c
++++ b/src/libnet_link_linux.c
+@@ -33,13 +33,11 @@
+ #include <netinet/if_ether.h>
+ #include <net/if_arp.h>
+=20
+-#if (HAVE_PACKET_SOCKET)
+ #ifndef SOL_PACKET
+ #define SOL_PACKET 263
+ #endif  /* SOL_PACKET */
+ #include <netpacket/packet.h>
+ #include <net/ethernet.h>     /* the L2 protocols */
+-#endif  /* HAVE_PACKET_SOCKET */
+=20
+ #include "../include/libnet.h"
+=20
+@@ -69,11 +67,8 @@ libnet_open_link(libnet_t *l)
+         return (-1);
+     }=20
+=20
+-#if (HAVE_PACKET_SOCKET)
+     l->fd =3D socket(PF_PACKET, SOCK_RAW, htons(ETH_P_ALL));
+-#else
+-    l->fd =3D socket(PF_INET, SOCK_PACKET, htons(ETH_P_ALL));
+-#endif
++   =20
+     if (l->fd =3D=3D -1)
+     {
+         if (errno =3D=3D EPERM) {
+@@ -177,7 +172,6 @@ libnet_close_link(libnet_t *l)
+ }
+=20
+=20
+-#if (HAVE_PACKET_SOCKET)
+ static int
+ get_iface_index(int fd, const char *device)
+ {
+@@ -194,18 +188,12 @@ get_iface_index(int fd, const char *device)
+ =20
+     return ifr.ifr_ifindex;
+ }
+-#endif
+-
+=20
+ int
+ libnet_write_link(libnet_t *l, const uint8_t *packet, uint32_t size)
+ {
+     int c;
+-#if (HAVE_PACKET_SOCKET)
+     struct sockaddr_ll sa;
+-#else
+-    struct sockaddr sa;
+-#endif
+=20
+     if (l =3D=3D NULL)
+     {=20
+@@ -213,7 +201,6 @@ libnet_write_link(libnet_t *l, const uint8_t *packet=
, uint32_t size)
+     }
+=20
+     memset(&sa, 0, sizeof (sa));
+-#if (HAVE_PACKET_SOCKET)
+     sa.sll_family    =3D AF_PACKET;
+     sa.sll_ifindex   =3D get_iface_index(l->fd, l->device);
+     if (sa.sll_ifindex =3D=3D -1)
+@@ -221,10 +208,6 @@ libnet_write_link(libnet_t *l, const uint8_t *packe=
t, uint32_t size)
+         return (-1);
+     }
+     sa.sll_protocol  =3D htons(ETH_P_ALL);
+-#else
+-	strncpy(sa.sa_data, l->device, sizeof (sa.sa_data) - 1);
+-    sa.sa_data[sizeof (sa.sa_data) - 1] =3D 0;
+-#endif
+=20
+     c =3D sendto(l->fd, packet, size, 0,
+             (struct sockaddr *)&sa, sizeof (sa));
+diff --git a/win32/config.h b/win32/config.h
+index 926f12f..12e1ee7 100644
+--- a/win32/config.h
++++ b/win32/config.h
+@@ -11,7 +11,6 @@
+ #undef HAVE_HPUX11
+ #undef HAVE_SOCKADDR_SA_LEN
+ #undef HAVE_DLPI
+-#undef HAVE_PACKET_SOCKET
+ #undef HAVE_STRUCT_IP_CSUM
+ #undef HAVE_LIB_PCAP
+ #undef STUPID_SOLARIS_CHECKSUM_BUG
+--=20
+2.35.5
+
diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb b/meta=
-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
index 785abf66d6..5e35fc3391 100644
--- a/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
+++ b/meta-oe/recipes-connectivity/libnet/libnet_1.2-rc3.bb
@@ -10,6 +10,7 @@ PROVIDES =3D "libnet-1.2rc2"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/libnet-dev/${BPN}-${PV}.tar.gz \
            file://0001-Support-musl-libc-remove-support-for-glibc-2.1.pa=
tch \
+           file://0001-Remove-support-for-SOCK_PACKET-sockets.patch \
           "
=20
 SRC_URI[md5sum] =3D "f051e6e5bdecddb90f77c701c2ca1804"
--=20
2.25.1


