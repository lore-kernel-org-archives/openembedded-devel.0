Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.87])
 by mx.groups.io with SMTP id smtpd.web12.6704.1596491014794323766
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 14:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gA3R7zko;
 spf=pass (domain: windriver.com, ip: 40.107.223.87, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zl8etInn3AZECGvLkHBw2tL/Jpkx3yMG/0/ZFZyD7bl4Kxr99dtGZbuFKWSORr7T4yWRc7WLxGNwhpB3zHRwkZ8pi/t8dd6r89HaIvkxe6m6OCQz+CYqfZljSZxiBsGMYMRYuhaqVWG2I+9jIDclMsWxh4Tmj8K5C1Ad42ET65srpOQVh0owp1dHjbzgacmfsfVG5Yd3Y8NzS7iAr4NjZglx9d+TbFrXeSjFXH1D1vQHRD3Vt0bla0/PS05fRrAk3Zbm26+hJAaA7sW01g1GN3Y68uHB4DlzXj6XHv8/9sFdHvgeBWUaCT/skQaN05solVu+Z1ixOy0R8JVibaxoxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mA+k8LWYK4NrWRoQbtPU7BJzaqJDz2r/67OFYgb3GA=;
 b=gKiM8+SsCUZMayCfvw9R1yQ7t+HF5r4Qx5wUB/3Zy9YaRhfT+F14upVfYxmfvtC5x3a7rj6us6aeCNyZCaduKOx3VgCtAL/wZ8oiO2RH+UqVugEihE/sZ/KOe7hGgtKrt3uTzqmsO3rPDp6YmjNzEDYnGIR3tan5cwZ8hDOrPmdSrRnuSRxSbIkbSkeYbUwJbYIWJHM1UjEwx+xqQ8JyjKokXX2pAROpJnFljR/C60XPfMmNVeonV9gYwEeih9INq/1GrZb7WYO2+keM0LeAULqrXXHjqw93lM2Rp4QzUh51VWmR3nufIr2iN3hGet7knBXC7unwbXsgpUpvaopioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mA+k8LWYK4NrWRoQbtPU7BJzaqJDz2r/67OFYgb3GA=;
 b=gA3R7zko8vgng40ZEvkRHDGOv3MkFXrVJA/jwaYsH1NX0tB6sNf/iAm6xVaV1WsU89Nd6RgJeDFkCjKE8jthYtrjQnHoDBn83LUSoOxJWglRjCUqXW2KpyFOm/9Nhcjr/ZvXp/DwMxSnI6gmbHmsj7Cl84mSDFBa331FpoK2BtE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4101.namprd11.prod.outlook.com (2603:10b6:a03:18e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Mon, 3 Aug
 2020 21:43:33 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3239.021; Mon, 3 Aug 2020
 21:43:33 +0000
Subject: Re: [oe] [meta-python][PATCH 04/15] python3-pyroute2: Upgrade 0.5.12 -> 0.5.13
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200731132230.20031-1-leon.anavi@konsulko.com>
 <20200731132230.20031-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <c04d36d7-7d2e-2890-ce9d-5a5679ba4dd1@windriver.com>
Date: Mon, 3 Aug 2020 17:43:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200731132230.20031-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTXPR0101CA0045.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Mon, 3 Aug 2020 21:43:33 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec69ea3e-faac-4557-492a-08d837f64530
X-MS-TrafficTypeDiagnostic: BY5PR11MB4101:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4101443908C1A90842AD0C3A9F4D0@BY5PR11MB4101.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5HQFWNB/HX4iDpIcsQBpuaceEU63q//Gc5jzGcqi7kGO2ECME15fvCGr7zbQCpwuMxUV+YnPuu04SGGMeSUrgfeb4+hDAHmAz6c5TqNefb0M2mUY9Pnr0pKNY/94caLBmdty5nJp60oWbiTHXVodwdT99ucp5cU4Ar1HQ8QDShd+TAZWIIP4ZqZ3yP/XDZ+s8EuGRh88O5AKyNp/zYS6UtbG7Fal5fwX695ILVbXGmb25aNRFrSnjhUDIqpTcExPFlpglVP9ERBMaQRy7+IUjtFeyaUFjxoUn9qdZ60IRCO00yC5n7P3Q4XQ1ppLjF7mgcco+jbH6LbdvC4zzBWgEAz9uU9sV68od8vhJom/j5PbTBfdX+/3I6TMzVBzOnvbBd/5082pRDWgiJXqd0F2hlGn+uE87OrhqtokOdiN9YhyfloVCclQLJq5jY3UnoOREIpf9VHlR0zsjm6C929j9g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(136003)(396003)(346002)(366004)(66556008)(166002)(8676002)(478600001)(6486002)(31696002)(44832011)(2906002)(66476007)(66946007)(52116002)(31686004)(16526019)(26005)(16576012)(956004)(86362001)(83380400001)(316002)(186003)(53546011)(966005)(33964004)(2616005)(36756003)(5660300002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	SJsjQRarTwg9xwM0Xg94K2ug/PCh+Z6uI+HtSx5Odbxbug5l/OU5UsDMfJYwmYX/8o7nWINPWbjJsS/i+0s1OYAQTqzjBTS/llN421xhCxI5d3+hupApqmN6kgoFZX5OvF49cBFw0JId0Dd3h9CUbsd5wCmA4f1deAhkW6IA/Us+PximCzWY6sm0zZchLTG8YDMmfc+oKL9ZZlTuug591oawwLe9xAncToeukwIicyb9yCDMrdtTwkcEEdRHimqTkiR3KV6P2roO5qGmDvMhp+4fp06KSvMLgSYWxlvei0zJp/aQZrJo2nL4UgaEl0BpsT3c8I/ZJ7kElo1eSS7W1evGICBhO6njG8B8EN283Hw7/6soZvuq31s5iYDZ5uOELHsKdwXFgNwq2IJGiWZZmDXs0tLQYHWyXlZSXOcAg9dJlWYOX8ws+uXYPrNrRmEPeLYMS0F2kCMEY1Ylk+rIP+dYRzlD4DglQyK5KpTE1WSwc/q5y71XCCSLwjH3eGrb5CPJEJRUF1tpxz2DW266gCJZegzTMKNGCqoZvRjaS3PBypFexw6XiC24b7JqJpNblu+yn/oVLu+Y/T00eeVz0xIDR5kMth0wynq7OwE2XaGBumoDAflpJXKSORyPSPEG84iRa4dvxKlMp2/EncvLeQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec69ea3e-faac-4557-492a-08d837f64530
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2020 21:43:33.7088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFH3mvHTr71OqgoKTC2KMyK7SNCUyTaM12ezN0bLMZ52Me8a8OGcyFTBxd9nalJmC2QCXt606n1GYpbf1vVF+AOApIv7OH0jiCv1jKL4ChY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4101
Content-Type: multipart/alternative;
 boundary="------------36D81DFB1453843CCCAB0DEF"
Content-Language: en-US

--------------36D81DFB1453843CCCAB0DEF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/31/20 9:22 AM, Leon Anavi wrote:
> Upgrade to release 0.5.13:
>
> - netns: allow to pass custom libc reference
> - generic: att L2TP support
> - iproute: link_lookup() optimization
> - ndb: basic cluster support
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-pyroute2_0.5.12.bb => python3-pyroute2_0.5.13.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.12.bb => python3-pyroute2_0.5.13.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.12.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.12.bb
> rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb
> index 440f8993c..4fb401957 100644
> --- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.12.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb
> @@ -3,8 +3,8 @@ LICENSE = "GPLv2 & Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                       file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
>   
> -SRC_URI[md5sum] = "4370e9a5875486a1223705ea9b001eff"
> -SRC_URI[sha256sum] = "0157801c5496177856c3296b590065e691b041a3adde6fb8ffad2a8d05013ed3"
> +SRC_URI[md5sum] = "6c72ffa7147bbfa1610942e5734c8c87"
> +SRC_URI[sha256sum] = "518365f3313e73b0f024b9fa7a580b29bfa2fe2c5230be0bc69c068bbf6637e9"
>   
>   inherit setuptools3 pypi ptest
>   
>
> 

--------------36D81DFB1453843CCCAB0DEF
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
    <blockquote type="cite" cite="mid:20200731132230.20031-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.5.13:

- netns: allow to pass custom libc reference
- generic: att L2TP support
- iproute: link_lookup() optimization
- ndb: basic cluster support

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200731132230.20031-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-pyroute2_0.5.12.bb =&gt; python3-pyroute2_0.5.13.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.12.bb =&gt; python3-pyroute2_0.5.13.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.12.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.12.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb
index 440f8993c..4fb401957 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.12.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb
@@ -3,8 +3,8 @@ LICENSE = &quot;GPLv2 &amp; Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263\file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce">&quot;file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce&quot;</a>
 
-SRC_URI[md5sum] = &quot;4370e9a5875486a1223705ea9b001eff&quot;
-SRC_URI[sha256sum] = &quot;0157801c5496177856c3296b590065e691b041a3adde6fb8ffad2a8d05013ed3&quot;
+SRC_URI[md5sum] = &quot;6c72ffa7147bbfa1610942e5734c8c87&quot;
+SRC_URI[sha256sum] = &quot;518365f3313e73b0f024b9fa7a580b29bfa2fe2c5230be0bc69c068bbf6637e9&quot;
 
 inherit setuptools3 pypi ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------36D81DFB1453843CCCAB0DEF--
