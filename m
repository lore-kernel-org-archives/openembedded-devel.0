Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.667.1625679205183768481
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jul 2021 10:33:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GIF4om+/;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=28220adab4=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 167HXN2i027586
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Jul 2021 10:33:23 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39mp1212sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jul 2021 10:33:23 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 167HXMrc027579
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Jul 2021 10:33:22 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com with ESMTP id 39mp1212sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jul 2021 10:33:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjMPZnlvXakmQ+OZ0zMBZMRO75xOVo99ed55e9CAbEkB1F0JslWGJbI9wI0lZyHX2lWldUSI1NQwMMpkgC4q2hl2o9BhDYPIOmTEysfxQCvVqXvwG0WmvOGOQAYtGd4VcZvcuvSCkzKFGwY0bP8a1OEt5DBAT7NlsSJkStKyzncoQ1JX8sh2EZTCvHXODHSkB11raWp6XskgRpaHLN0DNu62d+SawfCuh1KtlyTxu9yftyhB7jocADFri2u8eIxVlC+sTNR5Cuq6vY8R5Xq1e9p6ifjjBI/RwxmVbWji8XiU538YYU1itYSuFuiIRKV/LOwXc3Gn2Q0/URyV7cLhig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkB9cTKxYTn2UIWSjVDY7YpRgNeb0tdFoVhggIhjKhA=;
 b=MYcbnT67gKRMRQAxKOYj2DWCjr/Xet+lca4NrabQqaX/1eMuJ7TqlF3DlIfU9uSttTVrvQGeQ+MXKzuurH9hhqIK8n/HMfpWM30NG7THKgwNdMshCrM1zqNfoOxONM8r4Vrpb6ezJkw2PsWqGaAYn/NJZUq+QswTgqDy2ocyMDyrEPQjfl3yhGmibwViqFuy18+BNV5TgyhoOnXte1zhHStjbyWUQjIrzZk+vpvEWS6SMsRdXJ3LiWSucQnz1TaQec/QsybKa6ETMcdcEUrBYepOOwQ17p8LqExDv1bcBfzgcd/19S6F5n7XvcvpuEc+nwfjrkDlBWRal4QFuackJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkB9cTKxYTn2UIWSjVDY7YpRgNeb0tdFoVhggIhjKhA=;
 b=GIF4om+/qztRso9KonsDbdDAXigdz37sHoyqYA3Y95eeh/kOwiSZFVgT+5eUmi1YZlergj1J20R9slQFuPeZKv6KA8qhtWRMXyLEgeDG+b4IMcIqPzrSmDbtBRmHsADUjUbKsxM4nTKvTDy1Wd4lAC5eWcrqjPOY9s90tGdH15A=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2840.namprd11.prod.outlook.com (2603:10b6:a02:c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 17:33:18 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e%4]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 17:33:18 +0000
Subject: Re: [oe] [meta-oe][PATCH] suitesparse: Fix LIC_FILES_CHKSUM
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210707172920.3919845-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b576fae8-c3de-9f4c-38ef-bfbf7b27bd70@windriver.com>
Date: Wed, 7 Jul 2021 13:33:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210707172920.3919845-1-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0060.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:c29d:d7c0::6e79] (2607:fea8:c29d:d7c0::6e79) by YT1PR01CA0060.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Wed, 7 Jul 2021 17:33:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f66c7ba-90de-481a-04a7-08d9416d4ec5
X-MS-TrafficTypeDiagnostic: BYAPR11MB2840:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2840040E6605FD1C69C6789F9F1A9@BYAPR11MB2840.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qo99gM2SUel+qXGIpHpI17W/+XMraQORwmjyprrgPTk21cEfaOXa0mxfWwIHzuAkbjr6ZgG03euvTElw7oPQz1lAPItoZkRZonMHYrTH8bL5cifPP9jeVF3MuN9W2ecxTW4eHGIuJpv0ZO+0nVl6WZzfZj0s2abOrmRz+U0jTavKUhAIjvoz8RBuyO3KrJMOSDsWMlenydeTrg1Q+Od6tiDvbps3wUtp2cmIGi2M6DelOL7vU1WUt63CiMMfVL1gxUGDsxfziGnZhtHT226iyiVSxAqjDhMkXfXefXihjPJSZGjZLw1Uw6sr16wYaYkuQZ9mudAXDIh7YPk1yji0n9Rzgvhst7cBlYWX6WXkE+yRl8SQ8FYl+/+QtPB6lGImKJnPLQE8YXJscC8yFUv44vntACHpRss3Qo+A68ncPQfqKxUQgWio8omExVP3evik85ooDKbdgPONfHyd+fk1KP0XsjQ2Gsdm7+TLAReR0bhSLcivl+NLI8Tpf318BCpg7oZFPmd5FQzA4O8yiVy5361OqxsGajPWHCTwpAKc6IA4moMGLDeMrLOkSRZ2qNDSmyQ2Q8jhgjjICFmYvGzesUoC6vZj66iO9clSCjhkgo5yzkEiguRe1NGTYjHB2oCmBkblKXclDtsrLwDmf6mYfRkqjsoAnbn5BfMO42oC4TmI9MFFtHkG37vJsra9UlKgRuphyy9eOCgblISNj/3Rltrbw1FJZl7ZCxLhHg1PEz4Ce1DSa7F1qYeUQWcCjwFpCRVvjmlQ1yIBKBmhiMvW1Vs7daSov+kcbiTPhp3J6GtSHA23T6Lj0Lu4etbEQdJEkjvjoaJFDPbzr18vHEMUXwNY84nB/EY2wSefv/UKSgQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(39850400004)(136003)(396003)(2616005)(5660300002)(478600001)(316002)(31686004)(44832011)(6486002)(66946007)(966005)(66556008)(83380400001)(86362001)(31696002)(53546011)(186003)(166002)(66476007)(8936002)(36756003)(8676002)(2906002)(33964004)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MHZTdXIvZTRTMHFSSnRLc25RSnMwU1liSC9LYVdtdmozUUQ0WHZ0STIrUlQr?=
 =?utf-8?B?WnNRS3BUb2h5Qm8vbVhuYmJXZ0Q0YXVEdmJydHEvd2F6MVBwUVNpQm5aSzEw?=
 =?utf-8?B?emdvc1hKYm9RSTdwOGpLV0FMUm5LeVRJRnU3Q3I1RVZsZXVsdkd3d3ZjOWh4?=
 =?utf-8?B?N1Y2a0FSbXcvTWV6aU9kTE9yREpPMXVhUHZ2ODZYUmVRYk51K2xzK2Q1NVhF?=
 =?utf-8?B?SVRkVDZIMEZqRkFsM25zcXdKTDdkd2dEZnZYS0duU3J2M3ZLVTVsL3lhdFF4?=
 =?utf-8?B?NzdNbC9TY0pyMUpvejZTNHVkYzJEdlpJVW1KVVZ0SzJXVjNmSzRwbElWV2Vz?=
 =?utf-8?B?MjZ4SkV5c2xWSHBNSTU1TlRkVWUzeUhlUk1DNEFCM3EvWWFnM2FvYjJJTi9v?=
 =?utf-8?B?b3UwWkljREF3amtRTFkyODZ5R2orT0haTEh1VXJrcUMxR0w5V2xMTTJaeHh2?=
 =?utf-8?B?UHBNMnFhcE1kZFlSOGJTbVVwOEdxaEpmTW00QytPWnc2Y3NBM08xTTc4bTg5?=
 =?utf-8?B?V2NmMEE3azEvWFVFR1BFNWh0Q1dtQ1pHSHlzaW9JdEhaMGthRDVQVCtmNjlw?=
 =?utf-8?B?ck9CeFRhMkdOeGFmb3JjRGVLM1d3bldqRHZIYngvVWo1MTFObWhBS2Q5QUVE?=
 =?utf-8?B?em8rbStRTXB6Nm1PR3d5L1hoSnhVQkxsbWRhZGZvd3JzWGtmc2d4NkFQbnIv?=
 =?utf-8?B?SGtVQnd2ZHdaSDljWm5FdmFDWnJoZktFTVVva3dHbjZzZGNHNzBrSVo2QUxJ?=
 =?utf-8?B?UEVURWtTSWF3amRlQXV1cUtTTk5haEJCdHZBaG9XS3o5VFN2cExJalFhNi9V?=
 =?utf-8?B?RFp3QU5UbjMwQ0hpN3cxenRWbitVU3d1NnNMKzU2L3puWVhLajlseEVpZTBQ?=
 =?utf-8?B?NVZwRFhsZnkzME5WeGJmSFJ6SjBIaElEem1FQkxTbXc1eHN3QStpTjhWQzBo?=
 =?utf-8?B?SnlTQjAvRURqWSsrSFlPZFhIdE1PSFpFMzRSTUFDeWJCWUJodmJ0T3hlVVYv?=
 =?utf-8?B?Z1Nja3dUMmZlUVVoQ1B5aExWcEkzczN0Uk80V1J1RnNlc21ja202YU90S1BJ?=
 =?utf-8?B?Mk0rZmNRREY3cUFOaTg2NkJKcnFsbCtBVnFrRSsxN2ZOckFzTDRQUUNUelRn?=
 =?utf-8?B?Z25aek56RGduSEN0YURJVFdWcEtqUkF3eFdUbVl3MjFBai9OUnk5ZVFDZXFK?=
 =?utf-8?B?NzVWcGk4QnZhcStuRjZpVlJiRnBYR3kwOU5Fb0c3ajd4UXFNc1g0cTZCQ0xW?=
 =?utf-8?B?eThmM0hrYjVzdTJwa2dBNFZNSXFWblR1b3hHek1mN3NGTVNRSVEwZWdNNWc4?=
 =?utf-8?B?SU80eUpYK3dYYURVTnZ0QVhReUI4dzhCNFgwTmJ4Y0F1ZzVURElJbUpHT3Vu?=
 =?utf-8?B?RzlaUEJ6M2J1QWg0Z2g0YUFnL2pNUHFpM0grWGFLd3pXanNKaFA3MEJpYVFP?=
 =?utf-8?B?U1NNdjBsakE3UVFPSDBhNFFZZ0J3Qzl1ckp4aGR3SVQ0eHBuOCtiWVVzelB4?=
 =?utf-8?B?L0dRTy85SFBUTHo2UjdUcWZUTmpYY3NUajJHUzJZRWxNd3BYTzZaSDBkNTh4?=
 =?utf-8?B?dUg2QzZ3ZUNuQVVVeGtWMXl0RzdPWk9KUGI5OFFRVi80SHhBYU1yTnFEYjcx?=
 =?utf-8?B?STN4Y0M4akkycGFlcExPRGZibkNrUW5yUmllNDVwNzlFcWJoakl0Q2V0aGR3?=
 =?utf-8?B?MlFRSFNDam8xUENvbEMwS2J2bzVWbytBcmUxRXpoYmhWMEJ0TURzZzNvb1lH?=
 =?utf-8?B?WmRUUiszUVY1MUdCb3MwSXVEc1dDYjdreDJpeWlydmd0V25TamthamI4QkdZ?=
 =?utf-8?B?V2FpR2tLYk82MlZUK29QQT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f66c7ba-90de-481a-04a7-08d9416d4ec5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2021 17:33:18.0659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oq9RzzJcRtTjmbfp4aOFKDpEO8ojnpUZAM2xrBQZ4rl/FV8bZXSvZp9bEJ5597w7aTTkVtvGlDt9gUxkkChXaiZ8EGnexzjQWoTWwmy1nms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2840
X-Proofpoint-GUID: Ptv7P4DBMJwo7IX-NI2n1maz7qG4U_50
X-Proofpoint-ORIG-GUID: t6JJQ2cdTfI3Er6OsyYdDAd-yJjgHjj7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-07_08:2021-07-06,2021-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070101
Content-Type: multipart/alternative;
 boundary="------------470B4520F27DB4FDEE557702"
Content-Language: en-US

--------------470B4520F27DB4FDEE557702
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-07-07 1:29 p.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> License-update: Use SPDX format text for graphBLAS [1]

Beat me to it. Thanks!

- Trevor

>
> [1] https://github.com/DrTimothyAldenDavis/SuiteSparse/commit/538273cfd53720a10e34a3d80d3779b607e1ac26#diff-d0ed4cc3fb70489fe51c7e0ac180cba2a7472124f9f9e9ae67b01a37fbd580b7
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> index 1e165039b1..b92f63b265 100644
> --- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> +++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
> @@ -1,5 +1,5 @@
>   LICENSE = "GPLv2 & GPLv3 & BSD-3-Clause & LGPL-2.0 & Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f9f2b9d61cb769a67c4cd079e1166de7"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5fa987762101f748a6cdd951b64ffc6b"
>   SRC_URI = "git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https \
>              file://0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch \
>              file://0002-Preserve-links-when-installing-libmetis.patch \
> @@ -73,4 +73,3 @@ FILES_${PN}-staticdev += "${libdir}/libmongoose.a"
>   FILES_${PN}-dev += "${includedir} ${libdir}/*.so"
>
>   EXCLUDE_FROM_WORLD = "1"
> -
> --
> 2.32.0
>
> 
>

--------------470B4520F27DB4FDEE557702
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-07-07 1:29 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210707172920.3919845-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

License-update: Use SPDX format text for graphBLAS [1]</pre>
    </blockquote>
    <p>Beat me to it. Thanks!</p>
    <p>- Trevor<br>
    </p>
    <blockquote type="cite" cite="mid:20210707172920.3919845-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">

[1] <a class="moz-txt-link-freetext" href="https://github.com/DrTimothyAldenDavis/SuiteSparse/commit/538273cfd53720a10e34a3d80d3779b607e1ac26#diff-d0ed4cc3fb70489fe51c7e0ac180cba2a7472124f9f9e9ae67b01a37fbd580b7">https://github.com/DrTimothyAldenDavis/SuiteSparse/commit/538273cfd53720a10e34a3d80d3779b607e1ac26#diff-d0ed4cc3fb70489fe51c7e0ac180cba2a7472124f9f9e9ae67b01a37fbd580b7</a>
Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
 meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
index 1e165039b1..b92f63b265 100644
--- a/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
+++ b/meta-oe/recipes-devtools/suitesparse/suitesparse_5.10.1.bb
@@ -1,5 +1,5 @@
 LICENSE = &quot;GPLv2 &amp; GPLv3 &amp; BSD-3-Clause &amp; LGPL-2.0 &amp; Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=f9f2b9d61cb769a67c4cd079e1166de7">&quot;file://LICENSE.txt;md5=f9f2b9d61cb769a67c4cd079e1166de7&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=5fa987762101f748a6cdd951b64ffc6b">&quot;file://LICENSE.txt;md5=5fa987762101f748a6cdd951b64ffc6b&quot;</a>
 SRC_URI = &quot;git://github.com/DrTimothyAldenDavis/SuiteSparse;protocol=https \
            <a class="moz-txt-link-freetext" href="file://0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch">file://0001-Preserve-CXXFLAGS-from-environment-in-Mongoose.patch</a> \
            <a class="moz-txt-link-freetext" href="file://0002-Preserve-links-when-installing-libmetis.patch">file://0002-Preserve-links-when-installing-libmetis.patch</a> \
@@ -73,4 +73,3 @@ FILES_${PN}-staticdev += &quot;${libdir}/libmongoose.a&quot;
 FILES_${PN}-dev += &quot;${includedir} ${libdir}/*.so&quot;

 EXCLUDE_FROM_WORLD = &quot;1&quot;
-
--
2.32.0
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------470B4520F27DB4FDEE557702--
