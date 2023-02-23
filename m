Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE33C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 14:18:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11500.1677161916127815758
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 06:18:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=rg6xNahp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=141849fe7d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31NDebK1021411
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 06:18:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=sFuMAtrtX4N7nkPxrQKO1MqFulf7UiUSkLsXgErTH+w=;
 b=rg6xNahpAbs4bEPf8G5OIoxOdQKTjMyvPtDrkzXUFKo4YPnvU6h1JWXCoZVCLxBeAJEB
 oix/zUtfh3RWR6am5B9442NW6DAS6zVTnmsdIUc/w4L6g+hDH7/WR2XIw3JwObUvgxv0
 qzJP0mZopxiApoPYCogplat4IDjTTy4bR0y0T/HUKTRCrknS2xPNhu8EXu3xkI0aswHF
 X5I0FmnxqFO4DFu7FRRkNX9t1JPSfpmDMQTNSwvOwmMhThOadOboUs2qT+4beAZ3qrHp
 7q5FfMnMqjZvrXzPXM9RkcVqUecLF7eM5/gBGBC/wgTB7OylZr8e3TZ4MelCycixFL2Y fw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6vrs9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 06:18:35 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31NEIYQq005351
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 06:18:34 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nttu6vrs6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Feb 2023 06:18:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIuO0iHT56LSKdjIXf6z4kp0fYjS5AvMEahWwBbnKyaZiv5wWZoZaEtET9lvowtUg0a4RcH6wFz/a/yQzuxE0AnYJ9j3myfnCfPl0XVex1wQEfdEFjxjhSdpcT2qRX4Jf3MAuWWmrYwDlORjAYadTsuCEB5RXL5piu/V0vR/tyY8wNTm+Ymq5snX6hpqzAxRTF6azDfE6V22F4IS8rXUJV+rG5uieMc9ijWpFT7wpwHxEL/1vLYLLwxmyq839pOITa4CeFMdkgnJnKSik65GZ1KjlDdAEOmLz87SKIPCePURBO4SplWjCxprxckNH3Lo9UTBzLZIk77ivWqU3h9r7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFuMAtrtX4N7nkPxrQKO1MqFulf7UiUSkLsXgErTH+w=;
 b=XjXJfBABZrZSauphzJdQsoK1k8X3Fk2MFuC1WDkz02+N4i2G/lBuza+0EC7C/cyQLfBEvFHtFOrGL5DkG6ZTODDf9702CdgN+Ffu4ml5DPwG9T1NwA13VfKBZiAE6xrhuu7IjS/M1LrIxt5ItcKVvXie498vgGwiSzgX8QLkvcnDmW7Z7/vgQqG16oGHpU8l0HDa0a8YBv0neg2czN+9ur/08he3F2Dsd5V4aQD4A27XgPYRPSMYiOWlA/trphXM81OAYXBi8lfB+J+jhto+pTQZghZENPzi2XFvcR9ZfGBT+RqHuVXhzUsjUCFgRAjRVVclgOY6HxMtxxQhqfIxiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH0PR11MB5660.namprd11.prod.outlook.com (2603:10b6:510:d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.21; Thu, 23 Feb
 2023 14:18:31 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6134.021; Thu, 23 Feb 2023
 14:18:31 +0000
Content-Type: multipart/alternative;
 boundary="------------OYHiM98MKaMgvbz4zstMDo6L"
Message-ID: <469f625e-b5d8-2317-9592-ee879be96466@windriver.com>
Date: Thu, 23 Feb 2023 22:18:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [oe] [meta-oe][PATCH] meta-oe: fix Upstream-Status format
Content-Language: en-US
To: Martin Jansa <martin.jansa@gmail.com>, Yi Zhao <yi.zhao@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230223124050.2282580-1-yi.zhao@windriver.com>
 <CA+chaQfAPSZooye1LOEnUht5n5s1=y8CNYet_tf5-Zg4EuZSBg@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CA+chaQfAPSZooye1LOEnUht5n5s1=y8CNYet_tf5-Zg4EuZSBg@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::10) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH0PR11MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: f941ff03-a1b3-4eb9-b965-08db15a8d702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W6vrF9BOWm2nOgllup7z+gxdsYWg0wyVQZIjf3VXJhDhUp55ivxhDu4SUtN1So9XcELL5b9ALUN6cUCrQ2pYTEz2ujC1vmATlfhJo6VksPAsfg8c/cYpXzkjH6kcjQe7hvOGS2eyHAjyhMCNONZXCBrvWY39zNenj6YkxErDhswn2HgdlZLMZfIq+OF5YoPv53IpL99hkufSzkWjgDqXOllcT58mdhapLpoNVbD9tPBTkBC9HqrbhFFaSUfBVBRQndqrLVJ68zO7FDr9wUIdcWxyBy+fBFjYY9U4V4rw1wVCan7eyjZSAtnmM46rs+oWVw0Ep1QVP9H5eN1iTrU7XLDQVjM6BMieik/U8DG2eLI0xt0o4T9qH6WCd8s9vAfLIsjvM9POVt4Rz9BWDgGEHE6jKCCtHYSmP8Uqwag97RqVJhtfD1De1gUTZYvKjGb2Q4+YQAK1o/WITdpCa/rgD/r2iPDXSuDiO7WJaSsfOonxFJk9lQv1CYOGB+IveHKDSVEBwsrEieMWMzPLkrqogLeh4HF716+UMRYxj/DgOgY+q130R7zoRHaIELAJBTECRLpsNArTH6/Tfnf6meI2EcFveJsWhbBErSHNBtB91d7nLISTxfrusJuOlfbQBHJyer3at/Fm/+n0+fnwBFjirnIKROiiB/uHib4jFg5a3xmZg3pmGIhZoFqTzmO5lmW+1fhC44yDKgVRvk+n+nuUWcdI1EJNJm8dWHd7I6HI6dw+yWBls2RvK/OhMZorsiD2obQ4i8nXEHhGvcI46B+7qg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(396003)(39850400004)(346002)(136003)(376002)(451199018)(44832011)(30864003)(86362001)(31696002)(2906002)(66899018)(166002)(38100700002)(31686004)(478600001)(966005)(6486002)(53546011)(33964004)(66574015)(186003)(26005)(36756003)(6666004)(66556008)(66476007)(66946007)(19627235002)(83380400001)(110136005)(41300700001)(4326008)(2616005)(6506007)(6512007)(8936002)(316002)(8676002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WGZlVTdFMnUxK2NJUHZ6ZmEybllrN1NwaEtNTENyaUZ3RFYyNitmSVZWa21R?=
 =?utf-8?B?UTQ1YjZBZm92ZDF4V0VlTnhXUEE4Y3JTcTZIRlZncVRTVmQ4VmVjRzFlREFT?=
 =?utf-8?B?UTdPN1dnLzFZb1o3QWl2Nk1FenlUZjMxTmtHUjRhazRnWGxWWWNRNk03K3Bs?=
 =?utf-8?B?OC83ZFZuUkthWG13SkRIU3FhK1JRbmFTRmxkTDNNN3E3WmhJck9BY3JxeWJw?=
 =?utf-8?B?Z2o4TnM0RW1PWlBDOUY1VFBOQy8rZW1xNFhnTTc5cFd3STRLdmVPS2ZWeXRM?=
 =?utf-8?B?Y3dmV0tkTzNxL040UUtablA5R1pyZjM5dG0rZW9QUkJkWXAvTytsU28wdDhB?=
 =?utf-8?B?OGhwNmRldmxPajZnNVdOdjBoWTU2OXNxNDZpOGVsYmdTSW5CVzVWdW15YUk2?=
 =?utf-8?B?VDY3ekpJOGt3ODB0eVlkd1pHa083S09hZVVSdktTTXFUZytKSDFTWThzREhZ?=
 =?utf-8?B?SU5ZZ1hOSnNkMUtqZnY1b201N2phUGNiRWhnSm9vOEovS3JPSk9lRlRqOGhS?=
 =?utf-8?B?ZGE5MFJlNG5oLzUvVTUzUi9nTWFtcVV0aUVOWng1ZTV2OHExc0NMTWJ2Mm9F?=
 =?utf-8?B?ZXNyWWlteS9hd0NZQWhqMmxDWEJiaHhmTVV2Um9reEFxUVJ0bkRWUUJSSHNY?=
 =?utf-8?B?R0w3emJncGpNUUdQNjAyVDhtNVdKUnZqUFpsaTUzMURIbWRKb21ibnovTkpV?=
 =?utf-8?B?dGgrZHF6V3I2VWQzUHNSNnExdW5pMEJ6MUxINWRVenBKUlZzcWxnaHZySmdx?=
 =?utf-8?B?OFFWNTVJbmtHTWZxZjBCa0UrRkNGaTQ3bzg5WHJzNU5zOHZIb3dwcEhOTDVO?=
 =?utf-8?B?ZWJFd0hwaEo4ajF2R05UbnV0RllVOXpJejZNbmFYRllXYlBxNlh2TjN6WnZW?=
 =?utf-8?B?OUo3K2ZUQ1cxZ2U5YkZOUDhSN01FU21OaWY4bHlxOXVWby80TjVERzNEN3ZD?=
 =?utf-8?B?T1VaRDREMmFQV2VpZFZISGQ3VndvZ1Z2TENyTTlKL3A5ODB4dEhkdmZ1WWlH?=
 =?utf-8?B?d3AyL3R4Q3F3bWNSY1pLZkhlRDkrRThIUXl0S0lnaUd5SDZZV2o2eU5xVmZv?=
 =?utf-8?B?YkQycjl2dENYVHdBZ2VFZWRVcXNxVEtxa1JJVGd5b1F6emlBb2orSEEwZWFT?=
 =?utf-8?B?SWFqV3F1OU9WN0xPdXVJV08vSlB6SUl1MitOWElnekJOb2NMZE5GVGpjZXZN?=
 =?utf-8?B?YzhaMmFSN0IxT0tYNUFCVVcxaGJNTE9KN3hFbU9MdXZIc09ZZ0N1RENYY01N?=
 =?utf-8?B?NFptVzJRblRGRXpZM2lSS0g5TXJUZXR0V2VsYkg1d1Fsck54U0lBeVE1cmU2?=
 =?utf-8?B?L2s2WFlQSnRSVVJyWmxyb01oWVNmT0hjWGxYc0QrUTVXczIyMVYrdGJaOXlT?=
 =?utf-8?B?NUIybTlYdk5LeHkyblJPYjhnQ09SdGwxRWQyNXFiSy9sU2l4STlFY010U0RQ?=
 =?utf-8?B?RHhhODNLbU1JTXJqd0NQeDFJSGJkcGNWb1NlTGJRQW96QVJIMW9EeXBWdE10?=
 =?utf-8?B?aStJSHNqeS9ZSEx4QldXVnZSMUJsWmRqUW42VDMxbFAyRExDU1daWVIrKzND?=
 =?utf-8?B?ZXNpUkVXeng0L0tvRlVXMkcyUmI5UnpZZTNVUUNJR3gxYmVmMnB6Q3ZoQW5N?=
 =?utf-8?B?aGowUU1ZcERpdkhsOUpLTUFVYVZVWkszVWRCdXVLWG5GdTlzM1RKY0YzS2ph?=
 =?utf-8?B?aFV6U25aaEZrb2VzM0JRcE9RaWpzL2hNc2h4VEx2YXlyVVVoQlhJVnJsaWJY?=
 =?utf-8?B?cGdwRlZZS0wwUGJOVnlwVDA3NmpjcXhUWlFGMUpiSWtkK1FUbDhiR1JLODM2?=
 =?utf-8?B?YUl6TkZkZSs0VVhlckVwRTg4YjVlb3VCazJiUzgrTHZROHRrdGxuYTRsNlpi?=
 =?utf-8?B?eWozd1NEWmllcHBxbUxERHJVTnNkcXhWM1FJOGFHcy9QVlBQSUdkZFVGQVFa?=
 =?utf-8?B?a3Z1ejlsaFZOTFVKQUlFVmd1SEdOSTJQbW9Yb0h6emh2RlltejR5ZUJqblk5?=
 =?utf-8?B?R2M4R0JWVlo2NVhiaEd5czdCcXNKcFlQY3J6Y1NJQUNyMi9uS215am40Yldv?=
 =?utf-8?B?WS9UVzNBS0xsUXhXNWMrVldDclF5MWZMRE9UMTlmZCtWOVFIb2k0UnFQYmRt?=
 =?utf-8?B?OHpZODNMb01KZzRubWdCczVGaUUyZUM5RHliL21nNFNIOTcxVFNLQ2lDK0Uy?=
 =?utf-8?B?TEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f941ff03-a1b3-4eb9-b965-08db15a8d702
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 14:18:31.1681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWgBv+fU6CR3OkYOlgORd1EXgM2s0cXG+vfZ3VJcLHhO5eUTP6a68ZjRqA/KYwo0J013TA0OwnIwC3DLJQh4vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5660
X-Proofpoint-ORIG-GUID: iPnPFJkpt8iysGt0jUTDzdHoOLXEcEnf
X-Proofpoint-GUID: FyDmlWh07YtA3NpDLChu3whp2dQOusna
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_08,2023-02-23_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 adultscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302230117
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 14:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101232

--------------OYHiM98MKaMgvbz4zstMDo6L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 31NDebK1021411


On 2/23/23 21:12, Martin Jansa wrote:
> Be aware that with:
> https://patchwork.yoctoproject.org/project/oe-core/patch/20230215172041=
.636292-3-Martin.Jansa@gmail.com/=20
> <https://urldefense.com/v3/__https://patchwork.yoctoproject.org/project=
/oe-core/patch/20230215172041.636292-3-Martin.Jansa@gmail.com/__;!!AjveYd=
w8EvQ!cE3DkaINahusvd5dYlzd1p1Eq6K2nj9yGi9yrZcwLs_M27CT8hzjQxRd_Obfmv_NnC4=
bjwMSl9MFjvEoA53LpUrgdK0$>
>
> meta-oe layers have 81 malformed Upstream-Status entries (before your=20
> patches are applied), so there are many more cases.
>
> But I agree that if it's included, it should be in the right format,=20
> because other people might copy&paste it to other new .patch files as=20
> well.
>
> I can send fixes for the rest.


Thanks Martin. The ones I fixed were checked out by layerindex.


//Yi

>
> On Thu, Feb 23, 2023 at 1:41 PM Yi Zhao <yi.zhao@eng.windriver.com> wro=
te:
>
>     Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>     ---
>     =C2=A0.../0001-server-Adjust-the-cache-alignment-assumptions.patch =
| 2 +-
>     =C2=A0.../obexftp/obexftp/Remove_some_printf_in_obexftpd.patch | 2 =
+-
>     =C2=A0.../lshw/files/0001-disable-docbook2man.patch =C2=A0| 2 +-
>     =C2=A0.../fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch | 2 =
+-
>     =C2=A0...rust.configure-do-not-try-to-find-a-suitable-upstrea.patch=
 | 2 +-
>     =C2=A0.../lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch =C2=A0| 4 +--=
-
>     =C2=A0.../hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff | 2 +-
>     =C2=A0.../libb64/libb64/0001-example-Do-not-run-the-tests.patch =C2=
=A0| 2 +-
>     =C2=A0...configure.ac-do-additional-checks-on-libxml2-also-wh.patch=
 | 4
>     +---
>     =C2=A0.../sharutils/sharutils/CVE-2018-1000097.patch | 2 +-
>     =C2=A010 files changed, 10 insertions(+), 14 deletions(-)
>
>     diff --git
>     a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/00=
01-server-Adjust-the-cache-alignment-assumptions.patch
>     b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/00=
01-server-Adjust-the-cache-alignment-assumptions.patch
>     index bf083c85f..52c9df9b1 100644
>     ---
>     a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/00=
01-server-Adjust-the-cache-alignment-assumptions.patch
>     +++
>     b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/00=
01-server-Adjust-the-cache-alignment-assumptions.patch
>     @@ -15,7 +15,7 @@ src/mongo/db/stats/counters.h:185:47: error:
>     static assertion failed: cache line
>     =C2=A0The structure need to ensure true sharing for both the elemen=
ts
>     =C2=A0so align it to hardware_constructive_interference_size instea=
d
>
>     -Upstream-Status: Reported
>     [https://jira.mongodb.org/browse/SERVER-65664
>     <https://urldefense.com/v3/__https://jira.mongodb.org/browse/SERVER=
-65664__;!!AjveYdw8EvQ!cE3DkaINahusvd5dYlzd1p1Eq6K2nj9yGi9yrZcwLs_M27CT8h=
zjQxRd_Obfmv_NnC4bjwMSl9MFjvEoA53LgylQYHY$>]
>     +Upstream-Status: Inappropriate
>     [https://jira.mongodb.org/browse/SERVER-65664
>     <https://urldefense.com/v3/__https://jira.mongodb.org/browse/SERVER=
-65664__;!!AjveYdw8EvQ!cE3DkaINahusvd5dYlzd1p1Eq6K2nj9yGi9yrZcwLs_M27CT8h=
zjQxRd_Obfmv_NnC4bjwMSl9MFjvEoA53LgylQYHY$>]
>
>     =C2=A0Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     =C2=A0---
>     diff --git
>     a/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_i=
n_obexftpd.patch
>     b/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_i=
n_obexftpd.patch
>     index 8b73af32e..23e92885e 100644
>     ---
>     a/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_i=
n_obexftpd.patch
>     +++
>     b/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_i=
n_obexftpd.patch
>     @@ -1,6 +1,6 @@
>     =C2=A0Signed-off-by: Jun Zhu <R01007@freescale.com>
>
>     -Upstream-Status:=C2=A0 Not applicable
>     +Upstream-Status: Inappropriate [embedded specific]
>
>     =C2=A0diff -Nru obexftp-0.23/apps.orig/obexftpd.c
>     obexftp-0.23/apps/obexftpd.c
>     =C2=A0--- obexftp-0.23/apps.orig/obexftpd.c=C2=A0 2013-11-08
>     10:42:20.816631583 +0800
>     diff --git
>     a/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patc=
h
>     b/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patc=
h
>     index 00f7b8674..706f2d524 100644
>     ---
>     a/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patc=
h
>     +++
>     b/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patc=
h
>     @@ -5,7 +5,7 @@ Subject: [PATCH] build: Do not build .sgml file
>
>     =C2=A0It needs docbook2man tool which we do not have recipe for
>
>     -Upstream-Status: OE-Specific [needs native docbook2man tool]
>     +Upstream-Status: Inappropriate [needs native docbook2man tool]
>
>     =C2=A0Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>     =C2=A0---
>     diff --git
>     a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-=
overwrite-CFLAGS.patch
>     b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-=
overwrite-CFLAGS.patch
>     index 6c585c2f5..158857ae2 100644
>     ---
>     a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-=
overwrite-CFLAGS.patch
>     +++
>     b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-=
overwrite-CFLAGS.patch
>     @@ -7,7 +7,7 @@ bitbake passes CFLAGS that are often in conflict
>     with the ones set
>     =C2=A0in mbedtls' CMakeLists.txt. Such conflicts are the inability =
to use
>     =C2=A0FORTIFY_SOURCE=3D2 except in release mode
>
>     -Upstream-Status: Innapropriate [due to fluent-bit having it's own
>     Release flags that also overwrite bitbake ones.]
>     +Upstream-Status: Inappropriate [due to fluent-bit having it's own
>     Release flags that also overwrite bitbake ones.]
>     =C2=A0---
>     =C2=A0 lib/mbedtls-2.28.0/CMakeLists.txt | 2 --
>     =C2=A0 1 file changed, 2 deletions(-)
>     diff --git
>     a/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-n=
ot-try-to-find-a-suitable-upstrea.patch
>     b/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-n=
ot-try-to-find-a-suitable-upstrea.patch
>     index e63b05356..202f12612 100644
>     ---
>     a/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-n=
ot-try-to-find-a-suitable-upstrea.patch
>     +++
>     b/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-n=
ot-try-to-find-a-suitable-upstrea.patch
>     @@ -5,7 +5,7 @@ Subject: [PATCH] rust.configure: do not try to
>     find a suitable upstream target
>
>     =C2=A0OE is using custom targets and so this is bound to fail.
>
>     -Upstream-Status: Inapppropriate [oe-core specific]
>     +Upstream-Status: Inappropriate [oe-core specific]
>     =C2=A0Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>
>     =C2=A0---
>     diff --git
>     a/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.pa=
tch
>     b/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.pa=
tch
>     index afe11f353..d232f6913 100644
>     ---
>     a/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.pa=
tch
>     +++
>     b/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.pa=
tch
>     @@ -3,9 +3,7 @@ From: dgod <dgod.osa@gmail.com>
>     =C2=A0Date: Mon, 21 Mar 2016 19:25:25 +0800
>     =C2=A0Subject: [PATCH] fix css under gtk 3.20
>
>     -Upstream-Status: Applied [1]
>     -
>     -[1]
>     https://git.lxde.org/gitweb/?p=3Dlxde/lxdm.git;a=3Dpatch;h=3D728128=
94cfd9454d70e4b0753531e46580416771
>     +Upstream-Status
>     <https://urldefense.com/v3/__https://git.lxde.org/gitweb/?p=3Dlxde*=
lxdm.git;a=3Dpatch;h=3D72812894cfd9454d70e4b0753531e46580416771*Upstream-=
Status__;Lys!!AjveYdw8EvQ!cE3DkaINahusvd5dYlzd1p1Eq6K2nj9yGi9yrZcwLs_M27C=
T8hzjQxRd_Obfmv_NnC4bjwMSl9MFjvEoA53L-bK1X_s$>:
>     Backport
>     [https://git.lxde.org/gitweb/?p=3Dlxde/lxdm.git;a=3Dpatch;h=3D72812=
894cfd9454d70e4b0753531e46580416771
>     <https://urldefense.com/v3/__https://git.lxde.org/gitweb/?p=3Dlxde*=
lxdm.git;a=3Dpatch;h=3D72812894cfd9454d70e4b0753531e46580416771__;Lw!!Ajv=
eYdw8EvQ!cE3DkaINahusvd5dYlzd1p1Eq6K2nj9yGi9yrZcwLs_M27CT8hzjQxRd_Obfmv_N=
nC4bjwMSl9MFjvEoA53LobvSxMI$>]
>     =C2=A0---
>     =C2=A0 data/themes/Industrial/gtk.css | 1 +
>     =C2=A0 1 file changed, 1 insertion(+)
>     diff --git
>     a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.dif=
f
>     b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.dif=
f
>     index 057b1fd1d..60953381a 100644
>     ---
>     a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.dif=
f
>     +++
>     b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.dif=
f
>     @@ -6,7 +6,7 @@ Filtered with:
>     =C2=A0 =C2=A0filterdiff -p1 -x README -x 'debian/*'
>
>
>     -Upstream-Status: unmaintained
>     +Upstream-Status: Inappropriate [unmaintained]
>
>     =C2=A0Index: hddtemp-0.3-beta15/doc/hddtemp.8
>     =C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>     diff --git
>     a/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the=
-tests.patch
>     b/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the=
-tests.patch
>     index ea3ddfb64..b3ee24d9d 100644
>     ---
>     a/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the=
-tests.patch
>     +++
>     b/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the=
-tests.patch
>     @@ -3,7 +3,7 @@ From: Khem Raj <raj.khem@gmail.com>
>     =C2=A0Date: Sat, 27 Mar 2021 21:41:04 -0700
>     =C2=A0Subject: [PATCH] example: Do not run the tests
>
>     -Upstream-Status: Inappropritate [Cross-compile specific]
>     +Upstream-Status: Inappropriate [Cross-compile specific]
>     =C2=A0Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     =C2=A0---
>     =C2=A0 examples/Makefile | 3 ---
>     diff --git
>     a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additi=
onal-checks-on-libxml2-also-wh.patch
>     b/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additi=
onal-checks-on-libxml2-also-wh.patch
>     index 7faeb130a..490b61f1f 100644
>     ---
>     a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additi=
onal-checks-on-libxml2-also-wh.patch
>     +++
>     b/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additi=
onal-checks-on-libxml2-also-wh.patch
>     @@ -7,9 +7,7 @@ MIME-Version: 1.0
>     =C2=A0Content-Type: text/plain; charset=3DUTF-8
>     =C2=A0Content-Transfer-Encoding: 8bit
>
>     -Upstream-Status: Applied [1]
>     -
>     -[1] https://github.com/dajobe/raptor/pull/33
>     <https://urldefense.com/v3/__https://github.com/dajobe/raptor/pull/=
33__;!!AjveYdw8EvQ!cE3DkaINahusvd5dYlzd1p1Eq6K2nj9yGi9yrZcwLs_M27CT8hzjQx=
Rd_Obfmv_NnC4bjwMSl9MFjvEoA53LRw0LEs4$>
>     +Upstream-Status: Backport
>     [https://github.com/dajobe/raptor/commit/e75b1dbb7f2a6514b8d391b200=
c45a2bec6268bf
>     <https://urldefense.com/v3/__https://github.com/dajobe/raptor/commi=
t/e75b1dbb7f2a6514b8d391b200c45a2bec6268bf__;!!AjveYdw8EvQ!cE3DkaINahusvd=
5dYlzd1p1Eq6K2nj9yGi9yrZcwLs_M27CT8hzjQxRd_Obfmv_NnC4bjwMSl9MFjvEoA53LXXz=
gDhk$>]
>
>     =C2=A0Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
>     =C2=A0---
>     diff --git
>     a/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patc=
h
>     b/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patc=
h
>     index 99dc4e304..47eb9cfd6 100644
>     ---
>     a/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patc=
h
>     +++
>     b/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patc=
h
>     @@ -36,7 +36,7 @@ This was reported in
>     =C2=A0<http://lists.gnu.org/archive/html/bug-gnu-utils/2018-02/msg0=
0004.html
>     <https://urldefense.com/v3/__http://lists.gnu.org/archive/html/bug-=
gnu-utils/2018-02/msg00004.html__;!!AjveYdw8EvQ!cE3DkaINahusvd5dYlzd1p1Eq=
6K2nj9yGi9yrZcwLs_M27CT8hzjQxRd_Obfmv_NnC4bjwMSl9MFjvEoA53LAXmj02c$>>.
>
>     =C2=A0CVE: CVE-2018-1000097
>     -Upstream-Status: no upstream
>     [http://lists.gnu.org/archive/html/bug-gnu-utils/2018-02/msg00004.h=
tml
>     <https://urldefense.com/v3/__http://lists.gnu.org/archive/html/bug-=
gnu-utils/2018-02/msg00004.html__;!!AjveYdw8EvQ!cE3DkaINahusvd5dYlzd1p1Eq=
6K2nj9yGi9yrZcwLs_M27CT8hzjQxRd_Obfmv_NnC4bjwMSl9MFjvEoA53LAXmj02c$>]
>     +Upstream-Status: Inappropriate [no upstream]
>     =C2=A0Signed-off-by: Petr P=C3=ADsa=C5=99 <ppisar@redhat.com>
>     =C2=A0Signed-off-by: Sinan Kaya <okaya@kernel.org>
>     =C2=A0---
>     --=20
>     2.25.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#101224):
>     https://lists.openembedded.org/g/openembedded-devel/message/101224
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/101224__;!!AjveYdw8EvQ!cE3DkaINahusvd5dYlzd1p1Eq6K2=
nj9yGi9yrZcwLs_M27CT8hzjQxRd_Obfmv_NnC4bjwMSl9MFjvEoA53LyGenRZ0$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/97181611/3617156
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/9718=
1611/3617156__;!!AjveYdw8EvQ!cE3DkaINahusvd5dYlzd1p1Eq6K2nj9yGi9yrZcwLs_M=
27CT8hzjQxRd_Obfmv_NnC4bjwMSl9MFjvEoA53L61IxVcM$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!cE3DkaINahusvd5dYlzd1p1Eq6K2nj9yGi9yr=
ZcwLs_M27CT8hzjQxRd_Obfmv_NnC4bjwMSl9MFjvEoA53L7_4KSck$>
>     [Martin.Jansa@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------OYHiM98MKaMgvbz4zstMDo6L
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 31NDebK1021411

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2/23/23 21:12, Martin Jansa wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQfAPSZooye1LOEnUht5n5s1=3D=
y8CNYet_tf5-Zg4EuZSBg@mail.gmail.com">
     =20
      <div dir=3D"ltr">Be aware that with:
        <div><a href=3D"https://urldefense.com/v3/__https://patchwork.yoc=
toproject.org/project/oe-core/patch/20230215172041.636292-3-Martin.Jansa@=
gmail.com/__;!!AjveYdw8EvQ!cE3DkaINahusvd5dYlzd1p1Eq6K2nj9yGi9yrZcwLs_M27=
CT8hzjQxRd_Obfmv_NnC4bjwMSl9MFjvEoA53LpUrgdK0$" moz-do-not-send=3D"true">=
https://patchwork.yoctoproject.org/project/oe-core/patch/20230215172041.6=
36292-3-Martin.Jansa@gmail.com/</a><br>
        </div>
        <div><br>
        </div>
        <div>meta-oe layers have 81 malformed Upstream-Status entries
          (before your patches are applied), so there are many more
          cases.</div>
        <div><br>
        </div>
        <div>But I agree that if it's included, it should be in the
          right format, because other people might copy&amp;paste it to
          other new .patch files as well.</div>
        <div><br>
        </div>
        <div>I can send fixes for the rest.</div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Thanks Martin. The ones I fixed were checked out by layerindex.</p=
>
    <p><br>
    </p>
    <p>//Yi<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CA+chaQfAPSZooye1LOEnUht5n5s1=3D=
y8CNYet_tf5-Zg4EuZSBg@mail.gmail.com"><br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 23, 2023 at 1:4=
1
          PM Yi Zhao &lt;<a href=3D"mailto:yi.zhao@eng.windriver.com" moz=
-do-not-send=3D"true" class=3D"moz-txt-link-freetext">yi.zhao@eng.windriv=
er.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Signed-off-by:
          Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=3D"=
_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">yi.zhao@=
windriver.com</a>&gt;<br>
          ---<br>
          &nbsp;.../0001-server-Adjust-the-cache-alignment-assumptions.pa=
tch&nbsp;
          | 2 +-<br>
          &nbsp;.../obexftp/obexftp/Remove_some_printf_in_obexftpd.patch&=
nbsp; &nbsp; &nbsp;
          | 2 +-<br>
          &nbsp;.../lshw/files/0001-disable-docbook2man.patch&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp;| 2 +-<br>
          &nbsp;.../fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch&=
nbsp; &nbsp; &nbsp;
          | 2 +-<br>
          &nbsp;...rust.configure-do-not-try-to-find-a-suitable-upstrea.p=
atch
          | 2 +-<br>
          &nbsp;.../lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch&nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp;| 4 +---<br>
          &nbsp;.../hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          | 2 +-<br>
          &nbsp;.../libb64/libb64/0001-example-Do-not-run-the-tests.patch=
&nbsp; &nbsp;
          &nbsp;| 2 +-<br>
          &nbsp;...configure.ac-do-additional-checks-on-libxml2-also-wh.p=
atch
          | 4 +---<br>
          &nbsp;.../sharutils/sharutils/CVE-2018-1000097.patch&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          | 2 +-<br>
          &nbsp;10 files changed, 10 insertions(+), 14 deletions(-)<br>
          <br>
          diff --git
a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-ser=
ver-Adjust-the-cache-alignment-assumptions.patch
b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-ser=
ver-Adjust-the-cache-alignment-assumptions.patch<br>
          index bf083c85f..52c9df9b1 100644<br>
          ---
a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-ser=
ver-Adjust-the-cache-alignment-assumptions.patch<br>
          +++
b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-ser=
ver-Adjust-the-cache-alignment-assumptions.patch<br>
          @@ -15,7 +15,7 @@ src/mongo/db/stats/counters.h:185:47: error:
          static assertion failed: cache line<br>
          &nbsp;The structure need to ensure true sharing for both the
          elements<br>
          &nbsp;so align it to hardware_constructive_interference_size
          instead<br>
          <br>
          -Upstream-Status: Reported [<a href=3D"https://urldefense.com/v=
3/__https://jira.mongodb.org/browse/SERVER-65664__;!!AjveYdw8EvQ!cE3DkaIN=
ahusvd5dYlzd1p1Eq6K2nj9yGi9yrZcwLs_M27CT8hzjQxRd_Obfmv_NnC4bjwMSl9MFjvEoA=
53LgylQYHY$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true=
">https://jira.mongodb.org/browse/SERVER-65664</a>]<br>
          +Upstream-Status: Inappropriate [<a href=3D"https://urldefense.=
com/v3/__https://jira.mongodb.org/browse/SERVER-65664__;!!AjveYdw8EvQ!cE3=
DkaINahusvd5dYlzd1p1Eq6K2nj9yGi9yrZcwLs_M27CT8hzjQxRd_Obfmv_NnC4bjwMSl9MF=
jvEoA53LgylQYHY$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">https://jira.mongodb.org/browse/SERVER-65664</a>]<br>
          <br>
          &nbsp;Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">raj.khem@gmail.com</a>&gt;<br>
          &nbsp;---<br>
          diff --git
a/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_obex=
ftpd.patch
b/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_obex=
ftpd.patch<br>
          index 8b73af32e..23e92885e 100644<br>
          ---
a/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_obex=
ftpd.patch<br>
          +++
b/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_obex=
ftpd.patch<br>
          @@ -1,6 +1,6 @@<br>
          &nbsp;Signed-off-by: Jun Zhu &lt;<a href=3D"mailto:R01007@frees=
cale.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-lin=
k-freetext">R01007@freescale.com</a>&gt;<br>
          <br>
          -Upstream-Status:&nbsp; Not applicable<br>
          +Upstream-Status: Inappropriate [embedded specific]<br>
          <br>
          &nbsp;diff -Nru obexftp-0.23/apps.orig/obexftpd.c
          obexftp-0.23/apps/obexftpd.c<br>
          &nbsp;--- obexftp-0.23/apps.orig/obexftpd.c&nbsp; 2013-11-08
          10:42:20.816631583 +0800<br>
          diff --git
          a/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.=
patch
b/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch<br>
          index 00f7b8674..706f2d524 100644<br>
          ---
          a/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.=
patch<br>
          +++
          b/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.=
patch<br>
          @@ -5,7 +5,7 @@ Subject: [PATCH] build: Do not build .sgml
          file<br>
          <br>
          &nbsp;It needs docbook2man tool which we do not have recipe for=
<br>
          <br>
          -Upstream-Status: OE-Specific [needs native docbook2man tool]<b=
r>
          +Upstream-Status: Inappropriate [needs native docbook2man
          tool]<br>
          <br>
          &nbsp;Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.q=
uaresma@foundries.io" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">jose.quaresma@foundries.io</a>&gt;<br>
          &nbsp;---<br>
          diff --git
a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwr=
ite-CFLAGS.patch
b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwr=
ite-CFLAGS.patch<br>
          index 6c585c2f5..158857ae2 100644<br>
          ---
a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwr=
ite-CFLAGS.patch<br>
          +++
b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwr=
ite-CFLAGS.patch<br>
          @@ -7,7 +7,7 @@ bitbake passes CFLAGS that are often in
          conflict with the ones set<br>
          &nbsp;in mbedtls' CMakeLists.txt. Such conflicts are the inabil=
ity
          to use<br>
          &nbsp;FORTIFY_SOURCE=3D2 except in release mode<br>
          <br>
          -Upstream-Status: Innapropriate [due to fluent-bit having it's
          own Release flags that also overwrite bitbake ones.]<br>
          +Upstream-Status: Inappropriate [due to fluent-bit having it's
          own Release flags that also overwrite bitbake ones.]<br>
          &nbsp;---<br>
          &nbsp; lib/mbedtls-2.28.0/CMakeLists.txt | 2 --<br>
          &nbsp; 1 file changed, 2 deletions(-)<br>
          diff --git
a/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
b/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch<br>
          index e63b05356..202f12612 100644<br>
          ---
a/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch<br>
          +++
b/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch<br>
          @@ -5,7 +5,7 @@ Subject: [PATCH] rust.configure: do not try to
          find a suitable upstream target<br>
          <br>
          &nbsp;OE is using custom targets and so this is bound to fail.<=
br>
          <br>
          -Upstream-Status: Inapppropriate [oe-core specific]<br>
          +Upstream-Status: Inappropriate [oe-core specific]<br>
          &nbsp;Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:al=
ex@linutronix.de" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">alex@linutronix.de</a>&gt;<br>
          <br>
          &nbsp;---<br>
          diff --git
          a/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.2=
0.patch
b/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch<br=
>
          index afe11f353..d232f6913 100644<br>
          ---
          a/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.2=
0.patch<br>
          +++
          b/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.2=
0.patch<br>
          @@ -3,9 +3,7 @@ From: dgod &lt;<a href=3D"mailto:dgod.osa@gmail=
.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-fr=
eetext">dgod.osa@gmail.com</a>&gt;<br>
          &nbsp;Date: Mon, 21 Mar 2016 19:25:25 +0800<br>
          &nbsp;Subject: [PATCH] fix css under gtk 3.20<br>
          <br>
          -Upstream-Status: Applied [1]<br>
          -<br>
          -[1] <a href=3D"https://urldefense.com/v3/__https://git.lxde.or=
g/gitweb/?p=3Dlxde*lxdm.git;a=3Dpatch;h=3D72812894cfd9454d70e4b0753531e46=
580416771*Upstream-Status__;Lys!!AjveYdw8EvQ!cE3DkaINahusvd5dYlzd1p1Eq6K2=
nj9yGi9yrZcwLs_M27CT8hzjQxRd_Obfmv_NnC4bjwMSl9MFjvEoA53L-bK1X_s$" rel=3D"=
noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://git.lxde.o=
rg/gitweb/?p=3Dlxde/lxdm.git;a=3Dpatch;h=3D72812894cfd9454d70e4b0753531e4=
6580416771<br>
            +Upstream-Status</a>: Backport [<a href=3D"https://urldefense=
.com/v3/__https://git.lxde.org/gitweb/?p=3Dlxde*lxdm.git;a=3Dpatch;h=3D72=
812894cfd9454d70e4b0753531e46580416771__;Lw!!AjveYdw8EvQ!cE3DkaINahusvd5d=
Ylzd1p1Eq6K2nj9yGi9yrZcwLs_M27CT8hzjQxRd_Obfmv_NnC4bjwMSl9MFjvEoA53LobvSx=
MI$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https:=
//git.lxde.org/gitweb/?p=3Dlxde/lxdm.git;a=3Dpatch;h=3D72812894cfd9454d70=
e4b0753531e46580416771</a>]<br>
          &nbsp;---<br>
          &nbsp; data/themes/Industrial/gtk.css | 1 +<br>
          &nbsp; 1 file changed, 1 insertion(+)<br>
          diff --git
          a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52=
.diff
b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff<br>
          index 057b1fd1d..60953381a 100644<br>
          ---
          a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52=
.diff<br>
          +++
          b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52=
.diff<br>
          @@ -6,7 +6,7 @@ Filtered with:<br>
          &nbsp; &nbsp;filterdiff -p1 -x README -x 'debian/*'<br>
          <br>
          <br>
          -Upstream-Status: unmaintained<br>
          +Upstream-Status: Inappropriate [unmaintained]<br>
          <br>
          &nbsp;Index: hddtemp-0.3-beta15/doc/hddtemp.8<br>
&nbsp;=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
          diff --git
a/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tests=
.patch
b/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tests=
.patch<br>
          index ea3ddfb64..b3ee24d9d 100644<br>
          ---
a/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tests=
.patch<br>
          +++
b/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tests=
.patch<br>
          @@ -3,7 +3,7 @@ From: Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-lin=
k-freetext">raj.khem@gmail.com</a>&gt;<br>
          &nbsp;Date: Sat, 27 Mar 2021 21:41:04 -0700<br>
          &nbsp;Subject: [PATCH] example: Do not run the tests<br>
          <br>
          -Upstream-Status: Inappropritate [Cross-compile specific]<br>
          +Upstream-Status: Inappropriate [Cross-compile specific]<br>
          &nbsp;Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">raj.khem@gmail.com</a>&gt;<br>
          &nbsp;---<br>
          &nbsp; examples/Makefile | 3 ---<br>
          diff --git
a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-c=
hecks-on-libxml2-also-wh.patch
b/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-c=
hecks-on-libxml2-also-wh.patch<br>
          index 7faeb130a..490b61f1f 100644<br>
          ---
a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-c=
hecks-on-libxml2-also-wh.patch<br>
          +++
b/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-c=
hecks-on-libxml2-also-wh.patch<br>
          @@ -7,9 +7,7 @@ MIME-Version: 1.0<br>
          &nbsp;Content-Type: text/plain; charset=3DUTF-8<br>
          &nbsp;Content-Transfer-Encoding: 8bit<br>
          <br>
          -Upstream-Status: Applied [1]<br>
          -<br>
          -[1] <a href=3D"https://urldefense.com/v3/__https://github.com/=
dajobe/raptor/pull/33__;!!AjveYdw8EvQ!cE3DkaINahusvd5dYlzd1p1Eq6K2nj9yGi9=
yrZcwLs_M27CT8hzjQxRd_Obfmv_NnC4bjwMSl9MFjvEoA53LRw0LEs4$" rel=3D"norefer=
rer" target=3D"_blank" moz-do-not-send=3D"true">https://github.com/dajobe=
/raptor/pull/33</a><br>
          +Upstream-Status: Backport [<a href=3D"https://urldefense.com/v=
3/__https://github.com/dajobe/raptor/commit/e75b1dbb7f2a6514b8d391b200c45=
a2bec6268bf__;!!AjveYdw8EvQ!cE3DkaINahusvd5dYlzd1p1Eq6K2nj9yGi9yrZcwLs_M2=
7CT8hzjQxRd_Obfmv_NnC4bjwMSl9MFjvEoA53LXXzgDhk$" rel=3D"noreferrer" targe=
t=3D"_blank" moz-do-not-send=3D"true">https://github.com/dajobe/raptor/co=
mmit/e75b1dbb7f2a6514b8d391b200c45a2bec6268bf</a>]<br>
          <br>
          &nbsp;Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:=
schnitzeltony@googlemail.com" target=3D"_blank" moz-do-not-send=3D"true" =
class=3D"moz-txt-link-freetext">schnitzeltony@googlemail.com</a>&gt;<br>
          &nbsp;---<br>
          diff --git
          a/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.=
patch
b/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch<br>
          index 99dc4e304..47eb9cfd6 100644<br>
          ---
          a/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.=
patch<br>
          +++
          b/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.=
patch<br>
          @@ -36,7 +36,7 @@ This was reported in<br>
          &nbsp;&lt;<a href=3D"https://urldefense.com/v3/__http://lists.g=
nu.org/archive/html/bug-gnu-utils/2018-02/msg00004.html__;!!AjveYdw8EvQ!c=
E3DkaINahusvd5dYlzd1p1Eq6K2nj9yGi9yrZcwLs_M27CT8hzjQxRd_Obfmv_NnC4bjwMSl9=
MFjvEoA53LAXmj02c$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D=
"true">http://lists.gnu.org/archive/html/bug-gnu-utils/2018-02/msg00004.h=
tml</a>&gt;.<br>
          <br>
          &nbsp;CVE: CVE-2018-1000097<br>
          -Upstream-Status: no upstream [<a href=3D"https://urldefense.co=
m/v3/__http://lists.gnu.org/archive/html/bug-gnu-utils/2018-02/msg00004.h=
tml__;!!AjveYdw8EvQ!cE3DkaINahusvd5dYlzd1p1Eq6K2nj9yGi9yrZcwLs_M27CT8hzjQ=
xRd_Obfmv_NnC4bjwMSl9MFjvEoA53LAXmj02c$" rel=3D"noreferrer" target=3D"_bl=
ank" moz-do-not-send=3D"true">http://lists.gnu.org/archive/html/bug-gnu-u=
tils/2018-02/msg00004.html</a>]<br>
          +Upstream-Status: Inappropriate [no upstream]<br>
          &nbsp;Signed-off-by: Petr P=C3=ADsa=C5=99 &lt;<a href=3D"mailto=
:ppisar@redhat.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"m=
oz-txt-link-freetext">ppisar@redhat.com</a>&gt;<br>
          &nbsp;Signed-off-by: Sinan Kaya &lt;<a href=3D"mailto:okaya@ker=
nel.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link=
-freetext">okaya@kernel.org</a>&gt;<br>
          &nbsp;---<br>
          -- <br>
          2.25.1<br>
          <br>
          <br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          Links: You receive all messages sent to this group.<br>
          View/Reply Online (#101224): <a href=3D"https://urldefense.com/=
v3/__https://lists.openembedded.org/g/openembedded-devel/message/101224__=
;!!AjveYdw8EvQ!cE3DkaINahusvd5dYlzd1p1Eq6K2nj9yGi9yrZcwLs_M27CT8hzjQxRd_O=
bfmv_NnC4bjwMSl9MFjvEoA53LyGenRZ0$" rel=3D"noreferrer" target=3D"_blank" =
moz-do-not-send=3D"true">https://lists.openembedded.org/g/openembedded-de=
vel/message/101224</a><br>
          Mute This Topic: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/mt/97181611/3617156__;!!AjveYdw8EvQ!cE3DkaINahusv=
d5dYlzd1p1Eq6K2nj9yGi9yrZcwLs_M27CT8hzjQxRd_Obfmv_NnC4bjwMSl9MFjvEoA53L61=
IxVcM$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">htt=
ps://lists.openembedded.org/mt/97181611/3617156</a><br>
          Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists=
.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">openembedde=
d-devel+owner@lists.openembedded.org</a><br>
          Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://lis=
ts.openembedded.org/g/openembedded-devel/unsub__;!!AjveYdw8EvQ!cE3DkaINah=
usvd5dYlzd1p1Eq6K2nj9yGi9yrZcwLs_M27CT8hzjQxRd_Obfmv_NnC4bjwMSl9MFjvEoA53=
L7_4KSck$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">=
https://lists.openembedded.org/g/openembedded-devel/unsub</a>
          [<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_blank" mo=
z-do-not-send=3D"true" class=3D"moz-txt-link-freetext">Martin.Jansa@gmail=
.com</a>]<br>
          -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
          <br>
        </blockquote>
      </div>
    </blockquote>
  </body>
</html>

--------------OYHiM98MKaMgvbz4zstMDo6L--

