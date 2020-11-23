Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.54])
 by mx.groups.io with SMTP id smtpd.web10.41934.1606165100363396134
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 12:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NRdQmdcC;
 spf=pass (domain: windriver.com, ip: 40.107.223.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BDxTK5vEVAY6fQ3z/qnU+WxT46xN7LMnZAONfba6fOPIcMH/spOqi4ywk/v8kYjNxCArSjvoanT933bqmy1T9cZaLtiXVi6lamVHSWQrcMeFHt4uJP7gKO6LEAVzO3Lx7ZddmPGEE+mXPvg88Oin0RjM732+GZXU84TEs0G1PiRXZjDCXc2wpl5xyrVBpy4DPszNNnuRRVXpx7j13jIV9cXWsSdOJfQFoG7GQPdouLtlekEra+WugKPe9iUwmnvwPTh+y3R+948iaWRlATylycv5vrJmgQONGkO/E5CHeULbG4UTY6HQennsbahJJl1WSXevgHlxlx+2NHAcUrOvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mauFdLi/CE5F8isns4nrTWbGowDGuK/+t+UGgu8OPGk=;
 b=fOPnbYB5fsaXk1x7mFSoe8JnCpiTNz3tGdLO0e0/+FdOJH6HT4n9sgc7UZpwxj8MDiSOq5Z2gXDCHAKc9L6LGkHATnY3DVt6nhjB0dLvz4XfcI0vDyjSd2Nv66y2ExKNkI+LWKVSh7l1jgEeKeegqvoE7hudy83uxi/Hc1mF1X3DiyH45R21zPMQLXaD981NadmWsnHG2Dl0dMHOoxbVdwMhyuu6vlFjDU3uSaIvfPnnk53B+pleaWYurVqr1sOPlU21u5VSp8jZmWdCqIrckux8OnVjha5qnVDJXYzwAhy0SkDS2YrEjPSABZuPOEVp4su18inmo4VFvjEmKuZPaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mauFdLi/CE5F8isns4nrTWbGowDGuK/+t+UGgu8OPGk=;
 b=NRdQmdcCeNbvkmGdbZC/Yi4GQn9p/NssiLe0yaC0qEZk2VAZ9m5txYlyPLCeoZ5QpV/rn2yoxQIcjQ009FguGdCLSs+XLt4sC8ck5YMsxo4dkk9aJbHKKQT/fs3Zl4sOBZx6YLFyfx8NhZ7SzbD6ejoXPQvElB624tmkLRXXAd0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2600.namprd11.prod.outlook.com (2603:10b6:a02:c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:58:18 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:58:18 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-pytest: Upgrade to 6.1.2
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20201123062441.2998158-1-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c7776e88-7fa3-842d-5d6a-cb120aa0c565@windriver.com>
Date: Mon, 23 Nov 2020 15:58:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201123062441.2998158-1-raj.khem@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0056.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0056.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 20:58:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e1315f8-631b-4e61-1cf9-08d88ff28124
X-MS-TrafficTypeDiagnostic: BYAPR11MB2600:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2600ECA0B17EA75A50F7FBCF9FFC0@BYAPR11MB2600.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	E7D8+GhYQrzfZevPL+hqbmEvD/st9D7eQlqmpqGBNeEPDLYYPb5n0fTCwS/gDuRLlvmf37viSLyzCV5aVqT9Irth865+et7wuabYQnBgx3qwk48VkSdtMLdDYml4bQbhVxiiekKXAs1za0oxX2rfQ8wdzHZqVVjmZqfI3pKYaGVzIHIbzJUTvUCCJAUTYJsQIafsoi0z1nj6Pmqv4h9DkCpI4JmathgdSchnyoOp0/13gSFDHZaEL1e6vc2Lg4rloPPTM1ZeCi8Kp4/9Z2+OdKHXaHB0lFIt6UPsd2dUMHI2TsWKjBgUFqfoaI8eIMrfDMv3yr0rY58air6tG3B9/qCPK3QlczdSeBx9WeY/CP6SC9V85BD4BVvUnMqi4qCadAp+afF02fzRTBKqn/xgm38eDSk0xEdblD7BX8nFJo9uOzKnuOZofwnmB5oEybEqhDDP9QQPO94hloavoj9buw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39850400004)(2616005)(53546011)(956004)(16576012)(83380400001)(33964004)(52116002)(8676002)(44832011)(8936002)(16526019)(66476007)(66556008)(66946007)(166002)(316002)(186003)(26005)(478600001)(966005)(36756003)(86362001)(31696002)(4001150100001)(5660300002)(6486002)(2906002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	FTUS53NSkkhYWn/Jzzr+DvAytzxESXvtLuAELopNGlPxxKvUfvQ/o5t++AnahfGPyKz0q8LQBZGUSJo1f261IP866vu0bRSu5d4vE+x+OMlBXrcmfK9bXTGw6IWXGC1FdKj/dtpk9zlZ2xJDghyq0HqpSTxghj/4xVvDQY/OYzTMNP8awGrJ2igTQJYcygRDwXpIRL7Ztrx//KADFTRyt8W2tRQ416vNGA/3HmcrdY4sYC5QsYsbq9ruxGCTtc6pnNUMdCXTOysgbPXTiA64xujyl7afsaXlsyJzgqvJhcjw+1wEQKaUTBer4HXIMQymqZ9cTDvKW/OkM8CljFWVaXMOISgPGXD4F7ou8XuvEZn0ZwhNGG1fv89Kea9IasUyf19MpXEnW5cZYXR1zAD7XqqzTeaBFeNCfb4nXMZFu7N2sjY97DWMAioL+2HqfEkU1O7+ooxFzvfOz9pAZV4JW2R+9nPWrhwLXakUM9dHzMi7vMOorgqeUTyOHlCkURCYeB0ujEHDN7OZB3UE1YuocK4x9eOlqoUwalclz9Zv8lNwXGREcGFHN4cAB0dZ9TLSpean/8PXnQenfUw4GesmWKCjGDlW0JNSEwZmHVhefSsHJXVSahD75ndfZTk0BqTZuVTAeIr/aTPXG1wEe5oIJxQPQ/WEuidVPdkyKdJy1XSVPPdPMd09WJFTVGVn96vQBgJOfo4mVBQrKvGqZ1qt78JXN42Szubgc8Gup2/4V8Nm1wQ/KkCQnK0d8QJoW1UouzpSl7UB/VlTQtn5aesoTIy7fnhyYrR0I8dqphU+AjRTXcX+OOTMWpDKAS49Q1397WfXmNI2XSwSuqG0Gz9XrZnkLmKrcCOTgzxhTy0bl1PiMvYbmRv02EJjwehtuDS88TB/KfjMR6ArPcRd5XORbQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1315f8-631b-4e61-1cf9-08d88ff28124
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:58:18.6769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kWY54Pj6evU+j9LFTNbUYDfsVaRR8ers9tcdZk1tIUJccBnBE+t/rfdVGQ6cAmWsUDB9lwVfa9csWrrQNjopZ10fGTNGAtCJqWidLf+gtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2600
Content-Type: multipart/alternative;
 boundary="------------CC52122B66B84464AEDC8C79"
Content-Language: en-US

--------------CC52122B66B84464AEDC8C79
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-23 1:24 a.m., Khem Raj wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pytest_6.1.0.bb => python3-pytest_6.1.2.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pytest_6.1.0.bb => python3-pytest_6.1.2.bb} (92%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
> similarity index 92%
> rename from meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
> index 1da43c4f9b..6872da5cfa 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
> @@ -3,10 +3,10 @@ SUMMARY = "Simple powerful testing with python"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
>
> -SRC_URI[sha256sum] = "d010e24666435b39a4cf48740b039885642b6c273a3f77be3e7e03554d2806b7"
> -
>   SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
>
> +SRC_URI[sha256sum] = "c0a7e94a8cdbc5422a51ccdad8e6f1024795939cc89159a0ae7f0b316ad3823e"
> +
>   inherit update-alternatives pypi setuptools3
>
>   RDEPENDS_${PN}_class-target += " \
> --
> 2.29.2
>
>
> 
>

--------------CC52122B66B84464AEDC8C79
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-23 1:24 a.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201123062441.2998158-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201123062441.2998158-1-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pytest_6.1.0.bb =&gt; python3-pytest_6.1.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest_6.1.0.bb =&gt; python3-pytest_6.1.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb b/meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
index 1da43c4f9b..6872da5cfa 100644
--- a/meta-python/recipes-devtools/python/python3-pytest_6.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest_6.1.2.bb
@@ -3,10 +3,10 @@ SUMMARY = &quot;Simple powerful testing with python&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b">&quot;file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b&quot;</a>

-SRC_URI[sha256sum] = &quot;d010e24666435b39a4cf48740b039885642b6c273a3f77be3e7e03554d2806b7&quot;
-
 SRC_URI_append = <a class="moz-txt-link-rfc2396E" href="file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch">&quot; file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch &quot;</a>

+SRC_URI[sha256sum] = &quot;c0a7e94a8cdbc5422a51ccdad8e6f1024795939cc89159a0ae7f0b316ad3823e&quot;
+
 inherit update-alternatives pypi setuptools3

 RDEPENDS_${PN}_class-target += &quot; \
--
2.29.2

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------CC52122B66B84464AEDC8C79--
