Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.58])
 by mx.groups.io with SMTP id smtpd.web11.2312.1590098368989035697
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2020 14:59:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GxIYGwQO;
 spf=pass (domain: windriver.com, ip: 40.107.220.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSMwZHwCqTmHeiYnTBxpqGagLNbmeLmi8/yQtWfAvjfB6IrxtL/hBwT7g5EkyZpMC6kRgytrBHGRz9zwpMKnavMdG5PFDqhkNWWJvU0jqhk/8wpexXvjRMjzS+uLHzQUMUEkEHOijNhk0LpccDeE2XeXPHMfweoDSdbrlDnDBQsAPwLb7/3C8uGQTo72opLtseFpsoy6MO3Y4ELcGogkSpulOm/ez9R7ULkMybzAhszWu7H6MepEThGRxD68bbpWZvzshRwnzcyOFupZ3dqMqcvTP9JK1jsqarltdh1XcOy/Wusk3xrT9t0tuXl7I6oC7hgZFhmfj3xf6gvmRvmGog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNMbfnAoQz62Wc+iBXCwk0tcBkOmydA0AQpu06jeYu8=;
 b=GWQCbb5dinpKinfKwEETE3NacRlNaMvSwJjb93qBnj6ECaceROdyDQFQIJBenR2yLCWzS4M12Psu1Nxm4rhZZexzAEhb3OBCDbv7cje5LUxpTwiLgam9YFZl0KN8tlPlrxX9m552J4K/OVCOo7+zK6hSSF2DkjWuZR30zBbT/9h81BmSKO5eER8HDZWtFpDq32bdjAYWs3VH/ihf2841ouf2jid0yd+FA11dCetAJCHslrEyHxPGOqH8UwiZAnfw7RdGwmjcKuiJ63wgrZ7YMcSQBAptQ96q4hJnCH6gBcAy4OQDqLcoNzRbbiHJqOWwbL55/2RgeNQ/hQG66UV5MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNMbfnAoQz62Wc+iBXCwk0tcBkOmydA0AQpu06jeYu8=;
 b=GxIYGwQOi6gwAQ2cuhDNGGPg8khwcnJoLRRuOPItuyEXnf2mULn8qpwr9vUdsUqwXp9cRXeG9nKM3jh+zW8OXUVSM37ZR4/Ynta9u7rCOafxK0WCGMpqnGa/2Vmwj/ZwM1a0L5lxQNvHYnr/L0K//Kgbp7sCSWkvIWgceEKWbMo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1780.namprd11.prod.outlook.com (2603:10b6:404:103::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Thu, 21 May
 2020 21:59:27 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3000.022; Thu, 21 May 2020
 21:59:27 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-gmqtt: Upgrade to 0.6.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200521122750.25059-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7c32910c-3436-7573-324d-aa337b34cbda@windriver.com>
Date: Thu, 21 May 2020 17:59:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200521122750.25059-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::20) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0141.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Thu, 21 May 2020 21:59:27 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae5dac11-ccb1-496c-af25-08d7fdd23b66
X-MS-TrafficTypeDiagnostic: BN6PR11MB1780:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1780C1FE53CFD4661BB3DBC09FB70@BN6PR11MB1780.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 041032FF37
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sMyxg9YVmOdRW34coyuGHMW+oDNV8247X2p/+uuGYEywl115mfHhG1AjhAFkq/W6maGqNErhX0Y9NP7fu615EFuvqxmHG87OIiOzTRSLrcKq8az7qZDZEZfIO5SRuAcMDg0iUwWi3DlHazXD/eGmhSbk5sNdlDMIK/RGfZK76DRDwoiRwAxsw8MYdD1pZcoehRYKRbS65HKMEhRGrmxnyqh9wWBFEOegbZnDzfAz/zJx6P7XSwdBM+52a7P+kiAAKWWVzL39NlxJIqIysDQHbVZfXHDBz8dIWqj9eqh6AxGk/7BrcAeCZY6jdATPtGhG+S9KtXk7cw2JpzewmkS91/tkgboQD0GokHzXZ7dD3F4R+BRosykcVpXeO2jms7C7JZhQsX9mTbrlKCHOQrZ8u7dYGBLaumzuH5k9Uf5DH1ZEJA8o6WKambF8NUxLVOcA+0NoDvK5xmPIMKWEOGZZfA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(136003)(39850400004)(366004)(396003)(8936002)(66476007)(66556008)(66946007)(36756003)(956004)(44832011)(966005)(2616005)(16526019)(31686004)(186003)(16576012)(5660300002)(8676002)(478600001)(316002)(26005)(31696002)(86362001)(6486002)(2906002)(52116002)(166002)(33964004)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	WXtr/B9thSHnQ8CFa+U2Dij5mUi4kxrm5OmH2DxIf1NlLs7nT3eK+bX6+Iqhl/A1lPOp/rx32XORHI42Khs+fn2E7Z2OCWOzmTzFFjJekB5br6uCiHMky6Fgh7DfjJrbOPDUu0FgyZV4baFB5XjB6cu5HfsDBF/PFom3gP2BF5qk9Quse8WJT1iIvjPccK8rfVSnzDiKx74GLi3C/ywH3f9x7YpLsYX8RHTTA0hYDMXuwjyp5zp6sYqO9aBiqygkNK7ubo6RbyPRVWHsZtqyUX3/piqukjXnSpmpUbwq3t9IDA0y9g4gkg38qNOhEWb0m2D5/81JmAumA5iEOy/kFhULUbk3j574Lu8VAS+UtgNfMOui9FDr6YIB17cX3a2B+1+La7W6sgH/mlKavNDKXmq26+6lWbomqUoSv19O/d+3MF4JRZgYXO/jV7sMzHJvNsAS7RlXYQbxzcdwbSsjU0zblExNGjvXpkuMKHkcIFEcPAK2DwAFW+M12JyJ0Sk5
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae5dac11-ccb1-496c-af25-08d7fdd23b66
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2020 21:59:27.9218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bc7LcqJ5yHGFKiAIwBLGrHPZ91ufxu9Z+odLQ5zJVKGYLKV2HPQ3SZprdSCzhbxgTFBvTVfb0BX/d0UDmACmGnX1f6OntmBb5DgMOT3z0lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1780
Content-Type: multipart/alternative;
 boundary="------------2B97801F53940FCB4F604DA2"
Content-Language: en-US

--------------2B97801F53940FCB4F604DA2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/21/20 8:27 AM, Leon Anavi wrote:
> Upgrade to release 0.6.5.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-gmqtt_0.6.2.bb => python3-gmqtt_0.6.5.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.2.bb => python3-gmqtt_0.6.5.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.2.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.2.bb
> rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
> index 8d4ac8830..379c7679c 100644
> --- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
>   
> -SRC_URI[md5sum] = "f763f12c5e6ba6f0fa0ec4a6dc8c3fd9"
> -SRC_URI[sha256sum] = "3b3c12cb62bbc3ee0bd81da3d9fbd78c5414098aaf58236c3663edfeda5237e0"
> +SRC_URI[md5sum] = "9388ec09b6536c4e68c5ac5c31de3dc9"
> +SRC_URI[sha256sum] = "c12b2d7d5a90f3304b7291b1d9d21df47e228dfb4ff990e965008fdd1a55ce60"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------2B97801F53940FCB4F604DA2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/21/20 8:27 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200521122750.25059-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.6.5.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200521122750.25059-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-gmqtt_0.6.2.bb =&gt; python3-gmqtt_0.6.5.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.2.bb =&gt; python3-gmqtt_0.6.5.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.2.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.2.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
index 8d4ac8830..379c7679c 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.2.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.5.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/wialon/gmqtt">&quot;https://github.com/wialon/gmqtt&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=903f1792621a3b35ee546da75d139177">&quot;file://LICENSE;md5=903f1792621a3b35ee546da75d139177&quot;</a>
 
-SRC_URI[md5sum] = &quot;f763f12c5e6ba6f0fa0ec4a6dc8c3fd9&quot;
-SRC_URI[sha256sum] = &quot;3b3c12cb62bbc3ee0bd81da3d9fbd78c5414098aaf58236c3663edfeda5237e0&quot;
&#43;SRC_URI[md5sum] = &quot;9388ec09b6536c4e68c5ac5c31de3dc9&quot;
&#43;SRC_URI[sha256sum] = &quot;c12b2d7d5a90f3304b7291b1d9d21df47e228dfb4ff990e965008fdd1a55ce60&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2B97801F53940FCB4F604DA2--
