Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.83])
 by mx.groups.io with SMTP id smtpd.web11.42373.1606165088009036876
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 12:58:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EWsygWiO;
 spf=pass (domain: windriver.com, ip: 40.107.223.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z9tTWKaGj1rBmL4LoPRL2VsVuaO2gH/uQeNUiUsuLBaST3bD+NaouEz7C0KdZkjab4BawMLCqmd6FZ3AsxsNkiUJ89XvT17fIOpCcA2aiV7E6DLuZfDcWk2rfMLZCz1QZ9ZQmekFZXzdiKFyjImB4Hk/nf0/457STwtOVe3hU/wWdKS79g9sS+tTJqsgcNH9MxpA26pYP2oirIh/0y3jU12fgjAafn0KwxQ/r+WeDpc8VDYksxgL0HNyDmHXZZOdgXLk3D7d3/JGPcRbXEZv+H7D5yf3QyL90AdU5JXZStCNULN32g/+zT13gGMMH85YMLj5dP5U7xqKijSJjCCZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcihTJd5Ef3gV7Bu2j+m0zVT3r3UrWCwO3TLEFQ+upk=;
 b=V0uEUCGgtRy3iI3ndRkIP6sIlfDq1C1iH2C5ORurNV22hGl6hKaVq0zOUoulCXXehNDFiQSwKgtym3jroVNUXrmPzSGiXGe9ZmOl17yfWOb9UUttADUXRBijVF17xAvYua4oevPYwrOVflE/ROsUvCZQyM4V+bGTGkEIsHUHdxZAngIURriWrFd3X5IJd97YpgQN9AIXNNeKM8voKs6uO1yIt60tzXmxI33i7myVQBft7brfemAF3+VztJivYG3eyJawXQZZlfuuLSmBeBg70TrdF28w5tX60iZaa3GwrEkKCItEKtESNSuW6a1tLnnFO4LXW5NK1wzQJz20MeYv6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QcihTJd5Ef3gV7Bu2j+m0zVT3r3UrWCwO3TLEFQ+upk=;
 b=EWsygWiOQx9aZvEwgi7VqZa2lS1cbFvwT9zLlddCQyptDdaDFt+fLH+HSwiW2kmEwPIrOjP3kZf6YWr8juygzgyzw4ihuLgKmjVUH59ILe3COeWTU2AXMOJVtMgSTGFrRsBpjFn2LovvxaZ5efZBtcWw/fWwd8GMBu5iHnGr1Ac=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2600.namprd11.prod.outlook.com (2603:10b6:a02:c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Mon, 23 Nov
 2020 20:58:06 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::3b:680c:aa2f:e498%4]) with mapi id 15.20.3589.030; Mon, 23 Nov 2020
 20:58:06 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-toml: Upgrade 0.10.1 -> 0.10.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201120092910.30736-1-leon.anavi@konsulko.com>
 <20201120092910.30736-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <adff2801-cbce-070b-7c26-67c4146562c8@windriver.com>
Date: Mon, 23 Nov 2020 15:58:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201120092910.30736-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0055.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Mon, 23 Nov 2020 20:58:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6598f85c-753b-4552-0d12-08d88ff279ae
X-MS-TrafficTypeDiagnostic: BYAPR11MB2600:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB26006E7A3567F99C0D66C8B69FFC0@BYAPR11MB2600.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Cdhaujbu7AILjPFj0qbS+PsKhXdHH+MijPFArk4KhKHoHUWTH+Grm1tx2hiXWl24OYGgx62axaAPV9YQaOHrYPpxAfXZ4qZsAJEsx2RTWsESywjgu21y5XqChJ0zt60ZV8wnOsrWxS79ADpv5UoTP8rNs2E/tKRz5idM3LZ1xqmi3/nAGH8Un1hYkrGYLJmDFzUDkAl0QZcSC8NwMDFzwOiFx3seARySEOk3jfgMkl2Q+EOOA8qRo8qtL3yJTSW4S0q7o98Vy06plCcwFTJdFmADspJiP/2uccOi4allsPQP1bgFbJPG0JeF5Zsihbw4b1U1vk/c54y5KEc051kSMPIrvG3aoRF+Robr7jK/tM3umYrlkzpA0fuz86pqe1QO7H/Y/ERgO8/riyiIzWLQZNTQdW7nUgU6Pz14cUjILrYtRiftluT4jjngtjyvABhdn/lJVux5aZM+F9/Fl5L+ZA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(136003)(346002)(396003)(39850400004)(2616005)(53546011)(956004)(16576012)(83380400001)(33964004)(52116002)(8676002)(44832011)(8936002)(16526019)(66476007)(66556008)(66946007)(166002)(316002)(186003)(26005)(478600001)(966005)(36756003)(86362001)(31696002)(4001150100001)(5660300002)(6486002)(2906002)(31686004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	t8Hy4WwwrTSQKZ5nLHJEXaxO7ZwyepUcXN0PmDYml6pZAZ6OjjCxPCwUa5lM97eAycWH+o+9VBzcn6H9+Zg7U8nGtFz5Fddw+qhy3QdqBauOM6hdmH0GQtOfWIphXXeZd7AP0FaXqCGG6F2TQHVSZBE+LEl6v1htJ7Gn5ZWtwpvNFKdv4uti9iCbityBZVKHShikiPFFaKDGDWwuUeZWhoYxOrnha0qyQ2kO5vat3JG5BQ02Pn/NuSx3sCFNfWZUFEPx0kyI+On1//xJ3/0TF/Z6CSRsaIcYySzoEPM1TYmzZMO4XkFrVBoIY40dzp7t7DPGsat2aV6NMuHnv9zcLHcxg/BxyU3p5LdF9RAz0e+RgDJr8zWg9c20MsQYjqvX55EaN/GmeLR3t+Tc3XiEla/TgqCiZ1XGoFs+ZDxJ+rBgmEEmuoZ/ao4JPrhXq6gQ70lRzpYdGTV/QQ1kWjEBWOy17DeVSPJfFqfoQnJiLFzEyJza8MvriZcYz4GAjxJGrgwLO5GTvUqrqjFDtjCtGxdgZ989e5RPflvwJQNO2FvX89P3USv6gyZcyRXwArIvX8lro1LFl3vWYRfVEiRktsXf+ZljYTC8i4VllUir4Plou5odFhbw2/UIW/C8VtU9rT/TJQ7V/Y5GAP3vtuE0FnyEdohiju1GW7gc8u1gDDHDBHMtWgvUyJvOr2MqWbl9av4qvhNFHGRvX7SknFHyuAaj7J4CRAU7l/98UQ0MTvyk7F6voKEscsOlXhhR5tinjA8t+tOeC117uwqWupiFJB9ZhK401w2TbaclZo+tYLAKv813YwFXez8idO7VHOGydfAydvwDpEwjRDSddwx+5JZCnslQyJS7WCw+u/FrwwbQYt7z/QB1fw/9ZPXaQ6x/QDnjo/XmE58WfOFgm45wpA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6598f85c-753b-4552-0d12-08d88ff279ae
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2020 20:58:06.1701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MS0ILfWaB6kNlrx+bPFKe8xQLin9RkIgOsWleSfIuIOMfak0jJ0Zqqa6qse+1XrF48XkuPxE2IcPJpzFXFh/KPXGFP6CTwdM1Jo9o5gTVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2600
Content-Type: multipart/alternative;
 boundary="------------95E00BFF3D8C132C2024C843"
Content-Language: en-US

--------------95E00BFF3D8C132C2024C843
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-20 4:29 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 0.10.2:
>
> - Added toml.dump example to Quick Tutorial
> - Skip numpy tests when numpy is not available
> - Bug fix: ids were based on the string, rather than the actual
>    object which causes incorrect detection of circular references
> - Show meaningful error message for wrong case booleans
> - Bug fix: broken quoted section name starts with dot
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-toml_0.10.1.bb => python3-toml_0.10.2.bb}  | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-toml_0.10.1.bb => python3-toml_0.10.2.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-toml_0.10.1.bb b/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-toml_0.10.1.bb
> rename to meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
> index 00f38c6c3b..b46eba6fd1 100644
> --- a/meta-python/recipes-devtools/python/python3-toml_0.10.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
> @@ -4,8 +4,7 @@ LICENSE = "MIT"
>   SECTION = "devel/python"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=16c77b2b1050d2f03cb9c2ed0edaf4f0"
>
> -SRC_URI[md5sum] = "743131c431419fe42f854cff02ad3abe"
> -SRC_URI[sha256sum] = "926b612be1e5ce0634a2ca03470f95169cf16f939018233a670519cb4ac58b0f"
> +SRC_URI[sha256sum] = "b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f"
>
>   inherit pypi setuptools3
>
> --
> 2.17.1
>
>
> 
>

--------------95E00BFF3D8C132C2024C843
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-20 4:29 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201120092910.30736-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 0.10.2:

- Added toml.dump example to Quick Tutorial
- Skip numpy tests when numpy is not available
- Bug fix: ids were based on the string, rather than the actual
  object which causes incorrect detection of circular references
- Show meaningful error message for wrong case booleans
- Bug fix: broken quoted section name starts with dot

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201120092910.30736-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-toml_0.10.1.bb =&gt; python3-toml_0.10.2.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-toml_0.10.1.bb =&gt; python3-toml_0.10.2.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-toml_0.10.1.bb b/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-toml_0.10.1.bb
rename to meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
index 00f38c6c3b..b46eba6fd1 100644
--- a/meta-python/recipes-devtools/python/python3-toml_0.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-toml_0.10.2.bb
@@ -4,8 +4,7 @@ LICENSE = &quot;MIT&quot;
 SECTION = &quot;devel/python&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=16c77b2b1050d2f03cb9c2ed0edaf4f0">&quot;file://LICENSE;md5=16c77b2b1050d2f03cb9c2ed0edaf4f0&quot;</a>

-SRC_URI[md5sum] = &quot;743131c431419fe42f854cff02ad3abe&quot;
-SRC_URI[sha256sum] = &quot;926b612be1e5ce0634a2ca03470f95169cf16f939018233a670519cb4ac58b0f&quot;
+SRC_URI[sha256sum] = &quot;b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f&quot;

 inherit pypi setuptools3

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

--------------95E00BFF3D8C132C2024C843--
