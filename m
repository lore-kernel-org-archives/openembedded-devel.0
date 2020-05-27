Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.49])
 by mx.groups.io with SMTP id smtpd.web10.2421.1590623885594806875
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2020 16:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ptj3FzaK;
 spf=pass (domain: windriver.com, ip: 40.107.70.49, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnFk6Aqc5AmGgsw9Gi7JMdg/e5VHmLBcPBsOkrpycyK9UJJCG/GmAc5cSVbiP6DqA/WMUUbWO6ZyOgFexZQjJGx5mjnhnJK9Z1t9Z3ec3MfMhJZncVj+rmu2gESCTi5acj1Fx9oHLG3purKzM7NAaIlDPd3W3RIYmMSjJJYeXkfggyuzAEl360fl/2K9avSrpk06PkNRfdO+Y2qlPKhdNgfT4SS66eXkNcf2kY1g83/M1Vr9CuivwrGzV7j/dbvu7T/uZkXCZR9rlkUxZhMaIJlKLfCqXEgu41XQAi3xMf1mUNxrygHHm8B+kHUZ+6uTD0rqnaIhdOABCpyqrElGCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAMM2Mfi1A3kk2kuKjrki82u67LcUqil5bj1Mq6/hwI=;
 b=OpGFIVc/gtE3UcMeIhXC3SNbkjOIeqSa9k8wrQJnVNg0m3OBuBqPYkH8FiQolNuXe9Z0y6Dm4TtuUgyyIxQRmjcKWnTryuVcXbSFk+YscqRzzURHO1TZF2m6Q8vdwqRj5CoJ3Mr+KRLTmbP2GVIGtJwpaK+g12pSaK8ZVX8Z7WISSV0wj0oH4kracg/esc2eVR9vieBHQJT8gAL+u2jY4wwHg3UDghmJb7Wn4sGJyv2gBFMsTkOCLt2s1cwXBEqN/7kHFuahCfMdypaZ4HY7bXSk1GFss5HIm7mDYs2dBUwo2tF3OQwLWWEO8mv+yE6GMDlqmOj2lr4qsJTG1i71XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAMM2Mfi1A3kk2kuKjrki82u67LcUqil5bj1Mq6/hwI=;
 b=ptj3FzaKAZnx8nEoFBZFkSF9cupr+Mb2TPIV6W/KpR+q7200vV2tQcqXFZdepRdlVMWq72T+g9omMLgwB0yX/0YKFV6gbUmNeG3e+RYg2lBgXs2NGYMbItjLJ4zVD3gDlDDgfrn9wiG72yURsheIn+7/4zFjUs4gFJswQ8wRs5Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1890.namprd11.prod.outlook.com (2603:10b6:404:106::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.26; Wed, 27 May
 2020 23:58:02 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3045.018; Wed, 27 May 2020
 23:58:02 +0000
Subject: Re: [oe] [meta-python][PATCH 2/2] python3-dbussy: Upgrade 1.2.1 -> 1.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200527122229.24023-1-leon.anavi@konsulko.com>
 <20200527122229.24023-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4ac8a761-7e9d-2fcb-263f-f1c0f97a8cd1@windriver.com>
Date: Wed, 27 May 2020 19:57:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200527122229.24023-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::24) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Wed, 27 May 2020 23:58:01 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5576153e-65c5-4b63-867e-08d80299ca0e
X-MS-TrafficTypeDiagnostic: BN6PR11MB1890:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB189075945A5C837D998AF5719FB10@BN6PR11MB1890.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 04163EF38A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9vAksUVxIED2/YvI3cZTBcNXM35RfX0OxeCXbwrwY+512F6STgDrjeGCJqFV9yDXWMSF8n4N7IAK2GPRp7EIwbJd0C/ynSdM20Lo7NQMw2ktMX8KYI/dFk91F9015IiB2nevhQGZvY4M/2qsk83afH1eNYmS9APsUaUvqVfVaAS+A5hV8QQUGiW2+VKrvt3RoufR1QrUtbyncXc4OUDe9v/vFn8Mvww834v/AAM7i1sb4Uxf7zhsti/KlBsfFCQs0kjTb7tWxUj/HX4bc+I3BhKSvFDfZENhDkJDOk4Pcg0c1c04nKMNhSuOn9aX3xW5O+vhmGUlqzJXfutwLGvS3Gb+HHS3WtrckoJ8TsS/nsXvlT3Jw2VFTECMRaiv6/dr7+9kODQVuEe57bZ2ZitqANGPsKGT/otu3oGV+l1WssQixeJBuhnXe3SngNDMuxfC+7UEnmkSHnde4u4za6IuvA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(136003)(39850400004)(376002)(366004)(346002)(66556008)(31686004)(31696002)(6486002)(86362001)(316002)(478600001)(52116002)(16576012)(66946007)(53546011)(5660300002)(66476007)(33964004)(83380400001)(2906002)(26005)(966005)(16526019)(36756003)(8936002)(186003)(44832011)(8676002)(956004)(2616005)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Y5v5GSGSGCPTQ4CcxyhH8P3SQaFCZfVup2XzTwvH7lq/lXPR9Vbx3RbE+lqh3eKwBtiSbHXLCaGWqzUzMWcRM/tD6EZrV+/Ndydm7Nx6fM8sJBz+tzWeN/+IlGSArdiiXG3ahIcAOlGea5NoPJ0fq1/jLXEmJPkiHwTrpH/HHPINKhTYPRF5zI5/anC32NVUhhCQzlGFPhUu9KyfwLkxvoZJ0S8AW68uWB6lo0Dl2Kwvw/pQspgljz6X89ENolGUUkr5xzZZlUzKNdPm9IqO0jBRtKZh/OMNHppoQLKwTttzVBImkEoZg9IqZetavG2hncf0GHskUHd254w/SdTsIp4KDwYr5VpNzwL0alvT/c3jsKIRYjGEeHLQAuzjmyk5wsCTGV1tKUODSSOeT9rHq5Khkqo4p4d9nG3XqUmI48WnKv7TD2TlnJEPbULV2776PFQLkMO9jU4NiF2s8fIsEdFFWWVYYIjUykr5rP0U9O0TyCnPfvMlNwHhOdytsmok
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5576153e-65c5-4b63-867e-08d80299ca0e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2020 23:58:01.8527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/Popm9vsmowaBO21S1ZMs63+XBMrXk1xJjsaBjCK7BkdFHjPWAqcPa3zsnUo01gC+5w6jhMpwoR+zLrUrMcn0gIgW4nk5Zq4MztJTldn18=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1890
Content-Type: multipart/alternative;
 boundary="------------7166A9D2A0EA5BFFE3FFF5A7"
Content-Language: en-US

--------------7166A9D2A0EA5BFFE3FFF5A7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/27/20 8:22 AM, Leon Anavi wrote:
> Upgrade to release 1.3.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-dbussy_1.2.1.bb => python3-dbussy_1.3.bb}   | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-dbussy_1.2.1.bb => python3-dbussy_1.3.bb} (89%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-dbussy_1.2.1.bb b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
> similarity index 89%
> rename from meta-python/recipes-devtools/python/python3-dbussy_1.2.1.bb
> rename to meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
> index ac4b8c2aa..08f5e940f 100644
> --- a/meta-python/recipes-devtools/python/python3-dbussy_1.2.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
>   
>   SRC_URI = "git://github.com/ldo/dbussy.git"
>   
> -SRCREV = "d0ec0223f3797e1612d835e71694a1083881149f"
> +SRCREV = "37ede4242b48def73ada46c2747a4c5cae6abf45"
>   
>   S = "${WORKDIR}/git"
>   
>
> 

--------------7166A9D2A0EA5BFFE3FFF5A7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/27/20 8:22 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200527122229.24023-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.3.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200527122229.24023-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-dbussy_1.2.1.bb =&gt; python3-dbussy_1.3.bb}   | 2 &#43;-
 1 file changed, 1 insertion(&#43;), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbussy_1.2.1.bb =&gt; python3-dbussy_1.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-dbussy_1.2.1.bb b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-dbussy_1.2.1.bb
rename to meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
index ac4b8c2aa..08f5e940f 100644
--- a/meta-python/recipes-devtools/python/python3-dbussy_1.2.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
@@ -5,7 &#43;5,7 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING;md5=a916467b91076e631dd8edb7424769c7">&quot;file://COPYING;md5=a916467b91076e631dd8edb7424769c7&quot;</a>
 
 SRC_URI = &quot;git://github.com/ldo/dbussy.git&quot;
 
-SRCREV = &quot;d0ec0223f3797e1612d835e71694a1083881149f&quot;
&#43;SRCREV = &quot;37ede4242b48def73ada46c2747a4c5cae6abf45&quot;
 
 S = &quot;${WORKDIR}/git&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------7166A9D2A0EA5BFFE3FFF5A7--
