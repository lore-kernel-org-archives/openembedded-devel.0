Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.73])
 by mx.groups.io with SMTP id smtpd.web10.13262.1597334306494668254
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=R8QJ/fx2;
 spf=pass (domain: windriver.com, ip: 40.107.237.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtVMdbyiiEzPL81bfakMgnWPpjSSEhASsVqbdXsqvcbDzVx1uOmQ46PWsyqatxFFCexrpp59ve4NvZw/UDu2b2T4omiDp/u/vQoZ61soq94YH+zzhM2HKeO3/xYHliBaPXA8wS87gMZWEPBZjJQBIvSP1FU/784UjtfCzi51YFeOpzNpcTSRAZCik5kds+ksS/FozkML9+Sz/CnVWZ1GHWaDHsOKadhsK2PuA/x3RV0JupKherHU8pIYZLD/4S2Z2xqt/kRLfAtZxAwxemS+l1z8ZLzVryybspWLGVhaEPni3f6Nm7CufN6TVM69kNN9H5YfLNVCAw6r6s4gg21hLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2YGlUOETzNpO/du4/Njqw4cWgWXdVZ/u+NQsO/6PJI=;
 b=DJFggkxnvlVniuvxnlQrjSHqlU8qIc2B5nWEifZUGqG7pPPmGntZglnQBI+3Pcg7cU/y5sNlWtYIAoeX+hnRFPLJEOT8q81zPACE3TRd9xdSH7YVSaAngils+1dYi+c5KU2TyHGsdLnVtjNsJD9HQWTGhAQo73h4+sRjKipHV7voWLMcIeSZl72Uj6aJ9p+A+SvHIjD1PtFwAYEfnR+C3wla6udqrY/MdT59I+e0yA3C8uPJPTa8mrXp9RJ5KY8iIxBV11kfU1E+BzDXI4g+SCsevFI5Iwae/lvyFQ5wp6XjzFfG0HoxuM4GeYKW1tJ6uTHD7Ft9CT9OWGhMz8Cojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I2YGlUOETzNpO/du4/Njqw4cWgWXdVZ/u+NQsO/6PJI=;
 b=R8QJ/fx24X/Rwo2EsbptHetCb6QClsqavsRlKTXyD3kIiu0gMipf1nudUSQM0H/1LYRHS13j27/OUTK6SFnyDxID/eyIQVFwRRWlym1ExNuu6bbi4ZGVNcJrJC2EKIwmPgWsddafSTDPpFU9OXOKdjCqDmqsoqQQyyfeMsKiFjA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3606.namprd11.prod.outlook.com (2603:10b6:a03:b5::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Thu, 13 Aug
 2020 15:58:24 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:58:24 +0000
Subject: Re: [oe] [meta-python][PATCH 3/3] python3-pandas: Add workaround to fix build with clang
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200812230821.1802729-1-raj.khem@gmail.com>
 <20200812230821.1802729-3-raj.khem@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <4b35b1ca-a744-2ae4-6c6c-3dd12d5d227a@windriver.com>
Date: Thu, 13 Aug 2020 11:58:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200812230821.1802729-3-raj.khem@gmail.com>
X-ClientProxiedBy: YT1PR01CA0111.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0111.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:58:24 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6fa6886e-82b4-4a94-52f3-08d83fa1b5c6
X-MS-TrafficTypeDiagnostic: BYAPR11MB3606:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3606D6B11BC642F935C9AE579F430@BYAPR11MB3606.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fm2ZvGs6PCSUUHOMRDBUiJ5VCdgn8T/rT4yNmf1ItE8ArBoVNuCmyI/L3lF4EtHqMr/gKioBfZgWHsiVTxrJcwFQkb0wS1wWCAgF+xrAowoRVykUOvUcaQy0lgMmb1q4vHkDXkPKJAM4ocTp9n3pY0AViE5NqZxrLG389FL/iq5znKgHOIEsjUa5t9WFew+GsEPfFv65yi+DYfPhKtGb/6LhpN5Az4108kJiAYYjg2jXPsiyL6AGoa/8RYqp0Mw3NftO9xiAhsB6FS+FHYj8yeRAcydtMpTQNEoBGqeglG9LxMKgqnEe1PSPJsDOwScmSVIOrs8syilKDMCnpt/q3m4mkqkn8Wa7Wtg3RVQre7OkUnzVkuCr01JkVfEmeRz03N2sfT0KzU725RKiky8yC2d9Z4VL0NArEMoiVzJ1Ja8TZas3BSvRhqY8QlcTuHpOiLfj41D8gKg3PpNds6kAzQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(376002)(39850400004)(396003)(8676002)(31686004)(186003)(8936002)(16526019)(5660300002)(36756003)(26005)(6486002)(478600001)(2906002)(31696002)(44832011)(66946007)(956004)(166002)(66476007)(966005)(83380400001)(86362001)(66556008)(52116002)(53546011)(316002)(33964004)(2616005)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	RHOa1NbdQ6iNS664rB+LzrxE3Xx2s/D6qAnmU7r5M6CQk3tBWHCOEJfggUJdRzYVGX/CA8eBspMroJDm9KtEa+p87DvQuVPCyZUB3D7QWXt/SyASZzSb+BmuPjtK6TYmCJNliJOj945ukYMLrYcaI2TEDdDE4VcOoZQb3+Bx38/EYiLu4uDhipAqnWC8s0XJ7LJb00lMyJH3I8UyMSWaXzsqBrpuC0rLWI2Se2AG5rwjegACoXIodK1LjkgUhSDS4AZypuN0X2Wn9fjtV/wnyHql2TwlJD7Uh4t/VziAR/HoZ5rSQVdPNMwZguwBAqkeN387ry1oIEGDt07Vf75r3GhvT01gRCYWPnOmJDIDis/DKWbEkpMiFZ0VKqtlazE5pPv/fFxoLn7EbICY06MbuR0U26iqdF0scZHUdGy5qr+MaCkxXsGeVFK3oatw4Os5uxxTDA4pmrcUk6+3u1rQ8VUv6V5jzsT9Ci45RBOIKJN1PN07ddWK5uZAQaWND88JFhRhUZnNw0RmeIKJvOmxeouEUfOctjOvSRO8g7tGgfCppc0NHY3WAAvROS0ZG5ocILwfKazGu+5xVHY6LbJ8BqYkw6vbaxKNIAYLAqSFJw8ns1f3nvmHxCHn2ddAd9jnEiptkZJtYJbhojaNLBJI2g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa6886e-82b4-4a94-52f3-08d83fa1b5c6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:58:24.6922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+B6MMwJ0x2W7+edVa3dZLZ+nmIgg87AIV/vtIatlIou2MxjbGAdkZuF9VzJhiyXi4IvhNGGnafsG2UZU6p0BRDpNesbGmLWZ78H+p7vXJ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3606
Content-Type: multipart/alternative;
 boundary="------------7EE777F006CC106D71E35F1F"
Content-Language: en-US

--------------7EE777F006CC106D71E35F1F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/12/20 7:08 PM, Khem Raj wrote:
> This is a bug introduced by cython [1]
> the workaround suppressed the additional warnings seen with clang [2]
>
> [1] https://github.com/cython/cython/issues/3474
> [2] https://github.com/pandas-dev/pandas/issues/33239
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
> index f100677caa..7d65287cb0 100644
> --- a/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
> @@ -15,6 +15,8 @@ DEPENDS += " \
>       ${PYTHON_PN}-numpy-native ${PYTHON_PN}-cython-native \
>   "
>   
> +CFLAGS_append_toolchain-clang = " -Wno-error=deprecated-declarations"
> +
>   RDEPENDS_${PN} += " \
>       ${PYTHON_PN}-json \
>       ${PYTHON_PN}-numpy \
>
> 

--------------7EE777F006CC106D71E35F1F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/12/20 7:08 PM, Khem Raj wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200812230821.1802729-3-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">This is a bug introduced by cython [1]
the workaround suppressed the additional warnings seen with clang [2]

[1] <a class="moz-txt-link-freetext" href="https://github.com/cython/cython/issues/3474">https://github.com/cython/cython/issues/3474</a>
[2] <a class="moz-txt-link-freetext" href="https://github.com/pandas-dev/pandas/issues/33239">https://github.com/pandas-dev/pandas/issues/33239</a>

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200812230821.1802729-3-raj.khem@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
index f100677caa..7d65287cb0 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.1.0.bb
@@ -15,6 +15,8 @@ DEPENDS += &quot; \
     ${PYTHON_PN}-numpy-native ${PYTHON_PN}-cython-native \
 &quot;
 
+CFLAGS_append_toolchain-clang = &quot; -Wno-error=deprecated-declarations&quot;
+
 RDEPENDS_${PN} += &quot; \
     ${PYTHON_PN}-json \
     ${PYTHON_PN}-numpy \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------7EE777F006CC106D71E35F1F--
