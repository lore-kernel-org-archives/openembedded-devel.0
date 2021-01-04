Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.88])
 by mx.groups.io with SMTP id smtpd.web12.15209.1609774314363899097
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 07:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=HP3SCie7;
 spf=pass (domain: windriver.com, ip: 40.107.94.88, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TB+ZGaQbYxrB3oaBDtEAMZea1OSon6z006Tr2rLPrgSPEvTJe/AQy0DXUrxAPrbHDnDNk15uF8sBGY1L83g6tGla4bJEai+bp9OlixsB1kRAZAnKu6kJOQQX5hjl1Qt8DiQYEtyZGJi3CyjZLsa60Nq0rS6rlEhCZ8sTsh6GMxIRIcNk9vc5ATqrSqwFn9kSS+lTomLyl/qvPD3vMvhdTxTsguxix1zXfOqtMcRNP//zAiDCyz0z52+5Xhl7bbKk8Llb6pbAASs5iTt6HqNFFRWnDdWKYpFadlVDPKjSVa91uWqsFEAOR7eb2S8/PBYYRP40yhQmHpX0lLyU2EzqfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IETehsGh+9fjr7GuB/PWhlEgdbAs5aq7i/9kw03GinU=;
 b=V5mWPXslwZTHcpH/ym45JM/M8eb8RrdLIvT6uyYvNXtiV8BIIqa/Ae2DjQrOkoyImfQS9bAKKCBupilydANXUTe2bE/ThXNmZNeADrcPP0kD+UcVAnaeWH8QGCw2B0TufbJVFdu+zwjZyhvBurK6HwewEqT1wrRQih8ZVvcIeJi7bLaFBwC76gM8VYF95AD4V720+uwZb6L1BeFZLSquI9ZLuUlsmbuN2+lVIJ3aHX61758vsq8QzijXjM1MlGiPBpCISq2SojfzJWoRK9pjbqBL0Uf5wp5NffG69+9kz7zQY9jTxlFeh0uhtN5uNTdPj9Xtiu3gYugBJBoBw6pQJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IETehsGh+9fjr7GuB/PWhlEgdbAs5aq7i/9kw03GinU=;
 b=HP3SCie7obQiavxKZcQe/YfztW0E3QU0VItn4qiFWnzDOmqYWhCHfHnSvYxrMBR/8q29g9Fe1BAvmTu19BS/1QJL7rIBN1S43+OuoG5NGZTm6aMNEqzm+oPmXWY6ZuzIY1IhcLsYrr8DrYatUjRfElf8RGFhHfj9ipIt26hS4Ss=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Mon, 4 Jan
 2021 15:31:52 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 15:31:52 +0000
Subject: Re: [oe] [meta-python] [PATCH] python3-autobahn: upgrade 20.7.1 -> 20.12.3
To: zangrc <zangrc.fnst@cn.fujitsu.com>,
 openembedded-devel@lists.openembedded.org
References: <1608613356-66897-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d1fb4fc0-b5ab-2402-7589-a7e9b64d9988@windriver.com>
Date: Mon, 4 Jan 2021 10:31:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <1608613356-66897-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0428.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::13) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0428.namprd13.prod.outlook.com (2603:10b6:208:2c3::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.4 via Frontend Transport; Mon, 4 Jan 2021 15:31:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2879554a-cb65-42e2-79c3-08d8b0c5dc4d
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5053:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5053681826D9BC3C652966349FD20@SJ0PR11MB5053.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:369;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	I0/LwufsSYHC0aORrkIxanUWFUdldfIfNqF/bf1Hs5CJBMh00CKLXAe1NV9rDAHLZVxHYfMVX+TWCiEUoCum2dnO+znLmB8TT8laNBo/xiQ7c7YmPJiqiglzj/HjksdwXYfjuiRieXDadUcxSRjxQsSR/pZMLqAFrLWuIpHuz88IizUV2iC4KxTemZCMoDjukXpQ9vLJ5Zr+PWIXINBFFNK05lqlsRfM5KUyLOE/oL7Gbcofhy1B3oOaa8gsuovNQrKx+E379yZXkjW/3PqhtGGpANnm5XeXeTbsDGaH57kCwT40svjX2M7dcVKl+LhFK65gpLjI7WUbWWKg1xuWbRNWs0lyxgHgaLzglnnjcOey1kQS3uO1Lj+eADfle0jbQCgjld3B8VW6HlxIsZXm94H0Tvq/ITaNZ8Lob6/F2DzE/0fvRDhrv1Xvv6LBKuNObGVm34IR40zydpbo0Mp/59NPHUAZFvXrklMVOnm+8QoQsL58YWOcuk769quw+X+TOOsdfdu61BeVYl++6a8wcU60/iFWXHxoxV2jeejUPDA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(66556008)(52116002)(2616005)(478600001)(53546011)(166002)(66946007)(36756003)(966005)(66476007)(26005)(31696002)(6486002)(4001150100001)(16526019)(2906002)(956004)(186003)(5660300002)(86362001)(8676002)(33964004)(83380400001)(44832011)(16576012)(8936002)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Y3FERjN2Y1pjcDlRNHllMmtmUTliYUpnUFJOaHB2S3R4UDA2T21HVE9RdUJJ?=
 =?utf-8?B?WE90UmZueUsvTnhydDdDNnowWUcyZWlsTDBkZ05ZOFlHa3dCOCtiOVdjU05Y?=
 =?utf-8?B?M1AwRzNlWUFYaGJJMHRXd1Y0VURnTk9oOWhQZFF5cWZVQzdYbWUxaitzeXJn?=
 =?utf-8?B?bVNWaWNBSVE5ZlUzVVZQZ0pLa3JlUzFtSGRpNHpCb01kSGZ6dmhnU2NSTE50?=
 =?utf-8?B?NXE0QkZUSGZ2eHhNT3RuMzFtVmY5Yk9jaytjb0kySCtDNmFOYnc5elBwOThS?=
 =?utf-8?B?b0QrcWlHaWczUi9vM0tpaVpWc0JSSXFpUEd3SWVjTmdsRTJDVk5LdkxlRlBD?=
 =?utf-8?B?eUtjdGtNUGljRWRrNEt1eTEva0JiRXFwR09XWjVUUjZnZ3ErUkdyNldEMk00?=
 =?utf-8?B?WGlmVXJOMGNjNGdmazcxMmNsekhxOEpKekk0SDBGdGdNaGpwYXhsa3BMVldT?=
 =?utf-8?B?Y0Z0YmtEVDFhVzFVSElOd2Z4ZWMxWUFPYmM1RVJvNkNCcncvSWFRdGtOeUpv?=
 =?utf-8?B?WnpqTUk3ak12OGJDaGZRQ0RUN01YczBydmtqZTh5d2FpRnN2Wlk1OHRZNno2?=
 =?utf-8?B?TEtQdktpdyt6V0dDR09NK2tmYlZ0MGZYcTJ3ZUdhNzY5dnkvazhhV3hSY3Ux?=
 =?utf-8?B?cVVaUGp2dDdCdjdiYnZ4cXM1OWhjaTZTb0hTZWU4QnNmeTUwSXVPQXpYZjJq?=
 =?utf-8?B?b2NSNm9ISTR3dThPam1MeCszSkhIempxMndOUHk1RXZUS1NxK3FTbTVDV1Qr?=
 =?utf-8?B?aWZpdUF6UC81eU1Vb1lmdEpYZzZ0NWw3MnpMNWlqTm1DYlg4S0xYeW1YQ1pi?=
 =?utf-8?B?UGhBb1p2alBET1VaMkhpNEx5dy8yWm9PYy9JWHd3MFdudWk0NDRScVVlTnRo?=
 =?utf-8?B?eGhTTjNHNVR1cGxWTmUxRWpURXVvbjBxK01VbWFvUDlac1duclY2Qmp1WmNB?=
 =?utf-8?B?dUVNZnJoUG1WRjZNSWF1NndubVZKWjE5cDNuc09SRVN5dzdWU21kcklNLzF2?=
 =?utf-8?B?a0U3dldZY2VyMXFxTzZZUGR6eXA1Y1BqQlFyT3pCbngwUndsMHNGajkrOXhy?=
 =?utf-8?B?VFd1MWVWQmQ3Q2JqclpzY3g1anFXUWpLK0hHYitIZGJjcG1ZbkkrczRIaG5C?=
 =?utf-8?B?ellKRGcvaS82eVlrUDN2Y0Y1Tm0yUFA3VE53OWo4SWp6SjUwTVlXeFJCbnRS?=
 =?utf-8?B?Ry9XdXRXMVhYOEtRQVJ3WnQ1QW91R3NLcWZnYzZJU3FEallONDYyaUlnZ3Jo?=
 =?utf-8?B?bkNLSG40QzJTY1BoanMrTko3MndhajZPbjhyVFpFZWlLZzBvOTFKRzlLaWN3?=
 =?utf-8?Q?NyN8LsuYmEI9PPPkokt07y/ylLBo2G/VkU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 15:31:52.2736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 2879554a-cb65-42e2-79c3-08d8b0c5dc4d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iByGBGXVMRrz5QMwDaiNet4sGAEH+BmHJR8g2a9b6eonnHUDpI51BsZZz5iByq/Bo3HWCPHyFaJosoy2/nV7syHI4g89Wu9CJHvRHe2d+ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
Content-Type: multipart/alternative;
 boundary="------------5C925AF848E0623E57AA2CA6"
Content-Language: en-US

--------------5C925AF848E0623E57AA2CA6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-22 12:02 a.m., zangrc wrote:
> Add homepage description.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...thon3-autobahn_20.7.1.bb => python3-autobahn_20.12.3.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-autobahn_20.7.1.bb => python3-autobahn_20.12.3.bb} (74%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb
> similarity index 74%
> rename from meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb
> rename to meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb
> index 29f187cf8..90958dff5 100644
> --- a/meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb
> @@ -1,10 +1,10 @@
>   DESCRIPTION = "WebSocket client & server library, WAMP real-time framework"
> -
> +HOMEPAGE = "http://crossbar.io/autobahn"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
>   
> -SRC_URI[md5sum] = "1ea21f5e751517a71f605eaaff7f0c38"
> -SRC_URI[sha256sum] = "86bbce30cdd407137c57670993a8f9bfdfe3f8e994b889181d85e844d5aa8dfb"
> +SRC_URI[md5sum] = "0a465e218d904f63537092b155489468"
> +SRC_URI[sha256sum] = "410a93e0e29882c8b5d5ab05d220b07609b886ef5f23c0b8d39153254ffd6895"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------5C925AF848E0623E57AA2CA6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-22 12:02 a.m., zangrc wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1608613356-66897-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">Add homepage description.

Signed-off-by: Zang Ruochen <a class="moz-txt-link-rfc2396E" href="mailto:zangrc.fnst@cn.fujitsu.com">&lt;zangrc.fnst@cn.fujitsu.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:1608613356-66897-1-git-send-email-zangrc.fnst@cn.fujitsu.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...thon3-autobahn_20.7.1.bb =&gt; python3-autobahn_20.12.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_20.7.1.bb =&gt; python3-autobahn_20.12.3.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb b/meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb
index 29f187cf8..90958dff5 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_20.12.3.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = &quot;WebSocket client &amp; server library, WAMP real-time framework&quot;
-
+HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://crossbar.io/autobahn">&quot;http://crossbar.io/autobahn&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98">&quot;file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98&quot;</a>
 
-SRC_URI[md5sum] = &quot;1ea21f5e751517a71f605eaaff7f0c38&quot;
-SRC_URI[sha256sum] = &quot;86bbce30cdd407137c57670993a8f9bfdfe3f8e994b889181d85e844d5aa8dfb&quot;
+SRC_URI[md5sum] = &quot;0a465e218d904f63537092b155489468&quot;
+SRC_URI[sha256sum] = &quot;410a93e0e29882c8b5d5ab05d220b07609b886ef5f23c0b8d39153254ffd6895&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------5C925AF848E0623E57AA2CA6--
