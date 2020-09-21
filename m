Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.63])
 by mx.groups.io with SMTP id smtpd.web11.44674.1600701752412826561
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2020 08:22:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GYa9Q5y9;
 spf=pass (domain: windriver.com, ip: 40.107.236.63, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aE7WkQwIyeSk3k1sLI3BBAqx3bwLMvV2hasesar6HjOQ4KJTU8X7FvKAJF/hpRKCQ+Tx1oF/u4VmXk+A5DT8cySjgZoRmS570ZD8+LEuf4A916wTpCeOpOfrSbc3+ow6Bx17mubuxW2Stood/X9CHhUagjhaOxln7dCxa+BO8UCmEuvC4vXiKimDH0dmY7IKXDm+qtJU5j33cfaYhH05YIXRsGvkXwGq9cPA7eR+2TOvmHTy8Ihe8cCmSKMTY04DhhIlbQsMZqsciFH1b6nKRm69XN/DQxuFAbkDF4EizavNeu+Dv1fsvAgbXlCtD00CckJzovbj4MX1dB706csQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J09RyPcWOBK51TrD1W95zv1x2URHxZ+nVktvQ42wq9k=;
 b=M4SXBaLWp5ZaV+vf4CUU9Y66y9lbSP/YuexgG8qYFhEJZXLv9p4QXaWMWyBroJ5YWOiXfMsYqJbbj7Ro8kf9Xs4GBm6TXDviZbzZre/4P2xmEUkGW5uHudeQG68VC5wjbbVIaEg6xhQQrZ5GsIQv+XUJmdN3kP6rpWcif+KLZ7JS2kzNxwciM4vfYLQMkJwz5DWMbTE6V1A7OB5EGciRVcU1ICfhMYWeDlplSZ0dfOtq3cVP+QDgM2zg1mVRTezo45558YP96t88WBcC0w1GydeQ5OkZaJBSH0xGyTjAywKd3CP7/DleNRA10g7Aa6SeUvDbVtqQtb1oU9cm/fW9xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J09RyPcWOBK51TrD1W95zv1x2URHxZ+nVktvQ42wq9k=;
 b=GYa9Q5y9gitQuMrk/y1tSA9fyCE+bHKXBg6fl3E2pflLLUKWAeg2XvevmPINwqHunt5IuOxeHqXdKCFSsnaHzYeg1WbCrooIgZRbTxzjPwVJ3Cmnv+PeQxbPj+papxVpFiH06LduyCqOuzFjy+DJnI9qNJpwRR9qHru+sedzpso=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4307.namprd11.prod.outlook.com (2603:10b6:a03:1bd::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Mon, 21 Sep
 2020 15:22:29 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Mon, 21 Sep 2020
 15:22:29 +0000
Subject: Re: [oe] [meta-python][PATCH 1/2] python3-cmd2: Upgrade 1.3.9 -> 1.3.10
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200918115835.4742-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <b0369d23-1aa1-7a41-bd47-a55235b6990e@windriver.com>
Date: Mon, 21 Sep 2020 11:22:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200918115835.4742-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0120.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0120.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend Transport; Mon, 21 Sep 2020 15:22:28 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad204a05-ec72-4afc-ec31-08d85e422749
X-MS-TrafficTypeDiagnostic: BY5PR11MB4307:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4307C0E32536F75719FE9DF99F3A0@BY5PR11MB4307.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7jUdyeEq0Fz7Yj98aJMJRrfVVkpWAn/yR8agQsL1aJ92nlQm1WSOP71dqS4RvBaq3a5dAhqG3KQMNL767WFGZaJBhSQDLvEL5oCFGBJx6iTMIXMrdUj1isD1DyIefYV5yIwSeLhU4nlAxWQN0/TqrmMMMQ6fZuTFaBAj59oJ1veDI/Sj4pFf3wcHHbqCRTQ2I4cCmFSm8RHCJReurQRPNK2CeBLHTMv2Iy2WD8+akvQ5Phv8ajvfdTtD6u3nsRk74KhUwLWiUf+Udkl6E/pQyvC5ksPdaxoT1NdtjfnJz3n3m6Kp8JjsnYRGyLP99cyn6Sin6iK4B96/hupc42ln1UOYQBEUyLDI3sDvzqR4zU318qiqDZ4oZlLnwueeNRz6cZbboVnq2XBOVggaMqhJtth5F29v8trdszbFMRfkBCkIHvbFqaSWchANopORcTn8rxU3J7LcNuMeHVBZ9+Y0Ng==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(346002)(39850400004)(478600001)(8676002)(86362001)(36756003)(966005)(44832011)(53546011)(956004)(2616005)(66556008)(66476007)(2906002)(66946007)(52116002)(186003)(16576012)(31696002)(31686004)(26005)(33964004)(5660300002)(166002)(16526019)(8936002)(6486002)(316002)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	eKC/yZ5C8dRB37hcB/JiJn4NJW8DU7CCoi1pyWIQj71G0SiUjr3ZdV/jPvOk4p8BFd6YagBznpr4PjlMRZwSpcrfcj8NUbKE62kldU9IdGLTy1VGPoIIz/Tz3b6OjzLp4CQQQHOpYCV6cfUaJr9XktTp4w9pCrHATQXiRD6IuWLID6PosZkCEh625sjw+uK3bxrkr89qpSpWPGnGZsQtBj3pJ+m81ZmNA7fLBGM2YvFFB9MfDv1SwWaa5eEOOdO3vKs9HZPnrlIelscCdIBTrJvgr/K+vNl8dnghbLziu2HwChcW8omB8LsZbFkNUcQ6105xErP6aRJobIDbflAea8Ch7B+c5CtVlPsP4VfSdj40AhYLUHrAzaLf+LaUUJACP1O6e9ICkXOuRrqjEtnX3b+G9iT68okKYNPtQK59IsAKVTMqq5senZCE4m9KLK2rwNNobthZUTffnttBcnXdsRLZA2ts2Ffb0QYwy7fzSd9szy10GUZQaNgaQTwhLpF/d5insl4eyF8SY5TTXmuysmIdu1BuqVSpJwMgyWa/deMhX5GxKQKSHSsOYVg6wS4JZXsYVk5APq+cUoOV/63cVuxBSzq5sl2iL7gtSYV17aMS/QaQH+Sq+kOT2ht7yPiw3P07n9Q31ljR34Qe9RyEtg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad204a05-ec72-4afc-ec31-08d85e422749
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 15:22:29.6081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wsWJwWYU3x6cv5DtgC5oBuTP6NxRNKt8w7DKRqKIcnviZTObt73ewt64bcla0vQt1d2V+evN7jyuhJox8m+r4FCAS24jhrxNf8P2+vs1dpA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4307
Content-Type: multipart/alternative;
 boundary="------------EE1C794BB254F4C36BA20B72"
Content-Language: en-US

--------------EE1C794BB254F4C36BA20B72
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/18/20 7:58 AM, Leon Anavi wrote:
> Upgrade to release 1.3.10:
>
> - Added user-settable option called always_show_hint. If True,
>    then tab completion hints will always display even when tab
>    completion suggestions print. Arguments whose help or hint text
>    is suppressed will not display hints even when this setting is
>    True.
> - argparse tab completion now groups flag names which run the same
>    action. Optional flags are wrapped in brackets like it is done
>    in argparse usage text.
> - default category decorators are now heritable by default and
>    will propagate the category down the class hierarchy until
>    overridden. There's a new optional flag to set heritable to
>    false.
> - Added --silent flag to alias/macro create. If used, then no
>    confirmation message will be printed when aliases and macros
>    are created or overwritten.
> - Added --with_silent flag to alias/macro list. Use this option
>    when saving to a startup script that should silently create
>    aliases and macros.
> - Fixed issue where flag names weren't always sorted correctly in
>    argparse tab completion
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-cmd2_1.3.9.bb => python3-cmd2_1.3.10.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.9.bb => python3-cmd2_1.3.10.bb} (75%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb
> similarity index 75%
> rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb
> rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb
> index e677a69620..7b74187838 100644
> --- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb
> +++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb
> @@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
> -SRC_URI[md5sum] = "f5fbd528e7b5977ad71466947af61f99"
> -SRC_URI[sha256sum] = "7f8035faafda15d26098bf2ffe16aaba1c78511ce13e0815d2efe58ba392b501"
> +SRC_URI[md5sum] = "39258e1af392e0bcefceb1982d7716bd"
> +SRC_URI[sha256sum] = "960d8288c8e3a093d04975e3dd8461ce2e43c1d0c70e54873f622f8f0b77d6f5"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------EE1C794BB254F4C36BA20B72
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/18/20 7:58 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200918115835.4742-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.10:

- Added user-settable option called always_show_hint. If True,
  then tab completion hints will always display even when tab
  completion suggestions print. Arguments whose help or hint text
  is suppressed will not display hints even when this setting is
  True.
- argparse tab completion now groups flag names which run the same
  action. Optional flags are wrapped in brackets like it is done
  in argparse usage text.
- default category decorators are now heritable by default and
  will propagate the category down the class hierarchy until
  overridden. There's a new optional flag to set heritable to
  false.
- Added --silent flag to alias/macro create. If used, then no
  confirmation message will be printed when aliases and macros
  are created or overwritten.
- Added --with_silent flag to alias/macro list. Use this option
  when saving to a startup script that should silently create
  aliases and macros.
- Fixed issue where flag names weren't always sorted correctly in
  argparse tab completion

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200918115835.4742-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-cmd2_1.3.9.bb =&gt; python3-cmd2_1.3.10.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cmd2_1.3.9.bb =&gt; python3-cmd2_1.3.10.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb b/meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb
rename to meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb
index e677a69620..7b74187838 100644
--- a/meta-python/recipes-devtools/python/python3-cmd2_1.3.9.bb
+++ b/meta-python/recipes-devtools/python/python3-cmd2_1.3.10.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def">&quot;file://LICENSE;md5=9791cd24ca7d1807388ccd55cd066def&quot;</a>
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
-SRC_URI[md5sum] = &quot;f5fbd528e7b5977ad71466947af61f99&quot;
-SRC_URI[sha256sum] = &quot;7f8035faafda15d26098bf2ffe16aaba1c78511ce13e0815d2efe58ba392b501&quot;
+SRC_URI[md5sum] = &quot;39258e1af392e0bcefceb1982d7716bd&quot;
+SRC_URI[sha256sum] = &quot;960d8288c8e3a093d04975e3dd8461ce2e43c1d0c70e54873f622f8f0b77d6f5&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------EE1C794BB254F4C36BA20B72--
