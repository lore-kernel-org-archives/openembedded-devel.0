Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.42])
 by mx.groups.io with SMTP id smtpd.web12.66429.1597759575160085849
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 07:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Re+VGW+n;
 spf=pass (domain: windriver.com, ip: 40.107.223.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7ZggxCaB8qhbtm4unUS0pWl4ifar+5a3dFqctFOuWN2YUi95kb8E6RXSHAAM/MoJLczm/hv/BKGOSIWQthtFKypU/XAhu5yHJUyxwKUmi4GdPWm2vsnWTQ/t/3ga0G4eHCImNIp6aRv4BHebU3HWNbuYw4HfBxi6gSZYjAc7bCfVXApkTlQf+hMZGfNjj0sDRqYYFCZykBw4Vv9wR77VaxTzbNZC72pqS+NsXSpMNSQiWdVD7w5G+wYg+bkL7z12CpzTwZ/7/Q5w/l0OTicK3bn24v/FXEViZr08P144tfcYoiYaTMRAkBhPQaYBQA8RqgA3CKrEUAYf54cWZdDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKEK4s1MS87GbVhGvMu3NTA7UizcNcx1PBNwSdOgf9k=;
 b=HYinrEYbgJkoYp1DicPU7BIPKuqcD4x9JVzpCXq3B7Fi/xTWHW3b6x+1bsKY3IsvKnI2r6JdmH7dA0wHdSr6SNtO0p9MMphml96iDDABiecCpSaCvs4RBUtYW2WDz3vILTrOB43OR8kjwghtmFKmP4Tl+xTEPv1EZ/ZdU+kz9xRaHAgiSPzwBsjW19a9xumuct2VLh8zG5Vyc0LjvXHjuI726A0Qx+YDXLimRLawBOHUp7F8TFqhXJCiiLu1zF5ps9SjyHnYSZzoAN0xpy3T2Xmw3kOk1RNbMxT7xHfXJqBEf4hd/78tr01qAZvBx8LZuUenZ4Oks7ItCelE4CASpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKEK4s1MS87GbVhGvMu3NTA7UizcNcx1PBNwSdOgf9k=;
 b=Re+VGW+n/oZ7SLEwsac2qc4fB+lyEkPG8Y7hnWV2G5revz0k/YQgN0/p286IlgFlGtBGpfcztKQFFgfwiqOyT9u2UThgArOAD+8TBa1dLp1RiA8wofPeYVbF8Z5X0bOjhaSZZHwz65M8Ba5djYPRB36aJaqmILYCSBOzOXSN5zs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2726.namprd11.prod.outlook.com (2603:10b6:a02:be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 18 Aug
 2020 14:06:14 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 14:06:14 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-humanize: Upgrade 2.5.0 -> 2.6.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
 <20200817112901.28914-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <78be1802-38d1-b825-c5a1-f9af7e9b4c0f@windriver.com>
Date: Tue, 18 Aug 2020 10:06:11 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200817112901.28914-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0154.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::33) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0154.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Tue, 18 Aug 2020 14:06:13 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62f5961c-2353-411f-c41a-08d8437fddf1
X-MS-TrafficTypeDiagnostic: BYAPR11MB2726:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB27268256F365CF8953F256F19F5C0@BYAPR11MB2726.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:510;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B7P1g4ensuze4TkSMt7ckuZUo1AwbPTp/AFGhzX0hxYYiY3fUnCWCWxvVSUTSoP+JkCm2C1thN7+JnrVPLPc01Zkzs2HN1vTZ59mSA5AZ3zeIDDK75GdWk0VDxM/fav2VUQl9hUvRB31LyBKfdUJA4hmAJDDAix+BpCiHWUv3WIMeXxoELJbs2P2nFFIAaqp3qRmb28vHic8iswjqBl8ASt39FQ5gYDdlE8TFNiQC45wrc6GI2/1hgaigH30YFqIGJJeK7AO6tKGpcC7q0NlMAyWjoo6rQi6YcvQtmLeETRslbBnghqI692qfi63cAzF6JEYJf3bEoE46Tz7LaLQ/H4dkhXRX2ob3HR30Q2p+LECwnQ3gwO7al+bp/gbLEn9GDW1AdAtqFdWq0CHMmPw4nM/MRxjmTdBWAPg/ikp5UBHSolFLTbF2Rc0tH7zd+4JhXgLPLghp4O3XvSZW/VuuvJWQgRYbc/ubDdHpG9UQy8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(136003)(346002)(366004)(396003)(376002)(31686004)(2616005)(26005)(6486002)(966005)(86362001)(956004)(186003)(16526019)(166002)(83380400001)(36756003)(66946007)(66476007)(66556008)(19273905006)(5660300002)(31696002)(478600001)(44832011)(16576012)(52116002)(8676002)(53546011)(2906002)(316002)(8936002)(33964004)(43740500002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	MBjRWyuYnkIZLRWn5HLfp/O6k4DEBy2bbs9l8gdKTERvyzQfRUSWs7ipKD94TIQUlBKlWXOw3P9InXbQt4CVQC3PIMTduxRYWH1NGYPFmUtfchqI0qBkVk+hQWPX5Ont+6JkPp0ZD/n1dGAg3+01iwbqIt8foC44GqMYYkKvwq5xazJmFgdolhnc3DSfNtj3TXnK9cnXwc1AXX6+pf850nhV/v8f/JABx/C+r5BZoj08fz486mOJ6/1a6q7USuCL6JDMjAZrHlN8Ey6L+7CakNiuapaVYZftie8fY/tJHoOywUboASNHvWRz9kG5Z9AZqzfMTSdjI7JvVZOw5BqbN8JJccQss/y0/vsuBx81EHuenfw+aCn99BO5GS9KzSk2eBhMCQmapLsVK5CWCew0viqFPEKp+86a5Sw0dR5MgyKmfvrGVbi1eCcDyhIhQJ/05xwZxv/4L1qo4wjIb/kh0RSBP/ew+tRhvUjate+LHSJQoc+HSXUGrtV9TYo+WDZUfpOpA6E0+O6a93tqDhpXe2zMu6pMA+X3mhttORo/Ru0oAOR4GUNHObj98UR4IoGnwFcdM7RDyfT14MmSrIMyJRuxg2bQ0ENwZkl8Onhcw48KncrnNhJAoDimnyyBgPwCidqg6lgQjcT3uimMVQnDbA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f5961c-2353-411f-c41a-08d8437fddf1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 14:06:13.9330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oyg0QLiQwF7w88xhRVrS+mKCrbuRMCee7doBEQKyywYuepnI72UAhM5duCdqOpoDUONuP48qcA1ze6VaDuHAWLJ38FEWenjalfQLfwAv67w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2726
Content-Type: multipart/alternative;
 boundary="------------1C823B507507D926663669AD"
Content-Language: en-US

--------------1C823B507507D926663669AD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/17/20 7:28 AM, Leon Anavi wrote:
> Upgrade to release 2.6.0:
>
> - Deploy docs to Read the Docs
> - Build API reference docs from docstrings using MKDocs
> - Function to represent timedeltas without losing precision
> - Improve default locale path discovering
> - Added Ukrainian language to list in README.md
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-humanize_2.5.0.bb => python3-humanize_2.6.0.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-humanize_2.5.0.bb => python3-humanize_2.6.0.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-humanize_2.5.0.bb b/meta-python/recipes-devtools/python/python3-humanize_2.6.0.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-humanize_2.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-humanize_2.6.0.bb
> index 255933a5c..de1e98574 100644
> --- a/meta-python/recipes-devtools/python/python3-humanize_2.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-humanize_2.6.0.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "http://github.com/jmoiron/humanize"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
>   
> -SRC_URI[md5sum] = "636e2c0fa1465abf8f1ff677d00e11c4"
> -SRC_URI[sha256sum] = "8a68bd9bccb899fd9bfb1e6d96c1e84e4475551cc9a5b5bdbd69b9b1cfd19c80"
> +SRC_URI[md5sum] = "de3a507d9274912a3a177849a9349edb"
> +SRC_URI[sha256sum] = "8ee358ea6c23de896b9d1925ebe6a8504bb2ba7e98d5ccf4d07ab7f3b28f3819"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------1C823B507507D926663669AD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/17/20 7:28 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200817112901.28914-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.6.0:

- Deploy docs to Read the Docs
- Build API reference docs from docstrings using MKDocs
- Function to represent timedeltas without losing precision
- Improve default locale path discovering
- Added Ukrainian language to list in README.md

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200817112901.28914-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-humanize_2.5.0.bb =&gt; python3-humanize_2.6.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_2.5.0.bb =&gt; python3-humanize_2.6.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_2.5.0.bb b/meta-python/recipes-devtools/python/python3-humanize_2.6.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-humanize_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_2.6.0.bb
index 255933a5c..de1e98574 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_2.6.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://github.com/jmoiron/humanize">&quot;http://github.com/jmoiron/humanize&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d">&quot;file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d&quot;</a>
 
-SRC_URI[md5sum] = &quot;636e2c0fa1465abf8f1ff677d00e11c4&quot;
-SRC_URI[sha256sum] = &quot;8a68bd9bccb899fd9bfb1e6d96c1e84e4475551cc9a5b5bdbd69b9b1cfd19c80&quot;
+SRC_URI[md5sum] = &quot;de3a507d9274912a3a177849a9349edb&quot;
+SRC_URI[sha256sum] = &quot;8ee358ea6c23de896b9d1925ebe6a8504bb2ba7e98d5ccf4d07ab7f3b28f3819&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------1C823B507507D926663669AD--
