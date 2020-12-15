Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.88])
 by mx.groups.io with SMTP id smtpd.web08.13090.1608044546411013623
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Dec 2020 07:02:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=o8qrS0z6;
 spf=pass (domain: windriver.com, ip: 40.107.77.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ex8im99/LVvfzfQnfPd4waEvA4zk4LU50a8vDa3rpicbSjWGN+N+5zS+qRtXThS5BeBDewXFXbFkj7MiutLAMW5+aD1+M4hAZfy/XnNuDH/G95brLQcXn2qFNrZe4Vz6zKIwC/+FfL0zOvpASGuQgWdzo4glO4UzNVx5XNaehs//Ro0b2eMeDaKBvkHtwU7peHdhyEMNCuwv3NZdB9NwEORNssS6XohBxLp4+eWxsu1l+98rckeZXvYExoQUxhZ9HUtNWRTTB+0yaXf5p9Wk/6nBSCPAc6g/xZpLGDmKvncqpPCdFScSW7LLvtEbe6p+gt/KaQdha5jQtb8BE8MaUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mom2homQKYhV1IPvfQ4GxgdJcLbMDy5/ZiFmkPWrzqQ=;
 b=Q0QcTfAmL4Vo4OMvvlzkbzAEtAacUOhWF4ijFJa+M9nyU6MgHdMu5Vn//DNchGRWmoh2Zp6Id1RfuI5RO5jnlef52bMHngYPEi5jX9ePe4wrph5OXgGYsLwMZ/f1aR9CfZuXRnvRuVDnpn1hF4lMgu0Z/naP2XDszokxUKprvc5lhLurBIffFdCoWCKQT1CrniVMusLaHHA/H+viGzcAlLFSpdPU+P3kG/HxOSkYM0Lo/Yc2Y9vQ8aGDL/7GLZIsWxV9gaESZO+7IHG7a21IPE0uaIzp8Q75Y8aW6HfgkVOpMRUtNi4teswTwsAOVSicwiKQpHNqjCttBUdHIm2WGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mom2homQKYhV1IPvfQ4GxgdJcLbMDy5/ZiFmkPWrzqQ=;
 b=o8qrS0z67q2EhxZj8MiDFz31AuPVxlzmku+qPIyyl+qMaJ0UPlYSV+QjUf/dTs6E7mQh1+PmKYEULxEdrXFvDCZLv95XLTeMii8UMlhCaApajowmSks0UHqgI2bJ+oOObzJtvu9fmChgHteSSGa2fSbG+6n5o+ScEj9FYkaSI0c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2728.namprd11.prod.outlook.com (2603:10b6:a02:ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.15; Tue, 15 Dec
 2020 15:02:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 15:02:22 +0000
Subject: Re: [oe][meta-python][PATCH] python3-requests: upgrade to 2.25.0
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-devel@lists.openembedded.org
References: <20201214014026.37770-1-Qi.Chen@windriver.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <649d6ee8-034e-848c-8b80-18f75e31d068@windriver.com>
Date: Tue, 15 Dec 2020 10:02:20 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201214014026.37770-1-Qi.Chen@windriver.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:c0::14) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR05CA0001.namprd05.prod.outlook.com (2603:10b6:208:c0::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.9 via Frontend Transport; Tue, 15 Dec 2020 15:02:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 900e655b-bdc2-4a6e-5bc5-08d8a10a6d59
X-MS-TrafficTypeDiagnostic: BYAPR11MB2728:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2728CCEDF676C5C897090D559FC60@BYAPR11MB2728.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JImtJWGIKQ6BMNdJ7xtYz7tpEJ0aHPY9iWq1RkdzIy8+Kk3UmPOkQWt3x0vcMPPFNSmCxwxyXXQDWIk5gmHO3ZocOxrg0+Le6oul0dChwUXowM0+xrJG5ymD5o1I/x3M+oRKhXSuU6ecp9Anl876BrpXRH+RtwE8xAW2VlvXEQexKptMZdy8D8cVyZPZygnazSIKcy25Z4gig9i2G6DWj4bcFvnRBUX1Diri940GypsQXFTPXWWm/bKoHfEGuIa7qknPJS8+P3OnxqwASw5MYcl/fBElOphcE9jDrq19alLQURvsGCqNY72tAZWcgNvspHmPCgJUFoNe69a49mwW4yHuej8JiTXvdmP42shD8r1r418f/PBMIhmJ+VUt6yPYFY0bcxHlM/7uioKg3+RdXVnV55Cdlr5BTdPi9pV9N1gH4c/SItWxDJ/NccQ9Rgy38cfY8w3zI3ieN0DamwpPlGcJJmfvOQdFz98QSkXIv74=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(8936002)(33964004)(36756003)(2906002)(4001150100001)(498600001)(83380400001)(66946007)(66476007)(31696002)(53546011)(86362001)(16576012)(44832011)(31686004)(5660300002)(52116002)(186003)(956004)(166002)(66556008)(26005)(16526019)(6486002)(966005)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NTJGcEU1KzNSejdWdG9RdXJadUNKSlAvcitiT2lmVWlBSUgydHhXRGNaQmNm?=
 =?utf-8?B?WHZxcWpGQUJTc1ZnT0ZsK0JERERLMlhPVkUvb21LZUNqTlY4NHBPSExiVk85?=
 =?utf-8?B?Y1hQWTdzZlRpZTIrUlpCdmxRUHllcUlDMVF2RGRGWmt0RVpSUlgvR0EwelNS?=
 =?utf-8?B?Z1JFR1FYbjNyZWlKQWJvSCs0YjQ2Ujk1TnR6ZWVDaWFSdWlTeDRqWE9Dd0hG?=
 =?utf-8?B?SGFISTlFOHAwNS9YZFNtNFZxK0dNcDdUeFkwbGZxYnZaR3ZNWXBiWHdNUWpx?=
 =?utf-8?B?TWd2NUluSWlJUFpMaElXT01Ob0E3OEZuckU1M1dhRVh6L0NjOUNSdDdzVDRD?=
 =?utf-8?B?Z2x2WCtKcjNlVUtUZ25qNDByUlFBSkNialFRVm9MS1dQUWZuNGNJOGQzS3dF?=
 =?utf-8?B?T2VjSHMwR2ViVXJDaXdSM2s5N2JQTXo3eXE5eEhCclVzR28vMC9Xek5ZdFZX?=
 =?utf-8?B?RXdPOXBqbE5aM2J3MU9jdkwyZDI1cTZIUElETkh1VGRTT1g5VnhseTBLRnEr?=
 =?utf-8?B?RW0wVnNxQTh4anFzem45Zm53RFh5ZU1wQVFLL2xzT09WblFkeTJyblJqUHJN?=
 =?utf-8?B?d3FhTGl5Z2ZVUEZyVnBaekQ5YUtsZFRreE5ETzJ0RnJ5WURLWUw4NzI3b0hC?=
 =?utf-8?B?SWRJcUtyMjlrTkNmc3FEVGFuZGQ4eVMwbG9zU202WHBjeTVoK0t0dFEzMWh4?=
 =?utf-8?B?QXRDSHFSS240NVRlMzVyS2R3VnV1Q1EvSnUzRUp0MWRGTUlGU245Z2NBVzNw?=
 =?utf-8?B?UmJ3WjZoeUR3NjlhL1g0RUQxUTl5bEtDb3MwMTBjQUQ5cUZPUnBLcXJGM25V?=
 =?utf-8?B?OEJ6cGwrQjVPZ0ZnVStMRGJrT05mcVU0ZlFoVWo1ME5oWEJFVU56b3QzSXlM?=
 =?utf-8?B?bmlTaGQ0c1IreW4zOWNxb2dPWlBTTlo0c2hCWWtWMW1DTGRnT2o2dEhiaHV2?=
 =?utf-8?B?b004SlZOZjFjMFRodmptWVdYQzJTMkFFb08rM3pZMzZ1M2NvSVh6QXF5c2hr?=
 =?utf-8?B?S3hJdEJ1NGNCcTIzdDFrSEIyd1lxKzNLZVF3bWFIT1p6WHVCLzB3ZTNHcy9J?=
 =?utf-8?B?MUthNnc5Q0tqTzEwN0VtT0lpdjhKbEptanUydUZNdW9qZVRvTS9DNHg3b0pT?=
 =?utf-8?B?RHBUZVdKWm9VcjlONXpBejFKVlcrVlhhN3gvalRMZ2VVbTdHMVRVdk9lQnh4?=
 =?utf-8?B?RHRUSFJwOHp5NUgvLzVHWHRwbHNwRDBPTmRKbG9rS3ZzVEdGOFhSUlZVK2t4?=
 =?utf-8?B?VG80R1duS0V1Ry8vY3dSY1lsNWluUmJ1U1N6ZzBpa082TGl1VHNrUjdWelpD?=
 =?utf-8?Q?YbgIYqBuvcOLflj8wi0yhbvwy+H8QzgPuj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 15:02:22.7923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 900e655b-bdc2-4a6e-5bc5-08d8a10a6d59
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Td0Nl8QSFUuPSkQ4SgGI7nRj9lLrdDQLku8M2FHJU84wSYVFv33ClOtPtO+2yRTx6ypZUnTBfXbXKkojcexkVGolbEYANjD5Bslr4jZmOD0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2728
Content-Type: multipart/alternative;
 boundary="------------710046BF53D6A2E05CA6650C"
Content-Language: en-US

--------------710046BF53D6A2E05CA6650C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-13 8:40 p.m., Chen Qi wrote:
> The License checksum changes but the license remains the same, as
> the change is only about copying apache2 license contents there.
>
> This upgrade also solves the following issue on target.
>
> root@qemux86-64:~# python3 -c 'import requests'
> /usr/lib64/python3.9/site-packages/requests/_init_.py:89: RequestsDependencyWarning: urllib3 (1.26.2) or chardet (3.0.4) doesn't match a supported version!
> warnings.warn("urllib3 ({}) or chardet ({}) doesn't match a supported "
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...thon3-requests_2.24.0.bb => python3-requests_2.25.0.bb} | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-requests_2.24.0.bb => python3-requests_2.25.0.bb} (64%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-requests_2.24.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.25.0.bb
> similarity index 64%
> rename from meta-python/recipes-devtools/python/python3-requests_2.24.0.bb
> rename to meta-python/recipes-devtools/python/python3-requests_2.25.0.bb
> index de9a53584..5284f9598 100644
> --- a/meta-python/recipes-devtools/python/python3-requests_2.24.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-requests_2.25.0.bb
> @@ -1,12 +1,9 @@
>   DESCRIPTION = "Python HTTP for Humans."
>   HOMEPAGE = "http://python-requests.org"
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=19b6be66ed463d93fa88c29f7860bcd7"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
>   
> -FILESEXTRAPATHS_prepend := "${THISDIR}/python-requests:"
> -
> -SRC_URI[md5sum] = "b54bff26a389e5932e8b1c4983a99ce7"
> -SRC_URI[sha256sum] = "b3559a131db72c33ee969480840fff4bb6dd111de7dd27c8ee1f820f4f00231b"
> +SRC_URI[sha256sum] = "7f1a0b932f4a60a1a65caa4263921bb7d9ee911957e0ae4a23a6dd08185ad5f8"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------710046BF53D6A2E05CA6650C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-13 8:40 p.m., Chen Qi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201214014026.37770-1-Qi.Chen@windriver.com">
      <pre class="moz-quote-pre" wrap="">The License checksum changes but the license remains the same, as
the change is only about copying apache2 license contents there.

This upgrade also solves the following issue on target.

root@qemux86-64:~# python3 -c 'import requests'
/usr/lib64/python3.9/site-packages/requests/_init_.py:89: RequestsDependencyWarning: urllib3 (1.26.2) or chardet (3.0.4) doesn't match a supported version!
warnings.warn(&quot;urllib3 ({}) or chardet ({}) doesn't match a supported &quot;

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20201214014026.37770-1-Qi.Chen@windriver.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...thon3-requests_2.24.0.bb =&gt; python3-requests_2.25.0.bb} | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-requests_2.24.0.bb =&gt; python3-requests_2.25.0.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-requests_2.24.0.bb b/meta-python/recipes-devtools/python/python3-requests_2.25.0.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-requests_2.24.0.bb
rename to meta-python/recipes-devtools/python/python3-requests_2.25.0.bb
index de9a53584..5284f9598 100644
--- a/meta-python/recipes-devtools/python/python3-requests_2.24.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests_2.25.0.bb
@@ -1,12 +1,9 @@
 DESCRIPTION = &quot;Python HTTP for Humans.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://python-requests.org">&quot;http://python-requests.org&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=19b6be66ed463d93fa88c29f7860bcd7">&quot;file://LICENSE;md5=19b6be66ed463d93fa88c29f7860bcd7&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658">&quot;file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658&quot;</a>
 
-FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-requests:&quot;
-
-SRC_URI[md5sum] = &quot;b54bff26a389e5932e8b1c4983a99ce7&quot;
-SRC_URI[sha256sum] = &quot;b3559a131db72c33ee969480840fff4bb6dd111de7dd27c8ee1f820f4f00231b&quot;
+SRC_URI[sha256sum] = &quot;7f1a0b932f4a60a1a65caa4263921bb7d9ee911957e0ae4a23a6dd08185ad5f8&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------710046BF53D6A2E05CA6650C--
