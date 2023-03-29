Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2E2C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 13:36:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.24711.1680096982990693034
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Mar 2023 06:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=pgDBMTTI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34527b66b3=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32TBbO9v018593
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 06:36:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=C5wIqXb5QS5Ehsjch/zZ1UiUtO7U/DzpMU3KR0Nj61w=;
 b=pgDBMTTI3llcDn6MtX4gBQb1zCAR0cwI65muHa3bIAA1azDAhSM/2pdbzttEs9sbvy8x
 EPKgqlqzmTaCI12tLFHF9g9A3Uthvv/yTV6VbcSg2dH2Vz0gP5imuszs/F9ej2hNacwz
 Kjm8hTyORLTLgCnmzLNVUrSzKD3dK7mhStoMvB4HFr+E9YFZ9R9+0BJmfjnzERW84IlM
 qb8CgHZEqXiSlJQ+qF92s0wOPw0+7kib/Im5qUyYR19nbkQ87mw6bIvblZEER1dbU9j0
 ZM/i8nPqJ7kvxcI2uI0ebLI7++GuuNj22j+Ww4Ndcz/bjXKRjUI9N/4cPhsxcwTInO1+ 2w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pj0fn4ghv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 06:36:22 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32TDaMi9030548
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 06:36:22 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pj0fn4ght-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 06:36:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lk4AKmIMr/yKNPHJUh7K2NHGCRY9JCp9Q0jWbAxXRvu3CUtkn8Waa3JyUK+lC22DfwjB0qjlhQb0ttUYBH/S9h1JQaIkQGN+PElQFq8S8Vlc5Z9+V0kynYkbXthZoobIWiP2VGMI2hmuG+qqu037uHk3TIhHuD/st7w9yKEI4PI+GkVwrW5chR9aCN0OT8WTzQFV7EMc8IFx2euLMSRwBcw+8LlmC7fJ/MQ7O31hlxuP+GVyqIh9AAmicXver0WiYwjuK8Yh0TDIimRqyZARa4XlkYQIt23s7pbvC62V78HRGo1nG+2biVW+rq9Aw0F4m64f7k/PmRWLh4je4VnLWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5wIqXb5QS5Ehsjch/zZ1UiUtO7U/DzpMU3KR0Nj61w=;
 b=ZdlJ7cgIOEzY4hcyIxqVJ7BcxUJsZHQyyBqK9JJz3uPzycP3WToxrvIzfulLTTCvyvjKMYD65DAeIkOHgQ1wQCHRMnO0D2Dmdbc2Qd+05dNapESzh1MdReHu00S4RXW2tcSpxXEYQsPRzgT9kfVsZqyNr97E49z8xPMO6FfRFSFNqa7XoTM/scvdxFq3S9WVC2yREC88pDWazonjgtIdPq+TeqXBNPBtMVd068p2BsZOvu/wjgosJVUY06jX+L6HRlisSox1kPjSU/0+SreLTUz6sCJhUMRjvapzq/swuWgq96N0LZl8CYZYbc9yQXP9vkh/DvwvWqcvpBVulkxEAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by MN0PR11MB6302.namprd11.prod.outlook.com (2603:10b6:208:3c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 13:36:17 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::ceb7:f166:2f0f:4f67%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 13:36:16 +0000
Content-Type: multipart/alternative;
 boundary="------------qzQSeZl2so1JCROwBIlpB14P"
Message-ID: <f6a4a396-84a6-9787-ad8a-d4e283a6442d@windriver.com>
Date: Wed, 29 Mar 2023 09:36:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [meta-oe][PATCH] librelp: fix function inline errors in debug
 build
Content-Language: en-CA
To: Yash Shinde <yashinde145@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: Umesh.Kallapa@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Yash.Shinde@windriver.com
References: <20230329075827.437650-1-yashinde145@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230329075827.437650-1-yashinde145@gmail.com>
X-ClientProxiedBy: SJ0PR13CA0174.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::29) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|MN0PR11MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: 708b7692-29cc-4112-eeb5-08db305a9257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ccRZ5wQB4rbIsncVkx71z07JdEgrK3ZQiQGBxxjz36mDtVx56QNbmAwFR40FZD2iKgtCztjbz6xCVU8l4TtFSj/aLLhu1YUEbml7AgWKVp0JWzgAQOIxyuDD2YZjP48fM0zqy+ww5RMiSdVaA2rT1oVbKyFpZ4hc6uorTNQx3ZFb9ASjlQqjD+mr8bp6mexVXImVKu/O+mjs/nHJXSlM/p4XJsKuI0SX0CBR7EnW7RhuAyvNVWWYs+cROVGFle4d7uKJp9OWCVjuxmqLRLXxHYqTklJpRUDpmBKXKn77dqlU6MJ/KofbXJtdR6+vLpIFHAt5p1EstZckM4MxfEU4LW3A6+myB2Jz2YFOUOQ3rtGaN3k4J1gAlugLHHHgflaFw4P/CAklTYGQdn1noaDja1Xi9tSN0TxYA1ZftJ38zjpvVx+ky9/wFpMK0Hcy5gBe5vLLbMH+VVKsCR9UfmWV8R5U7ZqHTgI76zVwEYdet7jHeWZVaj0PAlMXvZmRPHdj9oq2sqUGuNtRbFs5u0bAfQsLIAncBkVzpiesWTJiLr3v+y2qM2t1VAfTkekgyEdsxA2Coz5+bKv35eJMMIluCDMyqHcvGY8+kJxhB+hvj1UWpJxHI/BOhKJrS5FerBk+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(366004)(396003)(346002)(376002)(136003)(451199021)(6512007)(107886003)(66476007)(6666004)(53546011)(26005)(33964004)(166002)(38100700002)(966005)(6486002)(5660300002)(2616005)(186003)(2906002)(8936002)(36756003)(6506007)(478600001)(316002)(4326008)(31696002)(41300700001)(86362001)(8676002)(66946007)(66556008)(83380400001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SHIvYmxuVnUzZkxoN2lIMEx3SHBKME0wWEEreGxHN0E3NzF0aTkvZXVEVVVU?=
 =?utf-8?B?QlUzTjhPWCtvZXhnSytyTnVOYVFQTEtKNFg3ZllHSHlIb3FZTGlMd2p6UWJH?=
 =?utf-8?B?cFpLZk9PME1jN3ZLZldUOUlWRllNRWZhMXQ5cDhOeVZORGR0MFp3cGNpWTUv?=
 =?utf-8?B?aEwvWEE5L2tNQlRXd3VSK2Fhc0FtcXJWcVRJSUZsSjQ4dzd1NHZQcXEzRUN2?=
 =?utf-8?B?RWdNODRTZm9RYnZRWThUWXRubU5tOWdNZUdRU1dVckJRd05XdGRsVHV1UVVP?=
 =?utf-8?B?Z3BWN3p5ajN4eldWaFlhTUtZcmZzMHVXK1Q4RU1meWUxK1pjcTFpcEVYSCtv?=
 =?utf-8?B?MEIvamVlT3Z3aGo2VDJHeWhYWmlmQWdFVEIzVWtwSld3ZFQ2d0FHNzJ4Y0pw?=
 =?utf-8?B?VTR4aldLNTBOeUFrRVB6ZTR2OCtzOGJscnhGTUo0SWF1bW51NDE0MTdGZ3R5?=
 =?utf-8?B?Y0k3OVVlK2lQcm14aDR6bXZUMjY4bHdEZU9MOG9JU1N4Z05BUEdnZ1g3NEx0?=
 =?utf-8?B?emlqSHNLTGZNVTBmWHIwQnJKNHo0eTJkbFdmcFhWVDQ0TmxqRnlUOXA0eTdu?=
 =?utf-8?B?djNJODlYcW5HM1Fvb1owR3JwcWo1Y2tNS05zLzNGOEpXWjRHc2luU0t3NjRu?=
 =?utf-8?B?MmZROGNUdEwyNmQvbWMrai9yS2hyTGpRTW5Ta1pJTFp4VTRGTlMrdWljcytK?=
 =?utf-8?B?WTFVamt4Yk9iQU9IZGxWckdIbFhsUDlEeGkweGUyVUNmVmQ1bkRheThxQlFq?=
 =?utf-8?B?SUZ3TWxCR3g0M0xmK0xyY2pvMU9Zdjh1Wk1lL0ozM2VYWXk1MUg5dXhiUWxI?=
 =?utf-8?B?TkxhU1VGWnVMYTdickRZSFJoaHh2aVl3ekNQTC9FRmQ3Z0w4V0hSWnVzL2c3?=
 =?utf-8?B?OTNsSHZXUWZaVGhFZ2pLSFNMQ2czV2lIOGZLVWpKQlRYV1F1MzZDRkovYW1U?=
 =?utf-8?B?UExCdWdGL0liWk83anU3WFoxVFMrRW1qSDJRczh5VkltdnBZWlowaTJpcmtq?=
 =?utf-8?B?VWc2bGcydE9MOXdlZEhpK3RqdGZObE53cldidWJCSUlQMEtkL3gvQTdVYXp0?=
 =?utf-8?B?d2I2UmJodEl2eGpBb2M3b3Z1d3F4dHZlQnpMWGMxS3FnY0JJdW1rRVJ4d1Ft?=
 =?utf-8?B?ZkdxWFRBWmZoZm4xUGtZMzJxMXJQd0tPVHRyVUt5SVliaXVtTkp3UTJab0VZ?=
 =?utf-8?B?bFYwamEwakpDVEl5dC9QbWpBRmtnMkI1YmFPRC85T3oxRElXMGdYTDV1RXJE?=
 =?utf-8?B?NURvZ3dOQm8xNStOZmowRFRIajdZc0lPTnhiQ0h2c2V5U1lTZ05jRllnWkti?=
 =?utf-8?B?VUZ0eTA4OW0xeHZFRWZ3TUJWM0RXa1paeDBLM2JlTTFQMS9aUzh1WmlTYzh2?=
 =?utf-8?B?V3BodkJUL3RSMEpOSG5Cbk12SjQ4blRIYkZTQjRhK2ZqSGR5ZHYwTjNMU1hp?=
 =?utf-8?B?Y3dsalJ3SkxJSkJaUDZNTU1ERENLSGFsTmdFQ3lHcUhGbUliQS9tVzB4ejZL?=
 =?utf-8?B?K2ZHU2x6Y3k3TVpPQ3NQckdicHRPQUdIbFlpcytsYnJXeDZhMUt5cUxaVTVJ?=
 =?utf-8?B?L3FXL0tLM1kxeDJ6NnpKaDQzeFp0alhyZFZOb0tDNndiTG53ejhOM21mZnJH?=
 =?utf-8?B?QUpOTnR3b1VwY3VZQWdNaGlkdGE1VGpjazZrTjdNMVZWRzhraC91blcrc3J1?=
 =?utf-8?B?YVdsNEhLcFpLeGVydmt5YVplT1NHTHhuYmVkRndQMUhMaURRdWFJWWxzbVgw?=
 =?utf-8?B?bVA3K09YTnFIampsVFA3UkdBQlVzY1hBQ2hTaFpDUWVZaXZSM1hMb2tDR1dq?=
 =?utf-8?B?ZGo0ZmJBaS85TmpJSVFqa2hTUDBTRSs3NXZvYy9zUzZxUDUxOU41WnRWY2NV?=
 =?utf-8?B?NitIVUJ5ejIza00wSHdSL1N2SXpsbnRrOFhwVjJnUGRxWC9ZVFgzR2FXQ0l6?=
 =?utf-8?B?dnN6YkZtbVFpNGRMb0pad1FPbzJmSFhENEh1VDFCanpBLzc0OEtodEJlbVRh?=
 =?utf-8?B?YjRtZ3B1Y0Vpa2JpODQzK3E0V0ZmdVFqZmdFbUpOTk1GS1hvQ2JDRUpYSVR2?=
 =?utf-8?B?MSs0UkpralRnYkV0c3N4Q1pScDFRUjVoVmhydmhOOThwOGdyUThJU3FJOEV4?=
 =?utf-8?B?YUJjQUtTZlZPNWFaVXJZWldLQlczTTkvd0V3RThldXVDczY0M0UvMDlqaklL?=
 =?utf-8?B?UEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 708b7692-29cc-4112-eeb5-08db305a9257
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 13:36:16.5723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPazEZ/EiNG3P1/3SoOluo209pmlxHXMJfviCdG+g9n48HZyFKNbXtmVTO4fl2FysGti3z1j9x3EJkpJhcW5k/77h0jmcE00+M8DotdUag8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6302
X-Proofpoint-ORIG-GUID: xAmRGf1VQpEWbX2cdsylWAnK1Bhug10B
X-Proofpoint-GUID: QZ-TE2otzbVKqZ3mcUyBQ08c3BvzXvle
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_07,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290108
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 13:36:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101820

--------------qzQSeZl2so1JCROwBIlpB14P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32TBbO9v018593

On 2023-03-29 03:58, Yash Shinde wrote:
> With DEBUG_BUILD =3D "1", the following errors occur:
>
>     src/relpsess.c:95:1: error:
>        inlining failed in call to 'relpSessFreePermittedPeers': functio=
n not considered for inlining [-Werror=3Dinline]
>
>     src/tcp.c:146:1: error:
>        inlining failed in call to 'relpTcpFreePermittedPeers': function=
 not considered for inlining [-Werror=3Dinline]
>
>     src/tcp.c:158:1: error:
>        inlining failed in call to 'callOnAuthErr': function not conside=
red for inlining [-Werror=3Dinline]
>
> Compiler does not inline any functions when not optimizing unless you s=
pecify the =E2=80=98always_inline=E2=80=99 attribute for the function. Ad=
d "__attribute__((always_inline))" to avoid these function inline errors.

Hi Yash,


First, if we're going to take this approach, you should revert my=20
work-around as part of this commit:

commit ca10312c4c7e88d67f4b487ae9afcbfdf92898d6
Author:=C2=A0=C2=A0=C2=A0=C2=A0 Randy MacLeod <Randy.MacLeod@windriver.co=
m>
Date: Wed Mar 1 19:24:27 2023

 =C2=A0=C2=A0=C2=A0 librelp: make inline errors be warnings in debug buil=
d
 =C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 ...


BUT...

The problem isn't so much that the code doesn't get in-lined when doing=20
a debug build but
that it fails to compile.=C2=A0 I think this is a compiler regressions si=
nce
I was /not/ able to reproduce the error when compiling natively using=20
Ubuntu-22.04 (gcc-11.3) but
/was/ able to reproduce it using Fedora-37, gcc --version : gcc (GCC)=20
12.2.1 20221121 (Red Hat 12.2.1-4)


Does the change you made actually build with the two compiler versions=20
above?
Is there documentation that states that

static inline void

is not as portable as:

__attribute__((always_inline)) static inline void

I suspect there is not but I'm not a compiler geek!

../Randy




>
> Upstream-Status: Tracked by upstream bug:https://github.com/rsyslog/lib=
relp/issues/256
>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   ...02-librelp-fix-function-inline-error.patch | 59 ++++++++++++++++++=
+
>   1 file changed, 59 insertions(+)
>   create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0002-libr=
elp-fix-function-inline-error.patch
>
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0002-librelp-fix-=
function-inline-error.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/00=
02-librelp-fix-function-inline-error.patch
> new file mode 100644
> index 000000000..60cf1b632
> --- /dev/null
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0002-librelp-fix-functio=
n-inline-error.patch
> @@ -0,0 +1,59 @@
> +From dc841f01fb6167ec9a80e373c5f4d2f5e3222ed6 Mon Sep 17 00:00:00 2001
> +From: Yash Shinde<Yash.Shinde@windriver.com>
> +Date: Tue, 28 Mar 2023 04:06:58 +0000
> +Subject: librelp: fix function inline errors in debug build
> +
> +With DEBUG_BUILD =3D "1", the following errors occur:
> +
> +   src/relpsess.c:95:1: error:
> +      inlining failed in call to 'relpSessFreePermittedPeers': functio=
n not considered for inlining [-Werror=3Dinline]
> +
> +   src/tcp.c:146:1: error:
> +      inlining failed in call to 'relpTcpFreePermittedPeers': function=
 not considered for inlining [-Werror=3Dinline]
> +
> +   src/tcp.c:158:1: error:
> +      inlining failed in call to 'callOnAuthErr': function not conside=
red for inlining [-Werror=3Dinline]
> +
> +Compiler does not inline any functions when not optimizing unless you =
specify the =E2=80=98always_inline=E2=80=99 attribute for the function. A=
dd "__attribute__((always_inline))" to avoid these function inline errors.
> +
> +Upstream-Status: Tracked by upstream bug:https://github.com/rsyslog/li=
brelp/issues/256
> +
> +Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> +---
> +
> +diff --git a/src/relpsess.c b/src/relpsess.c
> +index ee7b595..aa52b71 100644
> +--- a/src/relpsess.c
> ++++ b/src/relpsess.c
> +@@ -91,7 +91,7 @@ callOnErr(const relpSess_t *__restrict__ const pThis=
,
> +
> +
> + /* helper to free permittedPeer structure */
> +-static inline void
> ++__attribute__((always_inline)) static inline void
> + relpSessFreePermittedPeers(relpSess_t *const pThis)
> + {
> +        int i;
> +diff --git a/src/tcp.c b/src/tcp.c
> +index 7a75cc4..f4088c0 100644
> +--- a/src/tcp.c
> ++++ b/src/tcp.c
> +@@ -142,7 +142,7 @@ static int relpTcpChkPeerName(relpTcp_t *const pTh=
is, void* cert);
> +
> +
> + /* helper to free permittedPeer structure */
> +-static inline void
> ++__attribute__((always_inline)) static inline void
> + relpTcpFreePermittedPeers(relpTcp_t *const pThis)
> + {
> +        int i;
> +@@ -154,7 +154,7 @@ relpTcpFreePermittedPeers(relpTcp_t *const pThis)
> + }
> +
> + /* helper to call onAuthErr if set */
> +-static inline void
> ++__attribute__((always_inline)) static inline void
> + callOnAuthErr(relpTcp_t *const pThis, const char *authdata, const cha=
r *emsg, relpRetVal ecode)
> + {
> +        pThis->pEngine->dbgprint((char*)"librelp: auth error: authdata=
:'%s', ecode %d, "
> +


--=20
# Randy MacLeod
# Wind River Linux

--------------qzQSeZl2so1JCROwBIlpB14P
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 32TBbO9v018593

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2023-03-29 03:58, Yash Shinde wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20230329075827.437650-1-yashind=
e145@gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">With DEBUG_BUILD =3D &quot;1=
&quot;, the following errors occur:

   src/relpsess.c:95:1: error:
      inlining failed in call to 'relpSessFreePermittedPeers': function n=
ot considered for inlining [-Werror=3Dinline]

   src/tcp.c:146:1: error:
      inlining failed in call to 'relpTcpFreePermittedPeers': function no=
t considered for inlining [-Werror=3Dinline]

   src/tcp.c:158:1: error:
      inlining failed in call to 'callOnAuthErr': function not considered=
 for inlining [-Werror=3Dinline]

Compiler does not inline any functions when not optimizing unless you spe=
cify the =E2=80=98always_inline=E2=80=99 attribute for the function. Add =
&quot;__attribute__((always_inline))&quot; to avoid these function inline=
 errors.</pre>
    </blockquote>
    <p>Hi Yash,</p>
    <p><br>
    </p>
    <p>First, if we're going to take this approach, you should revert my
      work-around as part of this commit:<br>
    </p>
    <p>commit ca10312c4c7e88d67f4b487ae9afcbfdf92898d6<br>
      Author:&nbsp;&nbsp;&nbsp;&nbsp; Randy MacLeod <a class=3D"moz-txt-l=
ink-rfc2396E" href=3D"mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLe=
od@windriver.com&gt;</a><br>
      Date: Wed Mar 1 19:24:27 2023<br>
      <br>
      &nbsp;&nbsp;&nbsp; librelp: make inline errors be warnings in debug=
 build<br>
      &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; ...<br>
    </p>
    <p><br>
    </p>
    <p>BUT...</p>
    <p dir=3D"auto">The problem isn't so much that the code doesn't get
      in-lined when doing a debug build but<br>
      that it fails to compile.&nbsp; I think this is a compiler regressi=
ons
      since <br>
      I was <em>not</em> able to reproduce the error when compiling
      natively using Ubuntu-22.04 (gcc-11.3) but<br>
      <em>was</em> able to reproduce it using Fedora-37, gcc --version :
      gcc (GCC) 12.2.1 20221121 (Red Hat 12.2.1-4)</p>
    <p dir=3D"auto"><br>
    </p>
    <p dir=3D"auto">Does the change you made actually build with the two
      compiler versions above?<br>
      Is there documentation that states that <br>
    </p>
    <pre class=3D"moz-quote-pre" wrap=3D"">static inline void

is not as portable as:

__attribute__((always_inline)) static inline void</pre>
    <p dir=3D"auto"></p>
    <p dir=3D"auto">I suspect there is not but I'm not a compiler geek!<b=
r>
    </p>
    <p dir=3D"auto">../Randy</p>
    <p dir=3D"auto"><br>
    </p>
    <p></p>
    <p><br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20230329075827.437650-1-yashind=
e145@gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Upstream-Status: Tracked by upstream bug: <a class=3D"moz-txt-link-freete=
xt" href=3D"https://github.com/rsyslog/librelp/issues/256">https://github=
.com/rsyslog/librelp/issues/256</a>

Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 ...02-librelp-fix-function-inline-error.patch | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 meta-oe/recipes-extended/rsyslog/rsyslog/0002-librelp=
-fix-function-inline-error.patch

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/0002-librelp-fix-fu=
nction-inline-error.patch b/meta-oe/recipes-extended/rsyslog/rsyslog/0002=
-librelp-fix-function-inline-error.patch
new file mode 100644
index 000000000..60cf1b632
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/0002-librelp-fix-function-=
inline-error.patch
@@ -0,0 +1,59 @@
+From dc841f01fb6167ec9a80e373c5f4d2f5e3222ed6 Mon Sep 17 00:00:00 2001
+From: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:Yash=
.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
+Date: Tue, 28 Mar 2023 04:06:58 +0000
+Subject: librelp: fix function inline errors in debug build
+
+With DEBUG_BUILD =3D &quot;1&quot;, the following errors occur:
+
+   src/relpsess.c:95:1: error:
+      inlining failed in call to 'relpSessFreePermittedPeers': function =
not considered for inlining [-Werror=3Dinline]
+
+   src/tcp.c:146:1: error:
+      inlining failed in call to 'relpTcpFreePermittedPeers': function n=
ot considered for inlining [-Werror=3Dinline]
+
+   src/tcp.c:158:1: error:
+      inlining failed in call to 'callOnAuthErr': function not considere=
d for inlining [-Werror=3Dinline]
+
+Compiler does not inline any functions when not optimizing unless you sp=
ecify the =E2=80=98always_inline=E2=80=99 attribute for the function. Add=
 &quot;__attribute__((always_inline))&quot; to avoid these function inlin=
e errors.
+
+Upstream-Status: Tracked by upstream bug: <a class=3D"moz-txt-link-freet=
ext" href=3D"https://github.com/rsyslog/librelp/issues/256">https://githu=
b.com/rsyslog/librelp/issues/256</a>
+
+Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
+---
+
+diff --git a/src/relpsess.c b/src/relpsess.c
+index ee7b595..aa52b71 100644
+--- a/src/relpsess.c
++++ b/src/relpsess.c
+@@ -91,7 +91,7 @@ callOnErr(const relpSess_t *__restrict__ const pThis,
+
+
+ /* helper to free permittedPeer structure */
+-static inline void
++__attribute__((always_inline)) static inline void
+ relpSessFreePermittedPeers(relpSess_t *const pThis)
+ {
+        int i;
+diff --git a/src/tcp.c b/src/tcp.c
+index 7a75cc4..f4088c0 100644
+--- a/src/tcp.c
++++ b/src/tcp.c
+@@ -142,7 +142,7 @@ static int relpTcpChkPeerName(relpTcp_t *const pThis=
, void* cert);
+
+
+ /* helper to free permittedPeer structure */
+-static inline void
++__attribute__((always_inline)) static inline void
+ relpTcpFreePermittedPeers(relpTcp_t *const pThis)
+ {
+        int i;
+@@ -154,7 +154,7 @@ relpTcpFreePermittedPeers(relpTcp_t *const pThis)
+ }
+
+ /* helper to call onAuthErr if set */
+-static inline void
++__attribute__((always_inline)) static inline void
+ callOnAuthErr(relpTcp_t *const pThis, const char *authdata, const char =
*emsg, relpRetVal ecode)
+ {
+        pThis-&gt;pEngine-&gt;dbgprint((char*)&quot;librelp: auth error:=
 authdata:'%s', ecode %d, &quot;
+
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------qzQSeZl2so1JCROwBIlpB14P--

