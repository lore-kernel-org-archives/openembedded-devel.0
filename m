Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.59])
 by mx.groups.io with SMTP id smtpd.web12.5692.1596718839710195191
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Aug 2020 06:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=FtsaUvXG;
 spf=pass (domain: windriver.com, ip: 40.107.93.59, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTGKeLJy5DRfsmODHam6ZjXHwN9kvqPjgwSN12bdwNfSi4wN7CDx51HICj3AGfYd4vXB3Z/Y7xqGnFgRSKDxTDjD8oaHyJ25VOMEffm3/hx/cdBFn6HQE66CZB3QRKRM2FFTdSSiaYAAghZyldfjEZoukVEOCA8A0Z6WpIRL8wW5BOHfqlykDh6BlhvFosUigXYKVRcO9+g8HFn9KyheXJeA0VKy/ElUHSL28LVN7OuPKAEJG5oJeueTSG1mirYRz2U07+Llrk4YJjnyYCQvIRDbP4oe/1XXyW7StMSMgw2T+BmqVzX62yji0a6vZ4U2vt5uycnzcBa/y7qsHcAgRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ES/iMlOcFBkkj6/BxSjZ8EMOZJaGvj4pRAqwtHoGDfc=;
 b=aeJXsodHRuFrHfwZx7AxtW4fBBZots5u+pAZvD4EmeUllPpHy8uiocPvhRqMju/uCfeCQvNsqExqT5Ukf18spjV+n5vz7GADuTC70nHhnIbO/FFtZLxVmZcfedTFnQ1RAQxPHD5ymnpZFf2VsM8G8rmYTzGz4wPUiz8xsZZCAC1790uRd0By7ZOXtiRam7iLQFdnoBsWG/7Ob/o/bAoOFdgOUADGUMZStobq04tmaqzo0Ol67atH7OjmyRHtb/0I+GiIrdx/eQfAW5Lc3k3arjuiiWQs8uCdke+9PbooVbQPG8QP2Lj6HmaIFWJUGI2T8ar4RAhtRNywnrgU3CTmjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ES/iMlOcFBkkj6/BxSjZ8EMOZJaGvj4pRAqwtHoGDfc=;
 b=FtsaUvXGkOmhUfayTcmcW44xN7ad2mdEj82zDHB9iEkEAEkthqSn3RwI2uux9Il5fbgSTEr1w87dj+QZ1UNnINqja2B2mOncqnWPKX0KwGcWD88IEw/uMec9SBluw1FVJ7VhgzPLgqzqksa3fF9/Zy13IkWcSJOVknoWVblKXDU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 6 Aug
 2020 13:00:38 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.016; Thu, 6 Aug 2020
 13:00:38 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-autobahn: Upgrade 20.6.2 -> 20.7.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200803095759.9591-1-leon.anavi@konsulko.com>
 <20200803095759.9591-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6b257a9f-98f6-4a5b-5160-f1f8d66b3384@windriver.com>
Date: Thu, 6 Aug 2020 09:00:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200803095759.9591-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0136.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::15) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0136.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.19 via Frontend Transport; Thu, 6 Aug 2020 13:00:37 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbf030c0-cb8c-4309-f229-08d83a08b72e
X-MS-TrafficTypeDiagnostic: BY5PR11MB4305:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43058A6039F98CA164ECD7659F480@BY5PR11MB4305.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Bzulw3yY/wPxP8vMpNgRNZC+8Upy1sMakbrnRIPS6gri1YX9JriRQkmIIHWNGOQCNT96tHPirSaZ9P3iLiX74SMxuEMZs3K/uaLCjUdxS7oFDGP+2aX8T0uftPU80EOELWsXATO4AZ8TleE5iYxa8ISWIl+rpgGHo56YCH3a1Tnum2F4M9MsSTCc+GmISOvRyt+yLuLDvjeExGKCi/L1AJZE/vQzZgwU4Z/hXSJBU8zns/naV7oJclNKb8og6dSAMxECf9FR264J+ARUl/9/4/adtrMWoOzTUmLAn+kiTRCwc22OGXMKY2Yp04bASuXFrKMkchZIK6+28Bi9JRoU5oTTOfnry7mAKvCXaIn7XBxQWWEvCYPQJJ0A/dShWAHc+R12pNVYVW3lGv+aCgu5jmcoR4OC5xlwDmAqgcEv5cr26fZ1wv9P63vW3+fQwU3b3TpijAWcFxfZve/QKtv7nA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(346002)(366004)(396003)(136003)(2616005)(44832011)(26005)(86362001)(186003)(16526019)(31686004)(956004)(5660300002)(16576012)(316002)(478600001)(966005)(52116002)(2906002)(6486002)(166002)(8676002)(8936002)(36756003)(66556008)(66476007)(66946007)(31696002)(33964004)(53546011)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ehMijTTB08MbdNCPaSy8/WOHIa1PdAJajsD4Ggovq/70SP0p3gbgjLoKuvrkP6IVXuxh4gTQXAQLpQawhzdeIA3zNDXkS/VIMurGpGc4G0r+fmD9pK63jiao7ySBXeZudgiFnHzckRFyze8+lBJ8fvEgMsBXlk/znx2JfxBG9d4I3SLyE5OFKu2VVbEjnBLhfPQ9P5xt+s4eKL5K9ONFqbUU3ORifYy6lf4QEvLCfIcrqz3aGa7vw3FgZaAriSBf7HpsA2UvhMszZkvJEJUgk/Jy+ped0BOZHc3wKBLwL758SQeXZ4tQ03pnl4tFTGtbItE67sHKE+d5mbmxExLaHLD4qTl1hpMxHbWBMP5uq2Sp1/7+Mdxt7HVA1C9wQrv0w6r4RuIoTIGlnLZtmqSgOzo5CAqtyNiIlo4kJ4RUa7yzBSX13hEXdeBt5FRu4+pL/aqwZO7Q23HM2gAtr/3OuUahGXBQAI2cipeRrid2OXv0keebmENcXat8IB+DWWbwOloTyPU/oWggmx/O/p80qFL+5geobjBmOgtAcvmT+aKTxvE8WXop+5qPS4pgbDJGSNp+044N+OnhNbFYQBNqoP7KHSTaxaItM99amIsKK8ewIHGXsboyjI0Eb3C6xHFXVQBR25SJ71oJikvrRErolA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf030c0-cb8c-4309-f229-08d83a08b72e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 13:00:38.2830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p74Eat4ghBmWK92qysARixVAWfAfL1gTPVFRkvNJM12UchUV4hlx2BjCJSmAOC9lmFiiralajUrAxcE1XEYjupk0VwJJgyXYIytuTQ6V5H4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
Content-Type: multipart/alternative;
 boundary="------------2152D6FF75F312267BF0CBC5"
Content-Language: en-US

--------------2152D6FF75F312267BF0CBC5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/3/20 5:57 AM, Leon Anavi wrote:
> Upgrade to release 20.7.1:
>
> - new: various fixes and improvements to rlinks
> - new: proxy worker management API
> - fix: turn down log noise
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-autobahn_20.6.2.bb => python3-autobahn_20.7.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-autobahn_20.6.2.bb => python3-autobahn_20.7.1.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb
> rename to meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb
> index 171a6dce4..29f187cf8 100644
> --- a/meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb
> @@ -3,8 +3,8 @@ DESCRIPTION = "WebSocket client & server library, WAMP real-time framework"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
>   
> -SRC_URI[md5sum] = "bcafb42ea58232308777a265d41c1c98"
> -SRC_URI[sha256sum] = "6ac6b6653b8d20d632b034adccf6a566154d4efbeaa23abf7c3995fd601e9a01"
> +SRC_URI[md5sum] = "1ea21f5e751517a71f605eaaff7f0c38"
> +SRC_URI[sha256sum] = "86bbce30cdd407137c57670993a8f9bfdfe3f8e994b889181d85e844d5aa8dfb"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------2152D6FF75F312267BF0CBC5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/3/20 5:57 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200803095759.9591-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 20.7.1:

- new: various fixes and improvements to rlinks
- new: proxy worker management API
- fix: turn down log noise

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200803095759.9591-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-autobahn_20.6.2.bb =&gt; python3-autobahn_20.7.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-autobahn_20.6.2.bb =&gt; python3-autobahn_20.7.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb b/meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb
rename to meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb
index 171a6dce4..29f187cf8 100644
--- a/meta-python/recipes-devtools/python/python3-autobahn_20.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-autobahn_20.7.1.bb
@@ -3,8 +3,8 @@ DESCRIPTION = &quot;WebSocket client &amp; server library, WAMP real-time framework&quot;
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98">&quot;file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98&quot;</a>
 
-SRC_URI[md5sum] = &quot;bcafb42ea58232308777a265d41c1c98&quot;
-SRC_URI[sha256sum] = &quot;6ac6b6653b8d20d632b034adccf6a566154d4efbeaa23abf7c3995fd601e9a01&quot;
+SRC_URI[md5sum] = &quot;1ea21f5e751517a71f605eaaff7f0c38&quot;
+SRC_URI[sha256sum] = &quot;86bbce30cdd407137c57670993a8f9bfdfe3f8e994b889181d85e844d5aa8dfb&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------2152D6FF75F312267BF0CBC5--
