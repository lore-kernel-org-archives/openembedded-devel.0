Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.53])
 by mx.groups.io with SMTP id smtpd.web12.5270.1612511237706529165
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 23:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=oF6svZR5;
 spf=pass (domain: windriver.com, ip: 40.107.92.53, mailfrom: hongxu.jia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aQSmKSuMxRy4me+lbzera4QSFX5xZEeGxxm/syDaNuAO1uRtCMpa4M7gIjsIcGGs+s8GO72BwnvTUtgVGkrUQbMpG50IzlrRWx7qhUhdtCqvaACHPlfWVkaRdufHPGf7zjEnoHtdhXiTPM2SoBmvsU+EtRHOLbY9r3eCpRrfsPDNVLdiR72GXIdZa5i7kaaA1WKQg2Mg1DXIdh42ZXDtfiMv8j3DA8XvewNrpJWVPRrEmsAyiXZXRs9CFn607+6kF3hg76THjmCtDyMc9QYda7uVbcwezGG0Mz47qINWB6qrK100uOYST9cl7CRxpABsz6SHV5ZmIwjXfyogmYMy4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TeKRaeDqMimgW6LkOcy8SqVxN9/0+HPcToMywFle5Nk=;
 b=GA+I+myv05Eu3UlAbFP5L6nEx5ypHdkxWqV9iC5btWT1MgxCjIwV04C4Xb0JxXKA1HjaaCCODPWa8rG9lp6ZSx1pQqb+XRwNUYk3TLumDdFMmpRDPS/HY2T8XuO8OT+hnX3EDeM+zbZlnWbaF0sQLMVu1hfXAKqLGySI9swk9KpATeD6wZk0dPF3v7HgI1DY2mZ2mm59W4Xb8FsF8+6U+0skL2OZCyC0noCfQeyJbWkn0e7vzBZN+ughQYHMrQ3kUUqeWsSVDQhUG3uFUrKjF7o+0aa8paBgMRPqkivIIyfaTsGtRGT+98yyVKS9LuFZHscFJ9nMtzesbVr+4e6BBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TeKRaeDqMimgW6LkOcy8SqVxN9/0+HPcToMywFle5Nk=;
 b=oF6svZR50ZCT/BXIQso0NR0Gtx/hKP+ZhvGcSlvDCrTnd7yrHqr+K8lK8fR+IMQNSsEfHPVsgG1CQ8UfZ8J4k/tLT0UGImq8y/fqIilQMhFHpsvreuWO68L5V+it4cQT7LUdEAV7qAQIKEo3X9+y3EYgB1EEDdRELuB3ui4yxnI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB4380.namprd11.prod.outlook.com (2603:10b6:5:14e::20)
 by DM6PR11MB4266.namprd11.prod.outlook.com (2603:10b6:5:1da::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Fri, 5 Feb
 2021 07:47:15 +0000
Received: from DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a500:2ae3:a6c4:bc13]) by DM6PR11MB4380.namprd11.prod.outlook.com
 ([fe80::a500:2ae3:a6c4:bc13%4]) with mapi id 15.20.3825.020; Fri, 5 Feb 2021
 07:47:15 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-pykwalify: correct runtime depends
From: "hongxu" <hongxu.jia@windriver.com>
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
References: <1660C91F14F71880.2338@lists.openembedded.org>
Message-ID: <a5cec45e-c603-3ed7-6b5e-fe9801b80eaf@windriver.com>
Date: Fri, 5 Feb 2021 15:47:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1660C91F14F71880.2338@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0302CA0012.apcprd03.prod.outlook.com
 (2603:1096:202::22) To DM6PR11MB4380.namprd11.prod.outlook.com
 (2603:10b6:5:14e::20)
Return-Path: hongxu.jia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.131] (60.247.85.82) by HK2PR0302CA0012.apcprd03.prod.outlook.com (2603:1096:202::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend Transport; Fri, 5 Feb 2021 07:47:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: caa11458-f74e-42e2-f972-08d8c9aa416c
X-MS-TrafficTypeDiagnostic: DM6PR11MB4266:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB42664BC0C6F62FAF75E649D994B29@DM6PR11MB4266.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5zHY4DrWRfFQhp+X+0548EjaLqTOWc0T48H0o8tWleBUHWDM8TNvGZlSG61WBCGnyk6gJ+n1lXj6ktGgxa6sDYprfHkBqp/4RKZAaYWDllgwUtPQPXoMXpcOJUEr2Nr+cdH59HvlNNpuSgH6YnvgGLwdfODK72a8QOomZKCvuWkWOLNiTp79lKC306Cm8o4n3NEuxBNAaTM8Y4pU8q4sW8OBJsB5Qsge5lGw75mVhM0g8mMIYeZGjbS95viYfsJCvnN6Svi/IkhPugfV9ufbNeykglH9KRcpryiy5kdCcoYsewKgUV5Y002A3PNyQuntTxAU7TnI2sRbVcOQG63L5Q6JLItKL6azcf8HaIdsVqNUUpKfnnpv00ODR6//eFK0GVUm/YVIlN6rssr+A49lRE3FyBIFlPa+rf0jw5r+h6g6QuMkLwiHG5BEysCw89FTTA+BAchPK/Ka0/8k83bCPYm3Z3+OgAuQiug1hCiluo6NzQDD+Fmmxjj7eIr58CsG3kwsyzwAJy7eq0Kh0FOe5fQfqoSwOAEGXTebqiN1fPRag9vTYpNXegaajYEFT4G8/uCVNsqyZ33mSqAzSECQWb1uYG95CksObsZEzauQKJ2gryT595tuBbupt1QOts1mxhD7X+RsVhxmozyxsWX3t5G7L12F07U+yVUX6s4NK9waPe1T+nXFW/jz6aAXhDRyExQqjUsnfLhhcmLDKIvNaw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4380.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(366004)(376002)(346002)(396003)(6666004)(31696002)(316002)(4326008)(16576012)(6916009)(8936002)(66946007)(44832011)(36756003)(86362001)(31686004)(2906002)(6706004)(478600001)(52116002)(6486002)(5660300002)(33964004)(966005)(26005)(83380400001)(956004)(2616005)(66476007)(166002)(66556008)(186003)(16526019)(8676002)(53546011)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Q3BRcmtqdGx1bWJESkJVM2d6VjgrOFRVRzh4UitXUFJpeXJVb2d5S0VVVFFB?=
 =?utf-8?B?NTVTUHJqUVB1L1JXK2JDRnAyelRySjZ3aW5NMW1tWGEraTdVbUI1WDNDTGt0?=
 =?utf-8?B?KzU3STZlT2xsWlVHZzJ5aitQU0RyTWMvdHo1N0FrT2VQVkpBQ25zUVhQb1B3?=
 =?utf-8?B?aEhtVkphWkZWcTBFeXd4Y29JSHcvOGhqNmRDcWlYcGk4N3ZZZFhFTVk3TEUr?=
 =?utf-8?B?cXpIRkhhR0swakhVMGsrMnkxWndyUFl5RE1ueDFKQm55SFR4UzUwSzdUVGpE?=
 =?utf-8?B?VE5OdURQKzRjaWxUdFcxLzRXd05tSGlyYzRrVWZZRVk5RVhzM0FpWm0wdnpH?=
 =?utf-8?B?WUpZL1Y4S1k0ZFZQeE9SNWw4YTR6c1ZCVTYxMmpRSVpaZW90MU5wK28vYTBS?=
 =?utf-8?B?VmVDdUxQRzhVVTlvWUNVQ0twWXB4TFpYamliRkZCamF3akNnd2hNZldVUWkx?=
 =?utf-8?B?Zm9qTXkyRmpMVVNjU091QUZhVTVlTGFsYlkzNDV5UGEvdTcxdGJEK2wyUWFO?=
 =?utf-8?B?dlk1WGtlaDdSYjFKWlRUQnVORE9wVmp1Zy9yendodml3NkxhTk53QWNiQS9x?=
 =?utf-8?B?bnI1bUttVGpFOXlFb2FiOWZaSHZkdFlEaS8rK0lHL0JIWlZYVjBvTXE3MXFE?=
 =?utf-8?B?aUVIeVlLU01DZ014M1o1eXdUMkkyNjAvb1hqc2RwQkE3Mmpnc2wwYXVrY043?=
 =?utf-8?B?Mncwb21zRlMrZElhMklycWVSQVloNGhtbEVDTmVyM0J6d2U1S004YStuTGR1?=
 =?utf-8?B?aU9obkE2ejdpMmhSaTB6TkFRVWVKRG5CWjl3Q1kzUUZGK1E1Vm9TL1Avd0Ny?=
 =?utf-8?B?QlQvREZQUEUzTHhpdjBrbEZyaU5MbXZ2bWYvaTdqbDZFN094NUJQcDY5bkxK?=
 =?utf-8?B?R201Sk92amRkS1FtUDU5cFcyQW1razZyYzVLajg3NU1zeVQwRVZodE1Eb0pj?=
 =?utf-8?B?TXhFU1hOMFZhRi9wSWhCd2lTUTBmZUxGUnhrODZuVmc4cHA2dy9JLzBHTWZw?=
 =?utf-8?B?MEFPUDFiT1cwa0xNN0l3Z3drV09XdjloT1VXTXVNM1NMWEhYc3BsWEg5U3VG?=
 =?utf-8?B?cXo1Wi9lM2JHZFBPS0VoejY5MEtQQlg3T1pMaEhKU3RFbWQ4cGlJS3pYMkJl?=
 =?utf-8?B?SXdDaS9wTUxPa3htSzBWV08zZnVBZk9ib3p4YVZ1L0F1aWtEWFZDSDVKOFRT?=
 =?utf-8?B?ZWZJS1IrWUtMcm1VbnJnb2dQd2Q3QmNpZndLQWZRZkxCSWNsL01SNnduVUZM?=
 =?utf-8?B?OEk2SUlwUlFpbGhlZzBKMjkwNXJxYU15K3RkZ05WTmlJa1pLUVZXdUMwallr?=
 =?utf-8?B?RU1Dc1lmOXlYeGRETFhHQm9zL1RNZmpVUjlyd1VZaWlpNXY5MnhPSjVUTVY0?=
 =?utf-8?B?SWphaEEzSWhTS25Vd3A0TUxSUTlPZllDeE5Wb3AraXN0S21kQ0hWa3JBYVNs?=
 =?utf-8?B?THR6di9LQ1JTdjRoOGhVTHA5dy9YRUVFQlZYdllzV1IxVnk4WW5qL1grVFdL?=
 =?utf-8?B?SWVYT20wSGtaNC9ZK0szWlJDUmkxeDJvc0xYRVRlV28zSXM1SkxDNTdnTXBF?=
 =?utf-8?B?QmVjQ3N5Nk5xVXlXSk5aQm9ldVhUNVR5aWlRK2JjR1ZzN2UycTVtR3hDOEZI?=
 =?utf-8?B?TkVIWXlsTjJJWHp3bFkzMmhDWktmZXg3Uzk5K1l6V1l1OTBWSGdMenJnNUt5?=
 =?utf-8?B?dGIwM2sya0VpRmZweWpUd1ZGMHUxWVJsTWdlL1RjNEpXSlpkTFA4WnM5bWgr?=
 =?utf-8?Q?SUSYoelgZqY1hkPh8AlwuZFHDOpTpFaLyvUv9kd?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa11458-f74e-42e2-f972-08d8c9aa416c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4380.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 07:47:15.5647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lTZb8fkPFjh7iLuN2YIOxGGkajuh/WQ21icOYjH4hLFK+a8f93//hq89IzvBUGtkKR18ioeZqEp/2+dACsKOnH6Uh7MpwbgEL75MpQjUDJM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4266
Content-Type: multipart/alternative;
 boundary="------------C260103AA98284ECB1C859F3"
Content-Language: en-US

--------------C260103AA98284ECB1C859F3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

It is duplicated with [1] in master-next, please ignore it

[1]
commit d43b53d381a56a6db80e2d2427d07c18d4be1a1b
Author: Ross Burton <ross@burtonini.com>
Date:   Mon Feb 1 14:51:49 2021 +0000

     python3-pykwalify: fix RDEPENDS

//Hongxu
On 2/5/21 3:23 PM, hongxu wrote:
> Since upgrade pykwalify from 1.7.0 -> 1.8.0, the ruamel.yaml is now
> the default and preffered yaml parser, correct runtime depends
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
> index aa14cdd4b..4d4d2b79c 100644
> --- a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
> @@ -13,7 +13,7 @@ inherit setuptools3 pypi
>   RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-docopt \
>       ${PYTHON_PN}-dateutil \
> -    ${PYTHON_PN}-pyyaml \
> +    ${PYTHON_PN}-ruamel-yaml \
>   "
>   
>   BBCLASSEXTEND = "native nativesdk"
>
> 
>


--------------C260103AA98284ECB1C859F3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">It is duplicated with [1] in
      master-next, please ignore it</div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">[1]<br>
    </div>
    <div class="moz-cite-prefix">commit
      d43b53d381a56a6db80e2d2427d07c18d4be1a1b<br>
      Author: Ross Burton <a class="moz-txt-link-rfc2396E" href="mailto:ross@burtonini.com">&lt;ross@burtonini.com&gt;</a><br>
      Date:&nbsp;&nbsp; Mon Feb 1 14:51:49 2021 +0000<br>
      <br>
      &nbsp;&nbsp;&nbsp; python3-pykwalify: fix RDEPENDS<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">//Hongxu<br>
    </div>
    <div class="moz-cite-prefix">On 2/5/21 3:23 PM, hongxu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1660C91F14F71880.2338@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">Since upgrade pykwalify from 1.7.0 -&gt; 1.8.0, the ruamel.yaml is now
the default and preffered yaml parser, correct runtime depends

Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
index aa14cdd4b..4d4d2b79c 100644
--- a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
@@ -13,7 +13,7 @@ inherit setuptools3 pypi
 RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-docopt \
     ${PYTHON_PN}-dateutil \
-    ${PYTHON_PN}-pyyaml \
+    ${PYTHON_PN}-ruamel-yaml \
 &quot;
 
 BBCLASSEXTEND = &quot;native nativesdk&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------C260103AA98284ECB1C859F3--
