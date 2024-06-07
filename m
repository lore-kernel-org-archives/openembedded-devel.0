Return-Path: <wentao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07830C27C65
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 02:34:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.32640.1717727695089511408
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jun 2024 19:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6888d49895=wentao.zhang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45722coT018043
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Jun 2024 02:34:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yftm7wxbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 02:34:54 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4572YrQI029498;
	Fri, 7 Jun 2024 02:34:53 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3yftm7wxba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 02:34:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0GCUfdegaLsgaM+U1vukX5kKcAgi0ch3FDKrvKN0uBD00ImPV6jb6YvLt6IG56Zr0vejymrgwi/nYKMahi4Tu8FNtO5Cws7SPF69APe86eIAIk6FLn/1pY5HRizGbAtEJiasJ11GiA4JvQbAjqzEDZeUGZBEs2wxVN5tbVorBRv+KcnVdzbx+D4u04t8QO0CNaNZMXCIeC+F4S2nTS+e4P0rn49MCVHIXL2nv5YevvWRyltRjMmwnowNjA0a1CTIWu2akH9friOxwqql56tiyVagr8oe+IJVv0y07NVlcFC4xm10+pr/Ds4GC1aZSAoGauWUGOvRDU3UUgQYfB5zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6nMN+UwCvKdzZ0Fc3w/bej6mZMr6IJXfAg53MUoIjs=;
 b=jJmhpy0HNingcFQeQMqWKX7h5OJ0LUVGidn0x8BzdtFhOE2Ukmqq7UXmkW+hr6K/4MblF4//cLdAL80VD2KhxvPki7OGSc0l9J2a/H4IvyiGDbsKdfLAAJPc+53/NF9vzitfR2ohQH+7ubsacx7WeYfKqxdKUQHpiRCSE1230VpPkQR6cv26N5KsTlyrOS2vWx9tTKd48O5gDV200izlZXyn5Dr9FG9m1KfJfrAOK5kagO4iZNwd7uvLZ6ZYZXEZsH2nCNCbDWmOfe4P0PnUrpqU3AS9vGkUhFaj1sScCbez1J5QX2KxgtzxiEzSt0xlIQjbPBk2Ni1fbpFL8Veglw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6)
 by SN7PR11MB7975.namprd11.prod.outlook.com (2603:10b6:806:2eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 02:34:49 +0000
Received: from SJ0PR11MB7155.namprd11.prod.outlook.com
 ([fe80::6638:98c1:fb6:c3d9]) by SJ0PR11MB7155.namprd11.prod.outlook.com
 ([fe80::6638:98c1:fb6:c3d9%6]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 02:34:49 +0000
Message-ID: <0bc66ae8-718e-4790-9cbd-0a71d3341ab0@windriver.com>
Date: Fri, 7 Jun 2024 10:34:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] meta-oe/conf/layer.conf: remove
 libbpf from NON_MULTILIB_RECIPES for x86 and x86-64
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20240606101332.1564737-1-wentao.zhang@windriver.com>
 <CAMKF1sqeiG0ZkGx=q_NnTcOYyyLQrzJaGR3GGb6cezmFzpaXWA@mail.gmail.com>
Content-Language: en-US
From: Wentao Zhang <wentao.zhang@windriver.com>
In-Reply-To: <CAMKF1sqeiG0ZkGx=q_NnTcOYyyLQrzJaGR3GGb6cezmFzpaXWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYAPR01CA0184.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::28) To SJ0PR11MB7155.namprd11.prod.outlook.com
 (2603:10b6:a03:48d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB7155:EE_|SN7PR11MB7975:EE_
X-MS-Office365-Filtering-Correlation-Id: c4a5dfbf-b13f-4ba0-4d7c-08dc869a6711
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N2UrYXFuTmJOVHRldW5JT1FkUnlFVXRqWkl0cDQ0VlRpY3p0aEtUdDk2L3hM?=
 =?utf-8?B?Q0lrK3hKZzVRK256RytRR0tWaDJsYTFmRFBiYXNwdHhnOGduTVFqRUtmZVdL?=
 =?utf-8?B?UzBFSEVWT3JxSnVTOUtlN0lrN1ZwL2xTSWR1WXhUdFJlSko4WlgxRXU3TkJ6?=
 =?utf-8?B?SUdGVWJFRTlON09nUGdocHlFalRVcnE2ODEwbDhZNG9xSjZnakZub2RjT3By?=
 =?utf-8?B?WkFZcFZSM2dXVUFJL2pvckt4b3NHbFoxYVhvZkFUVFE0VFNOUXlPMElqQit1?=
 =?utf-8?B?R1I5RGZnaGNPSm5STndMcUt3Y1hBcHl3VUNRWnJaVW5IbWtXTVdlSG9EVWpm?=
 =?utf-8?B?ZnBoS1A1aGxVZVlybWRhL3VBMGw2MnNxRWV4M1N1aUJNcjJUbEVvWlhUVXdv?=
 =?utf-8?B?K1E5MThkeGc2YW9oQzV6YzZnRzVJWUVuckhhOGUza1NHQlJTRk5peHhaRGFz?=
 =?utf-8?B?cklXemZUOEQyNGdkU3JmQXdhbWdlK1JLYW5WWVNNdEdWVHRvWUFxRXBkOVNJ?=
 =?utf-8?B?RzdGaVMzaFNIemxROTdSaHlLOXNqdDZwa3puWDJsUjNRZ1ozSXM3NzdEYXlN?=
 =?utf-8?B?UnFRYTR3UXZxdEsvbHZmWHRHY0tmNkR0Wmx6VDBHbldOTy95aXRnNDRFYXhm?=
 =?utf-8?B?QkV3bGNqeWZBaWlySDhyZWZHVmlmblREazBBY0dBeTVLUllKOE1oclhUMFRV?=
 =?utf-8?B?bEZqRUhSUURHZWQ3R01YUExybjZKOTI2QzJ4RDNoSS9mZ1JCNndmOGlOTnlo?=
 =?utf-8?B?ZjRvcXo5dnBzSk1UMkgyd1VBYkF6V0xVSjZFVFFNcVZJUy9FWkxWTXc3NzhQ?=
 =?utf-8?B?SEJ3N3haMVkrcTdLQWYvOEpLeEFQSFJOcVZpbHQ4bEFvQVBEZWFkdEN3U0Fj?=
 =?utf-8?B?SFI5aWt5QVVRaE04dzFpNFRteEl3dXFuQkpPOGNjRnlkUzl3UGhwdVFDTFNr?=
 =?utf-8?B?SXU5V0Fnd0VjcURhQVpLTVVhZWQwMXUvZHRnZGpWUUF5OWRuMWs0M0IyRHhY?=
 =?utf-8?B?bGx2SG91c3FUbFEyNlNjMS9PTDI5bEl4NnNaa1NRZEM5V2M5WFE1VWxMUDZQ?=
 =?utf-8?B?ejhobTh1RVZGcEF1UXdaQVo2YkVaVjU0RnpMaVFnRjhOS0ZkQWgzYVl2ZHJK?=
 =?utf-8?B?MzhjN20rRkwrUlhDeFBmVm50QnhoV2FtWDRvdHpjVTFGL1EyYjBnNGo5ZTZt?=
 =?utf-8?B?UGNhR2pMc0RQRmtJYU1uc0ZwZlkzVGRBRVl2M2txQjIrRjArT2hYeU5vZjRG?=
 =?utf-8?B?c2paRHhSUkpERkd6ZlBBb2NEN3AxZlNWdkdBZHdkei82QmZ2Sk0wNXAxNmk5?=
 =?utf-8?B?NnBCWkoxWXdLcmhjRnN1cWNnNkVadE9EaHNIbStLVlk5U0ZOUzJjVEpMOCtw?=
 =?utf-8?B?anFKRy95aE9sVkRUYzkvakNsWis5d1QxSXoybjN4bVNkSjVTeVJ0SG9jQmJV?=
 =?utf-8?B?c0Y1di85WUpKS1RsY3l0YWNvdnVtTFEycEhZTEFNeU84UjhmdFlaWjQ2ZE5C?=
 =?utf-8?B?S0JOcG9peHRidFJ6RVNxY0grVENqcjhJTTZUbm1aaXRhMjE4dGtFOGxZNHQx?=
 =?utf-8?B?Y1puUFRLbDJOeVcvTitFampHc2VobExqYmIzOXgxUk12Tlp4ZmZJcWJXRERP?=
 =?utf-8?B?bjVtZTZGZkNRN1phaGEvTW1VRGt6Q2hPZmN3ZDhYVTFLN2NNS09VckVzdUhz?=
 =?utf-8?B?UE1VRUVtdmZHTEF0eEc0L29MN1VveTd4OXBaZHhMbm9QVmhFU3Z1SUZRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB7155.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VStiQy9yRHphZ1p1cVBEam1CbXUzOFVKNGQ3NWJMNG9LdEtYZFQ1VkJ5aVZh?=
 =?utf-8?B?Vm5sbDFiUU9DSnd6Rk5BSHFoTUdmVmNveTd5dUwyZnYwdUE1NGtlaE55MWQ1?=
 =?utf-8?B?SmZiWUJmeHhLK1B1QmsrNVJxYUxEWEdRR2ZWL240dG1YWUZHZ1dGdjZVY0ky?=
 =?utf-8?B?Y1h1azNQQ1RScklxUzNSZ0psWUJ2K2hpM3JSNHZmK0FkZWE5ZzBSckQ3M04x?=
 =?utf-8?B?S0F4WW5UOGxpam9JR3pQVWRsckROeWNpN1VaUmt6ZE83ay92WlF1TFhZa3BF?=
 =?utf-8?B?K3NXR2U2WXJDNGpuU2JUQ0dIZTBUUVJQRHdUdE55UkNVaStMZlNsNDRLendu?=
 =?utf-8?B?TFowTEhyeVRkbUovNXJzZ3FHaEhnbUlIU1B6ckZYQzV6UDhEWWcrSDZuL0w2?=
 =?utf-8?B?UkJmQ3ZoRjM4ZTBxUWtVOUJVQkFjNFVjd1Q4amJabW1KcGpmRUtHYmhpR0NZ?=
 =?utf-8?B?SE9nN1UzaE5GZkJyWjV1K21TNytSNkJ4MTA1Uk55VTNXR0JnU3JVS1RKVFhL?=
 =?utf-8?B?QnJUYkU2WXJXb3hraTRUWVNwRHpxMkhyUHZTU1NKQ2ZUc09aM041ZW8vRlpo?=
 =?utf-8?B?VjZKTCtMR0RTejlnTElIUkw5QVlXb0V0dDZhTEJNRmJsTjRHeVJMb1hmTlBn?=
 =?utf-8?B?Zm1wZDlNQm1HSWpmVFJQc0tJeVJHQzNjYzd4RzdZdVVhMERJNUZkckJtRWdr?=
 =?utf-8?B?NHBOU1FtN2FuWmFaeUMwMUdtOGpaL3plL2ZxVk8zcVJ0SGlDM2FuTnJlWmhx?=
 =?utf-8?B?cnE5Z0tKVkh0K2dYdGpZYTlBN2Q4bzZBSzlBQmdrYW9GaVFid0licjRQcUc1?=
 =?utf-8?B?YlN1Ny9YbmxVTnozYVltazZ5b1Q2ZnNFRlJuMWZXR3lSaVRCU2dPUFUrN29H?=
 =?utf-8?B?RjVVNnNheGFyME12Z21MRjRSYzc1ZVFrbzlEcUE5YlZZU1VvMWQxeUZEOTdz?=
 =?utf-8?B?NVZoSnBnM21oVmVSWk96cCs5b2VRWVgyMVZDUmVQNSsvSUZWVVovb2JQWGhu?=
 =?utf-8?B?TFNEejlNOFBYMldGS3RQZWd2TWtOeU5mcng5eUVBZnlSamZPRzlNd3FUQk4x?=
 =?utf-8?B?d1JqVDJVcUdUeUNXdnVNT1NXbnBxbmpraDUzN1BvUlc5V0tFMSt5VzhkdFcz?=
 =?utf-8?B?cUxqV3h3Z1hscEdUN0VBVjIzTFM4OTNQZy82MXpldUtNTU5YRWxZcG5uK1R0?=
 =?utf-8?B?MTNzaUhEeUp1dHRHRXdRdjZhOE9BR3R1OUtCamNibHpaaXFqeitGUEpnMXpJ?=
 =?utf-8?B?NGpqZWwyZ0lENitaalhURDFCUGhqMEdKY3gxQUtwdkNKSjc4SkIxcXNJWGhy?=
 =?utf-8?B?ajk5TUJxa2RBaTRkK3FHTlBZemVzUU1sZWoxWDhLSk1LRWg2d3dUblZhb1JI?=
 =?utf-8?B?VGlvM3VqUFA5ZE9YRjhBa2w1QXNxellmd2lyZGlldHNuUUpsTmFWRVlCWTV3?=
 =?utf-8?B?aWNTcXdRdU1xUXdVN0lCdTJhMStOR1daVnVIcGcwU0VhU2VaRmF2R0xBVFBu?=
 =?utf-8?B?S1RpT0ZDOTlKMVR6M2lWVWdFblZ0K2NqUjVJdjZLLzRYMXJvWitNN1k3VnVV?=
 =?utf-8?B?S1VZSmxXdElDVE9iSU9weGYvRHFlM005N3Ixc2lGbDZwTXpvQmM0c2E5cGkx?=
 =?utf-8?B?WGxEOVNwbHh5MFMwMzBrZ3ZpQkFtaVpHd1NrSHJOZ0diZW9kM0JxWGdMdkNh?=
 =?utf-8?B?TkZzSExZZzRrSXZadU1xQ1ZkMXREVEVINzE2RWR6UnRzOU9aZHdzTDhQcXJB?=
 =?utf-8?B?ODNEeklzbENBUzE0VXNxQ3VyL3d5cFlkcVBLUnUzT3pWK0FEV1Q0YWlqbjhI?=
 =?utf-8?B?SzRmUHdIWThzWk1mK2ZHRlM2VlFUVVRhZUFpUHFBb2tJQVZ0NkhNMWlaNWZ0?=
 =?utf-8?B?TUQ4WGk0UjR0NEhXQkt2SGZPVVJmYStBWWxJM0pOTXdwRHZZalhzQThtNmh5?=
 =?utf-8?B?dzl0Sklob1VhMkcrbVhGQlY2QlY1OEZNaDlqOExvT05XY0RHdGRsS1IveWJB?=
 =?utf-8?B?dS9iQjRWY0VPdS9QWFljMmJlcVN4OE1nMlFrZnNPa0xkVmFLbmhUaG1qbUdp?=
 =?utf-8?B?NG41UWNhckFLOWo3VWJPUVVWZkdObjloaVVheXBoaHlWTmxpVVd0UEp1WFNG?=
 =?utf-8?B?c2trWEJ3UHBYVDhxTzRoOStEOHloNmhyUWg2QzNKSkZ6WVhBRXFpclNRVGtK?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4a5dfbf-b13f-4ba0-4d7c-08dc869a6711
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB7155.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 02:34:49.3804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pfbsKou4g3S+ZulfpzwCVPBgr+eI1EG2SpHoYkfZSngoY6a4l7GapAoA1Kiklz8+XrhVkn0Xix6e50KvuTckCy3Gcl5YI6BScLKAr0jrL/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7975
X-Proofpoint-GUID: DTBtWv7aIJgQTmbqpfJplmb1W5c3QU6R
X-Proofpoint-ORIG-GUID: FSqy7WODJfaudkIUvY5PWz9rcueZL9Hz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-06_20,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406070019
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 45722coT018043
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jun 2024 02:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110757


On 2024-06-06 21:57, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> This is needed on master as well. Is there a reason why it should not
> be done on master ?
Agree, I think this is needed on master as well too.
>   I have taken it for master testing, once it shows up in master then
> send a backport.
>
> On Thu, Jun 6, 2024 at 3:13=E2=80=AFAM Wentao Zhang via lists.openembed=
ded.org
> <wentao.zhang=3Dwindriver.com@lists.openembedded.org> wrote:
>> libbpf supports x86_64 and i.86, remove libbpf from NON_MULTILIB_RECIP=
ES
>> for x86 and x86-64
>>
>> Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
>> ---
>>   meta-oe/conf/layer.conf | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
>> index 77855dc65..a254990ec 100644
>> --- a/meta-oe/conf/layer.conf
>> +++ b/meta-oe/conf/layer.conf
>> @@ -115,3 +115,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS +=3D " \
>>   DEFAULT_TEST_SUITES:pn-meta-oe-ptest-image =3D " ${PTESTTESTSUITE}"
>>
>>   NON_MULTILIB_RECIPES:append =3D " crash pahole libbpf"
>> +
>> +NON_MULTILIB_RECIPES:remove:x86 =3D "libbpf"
>> +NON_MULTILIB_RECIPES:remove:x86-64 =3D "libbpf"
>> --
>> 2.25.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#110745): https://lists.openembedded.org/g/openembe=
dded-devel/message/110745
>> Mute This Topic: https://lists.openembedded.org/mt/106520257/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
--=20
=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=
=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=
=AE=E2=98=AE=E2=98=AE=E2=98=AE
=E2=98=AE Wentao Zhang
=E2=98=AE Wind River Linux
=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=
=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=AE=E2=98=
=AE=E2=98=AE=E2=98=AE=E2=98=AE


