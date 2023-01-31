Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D20BC38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 23:15:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9593.1675206920969512035
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Jan 2023 15:15:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=F484F6wO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1395f88de3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30VN8tQZ008196
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 15:15:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : cc : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=btSOW8JwnyDslnsSdSpok1SN4u52MrjjcoqT87Kgtms=;
 b=F484F6wOuPQFN2Th2hNl77qSka4q5dbxEIGy0/J234XxrThITI9MO+Ab3oxstR9J80Tq
 ns+A+1Ozig/10x1D+WDGP54GHG0uD7XCAACEOfgTEpUbF7q95EhUhVEwK1nXFVQPl54S
 PC2KwkY+FJb8KOQIxKVmjJVQyvDKjNaSANl0FJjrFvphKnx5MzczorS4QgqV6CljN7fP
 o1tzXA3tm4EJVL0ut7c3MlNDwwzd7MKSYZqmkqIc7zXGusGyvoBXyuuI0gHkffjOzG1f
 3bEvZivSMdZ8fHLWgsYAea9W0KDbIo+3E4eIHik6WexlHlHfOVpMcrU44V54g3Ol27do 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ncyv8bj12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 15:15:20 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30VNFKst023090
	for <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 15:15:20 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ncyv8bj10-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Jan 2023 15:15:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YM+RoSbaLyTWqv+tgCB58/16/92mVCaqym9YVkBDpcQJO00CmR91AJINELPc8YLz6D7n7J0f47hOP6rhezSRgj0ZdpMzyRyxPjZCC6EVZE2tNssHJtJMpnUlm/hv87+MGtSNXnY3AlzRfk2VZNC82U44dzYsB97pQ6YXBP0ZJenxMDhVL+Cle2w2LTIeCEzYpF6STpaa8z+pq1gGOnaoifoDqpmly8tKQzuVDLVLFTe+5siHrjOk+iYKsQZCLWeCBr2HeALq6Dcuq2Y5PpTpI4sY25MTjeCZ14zsMcfxQuzp6sfSfkAMHuNYQTyvqACJJHyt+G1C5X0mPVCB4oTtDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btSOW8JwnyDslnsSdSpok1SN4u52MrjjcoqT87Kgtms=;
 b=G1UT2x2IbFvyiFctIdXc8BaDFivdSVopTr0kWisQe6lr17SG1t/evGFsQ128ouFFPZEM3vsrIUcMhSSaPTN3rXVhA4F0ehdbdIeMuVIuQ62K30s200QbDRdslscURe3enLuKfiCcHOu9HutYQ5BMVreBPxnoewC/3rdY4uesMF7dgxfbAqK35xhJl5jP8/3IAzPVJ1CN10F7f6tocJriILg8PAq+mZ2v38U8YpzmaEKur1eEQajdHnPmNzIw2vlhY+Ug12qY1/HnoJBaomNZNtO7WaB9NHC0lZsSnQ8tySpZCZLn1sNM3OpKREoeBHvwzgLrhxG1XlTO0hjJBntZ+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by CH3PR11MB8095.namprd11.prod.outlook.com (2603:10b6:610:154::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Tue, 31 Jan
 2023 23:15:16 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::119d:6114:994a:b87d%5]) with mapi id 15.20.6064.022; Tue, 31 Jan 2023
 23:15:16 +0000
Content-Type: multipart/alternative;
 boundary="------------VBDcN3QjjStS0lLldxd3KD1Z"
Message-ID: <7658d74e-4aee-5fa5-8de9-0f16dae2c261@windriver.com>
Date: Tue, 31 Jan 2023 18:15:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [meta-python][kirkstone][PATCH 4/6] python3-pillow: upgrade
 9.3.0 -> 9.4.0
Content-Language: en-CA
To: openembedded-devel@lists.openembedded.org,
        Armin Kuster <akuster808@gmail.com>
References: <20230131230851.2785067-1-Randy.MacLeod@windriver.com>
 <173F8777BB97215C.30239@lists.openembedded.org>
Cc: "Orling, Timothy T" <timothy.t.orling@intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <173F8777BB97215C.30239@lists.openembedded.org>
X-ClientProxiedBy: BYAPR11CA0095.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::36) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|CH3PR11MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: d85161a0-0b87-4d3c-b476-08db03e1034c
X-LD-Processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 uFW3klPPlFijefwsSbMwpMRJ2M63UlkNjtCSPs9Qhh1FZqMtEuQFZME+KrygZ4UYmLXE0PeYiDCB7Pp56YUh51VUgwMCEnzs/NeTKkHv4XctSSMRRYoPuFkGC5XODjjr4V75+cE5QrHzXRDmsbSG4xvzGWcnx/hFG6OmfJjbAcR0jz71PuIqwnm9kRpkzS0YJuI6ZWD2mmmZE2gK6NFON2LW2gWx6R955FWcgEJQ6qhYh+jx9Xh6vQaF2QxRs0tbHuH/ODyHBncTDtzYtCgl5Wcz1QjVnoghO/z9A2siQl+NWg32hpq5EiAPJgvJ3gcQA+XlTOH6iJO7A4aMv5yQPb5dJ/74MsomXDrS4iy1xJhDaFW9iaAIzi/uBZalHxihW3UcPHWvltvFV0BqY5rb05K840EEdQ5hLwdYA0bFLrHbXLQ3BrVH8PTVONEo47qyGRED8O+lEoY2PfvENJadu1TA5yFMfm6yYywoh3CBhViX94xl8jUsC6pzkhxRfF+VrMN9qVQXyiXQUwrE7S3Pj1mNazsQUpMh3f2nK4imp7eXtzVrnG5xe5MhMp4f90DXd1KyrIpdyrgSqASLb/h1C4fd3Jb+T4AIDuI7fICNHB0xpnXaAzKSyBDatnfXX2bhOcLktr94vt8vZ/VuO2V7gZwT8jcy5EfjvZbgCfjlcRfEDQGof9S8tCF5RidSeCrshVg8mEZW3s7XhuWFSFRpq9K8DFDx1bYlq6N8xGA9UxvcUQEu9WJNnGZ9sxDgc5TvlpHRlmA7pONA4UwYKtqC6PVUUr9auIy7ZbWeoQ1I7ZzoApVWE8IVT7nKeVhpAN7g
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(366004)(396003)(39850400004)(346002)(136003)(451199018)(83380400001)(166002)(86362001)(31696002)(38100700002)(36756003)(2906002)(66899018)(8936002)(5660300002)(31686004)(41300700001)(316002)(2616005)(6916009)(33964004)(8676002)(66946007)(4326008)(6486002)(966005)(66476007)(6666004)(66556008)(478600001)(53546011)(26005)(186003)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?WHRPOHBMN3FxL01Cc1lOUGlxWWh0Rks1ZGp3OG5RVUorYkNBRndWTGMrQm1R?=
 =?utf-8?B?OTVTRXZGS2pyRnRNNnNEVWU2bjQyL1YyYzFFOUdwS1hBUStBSncyTUNyVzc2?=
 =?utf-8?B?WVVSQ2Q0R2ZRQlVZNHliSG1KakUwSzgyYjdPSlBQTG9raTVVZ1NGd3pyckE0?=
 =?utf-8?B?NFMyMnRFbHBvZnFqTEdSR2ljS2lSSjMwVlg4TldpTHhHTlkyZFFhZVF6UVVC?=
 =?utf-8?B?Q2VxTUZNVm9KUU84UjA3NWIyOWNpMGJlMmlja1hsL0pFY1lqR1ZSTXY1NGJQ?=
 =?utf-8?B?Y1dqdXZHZ0RpQnU2L1NLOEF2a2NIY3ZUdk1KVWEwRmt5UERPV1EvSjBITXc0?=
 =?utf-8?B?T1BLMjJDZjFoN0t3ajh6SjZuZ3RscmEyZUkwQTVNeC92VTRqcnlnOG1uTHhK?=
 =?utf-8?B?VHpIODgrcnQrSWtsYVJtc0c0NmpSWHlmQmFKeUtUMUwyYnZrWEswOFJPQ3dJ?=
 =?utf-8?B?dnVUTFlYVkhZZUdHTUR2MmlIbDI4ditCQUs3K1M4Y2FLMFIxNFVMRHdPbTYz?=
 =?utf-8?B?SjVvSmRpUGV1ZHBQdkd3ODFsWEJ2VmdjMmEzLzRabHA4MklhY3VTMzhnR0o2?=
 =?utf-8?B?cTUrOEJQSEVrL2lMVzhPcDZSRVpNOGh3WUVIbERqSXdKcXFiemtUdFM4MzBU?=
 =?utf-8?B?SCt5Rnp4T0RSckpQaHRaSjFhUHFNN1dkZk5HUjVwbnB4VmY3cXJZTUNxcVR6?=
 =?utf-8?B?bzNXb0tMTFVIaGlEZndTeUIzVzZxWDFTN280UGNBT2NLdWtIam1hUWw3ZWlz?=
 =?utf-8?B?MVJHUTcyWXBUSjFCYVlBMVB5dHp1L3RlL2VaOTJ6Vjh6Nmh5SkwrVm1lRTRG?=
 =?utf-8?B?NlBLNkszMWpaWUlKSXp1T0ZBL1k3ci94WWV2RHRnVzAyenlaUVRRVE1UOE9L?=
 =?utf-8?B?ZTh4TndRS0QyY0NobGFac1pqaHlMVGU0WXJBNmI0VmtyRHRQMFo4TUNUUCtt?=
 =?utf-8?B?UHdxVzdtM1Y3ajhaRm5ZbGVabGtQTWNjaFlDTlY1Z2Y0TnZzVEtPOXFlYUNm?=
 =?utf-8?B?U2NicmdUNzNkaStkYXRGOHpuaTd2eGNCb2ZZeENmK054U1RUeWVQK1NtS29G?=
 =?utf-8?B?cmgwWml1emlpKzZhWGRuOGdXZ0YrOXVhSk5yRFZmZEtrQnVpYTN6Tm9qZXZJ?=
 =?utf-8?B?R3VsL2c1Njc3TnlNS0I3SGNFUmNabWZ4cUc4K1hiWUxnYmxZSmZvNHd6T3hv?=
 =?utf-8?B?VFI0bFducnZDbFR4STdETEhpNlRrY1o0L0g2ejN5TVFFWU8vVmpUeGJOczBB?=
 =?utf-8?B?Y1FVekIwNHJ1OEtLVG53eXRlSllPQmdCRGtrT1RINElvTk5Sc0t4cFAyWEVL?=
 =?utf-8?B?NjhVWkM3TXpHNzV6NUhkK3pDdkp0S1A1Yis4VjVHUHNqTThGOGhoMXFSeEJl?=
 =?utf-8?B?cEhndVp5RFZsKzA2aXM3N0FiTXdSSk0rMy9pYTBJRjdmZG00RElzeWFzTVRB?=
 =?utf-8?B?QkNvdFB3SUxYQlR0UU9pNXlxMXZETTlib002aXcydjNKdWJTQmQyMHRzSjZy?=
 =?utf-8?B?MFFOM21zd1hBS2lsMHhDVy9mS1lYQzRqMCtiWGJ6M0NNZzNkVWFaWHI3T2hm?=
 =?utf-8?B?d21oMlkvRGgvbUhHczNyUDBMWkhmcFhyK3hmL2c2d1k1Q0xBWTVPdEFXeTJM?=
 =?utf-8?B?MGp0b0VkR1p2QTFqMFppbFlrelRHb05hYUJvNnlmWVVTeE96TC84MWpMbWhC?=
 =?utf-8?B?akxOcW9oZUtzQ0NLWDBEdmlqQVhlTTJzUmROMXd5NXhHMk5lVkVnV2pzc1ph?=
 =?utf-8?B?NXpRMEZKK0wzb01UMUkxN2Q4RS95dUQrMEtvRHpzb2FzcjR3OHg3dnIrVHYr?=
 =?utf-8?B?L0hXMFk2Q0xGOWc1ejd0NFJucFVuV2hhT2ZFYTdKTi9aQUJuUFNTTmhCNTBu?=
 =?utf-8?B?TmFmOTF3QUMrYUpwM256SXVnc3dKaWUyZ0srTk5ZUnFRelg5cjdYSFdDWUty?=
 =?utf-8?B?UjRNblQwWG45eUh4ZFRuUnU1SGxFNERCUTJHK1h0M2gvTXpMVnpzVkg4Rk96?=
 =?utf-8?B?ZTVKeUU5cTUzZHBHQWpPTEJ5YlBPaDZ2bHlseGh6VS91R0xpaE5JeC9qYzQz?=
 =?utf-8?B?dzYyTHRvL1NLZlNwTTNmeFVxMWNSSlhIS1JxWHdCZzJnQkVjNzk5aG5XS0p5?=
 =?utf-8?B?dDRzN3doL0JOeEF2OGN6MWtGSkdOcythRDFybXpjL3BsbjF4OUhyTmVNVzJE?=
 =?utf-8?B?ZUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d85161a0-0b87-4d3c-b476-08db03e1034c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 23:15:16.2346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vophPaE41ouhdJaeF04iGRv1/rFj14C846Aeqr69gOhVCphCK20eJhmcb3MnibZIyrbFABXQBKReisoxfm2NrSDRt8fUK694mDpFKEWBcBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8095
X-Proofpoint-GUID: wh3AeMZ-usQr-PpF3tyEUVI9sE3hlHAX
X-Proofpoint-ORIG-GUID: lyupJlwxjtbUvxY6aSCrd3ALqoQlsWkO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-31_08,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301310200
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 Jan 2023 23:15:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100896

--------------VBDcN3QjjStS0lLldxd3KD1Z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I'd normally be a bit nervous about backporting 9.0.1 to 9.4.0 but
the upstream pillow dev(s) seem to be careful to adhere to semantic
versioning:

https://pillow.readthedocs.io/en/stable/releasenotes/versioning.html#versioning

and the ptest pass rate is the same as master once I added the distutils 
and unixadmin
python modules added to the ptest dependencies.

If this gets merged, I'll update langdale to 9.4.0 as well.

../Randy


On 2023-01-31 18:08, Randy MacLeod via lists.openembedded.org wrote:
> From: Wang Mingyu<wangmy@fujitsu.com>
>
> License-Updated: copyright year updated to 2023
>
> Changelog:
> ==========
>   Fixed null pointer dereference crash with malformed font #6846
>   Return from ImagingFill early if image has a zero dimension #6842
>   Reversed deprecations for Image constants, except for duplicate Resampling attributes #6830
>   Improve exception traceback readability #6836
>   Do not attempt to read IFD1 if absent #6840
>   Fixed writing int as ASCII tag #6800
>   If available, use wl-paste or xclip for grabclipboard() on Linux #6783
>   Added signed option when saving JPEG2000 images #6709
>   Patch OpenJPEG to include ARM64 fix #6718
>   Added support for I;16 modes in putdata() #6825
>   Added conversion from RGBa to RGB #6708
>   Added DDS support for uncompressed L and LA images #6820
>   Added LightSource tag values to ExifTags #6749
>   Fixed PyAccess after changing ICO size #6821
>   Do not use EXIF from info when saving PNG images #6819
>   Fixed saving EXIF data to MPO #6817
>   Added Exif hide_offsets() #6762
>   Only compare to previous frame when checking for duplicate GIF frames while saving #6787
>   Always initialize all plugins in registered_extensions() #6811
>   Ignore non-opaque WebP background when saving as GIF #6792
>   Only set tile in ImageFile __setstate__ #6793
>   When reading BLP, do not trust JPEG decoder to determine image is CMYK #6767
>   Added IFD enum to ExifTags #6748
>   Fixed bug combining GIF frame durations #6779
>   Support saving JPEG comments #6774
>   Added getxmp() to WebPImagePlugin #6758
>   Added "exact" option when saving WebP #6747
>   Use fractional coordinates when drawing text #6722
>   Fixed writing int as BYTE tag #6740
>   Added MP Format Version when saving MPO #6735
>   Added Interop to ExifTags #6724
>   CVE-2007-4559 patch when building on Windows #6704
>   Fix compiler warning: accessing 64 bytes in a region of size 48 #6714
>   Use verbose flag for pip install #6713
>
> Signed-off-by: Wang Mingyu<wangmy@fujitsu.com>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   .../{python3-pillow_9.3.0.bb => python3-pillow_9.4.0.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pillow_9.3.0.bb => python3-pillow_9.4.0.bb} (87%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
> similarity index 87%
> rename from meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
> index 11f545160..403a987d1 100644
> --- a/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
> @@ -3,7 +3,7 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
>   Contributors."
>   HOMEPAGE ="https://pillow.readthedocs.io"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM ="file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849"
> +LIC_FILES_CHKSUM ="file://LICENSE;md5=bc416d18f294943285560364be7cbec1"
>   
>   SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
>              file://0001-support-cross-compiling.patch  \
> @@ -39,4 +39,4 @@ RPROVIDES:${PN} += "python3-imaging"
>   
>   BBCLASSEXTEND = "native"
>   
> -SRCREV = "d594f4cb8dc47fb0c69ae58d9fff86faae4515bd"
> +SRCREV = "a5bbab1c1e63b439de191ef2040173713b26d2da"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100891):https://lists.openembedded.org/g/openembedded-devel/message/100891
> Mute This Topic:https://lists.openembedded.org/mt/96664646/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------VBDcN3QjjStS0lLldxd3KD1Z
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>I'd normally be a bit nervous about backporting 9.0.1 to 9.4.0
      but<br>
      the upstream pillow dev(s) seem to be careful to adhere to
      semantic<br>
      versioning:<br>
    </p>
    <p>&nbsp;&nbsp;
<a class="moz-txt-link-freetext" href="https://pillow.readthedocs.io/en/stable/releasenotes/versioning.html#versioning">https://pillow.readthedocs.io/en/stable/releasenotes/versioning.html#versioning</a><br>
    </p>
    <p>and the ptest pass rate is the same as master once I added the
      distutils and unixadmin <br>
      python modules added to the ptest dependencies.</p>
    <p>If this gets merged, I'll update langdale to 9.4.0 as well.</p>
    <p>../Randy</p>
    <p>&nbsp;&nbsp;&nbsp; <br>
    </p>
    <div class="moz-cite-prefix">On 2023-01-31 18:08, Randy MacLeod via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:173F8777BB97215C.30239@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>

License-Updated: copyright year updated to 2023

Changelog:
==========
 Fixed null pointer dereference crash with malformed font #6846
 Return from ImagingFill early if image has a zero dimension #6842
 Reversed deprecations for Image constants, except for duplicate Resampling attributes #6830
 Improve exception traceback readability #6836
 Do not attempt to read IFD1 if absent #6840
 Fixed writing int as ASCII tag #6800
 If available, use wl-paste or xclip for grabclipboard() on Linux #6783
 Added signed option when saving JPEG2000 images #6709
 Patch OpenJPEG to include ARM64 fix #6718
 Added support for I;16 modes in putdata() #6825
 Added conversion from RGBa to RGB #6708
 Added DDS support for uncompressed L and LA images #6820
 Added LightSource tag values to ExifTags #6749
 Fixed PyAccess after changing ICO size #6821
 Do not use EXIF from info when saving PNG images #6819
 Fixed saving EXIF data to MPO #6817
 Added Exif hide_offsets() #6762
 Only compare to previous frame when checking for duplicate GIF frames while saving #6787
 Always initialize all plugins in registered_extensions() #6811
 Ignore non-opaque WebP background when saving as GIF #6792
 Only set tile in ImageFile __setstate__ #6793
 When reading BLP, do not trust JPEG decoder to determine image is CMYK #6767
 Added IFD enum to ExifTags #6748
 Fixed bug combining GIF frame durations #6779
 Support saving JPEG comments #6774
 Added getxmp() to WebPImagePlugin #6758
 Added &quot;exact&quot; option when saving WebP #6747
 Use fractional coordinates when drawing text #6722
 Fixed writing int as BYTE tag #6740
 Added MP Format Version when saving MPO #6735
 Added Interop to ExifTags #6724
 CVE-2007-4559 patch when building on Windows #6704
 Fix compiler warning: accessing 64 bytes in a region of size 48 #6714
 Use verbose flag for pip install #6713

Signed-off-by: Wang Mingyu <a class="moz-txt-link-rfc2396E" href="mailto:wangmy@fujitsu.com">&lt;wangmy@fujitsu.com&gt;</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
 .../{python3-pillow_9.3.0.bb =&gt; python3-pillow_9.4.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_9.3.0.bb =&gt; python3-pillow_9.4.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
index 11f545160..403a987d1 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_9.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_9.4.0.bb
@@ -3,7 +3,7 @@ Clark and Contributors. PIL is the Python Imaging Library by Fredrik Lundh and \
 Contributors.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pillow.readthedocs.io">&quot;https://pillow.readthedocs.io&quot;</a>
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849">&quot;file://LICENSE;md5=ad081a0aede51e89f8da13333a8fb849&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=bc416d18f294943285560364be7cbec1">&quot;file://LICENSE;md5=bc416d18f294943285560364be7cbec1&quot;</a>
 
 SRC_URI = &quot;git://github.com/python-pillow/Pillow.git;branch=main;protocol=https \
            <a class="moz-txt-link-freetext" href="file://0001-support-cross-compiling.patch">file://0001-support-cross-compiling.patch</a> \
@@ -39,4 +39,4 @@ RPROVIDES:${PN} += &quot;python3-imaging&quot;
 
 BBCLASSEXTEND = &quot;native&quot;
 
-SRCREV = &quot;d594f4cb8dc47fb0c69ae58d9fff86faae4515bd&quot;
+SRCREV = &quot;a5bbab1c1e63b439de191ef2040173713b26d2da&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#100891): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/100891">https://lists.openembedded.org/g/openembedded-devel/message/100891</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/96664646/3616765">https://lists.openembedded.org/mt/96664646/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------VBDcN3QjjStS0lLldxd3KD1Z--

