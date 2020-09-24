Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.79])
 by mx.groups.io with SMTP id smtpd.web10.26265.1600976808943466692
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 12:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bHi5N0wa;
 spf=pass (domain: windriver.com, ip: 40.107.223.79, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E3OV9eTXon2ADAyphDwJWT6cxsTpP8jOuoDsqxyHvLBX+oc5aFYrVAIgK/U1ehJu1x1PdHJbZoVZNUBlPVzLhpN0mAOSfdgL7RhSuhkGxIMKslstF9XvsgC0t7Mt7m2+/nPruqGyhpv4qv2mFmiOL4mEsLxYc61r/IEVtQHSj9ADE/kX08GvId2aj3Ip43/cVtXQqkkyd9m17yJYB1xv3n7xiGiBsS1HFVio7+h6ceqQyPZuGEdKamfWNR3NJuC6DZKNfQjA5Jd3MPfWsO2CjcjaEWmvrLGkwomMjxzFiVea6pww+vtRz6OfsBbqOfSCmA7GPSFNHI89xbEapuIDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSvF+0H26x74lszPNfytxF8u/A+gJ9Ot7ibaAAs4hsI=;
 b=WBOB58rrGXO2Jth3hLJUfXZqB4hixg1ANv1dkKOsYJ1xZHshGOZjdGAWn0cvHMQspxgJ7vi5jev3/9CfkEhtIdK8wpYfr0K3tmal6GviRjXJnj/J9XvDN3tf74rTAb6Aeffw4YEN7YW8n+/sq919P8brBWmmmvM1EuJ3osNoX/zpZZfFL8o3F7LLDNvp9xbt8OM+5K3H3XYx+b82PSVXJ2EPfmhqCdAgD+3JJY7jX+aM2Xo6m0RPbEMnyDUc+6UFouvsml1wr926WeQ92AXJv7I1Vz8znpTPEs0GxoaCr1bAhOX8ZXhGSILimRHDd2/wNxNcX4an/0Ged4tA6RLKEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSvF+0H26x74lszPNfytxF8u/A+gJ9Ot7ibaAAs4hsI=;
 b=bHi5N0wagn5qU/zyA4y9meAg7IXS/xc0MFABkvwoZDU7w2W0c2aREmFvAZp//rGnscswLM10FCjFzghxoEzQjSsCx21mZHN0Ea820s0J50j18fX3wNvVs635Kuhh6AhDUPT74Hmx7PFiBAGbVzuh5z9mO17H5xj4UGNExl2EQtE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2839.namprd11.prod.outlook.com (2603:10b6:a02:c8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.15; Thu, 24 Sep
 2020 19:46:47 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Thu, 24 Sep 2020
 19:46:47 +0000
Subject: Re: [oe] [meta-python][PATCH 7/7] python3-greenlet: Upgrade 0.4.16 -> 0.4.17
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200923075830.30859-1-leon.anavi@konsulko.com>
 <20200923075830.30859-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <eb4760e6-0fff-4cc9-844e-93325cbaaffa@windriver.com>
Date: Thu, 24 Sep 2020 15:46:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200923075830.30859-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20 via Frontend Transport; Thu, 24 Sep 2020 19:46:46 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36c7f9a1-e690-41aa-c3f1-08d860c292bb
X-MS-TrafficTypeDiagnostic: BYAPR11MB2839:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB28398E6CE280C565678C5A419F390@BYAPR11MB2839.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:313;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DOYRzAwwRfw/CPJChTt/5Wa7CsxwAIcRR1YkV/IAZuXZoVfscRt7ZoiGZQiM4vCIW7uLEMW37ErxgCUPZ5xgPe1d5xpuo8qjkbhq23SURxGesga3spoDzBB8Gh3VXXLN9yR9UfJYsKMAV0KaKVOGlowKPiE17kj3Jn35p7oqbVTqZn7U+JEh4xRsrz/Qp8Yb5fjoss0/LZOjhHYaE+R7vInqhXlXYbpN3NFew+UyUsW6+ujC+g+MBxHAeHwyh6dxvKMxwxY5nz6ZRep72uByV4tHPtOQ8+W4pICsriq116/d1PrCc9hbmzaRQVR75PNbTUiKZ5UsqrDPyLgW44g7gppXGY8pSk04gEorv6qQKdcXFy/Y2x2YsaaB7joC06LMqUsHlStmZsFiIzhkDX04zmFpaiMzjAaXfj9Lpjdw4OP/5M9goYiekWJv1OWQbu7FydTYbXDh01UgIaMJjCk8HQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(376002)(366004)(136003)(166002)(956004)(66556008)(8676002)(66476007)(2906002)(5660300002)(31686004)(86362001)(8936002)(31696002)(6486002)(316002)(33964004)(966005)(52116002)(66946007)(16576012)(83380400001)(2616005)(26005)(53546011)(478600001)(186003)(44832011)(36756003)(16526019)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	TfT51A85CyJW3qQPVIhF/Wzkm5YMfCAYsUY4912muyCGqIep7vSaq4QJbASPeofYc7n12nRHvVW0u+IW25DiYmSGrS6TWRRSmKnof5vFeOn1FcHKjI69vQfKvfwLcEcpX6WpCiRSDUPYYqbSbx9KoSYgluJY60BhllQIM0EGniOEB7KDJNXAXUmwyopMI1CKkLOy9vqUciI7nlqiIwzAHOrYJYFUMfLs6mZcwsSu2FAFKxmy2D4EKwx/eVfhN7zTiKc9eBfN1kw4qzV2LK8U0mrUswtO/7GfMUzZyh2/tcdiLVc2k33JGp+oRhUbuJ9uqRk5AaWMqc6y2cvzrlDi0kU/jlvB07s3UUJvu1YutHL/0EMlHwAzpTJSvxb7zZ2i/VYe7pdOkOzvKecHjWPyU+i6p/p9DtFGEokzBtPI3u/WqzxpA5nEyie4QqGelpnhMbP4q5ac8cNle3WXH+mRguv546fQ8ZJsMLHTkLHJ0FcHmeqzP89ZbTp3vHfZ+y2IzRCYVx5u2pv1NQVn6fNTG4qPfuuNtasxotv1RebbkvBD2nvnjrNlzosFUXVidKK5aWIC/MkrMRHNsCcW0LsD+fblmBoma1PQj7VuhUThKfANYk93auUPMOvgQHDgDm+zMyNRcZBk4e9CSUPygR+big==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36c7f9a1-e690-41aa-c3f1-08d860c292bb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2020 19:46:47.6265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JpoL0Z3Nw1Y1IWE/HBOCM/co3JOCefvlp5XfMKD1QuGkklFIldlWvwZJkk2jLW8Y7F+2D8d/UbtO4Y4VWgLnWAnX2UBz/xH+wHG6gfo6qDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2839
Content-Type: multipart/alternative;
 boundary="------------54E2EDEDD7A0CD7E5A97DA1E"
Content-Language: en-US

--------------54E2EDEDD7A0CD7E5A97DA1E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/23/20 3:58 AM, Leon Anavi wrote:
> Upgrade to release 0.4.17:
>
> - Provide support for PEP 567 ContextVars
> - Provide a feature flag indicating whether we handle context vars
> - Switch contextvars when switching greenlets
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-greenlet_0.4.16.bb => python3-greenlet_0.4.17.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-greenlet_0.4.16.bb => python3-greenlet_0.4.17.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb b/meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb
> rename to meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
> index 4556d499fa..744265e1fa 100644
> --- a/meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb
> +++ b/meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
> @@ -3,7 +3,7 @@ LICENSE = "MIT & PSF"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
>                       file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
>   
> -SRC_URI[md5sum] = "9aebea08f7beb6b87143d0588578c984"
> -SRC_URI[sha256sum] = "6e06eac722676797e8fce4adb8ad3dc57a1bb3adfb0dd3fdf8306c055a38456c"
> +SRC_URI[md5sum] = "d964c95c2d2f0f02f36c75e158d8e3dc"
> +SRC_URI[sha256sum] = "41d8835c69a78de718e466dd0e6bfd4b46125f21a67c3ff6d76d8d8059868d6b"
>   
>   inherit pypi distutils3
>
> 
>

--------------54E2EDEDD7A0CD7E5A97DA1E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/23/20 3:58 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200923075830.30859-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.4.17:

- Provide support for PEP 567 ContextVars
- Provide a feature flag indicating whether we handle context vars
- Switch contextvars when switching greenlets

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200923075830.30859-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-greenlet_0.4.16.bb =&gt; python3-greenlet_0.4.17.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_0.4.16.bb =&gt; python3-greenlet_0.4.17.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb b/meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
index 4556d499fa..744265e1fa 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_0.4.16.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_0.4.17.bb
@@ -3,7 +3,7 @@ LICENSE = &quot;MIT &amp; PSF&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36\file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a">&quot;file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a&quot;</a>
 
-SRC_URI[md5sum] = &quot;9aebea08f7beb6b87143d0588578c984&quot;
-SRC_URI[sha256sum] = &quot;6e06eac722676797e8fce4adb8ad3dc57a1bb3adfb0dd3fdf8306c055a38456c&quot;
+SRC_URI[md5sum] = &quot;d964c95c2d2f0f02f36c75e158d8e3dc&quot;
+SRC_URI[sha256sum] = &quot;41d8835c69a78de718e466dd0e6bfd4b46125f21a67c3ff6d76d8d8059868d6b&quot;
 
 inherit pypi distutils3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------54E2EDEDD7A0CD7E5A97DA1E--
