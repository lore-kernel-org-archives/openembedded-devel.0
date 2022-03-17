Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE8FC433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 21:57:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.2483.1647554236618932445
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 14:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=JEN3enal;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=00754b9275=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22HLpC9s018264
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 21:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=svg4+jbS/NoiBZiqa6yOMm7mSgKPQiulVjyUk8hAWo4=;
 b=JEN3enalrMLmWNm5o19yEPV/1SIiOQAwD9GHYjDgleHLZi6xgkPWqz0u9tLEcSRNcFT3
 OpfVpMAgITPQjmyOrOOReGA2ezzJLx2AC5hV4J5KY6f+kMlDUy0iU3aP4VrnhTfJ2zlw
 NrwutlRPxj0f3hWGF94jZQlmuE+LC8owOGYSZDGPKKXuVx/LWQL4k6hr3PYthsW95xjU
 Lwf/kIiV8EPvT0AHfu/Lb7zpJU6kv0E1n9Z3D7CIx/LN9GNtTrBn+sfoUK353N4w08o4
 Sb0FgpPdjM9pORqwN4IP6IMJXkhuTJCVX8NiDoV835xwhpzL2DZiI5YMA0SwvrWhwSLG 7g==
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3erjg7vubj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 21:57:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mznm//Sjb1tVhloBTMD/qB9ARN59qBIYiozvt0hLp8XtsamEWsZ5PXg/Icc7Fc2yq++0A5YMAoNIVgiFybqBl7KToPQO2wgV3maaqi/QD0+NNp+mFVYx2Ys3Pql9RzqiyCsBvrX8wc0XUonB0R8YVloFNhYK7KaybHl7hribJ8IJBSvIbij7T1aycQ9/JSA89zqF1yqMnDzQDk9xSccl2C4wnIk7vR6/NPT3bskIY9rI/XTpr9Jd2SHJza0pEoorTI0Dq0m8wVgpb6W7FphVXbbbbdRZc1M9thBmIXWoPBzuOxS4T1A/M77DJydGPAuXrybBD2z6F9qYlZrHAQ1S9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=svg4+jbS/NoiBZiqa6yOMm7mSgKPQiulVjyUk8hAWo4=;
 b=dT8nnvg049ey9807enTK2rDxI0TLNuD+vthZtxtOxtIQ7l7Y8a6y6U6zTGzyph43UzKhzm/PuYy2WSa7ANd6h8HtOUsiUd9/YzN7z2qZKgF7D5YcQyekD/DB9leI6chZj04qkRImlp+mijm4pEHICk5F8IlhfJYmwnDg0y7+fIzf1CQY/JX0JSmw154G/8TerZaAakSTTAuSxiGU/aFLaoZ2j3v7bIKQq3p9SVLKImfxegejFtEzFZziGPwpnd44bLIyh06GP+CNHGU0CEsrWFs8Fk84nLoub5W0UR5tOVJh+py9WpSVxdV1EZ2Us+esmj/CWPt2aOoFcdxjcUF4cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB4579.namprd11.prod.outlook.com (2603:10b6:5:2ab::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5081.15; Thu, 17 Mar 2022 21:57:13 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::6893:46fe:92aa:95bf]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::6893:46fe:92aa:95bf%6]) with mapi id 15.20.5081.016; Thu, 17 Mar 2022
 21:57:13 +0000
Message-ID: <7d866200-3972-6040-c172-7d1947d0e545@windriver.com>
Date: Thu, 17 Mar 2022 17:57:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe] [meta-perl][PATCH] io-compress-perl: upgrade 2.096 -> 2.102
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
References: <16DD49CB14D08A56.457@lists.openembedded.org>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: <16DD49CB14D08A56.457@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0170.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:f::13) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20052ea4-58e8-4a1a-6647-08da086117ae
X-MS-TrafficTypeDiagnostic: DM6PR11MB4579:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB4579F65B4D998543A135281CF2129@DM6PR11MB4579.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SNTLbWct8NyOoiGj+GZ6Yp4z5dzzLlq/veWNr/Wpc4rAS9vxfFC6p85ZNV04QCBygpSQzxTvwXYFN9kF/BG0gD2GWjA5/pWf0ZaowkN75KN930uNyGjYNh9TAbQUbMCgU0U8SEaXGkhcyHh1WSr3dBXg5JgqOWUBfx6lAdkGpiJ+mmbStoWYANXPGuJ0SUGtIAUPM963ETtZMYHRTW67x6lUhqQDzX3ExfVzR6l2/ZXLmQYPhwuFdBl5UaPvQ8EX1toaiLO8zwBmBozIGoB+5P+SPaTDWA06civkLnR8jQubiUmaCx5N+OhpjKI4LGXOydCo6riJG+ruXaBxSFVyp1WjxdlY1UVqtbXNGuE80YerRRfhlFWzUZOEzYV1nT/oocu5FV8PIMa3WBCEv+zMJD862dGLnR04WujObZoRJBsU0zs3EmXa4fBqldUWUSQtisQyyRiLOlLCHHLaPWf3/8hO2Nf4wbu9Wzssp06ANgMHIYz8JHMxt0T+KoQbqhXfn40U0gVjrnect72BFccbVMe3tJSt4w19/2mr0NBq0rlbInXxin1wDiNtYB8yHdBKVdIoUxMaKRBOiVZZ2jE9pBOr5VMrsWttC2hdWDQthKShlEonOJiuvxHS5BKqpXiNhlD+mo7u2gAr4pNzjFGyOWUxDEYt/H8mW44VTOuD60PwtZhz1zruc8RjlwFdlxQ3k/GFCnUpJqwIAvRFuSaNh6ctpAtc9qiLM2uop13zWruxXYFIEq/vt2v5/Z2PTEtmd5OQqT7jPm/v9Tl0mMrIXhwIsP/Es1K0NMe8tSJiY/UkQqc9DMD0Qu3i5FBzQugP5HS59cneT55sLBUwGbnozJPGmXUOWXlW9yiRbfh3uiEo6K2E/Cocab8w8dwvkDdW6aeoFHiZF7oqGPtJJUxBOA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(6486002)(2616005)(6916009)(316002)(83380400001)(186003)(26005)(36756003)(8936002)(53546011)(31696002)(6506007)(52116002)(86362001)(44832011)(6666004)(2906002)(966005)(5660300002)(66946007)(31686004)(66476007)(66556008)(6512007)(38350700002)(38100700002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QlpmU2RpTmhYbHVlTzM3bXNPeldUc3VqOTFtYmJyZWRyZGZiaTJnN29ab3l5?=
 =?utf-8?B?bjgzWHlaMFZpVWxKYUoxYmswUUVoQlVkd2NjNktkRVZySDZETnJzYUlnVHE0?=
 =?utf-8?B?MktrejZ0QlZBT0VWbUs4UzRMSkgrMGtLVFdXOXVieWVkMkYxbitRL01CeWJW?=
 =?utf-8?B?SUordUc3NCt0RUcvNEt1Um92SjllWlplZ0VGZFNIY1BXYjI4VlZxSDRtNllD?=
 =?utf-8?B?U1daQUdMNEJXNmxXUjNQOVFNTitLR1RmOUdvbmVnRHFyVXd0dlRqbmtMNmVw?=
 =?utf-8?B?S1hHWXhxbmhRWUZDMXNvek1PeHd6VmtjQmt6dlJmVUc4Z1Fwb3B2TmpxVHhH?=
 =?utf-8?B?T1AyUkZXRmV2N3ZvdCt1c1FqNGMxV3NzaGpyTEZ2L1kzcDVjclkxemtuZW80?=
 =?utf-8?B?WGZrcDZYRmkveEpTZy94YzBWTW43ZnQzQ1NoVHA2TnpjRS91TzB3c1UyZkFm?=
 =?utf-8?B?VmpFOWFpVlN0bWxFcXFLbnY0Vmw2UGVXSGo1SHlzZ05xUlI5dFpzMHhPTjln?=
 =?utf-8?B?cmlkWUp4TTdVb2ErNUt2WkVpUU9aZmtTcUMrS0lxZE5BZFQ2UW5EblpodlBN?=
 =?utf-8?B?VVJEN0VKcUxGTUlNcEIrOEtmaUMweWZpTkVFWW9nYnAzdXVMeXdTSHcvWmJX?=
 =?utf-8?B?Y0FWRHNZY0V6RzR4WlpUWVhZV0kzc1RCSDByODN1MHhBODRyRW92ZUF1NHhD?=
 =?utf-8?B?Y0tmR2tKZEo1dlFWN2lpSmNyMVdKWWQ4Y0Z2LzJhbnZ3dWhqN0V2bS9jb0pJ?=
 =?utf-8?B?Zk5zSTJIMUNFWXBDTlNoYjQ3djJwT2ZMdEhrb01xakozV2ovUHRyWkFsdjBM?=
 =?utf-8?B?ZjlHRGNHWDVkbDBRNXhjQzZNUkttZU4xUjBuY0U5YVZqa3VSdkRKSGp3bDVB?=
 =?utf-8?B?ZmtDckFrUmZ1ZVlSb3ljTTU0RHZNQW9iOVd4MTd4RkF2UzcyZTFib3VRMUor?=
 =?utf-8?B?Zzg5TmRGM0UxOXoybHZBeVhjNjI2dFg2WEc3YnFMVkpHTGxQVEdobXdjS2FJ?=
 =?utf-8?B?RDJjNzNPVHBreWRnR0RtemE0SmUxSTd5VlUzckNoT3ZZdmhTNVVSVEFQMUJE?=
 =?utf-8?B?UDdSUE1EWE83MmpaNGR4bEFZRkxJSFV2VWpMd2ZFQUhrREhHc2FkN2t5Y05C?=
 =?utf-8?B?T1dDeXJxOWoxd1dJNFpiTUtHUVkzdGlzZHNYMGpTMlczREcveGJJTXBGK2ZM?=
 =?utf-8?B?N05MaVh1Ukx6WGkrZ1h1M0c3b2JxY2UrRWs4TzdHemFoU0wwL2FyYktWd3NE?=
 =?utf-8?B?ZTFjNEdydUdka3g1VDRkM3VJcGpDeXdDaVdIK25oTnBsU1lJYURjS01qb2sz?=
 =?utf-8?B?QmZSUnpVUWpIREdOMDZSbjRjRnhFcjNiU2J2cmF5aDg0V0VkZVpRUUFsdmhk?=
 =?utf-8?B?OVlBcWJYblN5eW13T2MrcUsyV1hBbmtLc3lxWEV4bGVZdWt3bHVqR0l6d3Uw?=
 =?utf-8?B?eFRlWUtkeFdramIzSVljM2xxN2ltYVBvRjdIaGE0QzZyYUpPbFYvMy9qV3pn?=
 =?utf-8?B?NTkyenJBTVJZZm4wekNpbGd1RUVsUjdlcWRsdTU2eFg3MkVIY2lwRjJRWEtI?=
 =?utf-8?B?S3lubWsybTJGVmtTM0dRWXRsMkFpRnI2M2F6bFlpVnZjeGVUdy9xL2JsWVE4?=
 =?utf-8?B?S1NRR0xiaUdudEJVK05ONWx3VVM1cVd2RU1wVWtkbWhEWS96UlNBakRSZEVI?=
 =?utf-8?B?dFlQRTJqajBGTnRaVktOdkVWQndoTVExZ0FuV3FMeFhEYjZuTlNOMFFJMlZ0?=
 =?utf-8?B?eStEbGJRcjBNajY5djN6VjY4RkZXc05IaWpQUzhQWVA1RmxWRGZiRkNYaitu?=
 =?utf-8?B?ekRXWTJXVWwrNnFVaHZXbkw2N2xTMGVYc3Y1SnBncVVFMERsM05JNVpsaGR4?=
 =?utf-8?B?eW11UVU3Qk1xaXZvT1MzRy9zVElaaTFXMXhEdkdGZDF2emlNck9uNVVDZkxo?=
 =?utf-8?B?TlZ5ckN2WE9rTTBDcTdWczBJUHZrMjFHZjlRRUwzU3o0VTRLUmh0R3ZsM2VG?=
 =?utf-8?B?VUxmb0FRaldBPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 20052ea4-58e8-4a1a-6647-08da086117ae
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 21:57:12.9751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 tNZAkwA34wmHxDTrCZyJXcITp8lC6OxuEMc3Vh18uHy38dDcukKKgeBDWhhjL2ghd7dWFahqF2nOdplAXy9fpK+Okhnsr0Qomd/33KchKZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4579
X-Proofpoint-ORIG-GUID: MNObCM1VXVz6rTOr0RflF2RcWidqy3u3
X-Proofpoint-GUID: MNObCM1VXVz6rTOr0RflF2RcWidqy3u3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-17_07,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203170120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 21:57:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96047

Please disregard this email. Sorry for the noise.

Sakib

On 2022-03-17 17:55, Sakib Sajal wrote:
> Added alternative links for streamzip and zipdetails
> as they are also provided by perl package.
> Priority for streamzip and zipdetails provided by
> io-compress-perl is lower so that perl package takes
> precedence.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>   ...ress-perl_2.096.bb => io-compress-perl_2.102.bb} | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
>   rename meta-perl/recipes-perl/libio/{io-compress-perl_2.096.bb => io-compress-perl_2.102.bb} (65%)
>
> diff --git a/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb b/meta-perl/recipes-perl/libio/io-compress-perl_2.102.bb
> similarity index 65%
> rename from meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
> rename to meta-perl/recipes-perl/libio/io-compress-perl_2.102.bb
> index ccc78d007..d0e393722 100644
> --- a/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
> +++ b/meta-perl/recipes-perl/libio/io-compress-perl_2.102.bb
> @@ -10,10 +10,10 @@ HOMEPAGE=	"https://metacpan.org/release/IO-Compress"
>   LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
>   file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
>   
> -SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-2.096.tar.gz"
> +SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-${PV}.tar.gz"
>   
> -SRC_URI[md5sum] = "18ad197cad5ca87bc3a7d2538998e017"
> -SRC_URI[sha256sum] = "9d219fd5df4b490b5d2f847921e3cb1c3392758fa0bae9b05a8992b3620ba572"
> +SRC_URI[md5sum] = "b79ef532ba8b6c1672dc2a401715f5cf"
> +SRC_URI[sha256sum] = "d6fa7f9a5beee446452a0fbc43589a0c73fe7e925c075b98628b018048dc72a4"
>   RDEPENDS:${PN} += "compress-raw-bzip2-perl"
>   RDEPENDS:${PN} += "compress-raw-zlib-perl"
>   
> @@ -22,3 +22,10 @@ S = "${WORKDIR}/IO-Compress-${PV}"
>   inherit cpan allarch
>   
>   BBCLASSEXTEND = "native"
> +
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY = "20"
> +ALTERNATIVE:${PN} = "streamzip zipdetails"
> +ALTERNATIVE_LINK_NAME[streamzip] = "${bindir}/streamzip"
> +ALTERNATIVE_LINK_NAME[zipdetails] = "${bindir}/zipdetails"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#96046): https://lists.openembedded.org/g/openembedded-devel/message/96046
> Mute This Topic: https://lists.openembedded.org/mt/89856191/4422444
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [sakib.sajal@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

