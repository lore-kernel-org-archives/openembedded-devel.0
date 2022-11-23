Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C41C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 21:46:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9158.1669239990476898709
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Nov 2022 13:46:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=VmyIaURm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8326ee070f=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ANJUOnu023150
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 21:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=8qcayI+Sy7420tqKN6PiqDiod1UNb1ft7CTikzPizE0=;
 b=VmyIaURmCC/n+lv22F6m4+rL4BhgKDRHdGiruedrWvYXHSLO+pU75RWx4xY1UIa8K17b
 COao0o+SN+S7TBJqY/sgrwE266xswYNFKYdlR+SSaT9tLXS0pBMHvX0Ji+YlWOM91UUA
 h4nA182DEQ9oxVmnysA0qn0PpuQ+ZsGdIs+gdMDY2xkTBZX8odrIZAFGV3u2+atSOdYG
 DoDf1e4FUNggegJkf3zLCgvEK/zZWr/KhCXJzG3s2cfXLqIbRC7O6gEul3HXU0unTdLv
 M8JWnkyU3spl4aMDn9e4fRvGTF68MwkJ5RQMdpq6+aT/N9z7lAuU3oiO0QPFmVxtcHTC BQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxp48krup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 21:46:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+1G5oiXs/jFNC1Oi+/BpjFnjzyCxFFNM8Dt/ABbmCam7B8usapLKJTYue/TiqIlHb7VppiijNCS4zQm5kSdP2waLVUV48Ez8TmU1s2Ca/32lb6Z32EQI9eXWApFcxQkkjVsXPOPaKmH5SXrfzUJgAp5TUfb7WQ/04RNwuDiefSGx42er96xeaqBaO5qi8Zi2grpeN8ClJ5745fZ+tXLunSPpWOsSfueswLyEWrQ6srVR0GW0oPePcEvGl22JnEg8XY6P3G4KLqPVwdzg1lczxDfqb7uwKOKJxV/297CKoZafaZnT/OHPkyN0ErWPdvQIOW8jzgXOSNMgu8B0dNsyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qcayI+Sy7420tqKN6PiqDiod1UNb1ft7CTikzPizE0=;
 b=nIVqZ/f9YyNIWr4/lbrWlfMc4M5npLdTAI/u2wQA6OrKZRugfWHWvZi2ZlYfH2ivor9+XUee00QLNkyPRqYQd1fHFJI0kzrMcmPicdEBfTEFP1lk5+5mqTOyaLzQG7Ru07qojVN5cS1rtlsB92iMlINLT/Y529XjlK0AZxGl5ELGBRoIYw74BRjUyUvTR8nHMGlGCMMvbOmVR7BoAkV5xpWMQK75vvFRTAHezWdDQI6QWGICFeG6nM+oJ6b0zscLr2M6U5zoNWbZcddEPn2wce6+c2a1Mwbn9sFnrDsJE4azlDekrrWmC3GMrWNy/FuOdOYiC1IpXadfqltZp7Z0pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by SA0PR11MB4543.namprd11.prod.outlook.com (2603:10b6:806:99::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 21:46:21 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 21:46:20 +0000
Content-Type: multipart/alternative;
 boundary="------------m8CUvG5OwFPvLk6L1a9JHA58"
Message-ID: <108d442c-d7ea-5341-8a93-5f9bea3ce09e@windriver.com>
Date: Wed, 23 Nov 2022 16:46:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-openembedded][kirkstone][PATCH 1/1] syslog-ng: fix
 CVE-2022-38725
Content-Language: en-CA
To: Yogita.Urade@windriver.com,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Cc: "G Pillai, Hari" <Hari.GPillai@windriver.com>,
        "Mali, Narpat" <Narpat.Mali@windriver.com>
References: <BL0PR11MB3410ED9545E8270BCD2AD42D9F0A9@BL0PR11MB3410.namprd11.prod.outlook.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <BL0PR11MB3410ED9545E8270BCD2AD42D9F0A9@BL0PR11MB3410.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::27) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|SA0PR11MB4543:EE_
X-MS-Office365-Filtering-Correlation-Id: bd14b313-18d7-45d5-9b1c-08dacd9c2810
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GGnmhD6geEMrhdejQIvYZ9CUXFvxsnNM8azhwGzUWJBeZL1BlXeBHVZwDPgI+ZTEbCzb4R0p3/zHUJFLZC3EdyvuC7h3ULUNe29yLo9kPzmk1dB4j7H4+02nx+xbwL7zaFbLhUgIWpD0O7FVIcGLVcx0G8ElNCo7QMuJUiudf/yj2XKl7KWNUnR1awXP+n4uIwT3G2mWUZgSBsO/n1kOoYWEIiKMX6nQEnpn87CMrBReB5lfBGEesG6NlbX+RzYnahS4p63Bg3vztmUNdh72HPF8lg9Qvlw9wiHOHuU35Hh4mKJ2DdvzBXfjvOCsSR6r8b+Vx1Lm4TyQD3h2zUotKzoaHUqTI6IFv1cjDbDfHT0BoSBFRhD9Daig8b4MrbSOtXVEGm9CMNX/FzHzOWxZyN+F6430GH7H4kHY1Ifps0KPgOuV/l9U7bH7FyFgCSlhWDcFFlMwd3Mz0VQtcEJcpEfZZM9lFeaNmUpyqvZfdy66nhty7o0erEc1QahXrVTxsdsLf6fq02W+DqJtSWTA3DMBNoh+YDAeg0ivplopRNIpT+4Jh0lBDgpTbXoYK/gI862jMzP1kVUmSxt/mHNZjLPrHhwJ4ZQt/NZcKVOigYORswqjGmwKf31vGGMpbl0FkHJzKHM7oVOwokdxI5I5784iT35zfpAakG8yL54nNKbvkh1EFaakvVXfqZ4igELFGRGKF9QukbsTjxAsrF1zXw0YqgXoz0Mw96KqPNVgM1Z639VRrMH5lR0tZRRe+KxPYUQzJvylix5DEm/NMiQNQ/wzz1AK7yq61Ot5V89Z6pdOlCZdicrnk2PqZi7NdLO0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(39850400004)(366004)(376002)(451199015)(6916009)(8936002)(54906003)(166002)(316002)(5660300002)(66476007)(31696002)(66556008)(2616005)(186003)(86362001)(66574015)(966005)(8676002)(6486002)(6666004)(107886003)(66946007)(6512007)(478600001)(33964004)(26005)(6506007)(53546011)(41300700001)(38100700002)(4326008)(83380400001)(31686004)(4001150100001)(66899015)(2906002)(30864003)(36756003)(2004002)(43740500002)(45980500001)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y3NOaDkrTENwZ1UyRHg2Vk9BeG9CS1FzOVUwbFdMVk51bkpIc1hNMHBMdFR3?=
 =?utf-8?B?YmpNWTNMaWw5QVN6QWZvWlRkN3dvYzRTVkpCSmRmQ3Q2M2tUWmtGWUgxelJI?=
 =?utf-8?B?YVBVNnoybE5KWG9wT2FocGc2OExFYWlwakFYZThxdW5kYXNWNkhxa0lCdURw?=
 =?utf-8?B?emM1NkpXYlQ4ZEJIRWxmZjVuWHZzY20wOHVFanNpMWhadm5IU29KUWgrRHZu?=
 =?utf-8?B?ODdmcWJqa0hMRzQ5M084d1dyOVk3MkR5b3Qyd2IxRFlZSitDMlhQcmFJazBY?=
 =?utf-8?B?V1VlMk5OTXp6TTlTcVljdm9vVzhkdVB6cFA2VWFJekhwdGF6ak1nK2Zab1hz?=
 =?utf-8?B?TzJaUUx1SFlVYzQvOUVDZVQvVk9zRTlESGI5SkV5TFA3NW15YmRwTjh4ZTh4?=
 =?utf-8?B?eWtlMjRET1l0cCs4dE01eUNwR2tEWUM4cDkxK1YwcFVBMlYvUnhEMXFRSUJl?=
 =?utf-8?B?dUJkZzJ6R0RTa0NMZmY5V1VFYlFpR0ZDVXlqZlpiZ0hNV2dpd3hSZjRCK1lz?=
 =?utf-8?B?enNPcUlzM2tiZVlmL3JxY1kzaVUzczlPWk1raXFYU0djYVpMbmpSK25HVDZQ?=
 =?utf-8?B?aEhyY1phZ2JYS1ppOG93Yk1TNDAyN0dNRnNpZ1Y1T1lCeTQxRDBKUFViRHB1?=
 =?utf-8?B?YlNrMmg4S1Zudk5va3FiaFdpNDZCUlUzclI1Y3Y2L1d2OTVQb0o5MDhQc2lE?=
 =?utf-8?B?UnNqQVdNa3NONHBCZTFUWi9iMktzU2YzQlVOdzIxc0VydFhOcVI3ZEhPTVJG?=
 =?utf-8?B?ZS9CclE3SC85VVBnZU0yL2tzK01RVFN2NHFSd0NSVVdMeUR0WTRiT3ZMbzRQ?=
 =?utf-8?B?OXg2YStqbXVRTjNJYktlcWZOdGgzcUxoSE1oRWh1VWtLREhUbS81aDlGM09a?=
 =?utf-8?B?NTMzVEpsSkJHbmdxVFh6VDNCYlpOMSt3ZmlMSDcrT0pVd3V2RzZjbFRFVXBu?=
 =?utf-8?B?eVBhSGVzWmExbTNYemk5dGozbW9GRmpYNmdTNXdBSmtUbXRFclJiVTRSNlVs?=
 =?utf-8?B?OUp0a2NQdDlUKzJqWDAybDNERnVJT01EbTZyZmRieXFJeWRaU2RYOS9hYi9n?=
 =?utf-8?B?UVlKclJuUEgvYjdlM1ZhVW5YV3RHYTAvajR5dmRONWxXVUV1a1RMb1duU2pC?=
 =?utf-8?B?VHdxaWhWN2xzbVFkNCtpcDJHWENKeEZ3cG5Iem1kenErc3pLWFd4cnFOU0F2?=
 =?utf-8?B?akluYjFyYTkzZmdwaG9SaFYySTA2dHpDcEZ2TCtoeU14UGU1d21PL1RCdkt1?=
 =?utf-8?B?cEFqZGw4V0pmUWpjZDZjS3FjdFYyWjN6a0tHVUJtMlljMStOOTJIM2p2OGl6?=
 =?utf-8?B?VG9uVENkQktSZzR4SURKVlUydnlOVlRkWFg0MlJkMXhJQU9BZDJIUXRLK0pT?=
 =?utf-8?B?bStGWGxrV2JCWkd5anBWazF0UUF1SXNBM0ZSVDMxb0dlbXdzRVZ5ak1IQVAw?=
 =?utf-8?B?V3dSeEUvRXhOdEVOUFVqWjJvc1pSUTZTYWNjaTI1eHJpWnZmUXppNWEzZW5l?=
 =?utf-8?B?OFV4WitYQTVNeVA2TjNXTkd6R0VnYzlkUzN6WVFWOXg1WEpFSXh4UVhkcWNH?=
 =?utf-8?B?ODJuUlRzdHVkNkEwQklrUGp2cEY2aDUwLzgvME8rYTNwSXREdHhwQWdHV1FN?=
 =?utf-8?B?WHYzOFljSmNTcUdUbUMrTjVpR1dqeHBOTThUWWIxUjRWY0M3dGZENTdvUUZ2?=
 =?utf-8?B?MzhjZTU2eEtUdUd6SGIxM3Vad0FZQWdsdDNra0Nyb0t6U0lCWTdoRlVFSlo4?=
 =?utf-8?B?WjY0V1ZJV3E3SlFUQ0ZQM3JYald3bDFHM2hQQ2piRExqMEdpTi9XNmJ3aGlE?=
 =?utf-8?B?YTB6OThLWmpFcFhyandlSUIrbTQrWFNlclZJT1E5dVFTR0V5R2hBa3NXYWZO?=
 =?utf-8?B?OFpOeU92T3FqZ2laQ0hJNUgyRVRHKzRRbUwzeFNnck1hMkRXSlgrQTFvOWhR?=
 =?utf-8?B?MHBpV0tIbkxkN0hKd09tbHNaVjdDVURqVmdRdzF1TlpWNFJlMld1Z1dIM2d5?=
 =?utf-8?B?UTgrZkN2eCtxVDRaSzkzb01DUy9OZmVEUE9EWG1QSTZ2bi83ajdHUzBnMUxv?=
 =?utf-8?B?eU1zNnFjZldab3k4WDJqRTVYZm5idHhTdW5kTHV6ZmVsa3M2cVRNRTVIUnVE?=
 =?utf-8?B?V3IvUnpSQU5IQVJyYjJhZk5JYWdKclRzQ2xWT0VXUUJVazV0WDFXSW5HN3pt?=
 =?utf-8?B?alE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd14b313-18d7-45d5-9b1c-08dacd9c2810
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 21:46:20.7271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYULOGUqRSsMxfFQuSIGlg9rMkVBNShONwWXfheOH3h3OFlmwmk3aBYTTOpxJ89B8o2t589nVAPmEJHb2GSRi4rWMnPNowEciP17UVc2S+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4543
X-Proofpoint-GUID: mG9MfV2nsLe0ZjWBxns5or3TJ3V0Ubor
X-Proofpoint-ORIG-GUID: mG9MfV2nsLe0ZjWBxns5or3TJ3V0Ubor
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_12,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230159
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Nov 2022 21:46:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99704

--------------m8CUvG5OwFPvLk6L1a9JHA58
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2ANJUOnu023150

Hi Yogita,

On 2022-11-21 05:29, Urade, Yogita via lists.openembedded.org wrote:
>
> Issue: LIN1022-1598
>
The line above is only for internal WR reviews, please drop.
>
>
> Fix buffer handling of syslog and timestamp parsers.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2022-38725
> https://github.com/syslog-ng/syslog-ng/releases
> https://github.com/syslog-ng/syslog-ng/pull/4110
>
> Upstream patches:
> https://github.com/syslog-ng/syslog-ng/commit/b5a060f2ebb8d794f508436a1=
2e4d4163f94b1b8
> https://github.com/syslog-ng/syslog-ng/commit/81a07263f1e522a376d3a30f9=
6f51df3f2879f8a
> https://github.com/syslog-ng/syslog-ng/commit/4b8dc56ca8eaeac4c8751a305=
eb7eeefab8dc89d
> https://github.com/syslog-ng/syslog-ng/commit/73b5c300b8fde5e7a4824baa8=
3a04931279abb37
> https://github.com/syslog-ng/syslog-ng/commit/45f051239312e43bd4f92b933=
9fe67c6798a0321
> https://github.com/syslog-ng/syslog-ng/commit/09f489c89c826293ff8cbd282=
cfc866ab56054c4
> https://github.com/syslog-ng/syslog-ng/commit/8c6e2c1c41b0fcc5fbd464c35=
f4dac7102235396
> https://github.com/syslog-ng/syslog-ng/commit/56f881c5eaa3d8c02c96607c4=
b9e4eaf959a044d
>
> (LOCAL REV: NOT UPSTREAM) -- Not applicable, upstream out of maintenanc=
e
>
The line above is only for internal WR reviews, please drop.

Also, this is the upstream for WR Linux, so it's not out of maintenance! =
;-)

Other than that, this looks good.

Please send a v2.

Thanks,

../Randy

>
> Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> ---
> =C2=A0.../syslog-ng/files/CVE-2022-38725-0001.patch |=C2=A0 67 ++++++
> =C2=A0.../syslog-ng/files/CVE-2022-38725-0002.patch | 152 +++++++++++++
> =C2=A0.../syslog-ng/files/CVE-2022-38725-0003.patch |=C2=A0 79 +++++++
> =C2=A0.../syslog-ng/files/CVE-2022-38725-0004.patch |=C2=A0 40 ++++
> =C2=A0.../syslog-ng/files/CVE-2022-38725-0005.patch | 213 +++++++++++++=
+++++
> =C2=A0.../syslog-ng/files/CVE-2022-38725-0006.patch | 182 +++++++++++++=
++
> =C2=A0.../syslog-ng/files/CVE-2022-38725-0007.patch |=C2=A0 84 +++++++
> =C2=A0.../syslog-ng/files/CVE-2022-38725-0008.patch |=C2=A0 47 ++++
> =C2=A0.../syslog-ng/syslog-ng_3.36.1.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +
> =C2=A09 files changed, 872 insertions(+)
> =C2=A0create mode 100644=20
> meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch
> =C2=A0create mode 100644=20
> meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch
> =C2=A0create mode 100644=20
> meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch
> =C2=A0create mode 100644=20
> meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch
> =C2=A0create mode 100644=20
> meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch
> =C2=A0create mode 100644=20
> meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch
> =C2=A0create mode 100644=20
> meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch
> =C2=A0create mode 100644=20
> meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch
>
> diff --git=20
> a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch=20
> b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch
> new file mode 100644
> index 000000000..cd6a93d8e
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch
> @@ -0,0 +1,67 @@
> +From c6e7195075fd4fbd3db04e187f6d75030d17cb6b Mon Sep 17 00:00:00 2001
> +From: Laszlo Varady <laszlo.varady@protonmail.com>
> +Date: Sat, 20 Aug 2022 12:26:05 +0200
> +Subject: [PATCH 1/8] syslogformat: fix out-of-bounds reading of data=20
> buffer
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady <laszlo.varady@protonmail.=
com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-38725
> +
> +Reference to upstream patch:
> +https://github.com/syslog-ng/syslog-ng/commit/b5a060f2ebb8d794f508436a=
12e4d4163f94b1b8
> +
> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> +---
> + modules/syslogformat/syslog-format.c | 10 +++++++---
> + 1 file changed, 7 insertions(+), 3 deletions(-)
> +
> +diff --git a/modules/syslogformat/syslog-format.c=20
> b/modules/syslogformat/syslog-format.c
> +index 38bb6f6..9042396 100644
> +--- a/modules/syslogformat/syslog-format.c
> ++++ b/modules/syslogformat/syslog-format.c
> +@@ -223,6 +223,9 @@=20
> log_msg_parse_cisco_timestamp_attributes(LogMessage *self, const=20
> guchar **data,
> +=C2=A0=C2=A0 const guchar *src =3D *data;
> +=C2=A0=C2=A0 gint left =3D *length;
> +
> ++=C2=A0 if (!left)
> ++=C2=A0=C2=A0=C2=A0 return;
> ++
> +=C2=A0=C2=A0 /* Cisco timestamp extensions, the first '*' indicates th=
at the=20
> clock is
> +=C2=A0=C2=A0=C2=A0 * unsynced, '.' if it is known to be synced */
> +=C2=A0=C2=A0 if (G_UNLIKELY(src[0] =3D=3D '*'))
> +@@ -556,7 +559,7 @@ log_msg_parse_sd(LogMessage *self, const guchar=20
> **data, gint *length, const MsgF
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 open_sd++;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!isascii(*=
src) || *src =3D=3D '=3D' || *src =3D=3D ' ' || *src=20
> =3D=3D ']' || *src =3D=3D '"')
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!left || !=
isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D ' '=20
> || *src =3D=3D ']' || *src =3D=3D '"')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 goto error;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* read s=
d_id */
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pos =3D 0=
;
> +@@ -589,7 +592,8 @@ log_msg_parse_sd(LogMessage *self, const guchar=20
> **data, gint *length, const MsgF
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sd_id_len=
 =3D pos;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strcpy(sd=
_value_name, logmsg_sd_prefix);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 strncpy(s=
d_value_name + logmsg_sd_prefix_len, sd_id_name,=20
> sizeof(sd_value_name) - logmsg_sd_prefix_len);
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (*src =3D=3D=
 ']')
> ++
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (left && *s=
rc =3D=3D ']')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 log_msg_set_value_by_name(self, sd_value_name, "", 0);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 }
> +@@ -606,7 +610,7 @@ log_msg_parse_sd(LogMessage *self, const guchar=20
> **data, gint *length, const MsgF
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 goto error;
> +
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (!isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D ' ' ||=20
> *src =3D=3D ']' || *src =3D=3D '"')
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (!left || !isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D=
=20
> ' ' || *src =3D=3D ']' || *src =3D=3D '"')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 goto error;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 /* read sd-param */
> +--
> +2.37.3
> +
> +
> diff --git=20
> a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch=20
> b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch
> new file mode 100644
> index 000000000..ac5bc78a5
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch
> @@ -0,0 +1,152 @@
> +From f8f985cd0902e0fa8306f988fb183f1987ab7d3b Mon Sep 17 00:00:00 2001
> +From: Laszlo Varady <laszlo.varady@protonmail.com>
> +Date: Sat, 20 Aug 2022 12:22:44 +0200
> +Subject: [PATCH 2/8] syslogformat: add bug reproducer test for non-zer=
o
> + terminated input
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady <laszlo.varady@protonmail.=
com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-38725
> +
> +Reference to upstream patch:
> +https://github.com/syslog-ng/syslog-ng/commit/81a07263f1e522a376d3a30f=
96f51df3f2879f8a
> +
> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> +---
> + modules/syslogformat/CMakeLists.txt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> + modules/syslogformat/Makefile.am=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> + modules/syslogformat/tests/CMakeLists.txt=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 1 +
> + modules/syslogformat/tests/Makefile.am=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 9 +++
> + .../syslogformat/tests/test_syslog_format.c=C2=A0=C2=A0 | 72 ++++++++=
+++++++++++
> + 5 files changed, 85 insertions(+)
> + create mode 100644 modules/syslogformat/tests/CMakeLists.txt
> + create mode 100644 modules/syslogformat/tests/Makefile.am
> + create mode 100644 modules/syslogformat/tests/test_syslog_format.c
> +
> +diff --git a/modules/syslogformat/CMakeLists.txt=20
> b/modules/syslogformat/CMakeLists.txt
> +index 94ee01a..64848ef 100644
> +--- a/modules/syslogformat/CMakeLists.txt
> ++++ b/modules/syslogformat/CMakeLists.txt
> +@@ -14,3 +14,4 @@ add_module(
> +=C2=A0=C2=A0 SOURCES ${SYSLOGFORMAT_SOURCES}
> + )
> +
> ++add_test_subdirectory(tests)
> +diff --git a/modules/syslogformat/Makefile.am=20
> b/modules/syslogformat/Makefile.am
> +index f13f88c..14cdf58 100644
> +--- a/modules/syslogformat/Makefile.am
> ++++ b/modules/syslogformat/Makefile.am
> +@@ -31,3 +31,5 @@=20
> modules_syslogformat_libsyslogformat_la_DEPENDENCIES =3D=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
> + modules/syslogformat modules/syslogformat/ mod-syslogformat: \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 modules/syslogformat/libsys=
logformat.la
> + .PHONY: modules/syslogformat/ mod-syslogformat
> ++
> ++include modules/syslogformat/tests/Makefile.am
> +diff --git a/modules/syslogformat/tests/CMakeLists.txt=20
> b/modules/syslogformat/tests/CMakeLists.txt
> +new file mode 100644
> +index 0000000..2e45b71
> +--- /dev/null
> ++++ b/modules/syslogformat/tests/CMakeLists.txt
> +@@ -0,0 +1 @@
> ++add_unit_test(CRITERION TARGET test_syslog_format DEPENDS syslogforma=
t)
> +diff --git a/modules/syslogformat/tests/Makefile.am=20
> b/modules/syslogformat/tests/Makefile.am
> +new file mode 100644
> +index 0000000..7ee66a5
> +--- /dev/null
> ++++ b/modules/syslogformat/tests/Makefile.am
> +@@ -0,0 +1,9 @@
> ++modules_syslogformat_tests_TESTS =3D \
> ++=C2=A0=C2=A0=C2=A0 modules/syslogformat/tests/test_syslog_format
> ++
> ++check_PROGRAMS +=3D ${modules_syslogformat_tests_TESTS}
> ++
> ++EXTRA_DIST +=3D modules/syslogformat/tests/CMakeLists.txt
> ++
> ++modules_syslogformat_tests_test_syslog_format_CFLAGS =3D=20
> $(TEST_CFLAGS) -I$(top_srcdir)/modules/syslogformat
> ++modules_syslogformat_tests_test_syslog_format_LDADD =3D $(TEST_LDADD)=
=20
> $(PREOPEN_SYSLOGFORMAT)
> +diff --git a/modules/syslogformat/tests/test_syslog_format.c=20
> b/modules/syslogformat/tests/test_syslog_format.c
> +new file mode 100644
> +index 0000000..b247fe3
> +--- /dev/null
> ++++ b/modules/syslogformat/tests/test_syslog_format.c
> +@@ -0,0 +1,72 @@
> ++/*
> ++ * Copyright (c) 2022 One Identity
> ++ * Copyright (c) 2022 L=C3=A1szl=C3=B3 V=C3=A1rady
> ++ *
> ++ * This program is free software; you can redistribute it and/or=20
> modify it
> ++ * under the terms of the GNU General Public License version 2 as=20
> published
> ++ * by the Free Software Foundation, or (at your option) any later=20
> version.
> ++ *
> ++ * This program is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the
> ++ * GNU General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU General Public License
> ++ * along with this program; if not, write to the Free Software
> ++ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA=C2=A0=20
> 02110-1301=C2=A0 USA
> ++ *
> ++ * As an additional exemption you are allowed to compile & link=20
> against the
> ++ * OpenSSL libraries as published by the OpenSSL project. See the fil=
e
> ++ * COPYING for details.
> ++ *
> ++ */
> ++
> ++#include <criterion/criterion.h>
> ++
> ++#include "apphook.h"
> ++#include "cfg.h"
> ++#include "syslog-format.h"
> ++#include "logmsg/logmsg.h"
> ++#include "msg-format.h"
> ++#include "scratch-buffers.h"
> ++
> ++#include <string.h>
> ++
> ++GlobalConfig *cfg;
> ++MsgFormatOptions parse_options;
> ++
> ++static void
> ++setup(void)
> ++{
> ++=C2=A0 app_startup();
> ++=C2=A0 syslog_format_init();
> ++
> ++=C2=A0 cfg =3D cfg_new_snippet();
> ++=C2=A0 msg_format_options_defaults(&parse_options);
> ++}
> ++
> ++static void
> ++teardown(void)
> ++{
> ++=C2=A0 scratch_buffers_explicit_gc();
> ++=C2=A0 app_shutdown();
> ++=C2=A0 cfg_free(cfg);
> ++}
> ++
> ++TestSuite(syslog_format, .init =3D setup, .fini =3D teardown);
> ++
> ++Test(syslog_format,=20
> parser_should_not_spin_on_non_zero_terminated_input, .timeout =3D 10)
> ++{
> ++=C2=A0 const gchar *data =3D "<182>2022-08-17T05:02:28.217 mymachine =
su:=20
> 'su root' failed for lonvick on /dev/pts/8";
> ++=C2=A0 /* chosen carefully to reproduce a bug */
> ++=C2=A0 gsize data_length =3D 27;
> ++
> ++=C2=A0 msg_format_options_init(&parse_options, cfg);
> ++=C2=A0 LogMessage *msg =3D msg_format_construct_message(&parse_option=
s,=20
> (const guchar *) data, data_length);
> ++
> ++=C2=A0 gsize problem_position;
> ++=C2=A0 cr_assert(syslog_format_handler(&parse_options, msg, (const gu=
char=20
> *) data, data_length, &problem_position));
> ++
> ++=C2=A0 msg_format_options_destroy(&parse_options);
> ++=C2=A0 log_msg_unref(msg);
> ++}
> +--
> +2.37.3
> +
> +
> diff --git=20
> a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch=20
> b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch
> new file mode 100644
> index 000000000..34e6b65d2
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch
> @@ -0,0 +1,79 @@
> +From 041ccdf8a4c73cd3138dac0611272361f384fb81 Mon Sep 17 00:00:00 2001
> +From: Laszlo Varady <laszlo.varady@protonmail.com>
> +Date: Sun, 21 Aug 2022 18:44:28 +0200
> +Subject: [PATCH 3/8] syslogformat: fix reading cisco sequence id out=20
> of bounds
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady <laszlo.varady@protonmail.=
com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-38725
> +
> +Reference to upstream patch:
> +https://github.com/syslog-ng/syslog-ng/commit/4b8dc56ca8eaeac4c8751a30=
5eb7eeefab8dc89d
> +
> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> +---
> + modules/syslogformat/syslog-format.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> + .../syslogformat/tests/test_syslog_format.c=C2=A0=C2=A0 | 32 ++++++++=
+++++++++++
> + 2 files changed, 33 insertions(+), 1 deletion(-)
> +
> +diff --git a/modules/syslogformat/syslog-format.c=20
> b/modules/syslogformat/syslog-format.c
> +index 9042396..fe829fb 100644
> +--- a/modules/syslogformat/syslog-format.c
> ++++ b/modules/syslogformat/syslog-format.c
> +@@ -207,7 +207,7 @@ log_msg_parse_cisco_sequence_id(LogMessage *self,=20
> const guchar **data, gint *len
> +
> +=C2=A0=C2=A0 /* if the next char is not space, then we may try to read=
 a date */
> +
> +-=C2=A0 if (*src !=3D ' ')
> ++=C2=A0 if (!left || *src !=3D ' ')
> +=C2=A0=C2=A0=C2=A0=C2=A0 return;
> +
> +=C2=A0=C2=A0 log_msg_set_value(self, handles.cisco_seqid, (gchar *) *d=
ata,=20
> *length - left - 1);
> +diff --git a/modules/syslogformat/tests/test_syslog_format.c=20
> b/modules/syslogformat/tests/test_syslog_format.c
> +index b247fe3..d0f5b40 100644
> +--- a/modules/syslogformat/tests/test_syslog_format.c
> ++++ b/modules/syslogformat/tests/test_syslog_format.c
> +@@ -70,3 +70,35 @@ Test(syslog_format,=20
> parser_should_not_spin_on_non_zero_terminated_input, .timeou
> +=C2=A0=C2=A0 msg_format_options_destroy(&parse_options);
> +=C2=A0=C2=A0 log_msg_unref(msg);
> + }
> ++
> ++Test(syslog_format, cisco_sequence_id_non_zero_termination)
> ++{
> ++=C2=A0 const gchar *data =3D "<189>65536: ";
> ++=C2=A0 gsize data_length =3D strlen(data);
> ++
> ++=C2=A0 msg_format_options_init(&parse_options, cfg);
> ++=C2=A0 LogMessage *msg =3D msg_format_construct_message(&parse_option=
s,=20
> (const guchar *) data, data_length);
> ++
> ++=C2=A0 gsize problem_position;
> ++=C2=A0 cr_assert(syslog_format_handler(&parse_options, msg, (const gu=
char=20
> *) data, data_length, &problem_position));
> ++=C2=A0 cr_assert_str_eq(log_msg_get_value_by_name(msg,=20
> ".SDATA.meta.sequenceId", NULL), "65536");
> ++
> ++=C2=A0 msg_format_options_destroy(&parse_options);
> ++=C2=A0 log_msg_unref(msg);
> ++}
> ++
> ++Test(syslog_format,=20
> minimal_non_zero_terminated_numeric_message_is_parsed_as_program_name)
> ++{
> ++=C2=A0 const gchar *data =3D "<189>65536";
> ++=C2=A0 gsize data_length =3D strlen(data);
> ++
> ++=C2=A0 msg_format_options_init(&parse_options, cfg);
> ++=C2=A0 LogMessage *msg =3D msg_format_construct_message(&parse_option=
s,=20
> (const guchar *) data, data_length);
> ++
> ++=C2=A0 gsize problem_position;
> ++=C2=A0 cr_assert(syslog_format_handler(&parse_options, msg, (const gu=
char=20
> *) data, data_length, &problem_position));
> ++=C2=A0 cr_assert_str_eq(log_msg_get_value_by_name(msg, "PROGRAM", NUL=
L),=20
> "65536");
> ++
> ++=C2=A0 msg_format_options_destroy(&parse_options);
> ++=C2=A0 log_msg_unref(msg);
> ++}
> +--
> +2.37.3
> +
> +
> diff --git=20
> a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch=20
> b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch
> new file mode 100644
> index 000000000..cfad5a378
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch
> @@ -0,0 +1,40 @@
> +From bea4678261328c841b6062014394e6d3230a2fdb Mon Sep 17 00:00:00 2001
> +From: Laszlo Varady <laszlo.varady@protonmail.com>
> +Date: Sat, 20 Aug 2022 12:42:38 +0200
> +Subject: [PATCH 4/8] timeutils: fix iterating out of the range of=20
> timestamp
> + buffer
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady <laszlo.varady@protonmail.=
com>
> +Signed-off-by: Balazs Scheidler <bazsi77@gmail.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-38725
> +
> +Reference to upstream patch:
> +https://github.com/syslog-ng/syslog-ng/commit/73b5c300b8fde5e7a4824baa=
83a04931279abb37
> +
> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> +---
> + lib/timeutils/scan-timestamp.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/lib/timeutils/scan-timestamp.c=20
> b/lib/timeutils/scan-timestamp.c
> +index 2f6a6b7..cb6802d 100644
> +--- a/lib/timeutils/scan-timestamp.c
> ++++ b/lib/timeutils/scan-timestamp.c
> +@@ -328,7 +328,7 @@ __parse_usec(const guchar **data, gint *length)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src++;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (*length)=
--;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (isdigit(*src))
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (*length > 0 && isdigit(*src))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src++;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (*length)=
--;
> +--
> +2.37.3
> +
> +
> diff --git=20
> a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch=20
> b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch
> new file mode 100644
> index 000000000..487118957
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch
> @@ -0,0 +1,213 @@
> +From 1f62031101608bee8ad772967eb8151aa33d6e1a Mon Sep 17 00:00:00 2001
> +From: Balazs Scheidler <bazsi77@gmail.com>
> +Date: Sat, 20 Aug 2022 12:43:42 +0200
> +Subject: [PATCH 5/8] timeutils: add tests for non-zero terminated inpu=
ts
> +
> +Signed-off-by: Balazs Scheidler <bazsi77@gmail.com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-38725
> +
> +Reference to upstream patch:
> +https://github.com/syslog-ng/syslog-ng/commit/45f051239312e43bd4f92b93=
39fe67c6798a0321
> +
> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> +---
> + lib/timeutils/tests/test_scan-timestamp.c | 126 +++++++++++++++++++--=
-
> + 1 file changed, 113 insertions(+), 13 deletions(-)
> +
> +diff --git a/lib/timeutils/tests/test_scan-timestamp.c=20
> b/lib/timeutils/tests/test_scan-timestamp.c
> +index 2756bf3..da375c8 100644
> +--- a/lib/timeutils/tests/test_scan-timestamp.c
> ++++ b/lib/timeutils/tests/test_scan-timestamp.c
> +@@ -49,17 +49,21 @@ fake_time_add(time_t diff)
> + }
> +
> + static gboolean
> +-_parse_rfc3164(const gchar *ts, gchar isotimestamp[32])
> ++_parse_rfc3164(const gchar *ts, gint len, gchar isotimestamp[32])
> + {
> +=C2=A0=C2=A0 UnixTime stamp;
> +-=C2=A0 const guchar *data =3D (const guchar *) ts;
> +-=C2=A0 gint length =3D strlen(ts);
> ++=C2=A0 const guchar *tsu =3D (const guchar *) ts;
> ++=C2=A0 gint tsu_len =3D len < 0 ? strlen(ts) : len;
> +=C2=A0=C2=A0 GString *result =3D g_string_new("");
> +=C2=A0=C2=A0 WallClockTime wct =3D WALL_CLOCK_TIME_INIT;
> +
> +-
> ++=C2=A0 const guchar *data =3D tsu;
> ++=C2=A0 gint length =3D tsu_len;
> +=C2=A0=C2=A0 gboolean success =3D scan_rfc3164_timestamp(&data, &lengt=
h, &wct);
> +
> ++=C2=A0 cr_assert(length >=3D 0);
> ++=C2=A0 cr_assert(data =3D=3D &tsu[tsu_len - length]);
> ++
> +=C2=A0=C2=A0 unix_time_unset(&stamp);
> +=C2=A0=C2=A0 convert_wall_clock_time_to_unix_time(&wct, &stamp);
> +
> +@@ -70,16 +74,21 @@ _parse_rfc3164(const gchar *ts, gchar=20
> isotimestamp[32])
> + }
> +
> + static gboolean
> +-_parse_rfc5424(const gchar *ts, gchar isotimestamp[32])
> ++_parse_rfc5424(const gchar *ts, gint len, gchar isotimestamp[32])
> + {
> +=C2=A0=C2=A0 UnixTime stamp;
> +-=C2=A0 const guchar *data =3D (const guchar *) ts;
> +-=C2=A0 gint length =3D strlen(ts);
> ++=C2=A0 const guchar *tsu =3D (const guchar *) ts;
> ++=C2=A0 gint tsu_len =3D len < 0 ? strlen(ts) : len;
> +=C2=A0=C2=A0 GString *result =3D g_string_new("");
> +=C2=A0=C2=A0 WallClockTime wct =3D WALL_CLOCK_TIME_INIT;
> +
> ++=C2=A0 const guchar *data =3D tsu;
> ++=C2=A0 gint length =3D tsu_len;
> +=C2=A0=C2=A0 gboolean success =3D scan_rfc5424_timestamp(&data, &lengt=
h, &wct);
> +
> ++=C2=A0 cr_assert(length >=3D 0);
> ++=C2=A0 cr_assert(data =3D=3D &tsu[tsu_len - length]);
> ++
> +=C2=A0=C2=A0 unix_time_unset(&stamp);
> +=C2=A0=C2=A0 convert_wall_clock_time_to_unix_time(&wct, &stamp);
> +
> +@@ -90,31 +99,60 @@ _parse_rfc5424(const gchar *ts, gchar=20
> isotimestamp[32])
> + }
> +
> + static gboolean
> +-_rfc3164_timestamp_eq(const gchar *ts, const gchar *expected, gchar=20
> converted[32])
> ++_rfc3164_timestamp_eq(const gchar *ts, gint len, const gchar=20
> *expected, gchar converted[32])
> + {
> +-=C2=A0 cr_assert(_parse_rfc3164(ts, converted));
> ++=C2=A0 cr_assert(_parse_rfc3164(ts, len, converted));
> +=C2=A0=C2=A0 return strcmp(converted, expected) =3D=3D 0;
> + }
> +
> + static gboolean
> +-_rfc5424_timestamp_eq(const gchar *ts, const gchar *expected, gchar=20
> converted[32])
> ++_rfc5424_timestamp_eq(const gchar *ts, gint len, const gchar=20
> *expected, gchar converted[32])
> + {
> +-=C2=A0 cr_assert(_parse_rfc5424(ts, converted));
> ++=C2=A0 cr_assert(_parse_rfc5424(ts, len, converted));
> +=C2=A0=C2=A0 return strcmp(converted, expected) =3D=3D 0;
> + }
> +
> + #define _expect_rfc3164_timestamp_eq(ts, expected) \
> +=C2=A0=C2=A0 ({ \
> +=C2=A0=C2=A0=C2=A0=C2=A0 gchar converted[32]; \
> +-=C2=A0=C2=A0=C2=A0 cr_expect(_rfc3164_timestamp_eq(ts, expected, conv=
erted),=20
> "Parsed RFC3164 timestamp does not equal expected, ts=3D%s,=20
> converted=3D%s, expected=3D%s", ts, converted, expected); \
> ++=C2=A0=C2=A0=C2=A0 cr_expect(_rfc3164_timestamp_eq(ts, -1, expected, =
converted),=20
> "Parsed RFC3164 timestamp does not equal expected, ts=3D%s,=20
> converted=3D%s, expected=3D%s", ts, converted, expected); \
> ++=C2=A0 })
> ++
> ++#define _expect_rfc3164_timestamp_len_eq(ts, len, expected) \
> ++=C2=A0 ({ \
> ++=C2=A0=C2=A0=C2=A0 gchar converted[32]; \
> ++=C2=A0=C2=A0=C2=A0 cr_expect(_rfc3164_timestamp_eq(ts, len, expected,=
 converted),=20
> "Parsed RFC3164 timestamp does not equal expected, ts=3D%s,=20
> converted=3D%s, expected=3D%s", ts, converted, expected); \
> ++=C2=A0 })
> ++
> ++#define _expect_rfc3164_fails(ts, len) \
> ++=C2=A0 ({=C2=A0 \
> ++=C2=A0=C2=A0=C2=A0 WallClockTime wct =3D WALL_CLOCK_TIME_INIT; \
> ++=C2=A0=C2=A0=C2=A0 const guchar *data =3D (guchar *) ts; \
> ++=C2=A0=C2=A0=C2=A0 gint length =3D len < 0 ? strlen(ts) : len; \
> ++=C2=A0=C2=A0=C2=A0 cr_assert_not(scan_rfc3164_timestamp(&data, &lengt=
h, &wct)); \
> +=C2=A0=C2=A0 })
> +
> + #define _expect_rfc5424_timestamp_eq(ts, expected) \
> +=C2=A0=C2=A0 ({ \
> +=C2=A0=C2=A0=C2=A0=C2=A0 gchar converted[32]; \
> +-=C2=A0=C2=A0=C2=A0 cr_expect(_rfc5424_timestamp_eq(ts, expected, conv=
erted),=20
> "Parsed RFC5424 timestamp does not equal expected, ts=3D%s,=20
> converted=3D%s, expected=3D%s", ts, converted, expected); \
> ++=C2=A0=C2=A0=C2=A0 cr_expect(_rfc5424_timestamp_eq(ts, -1, expected, =
converted),=20
> "Parsed RFC5424 timestamp does not equal expected, ts=3D%s,=20
> converted=3D%s, expected=3D%s", ts, converted, expected); \
> ++=C2=A0 })
> ++
> ++#define _expect_rfc5424_timestamp_len_eq(ts, len, expected) \
> ++=C2=A0 ({ \
> ++=C2=A0=C2=A0=C2=A0 gchar converted[32]; \
> ++=C2=A0=C2=A0=C2=A0 cr_expect(_rfc5424_timestamp_eq(ts, len, expected,=
 converted),=20
> "Parsed RFC5424 timestamp does not equal expected, ts=3D%s,=20
> converted=3D%s, expected=3D%s", ts, converted, expected); \
> ++=C2=A0 })
> ++
> ++#define _expect_rfc5424_fails(ts, len) \
> ++=C2=A0 ({=C2=A0 \
> ++=C2=A0=C2=A0=C2=A0 WallClockTime wct =3D WALL_CLOCK_TIME_INIT; \
> ++=C2=A0=C2=A0=C2=A0 const guchar *data =3D (guchar *) ts; \
> ++=C2=A0=C2=A0=C2=A0 gint length =3D len < 0 ? strlen(ts) : len; \
> ++=C2=A0=C2=A0=C2=A0 cr_assert_not(scan_rfc5424_timestamp(&data, &lengt=
h, &wct)); \
> +=C2=A0=C2=A0 })
> +
> ++
> + Test(parse_timestamp, standard_bsd_format)
> + {
> +=C2=A0=C2=A0 _expect_rfc3164_timestamp_eq("Oct=C2=A0 1 17:46:12",=20
> "2017-10-01T17:46:12.000+02:00");
> +@@ -148,6 +186,68 @@ Test(parse_timestamp,=20
> standard_bsd_format_year_in_the_past)
> +=C2=A0=C2=A0 _expect_rfc3164_timestamp_eq("Dec 31 17:46:12",=20
> "2017-12-31T17:46:12.000+01:00");
> + }
> +
> ++Test(parse_timestamp,=20
> non_zero_terminated_rfc3164_iso_input_is_handled_properly)
> ++{
> ++=C2=A0 gchar *ts =3D "2022-08-17T05:02:28.417Z whatever";
> ++=C2=A0 gint ts_len =3D 24;
> ++
> ++=C2=A0 _expect_rfc3164_timestamp_len_eq(ts, strlen(ts),=20
> "2022-08-17T05:02:28.417+00:00");
> ++=C2=A0 _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5,=20
> "2022-08-17T05:02:28.417+00:00");
> ++=C2=A0 _expect_rfc3164_timestamp_len_eq(ts, ts_len,=20
> "2022-08-17T05:02:28.417+00:00");
> ++
> ++=C2=A0 /* no "Z" parsed, timezone defaults to local, forced CET */
> ++=C2=A0 _expect_rfc3164_timestamp_len_eq(ts, ts_len - 1,=20
> "2022-08-17T05:02:28.417+02:00");
> ++
> ++=C2=A0 /* msec is partially parsed as we trim the string from the rig=
ht */
> ++=C2=A0 _expect_rfc3164_timestamp_len_eq(ts, ts_len - 2,=20
> "2022-08-17T05:02:28.410+02:00");
> ++=C2=A0 _expect_rfc3164_timestamp_len_eq(ts, ts_len - 3,=20
> "2022-08-17T05:02:28.400+02:00");
> ++=C2=A0 _expect_rfc3164_timestamp_len_eq(ts, ts_len - 4,=20
> "2022-08-17T05:02:28.000+02:00");
> ++=C2=A0 _expect_rfc3164_timestamp_len_eq(ts, ts_len - 5,=20
> "2022-08-17T05:02:28.000+02:00");
> ++
> ++=C2=A0 for (gint i =3D 6; i < ts_len; i++)
> ++=C2=A0=C2=A0=C2=A0 _expect_rfc3164_fails(ts, ts_len - i);
> ++
> ++}
> ++
> ++Test(parse_timestamp,=20
> non_zero_terminated_rfc3164_bsd_pix_or_asa_input_is_handled_properly)
> ++{
> ++=C2=A0 gchar *ts =3D "Aug 17 2022 05:02:28: whatever";
> ++=C2=A0 gint ts_len =3D 21;
> ++
> ++=C2=A0 _expect_rfc3164_timestamp_len_eq(ts, strlen(ts),=20
> "2022-08-17T05:02:28.000+02:00");
> ++=C2=A0 _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5,=20
> "2022-08-17T05:02:28.000+02:00");
> ++=C2=A0 _expect_rfc3164_timestamp_len_eq(ts, ts_len,=20
> "2022-08-17T05:02:28.000+02:00");
> ++
> ++=C2=A0 /* no ":" at the end, that's a problem, unrecognized */
> ++=C2=A0 _expect_rfc3164_fails(ts, ts_len - 1);
> ++
> ++=C2=A0 for (gint i =3D 1; i < ts_len; i++)
> ++=C2=A0=C2=A0=C2=A0 _expect_rfc3164_fails(ts, ts_len - i);
> ++}
> ++
> ++Test(parse_timestamp,=20
> non_zero_terminated_rfc5424_input_is_handled_properly)
> ++{
> ++=C2=A0 gchar *ts =3D "2022-08-17T05:02:28.417Z whatever";
> ++=C2=A0 gint ts_len =3D 24;
> ++
> ++=C2=A0 _expect_rfc5424_timestamp_len_eq(ts, strlen(ts),=20
> "2022-08-17T05:02:28.417+00:00");
> ++=C2=A0 _expect_rfc5424_timestamp_len_eq(ts, ts_len + 5,=20
> "2022-08-17T05:02:28.417+00:00");
> ++=C2=A0 _expect_rfc5424_timestamp_len_eq(ts, ts_len,=20
> "2022-08-17T05:02:28.417+00:00");
> ++
> ++=C2=A0 /* no "Z" parsed, timezone defaults to local, forced CET */
> ++=C2=A0 _expect_rfc5424_timestamp_len_eq(ts, ts_len - 1,=20
> "2022-08-17T05:02:28.417+02:00");
> ++
> ++=C2=A0 /* msec is partially parsed as we trim the string from the rig=
ht */
> ++=C2=A0 _expect_rfc5424_timestamp_len_eq(ts, ts_len - 2,=20
> "2022-08-17T05:02:28.410+02:00");
> ++=C2=A0 _expect_rfc5424_timestamp_len_eq(ts, ts_len - 3,=20
> "2022-08-17T05:02:28.400+02:00");
> ++=C2=A0 _expect_rfc5424_timestamp_len_eq(ts, ts_len - 4,=20
> "2022-08-17T05:02:28.000+02:00");
> ++=C2=A0 _expect_rfc5424_timestamp_len_eq(ts, ts_len - 5,=20
> "2022-08-17T05:02:28.000+02:00");
> ++
> ++=C2=A0 for (gint i =3D 6; i < ts_len; i++)
> ++=C2=A0=C2=A0=C2=A0 _expect_rfc5424_fails(ts, ts_len - i);
> ++
> ++}
> ++
> +
> + Test(parse_timestamp,=20
> daylight_saving_behavior_at_spring_with_explicit_timezones)
> + {
> +--
> +2.37.3
> +
> +
> diff --git=20
> a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch=20
> b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch
> new file mode 100644
> index 000000000..e32076ab5
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch
> @@ -0,0 +1,182 @@
> +From 14bcd1596f0f194b28e3f7babc75ad90d39ae7af Mon Sep 17 00:00:00 2001
> +From: Laszlo Varady <laszlo.varady@protonmail.com>
> +Date: Sat, 20 Aug 2022 14:29:43 +0200
> +Subject: [PATCH 6/8] timeutils: name repeating constant
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady <laszlo.varady@protonmail.=
com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-38725
> +
> +Reference to upstream patch:
> +https://github.com/syslog-ng/syslog-ng/commit/09f489c89c826293ff8cbd28=
2cfc866ab56054c4
> +
> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> +---
> + lib/timeutils/scan-timestamp.c | 54 ++++++++++++++++++---------------=
-
> + 1 file changed, 29 insertions(+), 25 deletions(-)
> +
> +diff --git a/lib/timeutils/scan-timestamp.c=20
> b/lib/timeutils/scan-timestamp.c
> +index cb6802d..197e3ad 100644
> +--- a/lib/timeutils/scan-timestamp.c
> ++++ b/lib/timeutils/scan-timestamp.c
> +@@ -34,41 +34,43 @@ scan_day_abbrev(const gchar **buf, gint *left,=20
> gint *wday)
> + {
> +=C2=A0=C2=A0 *wday =3D -1;
> +
> +-=C2=A0 if (*left < 3)
> ++=C2=A0 const gsize abbrev_length =3D 3;
> ++
> ++=C2=A0 if (*left < abbrev_length)
> +=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +
> +=C2=A0=C2=A0 switch (**buf)
> +=C2=A0=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0 case 'S':
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Sun", 3) =3D=3D=
 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Sun", abbrev_le=
ngth) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *wday =3D 0;
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (strncasecmp(*buf, "Sat", 3) =3D=
=3D 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (strncasecmp(*buf, "Sat", abbr=
ev_length) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *wday =3D 6;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> +=C2=A0=C2=A0=C2=A0=C2=A0 case 'M':
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Mon", 3) =3D=3D=
 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Mon", abbrev_le=
ngth) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *wday =3D 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> +=C2=A0=C2=A0=C2=A0=C2=A0 case 'T':
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Tue", 3) =3D=3D=
 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Tue", abbrev_le=
ngth) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *wday =3D 2;
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (strncasecmp(*buf, "Thu", 3) =3D=
=3D 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (strncasecmp(*buf, "Thu", abbr=
ev_length) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *wday =3D 4;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> +=C2=A0=C2=A0=C2=A0=C2=A0 case 'W':
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Wed", 3) =3D=3D=
 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Wed", abbrev_le=
ngth) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *wday =3D 3;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> +=C2=A0=C2=A0=C2=A0=C2=A0 case 'F':
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Fri", 3) =3D=3D=
 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Fri", abbrev_le=
ngth) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *wday =3D 5;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +@@ -77,8 +79,8 @@ scan_day_abbrev(const gchar **buf, gint *left, gint=20
> *wday)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +=C2=A0=C2=A0=C2=A0=C2=A0 }
> +
> +-=C2=A0 (*buf) +=3D 3;
> +-=C2=A0 (*left) -=3D 3;
> ++=C2=A0 (*buf) +=3D abbrev_length;
> ++=C2=A0 (*left) -=3D abbrev_length;
> +=C2=A0=C2=A0 return TRUE;
> + }
> +
> +@@ -87,63 +89,65 @@ scan_month_abbrev(const gchar **buf, gint *left,=20
> gint *mon)
> + {
> +=C2=A0=C2=A0 *mon =3D -1;
> +
> +-=C2=A0 if (*left < 3)
> ++=C2=A0 const gsize abbrev_length =3D 3;
> ++
> ++=C2=A0 if (*left < abbrev_length)
> +=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +
> +=C2=A0=C2=A0 switch (**buf)
> +=C2=A0=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0 case 'J':
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Jan", 3) =3D=3D=
 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Jan", abbrev_le=
ngth) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *mon =3D 0;
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (strncasecmp(*buf, "Jun", 3) =3D=
=3D 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (strncasecmp(*buf, "Jun", abbr=
ev_length) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *mon =3D 5;
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (strncasecmp(*buf, "Jul", 3) =3D=
=3D 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (strncasecmp(*buf, "Jul", abbr=
ev_length) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *mon =3D 6;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> +=C2=A0=C2=A0=C2=A0=C2=A0 case 'F':
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Feb", 3) =3D=3D=
 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Feb", abbrev_le=
ngth) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *mon =3D 1;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> +=C2=A0=C2=A0=C2=A0=C2=A0 case 'M':
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Mar", 3) =3D=3D=
 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Mar", abbrev_le=
ngth) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *mon =3D 2;
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (strncasecmp(*buf, "May", 3) =3D=
=3D 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (strncasecmp(*buf, "May", abbr=
ev_length) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *mon =3D 4;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> +=C2=A0=C2=A0=C2=A0=C2=A0 case 'A':
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Apr", 3) =3D=3D=
 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Apr", abbrev_le=
ngth) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *mon =3D 3;
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (strncasecmp(*buf, "Aug", 3) =3D=
=3D 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else if (strncasecmp(*buf, "Aug", abbr=
ev_length) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *mon =3D 7;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> +=C2=A0=C2=A0=C2=A0=C2=A0 case 'S':
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Sep", 3) =3D=3D=
 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Sep", abbrev_le=
ngth) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *mon =3D 8;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> +=C2=A0=C2=A0=C2=A0=C2=A0 case 'O':
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Oct", 3) =3D=3D=
 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Oct", abbrev_le=
ngth) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *mon =3D 9;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> +=C2=A0=C2=A0=C2=A0=C2=A0 case 'N':
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Nov", 3) =3D=3D=
 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Nov", abbrev_le=
ngth) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *mon =3D 10;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
> +=C2=A0=C2=A0=C2=A0=C2=A0 case 'D':
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Dec", 3) =3D=3D=
 0)
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (strncasecmp(*buf, "Dec", abbrev_le=
ngth) =3D=3D 0)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *mon =3D 11;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +@@ -152,8 +156,8 @@ scan_month_abbrev(const gchar **buf, gint *left,=20
> gint *mon)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +=C2=A0=C2=A0=C2=A0=C2=A0 }
> +
> +-=C2=A0 (*buf) +=3D 3;
> +-=C2=A0 (*left) -=3D 3;
> ++=C2=A0 (*buf) +=3D abbrev_length;
> ++=C2=A0 (*left) -=3D abbrev_length;
> +=C2=A0=C2=A0 return TRUE;
> + }
> +
> +--
> +2.37.3
> +
> +
> diff --git=20
> a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch=20
> b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch
> new file mode 100644
> index 000000000..b3135df4e
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch
> @@ -0,0 +1,84 @@
> +From d4c8ba0c513052b5f19c6e989ba31f847f4900d1 Mon Sep 17 00:00:00 2001
> +From: Laszlo Varady <laszlo.varady@protonmail.com>
> +Date: Sat, 20 Aug 2022 14:30:22 +0200
> +Subject: [PATCH 7/8] timeutils: fix invalid calculation of ISO timesta=
mp
> + length
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady <laszlo.varady@protonmail.=
com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-38725
> +
> +Reference to upstream patch:
> +https://github.com/syslog-ng/syslog-ng/commit/8c6e2c1c41b0fcc5fbd464c3=
5f4dac7102235396
> +
> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> +---
> + lib/timeutils/scan-timestamp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 8 ++++++--
> + lib/timeutils/tests/test_scan-timestamp.c | 7 +++++++
> + 2 files changed, 13 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/timeutils/scan-timestamp.c=20
> b/lib/timeutils/scan-timestamp.c
> +index 197e3ad..4e618e4 100644
> +--- a/lib/timeutils/scan-timestamp.c
> ++++ b/lib/timeutils/scan-timestamp.c
> +@@ -346,19 +346,21 @@ __parse_usec(const guchar **data, gint *length)
> + static gboolean
> + __has_iso_timezone(const guchar *src, gint length)
> + {
> +-=C2=A0 return (length >=3D 5) &&
> ++=C2=A0 return (length >=3D 6) &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (*src =3D=3D '+=
' || *src =3D=3D '-') &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isdigit(*(src+1=
)) &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isdigit(*(src+2=
)) &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *(src+3) =3D=3D=
 ':' &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isdigit(*(src+4=
)) &&
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 isdigit(*(src+5=
)) &&
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 !isdigit(*(src+6));
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (length < 7 || !isdi=
git(*(src+6)));
> + }
> +
> + static guint32
> + __parse_iso_timezone(const guchar **data, gint *length)
> + {
> ++=C2=A0 g_assert(*length >=3D 6);
> ++
> +=C2=A0=C2=A0 gint hours, mins;
> +=C2=A0=C2=A0 const guchar *src =3D *data;
> +=C2=A0=C2=A0 guint32 tz =3D 0;
> +@@ -368,8 +370,10 @@ __parse_iso_timezone(const guchar **data, gint=20
> *length)
> +=C2=A0=C2=A0 hours =3D (*(src + 1) - '0') * 10 + *(src + 2) - '0';
> +=C2=A0=C2=A0 mins =3D (*(src + 4) - '0') * 10 + *(src + 5) - '0';
> +=C2=A0=C2=A0 tz =3D sign * (hours * 3600 + mins * 60);
> ++
> +=C2=A0=C2=A0 src +=3D 6;
> +=C2=A0=C2=A0 (*length) -=3D 6;
> ++
> +=C2=A0=C2=A0 *data =3D src;
> +=C2=A0=C2=A0 return tz;
> + }
> +diff --git a/lib/timeutils/tests/test_scan-timestamp.c=20
> b/lib/timeutils/tests/test_scan-timestamp.c
> +index da375c8..9b38738 100644
> +--- a/lib/timeutils/tests/test_scan-timestamp.c
> ++++ b/lib/timeutils/tests/test_scan-timestamp.c
> +@@ -248,6 +248,13 @@ Test(parse_timestamp,=20
> non_zero_terminated_rfc5424_input_is_handled_properly)
> +
> + }
> +
> ++Test(parse_timestamp, non_zero_terminated_rfc5424_timestamp_only)
> ++{
> ++=C2=A0 const gchar *ts =3D "2022-08-17T05:02:28.417+03:00";
> ++=C2=A0 gint ts_len =3D strlen(ts);
> ++=C2=A0 _expect_rfc5424_timestamp_len_eq(ts, ts_len, ts);
> ++}
> ++
> +
> + Test(parse_timestamp,=20
> daylight_saving_behavior_at_spring_with_explicit_timezones)
> + {
> +--
> +2.37.3
> +
> +
> diff --git=20
> a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch=20
> b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch
> new file mode 100644
> index 000000000..cec573fa2
> --- /dev/null
> +++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch
> @@ -0,0 +1,47 @@
> +From f60dcfa9e094dc9c2a752115ca426159c4ae4192 Mon Sep 17 00:00:00 2001
> +From: Laszlo Varady <laszlo.varady@protonmail.com>
> +Date: Sat, 20 Aug 2022 14:30:51 +0200
> +Subject: [PATCH 8/8] timeutils: fix out-of-bounds reading of data buff=
er
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady <laszlo.varady@protonmail.=
com>
> +
> +Upstream-Status: Backport
> +CVE: CVE-2022-38725
> +
> +Reference to upstream patch:
> +https://github.com/syslog-ng/syslog-ng/commit/56f881c5eaa3d8c02c96607c=
4b9e4eaf959a044d
> +
> +Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> +---
> + lib/timeutils/scan-timestamp.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/lib/timeutils/scan-timestamp.c=20
> b/lib/timeutils/scan-timestamp.c
> +index 4e618e4..0f7f52e 100644
> +--- a/lib/timeutils/scan-timestamp.c
> ++++ b/lib/timeutils/scan-timestamp.c
> +@@ -427,7 +427,7 @@ __parse_bsd_timestamp(const guchar **data, gint=20
> *length, WallClockTime *wct)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!scan_pix_timestamp((const gc=
har **) &src, &left, wct))
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return FALSE;
> +
> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (*src =3D=3D ':')
> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (left && *src =3D=3D ':')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 src++;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 left--;
> +@@ -478,7 +478,7 @@ scan_rfc3164_timestamp(const guchar **data, gint=20
> *length, WallClockTime *wct)
> +=C2=A0=C2=A0=C2=A0 * looking at you, skip that as well, so we can reli=
ably detect IPv6
> +=C2=A0=C2=A0=C2=A0 * addresses as hostnames, which would be using ":" =
as well. */
> +
> +-=C2=A0 if (*src =3D=3D ':')
> ++=C2=A0 if (left && *src =3D=3D ':')
> +=C2=A0=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ++src;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --left;
> +--
> +2.37.3
> +
> +
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb=20
> b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
> index 40bbfe495..5fc386e56 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
> @@ -22,6 +22,14 @@ SRC_URI =3D=20
> "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
> file://volatiles.03_syslog-ng <file://volatiles.03_syslog-ng> \
> file://syslog-ng-tmp.conf <file://syslog-ng-tmp.conf> \
> file://syslog-ng.service-the-syslog-ng-service.patch=20
> <file://syslog-ng.service-the-syslog-ng-service.patch> \
> + file://CVE-2022-38725-0001.patch <file://CVE-2022-38725-0001.patch> \
> + file://CVE-2022-38725-0002.patch <file://CVE-2022-38725-0002.patch> \
> + file://CVE-2022-38725-0003.patch <file://CVE-2022-38725-0003.patch> \
> + file://CVE-2022-38725-0004.patch <file://CVE-2022-38725-0004.patch> \
> + file://CVE-2022-38725-0005.patch <file://CVE-2022-38725-0005.patch> \
> + file://CVE-2022-38725-0006.patch <file://CVE-2022-38725-0006.patch> \
> + file://CVE-2022-38725-0007.patch <file://CVE-2022-38725-0007.patch> \
> + file://CVE-2022-38725-0008.patch <file://CVE-2022-38725-0008.patch> \
> =C2=A0"
>
> =C2=A0SRC_URI[sha256sum] =3D=20
> "90a25c9767fe749db50f118ddfc92ec71399763d2ecd5ad4f11ff5eea049e60b"
> --=20
> 2.34.1
>
> Sent from Mail <https://go.microsoft.com/fwlink/?LinkId=3D550986> for=20
> Windows
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99684):https://lists.openembedded.org/g/openembedde=
d-devel/message/99684
> Mute This Topic:https://lists.openembedded.org/mt/95194280/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  =
[randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------m8CUvG5OwFPvLk6L1a9JHA58
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2ANJUOnu023150

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Hi Yogita,</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2022-11-21 05:29, Urade, Yogita via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:BL0PR11MB3410ED9545E8270BCD2AD4=
2D9F0A9@BL0PR11MB3410.namprd11.prod.outlook.com">
     =20
      <meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered
        medium)">
      <style>@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}.MsoChpDefault
	{mso-style-type:export-only;}div.WordSection1
	{page:WordSection1;}</style>
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Issue:
          LIN1022-1598<br>
        </p>
      </div>
    </blockquote>
    The line above is only for internal WR reviews, please drop.<br>
    <blockquote type=3D"cite" cite=3D"mid:BL0PR11MB3410ED9545E8270BCD2AD4=
2D9F0A9@BL0PR11MB3410.namprd11.prod.outlook.com">
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">
          <br>
          Fix buffer handling of syslog and timestamp parsers.<br>
          <br>
          References:<br>
          <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-38725" moz=
-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://nvd.nist.go=
v/vuln/detail/CVE-2022-38725</a><br>
          <a href=3D"https://github.com/syslog-ng/syslog-ng/releases" moz=
-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://github.com/=
syslog-ng/syslog-ng/releases</a><br>
          <a href=3D"https://github.com/syslog-ng/syslog-ng/pull/4110" mo=
z-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://github.com=
/syslog-ng/syslog-ng/pull/4110</a><br>
          <br>
          Upstream patches:<br>
          <a href=3D"https://github.com/syslog-ng/syslog-ng/commit/b5a060=
f2ebb8d794f508436a12e4d4163f94b1b8" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">https://github.com/syslog-ng/syslog-ng/commit/b5a060f=
2ebb8d794f508436a12e4d4163f94b1b8</a><br>
          <a href=3D"https://github.com/syslog-ng/syslog-ng/commit/81a072=
63f1e522a376d3a30f96f51df3f2879f8a" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">https://github.com/syslog-ng/syslog-ng/commit/81a0726=
3f1e522a376d3a30f96f51df3f2879f8a</a><br>
          <a href=3D"https://github.com/syslog-ng/syslog-ng/commit/4b8dc5=
6ca8eaeac4c8751a305eb7eeefab8dc89d" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">https://github.com/syslog-ng/syslog-ng/commit/4b8dc56=
ca8eaeac4c8751a305eb7eeefab8dc89d</a><br>
          <a href=3D"https://github.com/syslog-ng/syslog-ng/commit/73b5c3=
00b8fde5e7a4824baa83a04931279abb37" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">https://github.com/syslog-ng/syslog-ng/commit/73b5c30=
0b8fde5e7a4824baa83a04931279abb37</a><br>
          <a href=3D"https://github.com/syslog-ng/syslog-ng/commit/45f051=
239312e43bd4f92b9339fe67c6798a0321" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">https://github.com/syslog-ng/syslog-ng/commit/45f0512=
39312e43bd4f92b9339fe67c6798a0321</a><br>
          <a href=3D"https://github.com/syslog-ng/syslog-ng/commit/09f489=
c89c826293ff8cbd282cfc866ab56054c4" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">https://github.com/syslog-ng/syslog-ng/commit/09f489c=
89c826293ff8cbd282cfc866ab56054c4</a><br>
          <a href=3D"https://github.com/syslog-ng/syslog-ng/commit/8c6e2c=
1c41b0fcc5fbd464c35f4dac7102235396" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">https://github.com/syslog-ng/syslog-ng/commit/8c6e2c1=
c41b0fcc5fbd464c35f4dac7102235396</a><br>
          <a href=3D"https://github.com/syslog-ng/syslog-ng/commit/56f881=
c5eaa3d8c02c96607c4b9e4eaf959a044d" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">https://github.com/syslog-ng/syslog-ng/commit/56f881c=
5eaa3d8c02c96607c4b9e4eaf959a044d</a><br>
          <br>
          (LOCAL REV: NOT UPSTREAM) -- Not applicable, upstream out of
          maintenance<br>
        </p>
      </div>
    </blockquote>
    <p>The line above is only for internal WR reviews, please drop.</p>
    <p>Also, this is the upstream for WR Linux, so it's not out of
      maintenance! ;-)</p>
    <p>Other than that, this looks good. <br>
    </p>
    <p>Please send a v2.</p>
    <p>Thanks,<br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:BL0PR11MB3410ED9545E8270BCD2AD4=
2D9F0A9@BL0PR11MB3410.namprd11.prod.outlook.com">
      <div class=3D"WordSection1">
        <p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">
          <br>
          Signed-off-by: Yogita Urade <a class=3D"moz-txt-link-rfc2396E" =
href=3D"mailto:yogita.urade@windriver.com">&lt;yogita.urade@windriver.com=
&gt;</a><br>
          ---<br>
          &nbsp;.../syslog-ng/files/CVE-2022-38725-0001.patch |&nbsp; 67 =
++++++<br>
          &nbsp;.../syslog-ng/files/CVE-2022-38725-0002.patch | 152
          +++++++++++++<br>
          &nbsp;.../syslog-ng/files/CVE-2022-38725-0003.patch |&nbsp; 79 =
+++++++<br>
          &nbsp;.../syslog-ng/files/CVE-2022-38725-0004.patch |&nbsp; 40 =
++++<br>
          &nbsp;.../syslog-ng/files/CVE-2022-38725-0005.patch | 213
          ++++++++++++++++++<br>
          &nbsp;.../syslog-ng/files/CVE-2022-38725-0006.patch | 182
          +++++++++++++++<br>
          &nbsp;.../syslog-ng/files/CVE-2022-38725-0007.patch |&nbsp; 84 =
+++++++<br>
          &nbsp;.../syslog-ng/files/CVE-2022-38725-0008.patch |&nbsp; 47 =
++++<br>
          &nbsp;.../syslog-ng/syslog-ng_3.36.1.bb&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 +<br>
          &nbsp;9 files changed, 872 insertions(+)<br>
          &nbsp;create mode 100644
          meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.pat=
ch<br>
          &nbsp;create mode 100644
          meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.pat=
ch<br>
          &nbsp;create mode 100644
          meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.pat=
ch<br>
          &nbsp;create mode 100644
          meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.pat=
ch<br>
          &nbsp;create mode 100644
          meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.pat=
ch<br>
          &nbsp;create mode 100644
          meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.pat=
ch<br>
          &nbsp;create mode 100644
          meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.pat=
ch<br>
          &nbsp;create mode 100644
          meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.pat=
ch<br>
          <br>
          diff --git
          a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.p=
atch
b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch<br>
          new file mode 100644<br>
          index 000000000..cd6a93d8e<br>
          --- /dev/null<br>
          +++
          b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.p=
atch<br>
          @@ -0,0 +1,67 @@<br>
          +From c6e7195075fd4fbd3db04e187f6d75030d17cb6b Mon Sep 17
          00:00:00 2001<br>
          +From: Laszlo Varady <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:laszlo.varady@protonmail.com">&lt;laszlo.varady@protonmail.com&gt=
;</a><br>
          +Date: Sat, 20 Aug 2022 12:26:05 +0200<br>
          +Subject: [PATCH 1/8] syslogformat: fix out-of-bounds reading
          of data buffer<br>
          +MIME-Version: 1.0<br>
          +Content-Type: text/plain; charset=3DUTF-8<br>
          +Content-Transfer-Encoding: 8bit<br>
          +<br>
          +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:laszlo.varady=
@protonmail.com">&lt;laszlo.varady@protonmail.com&gt;</a><br>
          +<br>
          +Upstream-Status: Backport<br>
          +CVE: CVE-2022-38725<br>
          +<br>
          +Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/b5a060f2ebb8d794f508436a12=
e4d4163f94b1b8<br>
          +<br>
          +Signed-off-by: Ovidiu Panait
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ovidiu.panait=
@windriver.com">&lt;ovidiu.panait@windriver.com&gt;</a><br>
          +---<br>
          + modules/syslogformat/syslog-format.c | 10 +++++++---<br>
          + 1 file changed, 7 insertions(+), 3 deletions(-)<br>
          +<br>
          +diff --git a/modules/syslogformat/syslog-format.c
          b/modules/syslogformat/syslog-format.c<br>
          +index 38bb6f6..9042396 100644<br>
          +--- a/modules/syslogformat/syslog-format.c<br>
          ++++ b/modules/syslogformat/syslog-format.c<br>
          +@@ -223,6 +223,9 @@
          log_msg_parse_cisco_timestamp_attributes(LogMessage *self,
          const guchar **data,<br>
          +&nbsp;&nbsp; const guchar *src =3D *data;<br>
          +&nbsp;&nbsp; gint left =3D *length;<br>
          + <br>
          ++&nbsp; if (!left)<br>
          ++&nbsp;&nbsp;&nbsp; return;<br>
          ++<br>
          +&nbsp;&nbsp; /* Cisco timestamp extensions, the first '*' indi=
cates
          that the clock is<br>
          +&nbsp;&nbsp;&nbsp; * unsynced, '.' if it is known to be synced=
 */<br>
          +&nbsp;&nbsp; if (G_UNLIKELY(src[0] =3D=3D '*'))<br>
          +@@ -556,7 +559,7 @@ log_msg_parse_sd(LogMessage *self, const
          guchar **data, gint *length, const MsgF<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; open_sd++;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!i=
sascii(*src) || *src =3D=3D '=3D' || *src =3D=3D ' '
          || *src =3D=3D ']' || *src =3D=3D '&quot;')<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!l=
eft || !isascii(*src) || *src =3D=3D '=3D' || *src
          =3D=3D ' ' || *src =3D=3D ']' || *src =3D=3D '&quot;')<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto error;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /=
* read sd_id */<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p=
os =3D 0;<br>
          +@@ -589,7 +592,8 @@ log_msg_parse_sd(LogMessage *self, const
          guchar **data, gint *length, const MsgF<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
d_id_len =3D pos;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
trcpy(sd_value_name, logmsg_sd_prefix);<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
trncpy(sd_value_name + logmsg_sd_prefix_len,
          sd_id_name, sizeof(sd_value_name) - logmsg_sd_prefix_len);<br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*s=
rc =3D=3D ']')<br>
          ++<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (le=
ft &amp;&amp; *src =3D=3D ']')<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; {<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; log_msg_set_value_by_name(self, sd_value_name,
          &quot;&quot;, 0);<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
          +@@ -606,7 +610,7 @@ log_msg_parse_sd(LogMessage *self, const
          guchar **data, gint *length, const MsgF<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; else<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto error;<br>
          + <br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if (!isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D =
'
          ' || *src =3D=3D ']' || *src =3D=3D '&quot;')<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if (!left || !isascii(*src) || *src =3D=3D '=3D' ||
          *src =3D=3D ' ' || *src =3D=3D ']' || *src =3D=3D '&quot;')<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto error;<br>
          + <br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; /* read sd-param */<br>
          +-- <br>
          +2.37.3<br>
          +<br>
          +<br>
          diff --git
          a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.p=
atch
b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch<br>
          new file mode 100644<br>
          index 000000000..ac5bc78a5<br>
          --- /dev/null<br>
          +++
          b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.p=
atch<br>
          @@ -0,0 +1,152 @@<br>
          +From f8f985cd0902e0fa8306f988fb183f1987ab7d3b Mon Sep 17
          00:00:00 2001<br>
          +From: Laszlo Varady <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:laszlo.varady@protonmail.com">&lt;laszlo.varady@protonmail.com&gt=
;</a><br>
          +Date: Sat, 20 Aug 2022 12:22:44 +0200<br>
          +Subject: [PATCH 2/8] syslogformat: add bug reproducer test
          for non-zero<br>
          + terminated input<br>
          +MIME-Version: 1.0<br>
          +Content-Type: text/plain; charset=3DUTF-8<br>
          +Content-Transfer-Encoding: 8bit<br>
          +<br>
          +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:laszlo.varady=
@protonmail.com">&lt;laszlo.varady@protonmail.com&gt;</a><br>
          +<br>
          +Upstream-Status: Backport<br>
          +CVE: CVE-2022-38725<br>
          +<br>
          +Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/81a07263f1e522a376d3a30f96=
f51df3f2879f8a<br>
          +<br>
          +Signed-off-by: Ovidiu Panait
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ovidiu.panait=
@windriver.com">&lt;ovidiu.panait@windriver.com&gt;</a><br>
          +---<br>
          + modules/syslogformat/CMakeLists.txt&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
          + modules/syslogformat/Makefile.am&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +<br>
          + modules/syslogformat/tests/CMakeLists.txt&nbsp;&nbsp;&nbsp;&n=
bsp; |&nbsp; 1 +<br>
          + modules/syslogformat/tests/Makefile.am&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; |&nbsp; 9 +++<br>
          + .../syslogformat/tests/test_syslog_format.c&nbsp;&nbsp; | 72
          +++++++++++++++++++<br>
          + 5 files changed, 85 insertions(+)<br>
          + create mode 100644 modules/syslogformat/tests/CMakeLists.txt<=
br>
          + create mode 100644 modules/syslogformat/tests/Makefile.am<br>
          + create mode 100644
          modules/syslogformat/tests/test_syslog_format.c<br>
          +<br>
          +diff --git a/modules/syslogformat/CMakeLists.txt
          b/modules/syslogformat/CMakeLists.txt<br>
          +index 94ee01a..64848ef 100644<br>
          +--- a/modules/syslogformat/CMakeLists.txt<br>
          ++++ b/modules/syslogformat/CMakeLists.txt<br>
          +@@ -14,3 +14,4 @@ add_module(<br>
          +&nbsp;&nbsp; SOURCES ${SYSLOGFORMAT_SOURCES}<br>
          + )<br>
          + <br>
          ++add_test_subdirectory(tests)<br>
          +diff --git a/modules/syslogformat/Makefile.am
          b/modules/syslogformat/Makefile.am<br>
          +index f13f88c..14cdf58 100644<br>
          +--- a/modules/syslogformat/Makefile.am<br>
          ++++ b/modules/syslogformat/Makefile.am<br>
          +@@ -31,3 +31,5 @@
          modules_syslogformat_libsyslogformat_la_DEPENDENCIES =3D&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
          + modules/syslogformat modules/syslogformat/ mod-syslogformat:
          \<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; modules/syslogforma=
t/libsyslogformat.la<br>
          + .PHONY: modules/syslogformat/ mod-syslogformat<br>
          ++<br>
          ++include modules/syslogformat/tests/Makefile.am<br>
          +diff --git a/modules/syslogformat/tests/CMakeLists.txt
          b/modules/syslogformat/tests/CMakeLists.txt<br>
          +new file mode 100644<br>
          +index 0000000..2e45b71<br>
          +--- /dev/null<br>
          ++++ b/modules/syslogformat/tests/CMakeLists.txt<br>
          +@@ -0,0 +1 @@<br>
          ++add_unit_test(CRITERION TARGET test_syslog_format DEPENDS
          syslogformat)<br>
          +diff --git a/modules/syslogformat/tests/Makefile.am
          b/modules/syslogformat/tests/Makefile.am<br>
          +new file mode 100644<br>
          +index 0000000..7ee66a5<br>
          +--- /dev/null<br>
          ++++ b/modules/syslogformat/tests/Makefile.am<br>
          +@@ -0,0 +1,9 @@<br>
          ++modules_syslogformat_tests_TESTS =3D \<br>
          ++&nbsp;&nbsp;&nbsp; modules/syslogformat/tests/test_syslog_for=
mat<br>
          ++<br>
          ++check_PROGRAMS +=3D ${modules_syslogformat_tests_TESTS}<br>
          ++<br>
          ++EXTRA_DIST +=3D modules/syslogformat/tests/CMakeLists.txt<br>
          ++<br>
          ++modules_syslogformat_tests_test_syslog_format_CFLAGS =3D
          $(TEST_CFLAGS) -I$(top_srcdir)/modules/syslogformat<br>
          ++modules_syslogformat_tests_test_syslog_format_LDADD =3D
          $(TEST_LDADD) $(PREOPEN_SYSLOGFORMAT)<br>
          +diff --git a/modules/syslogformat/tests/test_syslog_format.c
          b/modules/syslogformat/tests/test_syslog_format.c<br>
          +new file mode 100644<br>
          +index 0000000..b247fe3<br>
          +--- /dev/null<br>
          ++++ b/modules/syslogformat/tests/test_syslog_format.c<br>
          +@@ -0,0 +1,72 @@<br>
          ++/*<br>
          ++ * Copyright (c) 2022 One Identity<br>
          ++ * Copyright (c) 2022 L=C3=A1szl=C3=B3 V=C3=A1rady<br>
          ++ *<br>
          ++ * This program is free software; you can redistribute it
          and/or modify it<br>
          ++ * under the terms of the GNU General Public License version
          2 as published<br>
          ++ * by the Free Software Foundation, or (at your option) any
          later version.<br>
          ++ *<br>
          ++ * This program is distributed in the hope that it will be
          useful,<br>
          ++ * but WITHOUT ANY WARRANTY; without even the implied
          warranty of<br>
          ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.&nbsp;=
 See
          the<br>
          ++ * GNU General Public License for more details.<br>
          ++ *<br>
          ++ * You should have received a copy of the GNU General Public
          License<br>
          ++ * along with this program; if not, write to the Free
          Software<br>
          ++ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
          MA&nbsp; 02110-1301&nbsp; USA<br>
          ++ *<br>
          ++ * As an additional exemption you are allowed to compile
          &amp; link against the<br>
          ++ * OpenSSL libraries as published by the OpenSSL project.
          See the file<br>
          ++ * COPYING for details.<br>
          ++ *<br>
          ++ */<br>
          ++<br>
          ++#include &lt;criterion/criterion.h&gt;<br>
          ++<br>
          ++#include &quot;apphook.h&quot;<br>
          ++#include &quot;cfg.h&quot;<br>
          ++#include &quot;syslog-format.h&quot;<br>
          ++#include &quot;logmsg/logmsg.h&quot;<br>
          ++#include &quot;msg-format.h&quot;<br>
          ++#include &quot;scratch-buffers.h&quot;<br>
          ++<br>
          ++#include &lt;string.h&gt;<br>
          ++<br>
          ++GlobalConfig *cfg;<br>
          ++MsgFormatOptions parse_options;<br>
          ++<br>
          ++static void<br>
          ++setup(void)<br>
          ++{<br>
          ++&nbsp; app_startup();<br>
          ++&nbsp; syslog_format_init();<br>
          ++<br>
          ++&nbsp; cfg =3D cfg_new_snippet();<br>
          ++&nbsp; msg_format_options_defaults(&amp;parse_options);<br>
          ++}<br>
          ++<br>
          ++static void<br>
          ++teardown(void)<br>
          ++{<br>
          ++&nbsp; scratch_buffers_explicit_gc();<br>
          ++&nbsp; app_shutdown();<br>
          ++&nbsp; cfg_free(cfg);<br>
          ++}<br>
          ++<br>
          ++TestSuite(syslog_format, .init =3D setup, .fini =3D teardown)=
;<br>
          ++<br>
          ++Test(syslog_format,
          parser_should_not_spin_on_non_zero_terminated_input, .timeout
          =3D 10)<br>
          ++{<br>
          ++&nbsp; const gchar *data =3D &quot;&lt;182&gt;2022-08-17T05:0=
2:28.217
          mymachine su: 'su root' failed for lonvick on /dev/pts/8&quot;;=
<br>
          ++&nbsp; /* chosen carefully to reproduce a bug */<br>
          ++&nbsp; gsize data_length =3D 27;<br>
          ++<br>
          ++&nbsp; msg_format_options_init(&amp;parse_options, cfg);<br>
          ++&nbsp; LogMessage *msg =3D
          msg_format_construct_message(&amp;parse_options, (const guchar
          *) data, data_length);<br>
          ++<br>
          ++&nbsp; gsize problem_position;<br>
          ++&nbsp; cr_assert(syslog_format_handler(&amp;parse_options, ms=
g,
          (const guchar *) data, data_length, &amp;problem_position));<br=
>
          ++<br>
          ++&nbsp; msg_format_options_destroy(&amp;parse_options);<br>
          ++&nbsp; log_msg_unref(msg);<br>
          ++}<br>
          +-- <br>
          +2.37.3<br>
          +<br>
          +<br>
          diff --git
          a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.p=
atch
b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch<br>
          new file mode 100644<br>
          index 000000000..34e6b65d2<br>
          --- /dev/null<br>
          +++
          b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.p=
atch<br>
          @@ -0,0 +1,79 @@<br>
          +From 041ccdf8a4c73cd3138dac0611272361f384fb81 Mon Sep 17
          00:00:00 2001<br>
          +From: Laszlo Varady <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:laszlo.varady@protonmail.com">&lt;laszlo.varady@protonmail.com&gt=
;</a><br>
          +Date: Sun, 21 Aug 2022 18:44:28 +0200<br>
          +Subject: [PATCH 3/8] syslogformat: fix reading cisco sequence
          id out of bounds<br>
          +MIME-Version: 1.0<br>
          +Content-Type: text/plain; charset=3DUTF-8<br>
          +Content-Transfer-Encoding: 8bit<br>
          +<br>
          +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:laszlo.varady=
@protonmail.com">&lt;laszlo.varady@protonmail.com&gt;</a><br>
          +<br>
          +Upstream-Status: Backport<br>
          +CVE: CVE-2022-38725<br>
          +<br>
          +Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/4b8dc56ca8eaeac4c8751a305e=
b7eeefab8dc89d<br>
          +<br>
          +Signed-off-by: Ovidiu Panait
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ovidiu.panait=
@windriver.com">&lt;ovidiu.panait@windriver.com&gt;</a><br>
          +---<br>
          + modules/syslogformat/syslog-format.c&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<br>
          + .../syslogformat/tests/test_syslog_format.c&nbsp;&nbsp; | 32
          +++++++++++++++++++<br>
          + 2 files changed, 33 insertions(+), 1 deletion(-)<br>
          +<br>
          +diff --git a/modules/syslogformat/syslog-format.c
          b/modules/syslogformat/syslog-format.c<br>
          +index 9042396..fe829fb 100644<br>
          +--- a/modules/syslogformat/syslog-format.c<br>
          ++++ b/modules/syslogformat/syslog-format.c<br>
          +@@ -207,7 +207,7 @@
          log_msg_parse_cisco_sequence_id(LogMessage *self, const guchar
          **data, gint *len<br>
          + <br>
          +&nbsp;&nbsp; /* if the next char is not space, then we may try=
 to read
          a date */<br>
          + <br>
          +-&nbsp; if (*src !=3D ' ')<br>
          ++&nbsp; if (!left || *src !=3D ' ')<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
          + <br>
          +&nbsp;&nbsp; log_msg_set_value(self, handles.cisco_seqid, (gch=
ar *)
          *data, *length - left - 1);<br>
          +diff --git a/modules/syslogformat/tests/test_syslog_format.c
          b/modules/syslogformat/tests/test_syslog_format.c<br>
          +index b247fe3..d0f5b40 100644<br>
          +--- a/modules/syslogformat/tests/test_syslog_format.c<br>
          ++++ b/modules/syslogformat/tests/test_syslog_format.c<br>
          +@@ -70,3 +70,35 @@ Test(syslog_format,
          parser_should_not_spin_on_non_zero_terminated_input, .timeou<br=
>
          +&nbsp;&nbsp; msg_format_options_destroy(&amp;parse_options);<b=
r>
          +&nbsp;&nbsp; log_msg_unref(msg);<br>
          + }<br>
          ++<br>
          ++Test(syslog_format, cisco_sequence_id_non_zero_termination)<b=
r>
          ++{<br>
          ++&nbsp; const gchar *data =3D &quot;&lt;189&gt;65536: &quot;;<=
br>
          ++&nbsp; gsize data_length =3D strlen(data);<br>
          ++<br>
          ++&nbsp; msg_format_options_init(&amp;parse_options, cfg);<br>
          ++&nbsp; LogMessage *msg =3D
          msg_format_construct_message(&amp;parse_options, (const guchar
          *) data, data_length);<br>
          ++<br>
          ++&nbsp; gsize problem_position;<br>
          ++&nbsp; cr_assert(syslog_format_handler(&amp;parse_options, ms=
g,
          (const guchar *) data, data_length, &amp;problem_position));<br=
>
          ++&nbsp; cr_assert_str_eq(log_msg_get_value_by_name(msg,
          &quot;.SDATA.meta.sequenceId&quot;, NULL), &quot;65536&quot;);<=
br>
          ++<br>
          ++&nbsp; msg_format_options_destroy(&amp;parse_options);<br>
          ++&nbsp; log_msg_unref(msg);<br>
          ++}<br>
          ++<br>
          ++Test(syslog_format,
          minimal_non_zero_terminated_numeric_message_is_parsed_as_progra=
m_name)<br>
          ++{<br>
          ++&nbsp; const gchar *data =3D &quot;&lt;189&gt;65536&quot;;<br=
>
          ++&nbsp; gsize data_length =3D strlen(data);<br>
          ++<br>
          ++&nbsp; msg_format_options_init(&amp;parse_options, cfg);<br>
          ++&nbsp; LogMessage *msg =3D
          msg_format_construct_message(&amp;parse_options, (const guchar
          *) data, data_length);<br>
          ++<br>
          ++&nbsp; gsize problem_position;<br>
          ++&nbsp; cr_assert(syslog_format_handler(&amp;parse_options, ms=
g,
          (const guchar *) data, data_length, &amp;problem_position));<br=
>
          ++&nbsp; cr_assert_str_eq(log_msg_get_value_by_name(msg, &quot;=
PROGRAM&quot;,
          NULL), &quot;65536&quot;);<br>
          ++<br>
          ++&nbsp; msg_format_options_destroy(&amp;parse_options);<br>
          ++&nbsp; log_msg_unref(msg);<br>
          ++}<br>
          +-- <br>
          +2.37.3<br>
          +<br>
          +<br>
          diff --git
          a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.p=
atch
b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch<br>
          new file mode 100644<br>
          index 000000000..cfad5a378<br>
          --- /dev/null<br>
          +++
          b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.p=
atch<br>
          @@ -0,0 +1,40 @@<br>
          +From bea4678261328c841b6062014394e6d3230a2fdb Mon Sep 17
          00:00:00 2001<br>
          +From: Laszlo Varady <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:laszlo.varady@protonmail.com">&lt;laszlo.varady@protonmail.com&gt=
;</a><br>
          +Date: Sat, 20 Aug 2022 12:42:38 +0200<br>
          +Subject: [PATCH 4/8] timeutils: fix iterating out of the
          range of timestamp<br>
          + buffer<br>
          +MIME-Version: 1.0<br>
          +Content-Type: text/plain; charset=3DUTF-8<br>
          +Content-Transfer-Encoding: 8bit<br>
          +<br>
          +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:laszlo.varady=
@protonmail.com">&lt;laszlo.varady@protonmail.com&gt;</a><br>
          +Signed-off-by: Balazs Scheidler <a class=3D"moz-txt-link-rfc23=
96E" href=3D"mailto:bazsi77@gmail.com">&lt;bazsi77@gmail.com&gt;</a><br>
          +<br>
          +Upstream-Status: Backport<br>
          +CVE: CVE-2022-38725<br>
          +<br>
          +Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/73b5c300b8fde5e7a4824baa83=
a04931279abb37<br>
          +<br>
          +Signed-off-by: Ovidiu Panait
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ovidiu.panait=
@windriver.com">&lt;ovidiu.panait@windriver.com&gt;</a><br>
          +---<br>
          + lib/timeutils/scan-timestamp.c | 2 +-<br>
          + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
          +<br>
          +diff --git a/lib/timeutils/scan-timestamp.c
          b/lib/timeutils/scan-timestamp.c<br>
          +index 2f6a6b7..cb6802d 100644<br>
          +--- a/lib/timeutils/scan-timestamp.c<br>
          ++++ b/lib/timeutils/scan-timestamp.c<br>
          +@@ -328,7 +328,7 @@ __parse_usec(const guchar **data, gint
          *length)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
rc++;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (=
*length)--;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (isdigit(*src))<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (*length &gt; 0 &amp;&am=
p; isdigit(*src))<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
rc++;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (=
*length)--;<br>
          +-- <br>
          +2.37.3<br>
          +<br>
          +<br>
          diff --git
          a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.p=
atch
b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch<br>
          new file mode 100644<br>
          index 000000000..487118957<br>
          --- /dev/null<br>
          +++
          b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.p=
atch<br>
          @@ -0,0 +1,213 @@<br>
          +From 1f62031101608bee8ad772967eb8151aa33d6e1a Mon Sep 17
          00:00:00 2001<br>
          +From: Balazs Scheidler <a class=3D"moz-txt-link-rfc2396E" href=
=3D"mailto:bazsi77@gmail.com">&lt;bazsi77@gmail.com&gt;</a><br>
          +Date: Sat, 20 Aug 2022 12:43:42 +0200<br>
          +Subject: [PATCH 5/8] timeutils: add tests for non-zero
          terminated inputs<br>
          +<br>
          +Signed-off-by: Balazs Scheidler <a class=3D"moz-txt-link-rfc23=
96E" href=3D"mailto:bazsi77@gmail.com">&lt;bazsi77@gmail.com&gt;</a><br>
          +<br>
          +Upstream-Status: Backport<br>
          +CVE: CVE-2022-38725<br>
          +<br>
          +Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/45f051239312e43bd4f92b9339=
fe67c6798a0321<br>
          +<br>
          +Signed-off-by: Ovidiu Panait
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ovidiu.panait=
@windriver.com">&lt;ovidiu.panait@windriver.com&gt;</a><br>
          +---<br>
          + lib/timeutils/tests/test_scan-timestamp.c | 126
          +++++++++++++++++++---<br>
          + 1 file changed, 113 insertions(+), 13 deletions(-)<br>
          +<br>
          +diff --git a/lib/timeutils/tests/test_scan-timestamp.c
          b/lib/timeutils/tests/test_scan-timestamp.c<br>
          +index 2756bf3..da375c8 100644<br>
          +--- a/lib/timeutils/tests/test_scan-timestamp.c<br>
          ++++ b/lib/timeutils/tests/test_scan-timestamp.c<br>
          +@@ -49,17 +49,21 @@ fake_time_add(time_t diff)<br>
          + }<br>
          + <br>
          + static gboolean<br>
          +-_parse_rfc3164(const gchar *ts, gchar isotimestamp[32])<br>
          ++_parse_rfc3164(const gchar *ts, gint len, gchar
          isotimestamp[32])<br>
          + {<br>
          +&nbsp;&nbsp; UnixTime stamp;<br>
          +-&nbsp; const guchar *data =3D (const guchar *) ts;<br>
          +-&nbsp; gint length =3D strlen(ts);<br>
          ++&nbsp; const guchar *tsu =3D (const guchar *) ts;<br>
          ++&nbsp; gint tsu_len =3D len &lt; 0 ? strlen(ts) : len;<br>
          +&nbsp;&nbsp; GString *result =3D g_string_new(&quot;&quot;);<b=
r>
          +&nbsp;&nbsp; WallClockTime wct =3D WALL_CLOCK_TIME_INIT;<br>
          + <br>
          +-<br>
          ++&nbsp; const guchar *data =3D tsu;<br>
          ++&nbsp; gint length =3D tsu_len;<br>
          +&nbsp;&nbsp; gboolean success =3D scan_rfc3164_timestamp(&amp;=
data,
          &amp;length, &amp;wct);<br>
          + <br>
          ++&nbsp; cr_assert(length &gt;=3D 0);<br>
          ++&nbsp; cr_assert(data =3D=3D &amp;tsu[tsu_len - length]);<br>
          ++<br>
          +&nbsp;&nbsp; unix_time_unset(&amp;stamp);<br>
          +&nbsp;&nbsp; convert_wall_clock_time_to_unix_time(&amp;wct,
          &amp;stamp);<br>
          + <br>
          +@@ -70,16 +74,21 @@ _parse_rfc3164(const gchar *ts, gchar
          isotimestamp[32])<br>
          + }<br>
          + <br>
          + static gboolean<br>
          +-_parse_rfc5424(const gchar *ts, gchar isotimestamp[32])<br>
          ++_parse_rfc5424(const gchar *ts, gint len, gchar
          isotimestamp[32])<br>
          + {<br>
          +&nbsp;&nbsp; UnixTime stamp;<br>
          +-&nbsp; const guchar *data =3D (const guchar *) ts;<br>
          +-&nbsp; gint length =3D strlen(ts);<br>
          ++&nbsp; const guchar *tsu =3D (const guchar *) ts;<br>
          ++&nbsp; gint tsu_len =3D len &lt; 0 ? strlen(ts) : len;<br>
          +&nbsp;&nbsp; GString *result =3D g_string_new(&quot;&quot;);<b=
r>
          +&nbsp;&nbsp; WallClockTime wct =3D WALL_CLOCK_TIME_INIT;<br>
          + <br>
          ++&nbsp; const guchar *data =3D tsu;<br>
          ++&nbsp; gint length =3D tsu_len;<br>
          +&nbsp;&nbsp; gboolean success =3D scan_rfc5424_timestamp(&amp;=
data,
          &amp;length, &amp;wct);<br>
          + <br>
          ++&nbsp; cr_assert(length &gt;=3D 0);<br>
          ++&nbsp; cr_assert(data =3D=3D &amp;tsu[tsu_len - length]);<br>
          ++<br>
          +&nbsp;&nbsp; unix_time_unset(&amp;stamp);<br>
          +&nbsp;&nbsp; convert_wall_clock_time_to_unix_time(&amp;wct,
          &amp;stamp);<br>
          + <br>
          +@@ -90,31 +99,60 @@ _parse_rfc5424(const gchar *ts, gchar
          isotimestamp[32])<br>
          + }<br>
          + <br>
          + static gboolean<br>
          +-_rfc3164_timestamp_eq(const gchar *ts, const gchar
          *expected, gchar converted[32])<br>
          ++_rfc3164_timestamp_eq(const gchar *ts, gint len, const gchar
          *expected, gchar converted[32])<br>
          + {<br>
          +-&nbsp; cr_assert(_parse_rfc3164(ts, converted));<br>
          ++&nbsp; cr_assert(_parse_rfc3164(ts, len, converted));<br>
          +&nbsp;&nbsp; return strcmp(converted, expected) =3D=3D 0;<br>
          + }<br>
          + <br>
          + static gboolean<br>
          +-_rfc5424_timestamp_eq(const gchar *ts, const gchar
          *expected, gchar converted[32])<br>
          ++_rfc5424_timestamp_eq(const gchar *ts, gint len, const gchar
          *expected, gchar converted[32])<br>
          + {<br>
          +-&nbsp; cr_assert(_parse_rfc5424(ts, converted));<br>
          ++&nbsp; cr_assert(_parse_rfc5424(ts, len, converted));<br>
          +&nbsp;&nbsp; return strcmp(converted, expected) =3D=3D 0;<br>
          + }<br>
          + <br>
          + #define _expect_rfc3164_timestamp_eq(ts, expected) \<br>
          +&nbsp;&nbsp; ({ \<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; gchar converted[32]; \<br>
          +-&nbsp;&nbsp;&nbsp; cr_expect(_rfc3164_timestamp_eq(ts, expect=
ed,
          converted), &quot;Parsed RFC3164 timestamp does not equal expec=
ted,
          ts=3D%s, converted=3D%s, expected=3D%s&quot;, ts, converted, ex=
pected); \<br>
          ++&nbsp;&nbsp;&nbsp; cr_expect(_rfc3164_timestamp_eq(ts, -1, ex=
pected,
          converted), &quot;Parsed RFC3164 timestamp does not equal expec=
ted,
          ts=3D%s, converted=3D%s, expected=3D%s&quot;, ts, converted, ex=
pected); \<br>
          ++&nbsp; })<br>
          ++<br>
          ++#define _expect_rfc3164_timestamp_len_eq(ts, len, expected)
          \<br>
          ++&nbsp; ({ \<br>
          ++&nbsp;&nbsp;&nbsp; gchar converted[32]; \<br>
          ++&nbsp;&nbsp;&nbsp; cr_expect(_rfc3164_timestamp_eq(ts, len, e=
xpected,
          converted), &quot;Parsed RFC3164 timestamp does not equal expec=
ted,
          ts=3D%s, converted=3D%s, expected=3D%s&quot;, ts, converted, ex=
pected); \<br>
          ++&nbsp; })<br>
          ++<br>
          ++#define _expect_rfc3164_fails(ts, len) \<br>
          ++&nbsp; ({&nbsp; \<br>
          ++&nbsp;&nbsp;&nbsp; WallClockTime wct =3D WALL_CLOCK_TIME_INIT=
; \<br>
          ++&nbsp;&nbsp;&nbsp; const guchar *data =3D (guchar *) ts; \<br=
>
          ++&nbsp;&nbsp;&nbsp; gint length =3D len &lt; 0 ? strlen(ts) : =
len; \<br>
          ++&nbsp;&nbsp;&nbsp; cr_assert_not(scan_rfc3164_timestamp(&amp;=
data,
          &amp;length, &amp;wct)); \<br>
          +&nbsp;&nbsp; })<br>
          + <br>
          + #define _expect_rfc5424_timestamp_eq(ts, expected) \<br>
          +&nbsp;&nbsp; ({ \<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; gchar converted[32]; \<br>
          +-&nbsp;&nbsp;&nbsp; cr_expect(_rfc5424_timestamp_eq(ts, expect=
ed,
          converted), &quot;Parsed RFC5424 timestamp does not equal expec=
ted,
          ts=3D%s, converted=3D%s, expected=3D%s&quot;, ts, converted, ex=
pected); \<br>
          ++&nbsp;&nbsp;&nbsp; cr_expect(_rfc5424_timestamp_eq(ts, -1, ex=
pected,
          converted), &quot;Parsed RFC5424 timestamp does not equal expec=
ted,
          ts=3D%s, converted=3D%s, expected=3D%s&quot;, ts, converted, ex=
pected); \<br>
          ++&nbsp; })<br>
          ++<br>
          ++#define _expect_rfc5424_timestamp_len_eq(ts, len, expected)
          \<br>
          ++&nbsp; ({ \<br>
          ++&nbsp;&nbsp;&nbsp; gchar converted[32]; \<br>
          ++&nbsp;&nbsp;&nbsp; cr_expect(_rfc5424_timestamp_eq(ts, len, e=
xpected,
          converted), &quot;Parsed RFC5424 timestamp does not equal expec=
ted,
          ts=3D%s, converted=3D%s, expected=3D%s&quot;, ts, converted, ex=
pected); \<br>
          ++&nbsp; })<br>
          ++<br>
          ++#define _expect_rfc5424_fails(ts, len) \<br>
          ++&nbsp; ({&nbsp; \<br>
          ++&nbsp;&nbsp;&nbsp; WallClockTime wct =3D WALL_CLOCK_TIME_INIT=
; \<br>
          ++&nbsp;&nbsp;&nbsp; const guchar *data =3D (guchar *) ts; \<br=
>
          ++&nbsp;&nbsp;&nbsp; gint length =3D len &lt; 0 ? strlen(ts) : =
len; \<br>
          ++&nbsp;&nbsp;&nbsp; cr_assert_not(scan_rfc5424_timestamp(&amp;=
data,
          &amp;length, &amp;wct)); \<br>
          +&nbsp;&nbsp; })<br>
          + <br>
          ++<br>
          + Test(parse_timestamp, standard_bsd_format)<br>
          + {<br>
          +&nbsp;&nbsp; _expect_rfc3164_timestamp_eq(&quot;Oct&nbsp; 1 17=
:46:12&quot;,
          &quot;2017-10-01T17:46:12.000+02:00&quot;);<br>
          +@@ -148,6 +186,68 @@ Test(parse_timestamp,
          standard_bsd_format_year_in_the_past)<br>
          +&nbsp;&nbsp; _expect_rfc3164_timestamp_eq(&quot;Dec 31 17:46:1=
2&quot;,
          &quot;2017-12-31T17:46:12.000+01:00&quot;);<br>
          + }<br>
          + <br>
          ++Test(parse_timestamp,
          non_zero_terminated_rfc3164_iso_input_is_handled_properly)<br>
          ++{<br>
          ++&nbsp; gchar *ts =3D &quot;2022-08-17T05:02:28.417Z whatever&=
quot;;<br>
          ++&nbsp; gint ts_len =3D 24;<br>
          ++<br>
          ++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, strlen(ts),
          &quot;2022-08-17T05:02:28.417+00:00&quot;);<br>
          ++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5,
          &quot;2022-08-17T05:02:28.417+00:00&quot;);<br>
          ++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len,
          &quot;2022-08-17T05:02:28.417+00:00&quot;);<br>
          ++<br>
          ++&nbsp; /* no &quot;Z&quot; parsed, timezone defaults to local=
, forced CET
          */<br>
          ++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len - 1,
          &quot;2022-08-17T05:02:28.417+02:00&quot;);<br>
          ++<br>
          ++&nbsp; /* msec is partially parsed as we trim the string from=
 the
          right */<br>
          ++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len - 2,
          &quot;2022-08-17T05:02:28.410+02:00&quot;);<br>
          ++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len - 3,
          &quot;2022-08-17T05:02:28.400+02:00&quot;);<br>
          ++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len - 4,
          &quot;2022-08-17T05:02:28.000+02:00&quot;);<br>
          ++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len - 5,
          &quot;2022-08-17T05:02:28.000+02:00&quot;);<br>
          ++<br>
          ++&nbsp; for (gint i =3D 6; i &lt; ts_len; i++)<br>
          ++&nbsp;&nbsp;&nbsp; _expect_rfc3164_fails(ts, ts_len - i);<br>
          ++<br>
          ++}<br>
          ++<br>
          ++Test(parse_timestamp,
          non_zero_terminated_rfc3164_bsd_pix_or_asa_input_is_handled_pro=
perly)<br>
          ++{<br>
          ++&nbsp; gchar *ts =3D &quot;Aug 17 2022 05:02:28: whatever&quo=
t;;<br>
          ++&nbsp; gint ts_len =3D 21;<br>
          ++<br>
          ++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, strlen(ts),
          &quot;2022-08-17T05:02:28.000+02:00&quot;);<br>
          ++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5,
          &quot;2022-08-17T05:02:28.000+02:00&quot;);<br>
          ++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len,
          &quot;2022-08-17T05:02:28.000+02:00&quot;);<br>
          ++<br>
          ++&nbsp; /* no &quot;:&quot; at the end, that's a problem, unre=
cognized */<br>
          ++&nbsp; _expect_rfc3164_fails(ts, ts_len - 1);<br>
          ++<br>
          ++&nbsp; for (gint i =3D 1; i &lt; ts_len; i++)<br>
          ++&nbsp;&nbsp;&nbsp; _expect_rfc3164_fails(ts, ts_len - i);<br>
          ++}<br>
          ++<br>
          ++Test(parse_timestamp,
          non_zero_terminated_rfc5424_input_is_handled_properly)<br>
          ++{<br>
          ++&nbsp; gchar *ts =3D &quot;2022-08-17T05:02:28.417Z whatever&=
quot;;<br>
          ++&nbsp; gint ts_len =3D 24;<br>
          ++<br>
          ++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, strlen(ts),
          &quot;2022-08-17T05:02:28.417+00:00&quot;);<br>
          ++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len + 5,
          &quot;2022-08-17T05:02:28.417+00:00&quot;);<br>
          ++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len,
          &quot;2022-08-17T05:02:28.417+00:00&quot;);<br>
          ++<br>
          ++&nbsp; /* no &quot;Z&quot; parsed, timezone defaults to local=
, forced CET
          */<br>
          ++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len - 1,
          &quot;2022-08-17T05:02:28.417+02:00&quot;);<br>
          ++<br>
          ++&nbsp; /* msec is partially parsed as we trim the string from=
 the
          right */<br>
          ++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len - 2,
          &quot;2022-08-17T05:02:28.410+02:00&quot;);<br>
          ++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len - 3,
          &quot;2022-08-17T05:02:28.400+02:00&quot;);<br>
          ++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len - 4,
          &quot;2022-08-17T05:02:28.000+02:00&quot;);<br>
          ++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len - 5,
          &quot;2022-08-17T05:02:28.000+02:00&quot;);<br>
          ++<br>
          ++&nbsp; for (gint i =3D 6; i &lt; ts_len; i++)<br>
          ++&nbsp;&nbsp;&nbsp; _expect_rfc5424_fails(ts, ts_len - i);<br>
          ++<br>
          ++}<br>
          ++<br>
          + <br>
          + Test(parse_timestamp,
          daylight_saving_behavior_at_spring_with_explicit_timezones)<br>
          + {<br>
          +-- <br>
          +2.37.3<br>
          +<br>
          +<br>
          diff --git
          a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.p=
atch
b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch<br>
          new file mode 100644<br>
          index 000000000..e32076ab5<br>
          --- /dev/null<br>
          +++
          b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.p=
atch<br>
          @@ -0,0 +1,182 @@<br>
          +From 14bcd1596f0f194b28e3f7babc75ad90d39ae7af Mon Sep 17
          00:00:00 2001<br>
          +From: Laszlo Varady <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:laszlo.varady@protonmail.com">&lt;laszlo.varady@protonmail.com&gt=
;</a><br>
          +Date: Sat, 20 Aug 2022 14:29:43 +0200<br>
          +Subject: [PATCH 6/8] timeutils: name repeating constant<br>
          +MIME-Version: 1.0<br>
          +Content-Type: text/plain; charset=3DUTF-8<br>
          +Content-Transfer-Encoding: 8bit<br>
          +<br>
          +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:laszlo.varady=
@protonmail.com">&lt;laszlo.varady@protonmail.com&gt;</a><br>
          +<br>
          +Upstream-Status: Backport<br>
          +CVE: CVE-2022-38725<br>
          +<br>
          +Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/09f489c89c826293ff8cbd282c=
fc866ab56054c4<br>
          +<br>
          +Signed-off-by: Ovidiu Panait
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ovidiu.panait=
@windriver.com">&lt;ovidiu.panait@windriver.com&gt;</a><br>
          +---<br>
          + lib/timeutils/scan-timestamp.c | 54
          ++++++++++++++++++----------------<br>
          + 1 file changed, 29 insertions(+), 25 deletions(-)<br>
          +<br>
          +diff --git a/lib/timeutils/scan-timestamp.c
          b/lib/timeutils/scan-timestamp.c<br>
          +index cb6802d..197e3ad 100644<br>
          +--- a/lib/timeutils/scan-timestamp.c<br>
          ++++ b/lib/timeutils/scan-timestamp.c<br>
          +@@ -34,41 +34,43 @@ scan_day_abbrev(const gchar **buf, gint
          *left, gint *wday)<br>
          + {<br>
          +&nbsp;&nbsp; *wday =3D -1;<br>
          + <br>
          +-&nbsp; if (*left &lt; 3)<br>
          ++&nbsp; const gsize abbrev_length =3D 3;<br>
          ++<br>
          ++&nbsp; if (*left &lt; abbrev_length)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
          + <br>
          +&nbsp;&nbsp; switch (**buf)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; {<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; case 'S':<br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Su=
n&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Su=
n&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 0;<=
br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &qu=
ot;Sat&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &qu=
ot;Sat&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 6;<=
br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; case 'M':<br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Mo=
n&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Mo=
n&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 1;<=
br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; case 'T':<br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Tu=
e&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Tu=
e&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 2;<=
br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &qu=
ot;Thu&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &qu=
ot;Thu&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 4;<=
br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; case 'W':<br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;We=
d&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;We=
d&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 3;<=
br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; case 'F':<br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Fr=
i&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Fr=
i&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 5;<=
br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
          +@@ -77,8 +79,8 @@ scan_day_abbrev(const gchar **buf, gint
          *left, gint *wday)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
          + <br>
          +-&nbsp; (*buf) +=3D 3;<br>
          +-&nbsp; (*left) -=3D 3;<br>
          ++&nbsp; (*buf) +=3D abbrev_length;<br>
          ++&nbsp; (*left) -=3D abbrev_length;<br>
          +&nbsp;&nbsp; return TRUE;<br>
          + }<br>
          + <br>
          +@@ -87,63 +89,65 @@ scan_month_abbrev(const gchar **buf, gint
          *left, gint *mon)<br>
          + {<br>
          +&nbsp;&nbsp; *mon =3D -1;<br>
          + <br>
          +-&nbsp; if (*left &lt; 3)<br>
          ++&nbsp; const gsize abbrev_length =3D 3;<br>
          ++<br>
          ++&nbsp; if (*left &lt; abbrev_length)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
          + <br>
          +&nbsp;&nbsp; switch (**buf)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; {<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; case 'J':<br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Ja=
n&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Ja=
n&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 0;<b=
r>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &qu=
ot;Jun&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &qu=
ot;Jun&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 5;<b=
r>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &qu=
ot;Jul&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &qu=
ot;Jul&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 6;<b=
r>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; case 'F':<br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Fe=
b&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Fe=
b&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 1;<b=
r>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; case 'M':<br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Ma=
r&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Ma=
r&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 2;<b=
r>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &qu=
ot;May&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &qu=
ot;May&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 4;<b=
r>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; case 'A':<br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Ap=
r&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Ap=
r&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 3;<b=
r>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &qu=
ot;Aug&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &qu=
ot;Aug&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 7;<b=
r>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; case 'S':<br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Se=
p&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Se=
p&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 8;<b=
r>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; case 'O':<br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Oc=
t&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Oc=
t&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 9;<b=
r>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; case 'N':<br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;No=
v&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;No=
v&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 10;<=
br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; case 'D':<br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;De=
c&quot;, 3) =3D=3D 0)<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;De=
c&quot;, abbrev_length) =3D=3D 0)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 11;<=
br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
          +@@ -152,8 +156,8 @@ scan_month_abbrev(const gchar **buf, gint
          *left, gint *mon)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
          + <br>
          +-&nbsp; (*buf) +=3D 3;<br>
          +-&nbsp; (*left) -=3D 3;<br>
          ++&nbsp; (*buf) +=3D abbrev_length;<br>
          ++&nbsp; (*left) -=3D abbrev_length;<br>
          +&nbsp;&nbsp; return TRUE;<br>
          + }<br>
          + <br>
          +-- <br>
          +2.37.3<br>
          +<br>
          +<br>
          diff --git
          a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.p=
atch
b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch<br>
          new file mode 100644<br>
          index 000000000..b3135df4e<br>
          --- /dev/null<br>
          +++
          b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.p=
atch<br>
          @@ -0,0 +1,84 @@<br>
          +From d4c8ba0c513052b5f19c6e989ba31f847f4900d1 Mon Sep 17
          00:00:00 2001<br>
          +From: Laszlo Varady <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:laszlo.varady@protonmail.com">&lt;laszlo.varady@protonmail.com&gt=
;</a><br>
          +Date: Sat, 20 Aug 2022 14:30:22 +0200<br>
          +Subject: [PATCH 7/8] timeutils: fix invalid calculation of
          ISO timestamp<br>
          + length<br>
          +MIME-Version: 1.0<br>
          +Content-Type: text/plain; charset=3DUTF-8<br>
          +Content-Transfer-Encoding: 8bit<br>
          +<br>
          +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:laszlo.varady=
@protonmail.com">&lt;laszlo.varady@protonmail.com&gt;</a><br>
          +<br>
          +Upstream-Status: Backport<br>
          +CVE: CVE-2022-38725<br>
          +<br>
          +Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/8c6e2c1c41b0fcc5fbd464c35f=
4dac7102235396<br>
          +<br>
          +Signed-off-by: Ovidiu Panait
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ovidiu.panait=
@windriver.com">&lt;ovidiu.panait@windriver.com&gt;</a><br>
          +---<br>
          + lib/timeutils/scan-timestamp.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 8 ++++++--<br>
          + lib/timeutils/tests/test_scan-timestamp.c | 7 +++++++<br>
          + 2 files changed, 13 insertions(+), 2 deletions(-)<br>
          +<br>
          +diff --git a/lib/timeutils/scan-timestamp.c
          b/lib/timeutils/scan-timestamp.c<br>
          +index 197e3ad..4e618e4 100644<br>
          +--- a/lib/timeutils/scan-timestamp.c<br>
          ++++ b/lib/timeutils/scan-timestamp.c<br>
          +@@ -346,19 +346,21 @@ __parse_usec(const guchar **data, gint
          *length)<br>
          + static gboolean<br>
          + __has_iso_timezone(const guchar *src, gint length)<br>
          + {<br>
          +-&nbsp; return (length &gt;=3D 5) &amp;&amp;<br>
          ++&nbsp; return (length &gt;=3D 6) &amp;&amp;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*src =3D=
=3D '+' || *src =3D=3D '-') &amp;&amp;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isdigit=
(*(src+1)) &amp;&amp;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isdigit=
(*(src+2)) &amp;&amp;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *(src+3=
) =3D=3D ':' &amp;&amp;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isdigit=
(*(src+4)) &amp;&amp;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isdigit=
(*(src+5)) &amp;&amp;<br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !isdigit(*(s=
rc+6));<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (length &lt;=
 7 || !isdigit(*(src+6)));<br>
          + }<br>
          + <br>
          + static guint32<br>
          + __parse_iso_timezone(const guchar **data, gint *length)<br>
          + {<br>
          ++&nbsp; g_assert(*length &gt;=3D 6);<br>
          ++<br>
          +&nbsp;&nbsp; gint hours, mins;<br>
          +&nbsp;&nbsp; const guchar *src =3D *data;<br>
          +&nbsp;&nbsp; guint32 tz =3D 0;<br>
          +@@ -368,8 +370,10 @@ __parse_iso_timezone(const guchar
          **data, gint *length)<br>
          +&nbsp;&nbsp; hours =3D (*(src + 1) - '0') * 10 + *(src + 2) - =
'0';<br>
          +&nbsp;&nbsp; mins =3D (*(src + 4) - '0') * 10 + *(src + 5) - '=
0';<br>
          +&nbsp;&nbsp; tz =3D sign * (hours * 3600 + mins * 60);<br>
          ++<br>
          +&nbsp;&nbsp; src +=3D 6;<br>
          +&nbsp;&nbsp; (*length) -=3D 6;<br>
          ++<br>
          +&nbsp;&nbsp; *data =3D src;<br>
          +&nbsp;&nbsp; return tz;<br>
          + }<br>
          +diff --git a/lib/timeutils/tests/test_scan-timestamp.c
          b/lib/timeutils/tests/test_scan-timestamp.c<br>
          +index da375c8..9b38738 100644<br>
          +--- a/lib/timeutils/tests/test_scan-timestamp.c<br>
          ++++ b/lib/timeutils/tests/test_scan-timestamp.c<br>
          +@@ -248,6 +248,13 @@ Test(parse_timestamp,
          non_zero_terminated_rfc5424_input_is_handled_properly)<br>
          + <br>
          + }<br>
          + <br>
          ++Test(parse_timestamp,
          non_zero_terminated_rfc5424_timestamp_only)<br>
          ++{<br>
          ++&nbsp; const gchar *ts =3D &quot;2022-08-17T05:02:28.417+03:0=
0&quot;;<br>
          ++&nbsp; gint ts_len =3D strlen(ts);<br>
          ++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len, ts);<br>
          ++}<br>
          ++<br>
          + <br>
          + Test(parse_timestamp,
          daylight_saving_behavior_at_spring_with_explicit_timezones)<br>
          + {<br>
          +-- <br>
          +2.37.3<br>
          +<br>
          +<br>
          diff --git
          a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.p=
atch
b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch<br>
          new file mode 100644<br>
          index 000000000..cec573fa2<br>
          --- /dev/null<br>
          +++
          b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.p=
atch<br>
          @@ -0,0 +1,47 @@<br>
          +From f60dcfa9e094dc9c2a752115ca426159c4ae4192 Mon Sep 17
          00:00:00 2001<br>
          +From: Laszlo Varady <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:laszlo.varady@protonmail.com">&lt;laszlo.varady@protonmail.com&gt=
;</a><br>
          +Date: Sat, 20 Aug 2022 14:30:51 +0200<br>
          +Subject: [PATCH 8/8] timeutils: fix out-of-bounds reading of
          data buffer<br>
          +MIME-Version: 1.0<br>
          +Content-Type: text/plain; charset=3DUTF-8<br>
          +Content-Transfer-Encoding: 8bit<br>
          +<br>
          +Signed-off-by: L=C3=A1szl=C3=B3 V=C3=A1rady
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:laszlo.varady=
@protonmail.com">&lt;laszlo.varady@protonmail.com&gt;</a><br>
          +<br>
          +Upstream-Status: Backport<br>
          +CVE: CVE-2022-38725<br>
          +<br>
          +Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/56f881c5eaa3d8c02c96607c4b=
9e4eaf959a044d<br>
          +<br>
          +Signed-off-by: Ovidiu Panait
          <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ovidiu.panait=
@windriver.com">&lt;ovidiu.panait@windriver.com&gt;</a><br>
          +---<br>
          + lib/timeutils/scan-timestamp.c | 4 ++--<br>
          + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
          +<br>
          +diff --git a/lib/timeutils/scan-timestamp.c
          b/lib/timeutils/scan-timestamp.c<br>
          +index 4e618e4..0f7f52e 100644<br>
          +--- a/lib/timeutils/scan-timestamp.c<br>
          ++++ b/lib/timeutils/scan-timestamp.c<br>
          +@@ -427,7 +427,7 @@ __parse_bsd_timestamp(const guchar
          **data, gint *length, WallClockTime *wct)<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!scan_pix_timestamp((=
const gchar **) &amp;src,
          &amp;left, wct))<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;=
<br>
          + <br>
          +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*src =3D=3D ':')<br>
          ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (left &amp;&amp; *src =3D=3D=
 ':')<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
rc++;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; l=
eft--;<br>
          +@@ -478,7 +478,7 @@ scan_rfc3164_timestamp(const guchar
          **data, gint *length, WallClockTime *wct)<br>
          +&nbsp;&nbsp;&nbsp; * looking at you, skip that as well, so we =
can reliably
          detect IPv6<br>
          +&nbsp;&nbsp;&nbsp; * addresses as hostnames, which would be us=
ing &quot;:&quot; as
          well. */<br>
          + <br>
          +-&nbsp; if (*src =3D=3D ':')<br>
          ++&nbsp; if (left &amp;&amp; *src =3D=3D ':')<br>
          +&nbsp;&nbsp;&nbsp;&nbsp; {<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ++src;<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --left;<br>
          +-- <br>
          +2.37.3<br>
          +<br>
          +<br>
          diff --git
          a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
          b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb<br>
          index 40bbfe495..5fc386e56 100644<br>
          --- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb<br>
          +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb<br>
          @@ -22,6 +22,14 @@ SRC_URI =3D
          &quot;<a class=3D"moz-txt-link-freetext" href=3D"https://github=
.com/balabit/syslog-ng/releases/download/$">https://github.com/balabit/sy=
slog-ng/releases/download/$</a>{BP}/${BP}.ta<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; <a href=3D"file://volatiles.03_syslog-ng" moz-do-not-send=3D"true">fi=
le://volatiles.03_syslog-ng</a> \<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; <a href=3D"file://syslog-ng-tmp.conf" moz-do-not-send=3D"true">file:/=
/syslog-ng-tmp.conf</a> \<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; <a href=3D"file://syslog-ng.service-the-syslog-ng-service.patch" moz-=
do-not-send=3D"true">file://syslog-ng.service-the-syslog-ng-service.patch=
</a>
          \<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-38725-0001.patch" moz-do-not-send=3D"true">file://CVE=
-2022-38725-0001.patch</a>
          \<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-38725-0002.patch" moz-do-not-send=3D"true">file://CVE=
-2022-38725-0002.patch</a>
          \<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-38725-0003.patch" moz-do-not-send=3D"true">file://CVE=
-2022-38725-0003.patch</a>
          \<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-38725-0004.patch" moz-do-not-send=3D"true">file://CVE=
-2022-38725-0004.patch</a>
          \<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-38725-0005.patch" moz-do-not-send=3D"true">file://CVE=
-2022-38725-0005.patch</a>
          \<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-38725-0006.patch" moz-do-not-send=3D"true">file://CVE=
-2022-38725-0006.patch</a>
          \<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-38725-0007.patch" moz-do-not-send=3D"true">file://CVE=
-2022-38725-0007.patch</a>
          \<br>
          +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-38725-0008.patch" moz-do-not-send=3D"true">file://CVE=
-2022-38725-0008.patch</a>
          \<br>
          &nbsp;&quot;<br>
          &nbsp;<br>
          &nbsp;SRC_URI[sha256sum] =3D
          &quot;90a25c9767fe749db50f118ddfc92ec71399763d2ecd5ad4f11ff5eea=
049e60b&quot;<br>
          -- <br>
          2.34.1<o:p></o:p></p>
        <p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
        <p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.=
com/fwlink/?LinkId=3D550986" moz-do-not-send=3D"true">
            Mail</a> for Windows</p>
        <p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
      </div>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#99684): <a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://lists.openembedded.org/g/openembedded-devel/message/99684">https://=
lists.openembedded.org/g/openembedded-devel/message/99684</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/95194280/3616765">https://lists.openembedded.org/mt/=
95194280/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------m8CUvG5OwFPvLk6L1a9JHA58--

