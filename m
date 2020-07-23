Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.89])
 by mx.groups.io with SMTP id smtpd.web11.2314.1595522870217666298
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2020 09:47:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=n9YSDh3X;
 spf=pass (domain: windriver.com, ip: 40.107.94.89, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZNnt7QZ9hDIFpRdyh1HxttXJ8s+dQlbmsgrpOZGE6KKcQ1IPf3dV3I5pr/c7L/AGTgnNo6zGqFKo5WTZ0q/6PwYs6UOgXdyzApQkVbI81g9ZFflq1voaUMWRC8iEeCJdwyjJuL7+meF6DNbjXG+JJNB6JtdZ61ygkAGnuuiwd/8xbjK/stDArdyzxaPr72ViIXMwURE+Le45iny5xQGOG5yNJeQlANz8j6wW4rpt8592xG/GcTnz3AVSlBQbnsZF5UGDtboC5rKFSYCyHotEhl9JmddxdSeckIulyCSocZ2bm+srTdMg+uWSP59G1MnKXIVo0JgeFdGqPbroL90xkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuUGqNsJvMeen7Jy27NDDh4Bq0RTrmgtjGdys5CXXg4=;
 b=SckLAGWAxBuEvvOEFwK8m+HMSGuAdMkCRFSpnI/oRQE51OgT3OTkTNpmJePVCHRRKMQpeiN2SsULqzDTEBYY2p50Hzuo50+QzHJ6jse9DCA7bCSzZvrRMMkDanwsNnv/kisVR3999tvIhTe13IHMkf3b4kZA8BcV9jre0i8cR/rbX/bTkzQu+0qzTvOQv4I+MW8kKt8aNoET5+EnRntm/1fV+nh8XuCUv3ZfQt2FR4uLGACQ/UxTk6LFPy9XjX+7RqKXYo3gsQek/XD18FrtlVWbKUbq1Kce7vKJ/g+MV6BOvlFplV7h8yfdqIYvJDZHyHQ22CSw3OmAFZxcetLYPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuUGqNsJvMeen7Jy27NDDh4Bq0RTrmgtjGdys5CXXg4=;
 b=n9YSDh3XAe4kxCp7Fj4gSMIbTk9HpeC/eE1uClBUhDj+HKBGfhmi03YekGrFfK4MJCxfOM0t8qOb2oN+DadV5dCGh73WmyaMDI7rokJnTh0bUvh3RQLPs7ILUDgdVjeeXnDtixOSjrTpSr/vf6JG4FaQtlEKgvWeW6n3vED7H3Y=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB4131.namprd11.prod.outlook.com (2603:10b6:405:80::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24; Thu, 23 Jul
 2020 16:47:49 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::7dd1:2777:7445:756f%7]) with mapi id 15.20.3195.028; Thu, 23 Jul 2020
 16:47:49 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-stevedore: Upgrade 2.0.1 -> 3.2.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200722104905.15499-1-leon.anavi@konsulko.com>
 <20200722104905.15499-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <962d341b-c39e-01cc-e6dd-8f5b72064969@windriver.com>
Date: Thu, 23 Jul 2020 12:47:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200722104905.15499-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::24) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0085.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24 via Frontend Transport; Thu, 23 Jul 2020 16:47:48 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a6b5ad49-4f41-46cc-14f3-08d82f282206
X-MS-TrafficTypeDiagnostic: BN6PR11MB4131:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB4131FE30EB8A7A8CA0A5654A9F760@BN6PR11MB4131.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yQM71S5IUnm24Pa2/tnkaJ19+NFmUPtoj+Pdijs/e98ePkx+0aQdVm6cxzBaa4BNsPB+oPlQn1P85mGkPk4CHeEe6bQtCT2kB27214TSugFk06um9zxFOvQDKViHbRWRuK3LSg5AIvQLsSi00s9N0UhgWhAVes8BKYNMPcV4/WQgI3yr5JK08Y1kuMfzqUNhooRB00YnT1ku7Kn16JdVcz1RF8qKd1dMZZRl/+5l4g53Yto62q6kcqfmWOvrJm7zieadm+NaoSdJLpwsrymOup+2cU/xFKahLLTSOu1DNwUTD2BssQooLAMz93Lapej6odP6VSO8GkDs7m2/KoYGRe8q4B+VWVkXGXYkmZMS9l8YK3UqU0SUriTRXbqWDUjX+I382ElxGaaLezU27LtGaQkz6W+YI1ycbj1nZMqo5EkyJPBp4NUYNPgiPPMKDhN/EBeDXh3pcaXB1Ol/iZn/EA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(39850400004)(136003)(366004)(396003)(8676002)(956004)(2616005)(53546011)(33964004)(83380400001)(44832011)(36756003)(52116002)(966005)(5660300002)(316002)(16576012)(8936002)(26005)(6486002)(2906002)(186003)(16526019)(478600001)(66556008)(31686004)(66946007)(66476007)(31696002)(86362001)(166002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	cFpRx7eqvafZEXjpjdvlVYIg7ZCXNeBQMdhcn7xfkaVjlM94AvpFR2mgfpvsvMOg0IvUVEbhikBiQeE2edGGx5zCQOfniluNI8gQMdbbhXPoqp818rjPnKSawkSB7tviMPGxvkoOq4QgleBe+cmLfhzDTWDz1191598gkaV4Yz7pclXjBhoJI/fyCO6JtIbmZTbxQKy2qIGlHxe8K0BHKouRvi6SAlN28Rc9/+fWZC7hYsAPKn66NaAnsJf+xDCV5BrhqXOIF971d5t0Rxd3Crkcq59MdLCw049+1TSBAvA8A9hh/06WAfydM9VfOG9+mFdJDiXOC6NO97g0+tJIw+jBUIx5nvL0l3hu4ZH4OWx+qrDaKfP87DOkXBAjAReyzZ6PY8V1TNyU2te7iTlsUEUeURJTkmO+Ge/kc1znjv5oLLV4+KpDA+Hy2Du8SAHkF6Q2gPsvzeiB3LH7Biz1VE6BgTHh+s5l8dm0wqDFagw=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6b5ad49-4f41-46cc-14f3-08d82f282206
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB0003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2020 16:47:49.1544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GsteDXHqWmU8N6zEPRgGG0fABAVMtloCc3M+oo69XSDlAtUfZkwSXEwb6WPUD/mTmVeFPc8PpR3O3j5pDuAzirfyKBBzQUVKUiRY6l8kB00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4131
Content-Type: multipart/alternative;
 boundary="------------3B1A70EA85C565D5798626CC"
Content-Language: en-US

--------------3B1A70EA85C565D5798626CC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/22/20 6:49 AM, Leon Anavi wrote:
> Upgrade to release 3.2.0:
>
> - sphinxext: fix warning message for detailed list
> - add release note before major version update
> - switch to importlib.metadata package
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-stevedore_2.0.1.bb => python3-stevedore_3.2.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-stevedore_2.0.1.bb => python3-stevedore_3.2.0.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb b/meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb
> index cf388fa7c..0a2bffdcc 100644
> --- a/meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
> -SRC_URI[md5sum] = "d0f137ec4fe5d98978970671a860882d"
> -SRC_URI[sha256sum] = "609912b87df5ad338ff8e44d13eaad4f4170a65b79ae9cb0aa5632598994a1b7"
> +SRC_URI[md5sum] = "6a39764d7aecc63a0990cf4635cb430d"
> +SRC_URI[sha256sum] = "38791aa5bed922b0a844513c5f9ed37774b68edc609e5ab8ab8d8fe0ce4315e5"
>   
>   DEPENDS += "${PYTHON_PN}-pbr-native"
>   
>
> 

--------------3B1A70EA85C565D5798626CC
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/22/20 6:49 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200722104905.15499-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.2.0:

- sphinxext: fix warning message for detailed list
- add release note before major version update
- switch to importlib.metadata package

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200722104905.15499-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-stevedore_2.0.1.bb =&gt; python3-stevedore_3.2.0.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_2.0.1.bb =&gt; python3-stevedore_3.2.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb b/meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb
index cf388fa7c..0a2bffdcc 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_2.0.1.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-stevedore_3.2.0.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://docs.openstack.org/stevedore/latest/">&quot;https://docs.openstack.org/stevedore/latest/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
 
-SRC_URI[md5sum] = &quot;d0f137ec4fe5d98978970671a860882d&quot;
-SRC_URI[sha256sum] = &quot;609912b87df5ad338ff8e44d13eaad4f4170a65b79ae9cb0aa5632598994a1b7&quot;
&#43;SRC_URI[md5sum] = &quot;6a39764d7aecc63a0990cf4635cb430d&quot;
&#43;SRC_URI[sha256sum] = &quot;38791aa5bed922b0a844513c5f9ed37774b68edc609e5ab8ab8d8fe0ce4315e5&quot;
 
 DEPENDS &#43;= &quot;${PYTHON_PN}-pbr-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------3B1A70EA85C565D5798626CC--
