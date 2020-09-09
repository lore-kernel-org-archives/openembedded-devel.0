Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.51])
 by mx.groups.io with SMTP id smtpd.web12.3285.1599675959177985293
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2020 11:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=buSpz6Ki;
 spf=pass (domain: windriver.com, ip: 40.107.94.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYQXxfFLHMpQEpqkrcpoyfMfw5QzMw6w5cNOqtq1elozvIOJSca81K+ylWhZ7ohod++6co8I/PF74PL30oDvPz9GPj3wXwkMnuKly5g45kaVDlnjz825KONaL1yiq4mfSmloe8Ams9Wiz7n8J2JyScAOCv8rl7jT8DQfRHsr93haFgatZKwdm8YwTVvFKbLtrIX6nUbWB73m1E0pUSWYey9jQMSHynutFNUeqqsjdetIYq7HL91/+u+aWO9SnzV8GKeyvCzNfVNmom9Q1xBo0BRgwbLionQV0D71dc3Vsv0z1oQ3FJJU7Nhgj7elnWv5aoqJgt7Y6TluQbTWtRpXng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vVa8By2qGJON5VdH/psfud6HlGJMZ7ts83pTJ1tnCM=;
 b=FrjYkv3OGAekaVQP6vHniWJn3gLPGpavgNXNyOlTSc1lDlVdfnLq2TPgt5XYL5btwiUWrBNeCLxjtowdnGHxSEoVKzJdx4z42TDxCiqA6oTJClAwVjtg6/JrEaWB+rITa9mITXM53gPugKhvPnWS0T9XKh2I+tiAvd1KH+fYQZ+I4zVS/foHMzC523SLnPF4gnbZ7nr4NKtvR1+yPudCsjlGWpCznPD9eWuF/GldmabLrw4FeA0YCqek2G9CpTk43HJ/eFVr/pxS2GTY3/F2aJ1p7EmziqoaYQC9DY2gHcYuMjcHRxk3mWRyvVmxDcl6x0/M5QduUzwdSd2HKNxfYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vVa8By2qGJON5VdH/psfud6HlGJMZ7ts83pTJ1tnCM=;
 b=buSpz6KiN7rsSo+8wcyJsb/7gvP6/j3UUC6qudpJVDfyRucQsUYtEbKHjgS7RQPYiFC+YBDo6oVp1zNiXINsMnzKYD4j9vmMNyPifxiKSK+O76bVEq9Z8Fa/DD1uvkSHtDBLJqHFD3LVS7rSi8SBKe4yOx5AkrboUPt9FLwJmdI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4418.namprd11.prod.outlook.com (2603:10b6:a03:1cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.17; Wed, 9 Sep
 2020 18:25:57 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.019; Wed, 9 Sep 2020
 18:25:57 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-traitlets: 5.0.0 -> 5.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200903133520.19437-1-leon.anavi@konsulko.com>
 <20200903133520.19437-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <fb2328e2-9439-4cc8-13a6-025ab9025b44@windriver.com>
Date: Wed, 9 Sep 2020 14:25:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200903133520.19437-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0059.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Wed, 9 Sep 2020 18:25:56 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcf68b89-ed3e-438f-2741-08d854edcb4e
X-MS-TrafficTypeDiagnostic: BY5PR11MB4418:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4418F9DE6EFBC94AEFD689219F260@BY5PR11MB4418.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vWQyFEtr0EKHCC+Z59SABxql79ufnSChvTbMrJL34fYIm/Yj4PzYscJuIilYOzSNZIAOO/HVzyl1MubwI48icf2v9gHrGMRp/sMvjw9rD8PH5pF1LsIrEiyxlgNIDjZ58PUwDCId+jYbJJoB5vpy54Sld7lH6v5jkGURVeFn1XOgFJHdPqaAFaddeeJIBiONj1xYknilbN7Sr7Qkxkgabbyx3UX5G7Z5kccXRLhTtgStNSb+c2efTxO7a4Spfdj1rfM0ZDp4WuxQROcaxUiCbC937miyKatzZmoOwcIz1SxdeOMBIoFiyxnnFWohqcEDbwWhxNO+z2plYwnTom0Ql6AyBGYbCgmi0qqWBBKcqQjGTl3w6KymBbQzruyEVhLlPWh1EgxEX7Gf6Fj/9KjhjvxtXdLYr9/BF6PJ5xUq7tkiYP2FdALG7lRbRE/2M3qoTpDW78x3XhggDSKmDpw2cQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39850400004)(366004)(136003)(16576012)(33964004)(66946007)(52116002)(966005)(53546011)(186003)(66556008)(66476007)(16526019)(956004)(2616005)(316002)(8936002)(26005)(5660300002)(44832011)(478600001)(8676002)(36756003)(31686004)(166002)(2906002)(83380400001)(31696002)(6486002)(86362001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/WGm5j7Pr+Z1LJ4+FsYpuMpbR82sZJm/AOxqMQVD5JaQXwBHL1R5jFwr1nwxM/V+e/Q2G33VQh/bTS+ar5tB1OGAonw1Ov4ccd0QcpysoS9VMQEZ8VCQbmzCle3xOe9xhiLnhLLkGpdrT7tFGzRr4wlXUe4T+gwQpLQQc2Ii+8W7BGUeDpCmcB7Kl9IJbB/yZbA2CtrOpcy2u0WyLfDOeEQX99BtcVchzVjNGj1KjaHKexKnSi/8cHiPlc38BqubzpH3oZgdU32tWJ2WpEExktah/zQu6W4u3oVqgJ/bQkCoHcHKMHbld/pNkB5rewyvYEy0o5nOt8tu4uS7x7j4/GNE1AsgBcbwW0uTiPK2LNlbCz+iYAkgYfV/XD+lbeR2oPBq8FmvR54F1mJPayMUFGeiS5RkesT9KKZoaIPsPD8GBDEe1Q+B7lQJwg9fGd5eDSJh2bko2MtdyhpuXRHpczKVjXeNEDnq8qChy3o2JEcGYy5CtkMpULq8tU/OwWsv8DqRKUulmz4xXndHw9HdgLfl22sl1no6LZdwdDpo3G2V3v/aBd/WJ8CssHk9GhZuFELmkNU6b4W5tTPP+EiDIqnIGAuwAu3cRTDAIq7fu1NrHjPoRQFhNsJIiE3nsOwLo3M+G1Jl+vHsVi9TWs84Uw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf68b89-ed3e-438f-2741-08d854edcb4e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2020 18:25:56.9683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7BnFs0ThZDJUFzkfhSTCQ2THS/Y4JA+ogwCmPd8u0JVK7gbhJP3mE2R4HINBxOUNe2SYWSZxh/TzEqd6BjtleJ6vEecsbbwbupDMPsyKezc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4418
Content-Type: multipart/alternative;
 boundary="------------966211BC0A9948100B970077"
Content-Language: en-US

--------------966211BC0A9948100B970077
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/3/20 9:35 AM, Leon Anavi wrote:
> Upgrade to release 5.0.2:
>
> - update cast_unicode with Python's standard decode method
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-traitlets_5.0.0.bb => python3-traitlets_5.0.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-traitlets_5.0.0.bb => python3-traitlets_5.0.2.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb
> index 8aa0ce5ba..49255fcf5 100644
> --- a/meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46"
>   
>   PYPI_PACKAGE = "traitlets"
>   
> -SRC_URI[md5sum] = "3dec5b73409c07bf48cd5db220431ee9"
> -SRC_URI[sha256sum] = "0d9c4005506b306b0a99551e96174b8bedc675c2dd048f92b3bbbb7d86ac93a9"
> +SRC_URI[md5sum] = "7dc642d19d1268a8268f46f33ff871c6"
> +SRC_URI[sha256sum] = "4c9a7212db9642056ea4fcd4ba9e18d302eb617daf679f45fd8cb5d19687b640"
>   
>   RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-ipython-genutils \
>
> 

--------------966211BC0A9948100B970077
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/3/20 9:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200903133520.19437-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.0.2:

- update cast_unicode with Python's standard decode method

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200903133520.19437-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-traitlets_5.0.0.bb =&gt; python3-traitlets_5.0.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.0.0.bb =&gt; python3-traitlets_5.0.2.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb
index 8aa0ce5ba..49255fcf5 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.0.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46">&quot;file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46&quot;</a>
 
 PYPI_PACKAGE = &quot;traitlets&quot;
 
-SRC_URI[md5sum] = &quot;3dec5b73409c07bf48cd5db220431ee9&quot;
-SRC_URI[sha256sum] = &quot;0d9c4005506b306b0a99551e96174b8bedc675c2dd048f92b3bbbb7d86ac93a9&quot;
+SRC_URI[md5sum] = &quot;7dc642d19d1268a8268f46f33ff871c6&quot;
+SRC_URI[sha256sum] = &quot;4c9a7212db9642056ea4fcd4ba9e18d302eb617daf679f45fd8cb5d19687b640&quot;
 
 RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-ipython-genutils \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------966211BC0A9948100B970077--
