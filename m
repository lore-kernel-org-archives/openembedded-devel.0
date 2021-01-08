Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.44])
 by mx.groups.io with SMTP id smtpd.web11.1945.1610122064528633784
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:07:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BeUrZJB5;
 spf=pass (domain: windriver.com, ip: 40.107.76.44, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dzqjx8wLzJdFCOJqmMLUrsTU+ZwNBUsvVu81EPBFdy17XXdg6W0fDLd4FlNavzqtEo+WDn5LurILJa5bBKhyclqzN83OyXE9bXcx/UmQJ6wz/+K+j6DTpo5sN8+QxFxUkR1pLjns3FD+dm548Jjq4B57poI9kZaNq7GR1fgms6zyxWIzdfsgXm3E+D3LSURQnYi32ebysG0flXNuQbTxLyAG8eYOUeGljSyQ8OUCs88RfHN3GV4k8i2pEH914k84AmlWoZJrk9fuwemfSeVrmwihmpIal61lxbVhQ67jAbyvpWrLltWACLacNk7U3wPOE8JJP+4GPFoMAuj2zG9PFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOs6U12kGPBZ+cU8cg7gHsqTdMG2oPkUkGi44SHsemw=;
 b=Cw3ztW9gZNAy4aOWAlrTZNhxQGBPDHLyIyJTfXbZaT5Ki5nrUTdhjRJ/O8Y1Ytd+xZW8A/3bTyD26vEGcs407ipQGgUIgwhTfjT5eKTUHGOgXowU6bMl1d57J++5u8Qqmw8leokbJ4Wfm03SakTaqSqYd7eqDW1v5NBc0r55lmaoKnHZDXZupN5TOzaVq1eRpCe4+mDUcYPG0TI7ttgX2gVcfOZ9N7S/tm4D1aEioo4Q3b/+JZIRp4W9AB+U2CsChWJ8bEUqHYLtSBYjoZ267VsUoOP9ufVe6rbRc8lOC1PPnH+lblfsJxF/R0IJaRoMRDATCUUtpuM0WxZxut3abw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aOs6U12kGPBZ+cU8cg7gHsqTdMG2oPkUkGi44SHsemw=;
 b=BeUrZJB5QFCBAxwFIsokX0QegHHAoWgzq49PAgplJnmltUh8c8nB+XHxtrR9ZT0prcB4XZqSsnvNZOMU06Gg1ZqgaQhNiidYnWksyrzAdj9UxlM4JzLwvXTzq8xwUNDIBPmqrxp9eat4BccqHicVnrw9H17Cp4dUNjRcFPFK1U4=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4150.namprd11.prod.outlook.com (2603:10b6:a03:190::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:07:43 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:07:43 +0000
Subject: Re: [oe] [meta-python][PATCH 08/10] python3-cantools: Upgrade 35.5.0 -> 36.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210106220702.10483-1-leon.anavi@konsulko.com>
 <20210106220702.10483-8-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ffaf1ec7-81cb-1db0-9ec5-bf5cf525fa76@windriver.com>
Date: Fri, 8 Jan 2021 11:07:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210106220702.10483-8-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR01CA0058.prod.exchangelabs.com (2603:10b6:208:23f::27)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR01CA0058.prod.exchangelabs.com (2603:10b6:208:23f::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 16:07:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2103c5f4-846a-42f9-111b-08d8b3ef8821
X-MS-TrafficTypeDiagnostic: BY5PR11MB4150:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4150471E03F2D90AB98506C39FAE0@BY5PR11MB4150.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:400;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MwHGjvHfud9D83sn8BLQgLwi1AlZRsUvkx1RxOEWiNjgD+FTeudf5aIb80mC3LMNpTR4+Di6WQFS6Y/zO5EUUEZhlk87dIVSpk3Q0/lfZhNR5djNI/D5KKfEEJJRW0wMt2U3kEVy1X2w2+4mefiORucByMrE4l37GFCaErXh7jucAxmW8xp//Ha7sijgQYra8OgGIoTCYkicsBwEAi7o8r8+Y/wiLN/unR4fjPvkQvFckH/KseEykZ9fxut+Nz27YhfPF8Lwsknj7SMZqz9c7zFDOcBO9P7R/AxJtM07YuV28m7X3a2DA6diE2Uv2jcK/9yqqjkSgnafDlMEuut6imrKEf9xwMgGMtcVImINNTN33rxSSHl9KbRd0oeT17arHFh2NCNbHNp1zlUdjQX8Q3UCu3PvT/VL2jXEZWYlYvpuQjHSjLVBWBflnc242KMZs+yDRKJ6qR3dqjrLteWYdh8QHPM6kXbJmYNIIPK1dLqDse880na3HYzdZC/lP9qXHYqgKaOUxVlOj7TLGA0flQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(346002)(39850400004)(136003)(956004)(2616005)(66946007)(16526019)(66556008)(31686004)(44832011)(53546011)(66476007)(33964004)(31696002)(186003)(36756003)(83380400001)(52116002)(8676002)(6486002)(478600001)(16576012)(166002)(2906002)(5660300002)(86362001)(26005)(8936002)(966005)(316002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?YTFIUytHdG5SNUZENEpZeDJJVk9WRE9MT25FL2FTZ09DQUJsYTZWcGpIRGNT?=
 =?utf-8?B?TVl1eEpFNnpocDBXQVRiU09aRDRHbmNMRzlkcUxTc2NEelAyNS9hejcyNlFP?=
 =?utf-8?B?VXE2ZWppNDNGNWZMT3ZOb0FlcXhQS0w2eEFsS2M3S2VoeG1oc0Z0cll3OUlj?=
 =?utf-8?B?QnFwQVlnU0FZYzBpdy9qWXVzVlNMVC8wT28yL21pby9wV2NsQXNvOW1XUHZO?=
 =?utf-8?B?TWF0cjYrdVlkenkxeWxrMW1OWlhxQlNVRHAyMCs5Y3AxSmM0OVZ5c09EZHBJ?=
 =?utf-8?B?bDBhRG13NElDSmdXZ1VydHU5OENQcWUzRXphOTFPd0tGSE5KNkl4QVVUNTMv?=
 =?utf-8?B?Yk8vRnQzSGpzeENCampUTmw2S1I2UTUrQThHMjF1T1FDakJWelpaT0pyOVlB?=
 =?utf-8?B?REhBMHV6WDlWZWs4eGpJK0FmSE91emlBaThaZ1hmNGU4UW54dVV2dGRhR3FS?=
 =?utf-8?B?WURYVXl6djlaUnJKd1J1YW40NlBvTXh1U0x6NS8yblBwL1djRUZnd2NMZ1JX?=
 =?utf-8?B?NENZVjk5cjFMby9WUnlFMXBJQ2pGa1B5bVhvRlhxem9JMTRidUl0T3dHTWk1?=
 =?utf-8?B?b2JtZnNVdkF0ODhQcnJzeHNvbXVOdThTVW4rbWdqVy9XOG8wYjN6RHZZdGY5?=
 =?utf-8?B?SFNkaStZdjlLTVVVaE9GbUw0bUk0eWRkSW41bE9BYzVNcngyY3NvNnV5QmFz?=
 =?utf-8?B?YmhZQ21ZejA2L1B1eTZQdVNZVHZWbWorOXUxNmp4dk1nS2t1bzk2TUlTNUVa?=
 =?utf-8?B?My94eVZFYlVCV0xrVkxzSU5oMGNnSGE2dmRnakZEZTFJMmc2QUVWSEhhaGRZ?=
 =?utf-8?B?SWRyVUJxVGs5T3M5bHhKbSs5elVSYmVUWGFObWVvQU9YL1UxSVpMLzNqUHpa?=
 =?utf-8?B?YVh4RVU1QUl5REJqZUhrWCswMTFTTG0xRlo4TUlEYWNyQ3hENHpadHR2WVQ2?=
 =?utf-8?B?VUpPR0JNb2EwSFYvY1g3Qnd1Q2pnVENCbmt5V0VZV0Zka25BeG04MGRtZnlO?=
 =?utf-8?B?VUpUakFrVEZ6Sit3WEd3allCVEZVRGwzcWRuWFU2aks5VHBDa3ZFY0Q0L3l1?=
 =?utf-8?B?N1lIUitTMUVIUW5namlndXNNTi84R2JqSkU1aFdWSWR3UDZ6bHhSZjdKcmls?=
 =?utf-8?B?dkVnZmgzWUphQ0NYVDd0YkN0ckhuaTJMaWYyRkJVYjZMSHB3UXZ0ZWsydE5x?=
 =?utf-8?B?WnJRZVpSS3BYN2ZSYi9UUWFQUlJoS1c5SUoyMVlBeEo3ZDl5ZDNFZ1NLMitO?=
 =?utf-8?B?a2xweEgzbEVmclFSVm9aRzRlamxML2hDTUxaZkNjRUhmVWhtd2o4dkdZbGE2?=
 =?utf-8?Q?txwvFU8J+BIBYBWm7nc9RipYVEgo/HZHkM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:07:43.4469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 2103c5f4-846a-42f9-111b-08d8b3ef8821
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0OrmgwbHDc0U88+wtdlHSKA/Vf8czX8o28f7mv3dzhctMu2IqKXd2x2YvwK7ebGIRZR0PVeUPRPmcEGo6c0gxGmHaHr8gzUbPMoNRBCqLDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4150
Content-Type: multipart/alternative;
 boundary="------------3341B9E220B15987ACE8A13A"
Content-Language: en-US

--------------3341B9E220B15987ACE8A13A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-06 5:07 p.m., Leon Anavi wrote:
> - Added sub command plot
> - plot test: parse output of cantools decode
> - added plot subcommand to readme
> - removed unneeded code
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-cantools_35.5.0.bb => python3-cantools_36.1.0.bb}  | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-cantools_35.5.0.bb => python3-cantools_36.1.0.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb b/meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb
> rename to meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb
> index cb70ed3188..b2f3fd6d82 100644
> --- a/meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
>   
> -SRC_URI[sha256sum] = "ce26ab5d54762c314bedc35b407d498b8ae11069ab4d9251f8ac83f2956438f9"
> +SRC_URI[sha256sum] = "3c4c2652907c48e7013f825cc3068b5d47a38b62f01bd04aaab1d9f69a8f53f5"
>   
>   PYPI_PACKAGE = "cantools"
>   
>
> 
>

--------------3341B9E220B15987ACE8A13A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-06 5:07 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210106220702.10483-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Added sub command plot
- plot test: parse output of cantools decode
- added plot subcommand to readme
- removed unneeded code

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210106220702.10483-8-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-cantools_35.5.0.bb =&gt; python3-cantools_36.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_35.5.0.bb =&gt; python3-cantools_36.1.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb b/meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb
index cb70ed3188..b2f3fd6d82 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_35.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/eerimoq/cantools">&quot;https://github.com/eerimoq/cantools&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd">&quot;file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd&quot;</a>
 
-SRC_URI[sha256sum] = &quot;ce26ab5d54762c314bedc35b407d498b8ae11069ab4d9251f8ac83f2956438f9&quot;
+SRC_URI[sha256sum] = &quot;3c4c2652907c48e7013f825cc3068b5d47a38b62f01bd04aaab1d9f69a8f53f5&quot;
 
 PYPI_PACKAGE = &quot;cantools&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------3341B9E220B15987ACE8A13A--
