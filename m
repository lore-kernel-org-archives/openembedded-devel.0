Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.57])
 by mx.groups.io with SMTP id smtpd.web10.2281.1595522902126549750
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2020 09:48:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=byXy9K94;
 spf=pass (domain: windriver.com, ip: 40.107.94.57, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hfAXAFFjVyGHZTyJhaL/XY5h2IYE/eX7gqMdbYVYph5flgYJz6Gm2P8lOdztcnwI/IAldCMN2NveeF1LVkduxcxeFxup8NJFQTwAdJs529FYvFGOf5Lr250EpYHqB+hgVQqWtj++2EScSpQtPQfBht5t4NBAB3Sl5WEAyvyLglj84ffhBMxL/XldfQrUw8ap8jABaJrJOcQFU7TnJ4bduCgeoWrZQERYr9IsafGm7TW3uxqV6HHIRQiNx6w6FUh0ey/RdXD3SRYFCFTe3uNff0NQ9Nm0PktrY5BO2ZBzjEZOEtDAPUkqVD7AdsJ9XC3uKVVI/Kist0Kj5MzD7r4m6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gd0TulL6xg6dwujj3PJYHEs26Whqo8fOkviUKDq4kXQ=;
 b=VnzEuThFz+C5N4P7bCAzoPG0AwNBIS9/XVhVGOe839ht6JDdD+qVCfpthc1KrDcnQ0YauORhepXkggwT9Go+CDJiiO7Qcf9pLAiKrJ3xT0SPmcBFHb4SNGZuuwcpl0PZONN/7xMJ8Fu07HMxSkJduZhDgP5G9P7SXJAaSx2kDGDZSrZwZd3i+dlJiptYmBgPADvDbxTu0JuH+immR8h89yn2Eu0KeyXwmnjawPDSDLxzz39e9pfloX+CR2ocJtFIGqBoOwrkk8br1CmDVmorU9M/CVJO0vwrgtRR9T8A9vORBks0jxlbhz5oy9Ivdo2aMKe80ww0v89ZGABoVWSmSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gd0TulL6xg6dwujj3PJYHEs26Whqo8fOkviUKDq4kXQ=;
 b=byXy9K94aLVFBgP4y9FoTcl+IyQjBzI8aol+u8RYGichuYfgaMnoqmtd57qcN/FzwTG41wj3tYNLjLnOZZShUWPGEmCi7diO7SJGwNtx1MC9L/JFMEQWEt/j0TDy7AxXyzPX+rUOk/kkDj+OB2Iiub6rr/QccFU9EfhMJfnjxmw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4131.namprd11.prod.outlook.com (2603:10b6:405:80::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 16:48:20 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f%7]) with mapi id 15.20.3195.028; Thu, 23 Jul 2020
 16:48:20 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-coverage: Upgrade 5.1 -> 5.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200722104905.15499-1-leon.anavi@konsulko.com>
 <20200722104905.15499-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <74a270e6-c71d-72ef-3c14-c89f08df56a3@windriver.com>
Date: Thu, 23 Jul 2020 12:48:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200722104905.15499-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::19) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0080.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21 via Frontend Transport; Thu, 23 Jul 2020 16:48:20 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e109423-b177-4ea0-f754-08d82f2834b7
X-MS-TrafficTypeDiagnostic: BN6PR11MB4131:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB4131FB3B3D29C1883BC167929F760@BN6PR11MB4131.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6aMve3QM22WrLXYJd79F2yNVqXoTKUzUaxYbRoWiMyJZloWlVqvoipfdC29pDfiaULiz0qgELn1W6a3t2FJ4AqS/R6TuyyL7LppyUzYMGDzLkpqWFqInCJ/DAoMjs7ZX7uOogxQqMp2b+lh2fH2RDoNAO3dqmzBDex6eZAsFEElA+HmJ/B80q7FWz/LQtpBGfO8nnfGyDItAmHy/7xhQ9QtOC6vL5KB3d/zDrDwshwcqkUkyZJ59hKggduQ0H6PuiuHPC43gREpQd8AS+vnYc+EnO/prviuR5+CQ4moZ+PgJwU8QNF4LdvIowXZaEK6E4FpFLUbk2dC9sXavSrUjFZZEIIy8cNb5KMOFm94nYOT3eNwfxy5acfA0whfRZ9EGQjdKjRQAAxi4VXbC0GMOJifcbMGSKRivFZMGwEnWR2o6Y0OoxMMYRW5Oyq8Xeq9BOfJI08jcsvoFi+DwlVlkYg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(39850400004)(136003)(366004)(396003)(8676002)(956004)(2616005)(53546011)(33964004)(83380400001)(44832011)(36756003)(52116002)(966005)(5660300002)(316002)(16576012)(8936002)(26005)(6486002)(2906002)(186003)(16526019)(478600001)(66556008)(31686004)(66946007)(66476007)(31696002)(86362001)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ZfzCC5S8ED3HDkAouiRJRPtJFn1oYdnhlwtxPnc06el/3/AUv5P58cmCn9ixHHIQamk/ZPqwOnh9jU0rqp+ssn4xNRStU6xkpp8zsKqD7H8KwQQAVDjB4EZti8n5S9Od1+5TpglLMx/QUsrtkEIsM+MlblaDXzNHne4f/OJ3S4KmXSnXELcVtd5Vr00wiHw5KI4dFRjF8bnCBa3LSZLAy0zF96mNXK3zl8ozTAKasABplqmn1VHjyXsAFLewPPqba/2asQJudK/as+ActwvirS8QZ7/UT6v60w3Ccj+3zKcCx1hoXMGt0l8NBN8yotMQEoKi81AmtrU9ZSBadIr5okR0T0zjMqajp1DM2TNNWOcwF0s7UNkJz7jvZ1PWO0D1mlhoTx1Xqm88p9iVl1La4b1P31KbtDGyYXEn35mvyvcXcRHpWj5pyo5Xvd9/Qys0nGL2jsKEbisEkmYkuZu98Wfx12GyrYxSVGnxa38bMFk=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e109423-b177-4ea0-f754-08d82f2834b7
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 16:48:20.5582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itC8JBF02uOg7QAW3EaP4A4ZBx+h9yHjUbUAcFVKr4nBp0wzu2EHXO8K5tzhtjUtQEfJOpNvYQx80rUt8U5DCzAWsIKkekET9/ZtTIkB1sI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4131
Content-Type: multipart/alternative;
 boundary="------------6583E13E50ADAF10C3608E71"
Content-Language: en-US

--------------6583E13E50ADAF10C3608E71
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/22/20 6:49 AM, Leon Anavi wrote:
> Upgrade to release 5.2:
>
> - The HTML report has been redesigned by Vince Salvino. There is
>    now a dark mode, the code text is larger, and system sans serif
>    fonts are used, in addition to other small changes.
> - The coverage report and coverage html commands now accept a
>    --precision option to control the number of decimal points
>    displayed. Thanks, Teake Nutma.
> - The coverage report and coverage html commands now accept a
>    --no-skip-covered option to negate --skip-covered.
>    Thanks, Anthony Sottile.
> - The --skip-empty option is now available for the XML report.
> - The coverage report command now accepts a --sort option to
>    specify how to sort the results. Thanks, Jerin Peter George.
> - If coverage fails due to the coverage total not reaching the
>    --fail-under value, it will now print a message making the
>    condition clear. Thanks, Naveen Yadav.
> - TOML configuration files with non-ASCII characters would cause
>    errors on Windows. This is now fixed.
> - The output of --debug=trace now includes information about how
>    the --source option is being interpreted, and the module names
>    being considered.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-coverage_5.1.bb => python3-coverage_5.2.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-coverage_5.1.bb => python3-coverage_5.2.bb} (61%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.1.bb b/meta-python/recipes-devtools/python/python3-coverage_5.2.bb
> similarity index 61%
> rename from meta-python/recipes-devtools/python/python3-coverage_5.1.bb
> rename to meta-python/recipes-devtools/python/python3-coverage_5.2.bb
> index 7265d2c97..72558e10c 100644
> --- a/meta-python/recipes-devtools/python/python3-coverage_5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-coverage_5.2.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://coverage.readthedocs.io"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
>   
> -SRC_URI[md5sum] = "506e30fb011158abe5ce92f39866b271"
> -SRC_URI[sha256sum] = "f90bfc4ad18450c80b024036eaf91e4a246ae287701aaa88eaebebf150868052"
> +SRC_URI[md5sum] = "bfe80a336636160a3916467f55842bc5"
> +SRC_URI[sha256sum] = "1874bdc943654ba46d28f179c1846f5710eda3aeb265ff029e0ac2b52daae404"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------6583E13E50ADAF10C3608E71
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
    <blockquote type="cite" cite="mid:20200722104905.15499-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.2:

- The HTML report has been redesigned by Vince Salvino. There is
  now a dark mode, the code text is larger, and system sans serif
  fonts are used, in addition to other small changes.
- The coverage report and coverage html commands now accept a
  --precision option to control the number of decimal points
  displayed. Thanks, Teake Nutma.
- The coverage report and coverage html commands now accept a
  --no-skip-covered option to negate --skip-covered.
  Thanks, Anthony Sottile.
- The --skip-empty option is now available for the XML report.
- The coverage report command now accepts a --sort option to
  specify how to sort the results. Thanks, Jerin Peter George.
- If coverage fails due to the coverage total not reaching the
  --fail-under value, it will now print a message making the
  condition clear. Thanks, Naveen Yadav.
- TOML configuration files with non-ASCII characters would cause
  errors on Windows. This is now fixed.
- The output of --debug=trace now includes information about how
  the --source option is being interpreted, and the module names
  being considered.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200722104905.15499-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-coverage_5.1.bb =&gt; python3-coverage_5.2.bb}      | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_5.1.bb =&gt; python3-coverage_5.2.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_5.1.bb b/meta-python/recipes-devtools/python/python3-coverage_5.2.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-coverage_5.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_5.2.bb
index 7265d2c97..72558e10c 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_5.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-coverage_5.2.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://coverage.readthedocs.io">&quot;https://coverage.readthedocs.io&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93">&quot;file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93&quot;</a>
 
-SRC_URI[md5sum] = &quot;506e30fb011158abe5ce92f39866b271&quot;
-SRC_URI[sha256sum] = &quot;f90bfc4ad18450c80b024036eaf91e4a246ae287701aaa88eaebebf150868052&quot;
&#43;SRC_URI[md5sum] = &quot;bfe80a336636160a3916467f55842bc5&quot;
&#43;SRC_URI[sha256sum] = &quot;1874bdc943654ba46d28f179c1846f5710eda3aeb265ff029e0ac2b52daae404&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6583E13E50ADAF10C3608E71--
