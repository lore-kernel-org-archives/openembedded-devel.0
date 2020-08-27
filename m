Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.51])
 by mx.groups.io with SMTP id smtpd.web12.25534.1598552332214184710
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 11:18:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KQABUXSg;
 spf=pass (domain: windriver.com, ip: 40.107.102.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGeQnebpie4MwpGU83Ye/wXmaeDv8gxC3WzAPCFWNecSWTl9XFoXwJwMDGrSDyPfqj5fqnTJ5T5DlpeYV2YE/fVLZFCOau6+P8BgXWY4YUTJ6PGYtzKJ3227vF/JWGJHwXDgpJFPDAWmqUxtXbUeozzQrfSn4ZjEBwdF6SlEzpVcANWhkPDDlr6cFTZDGSC7Idlei+NnkmnW7n1gT+6lZ9B6We11n8kAceuBKhrT4Mvws4hOKzhG9Lcyq2GsX5po8AqJDT2uggbukkIKaVmykwWHS4OSOv+QEFUpm8P8o6DNhNogM1UpipWn2OAA0eQWvBf6s7aKiVsB2z48pJQzuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVQsydH9c8Iu5Yqo6hDJRHF8SrOuf8yS+xLAeDdU4xM=;
 b=H3q9XBXOvzp1kUO1H7SvH0f1oBtUUK7NLW3eaBHhgNrWsJNHOTQ8G0JxcR7Ko1l1/Sc6/tgEVRltxto4RkIQt23eWffps5vngJyXOyR1Dq7t0TnphcCACm0QWHPWeKkmFZH/XG8iD3IxoOdKi7Z2COkyGO9KmE2i/xYdF+CvrO1x986n4jEvf+tuldRiLPBgeuy7h3Pnp5aTQBOj2CcQxDdGzLmelRq1GtZ6VH7ECBqxFLO1z69QVdfTxVFafQ5WB8Pva+Eh9EEr5Qk4waW5hSQJcTszKuYxsh7YPqNlv4BhewN/jiKkI7Ee+fYu4aZ0kaZtkhE8a13eTaQxCtkOlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVQsydH9c8Iu5Yqo6hDJRHF8SrOuf8yS+xLAeDdU4xM=;
 b=KQABUXSgEcgP6C6KlXw1IXUZRGSqvaT03e77YE9Jl3FtAutU0qfgctW4S1Xuc7kYPMPYe/RPBpfi+WDg9qb1bQu/738ybZmE/VFOgN6ZwNbVLTm8HQurMf+2px96QvlL+bV986ezNZI34T4Z1CpdXXB2QzVgskJrutrjJpqad3M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2806.namprd11.prod.outlook.com (2603:10b6:a02:c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Thu, 27 Aug
 2020 18:18:51 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Thu, 27 Aug 2020
 18:18:51 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-flask: Upgrade 1.1.1 -> 1.1.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200825132633.875-1-leon.anavi@konsulko.com>
 <20200825132633.875-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ca3fcef0-f0ed-1924-67dd-1331808925e7@windriver.com>
Date: Thu, 27 Aug 2020 14:18:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200825132633.875-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0090.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 18:18:50 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a73affb5-138c-4955-e41e-08d84ab5a60c
X-MS-TrafficTypeDiagnostic: BYAPR11MB2806:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB28065140F1EF12B95C51D73F9F550@BYAPR11MB2806.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IhFRNmS8/W2WFwbxRP+2MLIO4/sOGgQJsNhim2vAJnniaBeiS3WU4PqsL+GQH2IzwOkxX7Ms9aiFn75ZtSqdvIZ0zVug65rdr11Rk5JaQmvDtswISVYnz6AhWOoK5O1A0AQR+EoJ7lsw228C/XuVJQcvAij+iABHrQBHNqaxzyOadqddMFHJirm1dz7te275WJ3RieHLsvnE3IQwx6xg4qL978cIFHZaUlzAFc5JV1uTAUeBXXx+o/z5myVQn8ogG/4kbwlLZFKht1EPgHLnW1HjopR7Ei941LB/e/Aqjt2VD+L4XFzZhExgBx4OP3hNAGwL5l9WHcspnASiEfY5M1rXmKvClX06Zm135YJN42Om8d7wAplBxNquajPIe6tqoKD2FsvnwwzHFM4L4/ndOBYq/mqK9tzLGokuVHmgAzelPbGOZQBk7zyLVHlN23e88NgAs/YLkP+wX8Dejbg3IA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(376002)(396003)(366004)(8936002)(36756003)(6486002)(8676002)(478600001)(5660300002)(16576012)(966005)(166002)(316002)(31686004)(956004)(2906002)(52116002)(86362001)(33964004)(31696002)(83380400001)(53546011)(186003)(66946007)(2616005)(6666004)(44832011)(66476007)(26005)(66556008)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	NsNB7ElYMKx2d0PB9uLMrCjTxU+uwqdeiGvolo0ZYBBLlsKMxXu0zyjnZJGPhEQRq1FqnEIOx9+SHzrdecX5y8YrjR2k+asnKjVnyl4ou926R99S+99hz4uMlg5KzG3ZKdf3pyXb0l/WwCa3ap0jx0X9aS8tFOjqWNUi+lBsn+t1eBS9hrvVfJZIBdVLST+44E0YAqt3PvsVWL+0+Gd//Ppp5IZ3cBRLila/dTzBW7/8DQ4Yzeje/TzWNhi42MbMRSgxl1+md1mdgSG5nE+2l8v3Mv11Uy500cExzAfvcIlxZ4AgXm6zwb9piMxLq8hTAPy++a8tdi2C2TLjLY0rtT8ocqUdHDGL/dVyK5ezSZsukpIIizcQVfDFYefZvnwrTcRl/IHm+euIsh64sGYwfKSl6nK6kWWCxh0dFCgcbsTEd+lIIw0cgKHqUfgA6gbFiiY1J4YpgLDrclQC5LSW7M7es7RpGns4KBSvp4NwCmlEk+6vqkr1yzeM3dP5HhSGajeHPOTcvBT3LAnGsOWQvedq3i7Bb6Q2UkPmztxCJWAlrPPL02ZKnW9YDPgWAhU8NrEBV2yV4PtHOTostAurJfFiFmmw4UPibfS5LXcoLjrCsf4E1sATXbhkd0vzKcbMp4LaWS2+J+JWy7UAZBQU1A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a73affb5-138c-4955-e41e-08d84ab5a60c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 18:18:51.0762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l3JXbm5meqZFKAygS9ezaMFsWwQGYT4iq0Bi5UygJ7miVqt5r5NAoSbPjCAOUYDgx1PRLAvZKzT7diPrFo1NSEQ5CiEp39rusBHcgX6aHb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2806
Content-Type: multipart/alternative;
 boundary="------------F2F392AED692EAE21B5E6D5D"
Content-Language: en-US

--------------F2F392AED692EAE21B5E6D5D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/25/20 9:26 AM, Leon Anavi wrote:
> Upgrade to release 1.1.2:
>
> - Work around an issue when running the flask command with an
>    external debugger on Windows.
> - The static route will not catch all URLs if the Flask
>    static_folder argument ends with a slash.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-flask_1.1.1.bb => python3-flask_1.1.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-flask_1.1.1.bb => python3-flask_1.1.2.bb} (79%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb b/meta-python/recipes-devtools/python/python3-flask_1.1.2.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python3-flask_1.1.1.bb
> rename to meta-python/recipes-devtools/python/python3-flask_1.1.2.bb
> index fbe1ca00e..23799617f 100644
> --- a/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-flask_1.1.2.bb
> @@ -6,8 +6,8 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
>   
> -SRC_URI[md5sum] = "0e3ed44ece1c489ed835d1b7047e349c"
> -SRC_URI[sha256sum] = "13f9f196f330c7c2c5d7a5cf91af894110ca0215ac051b5844701f2bfd934d52"
> +SRC_URI[md5sum] = "0da4145d172993cd28a6c619630cc19c"
> +SRC_URI[sha256sum] = "4efa1ae2d7c9865af48986de8aeb8504bf32c7f3d6fdc9353d34b21f4b127060"
>   
>   PYPI_PACKAGE = "Flask"
>   
>
> 

--------------F2F392AED692EAE21B5E6D5D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/25/20 9:26 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200825132633.875-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.1.2:

- Work around an issue when running the flask command with an
  external debugger on Windows.
- The static route will not catch all URLs if the Flask
  static_folder argument ends with a slash.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200825132633.875-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-flask_1.1.1.bb =&gt; python3-flask_1.1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-flask_1.1.1.bb =&gt; python3-flask_1.1.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb b/meta-python/recipes-devtools/python/python3-flask_1.1.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-flask_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-flask_1.1.2.bb
index fbe1ca00e..23799617f 100644
--- a/meta-python/recipes-devtools/python/python3-flask_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_1.1.2.bb
@@ -6,8 +6,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/mitsuhiko/flask/">&quot;https://github.com/mitsuhiko/flask/&quot;</a>
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75">&quot;file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75&quot;</a>
 
-SRC_URI[md5sum] = &quot;0e3ed44ece1c489ed835d1b7047e349c&quot;
-SRC_URI[sha256sum] = &quot;13f9f196f330c7c2c5d7a5cf91af894110ca0215ac051b5844701f2bfd934d52&quot;
+SRC_URI[md5sum] = &quot;0da4145d172993cd28a6c619630cc19c&quot;
+SRC_URI[sha256sum] = &quot;4efa1ae2d7c9865af48986de8aeb8504bf32c7f3d6fdc9353d34b21f4b127060&quot;
 
 PYPI_PACKAGE = &quot;Flask&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------F2F392AED692EAE21B5E6D5D--
