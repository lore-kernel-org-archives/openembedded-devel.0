Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.54])
 by mx.groups.io with SMTP id smtpd.web11.9883.1593089938276605777
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2020 05:58:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RJPzsryB;
 spf=pass (domain: windriver.com, ip: 40.107.237.54, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KwOTZa9isRfPnThBsDtHwZlvERghW0sV4W5XQOLbtalaTJYoAvz6WlqrNVwrDYMXdNzncXYfZ1UwmBBrqStTBZI6Q87LcOTfk0tRBAWvzMJkVoPUnr947PN/s4LLTREt8lysOdWYQ66xloqWGjli5sF++dws8MSefsb9rcUKS6mx8L0zg3kErKluF0RcDUK7k9SsKF5wStAQLrCYmhbOfKdSBKwsR1x+oWkQnuWGu/Bjhy5SNsBgfQaIJ98kkGkuJvuKfO5y78rm+wC2IQudvsCq3TIftGTFX/NPKP4o/4zkE5gSh84QAvlQQwy2H/o+qwcoNAFpwta4VaU44swffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAIJrF5Kxq7s39QiWab5TmXX+8uLzRWQ30aMfWtSgHA=;
 b=dg7kraxsMwJmU76IWr+cdAB5v3f37VdYUBzS3LXSfuEM8trXnyuDrCxntsEg9QbbVmMZkEZsfAwggx830coxKWcHEhPPX7pDv2ijPVOxV9SniBBNpNW10x54tahBX6kjWkCMus7irJ8AQjNt4qzmrg36NrR7iOtngeFxNtavCCUBnkYD6iisn43J9d/n+NR0ZvizDaaS6sMwHHvy+GssegN0s66sZfkxop899EhuOHStkey19ZeIHXY1wUMcHbEUy6/7xQp5/7vLGDsvI2c0T55xgO7kbZ7jSIyB04qPuLAEjHU8SSwpS1/qc0Yh+I/3+Wcoitp/jvge/CLJ2tz05g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAIJrF5Kxq7s39QiWab5TmXX+8uLzRWQ30aMfWtSgHA=;
 b=RJPzsryBok7Lh86wPTtcNNVoJCUbMBAjNhb6f8s9Wgg/2b46jrC2FQHyhKPEACyYEbXxql8QKVBreoO0xlMVm/yADrKeoKb2Xlg87s3bq/oczciwUe2C/c6rAdaw6Cfu96nGdOz+JMZGYgEm9YLaEDJdANoZHdX0fUn+DnudULE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3954.namprd11.prod.outlook.com (2603:10b6:405:79::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.21; Thu, 25 Jun
 2020 12:58:57 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3109.027; Thu, 25 Jun 2020
 12:58:57 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-license-expression: Upgrade 1.0 -> 1.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200624151628.547-1-leon.anavi@konsulko.com>
 <20200624151628.547-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d06849b5-d590-6a67-85fa-3bb0a7a2fe4d@windriver.com>
Date: Thu, 25 Jun 2020 08:58:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200624151628.547-9-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0050.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::19) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0050.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Thu, 25 Jun 2020 12:58:56 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b12d0209-b1cc-40de-c563-08d819078571
X-MS-TrafficTypeDiagnostic: BN6PR11MB3954:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB39544C9BF64A8110A4DAD5039F920@BN6PR11MB3954.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-Forefront-PRVS: 0445A82F82
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MLIRj1uxlly+zW8eUuI08ClVZQn4QkLkjb0HqnYWv8S8+TR/YQ5rUg1F3ns7NqVexDo3aoWnypt52aGi0y2Tjva/AXGFE7FxTpISj38e60ObGCAg8HNQTLOcZVQctwfcv4AkXq9bC5WRk7bPPV0OH45fC745CDJZrvQsM1OPJS7r6Nc7WRhrtPT5Yl0gNUBPTi0vY9YpwBWcm9/4DTq9HmqOgO5HHkfQ79cFtI1j5eqx227cmnXvdq5J/7EyvjTtD7HCI63AFufTwKqeDpGdlRq5bL5eIYC35DOjxb+zjNwzFzt6m551QPXftyBwPSy5zS3bQeE40J5pVqha2+7uRu9vI/z69KuvHIEqnjWCFydggOrJupzdDSVsoXUFT3P3HyKMZ90PfZedSLEEnGINGyG5RCEkUu1bKtTzaZdfCdtC4pkNp8TsrXVjRb+S6sYaE9kRmLCUrhcx3wCWbqKBYw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(39850400004)(366004)(396003)(346002)(52116002)(44832011)(83380400001)(86362001)(26005)(31696002)(186003)(36756003)(5660300002)(53546011)(8936002)(16526019)(966005)(16576012)(166002)(66946007)(66476007)(33964004)(66556008)(956004)(478600001)(2616005)(6486002)(316002)(8676002)(31686004)(2906002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	uplPf7ghx6n69ifzUY91RGOmaeAxJJFGbg1NG3df/CNH9m4z5Ro/TR30ftlVN+h4k693TbMjLQ4qmIuc8xkvza0S6ifWA3K2tf0EvVcJ0qlSyYPyOB7AkpI9GABdfRMXbuoBqyjvm2rCoC+RUfl5KYCaUnranJTFJrqtxiv7cM8RxajQIemhgZiPLMJ3TdLzVUKTncDkVjfs9yyAbEZPWFQZvRi1MkNWrrKgmStJEFOC9sGj3H7h/26DKnQxBplNLpQxqgbOT3iM8lKGnfCkLWMm5VAHx0VFT+B/VCjsJtVDK0jW5Wp2ZqaKQobs8Cfvb2mr9Gx620cvf7MIZDNYSD/xBDQUFDmyCOkiKn67cgGfpMeldmiPqlGhWY+TPNiSPzNyRVh/6ZgZf4cLAeXoEn3OHNi9D6CrdQq1IvRiQEjC7/nMlgbmsx7wrQuUbPlEF6UwgfQ4bC1UfccSUnx0l/0E+S/vivMs6lqkCi1VUe7Scae69im6lDfOhWoZ81FH
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b12d0209-b1cc-40de-c563-08d819078571
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2020 12:58:56.9756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/KrtyWCsVQtz+PdEPtdAVz2NHb88whtDnUhW0YQ07A5Kt3u3SMiYEUyCpxexcteUcBrqz/dAzHoZpM/IoVZaeG7BqY4FcETVf7dA2O0Dd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3954
Content-Type: multipart/alternative;
 boundary="------------09ADEF257E5408E4D0FE5AF4"
Content-Language: en-US

--------------09ADEF257E5408E4D0FE5AF4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/24/20 11:16 AM, Leon Anavi wrote:
> Upgrade to release 1.2:
>
> - Add ability to render WITH expression wrapped in parenthesis
> - Fix anomalous backslashes in strings
> - Update the thirdparty directory structure
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...se-expression_1.0.bb => python3-license-expression_1.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-license-expression_1.0.bb => python3-license-expression_1.2.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb b/meta-python/recipes-devtools/python/python3-license-expression_1.2.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
> rename to meta-python/recipes-devtools/python/python3-license-expression_1.2.bb
> index b1c38e95d..c033bd352 100644
> --- a/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-license-expression_1.2.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/nexB/license-expression"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
>   
> -SRC_URI[md5sum] = "81477f779099f55071c6a7b88a29bb01"
> -SRC_URI[sha256sum] = "8aaa455c5b97c4f2174090178b19792b2a1c620e80591aafd4e0a99b713f9e8d"
> +SRC_URI[md5sum] = "fd4cb295cc345be1071274cdbd81c969"
> +SRC_URI[sha256sum] = "7960e1dfdf20d127e75ead931476f2b5c7556df05b117a73880b22ade17d1abc"
>   
>   inherit pypi ptest setuptools3
>   
>
> 

--------------09ADEF257E5408E4D0FE5AF4
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/24/20 11:16 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200624151628.547-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.2:

- Add ability to render WITH expression wrapped in parenthesis
- Fix anomalous backslashes in strings
- Update the thirdparty directory structure

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200624151628.547-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...se-expression_1.0.bb =&gt; python3-license-expression_1.2.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-license-expression_1.0.bb =&gt; python3-license-expression_1.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb b/meta-python/recipes-devtools/python/python3-license-expression_1.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
rename to meta-python/recipes-devtools/python/python3-license-expression_1.2.bb
index b1c38e95d..c033bd352 100644
--- a/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-license-expression_1.2.bb
@@ -4,8 &#43;4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/nexB/license-expression">&quot;https://github.com/nexB/license-expression&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://apache-2.0.LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa">&quot;file://apache-2.0.LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa&quot;</a>
 
-SRC_URI[md5sum] = &quot;81477f779099f55071c6a7b88a29bb01&quot;
-SRC_URI[sha256sum] = &quot;8aaa455c5b97c4f2174090178b19792b2a1c620e80591aafd4e0a99b713f9e8d&quot;
&#43;SRC_URI[md5sum] = &quot;fd4cb295cc345be1071274cdbd81c969&quot;
&#43;SRC_URI[sha256sum] = &quot;7960e1dfdf20d127e75ead931476f2b5c7556df05b117a73880b22ade17d1abc&quot;
 
 inherit pypi ptest setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------09ADEF257E5408E4D0FE5AF4--
