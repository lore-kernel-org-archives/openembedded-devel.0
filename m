Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.42])
 by mx.groups.io with SMTP id smtpd.web11.76.1615992736738344140
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Mar 2021 07:52:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=al4MUS+l;
 spf=pass (domain: windriver.com, ip: 40.107.243.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GnkzCcwlrxsdxmXCUe6C1f8qoVXzAbGSGlc+RsdXpCdqt5y+3i+Hx7lNx9NcxzfTW5GnECFriBQTviOO++xI6EDUCEBcRe5ZjvJsDhZCa1xZyeHLu3tgHACLp47LJisvVyWDIQHVaR9qVPwyv1h9DkD6hKQo0fR/zJb1K9lek/gLhGmnuJICueOMuPdcZIl7NP0s2dVSnu51UpKliRV0G2ryj16CJwitO7eYrxdxIKR9r9Mrg2/As7XirjmUBoj1ly93Na2lPyJRtOChSIPqLvOMr7QEv6ZkRFjcFQCvo3/Hs3PLEYXA5S81WqhUBtCj+bCSvZQTvLw5L9E0OSGZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4V3CdyD1R2jtodJu/5Nv/zstLbgqqjPxot+EBGvwkI0=;
 b=VZL2hzCVGmfZNgjsCjBDMKAeBsw6MjxWhp0enkqSjbEzT7rriSlq8KbxWuJm5BgF3U/nUy7G6fLemzxwYXpkVUfVYVceDfRNOVPGXf9vV24V5fCblIBCrp3Y64JpRY1Q4siuGjsUrPmuh1OhdN8U9cTI7SM5DQ3pWNjjISAfkjb6QbqSMJvzdab0A+PdewSiCYmO5VmDcCJcaUsT+aYqDBsXN2BUzCNtQsrLPb4KYJS1U2SsYHrK5WAPc/+JLcbsmsygJ2barOESf1FKYliu0lPV/vK5od9Ob3vY42XKXb3vJiKInoCg8RqO1Sp/mbYqrPYmuoC22so8mzh2pamtHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4V3CdyD1R2jtodJu/5Nv/zstLbgqqjPxot+EBGvwkI0=;
 b=al4MUS+lE/KX6nbRNnTLmzgBStZB/TQWp8gi2B48hnZfynTlsmZgELIaodD6GVgwnvSL6YJT/hXaP0pkHpCbqqPKw6PLHrGbmBYkLtXGS/GbYy/X6xKBzmlwo07y9yzWZeLNIEWGJMz68kWfKF25vuo7y0hVQXqJ60mQgla9cwo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2840.namprd11.prod.outlook.com (2603:10b6:a02:c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:52:15 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:52:14 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-pymisp: Upgrade 2.4.138 -> 2.4.140
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210315084727.26812-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <1322b20e-642e-0d9e-74b8-c60dfb162c6c@windriver.com>
Date: Wed, 17 Mar 2021 10:52:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210315084727.26812-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR13CA0066.namprd13.prod.outlook.com
 (2603:10b6:404:11::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR13CA0066.namprd13.prod.outlook.com (2603:10b6:404:11::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.9 via Frontend Transport; Wed, 17 Mar 2021 14:52:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d5ea08d-4d8c-4513-01aa-08d8e954409c
X-MS-TrafficTypeDiagnostic: BYAPR11MB2840:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2840BE0C51AB584B8F24A1B19F6A9@BYAPR11MB2840.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qKofYcVCKIKq7P9gm2ZBj2V+oewsWoThZVbjHgOHRaOGBvGY7aWP8dd5Tb1moKwHbuVynVLAda9i3vafZ6FA00ncmluBn5p4Pr49D7wYvdc3XvzZ4GHnu4EhOPDuEvLqC/sfa4Nll4cyz6XhbXSm26RJzUCN4eoaDS2Uq9fkhiwZkXQBCq6tdodh99N9azCzsiHfFj8pdT+CQwgtJ/ab0Yf6youJVMlZzhdAdsA+OcAfGuWyrJO3xImjdfyWemi33TGZ/HDAb/hJXC3LRu+VjnUuv3jMZa7ZNr1cUpKMEJy5e/L1tMbg8PEEL2vpEQHriYGDEuFydcrIulsj5/IDK84kWroQ1EnqPUMJczhoirUI5l5Au1OZDOo9EokdEP7qd7BcgXgkX9mLCvoPbKplHSlovmaJ+M75KV1jJmgcNqzSRzebzLjv15uFdT2yGqjq7PkXsaEQVpgwjFGIf+Rr2Ad33FCsxrzmjaWyybaOILWz7EsubE3yt23Q0GHRtOwPmsL1krfeMXTQux5gCfDyIXCg7n+l1wpoW4JbXIR8cTP/G0dYbBHgNITgy1ap3FfERaaJmiGSXLEvlYZzLYhnrJ/2YeAmXsTI9KQ6hMoV2T9stuoGkdaHgYtNOY5rDFgvCsgOvVFOjkipBEWSyl/sumaCyO7ybehmWdVNtXc+PQJfGpmAtMrGPPdYAC7uLiTdJJBPpJcRKJFqJvbgMPlrxtdVdV1DHtrkGBlWAScOVNI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39850400004)(396003)(366004)(16576012)(36756003)(956004)(53546011)(186003)(83380400001)(33964004)(5660300002)(8676002)(31686004)(66946007)(2616005)(478600001)(2906002)(66476007)(44832011)(8936002)(316002)(166002)(26005)(6486002)(16526019)(66556008)(86362001)(31696002)(966005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NmF3RkpIbGFrNUwwK0FOaFlFMVBLYXJGRFlwTGNRbTJZbFQ1VTJWL2tNZE1h?=
 =?utf-8?B?ZDZUN3JNY01QMzRpakpWcVJSaHphY3A2Z3NkOVU3Zm1rb3dNME5LSWlHYjY4?=
 =?utf-8?B?b0pVYWZRMTJuRjdlaWEvOVJnMU15dkV6MFhUVTkxTXVINDF5VUhWai9BbjhK?=
 =?utf-8?B?MVg1NGZDZDA3NDQ1aUtZaURQSVJuQkliWGwwcUd1OFRCVHJWRG5tUHltUmJ6?=
 =?utf-8?B?NnFBVFNyN2E4MXBrdk9FUWdzbC9LRGpISGRNK2txVm5WelRkOG5JV0RBK1ky?=
 =?utf-8?B?WWp2by9YenY3TWNMMjFIaE9ndWIzR1dJUWU3QmZIdlVwMnk4blVseFBMa3N5?=
 =?utf-8?B?M0pxOUlDVDFWbkIxSnJCUnIxS0ovMkttUzNTTXZ1WmVPWHNVRlNkZ0srcVVZ?=
 =?utf-8?B?bFlkK0lkaWduaDJ5Vjcza2s4aktDMXpMMTJxSDVlY2lLWGtRaUUrRGFXbVVi?=
 =?utf-8?B?aExIcjJiS1NsVG02aUZSK2pQWWZvNzcwTE10M1poWCtUUS9hVmJGeWc1N2VU?=
 =?utf-8?B?S3ovWlBPV0czaFlIcHdoRWlRZzRoTTZ3ZmNMaXg3Ni8xWjBQYUpBaHYzOGIw?=
 =?utf-8?B?Ui9kWWQ3T25IR2JRcWVkZjM4U3pLSXMxS2pJcFNXb2tJUE9VM0EzQ2hzYmN5?=
 =?utf-8?B?V3JQaXBBZlhpUGN4SERPL0swSDJVR1RjbHV5TGtRL295WUZ1S29ZaDl4bTZ1?=
 =?utf-8?B?alZFdVpQMEdLeEhrT0w1bE5TYUZrRitYbTl3Q3J5a3ZYdFYwTXlCUHBqVVY2?=
 =?utf-8?B?cXJYbVd4akpkWjFFSFVLeXlyeDVWMWJ3WFVRVnNRR2xjMmErbXlyRjJmNEpX?=
 =?utf-8?B?V2Rlcmg5TnZpdEhkaUxCbTVjWHdTLzZlemVUaDVSeDRzcmQzcC9FUjU1dktO?=
 =?utf-8?B?TlVGS3gxNG9US0syOWk3dXdJa3RBMjNSOUM3VTc5VVdSb3U1REhrUjE5ZkhN?=
 =?utf-8?B?V3pDaWZUNFFsOWt2dFpYVWNRdjdLWFQ2VG9LWURQZUN4NTdzclA1SG1RVThj?=
 =?utf-8?B?L1dsT2JYajQxZ1RqVG9zOFUxNEwyc2hQa252R0piUHBOYi9RbmwrLzNWNlBS?=
 =?utf-8?B?SHJJNERPdWEwZmNnT1BaOVJCUjNWSmgzeThoYUN0L25KWFBYa2hzV1BsaEUv?=
 =?utf-8?B?aG5GQzRrbElkS25FM3ZjL1hKQjBHUmxMSVk2b0ZpREwxUkFHSnA1eHRPYUtM?=
 =?utf-8?B?OXloeHE1Z25pbXpTN2tNelRwaGdyWjlwM2w2Y0hBN0FyY2JITDBndThPMUFW?=
 =?utf-8?B?N1VGbnJldVFpRzE2M0U3eHIxTnZwdGk5d1dmMm9GZFl0V1M3eit2UDltd3ll?=
 =?utf-8?B?TXlZald4S0J3azhNY3J4SE5keTREa0RxTG1mQ3VvclJmK0l5dEp5L0MvVHd1?=
 =?utf-8?B?TzM5MTJUL3pIY3dET05YTVJweml1ekEyR1UrenhleTFyYlpCZS9hZWRpSFU4?=
 =?utf-8?B?bVh2VnZHTDk4a25Janl6ZnJNVTBkUEZXQWtNOE0xV0JFSHNwemVpWThSZHJy?=
 =?utf-8?B?SGFEcHg0YlBya3JmaUpJRW0vS21iWFBJM0FqbXBMdEFQWWlvcFdyTlRTc3Vl?=
 =?utf-8?B?dmVCc3o4dzJlbkNxNjl0VmdQd1BwV2o4UUswdU1kL0FPbkg1NlBPQWV5emww?=
 =?utf-8?B?amZ0cHVlM08rQmhUNGlQUGMraUIwQ01sYkphcDhaKytmV0l2cXV5M2J6U1pq?=
 =?utf-8?B?WHVVM3grb1ZKaEw0YVZVa2hRUS9hQzZjQk03QW5NNmsyRGRuSVZsTTh6azk2?=
 =?utf-8?Q?UYSHOtLOxbYFmEM2SWIrvkoJIqCUHYvGCyM7gm6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5ea08d-4d8c-4513-01aa-08d8e954409c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:52:14.5524
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loSGqlLD9gP3jfM+CSjITOEPHsLDdsUzOTNRzWDAjaMgh25lvY+4e5yzw4pwVYYkF0FXFTQgjBnDUD/4SaNva+r7v5SvfXSl0HqHlt552k4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2840
Content-Type: multipart/alternative;
 boundary="------------5051BD01ED8BAF6AB571C283"
Content-Language: en-US

--------------5051BD01ED8BAF6AB571C283
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-15 4:47 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 2.4.140:
>
> - Soft delete object in MISPEvent
> - Add in ability to add a new cluster relation
> - MISP Galaxy 2.0 capability
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pymisp_2.4.138.bb => python3-pymisp_2.4.140.bb}    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.138.bb => python3-pymisp_2.4.140.bb} (91%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.140.bb
> similarity index 91%
> rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb
> rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.140.bb
> index eb7bea834..32e673660 100644
> --- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb
> +++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.140.bb
> @@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
>
>   SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
> -SRCREV = "9316420dc028a1ffc541986fc08793e669f2165e"
> +SRCREV = "39a7b8242f0d3022276d417ec334bb46b890ff23"
>   S = "${WORKDIR}/git"
>
>   inherit setuptools3
> --
> 2.17.1
>
>
> 
>

--------------5051BD01ED8BAF6AB571C283
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-15 4:47 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210315084727.26812-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 2.4.140:

- Soft delete object in MISPEvent
- Add in ability to add a new cluster relation
- MISP Galaxy 2.0 capability

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210315084727.26812-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pymisp_2.4.138.bb =&gt; python3-pymisp_2.4.140.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.138.bb =&gt; python3-pymisp_2.4.140.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.140.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.140.bb
index eb7bea834..32e673660 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.138.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.140.bb
@@ -4,7 +4,7 @@ LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20">&quot;file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20&quot;</a>

 SRC_URI = &quot;git://github.com/MISP/PyMISP.git;protocol=https;branch=main&quot;
-SRCREV = &quot;9316420dc028a1ffc541986fc08793e669f2165e&quot;
+SRCREV = &quot;39a7b8242f0d3022276d417ec334bb46b890ff23&quot;
 S = &quot;${WORKDIR}/git&quot;

 inherit setuptools3
--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------5051BD01ED8BAF6AB571C283--
