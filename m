Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.56])
 by mx.groups.io with SMTP id smtpd.web12.12568.1598359511381914749
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mONZ5zro;
 spf=pass (domain: windriver.com, ip: 40.107.237.56, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tg+PGpH1UwzjcPVvyNpMu6r68NAn9KOuhMhczP+O2YdDPpcpeOlLgfSVCfQ+pa69vBH05o6nM2YeNJuSbApyInNDQZqePy9yKruZJULB9q5L9TSgGTLP2jrB1VIZLj/FAc1+BuyYUmANtSxYiQZ34vKLRl4mld019GHyrb4ev0TbwN5u4YXC3C8mT6t92ZgtDxg+RB9CWY/UEHO0pqY4xzdLIrOLO+ToIrIwJt1lKfMsIipB+o4510tYCCKn/x4fxLXtpGIfANGdzvuM4wt8zyQ9orYmVuYOwp1vXigJri5+uTAGOOFxa2u09SmKB93qyMIMiWw3z1U50qyeHr7Ijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzcwyIB5xEFMn+zg631v1DcZ3+/44rE5Wii4geNGB+s=;
 b=NHTyRTAR6Ln1pY+dnKuqJbrHsyIeQD1udUnEfzxSs8ZrLF3r4007bGu1hZGWub5aLEyPyRezROqIxp68foQ1WNq5FR3dK/QGlNGAPoqps9jBiXgMqrq9zzlDl+5ca9u0Y/zgs5nT/+vFWcLsZcx4iRRYrQmG7MOyqMX/I0ii8Yc4y2n8PlvLDmd1BQrikGo4GLh7rNQiXhl4Q4n8wN20SMYx0ZUygGcEhce3yrdoxk9qcNOZEemmtucQI4X4ph5MTFySPkYyBfxZlsgUvzDRc3FNLxETxwbleQk4sDuBYxLRwmn/riDaE8I0eTjq4JGhnG3puZVcTjrf69ljsXdiEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XzcwyIB5xEFMn+zg631v1DcZ3+/44rE5Wii4geNGB+s=;
 b=mONZ5zronyqlJUIo3dppNrDkxZCYaRG4K5ZTBd5GN4o2wipN7tvyXZs/hYjdpj9PP7yZUlIK4mB5ReAUkFMWfUNSgvyvKzTFa1waHfq+JV/BY8Cb9qjwNeZ2pnrpJznx25+twjKt6tA2OdGAuBho6NHG3iLodw4x1i9MzoFVnyU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3766.namprd11.prod.outlook.com (2603:10b6:a03:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 12:45:09 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:45:09 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-pychromecast: Upgrade 7.2.0 -> 7.2.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200824145004.12568-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <cca2c3a6-a9d9-0ed1-05a3-631b87c61e24@windriver.com>
Date: Tue, 25 Aug 2020 08:45:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200824145004.12568-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0092.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::31) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0092.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 12:45:08 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18572edd-cea0-4589-fc74-08d848f4b351
X-MS-TrafficTypeDiagnostic: BYAPR11MB3766:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3766EFE74D8BCBF30C9BC9AA9F570@BYAPR11MB3766.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:198;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7S6C7KbhhZjuIpnWW2F9IZJnVxkuBGh1DxEiUfpGxzKKjsAuSJD5m9z9w+13Wjnba32QDEMuHgRVFWxT+BQZaUkGgdITYiu2grMJbbCUy1i6pexNgc2UhZWxVCnx9OwuuHG3d5cE1u5rJXwUgOUkcvTWyrJWTdUQi31unclgUkDs6dWaSJ3D48NHfMu1fvpaLC/6aQOhuZREsdMh61X2nqXL3w+GI7eGdlFytGOD7eELrzk2n9AXMFcqoZ7oI9bpu8isYoctrFqFdWsscPvuvIXR+93vIL3xw1WidWAWIZeWgFpizsionZhkWUVu8Q2nUnymd57wWmJ1Dyg9ETEPB+e/u/EJ2ZozF3ZQd4TQ9yJV1l2DdyQM3G9VqJuYt5HQrAEwzyiNkUFDboGBVQnxqf37qmITcHvLMYURp3S+HhHnROe9OhX+cgH4VbnGj+aB8ismqNo4EQn8b5OuVmZb9Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39850400004)(136003)(396003)(2616005)(8676002)(5660300002)(6666004)(26005)(956004)(44832011)(86362001)(53546011)(316002)(33964004)(186003)(6486002)(52116002)(16576012)(31686004)(478600001)(966005)(83380400001)(166002)(31696002)(36756003)(8936002)(66946007)(2906002)(66556008)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	eveB6XxOKUTdhwd1PgohhwB4gpWz7OzDP0C7QJQeLee7fXquiNBsFB2oiTDsri1kWUL9JQTOWWFd+K4MDFoPAqA02s/I5jeAtjTHS3CXglwqo0wmqKcZWNSh9tJC+7dBKjhpGOC3dcCyoU7UK4rAT8xG0ZOkxE71li5/LE+lbbd3a/a7CU3INb4TwKgfqc2AmnfGMJSFcGsakS/mr6zM8Pt6OJ28YMjRxovSWVSelpC1ryrMFXoKF+ssDwdgKaMtOz3tR8MNEokytlwT9lLjDXYpk7fkfRXuDOC5d+EWDJoRzMZ0G3Iu/PTdf03QZu+6rTa9Cp5z337+fqRnkx6FA24ARtcVQpDo3EmKEck9T96lz1fHHoy/5Vgxt0VLzU+kn/8T1FdPaE988xIi/kmiEpyxb1u9KdaV/VdI0EHIicRenVUYTDGmu7lAO42Gjg1UblIg5fV9UbwyHVGvS7NgLvYHrcXgWialEV/j9aky3VAcS2RuG/X/PLEGjocwe3HF39XA5KykEK7T/HxAoK8hAQev3OI/1EuwvrZNUS5JBFdm5YOOd+E0k8bEIX4kJt6zqt8q5GeKs9Rh3v0wJAXXKCsANMnZgsnJb0xEgRUa9jo1vL8DZFDdYLC0iOE+QVsiUXKONWoLYHAvobWApcXoxg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18572edd-cea0-4589-fc74-08d848f4b351
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:45:09.7835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VaN3qxJFBUD/k8pgu0HxjY2wWibSAbsE9bvNR/gJHieeIntoCqt8vAfrBqymgGURJg+aJvMM9DMSi9z1IxAtyoTHTO3soHQJGOHXfyF7I3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3766
Content-Type: multipart/alternative;
 boundary="------------D339E31B9DD47893760618EE"
Content-Language: en-US

--------------D339E31B9DD47893760618EE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/24/20 10:49 AM, Leon Anavi wrote:
> Upgrade to release 7.2.1:
>
> - Ensure data parsed as JSON is a dict
> - Add zeroconf debug option to example scripts
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...n3-pychromecast_7.2.0.bb => python3-pychromecast_7.2.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pychromecast_7.2.0.bb => python3-pychromecast_7.2.1.bb} (66%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb
> similarity index 66%
> rename from meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb
> rename to meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb
> index 257778ba9..6a3b16c38 100644
> --- a/meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
>   
> -SRC_URI[md5sum] = "20ed7ec024fd4739446d42f8d19813b8"
> -SRC_URI[sha256sum] = "c522c5ecb554471ca8e5690c05530b1c237c301349061d3839c506984f8d3c2d"
> +SRC_URI[md5sum] = "a39b87178f866dda52da494eac0afe07"
> +SRC_URI[sha256sum] = "9aad074d0361791af8ccb8fb7ea0f1646db3d89600fed85c5562b64c8b1aa899"
>   
>   PYPI_PACKAGE = "PyChromecast"
>   
>
> 

--------------D339E31B9DD47893760618EE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/24/20 10:49 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200824145004.12568-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 7.2.1:

- Ensure data parsed as JSON is a dict
- Add zeroconf debug option to example scripts

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200824145004.12568-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...n3-pychromecast_7.2.0.bb =&gt; python3-pychromecast_7.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_7.2.0.bb =&gt; python3-pychromecast_7.2.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb
index 257778ba9..6a3b16c38 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_7.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_7.2.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/balloob/pychromecast">&quot;https://github.com/balloob/pychromecast&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5">&quot;file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5&quot;</a>
 
-SRC_URI[md5sum] = &quot;20ed7ec024fd4739446d42f8d19813b8&quot;
-SRC_URI[sha256sum] = &quot;c522c5ecb554471ca8e5690c05530b1c237c301349061d3839c506984f8d3c2d&quot;
+SRC_URI[md5sum] = &quot;a39b87178f866dda52da494eac0afe07&quot;
+SRC_URI[sha256sum] = &quot;9aad074d0361791af8ccb8fb7ea0f1646db3d89600fed85c5562b64c8b1aa899&quot;
 
 PYPI_PACKAGE = &quot;PyChromecast&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------D339E31B9DD47893760618EE--
