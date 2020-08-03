Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.86])
 by mx.groups.io with SMTP id smtpd.web12.6720.1596491059442276115
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 14:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=cj9MC2Xd;
 spf=pass (domain: windriver.com, ip: 40.107.223.86, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PTiYC+em9ItURcZR0g3rGRzkOsXcyJ1kvCTTB4cHk6X0DHeNnNKGe2z5KX3jKnA6CR5Gp5r1Uf1m/jqlKg0rP3pehxPEREo662aQUBNW1lOG4ic9hbZLCW6svU3oGV+Vwb5IEADAlwvBPjTEqxUtK+hscdIDx/LJwpB8e1WAiZqkPgFXv+Jc7dIEyaSsmq3WfqpNEAIQdHwAKzoCvRXWTooLB6qXJ77bYoIhr7jcUErcutpYeUxtoNEpRDuK06EATKWNhsYJa5sW4S9qKSHsDaeKXG2qKDQUYKHWutxL3Qwz6t0LFpLk0GwP0CtACBVpzVI86GHsHg8j8TsVVC6h3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRy5USOtt8okjykWtGTn8KYuKrdXG/rpgqc/XJk0wME=;
 b=W1+JB+B8EwgTloxnE8zs9MTlrHwedaujXmCL9GcPC4BloZ4jtA3/NYxZ3ybzKM6wCvx2sWMOPNKHFOUkA2u66xNvGtQXMnVOyZlV4AMgkIgPCaXipaYcBo69RZnl/fqp20yOS2UNv2fgQuVY0HS3M64FtC4ViiiolZFfkMnckyZHtt9Ttbs4cz6zu2W37Ysfaebxh2JsQFzWP7a+Rhr1OFIf5BgTOPLeaZCHdNLknmR0aVtjqL8+sQ//sDX9RTrc/hB9Um4b5ZrV69IwSK4BP2yo6G+htdE9O7iIYyML9rDSZBgUBXhGSgSvKCXDTpVlPvbsWqa+WptTqnPAGsJjaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRy5USOtt8okjykWtGTn8KYuKrdXG/rpgqc/XJk0wME=;
 b=cj9MC2XdARL7AmAwiLxBDIeicgkfhCIMXacDUW9xzemLtcQaI3PsHokccXI1KX3kNnsXvObXnFGfOKCUC/Q6oXX5NlcZlWoe0zQiIoj/JemXKCFSPdA4gpe23B+HOaA4QESpbMqgtFPRODn/nwUR/ycgFu3bLvyHEixSI7Pjc20=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4101.namprd11.prod.outlook.com (2603:10b6:a03:18e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Mon, 3 Aug
 2020 21:44:18 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 21:44:18 +0000
Subject: Re: [oe] [meta-python][PATCH 06/15] python3-pid: Upgrade 3.0.3 -> 3.0.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
 <20200731132230.20031-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d35423db-cd4e-27f4-de14-58646b60ed76@windriver.com>
Date: Mon, 3 Aug 2020 17:44:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731132230.20031-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0054.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Mon, 3 Aug 2020 21:44:17 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4472589-5142-4ddc-e5f0-08d837f65fb9
X-MS-TrafficTypeDiagnostic: BY5PR11MB4101:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4101B80245A52CE4001D86509F4D0@BY5PR11MB4101.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:187;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+hJOBL2e2VdR2Wnni8eJsTG5oSeNvVIZsTixmh73YNgp1LkmJhy9bL/M/NxcVBxRoNkPaFX5O6V6A7luPyUEBzBhevRps3k66UJbFb6nnPWFnHTHLD6+vKpFkqZ7/IPX/xg3ustnLJZNJaWHCjiayCzo1Ak7qAsupsj3/S1PxBcnHH3QScK1qbNtZ7tUDJ7Xrc2K8FyaWrp2bMa3paDW17j3/W8wScks85j502RFQ8h2Jo9Rfa8QzNSuoLEvBjJ2XcF33FJkre4ylWNz59PUfttn2XXV3qk7BAjeeW6QAj66Mowu7F6MDJ0UcCFWqVHNx34yTg1XbK7E0RQwyFKXaVviCE03ENA3dh3RObskTf0uM67Zmik4l3b6lL0K0eeSrwJsimvJgAb54eqhGDolxMLzC/ycWnT/w1x7aI4QA8lkJcnqxwLl/8rR6IF5zRt1MGsUasxPHVHwpld9qvGxTA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(136003)(396003)(346002)(366004)(66556008)(166002)(8676002)(478600001)(6486002)(31696002)(44832011)(2906002)(66476007)(66946007)(52116002)(31686004)(16526019)(26005)(16576012)(956004)(86362001)(83380400001)(316002)(186003)(53546011)(966005)(33964004)(2616005)(36756003)(5660300002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	0jdD8l59mVoE1t4+6CODX8aBs7z/vNcA+b/MHSFrixIyTG4ixOBCnenjI+bov+hdSjXRm6GYqCWR2EWMgg7TVe2x0Ll0lrsQLlr0bPSkEFWVTrMU/GG3VFVCLezh1T5HKQnG9wbizR8I2wxVJ7Jtd+/gMQc3bZf4AEaiKZwhPKVQjeE9cE9reFT2VuSko55MggBVxEbLP/gxrOXGGb85gKH2O0chUbp/SkOyA3/Ru3oldV6hpUODUAqT/lDqzTDGO9l4lhI/S7y/ODOpck9z7Me84Lr8ovKLKIOp9jFp35ZZaV2iWjr/lXuHJYB+TM/Isa0YgL+jrQ5MW6K2QWM45GngH3yHgd5FCqJBpAGYaHaMILN4R3clad5BaOQRWjcBGuNfq8LjXrfUeWxFCm10v6GDSyR4h3LXqRHSuybofoBzuFClSODfswOLa13a/RjlSYELv62TVn+ovU0D5kYXASQpY1ccWzK8rG8cCANeO32oyPmpeYjqnfFlBqhTcfO6fG2WvJkouoVqyzcgmLXBfPAOAcJwpOhXSSs28u/6SSQJpCrI5RI/SbxvTS0Ua7XOKfSBLyd9pEAnLSZ/fFOpiFGClknrQEBuUuhHc0cDEN+7OY1y6pHW9DD4K2xyGw6gz45cBFjjrgN4CSqrD85rIA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4472589-5142-4ddc-e5f0-08d837f65fb9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 21:44:18.2215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYiymoNJFWpNrRA4NAQef19IPniENnzeADpsBbZkqtiMxQ6X86dYHLCJSnsHzLWMdkNxCcP4nUnY7rG7eKqro+BZp5jlVhkWK8PfdsQBjY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4101
Content-Type: multipart/alternative;
 boundary="------------8660E66F20B57D374CC274D1"
Content-Language: en-US

--------------8660E66F20B57D374CC274D1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 9:22 AM, Leon Anavi wrote:
> Upgrade to release 3.0.4:
>
> - Use APPDATA and HOME locations on Windows
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-pid_3.0.3.bb => python3-pid_3.0.4.bb}     | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pid_3.0.3.bb => python3-pid_3.0.4.bb} (71%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pid_3.0.3.bb b/meta-python/recipes-devtools/python/python3-pid_3.0.4.bb
> similarity index 71%
> rename from meta-python/recipes-devtools/python/python3-pid_3.0.3.bb
> rename to meta-python/recipes-devtools/python/python3-pid_3.0.4.bb
> index 170c99b93..7a307a6dd 100644
> --- a/meta-python/recipes-devtools/python/python3-pid_3.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-pid_3.0.4.bb
> @@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/trbs/pid/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=83d53cbd3105063f20305bc313464e29"
>   
> -SRC_URI[md5sum] = "5c011ebebbdfd529f6e85d2e0396dae8"
> -SRC_URI[sha256sum] = "925b61c35b6f2bc6b43075f493e99792f1473575a0beeb85bcf7de1d6a4a3c7d"
> +SRC_URI[md5sum] = "af607e6e2a51129e3fef516b7994c85b"
> +SRC_URI[sha256sum] = "0e33670e83f6a33ebb0822e43a609c3247178d4a375ff50a4689e266d853eb66"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------8660E66F20B57D374CC274D1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/31/20 9:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200731132230.20031-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.0.4:

- Use APPDATA and HOME locations on Windows

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200731132230.20031-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-pid_3.0.3.bb =&gt; python3-pid_3.0.4.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pid_3.0.3.bb =&gt; python3-pid_3.0.4.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-pid_3.0.3.bb b/meta-python/recipes-devtools/python/python3-pid_3.0.4.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-pid_3.0.3.bb
rename to meta-python/recipes-devtools/python/python3-pid_3.0.4.bb
index 170c99b93..7a307a6dd 100644
--- a/meta-python/recipes-devtools/python/python3-pid_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pid_3.0.4.bb
@@ -4,8 +4,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/trbs/pid/">&quot;https://github.com/trbs/pid/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=83d53cbd3105063f20305bc313464e29">&quot;file://LICENSE;md5=83d53cbd3105063f20305bc313464e29&quot;</a>
 
-SRC_URI[md5sum] = &quot;5c011ebebbdfd529f6e85d2e0396dae8&quot;
-SRC_URI[sha256sum] = &quot;925b61c35b6f2bc6b43075f493e99792f1473575a0beeb85bcf7de1d6a4a3c7d&quot;
+SRC_URI[md5sum] = &quot;af607e6e2a51129e3fef516b7994c85b&quot;
+SRC_URI[sha256sum] = &quot;0e33670e83f6a33ebb0822e43a609c3247178d4a375ff50a4689e266d853eb66&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8660E66F20B57D374CC274D1--
