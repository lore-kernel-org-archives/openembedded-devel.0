Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.51])
 by mx.groups.io with SMTP id smtpd.web12.14958.1600180325959853984
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ldrk6zyb;
 spf=pass (domain: windriver.com, ip: 40.107.236.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaJBFq26CmV9WWMiY3y0S2eRHxK5vTqQoN9GTc1+HnhFTOEpu7U9VZM1wBLJNpqZrDwu9yXuIr6SM1kDqJHpK+F/SdEVBS7iDUZGL1DMq5ppQa2fuZr2ZNBTLMdXFRkFYbJZkIqDFNLYSjq47IhZjo+UvmuHCf2547xtw116QLaPr2BtgrLgfblL3UkIokJ+Q0vbeo3sN0i+d7yl7Fd2/HC2t4oYqAr8Kexb8GqshCBMXn45yt+3zWesJotWWvRq5DIrSeHLsinlK9DshwDOseSXRKN6iQcXhnH4g426+NOe2u4o5/WvBc/lU0CKJaZhv70HxXeaLjUAfKzSoC05aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yirTiqxdxhqmkhO4eRunFHFY3u13HT5u2k5xbWkEPFs=;
 b=N4n36/5hhjeMv2E/49QAY4k8M/1503v+6BEGPx7FZvhW89grt1bNl0RAGP044kN8k+SKYmu4ROPPKmIqUjMVD2/Benzp1t9dF4B96kp5r6M4eZvkjnddwdHfJIfpecNbSRa2VH0ra3Q82HaF0x25CIoYudi4AtTAYWfnmAxcEmhgPuFrXQ8yOSVDDnBDHQxGDPzU2DqujbqzTEfDkbPruZ+OQ9vH4gnavEK8rcK7cBFUJGR6SxT3sbBlQO3vNSnd4WlU2KuYchHkvIqVDyIM6+FGUqcOKFtglj5LlxU9y2I8x+Q2m7XhTVOWU4Bglq3jLoeiFEX4pxrR954RTRce3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yirTiqxdxhqmkhO4eRunFHFY3u13HT5u2k5xbWkEPFs=;
 b=ldrk6zybdoXuAsyC6PM3TBRGjgVNwvDVpdiqq25p5mcRahuLX+8/GTisgBbq4V18aSLwFWYQNtPaG/kF4Tm2elaj/pozTxeqcNupz0+igASWNLRoNUclzo78VDVNWbTahBLn+5NvF3S+zrm87W6v27oGl+BA/5aM2qqGfB8ILs0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB3912.namprd11.prod.outlook.com (2603:10b6:a03:190::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Tue, 15 Sep
 2020 14:32:04 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:32:04 +0000
Subject: Re: [oe] [meta-python][PATCH 06/10] python3-pyroute2: Upgrade 0.5.13 -> 0.5.14
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
 <20200914131536.6072-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <204f74ec-4fe1-70ff-4333-1ef8c41ee5a7@windriver.com>
Date: Tue, 15 Sep 2020 10:32:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914131536.6072-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::35) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16 via Frontend Transport; Tue, 15 Sep 2020 14:32:03 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cfab543-487b-442c-56cc-08d859841d6e
X-MS-TrafficTypeDiagnostic: BY5PR11MB3912:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB39128597DD5621D4FC9813799F200@BY5PR11MB3912.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r2KwwAbYlCmkqgdC1E4sG0C5Cb3VENQqxI59f8cVaHQIHorCbavDfdRHjZT7yiv4dpwFvBh6g7diRZVz+NUIrLnOeF2G3trNcEBxbmTddJOYadO94cWnR9rX8JQL/vrAL+H37zsvJxv0FlejGgSNURSof+B3C40KAm7QZ9GEVakpk2I5DJA2DvVF/cn1KKm/XSabNyFIVs2GudreYO28xIDSwEfLpZvf3LEskD/k5Lsc4cWBXX3Yct69cj9YN52azYLDh/ioOARV8afbgmlDNawSL/5OXOABoZhjEr/L8hytKKfsiFxuiGXzbg3SZXgGWaTNL40kJ1gYi0GouK7TPvNUN2qXtcFImmWChvDyt7WCzX/bvFbF9cGt5SLEcb8mkKu2vtzw+SQG9nhaPiqiZ73b9XuEftUYGK5b0iG170kEncuWZKCV+e5FzB8RKehCHqaM1QiapfI3ZtfjjADlfw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(39850400004)(376002)(366004)(31696002)(8676002)(66556008)(66476007)(26005)(66946007)(2906002)(8936002)(53546011)(186003)(16526019)(6486002)(36756003)(166002)(478600001)(316002)(16576012)(2616005)(956004)(5660300002)(44832011)(52116002)(33964004)(31686004)(86362001)(83380400001)(966005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	/kLr5wj18tjewiiAL8KWkIDUFvOxRv5CLHcjH6XcVwJvxe5TpnGj9n7hLKz0mOGBiMhxsUcL9kbHMTWbDkE3pJgdBrhR9rGhdiM3hoBbOVQedv7OLaA4983vRZa6EsVdJ/vHmd6EFOV94m8j4ZK6pbg4sHg1pT+QYlaZ8lDqedr1k0W/RqFU/A2lOI5qLlBPD1A8zHMJ1A/Cq8M5gp2TmePlxelEbM+ZiLeM/iqKp2oY5hMOvWuELtWk4R/HL75DyWtxT6ICd37hPiyfuTw1ECacvciwLTb/Enhwr5CxlDCY8U6ZV1mX3oP92sucYyVElSFgvU6isY6VQ9K8EOukBYoEzcdibgpnSmSVddg92HFOJ8sXYmIQpioyq4SoGiUqCaMKkTO2J39j5xZhBEXa97WxFLJBLK2ZSmuBcXtHiBjo/RHk6URw8zPUNDrGC1/U5OWeiEb5QuKOVh/kGxAmECcOdxaBPAA5cvbsUFX8zNP+Ifb67ZY2bBsVf9UN3lWHgYSOxZ1gK0bS/53q8r04Yy/MUzCSPe3/o9ab5YYXe/zmqFok+IFM0eLuWWixoZcnkzxiBz8nwknrfuIgqIlwNuYFBGgmR67tH+giuY1JabkewbRyktq5VcqnsC/yg5fWuOT4qNiS4dmiZ6+CFGdYGw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cfab543-487b-442c-56cc-08d859841d6e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:32:03.8779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJiCneXkEO/W4I+hGnB63YU8rCIC10zIsTWfC2Ert+AqK1hf++RYvyIzwFJutiWOSe1h+pQPmGMCkrhjmB5VYkU7rpODfztl3HLpr1mIygA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3912
Content-Type: multipart/alternative;
 boundary="------------38E534F0FD3526B9B452DDC7"
Content-Language: en-US

--------------38E534F0FD3526B9B452DDC7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 9:15 AM, Leon Anavi wrote:
> Upgrade to release 0.5.14:
>
> - iproute: ip neigh get
> - iproute: link_lookup fix
> - nftables: missing hooks
> - netns: bug fix
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-pyroute2_0.5.13.bb => python3-pyroute2_0.5.14.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.13.bb => python3-pyroute2_0.5.14.bb} (85%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.14.bb
> similarity index 85%
> rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb
> rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.14.bb
> index 4fb401957..84397b65b 100644
> --- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.14.bb
> @@ -3,8 +3,8 @@ LICENSE = "GPLv2 & Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>                       file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce"
>   
> -SRC_URI[md5sum] = "6c72ffa7147bbfa1610942e5734c8c87"
> -SRC_URI[sha256sum] = "518365f3313e73b0f024b9fa7a580b29bfa2fe2c5230be0bc69c068bbf6637e9"
> +SRC_URI[md5sum] = "6bde3624a6f22bdfb630bb54243a0d1d"
> +SRC_URI[sha256sum] = "774c5ecf05fe40f0f601a7ab33c19ca0b24f00bf4a094e58deaa5333b7ca49b5"
>   
>   inherit setuptools3 pypi ptest
>   
>
> 

--------------38E534F0FD3526B9B452DDC7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/14/20 9:15 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200914131536.6072-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.5.14:

- iproute: ip neigh get
- iproute: link_lookup fix
- nftables: missing hooks
- netns: bug fix

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914131536.6072-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-pyroute2_0.5.13.bb =&gt; python3-pyroute2_0.5.14.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyroute2_0.5.13.bb =&gt; python3-pyroute2_0.5.14.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.14.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb
rename to meta-python/recipes-devtools/python/python3-pyroute2_0.5.14.bb
index 4fb401957..84397b65b 100644
--- a/meta-python/recipes-devtools/python/python3-pyroute2_0.5.13.bb
+++ b/meta-python/recipes-devtools/python/python3-pyroute2_0.5.14.bb
@@ -3,8 +3,8 @@ LICENSE = &quot;GPLv2 &amp; Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263\file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce">&quot;file://LICENSE.GPL.v2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://LICENSE.Apache.v2;md5=34281e312165f843a2b7d1f114fe65ce&quot;</a>
 
-SRC_URI[md5sum] = &quot;6c72ffa7147bbfa1610942e5734c8c87&quot;
-SRC_URI[sha256sum] = &quot;518365f3313e73b0f024b9fa7a580b29bfa2fe2c5230be0bc69c068bbf6637e9&quot;
+SRC_URI[md5sum] = &quot;6bde3624a6f22bdfb630bb54243a0d1d&quot;
+SRC_URI[sha256sum] = &quot;774c5ecf05fe40f0f601a7ab33c19ca0b24f00bf4a094e58deaa5333b7ca49b5&quot;
 
 inherit setuptools3 pypi ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------38E534F0FD3526B9B452DDC7--
