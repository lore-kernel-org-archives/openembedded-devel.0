Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.68])
 by mx.groups.io with SMTP id smtpd.web10.26400.1605714743938353761
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2020 07:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=oyMHm4F7;
 spf=pass (domain: windriver.com, ip: 40.107.223.68, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lbDa7Z2mVVLX0WcM04ilJ42Hl+zpPbtmn/OL5cqhuscRatU6+vn81TBi/QbiS+Vpzwk8TY/ibOPMaIg1X6YDwTrIHi5VcK2nS9i6EUB6jh7n3gq0X1ovyEeIKpfAO8/3fr4hdheM9D93hHq/aQQsqa/H05P5ETNac1ugpPo+LE1ck6Mhd5FtBVlbI5Et6c1MjpJQWgc1/O7sOqJI+tw4J+JPanIhalR8wLDNWY97C2egCFI+HkfFjqJxzYIiFEt8x/f4x/29fdyBAYrw3Eg5v6IKGXTD99XE/bYra5/fl7OQsaTG4GAJbx782bQVpQZF5G6YYWI+JcJPBjFsfJx9YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voC/ketBipiu7YeyFSXbRcn7m/Lni92Gi+ChDLSPP5U=;
 b=kptXYtykRNh7beA+9zK1f3nvlnibSdYE4ArpP4vpebj83eIBRc/ZJyXPsP7Sq7FyXjieO+A9ZczWSj7sKwpne8TjpH2TEgsreELRPYVBrPavHiqT0+sMSkFpqr/2izblaeCxXatKXAup6BwgbkX8Z9ZOUA3vE5hrgwLVbFHlD2COyU0f9cd60Hr7sOdwmshnECbeBaRDWrc6io2uqQ6ja4bEAiyxiX4p0wG47AI2agAVou8aX3MW+Zr1cTHeufRKXpRltq9uZRoW1U/Mom1jMsMVEhWfqGYQD3cyTYJF3dSJpyUQgvp+vhaG2LXHEmAwukB5tmVmu2xjHC0wtws1fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voC/ketBipiu7YeyFSXbRcn7m/Lni92Gi+ChDLSPP5U=;
 b=oyMHm4F7NIwKnBxvdQeq/krlqhO9Jmi2rK2/1U70+AdyVI5o6Hl111iAUtS47EH5R4CBxo22xuLxMj6wSi+GAU+ixckuSE/hNL+xkWtK2KdNRU/iPQTcqdV8lEbsMokMD0O+wQ5Xtukf1pJz6S1NrI2+HxII+kUi0awHAQKCumo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2598.namprd11.prod.outlook.com (2603:10b6:a02:cb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Wed, 18 Nov
 2020 15:52:19 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3541.029; Wed, 18 Nov 2020
 15:52:19 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-colorlog: Upgrade 4.4.0 -> 4.6.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201112105618.23773-1-leon.anavi@konsulko.com>
 <20201112105618.23773-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d730a57d-d7c6-65c3-988f-a087c56b47bf@windriver.com>
Date: Wed, 18 Nov 2020 10:52:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <20201112105618.23773-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::24) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0055.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Wed, 18 Nov 2020 15:52:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a87c9605-0319-4ecb-a256-08d88bd9ee63
X-MS-TrafficTypeDiagnostic: BYAPR11MB2598:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2598D256F72288A7082297AB9FE10@BYAPR11MB2598.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:185;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Lgzf8ySSGCrWg7Oc9mEAp7yhPZtNJ9KpYi7AoNqXPVhcpSNtMLvcZ6KarduuAt4QiJX4fBodvqmE0HayA3tNwA2PhpDwwfj8RYp8IGrWrRkyYbnocGkjLGeNXhUTyB7Q5CwCTix/O33UrnpqZa6ZcEK1ilOp+gpdUzcPX1H3IZyJGhWabYzh0ySaJnPea+blvLsrVd6FEfX/KK2U398VFZw191/xRD1xjv5tlCuCn5VUkZtRwlz89VJbzRlIQv/PdZwtXgxkFhvLEAcoMGHuT7zndUKMY+QaG7yyBStB9Mse2A9/1POd0DDN2nmBWy+bBR0FVQWsUjHo4Wv1W3eL0kjTa3WcS9H5MP2VPMi21eCZIIMHT6YzCOCghAmWtO0ba5DNKLVkKNImLDDaQ1oE/6LgiBrHuEyHflLShvmQgK+xFniXuuW6iZr1R/Tr4BJJ19OYRZH9Qq6Ajf3TzspIHg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(39850400004)(366004)(26005)(316002)(53546011)(33964004)(8676002)(478600001)(956004)(86362001)(66946007)(4001150100001)(966005)(52116002)(31696002)(166002)(66476007)(66556008)(31686004)(16526019)(2616005)(16576012)(8936002)(5660300002)(83380400001)(2906002)(186003)(6486002)(36756003)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	vzu38dUOm/ZsxKC1fHJREEiQPLCgu4fsbguR81n8aEDY/8QCMos2LOWjgAhFfK0QoLoJZypj8iY8rVDGqEy+VUxtrtqOIXt9KzNO9cF15IsoJRrWwMMifsf0xfg00mq/D/q0GkbxQREt5uNqQXM6Fj7Z9kF6OnYCyKydgxabwTeXFoNG5vHLc/L/jx2weO3G7uoTruF59uHuw9qVCEZfJgnjsiL9kZFaCIfbKV9LLWF+oA7R844nXlvDoJflgelpcRnWSvKgmZUzuL9ldmpy/axzw0hmSKKSHFf0fafdpYjqytUWamx9ug8ZSCWaw4UVJB1vohNlPYqizZ5xoos7XrfVUDwpWUBMbtdqfnt/GpKzyDp6mhuVEh9nINEuzJo9g06ksPMCfuCF2WgpnYEhPEeraAdNNVj3Pgeubv+iB04xkdsm5pDTXbRTl6aXuGF0/O3OWAWOAALcyLxn9tACiLkwhHEuqxKaoChNQ1PwdoPI8m8LO6AXRz1GyGDilnrVt/4LB57fHoNWBnVNqiVtW1qpefg47rF4jR6e7IvcjteK07p0KNtnElNUbfNyno3jdLZD+eGOGgCo0cW7gSdEHYHP/mJLLe0WPaDwYYGl2WUGzzmwmZAfmDb3WIRYfpN0SaLtb0SbxC1Cow/bPsdadA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a87c9605-0319-4ecb-a256-08d88bd9ee63
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 15:52:19.8235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VexIEWl0Yhx8Jwixx3G0o80h+x4sO/GUwnyiEbeseu/bUJhs4c0WnlN2m+BVWdeVJlRR68tMzCoqAhfNgtv/7jgNc50wLiIdjAcdGynklkw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2598
Content-Type: multipart/alternative;
 boundary="------------5ED143E5B494D5CF261BFE4B"
Content-Language: en-US

--------------5ED143E5B494D5CF261BFE4B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-11-12 5:56 a.m., Leon Anavi wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 4.6.2:
>
> - Include tests using MANIFEST.in instead of setup.py
> - Switch to GitHub Actions
> - Don't publish to test pypi - we'd have to bump the version
>    every commit
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-colorlog_4.4.0.bb => python3-colorlog_4.6.2.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-colorlog_4.4.0.bb => python3-colorlog_4.6.2.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb
> rename to meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb
> index 4a40ef38cf..e98d276f06 100644
> --- a/meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb
> @@ -7,5 +7,5 @@ inherit pypi setuptools3
>
>   PYPI_PACKAGE = "colorlog"
>
> -SRC_URI[md5sum] = "0997566a87c6fdec0baa88055adc06c3"
> -SRC_URI[sha256sum] = "0272c537469ab1e63b9915535874d15b671963c9325db0c4891a2aeff97ce3d1"
> +SRC_URI[md5sum] = "72441753be8ec437af9e5bb89db344e7"
> +SRC_URI[sha256sum] = "54e5f153419c22afc283c130c4201db19a3dbd83221a0f4657d5ee66234a2ea4"
> --
> 2.17.1
>
>
> 
>

--------------5ED143E5B494D5CF261BFE4B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-11-12 5:56 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201112105618.23773-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note this e-mail is from an EXTERNAL e-mail address]

Upgrade to release 4.6.2:

- Include tests using MANIFEST.in instead of setup.py
- Switch to GitHub Actions
- Don't publish to test pypi - we'd have to bump the version
  every commit

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201112105618.23773-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-colorlog_4.4.0.bb =&gt; python3-colorlog_4.6.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_4.4.0.bb =&gt; python3-colorlog_4.6.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb
index 4a40ef38cf..e98d276f06 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb
@@ -7,5 +7,5 @@ inherit pypi setuptools3

 PYPI_PACKAGE = &quot;colorlog&quot;

-SRC_URI[md5sum] = &quot;0997566a87c6fdec0baa88055adc06c3&quot;
-SRC_URI[sha256sum] = &quot;0272c537469ab1e63b9915535874d15b671963c9325db0c4891a2aeff97ce3d1&quot;
+SRC_URI[md5sum] = &quot;72441753be8ec437af9e5bb89db344e7&quot;
+SRC_URI[sha256sum] = &quot;54e5f153419c22afc283c130c4201db19a3dbd83221a0f4657d5ee66234a2ea4&quot;
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

--------------5ED143E5B494D5CF261BFE4B--
