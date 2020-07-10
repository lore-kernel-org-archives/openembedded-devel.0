Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.49])
 by mx.groups.io with SMTP id smtpd.web11.9759.1594384651996676482
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 05:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Rst4SV+I;
 spf=pass (domain: windriver.com, ip: 40.107.243.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=On20YMgLP4MC3SywdOvIWE1IaMycRpr6/kTMmAFHgh66k4SG4Hpr8XtHqPj874TaVCzND7+R1+9pId7qSMOSKaa9AAS2B9rrh31G74dF8Q8uBg4cQYMZasFhrhi92VJZNyBG5ERkEyYuYoOwtflHjCeCMWr6YQOQLGujgTuE59kOiflWUXgkyEmXhCgtta35yk24Ko7V1UEAVV3UrWO3koKUYBUJCvmsDO4waIUIlAo+pQJNBeKYugGNwOI6sK79kDyU3sNhc9SMgBbFXHM8v76CPGfqAp1JDWCYtwSwc2kUSQvRZjcc8JaamXtKA2/n45g2Ced6uOVE54hKj3/qvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsPhpl0BZYPyhjpD4ou2PWadvQPhTUqULO7IMDndtQg=;
 b=UE6vLf2XuqMauBG7/uin3AFHsh59pbxEkFOxvxcau7rjmu3T4PdB614WB3Kxw2ai9bchRt0jkNheKMXgcStOEdSdsSx1i/IV3SJZIlcBTMnmUY4TEreg5ScIEfMdTvLP+mwp/XHHLGWsKPYyVzdvSMhIx6S2qcfUocMHdchI227ZomyGtZ+9sAsCli3vm1RnWz3JymPsO2GDxMX/jhabFXdaiNR5p5jazGRVlov07VWoGKdCQfGwMi3/ITknP+96e9kTJsV9XpCaz+W4ZHzrfp2G0DSt/sQOvU5x9NOOLSLJmxPD0CwTWkQ33Sjan5DtzUmbvqQb9D3adOz6jWGEYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsPhpl0BZYPyhjpD4ou2PWadvQPhTUqULO7IMDndtQg=;
 b=Rst4SV+I3tn+K9RtZvSwftum93mei0o1skVerCeDgdzFYIjd+GhUNllk3eHJPx+BIYOxdEIsmBHk8AnYRj5H4bm0R+4Vl88laf18+iu2GkMoNPmQPATGrEkXgYaB0OyYbaxeRBS/OpB/luxKlx6edpXauuHNHDLEo87jrQoXYn8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB4516.namprd11.prod.outlook.com (2603:10b6:5:2a5::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.20; Fri, 10 Jul 2020 12:37:31 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.031; Fri, 10 Jul 2020
 12:37:31 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-tinyrecord: Upgrade 0.1.5 -> 0.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200708094659.27331-1-leon.anavi@konsulko.com>
 <20200708094659.27331-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <85efddab-f541-9590-67b4-0566878bc535@windriver.com>
Date: Fri, 10 Jul 2020 08:37:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200708094659.27331-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Fri, 10 Jul 2020 12:37:30 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27d54863-d150-4798-feb7-08d824ce0352
X-MS-TrafficTypeDiagnostic: DM6PR11MB4516:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB45167E5D8A2BDF8439C500E19F650@DM6PR11MB4516.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:962;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ra2Jy0CFPXqCtYciiBigV612W6mAHX3IfxwD43WRyPmov28THMhcHJjdSXDAa3X5eSJ1yW1m7jrkxkutKDFHUvwgv0KB/lNCUGj2H7j34U1TQuUZZeR3yzVWq2SxxV7NXJk2/SSVjvjVTEvCS0GKM5Cd07YWbjhLRqr5it5iUbA76TLma/TfUSAp6tXOSXM7KuPyKJWfm2kOTbX6ganYi+si04GP32TtVVECU/vZB0Pv3MhSP6jhqgnnXjM6Muc0zAhhuDEEDe8ViupXU0R3E06CllQo9mtmUG6qNEcYjkWWgE92TSBq4xUcy9Wz7Md4ydsjaCilfuiDWDyQYHzpQKiLkIFhTao0t/1Lyi0xX0tFmhI58DCqgQgFgePCNvV7JHmJbsHIjDmASIQZsAxEYAuJ7sw1VQIIJBImvgVArWvQ78xdwfuN11c2NkmR7GJytZXYyD6ehpIhODzBOQnLQg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(366004)(376002)(346002)(136003)(16526019)(16576012)(44832011)(166002)(53546011)(66556008)(66946007)(26005)(66476007)(2906002)(966005)(316002)(478600001)(8676002)(31686004)(31696002)(8936002)(6486002)(86362001)(2616005)(956004)(36756003)(186003)(52116002)(5660300002)(83380400001)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	o1JDu/qLwb+tevV3h0EK4V2CuybPGuOObJefmrXnRJTbkLpvepCW5EJ6mSiPlkrnxWOzS/R1vFscsaIeuLb7ozlGnZ2F7jQCu0BSYprWWHtmMxDiORWkkIaHb/OGL9v0Ruv5u2AlcIYCYF5XgR3bc3lL6y3k0mbvmosGwnQk20t4BX9CzAaYuqahbsfN2AGZiz0KNYirmROPi9cZyBE1PTIR5gSTplaDI1WpDDrBSbGwaRJYsdjYhJhRQSKRcnAWeNAjE7Hw3lly2pEOCsWU4hxjWPLfkoqPnOtYIuIWVPTAwMqwkayvPMX5+8U/UBONhrQ18qvgBnaigSthb/ZGOHoloP5hs3pKPwlj4W4/6DfFpWmkpBRUHXLW9LN4I/Ay44uKbVn5SBmwyVxnMDM44NASR+oNP65QgyzkRmRES4PYr0nrYPtMrOmgiV5ijLMgPgdFThgc7hgP4XFjeGUAPjZPsI1JI0R2e79IN6XeAgQ=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d54863-d150-4798-feb7-08d824ce0352
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2020 12:37:31.2018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vgBGDuOFcNG3SXpXAUlgGYQ6JjVryBMGcaK8o6YKfKjfAfwFQaTzU7OAnHwM4blWVD5MRVY99Vpm8Zaks788qfgQPpcHvQQLUyiMLI+F3EE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4516
Content-Type: multipart/alternative;
 boundary="------------E23CA8D9604E1EE7AEFCF6D2"
Content-Language: en-US

--------------E23CA8D9604E1EE7AEFCF6D2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/8/20 5:46 AM, Leon Anavi wrote:
> Upgrade 0.2.0:
>
> - Add LICENSE and MANIFEST.in
> - Pin tinydb<4
> - Drop support for EOL Python 2.7, 3.3 and 3.4
>
> Use LICENSE for LIC_FILES_CHKSUM.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-tinyrecord_0.1.5.bb => python3-tinyrecord_0.2.0.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-tinyrecord_0.1.5.bb => python3-tinyrecord_0.2.0.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-tinyrecord_0.1.5.bb b/meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-tinyrecord_0.1.5.bb
> rename to meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb
> index 65df2e1c3..1d99ae2f3 100644
> --- a/meta-python/recipes-devtools/python/python3-tinyrecord_0.1.5.bb
> +++ b/meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb
> @@ -6,10 +6,10 @@ then execute architecture which allows us to minimize the time \
>   that we are within a thread lock."
>   HOMEPAGE = "https://github.com/eugene-eeo/tinyrecord"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://README;md5=31c1dc11b4ae83546538de4c16bceabc"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=ee157eec4b228c8d5b7a6e0feab2864a"
>   
> -SRC_URI[md5sum] = "e47dcfe299686cd3fa7ffaa7cb2ee8b1"
> -SRC_URI[sha256sum] = "bc7e6a8e78600df234d7a85c2f5d584130f2c6ffd7cd310f9d3a1d976d3373c8"
> +SRC_URI[md5sum] = "cbaae3f4599b12e3bea67ca4a75eca99"
> +SRC_URI[sha256sum] = "eb6dc23601be359ee00f5a3d31a46adf3bad0a16f8d60af216cd67982ca75cf4"
>   
>   PYPI_PACKAGE = "tinyrecord"
>   inherit pypi setuptools3
>
> 

--------------E23CA8D9604E1EE7AEFCF6D2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/8/20 5:46 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200708094659.27331-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade 0.2.0:

- Add LICENSE and MANIFEST.in
- Pin tinydb&lt;4
- Drop support for EOL Python 2.7, 3.3 and 3.4

Use LICENSE for LIC_FILES_CHKSUM.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200708094659.27331-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-tinyrecord_0.1.5.bb =&gt; python3-tinyrecord_0.2.0.bb} | 6 &#43;&#43;&#43;---
 1 file changed, 3 insertions(&#43;), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tinyrecord_0.1.5.bb =&gt; python3-tinyrecord_0.2.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-tinyrecord_0.1.5.bb b/meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-tinyrecord_0.1.5.bb
rename to meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb
index 65df2e1c3..1d99ae2f3 100644
--- a/meta-python/recipes-devtools/python/python3-tinyrecord_0.1.5.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-tinyrecord_0.2.0.bb
@@ -6,10 &#43;6,10 @@ then execute architecture which allows us to minimize the time \
 that we are within a thread lock.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/eugene-eeo/tinyrecord">&quot;https://github.com/eugene-eeo/tinyrecord&quot;</a>
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://README;md5=31c1dc11b4ae83546538de4c16bceabc">&quot;file://README;md5=31c1dc11b4ae83546538de4c16bceabc&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=ee157eec4b228c8d5b7a6e0feab2864a">&quot;file://LICENSE;md5=ee157eec4b228c8d5b7a6e0feab2864a&quot;</a>
 
-SRC_URI[md5sum] = &quot;e47dcfe299686cd3fa7ffaa7cb2ee8b1&quot;
-SRC_URI[sha256sum] = &quot;bc7e6a8e78600df234d7a85c2f5d584130f2c6ffd7cd310f9d3a1d976d3373c8&quot;
&#43;SRC_URI[md5sum] = &quot;cbaae3f4599b12e3bea67ca4a75eca99&quot;
&#43;SRC_URI[sha256sum] = &quot;eb6dc23601be359ee00f5a3d31a46adf3bad0a16f8d60af216cd67982ca75cf4&quot;
 
 PYPI_PACKAGE = &quot;tinyrecord&quot;
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E23CA8D9604E1EE7AEFCF6D2--
