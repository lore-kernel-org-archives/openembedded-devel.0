Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.48])
 by mx.groups.io with SMTP id smtpd.web10.2275.1595522891787619855
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2020 09:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=G3GV+QKq;
 spf=pass (domain: windriver.com, ip: 40.107.94.48, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f6ZrvgmNbjdqUdgXLmZG/2Alhy9nfyEbiV3lxZzRJsmfbk0I/dm2AtYlV/Cpr0tuPf7ViDPbkjyC389q9SLu+T6mbxlqqIhWfK0SDD5UGYmKK06ZSsT5n1ijZAB2O5BUMRIixLwimFtWXu+CHjAtyddE6YVTR7OQz8LqAhiXZKQ4XCmbj4Q6tBYtjG+TS0BnQxalnSU7BoHbb5ZaxjfK1dBJt71vszlgU+RQV+zZOwPLyjOvDL+wQ/7PyizXUefzdbUq6J0TiyTPiI41jFqQYfPjiP5xkR9P2+cUxfbDr0qazGmeVta3j1u2loSB7c4Xmgh1rXGg5O5W1+KBxUjVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZtrV+/6LdjzkM2S6nmt+WevqSPvCVWIaWBR87ve08w=;
 b=mPyaSp8ZazIu4zHmC2wqzEj57w1eF1vpuFvFVJTPRiw0mzZcgQjO7zHEwm3LeoCQ2tB/vl/y6ercV/gbIo5shtCnfe/16UrJhi+uqcS5VqhWiHHPqsO8plunlWmXoqy/CA2uVp/WTbxAwin+fr9v7b9DNrxzRtrU3BES3REGRUtlCasFbEubs6UTe1vWv20wBAryBts48SA1BQsdf7F8TafsQb1WWuxeJLl82BUe4fOEAL8ciIN1stTlb8JNJSxE0OotiV2gsuEPU3HpQlqL2rNvcmq1G+Ik1Rkt2dO9iVk1T4wEliqbkf8MTgzd0xmLHb8ADFekdURdd499dFgGYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZZtrV+/6LdjzkM2S6nmt+WevqSPvCVWIaWBR87ve08w=;
 b=G3GV+QKqjAGvK5g3/+UMPShAqwGiFyoXNBwu29hE6Mf6yHlBs1Jxe6MtuAd9wraifpWDnC4V11rx0mHWtTdH+cWgBQeWPoEctTZYQnJnKvQZWv8NRbo8lk/jtIEX0n6aZcS7Tbn33/BxCxyLBImMZnSE1kN9pYQbfdXiCXr8hlo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4131.namprd11.prod.outlook.com (2603:10b6:405:80::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 16:48:10 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f%7]) with mapi id 15.20.3195.028; Thu, 23 Jul 2020
 16:48:10 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-pychromecast: Upgrade 7.1.1 -> 7.1.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200722104905.15499-1-leon.anavi@konsulko.com>
 <20200722104905.15499-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b9f3cc70-1e2d-6386-baf0-4ec4a222dd9a@windriver.com>
Date: Thu, 23 Jul 2020 12:48:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200722104905.15499-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::16) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0077.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend Transport; Thu, 23 Jul 2020 16:48:09 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 125f7e78-0994-4006-b928-08d82f282eb3
X-MS-TrafficTypeDiagnostic: BN6PR11MB4131:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB4131B8F3981EF1E5CE7D7B0D9F760@BN6PR11MB4131.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XS3l3f+dc4EtUFmBh2kxztW54szBszlDVcjHsP0VDVyA3I9wmJg7QWVM5ubT2agYpq4CXBaZwCaUB/Y5r/kT8L4UEyKouhHp4Lqt3WexYXIyZ2jpLAuQJCuUDEzy8+Qs/3tM8Npfo1trzcWSxw4FwmuOp6ndWcJAgnAiCf/BlfgFZKVq9/3NkRu04fufyg46h9u+okoNb7iqBExiLBx0/Kfi2XtBh10xfpPYjCPJw87k/Zc2tKhsQR4HzByic7uMHMSzF9Hkr7ZgljudgV/NwDI5CnbkjimN5OFfimu6oCxzgz4UZTRS52oMiQmzlkkI3518VYzUrAsM9gnEXlkZj59xEq5CIwASXrLOmftXeFlbgYcDq2mxnN/iOwqzxt0yWqcRyB0P/s+kZvrQCZs2C8FD0pNzWpvDYshrdFlGtWz9YQSg3DAKlzYPloIwVxoSkVK5LG8t0/0Ecsxc0hrptA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(39850400004)(136003)(366004)(396003)(8676002)(956004)(2616005)(53546011)(33964004)(83380400001)(44832011)(36756003)(52116002)(966005)(5660300002)(316002)(16576012)(8936002)(26005)(6486002)(2906002)(186003)(16526019)(478600001)(66556008)(31686004)(66946007)(66476007)(31696002)(86362001)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	hTErhEIDBA6DGJJv4k21/RHmJe0Y1bx1XA8OydRbh4O9riyStsqHJ4uYKp/dDciH6ihgWgdtF9F2c31brvENrghqnHC1XWSvj/RRSorzf6/qN0JLjjsA8vXHS8GLOp13pxO/MwuPiekQC7CZFUiP3yihl1Ap1G/8gGYgPwK3isc5tlvmY+qbX2IXdWbxBk6FwluLZFVAIA7XEvGHwu7X3QrxR/AFRRyJ2GD70JWPP3WMGVOIwd0oMsDEiQkFTfUzUPuB0OTLD0w3oJ2Yg71ZwxykaDKNw4k405zCGH1qJdGcmYW+H6hyr8YB5Zl0aNltT7UeetwfEGgKM8Y46E7NyYZIBz/95aTp9U/xwpBPiYRXlU4HhShFCO6kIG9N9UFiL8iZYT0w0aIcuHyvPPlTu0dDPz3APlRcRNeTv2NYCR7LQHBg9+YLROOa+MdBa5RRmwh5Wr5aMybglPRxMUmdc0dtS6dGb5sDI8aytRtrlkA=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 125f7e78-0994-4006-b928-08d82f282eb3
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 16:48:10.4221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2vWNUp1zhmscGh5MECo6l5QdfkIUE2w89CPJl354O4vfws2WFOhNJ3BN/Nob7BI0XWanI1v9TPxQ566gLevvej75URgVkag81eqGKiaK9CI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4131
Content-Type: multipart/alternative;
 boundary="------------DEFFFE57CBE35220CCE57B61"
Content-Language: en-US

--------------DEFFFE57CBE35220CCE57B61
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/22/20 6:49 AM, Leon Anavi wrote:
> Upgrade to release 7.1.2:
>
> - Keep previously known Chromecast in service listener
> - Remove reboot function
> - Create Dependabot config file
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...n3-pychromecast_7.1.1.bb => python3-pychromecast_7.1.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pychromecast_7.1.1.bb => python3-pychromecast_7.1.2.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb
> rename to meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb
> index 3da979c0f..98dbf33b2 100644
> --- a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
>   
> -SRC_URI[md5sum] = "897e7acd6ac2c01f3df2e2d6b2e13c11"
> -SRC_URI[sha256sum] = "87fa9ad42425edd21e02a9240669e5763e52d975ee259a948a6fe07e6ab977b9"
> +SRC_URI[md5sum] = "6ca5102b09009c85424a9ab628005992"
> +SRC_URI[sha256sum] = "adcf478d7fc539e9decde59b2db7b6a4b1d679c4cf78d515d880adb1c4bc1c30"
>   
>   PYPI_PACKAGE = "PyChromecast"
>   
>
> 

--------------DEFFFE57CBE35220CCE57B61
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/22/20 6:49 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200722104905.15499-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 7.1.2:

- Keep previously known Chromecast in service listener
- Remove reboot function
- Create Dependabot config file

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200722104905.15499-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...n3-pychromecast_7.1.1.bb =&gt; python3-pychromecast_7.1.2.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.1.1.bb =&gt; python3-pychromecast_7.1.2.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb
index 3da979c0f..98dbf33b2 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.1.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pychromecast_7.1.2.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/balloob/pychromecast">&quot;https://github.com/balloob/pychromecast&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5">&quot;file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5&quot;</a>
 
-SRC_URI[md5sum] = &quot;897e7acd6ac2c01f3df2e2d6b2e13c11&quot;
-SRC_URI[sha256sum] = &quot;87fa9ad42425edd21e02a9240669e5763e52d975ee259a948a6fe07e6ab977b9&quot;
&#43;SRC_URI[md5sum] = &quot;6ca5102b09009c85424a9ab628005992&quot;
&#43;SRC_URI[sha256sum] = &quot;adcf478d7fc539e9decde59b2db7b6a4b1d679c4cf78d515d880adb1c4bc1c30&quot;
 
 PYPI_PACKAGE = &quot;PyChromecast&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DEFFFE57CBE35220CCE57B61--
