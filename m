Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.42])
 by mx.groups.io with SMTP id smtpd.web11.22443.1600263494018831680
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RparSqE0;
 spf=pass (domain: windriver.com, ip: 40.107.75.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgbYj9zZBQ+yJjiY1N7RkG3nHfrmaqga/+QPDCp97Op6PrZ556fG4Plb2DvF91W1NK7Dki/93L4B0zKeIDHL4ZKVqdBeTCbIXtLiJR9XlunpIc/snqdDtUBrxuwGSQMUjnZwV6ePHg8YKvnpH7naQ4XKawuz/rNR8z0ubpT8txTGUi6tcOeRPbJ3fNv4EgKernRrkbWLEB6KS9kw2wuFuIoiaSGGPD595JujJEGdJoXY7seZl4q+LiPjLJ3ak9+D/7fTiaGOZd5wLsrKZAqtutJs/8cmUqJ27deUYk/zhXYdr9RU1yJyIah9hwpV/hSDuUaQt2BMiCX3YcOJGFJUIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aanRrnKvhm0BmvfUbuc96L9eeuAiLXlcHyI2J6PgYRY=;
 b=Z4sOhSidcgdHUv9lzKw70zi+OCQYY54vc8U5LPMsSap79WdididK6y/Ug0fFCVqSYX4dlrY+6FZ4d930wSn7kLzskPZwqbgejQMxNzAxjjScaXFQRmTAEMY1nbKF20Zj1j2YT1Y+yMRQhs5Z3LzKg/lDcINnijFMxOt47H2D11GUvJen8OH9qpZJ1JxRCprVoHFxKxQlNdxI9oFtVAWjYPhLiD61+j2S85dEgWLzGzTSo++DoQA4dfIqc8Ki3XGLeh2BAnfmT5bwZ1wQ4LAV/9tydbAy44iGTae8LcISdmjnhR4tqIj0Z6uPfjfPs/iOR+u21GVsPkOrcvvIXGdPDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aanRrnKvhm0BmvfUbuc96L9eeuAiLXlcHyI2J6PgYRY=;
 b=RparSqE0T5kiGfNcQ2jVgjdTPs6uytXhoXoBsN3R0OjACXsWCImgynVDQMiN/WeG7O8x16kMhuUGPSfJfB/YOKfk9WbjJ0HLjC5iUXswAFNjECJ2PGx2aZhmVkFKqQZL3TyB3oD/88Lu9K26s6FovHZfhzzN92vtOSqCa2whjIE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4306.namprd11.prod.outlook.com (2603:10b6:a03:1bb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Wed, 16 Sep
 2020 13:38:12 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 13:38:12 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-ruamel-yaml: Upgrade 0.16.11 -> 0.16.12
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200915125447.14197-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <8c150a1b-e2a3-b491-105c-382d32cba39f@windriver.com>
Date: Wed, 16 Sep 2020 09:38:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915125447.14197-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0086.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend Transport; Wed, 16 Sep 2020 13:38:11 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 67b99d9b-35b2-4e2b-d86c-08d85a45c1ba
X-MS-TrafficTypeDiagnostic: BY5PR11MB4306:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB430689979470F553EFA6217C9F210@BY5PR11MB4306.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WmYw7ezCHnw0+AMeW8nWLiZ0A+TWZn2R9AnnLsEGEdrHronvir5pyPcj6PNHYESt4qYvCt/zPRauVlOCadVI5MLQ8TEgN36ST0RrUmdoMuIeSz3EUOg7PXsNO/+eSaUQCFavZr2CBYkYIeJoMyxCAykAzU3e6ZPLUeDVAr8tZtCcdrKhG+uTN3FEerAFujUdvDuK4HricXwKOJIz7+Co89bYwV1Cr/tWB1b977cMgDOdbCF5lxYRdog/BU6bFO2ZrjxFhHCEAFxwcZLqv3ZH2DwlP9zF6iJwzwLr0M6pvfX5aYqxzuI8odiTtYNtsvxxvMr+XbVMTDQZOk9rRmplsgcVWStWnxmTsVb9CCYcPQ+xC05R+BTpla8T7n6LneSnkCRrNK3X0tcV/1qQ8PJ3Nsd8NStFXg5555i1h0ydBgjVAuGsvZuazTotlbQgDptE6s1pHiDsZQlwHrJxk42YGA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(396003)(366004)(136003)(376002)(346002)(83380400001)(956004)(8676002)(5660300002)(2616005)(966005)(53546011)(478600001)(26005)(44832011)(166002)(8936002)(316002)(31686004)(6486002)(86362001)(31696002)(16526019)(66476007)(186003)(52116002)(33964004)(2906002)(66556008)(66946007)(16576012)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	iVWw6lx0/amXyYMaPX5bMFcWhcoS1j0dXcjYHfNPeHsHyh1+tr8sdwztl5Q3RX/7z4KjGuVHeFe3Yq8JJ2mlHabkvvrTjywoHMXKx/Y4Dk9mx4ZcMojfm6Wmtor3RRROuhd2cyVT3kyVEqn/Um3i8nWNX15p/Wk0jWFVcoD4VLleZOdahkd1EtBTeGpIbfcVgqMJs2cg1D4NNyM8r5LseRnK19qg8NRMhPTHBxRt/JZps1tOPUv8sepyEt19RGWA6+IZEZ5o3mfu6EMelv8nx0LVnkwrsh5QKLF65lR6cWc9E2Vf+ryIEpNXAQJf7uM6qhrtR2dHx7VDT2gMnKRgYtDZa1FsYuZOPJtF8Spkz9UneOx5UG3cYPzgUEpgMmxo4di+xcYzrL1yaGgzomOW/KkqxOloSLe//LcNDQiYTjVRtx7JpxJaKJ1oMI/JIet+6C7hQh7G4cHz4f7QYsecxiFkAkXIarPqXTsMnnU/fMn8YCi1+bbX9rR9Hx14wt5u9G/QkzRv0+bvLE4qRkkG/utk11O0wk+9vk5zsG+oigD0qF/sE2x09PLFrq08obTk0X8ycTT9A7wiTJz+KAFHPq7tjRVbOHhaTEujzvqJ6++4kKwXFlXYY3DEAZc9Q1DY+/Ko2mThHBR+DYixKPTDBQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b99d9b-35b2-4e2b-d86c-08d85a45c1ba
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 13:38:12.5654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXnL65mVNtTU2M2z0guTrbxnrKlY8eEWnTzSLxDnmNn8F+OD0s4LaWCUHuXFgZHmU/2AibERfkGlVPM7ysY8LypbVznwoYUKBghrs/6jfCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4306
Content-Type: multipart/alternative;
 boundary="------------8FE192977D75D55231830C1E"
Content-Language: en-US

--------------8FE192977D75D55231830C1E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/15/20 8:54 AM, Leon Anavi wrote:
> Upgrade to release 0.16.12:
>
> - update links in doc
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...-ruamel-yaml_0.16.11.bb => python3-ruamel-yaml_0.16.12.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.16.11.bb => python3-ruamel-yaml_0.16.12.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb
> rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
> index 9b3a2e1d9..ec8545dae 100644
> --- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb
> +++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
> @@ -8,8 +8,8 @@ PYPI_PACKAGE = "ruamel.yaml"
>   
>   inherit pypi setuptools3
>   
> -SRC_URI[md5sum] = "020a0140d06b2e32f53944d4335f9877"
> -SRC_URI[sha256sum] = "43bf19037937f78845775d84582dd6f3ac966bc1b7748de898fad35638c74771"
> +SRC_URI[md5sum] = "c7e4b216d9554d80be42011b448b7c61"
> +SRC_URI[sha256sum] = "076cc0bc34f1966d920a49f18b52b6ad559fbe656a0748e3535cf7b3f29ebf9e"
>   
>   do_install_prepend() {
>       export RUAMEL_NO_PIP_INSTALL_CHECK=1
>
> 

--------------8FE192977D75D55231830C1E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/15/20 8:54 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200915125447.14197-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.16.12:

- update links in doc

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200915125447.14197-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...-ruamel-yaml_0.16.11.bb =&gt; python3-ruamel-yaml_0.16.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.16.11.bb =&gt; python3-ruamel-yaml_0.16.12.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
index 9b3a2e1d9..ec8545dae 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.11.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
@@ -8,8 +8,8 @@ PYPI_PACKAGE = &quot;ruamel.yaml&quot;
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = &quot;020a0140d06b2e32f53944d4335f9877&quot;
-SRC_URI[sha256sum] = &quot;43bf19037937f78845775d84582dd6f3ac966bc1b7748de898fad35638c74771&quot;
+SRC_URI[md5sum] = &quot;c7e4b216d9554d80be42011b448b7c61&quot;
+SRC_URI[sha256sum] = &quot;076cc0bc34f1966d920a49f18b52b6ad559fbe656a0748e3535cf7b3f29ebf9e&quot;
 
 do_install_prepend() {
     export RUAMEL_NO_PIP_INSTALL_CHECK=1
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8FE192977D75D55231830C1E--
