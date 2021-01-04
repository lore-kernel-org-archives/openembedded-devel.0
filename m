Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.53])
 by mx.groups.io with SMTP id smtpd.web09.14917.1609774302158932706
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 07:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NUQeC1md;
 spf=pass (domain: windriver.com, ip: 40.107.77.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADnHYpwgmdfO64HoXTaM6U+37PZE0N+A9ydGe+To454H3dY55nZdjgRinbhUB6VcUJPsnpCnfkVhnHzR/Q9w/N/1cKa2JTvlbPs+ReGc+5459rUWH3SM4/sUuUPIl+iCBgyAi6Hwb/xBzXcBcXV+oqYhzJg7FvS2ejHFYPO/6ftDOHJUFKeRTvsye+WTxbFS6ue2LcovZhKdEuamB7gE/mXvWKX0GV0x31/u+dQyQTiAT8R/uEY8klwvcSkrQe12xEa+MFuUub8dqafaN4Ulpf4/auWJycADmfPtWXtMtK1mGaE4ndPV7wvQNMt2Wyt23pP1Y92hoGrdV6NN6+MUGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMkCoGnuYQEj2mVdvV4CKtK6pHenbfGuYORJMyxneuI=;
 b=K8fmcmNQOiHJp60ZtuRK1NlOHqrVngTHupzMw0d7+GvstfPKioLo6VDA61nXO1VkmBHxpOH2uhniXRe0Pj1TTwe6LuFhsRtgednWl6Wv0gCEPVG/+6wt3Z/gZO62VYJZsHqbVxPr6BGeGFIhhDzTPdHCQTxphEIIN+iQg8iAV5bQdGgsnPBuLi8J4b9VaIROtmRHNXnPvj3b9QH+nJqPYCoBnsiPCvgA4xn3QNEFSTjQ5Qye3DXMTLrLRtcMbaMlU+yuWXB4ideFit3xmhx/62/hJjGMZiCdN3qXjmaGviG+ALIMypCuGuyCIRruac8xGtYfZxU3CisQa+oluoD6AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMkCoGnuYQEj2mVdvV4CKtK6pHenbfGuYORJMyxneuI=;
 b=NUQeC1mdwZ3QTz09O6Hf2SrGnQlttPwjME+ATMz+f0eNtJ9DI0mCci719XZ44YnrizIm4ZHNuNw+FazzVP1jpkoQJLYzSolYn9jQNpWnQaCg353/5HWenZuM2Nxb2NHuAJ47T2lfhQTvtQDENmZBRKra6NlebTlCL+TDRkkSEJM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3222.namprd11.prod.outlook.com (2603:10b6:a03:79::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.22; Mon, 4 Jan
 2021 15:31:41 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 15:31:41 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-aenum: upgrade 2.2.4 -> 2.2.6
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1608613348-66835-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <25bc84d4-847f-abe1-bcc4-481de39ae149@windriver.com>
Date: Mon, 4 Jan 2021 10:31:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <1608613348-66835-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0440.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0440.namprd13.prod.outlook.com (2603:10b6:208:2c3::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.4 via Frontend Transport; Mon, 4 Jan 2021 15:31:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4887ceae-e55a-43b6-9d66-08d8b0c5d59a
X-MS-TrafficTypeDiagnostic: BYAPR11MB3222:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3222C7E0DBE09E80EC65AF1E9FD20@BYAPR11MB3222.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QNzJv7EdMJPIcVHnzLSKMPWBooCwpRUc3XHrkgWQRUxysuOmZYDEXtg9XNzR5uzkBfp18XwMLDPEM/0RLyF8bh1Eob996b/5ms3dF7KXmHCBRshDCOWlTJ1JdNsd4SVS92prbYcBjVBxyMVf8CwCqFH8E5PjjXP3Kr0Gsa9+vpDFvNCcOQ8EIXP2DhA1a6bteqAjjxd9Lx56uthfrG7Vctmc4WXd3XuVa9z0CUCsmnHG0g1xBJitKm34GhTF0xaqFJT7dP0IYs8jC8pJ/A6koWJdrlYUtO7z88Ea2IAXtZXi34EuV0NSErb0XGE2TRG07ycXRGsJeLWDzgVa2jHJ9VTYdgWqdyU8RcgXKdAHvYNs2Beo9DLRv0b/lBFnJPZH6UGU4x0Hini13m33At5rXu1fKFplg3Dy1g2UC0uZugWMZOyh9zcTn16D0BKZJgS02RYxrjOffIA5+N6l6Op8+mnVwWSkIodYJrzgYIDxkfD2U4dlTENW/8lrtviWVH31Ook4SSfti8pG6j3c4tYvZKnv+bNdIe1pfej0CQ93HTs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(26005)(36756003)(8676002)(66946007)(66556008)(66476007)(316002)(16576012)(4001150100001)(44832011)(2906002)(31686004)(16526019)(52116002)(31696002)(186003)(6486002)(2616005)(83380400001)(956004)(33964004)(966005)(53546011)(478600001)(8936002)(86362001)(5660300002)(166002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?b0x0ODlRSStpcWc5M1hLYk5QelBSY0djWjJXUlRYY3lveUNHbjBoOUNSMCsv?=
 =?utf-8?B?ZXhybWtuOWxKcXdEVm1lOFZRVFYvTGZodVFibUJSbkRaQ3dFVDhMcy9Cb0dw?=
 =?utf-8?B?S3lPeVNVVmJ4N29wNUtac1pUS1MrVEV0OXBOQ1lBMUQrb2FDUmpBTERrUVlh?=
 =?utf-8?B?UXphUnZRbXlGenQwVmpTZkdySHhsMnVTcEhQaUdkTUo1enZyaXpKWHhqMGF5?=
 =?utf-8?B?S2pQcE8rSDV6UGEzdkswMWFTSlUvTE5wdzIySXd2Zm1aYkl2TnYxSjFyVUhK?=
 =?utf-8?B?ZGY2dmRJWThKUmoydnJ1bEFKMElZT2xJSDcyYjByeWJ6UnQ0bVh4eUtGQk5i?=
 =?utf-8?B?dWRFYWVyRWJscE44ZnlqM3B1R0szbWEzc2doQmt3U2dNdFdHMStoOHJXVTEw?=
 =?utf-8?B?OFM1Z3lpMmRSaTNBN1ZFcU1HSlBTWDg5STdDYWxaUTFaVkxtc3VyeVpXRmQv?=
 =?utf-8?B?Z2dHMkVicFVXYlpoM0U2Uk1UQ1RiMHZUSlNpVTk2YW9YbGRRNlZKc2N3Y3RU?=
 =?utf-8?B?OUJEeFBnVjhTVEFIV3d3ejNBM2JOMGwwRzFUcHA3QkphS0JOTlJ6N3pPS20y?=
 =?utf-8?B?Vy9qUnBNbEswWkc2dnhaOEpQV3R5UHBsZXFpNWRDU2NGa3lZeGVmelNSY1F4?=
 =?utf-8?B?N0lMUHdVZW81Ull5aFJua0JFUEwzMDRjUm1BRVljd2IvOFBPK1hwSy9IZVc5?=
 =?utf-8?B?bGUyZ1hRM2NRdEYwSGhZaWFTc3pHMzgyZ0wvRlY2MVBFQXEybnRJZUNVYUhq?=
 =?utf-8?B?QW55VGU1SFZ5QWZBMkxsY0NJLzVlblFtOHpsWU9WVTlKcTJQUDZXUzVOTFhO?=
 =?utf-8?B?aVRNN0xLbTUyU1drelBUMGJ4T2VEWXpuOGNaajM4T3JLQS9UUUxCOTU2VjFa?=
 =?utf-8?B?SE1kOU11Y3lMcFdaZU1Cb3FGbTRxdHQxZktXT0ljNWhhSUNLWEhhbjNIY2hM?=
 =?utf-8?B?bURDSTZlNVpMWGtYTWlQemNaRlN6WGVUNExlL0Z5aXVZUEM5K0pPSnhDaDFi?=
 =?utf-8?B?d2pDMHRRVVE4SmJKbmZ2Z0VUck84NllVQUVSZVZQRXpEdnZvU3FWUjFaZzZL?=
 =?utf-8?B?M3ZxMUR1anFqb1EwWXRLcjU4U1JMdk1HbEd6Zjl0RGVoeEVUcHlEeVd4dmxB?=
 =?utf-8?B?Skhmck5wMnhFS2tUK21RTTBVclNrWVpzYzV5ajJWYVR2TGUrcTQxVDlIKzBp?=
 =?utf-8?B?NzhpQ1dWRVdJTGcvWVNLMnkzcjVKZDBxZUF0QUlrdlZIKy9FNE9KaGVFd2pZ?=
 =?utf-8?B?UTB3aTUyWkZwQWtGK29PRW5DdFBJZXRlWnUyWUJlYnRzTDloOXkzbkd4enQr?=
 =?utf-8?Q?Xodrkh6X8kMnu6LCukXGe7y5GLNXFniz6X?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 15:31:41.1071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 4887ceae-e55a-43b6-9d66-08d8b0c5d59a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9r9hd4NOXx5p+9jBMK7qNjhuZtYVd3Cu4RBqMcZLfkPPFdQlAdZuRwzI19ksZ12ZTmt51Yq/xMS6olXTKZtN7c1pyG1Lepv8b1VfaYQyyLU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3222
Content-Type: multipart/alternative;
 boundary="------------5F9CCAB360340EEDA280FB43"
Content-Language: en-US

--------------5F9CCAB360340EEDA280FB43
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-22 12:02 a.m., zangrc wrote:
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-aenum_2.2.4.bb => python3-aenum_2.2.6.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-aenum_2.2.4.bb => python3-aenum_2.2.6.bb} (63%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb b/meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb
> similarity index 63%
> rename from meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb
> rename to meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb
> index da77a5c75..061770a93 100644
> --- a/meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
>   
> -SRC_URI[md5sum] = "8983562361efe5be865617341dadbb9b"
> -SRC_URI[sha256sum] = "81828d1fbe20b6b188d75b21a0fa936d7d929d839ef843ef385d9c2a97082864"
> +SRC_URI[md5sum] = "52ec17f5efdfa13952657fe954cd6d99"
> +SRC_URI[sha256sum] = "260225470b49429f5893a195a8b99c73a8d182be42bf90c37c93e7b20e44eaae"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------5F9CCAB360340EEDA280FB43
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-22 12:02 a.m., zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1608613348-66835-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1608613348-66835-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-aenum_2.2.4.bb =&gt; python3-aenum_2.2.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_2.2.4.bb =&gt; python3-aenum_2.2.6.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb b/meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb
rename to meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb
index da77a5c75..061770a93 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_2.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_2.2.6.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://pypi.org/project/aenum/">&quot;https://pypi.org/project/aenum/&quot;</a>
 LICENSE = &quot;BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9">&quot;file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9&quot;</a>
 
-SRC_URI[md5sum] = &quot;8983562361efe5be865617341dadbb9b&quot;
-SRC_URI[sha256sum] = &quot;81828d1fbe20b6b188d75b21a0fa936d7d929d839ef843ef385d9c2a97082864&quot;
+SRC_URI[md5sum] = &quot;52ec17f5efdfa13952657fe954cd6d99&quot;
+SRC_URI[sha256sum] = &quot;260225470b49429f5893a195a8b99c73a8d182be42bf90c37c93e7b20e44eaae&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------5F9CCAB360340EEDA280FB43--
