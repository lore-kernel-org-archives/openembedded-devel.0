Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.87])
 by mx.groups.io with SMTP id smtpd.web10.9593.1593183713692866773
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TjMCiSog;
 spf=pass (domain: windriver.com, ip: 40.107.223.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jShDjfb4YDLpDOoS0oR8L4xoWUEx7hBHuik+S1Gh3RnM3tOgXO42so5OXsQWgV7GQ0qkwtq8UcoGPA/lwXILgr3fntrPsudBK5ys8t1I10Cm4Q2bW70x0YeUsoWiLJtpmJDBlNGRj5bfarhM15Z/2kv2+HubDoqJNO/2K5u8aY1isAYP3rQZqVtb0lxa/uXd58bDMHcC0RlUE7uO/Hwzbw2EgXbE+lJwo8OYe88VTrAEc8dBA5PjZrMJelgFbByDUVTKbAwpsLrN8hbN3K7IhRYbD3tSObyXPyJgJ1C2s1zY5KVzYB/gThGwxUV5pnb4aa9Z8dufj6VTBJZ+jiX/xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCmFIZk4K0PQIdqkMl06MEDe0BIRxFTU/91GwMdj/kU=;
 b=GYDTk9WgTWv3MBBcM1Bre20TwWRCQyBZkcfq3dnpJzIMXkc4ATApAjnclwzUFvwpDSxTA5n/38Q5KYQfctCqE/gYXWLBggGleQiQncOAL7CBWvF23PftrVniN139bdTTPGxOBJM22Z91LOG/9QItTFHGRyHJr0eh2MsdfTcOVfgw/yHn9beqW4sHy8bytxamyChOrVxZExmW0fwCTj3NpWVfB6TK2zhMJkNV5eqPAvGX9YUUSHN+2KGi7DLPPCkgAqNPhixLVagfL1P1a8AlMdpwuK0mC8IiEjyTouYwoe08ZVE9eseHbllgr9MF+LYNVjyvsYq+nw+IGGHI0bgbVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCmFIZk4K0PQIdqkMl06MEDe0BIRxFTU/91GwMdj/kU=;
 b=TjMCiSogu9GH691NTVL8HRUxqZ7/LDHToOoP4e0u3LEJnhSp37sgOe6p1jVJXWIOYhfjcd7vRKil1TnOtVSmJPd6vXtRNaykkcpn9gANm9UZN6HF6Y5ILPNosFJvrt3v4C75lZp7+1q/ZZ+uIsRrvx6o0ypDXigg/u/y/WOczW0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1873.namprd11.prod.outlook.com (2603:10b6:404:106::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.21; Fri, 26 Jun
 2020 15:01:52 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3131.025; Fri, 26 Jun 2020
 15:01:52 +0000
Subject: Re: [oe] [meta-python][PATCH 08/12] python3-pandas: Upgrade 1.0.3 -> 1.0.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200625090719.16068-1-leon.anavi@konsulko.com>
 <20200625090719.16068-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <81accdd6-39b8-30dd-958f-4265a325eeb3@windriver.com>
Date: Fri, 26 Jun 2020 11:01:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200625090719.16068-8-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0087.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::26) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0087.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Fri, 26 Jun 2020 15:01:52 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 301b2de6-6f98-4acd-fa49-08d819e1dc13
X-MS-TrafficTypeDiagnostic: BN6PR11MB1873:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB18738DA5871C5E005A9403589F930@BN6PR11MB1873.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:207;
X-Forefront-PRVS: 0446F0FCE1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HCiV2cuaQctr+/l42cFXONpv5WjT413jQmyHbxnZceF91ro8FoURjFLArCszSBEjQHJD9xCyyD7OgLUKTp2P+jcj8FXUBTRFitj2qfNaSoUZQ4YRyZjcM+kwboPpi+IG+Z9dVSyQa4lQAsmvUnVnelpkStvwuOg20fnT7KBctQrSNj0KnTy9dscCyBl2xZltQRL0TslovRt6Lc2ZWBSiz9gGUSJxL4c4RpWd6clyzlsTIn45W/oVJzKPetCaZethwTPUmxW1TKGJjyFjljJ4R6OvofrJFzoxdtuw6ZKsB8JQXdPtTmfpN1whkb8EYT8LjHbemIDlkR8cQ1A5mxpUO4+bk/2r6Oq+GGw7xV0jCcgrbYVoXkckKKhgoKk/b63Ly7qA9b0jzbk+4KfIO86I6RasMI4u51yMN7/wa86kh2oWVCHj7yxYdIjl0+m1/o6AUInd95K2oIfHcnj+qkkFcA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(376002)(136003)(346002)(396003)(39850400004)(31686004)(8676002)(478600001)(8936002)(44832011)(66946007)(6486002)(966005)(31696002)(5660300002)(2906002)(956004)(186003)(86362001)(66556008)(66476007)(2616005)(33964004)(166002)(316002)(53546011)(16576012)(36756003)(26005)(83380400001)(52116002)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	dR3ctluWIsyLTVXLgO6ymYIAww96TmAHcU+auYB9dheKyMiXqzhpaI7o9LZCGbp/OiJGs5rEts7WuP4p3dq5Zr8nuKZJxgTVRInpTPvR0LlUs6r1sqqjFThUrdMATfuUvf3M9e48zH87b3ramQjumYevBYXBNRNvPiWaIEt9a6hipt/ao7dfwm2tKhmnOGOAzkNBj76SWjOP+m2BbADNSVTTvQUL/iobDOr1CL5XGpyFNz+GQ+BG75EKqPhh4xKmYbj676FCG3Mbk7LbFedWOqzlV5o7X8q39JP9Npo/vfQY4rhnvT95oWGM6WoFgzY3bGa8C/kWyccsFX2saMZtyMKbO4lzoXRpnlBNw7PmfPjeKsoB+kyyqGKuN6eOsrN/yLYcwsIEy3cTFDSVf/mavcFZ43i+MGaUqamczwQWLsllBHUlWGPSKPMYcqOuhT1WqSHAfvnIfq8mUiieYKIMdGz4GH3tnzByQ+XJ7uVWqOM=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 301b2de6-6f98-4acd-fa49-08d819e1dc13
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2020 15:01:52.6676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HoLaV08FyUjOHSlWYG4gFWwSox0dBC31vPfe8INjzsUaWurKbHrKltu7FTxdew15aZjUH46PIIz4Vi1kVQqjohRhC9eAVzz3oQgI1oxTj4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1873
Content-Type: multipart/alternative;
 boundary="------------5D5358ADFE6BDF37F27851FB"
Content-Language: en-US

--------------5D5358ADFE6BDF37F27851FB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/25/20 5:07 AM, Leon Anavi wrote:
> Upgrade to release 1.0.5:
>
> - Fix regression in read_parquet() when reading from file-like
>    objects.
> - Fix regression in reading from public S3 buckets.
> - Fixed regression in replace() raising an AssertionError when
>    replacing values in an extension dtype with values of a
>    different dtype
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pandas_1.0.3.bb => python3-pandas_1.0.5.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pandas_1.0.3.bb => python3-pandas_1.0.5.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb b/meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
> rename to meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
> index 099e035e1..d8db4cef3 100644
> --- a/meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
> @@ -6,8 +6,8 @@ HOMEPAGE = "http://pandas.pydata.org/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11"
>   
> -SRC_URI[md5sum] = "a3ea90326c5b55944d369bef87740a72"
> -SRC_URI[sha256sum] = "32f42e322fb903d0e189a4c10b75ba70d90958cc4f66a1781ed027f1a1d14586"
> +SRC_URI[md5sum] = "5183db713194e6fbc96c45f30a0d1311"
> +SRC_URI[sha256sum] = "69c5d920a0b2a9838e677f78f4dde506b95ea8e4d30da25859db6469ded84fa8"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------5D5358ADFE6BDF37F27851FB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/25/20 5:07 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200625090719.16068-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.0.5:

- Fix regression in read_parquet() when reading from file-like
  objects.
- Fix regression in reading from public S3 buckets.
- Fixed regression in replace() raising an AssertionError when
  replacing values in an extension dtype with values of a
  different dtype

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200625090719.16068-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pandas_1.0.3.bb =&gt; python3-pandas_1.0.5.bb}      | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.0.3.bb =&gt; python3-pandas_1.0.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb b/meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
index 099e035e1..d8db4cef3 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.0.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pandas_1.0.5.bb
@@ -6,8 &#43;6,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://pandas.pydata.org/">&quot;http://pandas.pydata.org/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11">&quot;file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11&quot;</a>
 
-SRC_URI[md5sum] = &quot;a3ea90326c5b55944d369bef87740a72&quot;
-SRC_URI[sha256sum] = &quot;32f42e322fb903d0e189a4c10b75ba70d90958cc4f66a1781ed027f1a1d14586&quot;
&#43;SRC_URI[md5sum] = &quot;5183db713194e6fbc96c45f30a0d1311&quot;
&#43;SRC_URI[sha256sum] = &quot;69c5d920a0b2a9838e677f78f4dde506b95ea8e4d30da25859db6469ded84fa8&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5D5358ADFE6BDF37F27851FB--
