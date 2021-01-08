Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.49])
 by mx.groups.io with SMTP id smtpd.web09.1905.1610121784647033269
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:03:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YPtOJMnR;
 spf=pass (domain: windriver.com, ip: 40.107.243.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQFAZ1UH5FLJHzerfwJR6xgR8U4AAoNkcyCF9wu2Q37+JJyE1x9PtytL8nuFBzOuBI+mP5J+SqX+UaCZnPK025cZUX5xxnIAAqFZ+KpG7fl9pJoGBRcSM5xk4T2bSvZLwmylwMK8iwcmxHoWsADnxdr3Y4zyvYODa/1EUgWf66Rexftsd9/AdGPMVT37Wvbde80lZxQY/NSnTMeJ93Jxddd7dv64AQSAaDSSylOJcpLQhUmUNe1SQ2XMM6eiBNqG07iKOQqV1HMaB+MsNGlYavh1qFnOvDwjsd7nJDuEcUYB/xvrRAksx8TLhgIRCSJl7EFnqxbLg2O6XZ3ZUgXpyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxrEcsOvpehH0c2JxAXqhdamtjjuiJZvmwFCH8XhusY=;
 b=ZPp4BPGJhDTx3cnxCqxsmKUII7Pp4aQbLE3LvcoOxpe0f7Y9HS5V+eDWl4jeZEGSkPqESy8hDZ8woOu//tFtU5U3XHVM2IqvWltuRzgH3sZ5+FJe6fwOamlm3jPoIRBXiDUbBkDwm3Wh9nGXTHyKH/2s4Ml3mlj3i6KAsgEDxug2ICPUZ8G6Hrq31C5zm/xjnDDm8HypVTJRMSqHYbw2oVdLGu0BkYuWY3/ySHQiybUZLIzYxDB4Mu/LO+0sjAqNUMozKM1m1ME1XYqQ9EmrS2QwiMFkoQfWU951lwHAb4Z5ZWtiT4AUE9ZqTigqXDYr/ITH2wqVMsHbS7dr4QTTNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxrEcsOvpehH0c2JxAXqhdamtjjuiJZvmwFCH8XhusY=;
 b=YPtOJMnRRDfbondXP3CJsbdm0icGu8vJrdBTVIASA3ZOaW2vnPj3SOWIi2VP5BTKBNQowbqBEAmqFxYngmZKHcFbVt9VwcNHZ5a/qao8LT3dgisdX6EQZlipx8/08PeoAS0gcU7dro7eXRr4DBq+pxNCxjfBz3DWmwem8eQnUAg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 16:03:03 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3742.009; Fri, 8 Jan 2021
 16:03:03 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-multidict: Upgrade 5.0.0 -> 5.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210105151638.15700-1-leon.anavi@konsulko.com>
 <20210105151638.15700-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <aaf254d3-e3f7-3271-e3ad-b47e0d9aedb4@windriver.com>
Date: Fri, 8 Jan 2021 11:03:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20210105151638.15700-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR18CA0020.namprd18.prod.outlook.com
 (2603:10b6:208:23c::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR18CA0020.namprd18.prod.outlook.com (2603:10b6:208:23c::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 16:03:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e565432-cdce-4c90-30bd-08d8b3eee15e
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4896:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48962BC3E83A71243BB178549FAE0@SJ0PR11MB4896.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	chzKEGtG1g8gIfVbaz5zgzKgbD0F9mzdOqa5XQTeE724SMkKeVneGgaGY41G3L0XO3F6quQaSkgnLctf+pndbWMFltY1YfV7wn2rDIL2qmRxhUs0v2FP8MNglts2kDwd3zF1V3SMzaZTdW3cDRpLBI+VGjc1JGslZcQhei5Ph/53wGFVnpHgouw3qOlQkV7ShG3wwA/snhtirzJhIlZFRNHfYutx9BOZQ/BLFrol3bLG3rqW2NRcuA26TWhFo/A/IEH3fpVmHkmsbgcZHNVhLUuqyYUupuSBgmGN67Nvp9KuXGW7XUncPA2hfLXpydmMr85amuuoVj8Gvw/GsYLLIhuPnD0EVksQnAsBvtJ1DyiOgPQscfqrG2pEuPVvVQnnUTRSVb7DBCE+v7RkdXf1yv0/ZTvQQJFOz12JYGl8E8hgdWw8sV2TzV4sr+PbQlELcRbIiPOsju0TQkGgqdprL0aZ6o3038scr4jz3oS2FP222DXQFtsmqN3GZob4JQTEtkYwg5C98J1xJnKhlDaQHq/FbGUVWI4cXvXjb4PSZ091aDuM12pmYASDY1BhVFGA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(478600001)(186003)(16526019)(31696002)(16576012)(316002)(86362001)(36756003)(26005)(2616005)(52116002)(966005)(956004)(83380400001)(2906002)(31686004)(53546011)(8676002)(33964004)(66556008)(8936002)(5660300002)(166002)(66476007)(44832011)(66946007)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Q09ZTVgyQzNVQXR4MkRIZ0Z5czFJTWxOdzZrcVdmbjRXTXlaZVp0MnVtRkFs?=
 =?utf-8?B?b0QxR2dzOElLbnVpVG5vMU8vdHFYWlJYa01lVHBFbzBVSVpMWWVrNVlqdXJL?=
 =?utf-8?B?NEhNZXV6VUlZNG1CbHNTT0dMTG1ZRlhkNVdxZ01mS3RVMithM1BVYnVaWHVh?=
 =?utf-8?B?UWY3V0pGK0hHOERMUUFZeEkrTDh5Umg4QXZIbEhDZFhHQjY0UDVwcHlCZVVp?=
 =?utf-8?B?Z043TmdFWDNNZnVyYXBuTklmaHd5d1FrWllvRWVRU2NEd1loOFV2NVREN1pK?=
 =?utf-8?B?cWt4b2RNTDJwOFlTK0pSak1oWTJ6aEJMakJYaVVmdGxPQ09ES1hJQmQ5c0ZY?=
 =?utf-8?B?czBKSFVpM1RFdnhwVjlLRm51dTZRbk1NamZoSFR5VXE4QWhBWUZkQVdpUlUw?=
 =?utf-8?B?bUNWaU9wZkMvb0NQZ1AzM2dWTkNrNjE1ZCtXMjRiT096QXBvcllJcHFldHNz?=
 =?utf-8?B?QXFFOGJwbTRsLzZmN2d3Z0NmRnM1aXN2Q1RMVUpab0c3N1VKQzlWbzRteE10?=
 =?utf-8?B?NU1tQ1lhejBnVlNTOFFKYjg0UHhGLzZUbUU1RGZUQkNQekwwSVZQcm0rZjdP?=
 =?utf-8?B?TVBDNkM1akZiR1dDK0tQb0ZkejhhVkNpbWZYS0pzenRBaWs4QWdXUXE5ZzFw?=
 =?utf-8?B?cGRGbXFZR3VQcHVkdUFUSXZvSXpKV2krMEtNMUhYWmkxaDNGUTdLMVQyWS9o?=
 =?utf-8?B?NXBJdDRhclJlb0wxaUxwZDZQUDcyV3crZEFqNThWYWhIS29BUWRyNFVhSWNQ?=
 =?utf-8?B?bVV3amo3ejBCSCthNVplR1BiNWdIeFNUTzkrNU9UQW9mZFd0NzZjSWtNN3kv?=
 =?utf-8?B?K0VFVDFKb3Z1R0VkMlJURHFZdFRZRzlNUmJVWXF1ZVFPU0Mzdk5ZaDJNaEht?=
 =?utf-8?B?NFZqS3AyU0xlUnpSYUZMUnQzZ2ZqbkJBZEpuTjVLeVRLcDlackxJRkt6NUd6?=
 =?utf-8?B?QXpoRDU5SmhJQm9wREZXQlJWaXo3aE1XL2R4QUtyTkRQRk42U2ZWam9rRjNL?=
 =?utf-8?B?V2pFZ2FYSUNUZUF0ZURIVzhpT1o0VVZ2MnVYQTRTd25PeDRJY25uVGNUZVdp?=
 =?utf-8?B?elhyRUZ6WG5SOWVmWVpVQWJrZ0dZNkw4QUpoR2pHMzBWZ2UyR0N6VFdzNGoy?=
 =?utf-8?B?MUhwTWdkdlpLbzN0Vlo3TFFjQ0xJYmlUNWRSYWtUcHJlWVFkUE1XSityTlBU?=
 =?utf-8?B?QlJTdGYvdjZPNzBtczZEYWxVTGhWYXJlbTZmSHJIU0k5Y2ZBNW5FenoyMVpn?=
 =?utf-8?B?Y01FSlhiYkdPc3A2dGRTU1orMmk5OWRDZGpmUnpPNjAyWlJYTkRBYkhHUUI4?=
 =?utf-8?Q?lJSECK7YF1IpdbPtzxEDA0SmSH5BhchrWq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 16:03:03.6480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e565432-cdce-4c90-30bd-08d8b3eee15e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vooNi12WQWZaUDsXZZPfHihEIphTImr72BVhFCNpnPLSabSFED2I4Ry0WyW5Ao1A5kmerKpwV+n0J0LyuBp6qEvcs02IT4ARg8frvzxza1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
Content-Type: multipart/alternative;
 boundary="------------AE5AF38F16B38DD1CF1E7E71"
Content-Language: en-US

--------------AE5AF38F16B38DD1CF1E7E71
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-05 10:16 a.m., Leon Anavi wrote:
> - Support GenericAliases (MultiDict[str]) for Python 3.9+
> - Synchronize the declared supported Python versions in setup.py
>    with actually supported and tested ones.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-multidict_5.0.0.bb => python3-multidict_5.1.0.bb} | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-multidict_5.0.0.bb => python3-multidict_5.1.0.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb b/meta-python/recipes-devtools/python/python3-multidict_5.1.0.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-multidict_5.1.0.bb
> index 676fbae7ed..b960affac4 100644
> --- a/meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-multidict_5.1.0.bb
> @@ -4,8 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/multidict/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a"
>   
> -SRC_URI[md5sum] = "c2c3311e25636a6f213e998cd1e80d72"
> -SRC_URI[sha256sum] = "1b324444299c3a49b601b1bf621fc21704e29066f6ac2b7d7e4034a4a18662a1"
> +SRC_URI[sha256sum] = "25b4e5f22d3a37ddf3effc0710ba692cfc792c2b9edfb9c05aefe823256e84d5"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 
>

--------------AE5AF38F16B38DD1CF1E7E71
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-05 10:16 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210105151638.15700-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Support GenericAliases (MultiDict[str]) for Python 3.9+
- Synchronize the declared supported Python versions in setup.py
  with actually supported and tested ones.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210105151638.15700-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-multidict_5.0.0.bb =&gt; python3-multidict_5.1.0.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_5.0.0.bb =&gt; python3-multidict_5.1.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb b/meta-python/recipes-devtools/python/python3-multidict_5.1.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-multidict_5.1.0.bb
index 676fbae7ed..b960affac4 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_5.1.0.bb
@@ -4,8 +4,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/aio-libs/multidict/">&quot;https://github.com/aio-libs/multidict/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a">&quot;file://LICENSE;md5=e74c98abe0de8f798ca609137f9cef4a&quot;</a>
 
-SRC_URI[md5sum] = &quot;c2c3311e25636a6f213e998cd1e80d72&quot;
-SRC_URI[sha256sum] = &quot;1b324444299c3a49b601b1bf621fc21704e29066f6ac2b7d7e4034a4a18662a1&quot;
+SRC_URI[sha256sum] = &quot;25b4e5f22d3a37ddf3effc0710ba692cfc792c2b9edfb9c05aefe823256e84d5&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------AE5AF38F16B38DD1CF1E7E71--
