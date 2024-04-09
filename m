Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C79C67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 21:41:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.151268.1712698856260107181
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Apr 2024 14:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Lk+B4wgK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=482968419c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 439Bx727015174
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Apr 2024 14:40:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:message-id:date:subject:to:references:from
	:in-reply-to:mime-version; s=PPS06212021; bh=jAYZoHzk93sP+ZDwcUA
	Jrz9mwETXLrlynNs6kWYYz4M=; b=Lk+B4wgKzQoHHRxjqKOAMIsfgs8D7v+nhCS
	Qvubbrf8sbmjJZcAm4an6IXsToAp5J8Qyjjd891wnxS/jvUJWgcJnFigLdaZVSBq
	d5mcg50BzUS490J68OLF3ev9F29cxdxLbZpPYgigbjeTX+ymRk9qUUGqe88A4Ku5
	Fi7KWTaCMwH3RDdaBDqbHcGkcIzmh2gbiCHQgj7APaB2NP6X7sf5jip8mdrJStQP
	ppSlJXVb435O+GjZ7jQYN68/1BIgdghjc3Ljs9xveyC7o8aVm7JaLxbmLxBLkQ03
	9GvRF3d5WOy3GoKxr2j8FqEXrdN9ULy6cPanMyk76JHdhkpiVow==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xb1p0b2gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 14:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBI2C9V/c56E6XtJifYV1mdM0KItyjEHuo9ygpv3By5EKfk+z3PboPBczyZRm7pSDiaRs0OK4syu99aGVPHpcmX0fhilP79Yi3iiBnb9PSe5Qc7PUFhHpkPB1NeNOZApvPXfKgRz8VFJM4kgf2Ushu80w/VEuvr+PVzGiK2T4I1LYOe5vzm2p4U+TySSkbNLAI6KpTLDpD2/ix8lOLewh6vf9kCUbNink3PcdgeATYbvQ3PpAFpavEMeurHE6ld/zHcYB5V4aYHH3gdNxuaKDy7VKRxEvcPW6wRXBjepKd7GmQIWXtdOiZOIGSQCkOjUiUotn8YW5vyYcTGKqdcupQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jAYZoHzk93sP+ZDwcUAJrz9mwETXLrlynNs6kWYYz4M=;
 b=AzPgVN52i+thDCIQaEvn+nkYfPlCc6vyEiviWBEPPU9Lc6cgMWxZZhuHo7BBbHLJQMYFUwPmTEcyB+l7ZzdWsbPQrAv0f5dusq7XBB7pCJQ/2z1cPGJGJE+D9ttjihlc9Vo46CO2CHp29bHYGWQbc7RIHMm13FSnp2+Zn07+RMCAfQvgPjSuof33uW72kG9W7El8Z1pHt0sxWm+mohVPOPCAJ6ag/G8uAxGihbd7mOF+9ahqmkTlw152tjBb+4YxMnKuYkuGSaox7UDKp0mjl776pqvbEhl8d4aLewKyBRh6NvSGFJobPOsHXrng8bxkP/hLjK6PiWf25eA+YI3MTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com (2603:10b6:a03:42e::9)
 by PH0PR11MB4824.namprd11.prod.outlook.com (2603:10b6:510:38::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.10; Tue, 9 Apr
 2024 21:40:48 +0000
Received: from SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c613:f5c5:2c48:3f9d]) by SJ0PR11MB5920.namprd11.prod.outlook.com
 ([fe80::c613:f5c5:2c48:3f9d%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 21:40:48 +0000
Content-Type: multipart/alternative;
 boundary="------------U1GCMhJVaVAVFZmWvragGAXl"
Message-ID: <fa4ef16e-c5ae-48dc-bcfc-e01183492630@windriver.com>
Date: Tue, 9 Apr 2024 17:40:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [PATCH 5/5] libmad: switch links/SRC_URI to https sites
To: openembedded-devel@lists.openembedded.org
References: <20240409202531.1050101-1-Randy.MacLeod@windriver.com>
 <17C4B66C43D81498.18064@lists.openembedded.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <17C4B66C43D81498.18064@lists.openembedded.org>
X-ClientProxiedBy: BYAPR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:74::31) To SJ0PR11MB5920.namprd11.prod.outlook.com
 (2603:10b6:a03:42e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5920:EE_|PH0PR11MB4824:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8qoNKiRPb+Vi+5F3YCdd1pGBeQ20mlk4RCk+GplnqBMm5Kzyolai4hU2XWknzJf3IPbAqqupat6fi27iXZLQGzDUoytscuQyJVO6muhjCttb+xO+caPfewY8i6NYtUKBAUip1V8zTtUeh5KUh4dfwLIBz4spad+WzhaWcPUPqxTvUW+RyMkuN0steapkssLBtw9zVlSZPW575hOukjNP97VRrQdb0IpUzaI+37hegrxwtYnVvH82YCGkbUFsaP90yAtZx0i8oh+sKTdlrKgMWCgtK1eqa344GXgL1L5EI+RN8l9Oa/3A5BDUUboIe2wlyuCNExa3PeFrR53WBIU+nX4ZwVdf2q5EQcn3ty93ZOxBS3CGmRfUovItwdHBrxmidLa4u9awBVARwUqoExfSv0aevOl89PnhLbtPmhRHPfXjS2MTbah3yolkhP5b9So2Y4MsDsF6piusSqC5WghEacSi5lhInCFu/T5spsRLz+lqKDD4ryqw+O9w6dW1wYzBJGIxZDroNO/Wu1nPtLbHwiwmwwxYY4z/JWimNuvI58ZCLEWO8BIEQgswU/J24Wc8yKv/z7x9Vb8iKpyy7h0nvFyo/lGT8F+KSLmNDtzlTZI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5920.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b0p3azZTcUVHNi8xcHFtTlFSTVRBN2JCRVE4OXdLd2YrbzZMNzEzZ3VyOWtX?=
 =?utf-8?B?YU45b3ZOelQrMEZBRHdyakNrUWU4RzVpNmp5dnVSUy8vWXJ6cHFROWJ1aERo?=
 =?utf-8?B?RG1PTlpvZHRMVDZuWklIWHZ5SzZDL0NnSVpIK25YamVoMjFqRDFDM2E4c0gr?=
 =?utf-8?B?V2VpTUwzeFpkZEdxaWFlR0xxcUZLcEp2REkxNXVKdzBtaGp2ZTV4c2cybmtP?=
 =?utf-8?B?MlF3d3pPTVF4YVNVcTRkWHVUQXQ0RHFtWmluc2syU2lZWTdka2hxNGtISk9F?=
 =?utf-8?B?OHpuUUtUdjdXVFp5OVprUTJjWkdRbTdMS2hMaEtJNzNFa3BlY0hxdDV6N056?=
 =?utf-8?B?bmR4NkxPakc0ZlNrckV5U0xnbG1kbVhnYWJqYks2SzhRS1Q2MmhyaVhON3FF?=
 =?utf-8?B?Wi9vQ2FlNDJOSEJOeTJadm5oanBYWHJUeUI3SmlkZUxRWDlOZWxtZHFPSERR?=
 =?utf-8?B?a1hISi9sWFJaQlNpSDBIWEtUdk1TUy83enFzb3pqd1hxdWVzS04rZ1A1MDBR?=
 =?utf-8?B?SjlEdFBYT3Nqd1lFQ1VqNmRsektSSERiTDVkMUtyazhCMjltUG4vb2U0VnJh?=
 =?utf-8?B?eFhIY1FoNlAySEJ4aU9hejc4UkRKM2NLSmNucXVXYXNIMkp0YWV1UElYWFd3?=
 =?utf-8?B?aXovL2xVaUVSRjlYRmFtWm9oVFIwaC9pTlFkQ01zUktJMUZ6Ym1zTS8zYml1?=
 =?utf-8?B?LzVjOXF2OFI3VElQcVpsenoxWjlHYS9lV3E5NmRGYi94d3FGcUNGWEpqL3Zv?=
 =?utf-8?B?Y0FBVnNnNkQxRnpEdDlMTzFscjU0NmRxQXM3VGo2S3JXeUI5aDN0UERVQmE3?=
 =?utf-8?B?Nks5S1crZFVUenZleGpwd1pMUjdCTHU1aGIwVUluVW5kY3FiUHVlZ0hZMjNY?=
 =?utf-8?B?YzhaM0dlVEJlZlp0elY2YTNxQjIva1RnR01jKzZjbVBaaVRGYXk3OGZRMU9q?=
 =?utf-8?B?aWZVVVl4QVkvNDdxL2FIbUdlTFI2Tkt4ZVRWMGxzZDdaMGlybkpmUDFKTlhi?=
 =?utf-8?B?bVpodlRMQW1saWlDVUF6YlpwODhFalFNQU9ZWU9nUVZ6VXFKbzFaQnEwU09v?=
 =?utf-8?B?VDJQS2drbTRRUzVUNE5McTBwWFFsanM5R0o2djAyTTQwSXhEU3kzVXk1Rldz?=
 =?utf-8?B?TERCN1hqTTlqRUJFN2VEVk5icWtNYkdkMW1sVHdNUU5mWnFMTG1VMTBNeHZI?=
 =?utf-8?B?WDFxVmpCQ0I2ZWVISVFmWG1EYytVa2M1ZzN4UGdMbmZPUnpxQnhqZ3JIMVZw?=
 =?utf-8?B?WjdwMGhFSkRHWmQzVis0b1hwTzZZeCtJK0xlcE9QdnVLUk5sMjNzNXZ1d1lW?=
 =?utf-8?B?VkZxbWc1ZkpMWnhYakVOQ2pwOXdIQ09Xa1J5R2tiN29oamw2YldtdXZUT0FL?=
 =?utf-8?B?QkY1UTBNVUpwaERHb2EvSDg2MWFVNzh5aGxmYmtRMVl5ckgyZlp0Y3dKVXha?=
 =?utf-8?B?R2VLNkxGM2FaL0ZMTURiTk8xUW52NUEwZHBod2ZxR09DNEZxSVhCaGJNRmN2?=
 =?utf-8?B?aGliaENOMjJXdGU0eXgwbGJCRHc1SmkyQjdTckVOV1owb29MVWpLa0pGeUxR?=
 =?utf-8?B?dTE4OFRwTjc4WEwyRjdkRXdOdUgwY3ZiV0xEN0dwSlU4dzlLY2RRdzNuRXNL?=
 =?utf-8?B?YTBkVFJWOVVhbTArQnVVbmhpTnluRkpaQk1wMVVPRHhUR1RlWWhDaU11aWZH?=
 =?utf-8?B?RGc3bFNMRDYweWpJS1Frek16Q3Y4TGpxbVN5cDh2aktpMkZQYzY5R2JPQ1B2?=
 =?utf-8?B?eVhzWTNBK2JoT2FEQmJPUm5SS2Q2MHhURjVqdFJDRVJWZTk2VkNLSXdsVXlV?=
 =?utf-8?B?eXl0dFlyVFNnbFZBUUtSWDkvUVdicXN6c2JyWFZac0lBWG5McnEvSklZVTY5?=
 =?utf-8?B?cytTZXh2a3FvVnowS3JPL0M1OUJtZ1IvTThxeDY0VE1pazVvSzRQMXVtZEtS?=
 =?utf-8?B?Uy8zQkVERzE5TDFnTGVvZEJraHMyU3JmbTlvdzJyakRRUFJVS0Q4M1ZaN2hG?=
 =?utf-8?B?b2EyTUs2KzRqQXNjRW9wVmxlSWEwQXdXNmtBc1ZYM0tUWXlad1d4b080OVBV?=
 =?utf-8?B?UnhCRUtmeFpNRkFBV3Vub2hPc0ZiYzRXUkVCUmt5VWc2UDhBY0pDVXN1a0p1?=
 =?utf-8?B?MVUrYXg2cmV5akpPaTRjaHlTYk52aDVOdUZsZC82emdTK0dlWU1NVVJray9X?=
 =?utf-8?B?Unc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95d8c8db-91c8-418f-ff50-08dc58ddb80f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5920.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 21:40:48.0355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvB6zU1fTFrQMGuL7B/geHkXa/eiEgQbB9/REhharH1guyk0xp+QglX8Pl0mAkD4YK74zFSNHrUdfZcOe+rxrzmm+eFvFFVWmHlxKgxsTSM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4824
X-Proofpoint-ORIG-GUID: w4bKAYbvVflzVJvkkYr5mmRpZ8AtLiv0
X-Proofpoint-GUID: w4bKAYbvVflzVJvkkYr5mmRpZ8AtLiv0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-09_12,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404090147
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Apr 2024 21:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109887

--------------U1GCMhJVaVAVFZmWvragGAXl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-04-09 4:25 p.m., Randy MacLeod via lists.openembedded.org wrote:
> From: Randy MacLeod<Randy.MacLeod@windriver.com>
>
> Switch to the sourceforge SRC_URI since the mars.org site only supports ftp.
> Also switch the HOMEPAGE and BUGTRACKER links over to https.
> and drop the obsolete SRC_URI[md5sum].


For "future me" or anyone else interested, there's a well-maintained (?) 
fork of libmad here:

https://codeberg.org/tenacityteam/libmad

I don't have time to do the update this week so I just made the changes 
submitted here.

../Randy


>
> Signed-off-by: Randy MacLeod<Randy.MacLeod@windriver.com>
> ---
>   meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
> index d0171f3b9..e70c8e3ed 100644
> --- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
> +++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
> @@ -1,6 +1,6 @@
>   SUMMARY = "MPEG Audio Decoder library"
> -HOMEPAGE ="http://sourceforge.net/projects/mad/"
> -BUGTRACKER ="http://sourceforge.net/tracker/?group_id=12349&atid=112349"
> +HOMEPAGE ="https://sourceforge.net/projects/mad/"
> +BUGTRACKER ="https://sourceforge.net/tracker/?group_id=12349&atid=112349"
>   LICENSE = "GPL-2.0-or-later"
>   LICENSE_FLAGS = "commercial"
>   LIC_FILES_CHKSUM ="file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \ @@ -9,7 +9,7 @@ 
> LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>   SECTION = "libs"
>   DEPENDS = "libid3tag"
>   
> -SRC_URI ="ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz \ +SRC_URI = "https://downloads.sourceforge.net/mad/libmad-${PV}.tar.gz \
>       file://no-force-mem.patch \
>       file://add-pkgconfig.patch \
>       file://fix_for_mips_with_gcc-4.5.0.patch \
> @@ -19,7 +19,6 @@ SRC_URI ="ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz \ "
>   SRC_URI:append:toolchain-clang =" file://0004-Remove-clang-unsupported-compiler-flags.patch "
>   
> -SRC_URI[md5sum] = "1be543bc30c56fb6bea1d7bf6a64e66c"
>   SRC_URI[sha256sum] = "bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690"
>   
>   S = "${WORKDIR}/libmad-${PV}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109885):https://lists.openembedded.org/g/openembedded-devel/message/109885
> Mute This Topic:https://lists.openembedded.org/mt/105429777/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------U1GCMhJVaVAVFZmWvragGAXl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2024-04-09 4:25 p.m., Randy MacLeod
      via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17C4B66C43D81498.18064@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>

Switch to the sourceforge SRC_URI since the mars.org site only supports ftp.
Also switch the HOMEPAGE and BUGTRACKER links over to https.
and drop the obsolete SRC_URI[md5sum].</pre>
    </blockquote>
    <p><br>
    </p>
    <p>For &quot;future me&quot; or anyone else interested, there's a
      well-maintained (?) fork of libmad here:</p>
    <p>&nbsp;&nbsp; <a class="moz-txt-link-freetext" href="https://codeberg.org/tenacityteam/libmad">https://codeberg.org/tenacityteam/libmad</a></p>
    <p>I don't have time to do the update this week so I just made the
      changes submitted here.<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:17C4B66C43D81498.18064@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Randy MacLeod <a class="moz-txt-link-rfc2396E" href="mailto:Randy.MacLeod@windriver.com">&lt;Randy.MacLeod@windriver.com&gt;</a>
---
 meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
index d0171f3b9..e70c8e3ed 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -1,6 +1,6 @@
 SUMMARY = &quot;MPEG Audio Decoder library&quot;
-HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://sourceforge.net/projects/mad/">&quot;http://sourceforge.net/projects/mad/&quot;</a>
-BUGTRACKER = <a class="moz-txt-link-rfc2396E" href="http://sourceforge.net/tracker/?group_id=12349&amp;atid=112349">&quot;http://sourceforge.net/tracker/?group_id=12349&amp;atid=112349&quot;</a>
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://sourceforge.net/projects/mad/">&quot;https://sourceforge.net/projects/mad/&quot;</a>
+BUGTRACKER = <a class="moz-txt-link-rfc2396E" href="https://sourceforge.net/tracker/?group_id=12349&amp;atid=112349">&quot;https://sourceforge.net/tracker/?group_id=12349&amp;atid=112349&quot;</a>
 LICENSE = &quot;GPL-2.0-or-later&quot;
 LICENSE_FLAGS = &quot;commercial&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f\@@-9,7+9,7@@LIC_FILES_CHKSUM=">&quot;file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = &quot;</a>file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 SECTION = &quot;libs&quot;
 DEPENDS = &quot;libid3tag&quot;
 
-SRC_URI = <a class="moz-txt-link-rfc2396E" href="ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz\+SRC_URI=">&quot;ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz \
+SRC_URI = &quot;</a>https://downloads.sourceforge.net/mad/libmad-${PV}.tar.gz \
     file://no-force-mem.patch \
     file://add-pkgconfig.patch \
     file://fix_for_mips_with_gcc-4.5.0.patch \
@@ -19,7 +19,6 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz\">&quot;ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz \
 &quot;</a>
 SRC_URI:append:toolchain-clang = <a class="moz-txt-link-rfc2396E" href="file://0004-Remove-clang-unsupported-compiler-flags.patch">&quot; file://0004-Remove-clang-unsupported-compiler-flags.patch &quot;</a>
 
-SRC_URI[md5sum] = &quot;1be543bc30c56fb6bea1d7bf6a64e66c&quot;
 SRC_URI[sha256sum] = &quot;bbfac3ed6bfbc2823d3775ebb931087371e142bb0e9bb1bee51a76a6e0078690&quot;
 
 S = &quot;${WORKDIR}/libmad-${PV}&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#109885): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/109885">https://lists.openembedded.org/g/openembedded-devel/message/109885</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/105429777/3616765">https://lists.openembedded.org/mt/105429777/3616765</a>
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

--------------U1GCMhJVaVAVFZmWvragGAXl--

