Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.81])
 by mx.groups.io with SMTP id smtpd.web11.25364.1598552212002617415
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 11:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iV1XZJBm;
 spf=pass (domain: windriver.com, ip: 40.107.243.81, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eazrvHNPNBkLSemgtTlbRUvTl+P9d5CH6sdyUNuVXpNdfr9NVnJyAsHkbXEEryfskeJO845dVZTF8KNxZKVOAzmRBnPx+mFNHMipgf+bXTgfMP6Uizz7bWKX4uafkKO9Ze2qqbBUVVAlEhUBT8+AecKvTyYXtw6vcoxYR/3iTQqXR5VdxmTxmqeszsoOr5df2UNK8dypjJ9tWblk08/vm5TpLq+MYbEHPdSqZWUlJkTZ3V4wRI4HORCYsm1ayuI5OxcMIJidjEF1M8n6FMUIrb+ErThjKEAtQ0pVkqAWC7O/U1G1FiZpjrlKn7bnV6ckxBiKAksaxpr1zULonGtTuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eab0+BNwr73nAe/VKFjKTU3rlVYWyFpPPQMnoHKRxSc=;
 b=AyPhEk0buJpXdV5rN0S0GpxXZIE4HQRFWsJOcKM/k5fVunG0bm4vunA+xEgssIb2gedOcYoXkNAcUif8ZZg81Zkoa1dR0p593N+yK3zfyJq7bMmCKmAKQVj86BS5/xE6zQWYfKvJPsKs0vfIqcOyLBhXTLAUgRFfy1sAO+okQ4lAPFksKR50BrYqHZXkgpXIfwl1QgLoSeRMe1ILCy7VxlfnD6n8oQK6g8iBJKefBO1ZDqKYnM3kTpjeRKq2DFLml8sGPp6U6clvMbBGfUgfXyPlRIJ74m7ZP2PdKnPcXJ6ChXc6qNpXb75u4AH8yY8DimZi8abeL4PF/sHivEuUZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eab0+BNwr73nAe/VKFjKTU3rlVYWyFpPPQMnoHKRxSc=;
 b=iV1XZJBmpT3lX3zfBrhs4t8XuJ25vgA65LtCj3au6HNcokFxcYemSxXI4L+I3PmGOsSzfBzC6Qf6L+hRf55XGkquA5zxlbBxfPLXY4fJ0P97c4Rij/Vwm0EHktybxaIoGnB6cpnfLeqnft9FayfIHtztTT2N/v6am3t1sPXIK90=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2806.namprd11.prod.outlook.com (2603:10b6:a02:c7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Thu, 27 Aug
 2020 18:16:49 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Thu, 27 Aug 2020
 18:16:49 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-bitarray: Upgrade 1.5.2 -> 1.5.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200825132633.875-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <657814e4-1c46-4e1d-0c9c-2e38fed5cc33@windriver.com>
Date: Thu, 27 Aug 2020 14:16:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200825132633.875-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YTOPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 18:16:48 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4010d189-bb58-42a9-afeb-08d84ab55d43
X-MS-TrafficTypeDiagnostic: BYAPR11MB2806:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB28061E5D13FF61C3BB608B9B9F550@BYAPR11MB2806.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	94EoO7zQItyq/QcyCwqT9D9PdHg6ZIZweB5lDsdxU/lj/k3aAsXaXJPLvypC/z9YViw7dKSsQxdRqSgvPDm2oxs4tKZhCsTjz/6pJcreZrpolEuPsvczCfRL4zGHmoqq+FbXrUfFWpysScLrOwF6BbbY7HtU+z+P6np6XNXMA2iE8ef5AjoC13teXa19WvbHtYj89UC1cRPlWTAA2MT/obcNOA2mTxCjZ44RFB+RaEe4z8HzXlISnLBbDFeWn+xj3PiNG/6dSYKrHO2uvaCIUMWULugevY15kczXgagCxlz1Lj89WSZmE3/HE5sKVwlpEwVO/ZzQ4l55JEfIB5EVAI+Mp9zbg+KlXJwaD64tp89nbl+zl+0XgqiAjsfGB6uAEkL62HKA4LcHtE2rsHjv3O/RHFX48avn1MT/cMibZ4Q/ROp4EC6kWl2e6NTOdPNVMzIJnVxf4VLeK26AXj8DqQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(376002)(346002)(136003)(39850400004)(86362001)(33964004)(83380400001)(53546011)(31696002)(2906002)(52116002)(44832011)(26005)(66556008)(66476007)(2616005)(66946007)(186003)(956004)(36756003)(6486002)(8676002)(8936002)(31686004)(166002)(316002)(5660300002)(478600001)(966005)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	08U/DFTO3QOR8r+ifl0yPJPqB4vEXh0gM7IIXbNnEfvl6HA6hm3/JS7dtyP5RKp35mQlDsyM1VAqyVkPnh/ck+mQ2Luc2kklJrMUBZNxoLxOkWatLZ607y1Bl9qmSPrQjM9pNfwiD4mTa7GEuxgOYPqpc9/cXFvrZScHY89hIdKWUm2G44zje1B8aQ4u1rfms8a6y7BtolqXeRVaOWNwq/XZknRE1ckv8a+CzY5cfrAGfuRiD9nb2RcIW+zUG1LgiC+NiJxqR1/UKG9WO/NPnFzpq44FzI+CMjts3xQ/mkJTuA+xE+SbmH+6UvQePp8NMyNteRTPPIyQ2n/lguy1ivVjMNJs9KVpyOmFJZ9WJGzuo9HA2JH6BllM3qr3NTKGN3cfVWLB/a139B9ra3QkuS8ErFbtlFurdm9Hu147pGOOrmZAD4ocH1Tu3Ru9ucp+xCu//SSeZFro7pLvIkvX5QqUbe0XQQ0KvZzTfgAP+yRBPewqBk5MqQY4kk4MDfvI66c5jju7Lr2mNqC7T1XgkPM5PK/092zsBUkPFM8c9SZPYam39JSRJzppzEVAzfismNxDP0Hu7RSa6Ax4qLd5Jqfa2xjBFcJHerFeIUz6pgBwQP/kRKJkyIcNxZcXBjh571jzisktOst4kCZEg1x5qg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4010d189-bb58-42a9-afeb-08d84ab55d43
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 18:16:49.1225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krdP9AfQ7vuI3j+kHDI33E3TvxNxFz7Yxnn3hN9YIFOyxAmyoV/msIU5mL/bgatXGtd5rI1IbBMWCpuNi7r3NG8nVl/Ts0cEHwxTLFcvgY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2806
Content-Type: multipart/alternative;
 boundary="------------8EC4E1C376056703A71FBE50"
Content-Language: en-US

--------------8EC4E1C376056703A71FBE50
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/25/20 9:26 AM, Leon Anavi wrote:
> Upgrade to release 1.5.3:
>
> - add optional index parameter to `.index()` to invert single bit
> - fix `sys.getsizeof(bitarray)` by adding `.__sizeof__()`
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-bitarray_1.5.2.bb => python3-bitarray_1.5.3.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-bitarray_1.5.2.bb => python3-bitarray_1.5.3.bb} (68%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb
> similarity index 68%
> rename from meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb
> rename to meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb
> index 15393001a..e36a17027 100644
> --- a/meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
>   LICENSE = "PSF"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
>   
> -SRC_URI[md5sum] = "ccd872c5effef77bf4028c67c0619f6c"
> -SRC_URI[sha256sum] = "38fe66d5f7720835703a07fe8d0a4b5eda87f692f3cf4fb01543407b79857edf"
> +SRC_URI[md5sum] = "7cfa242b99351646fab0d76b05aab747"
> +SRC_URI[sha256sum] = "567631fc922b1c2c528c376795f18dcc0604d18702e0b8b50e8e35f0474214a5"
>   
>   inherit setuptools3 pypi
>   
>
> 

--------------8EC4E1C376056703A71FBE50
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/25/20 9:26 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200825132633.875-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.5.3:

- add optional index parameter to `.index()` to invert single bit
- fix `sys.getsizeof(bitarray)` by adding `.__sizeof__()`

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200825132633.875-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-bitarray_1.5.2.bb =&gt; python3-bitarray_1.5.3.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_1.5.2.bb =&gt; python3-bitarray_1.5.3.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb b/meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb
index 15393001a..e36a17027 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_1.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_1.5.3.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/ilanschnell/bitarray">&quot;https://github.com/ilanschnell/bitarray&quot;</a>
 LICENSE = &quot;PSF&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d">&quot;file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d&quot;</a>
 
-SRC_URI[md5sum] = &quot;ccd872c5effef77bf4028c67c0619f6c&quot;
-SRC_URI[sha256sum] = &quot;38fe66d5f7720835703a07fe8d0a4b5eda87f692f3cf4fb01543407b79857edf&quot;
+SRC_URI[md5sum] = &quot;7cfa242b99351646fab0d76b05aab747&quot;
+SRC_URI[sha256sum] = &quot;567631fc922b1c2c528c376795f18dcc0604d18702e0b8b50e8e35f0474214a5&quot;
 
 inherit setuptools3 pypi
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8EC4E1C376056703A71FBE50--
