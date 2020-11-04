Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.41])
 by mx.groups.io with SMTP id smtpd.web09.13884.1604501222636298008
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Nov 2020 06:47:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hJPVC0mW;
 spf=pass (domain: windriver.com, ip: 40.107.243.41, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kD556fNDDNmNyjPORKGob+kJsnOfrteXvIlYPpQq+Ltb4MZ8IcU2IDRbGzXYxTmlyPiFYu0Is+PA5tgoWid0zFsQbW1mTcc8am3YciygUd/7dy1YceOHSDYeJRI2B9TtTRej4aHJl6SywQMAOiTcsbQdE2AoqdBjon+RSPE5rHV2+4menynBYMzJHOF6Uo+PppQZS1hzs6XocOXvvdNeyFshwPalu9E3avyUAzOz9l7KZOo7yIF1qwLMsZwJSBD6bVrJr1vN/dXhS4mGCoXAfrdtBn/OHT6VifZ2IvjUCx1geiRJYt0CeK7KBWFYlHA01dVl0cvLrh5dHqQvMt7AoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O05OZm3t8vsd3EZjZXbte4AnrvtP5vLzpTdg4Hpj54Q=;
 b=UmtkZYm/QCYbz+EtvJovFukwoHFPFzVjZ22Uc5gEA0VIes34EY/Ly5AFDAJZbEnHWL0Lqv8XyU9dvJX+a+8hesbmdAR9dCSX4DBBJYT/882v1La0l5q7bPwM0EDGeVQ5mS0h8A8A9izTxY+gMmYQxnmsEBClIHYcALnygeY8Vp+33QEuDXumWAS8+PZPIfeiguRzlaX/6VzKl24SxvhLZVcmGZC9ckURo7l49qYACyHUZF2X9sOczuYmtngCFYQ/2K8Oz3wLsIW97Oc9Qjpw2GWW3ZQruLTEvlxJsc3+enbah5GaCgwwqN17d5Khgzgq2QjsmfJI0RPW7Xvl8Uh9fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O05OZm3t8vsd3EZjZXbte4AnrvtP5vLzpTdg4Hpj54Q=;
 b=hJPVC0mWOHlnv1I+wtjlF8kkH37+6KEuHt6G2aX55/fSVs5L4qzbSyfI4/Y4WfgNcWO/CLpguEYtJPEJQllyA/UO0p5Pi/GaKoMXD2wJ4kJWFicMrSY+VNtL0A9Cvk5B6Wsf2oS/M198dOKyPp/hM1E4H51zOQ/+T5P5rbvUeHg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 14:47:01 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 14:47:01 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-aiohttp: Upgrade 3.7.1 -> 3.7.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201028174622.7515-1-leon.anavi@konsulko.com>
 <20201028174622.7515-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <306f9afd-be02-fbb2-d1ff-f1ab4e172fc4@windriver.com>
Date: Wed, 4 Nov 2020 09:46:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201028174622.7515-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: SJ0PR03CA0128.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::13) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by SJ0PR03CA0128.namprd03.prod.outlook.com (2603:10b6:a03:33c::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Wed, 4 Nov 2020 14:47:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da285ee3-7034-412f-cc90-08d880d07d14
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5085:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5085B9EC14DA4B93E2BF35F59FEF0@SJ0PR11MB5085.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1002;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pW3NzYnWG44LdBxiiEtNuqrIQvv3iFXIxR6XqkN1mkuTawNTqG03XaT/aDf9eyghv+SsTvsJh+PBLFpoXS7+ZMwuYAYeTZlombG3EoMylzdVdTSk/qIAU42QKOAC6jJGTwvaEOnZPl/NcjmZJKMlMxA/Go4QF6/38CUnOm7ifCZ40nG9RGUWuhZHpcYy8RpiQ6jAYcGDIpFnveRQp7YOLZAFr5VP56+ktd7845aEVCdHIT29gzlP2jNAbttrNWYVQaMsFaWn24Qfe+SkVP56A0aHu2PJQVdKwhLzgNuizdD/r4F7tYqnt4p/gHHZpMYgN78iTyfHxkH6ZUSS2qmZTYjskAo8Rh+h5dMGkxyFCx/zeklPpd7v6B9igYZzHKh/wLF/VBYeUOKxmVUwGrLYFxtguBOb94ZqlqkP8+JnJYv3M70r8fjaqxnhsuxA7X4fQ+5Gfd2JlZbQkIRN7PI7bg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(366004)(376002)(8936002)(36756003)(6486002)(166002)(5660300002)(8676002)(33964004)(53546011)(66946007)(86362001)(66556008)(66476007)(44832011)(83380400001)(52116002)(478600001)(2616005)(956004)(2906002)(31686004)(316002)(186003)(16526019)(966005)(16576012)(26005)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	PkhXHNHZZYor75SBi2VnITP58gNMJSPTrpEAfoo5I8Gqn2MYfB7Qf0EKZ7CZLvt+e8oSl59sVhMR2jhIIDFw76AYlL1bsjYSbfCpGpmL2Lv2hnpDrb03oLPy1vUDfEzITWwQoeDdYdgMPNg4GeCF+R437qa9bkZpEE17NowQ2Zsyp6Ka5adcre59D0esxUbyGKaCPa/4FrhHr9Ih2SYyCu/vrc9FwzEcAxh4JfE7cRz+eH8qdqaw/SsWQN+F4g0T+ndteKHO3e+b8MUfa9U0aI0Reurjr4lCVf2Cgnl2OuwSPU1EVT798DesNTGRmTzJ+9s029BhPvvkxnG/7exGRoJXtyzg+ENf1+dx/qzzhqssSCDtn1xfGelV10bV3JsIYmlV9k/CWicrJYx76jmZrhxTe3lH2jkZ5J7AApUcDjZanEpjEquraGyX22wvLUZ8gwG58nZkc2T9lu8ZEieZpVbedXzjSgXjYpAAO7QRHhWJV17d2k1q7U6w8hWlcNY2Wc8FWNqPCOEqgGL8tH+jRCOScHO3uowm3VvofjnwcV9K/YlQmmf9OhJFROQexOzS+AaO1qrLLhFHGy4s4sDXTMHJT+T0VDudDXNg9PNb8OTjW9z5z566ip3+oF5QTBo5xm346//D+ED9LHDwBMBsjw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da285ee3-7034-412f-cc90-08d880d07d14
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2020 14:47:01.5351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VO5kCwl9LECtzPLJEOxjhhz3+aEUR9yRaGRGOE/HGRK63l8d2WJYx0CiGXMU9VwNSZhlt8aAzXcp7vqJtMzgPnBPXlEctIEyaN6bffleFxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
Content-Type: multipart/alternative;
 boundary="------------C7FE70C01EBC25A4955CF386"
Content-Language: en-US

--------------C7FE70C01EBC25A4955CF386
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/28/20 1:46 PM, Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 3.7.2:
>
> - Fixed static files handling for loops without .sendfile()
>    support
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-aiohttp_3.7.1.bb => python3-aiohttp_3.7.2.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-aiohttp_3.7.1.bb => python3-aiohttp_3.7.2.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb
> rename to meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
> index 8b5b1dd160..178e68bd97 100644
> --- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca"
>
> -SRC_URI[md5sum] = "ed78633cc420b29d3b61c7d877dc0901"
> -SRC_URI[sha256sum] = "04f9d70f6c4d089be5068d7df6281e638f6820d4f1b1ec3dc012b0b43fa997d2"
> +SRC_URI[md5sum] = "dcf770341241aa09340653a1562ca816"
> +SRC_URI[sha256sum] = "c6da1af59841e6d43255d386a2c4bfb59c0a3b262bdb24325cc969d211be6070"
>
>   PYPI_PACKAGE = "aiohttp"
>   inherit setuptools3 pypi
> --
> 2.17.1
>
>
> 
>

--------------C7FE70C01EBC25A4955CF386
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/28/20 1:46 PM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201028174622.7515-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 3.7.2:

- Fixed static files handling for loops without .sendfile()
  support

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201028174622.7515-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-aiohttp_3.7.1.bb =&gt; python3-aiohttp_3.7.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.7.1.bb =&gt; python3-aiohttp_3.7.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
index 8b5b1dd160..178e68bd97 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.7.2.bb
@@ -4,8 +4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/aio-libs/aiohttp">&quot;https://github.com/aio-libs/aiohttp&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca">&quot;file://LICENSE.txt;md5=3bf3d48554bdca1ea7fdb48de378c2ca&quot;</a>

-SRC_URI[md5sum] = &quot;ed78633cc420b29d3b61c7d877dc0901&quot;
-SRC_URI[sha256sum] = &quot;04f9d70f6c4d089be5068d7df6281e638f6820d4f1b1ec3dc012b0b43fa997d2&quot;
+SRC_URI[md5sum] = &quot;dcf770341241aa09340653a1562ca816&quot;
+SRC_URI[sha256sum] = &quot;c6da1af59841e6d43255d386a2c4bfb59c0a3b262bdb24325cc969d211be6070&quot;

 PYPI_PACKAGE = &quot;aiohttp&quot;
 inherit setuptools3 pypi
--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------C7FE70C01EBC25A4955CF386--
