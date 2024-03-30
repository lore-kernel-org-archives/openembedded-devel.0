Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C03C6FD1F
	for <webhook@archiver.kernel.org>; Sat, 30 Mar 2024 15:05:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15413.1711811124016652030
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Mar 2024 08:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DSoCrYVc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4819b4a788=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 42UEe4Qe010139
	for <openembedded-devel@lists.openembedded.org>; Sat, 30 Mar 2024 15:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=RHBEX+tKTJ7Uaa8X7lk
	HVWlIhbtgREEz9C2WyASeJMI=; b=DSoCrYVcT/EP3vXKpZb54SFMNOcks7oJdco
	A70oDpm445f0dD22YQVJrwIaf3T5alSPy+NiPHklIHMTlKPYxDohpoBglxizPIzp
	D8Da4YsShf9uXFaiZWBRjmcHTzEM9JQl8Vf6jLYmCd/uSgEoOrosSQWArfToguxG
	rUwaMKzR0ryF5oi7ag5mZvFfFT2U4KjztqRZ2uSU8wQzPmzgxexr8UGK4Gd2bjXX
	qowRaW6BxZKtFx9GlcEqUD9VcPafoSMAvknI5S7xyrMXRyk5R3e1Y4AZN/oN89Ze
	oycBAJ8vezpNWsrw6FTQktnlFHCm3dnn7D+ZX7rhdCjkZITyiPA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x69q6rf8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 30 Mar 2024 15:05:23 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 42UF5MPC010343
	for <openembedded-devel@lists.openembedded.org>; Sat, 30 Mar 2024 15:05:22 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x69q6rf8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 30 Mar 2024 15:05:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKwq8OXwGvSIIuGlwXRJbZ8mpOwkxB/yYfFO728FKSGrw7S/t265wsXYXlF7xR5SxzaL4v5YVhL0+nKdx867X9UYqFjNuKpvRlD8gz420vBikjziBn6GXhMovjLwUU+0Ix9svxP2bdYRHbkCd5W5F6EGSNdhDWigsT1/gH8Vw8qSCzO/B4FFyY9jtWj3bcY6+7KTZw2Y0JSoulTKE07bIbFXggm8nRergveHw+UeD0sDdghhPs4I4xUXlbUAqV8ViWoNTEgLGqe++RpqhJ8fYG2W8PjJS8lW9+vcuzTyW7GG6oDebx24JncG0UleHS/QnZf2C/f/TJXScwnC93lTfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHBEX+tKTJ7Uaa8X7lkHVWlIhbtgREEz9C2WyASeJMI=;
 b=aW2RePtbF/qxuTOGqE/eJq3vEpdpWMjWZteKTDkuI7C1X1G+5uyN5NjqdnyDW2QNz0BLpAxiBU4ceQza8ZfqEghwnGePcrdSlaS8gM0+aVLu+Q/QTX+3vjMDPOnVchySvK0YEnl65dGfhDsDyMTsoyJkjPr10KWKG97T7qgcMVW8gLlwju0i9/AUtSWeIqexda6lKv0uhgJskff8iEXpshkkcs3ssCHJl+XN0w0/XyLntqzHaQZ9f42DyeVY1iScI+vBpM30HjRngk9LJTsBaqaJRe/VhQ5sKhR0CQ/SCcTxHJqL3Zo8z/CVN3cJ3iPJqJe/ZAx2ecrUqNqRz1mZEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by SA1PR11MB8376.namprd11.prod.outlook.com (2603:10b6:806:389::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.39; Sat, 30 Mar
 2024 15:05:18 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c613:f5c5:2c48:3f9d]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c613:f5c5:2c48:3f9d%4]) with mapi id 15.20.7409.031; Sat, 30 Mar 2024
 15:05:17 +0000
Content-Type: multipart/alternative;
 boundary="------------9TIxp3bLo9Ergdn0krXc00is"
Message-ID: <1ae2a64e-1796-4989-9157-a6b9ece677d3@windriver.com>
Date: Sat, 30 Mar 2024 11:05:15 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] freeradius: upgrade 3.0.21 ->
 3.0.26 --> Should we update to 3.2.x?
Content-Language: en-CA
To: yi.zhao@eng.windriver.com, openembedded-devel@lists.openembedded.org,
        "Yang, Liezhi" <Liezhi.Yang@windriver.com>,
        Khem Raj <raj.khem@gmail.com>
References: <20230109152538.896240-1-yi.zhao@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230109152538.896240-1-yi.zhao@windriver.com>
X-ClientProxiedBy: DM6PR08CA0015.namprd08.prod.outlook.com
 (2603:10b6:5:80::28) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|SA1PR11MB8376:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a5R+1EMHoJoBlSoQe5l6jk2jy6QbQdiuxPnvU+AUJl55IiyTPMDuLGWJJf4g2xhqO/hydTgYT8Qs8mGPrYg9JC/jUJk7dmT/T/YDH05nTur9vSC3SdOBJYm/+B3WFYaQWGkEVkHtzcVwmZn/exbOG5ipdZCt1WdG1uD+iuigSa1Dyubo0Wa19nUJkMQpQ/42mISGNNrw313HQhw2zLTtrFKacUmAK4HskbZkdlr8jnzbQivSZJ0bCtTOPWKsdJ6FIQRftGrur8d5GY5ePmPWxVrEEEFVXwQZqSIjbsDrHuGp86MhHF36SRmPCej3jutpzGX1RgIJ5yknGZx0e43dcRn9DB/ZiXtX0k0SCLMG5bxhaVVdCFS5Jv5UoAKYA9CBioWM49DwGFEdNIn1Nes1/ytJBMNkRCVW7vR0uowukvNEOaWQEki2KAiVz+jfLwdCMfI23EkTcg96yyaDWaEJ2BKHx9MPnYQIE2qqHE0qbMIF+pPNxPSL9U9gQ/DKpkkMGAksUwaCWL/klnYgyBiuI14wRlx4YvOTf5WeDHosZl68Via7iA97u4cRD9QZqoq/sNxg6HHyF17gkx5ajDK0tT5FNn2vPegyvBNCNlAuepk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eGlMU2dpWjh1ODR4Z2pGZS9LY01zUExueEpYRDlBYWVIZ3BrMm5FMVc4c21U?=
 =?utf-8?B?MEEvdk15ZzVUYUF5ZzNnakJ5eUYyTG5MY1ZrT0grcEU0TmZJTFBCT1FzS2Vt?=
 =?utf-8?B?aUdIUkZ3T0FMcWsvVWJTL1JwZEs0N2tyaC91b1ZCakw0aENxWlNkenpPU2ZC?=
 =?utf-8?B?RDd0Z0NYbzAzc2RDb1Q4TTNBWmkvMFRxU2NFOVJpb09IamZHSXk1bWF1UkI1?=
 =?utf-8?B?Q2hNcXdVaEFrN1h6RmpUS0VQdTIyZzR3SytYbnhvS0R2bDcvVDBTTkpyNVlJ?=
 =?utf-8?B?ZTFXdC9tQlRIYnU1UEgrK1hRTkMyN2Q1a0tSYm9DQXNLV3pkSmpwa053NFhH?=
 =?utf-8?B?V3dUQkJiZTlwS3ZEbG5TdkZ4UDc5MlNrRzVqWG1SREZ6WHc1WC9xNDFyRjh4?=
 =?utf-8?B?Q1RZNStPVWdVbmh4RHFEeGZwQ0pJUHVXd1BVaUIyaFVHQU5MMWgzQnljN01i?=
 =?utf-8?B?ejFFbVV3eTZONitZcU5YTWNVNkRhNWJsb3VqWkVDTDdrSUthazZzclFCbVV4?=
 =?utf-8?B?REpEV3dCdFE5R0ovdVBha3dTUFRkaEZseHh2VEFIVkUwQVF1cGFDZ2hhNDJ1?=
 =?utf-8?B?M0lqaU9UMzg0eVBzNVIzVW1TT1dPMkxUZW9hM1BwWnMxSGxCSFVUeHpIeGFr?=
 =?utf-8?B?VEJWTndMYlVyVHBqeFI5L3NwbmVmTGMwZUtOTkYzaWpSRUhHM1pEQ3M4SjND?=
 =?utf-8?B?RDBRa1BtMzZvUlpCYTY1T0R6L3Y5SHQ0QTJ0RngvTjFNbnVkWDlwUGVQV0ZV?=
 =?utf-8?B?OGlOZVFRWDhCeDRwOFBBTHRBZTgrQ1p6dTk0dmd2RDhmMkR4bWQ4WlR6QU5C?=
 =?utf-8?B?clU3bHQ4MXVGZXJZVVJIMEE5S0lVTVNBMlVIZTNzbmVqSnFQa0FMcUZuR2Uy?=
 =?utf-8?B?UGZGT250Y0NxQzFzMEg1QXdFcXJHTjN4R0lBRm5wTGkySVBSalZ6VWtzdlpD?=
 =?utf-8?B?b2p0MEVuSjBXOTNJNjRWWE91VG9NdTM4V0RIYkhKSEttWXVBaHFKb2ZFYWtl?=
 =?utf-8?B?MUxNTnRITFgyWnVNblIyT0hiTnAxWXBqV0t5QkF1RmJsb1B6NTNvQnhXMTV6?=
 =?utf-8?B?TUFvNXNRaHhFc0pCTUp6N0RwaFN2M1NUUFZZNEtEQ2VEZ2lLZGtOdG1HSmJ6?=
 =?utf-8?B?WjJIcllxWmp0S1VuV2pFaDBmb2lsMVJFb29HRDQ5L1AzZ29XQ3krQTBCc2Fr?=
 =?utf-8?B?U1Zmb3k5aWVUVFNGWDByQnRCUm5sVUQxUGQ1WTMveUtGOXZCQnQ1cWdGVHkz?=
 =?utf-8?B?S3RuZzZ1NGJzcjQ3ZEpDc3doZm9TdnBUcVJ4YmdrUFc4M0Y2dCtTeWFnZXE1?=
 =?utf-8?B?QkE1L0VpTTB0a3pYcHZneklWVGVhdXdtMXprOGdjSXEvMEMvK1BxOU81ampR?=
 =?utf-8?B?TnVXc2dCUDFCZFA0UUtodVVhUE9HSjlVYXoyNGlaUC84THpKcUdlN2h3Ukln?=
 =?utf-8?B?TnVua1hzVVdJOEpnKzU4amxUL1FKcXdxSEFkZjJvSit4NzIwWU5sb1M4Vjdh?=
 =?utf-8?B?MDZVTFkxcU1LNWRCd0llcnl6YnRyUm52bS8yb2IwbUZUb0dlSjV4ZlU5SHBP?=
 =?utf-8?B?SUoxYVRieHFJanJJWklVUVRsMWJ3a0ZiZUZPQ2ErV01wQ1VEWnpEbStWZ2Ns?=
 =?utf-8?B?VVBYeCtyNHE1TG80ZjM1Ly93L3VidGtCa2JQeG9yYWkvcHNYZDFyQkIzb0FG?=
 =?utf-8?B?Yi92YlU4cDg5ZUw2dzh0NzAvUG92YkNUT0RZQTd1OURMNS93Vk12RStWR1Jq?=
 =?utf-8?B?cEdWTC9YcHZ0eDRqcFJ3aG0vQWgvSlhFZ2ZlVTh4RlZ6VytWTUVRYjBpQkh3?=
 =?utf-8?B?U3BhS0tJSmhGeko2YmZaQlBBS0w3Y0h3QzExY3ZBVmdRc2hWSWtzOS84VHJC?=
 =?utf-8?B?MGhTSFNmMlEzS3UzQjJLMVQ3dmtpRkZHc3lZRnA5dUhhbStvbUN2SW9jdVR4?=
 =?utf-8?B?SlZDMWR3dmxKL3Y1bVJ3TmtvRStHRjlOVEhjbkV2YXRxUGxzbHQzSDdYc1NO?=
 =?utf-8?B?d3J3TjczRTB0M0djdDZpSXFvdUJvYy9QM2JXbVZuRjlyQXliZUlvS0d2M0tC?=
 =?utf-8?B?V3VPd2ZZdE1Xa0FnMVFnZGo0OTMvM05PekxpQXRONFdXbjIxYTJjYnlOUEFt?=
 =?utf-8?B?MUpZV09ubEk5YndKNnZqc1JJdkRoUFlJT2FTRGF3Mlhkck42R3BkWnRGSldz?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db58106-b999-4c3d-705e-08dc50cacf9c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2024 15:05:17.8322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtFc6onHESse/1zr6Pj0ZPioh3yK7LwSYWY6KkfoRVUO5XkQcwqDr2a3xDB2ExIc+p25wy9a/AfXbp7zDMWOD3COZ/OSQOXxYjQTVGTvLUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8376
X-Proofpoint-ORIG-GUID: XDMA2LaQFWf_VJ30dzjw4vq2kzbSkAuV
X-Proofpoint-GUID: P2vp8LnNXplvC4R-EYG2pptdY3aWa4Hh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-30_10,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403300123
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Mar 2024 15:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109687

--------------9TIxp3bLo9Ergdn0krXc00is
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Robert and I had an internal discussion about whether we should update
freeradius to the 3.2.x branch. See below. If there's no objection,
Robert please send you local update to the list so that it makes it into 
5.0.


Robert said:

> I've updated it to 3.2.3 in my local repo, but 3.2.x are 'Features' 
> release,
> and 3.0.x are 'Stable' release:
>
> https://freeradius.org/releases/
>
> I think that keep it as 3.0.x is better than 3.2.x for LTS24 (YP-5.0)?


I think it's a judgment call.

You are right that there are new features being introduced:
https://freeradius.org/release_notes/?br=3.2.x
but there is also a dedciated branch for 3.2.x:
https://github.com/FreeRADIUS/freeradius-server/tree/v3.2.x

separate from the master branch and there's talk of a major update 
happening for the 4.0 release:
https://freeradius.org/4.0/alpha.html

If you look around at what other distros are carrying, the more recently 
updated/released
distros (Fedora 39, Debian 12) have 3.2.x:
https://pkgs.org/download/freeradius
and ubuntu-24.04, will ship 3.2:
https://repology.org/project/freeradius/versions


I wasn't able to find a document about FR's release schedule or EOL dates

but it seems to me that we should add 3.2.x.


../Randy

--------------9TIxp3bLo9Ergdn0krXc00is
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Robert and I had an internal discussion about whether we should
      update <br>
      freeradius to the 3.2.x branch. See below. If there's no
      objection,<br>
      Robert please send you local update to the list so that it makes
      it into 5.0.<br>
    </p>
    <p><br>
      Robert said:<br>
    </p>
    <blockquote type="cite" cite="mid:1a9ed491-7dbb-438a-b1a1-7bc3aa81661d@windriver.com">I've
      updated it to 3.2.3 in my local repo, but 3.2.x are 'Features'
      release, <br>
      and 3.0.x are 'Stable' release: <br>
      <br>
      <a class="moz-txt-link-freetext" href="https://freeradius.org/releases/">https://freeradius.org/releases/</a>
      <br>
      <br>
      I think that keep it as 3.0.x is better than 3.2.x for LTS24
      (YP-5.0)? <br>
    </blockquote>
    <p><br>
    </p>
    <p>I think it's a judgment call. <br>
    </p>
    <p>You are right that there are new features being introduced:<br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://freeradius.org/release_notes/?br=3.2.x">https://freeradius.org/release_notes/?br=3.2.x</a><br>
      but there is also a dedciated branch for 3.2.x:<br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://github.com/FreeRADIUS/freeradius-server/tree/v3.2.x">https://github.com/FreeRADIUS/freeradius-server/tree/v3.2.x</a></p>
    <p>separate from the master branch and there's talk of a major
      update happening for the 4.0 release:<br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://freeradius.org/4.0/alpha.html">https://freeradius.org/4.0/alpha.html</a><br>
    </p>
    <p>If you look around at what other distros are carrying, the more
      recently updated/released<br>
      distros (Fedora 39, Debian 12) have 3.2.x:<br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://pkgs.org/download/freeradius">https://pkgs.org/download/freeradius</a><br>
      and ubuntu-24.04, will ship 3.2:<br>
      &nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://repology.org/project/freeradius/versions">https://repology.org/project/freeradius/versions</a><br>
    </p>
    <p><br>
    </p>
    I wasn't able to find a document about FR's release schedule or EOL
    dates<br>
    <p>but it seems to me that we should add 3.2.x.</p>
    <p><br>
    </p>
    <p>../Randy<br>
    </p>
  </body>
</html>

--------------9TIxp3bLo9Ergdn0krXc00is--

