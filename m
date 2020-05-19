Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.42])
 by mx.groups.io with SMTP id smtpd.web10.2469.1589930123175959019
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2020 16:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=i2jlAh8h;
 spf=pass (domain: windriver.com, ip: 40.107.236.42, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4EjSqJwznKWXVgbBVLB0U/DzHKktmH7OnJRFUDRNF2COnIs2XDccYWESrQwr0AoyEvzH0b9G06EVF5GD+66ZGy83YbwiT+7REXKy5MnRTm1ZS38vksOGsVcwVbjISkFoFAAU2uSl+FuspTv0LWQNTttkeQdoQbe0Jnht3WJ7uCL80OaMzl0d5xFYjZ8UVU9pXxpNAAkPYPcFrlJc3OpRCs/QndZWTkmVVZmxKvohg0zn1ULNQNP5T8ICEDqNl+KSfGcY2RJE2f7n1cz9bCkfatibz8PAnLbiCZV+fBFEoQw039fYg7Zl7d1ZSoil44J1NCWSP3YpDWnP+UmniGCPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/XM72WB+mZlWW3u6HsEFUKvGxSut23RF2WdynuFULY=;
 b=edpdEYDUkFwH9uMQqcPpxxTmgRsmyvubot2Ow/+iPAF/MN+hJCrmQRd5+yZ4olBZwIBx0b0iz9G8T/tjrLxLzJNrSN2ypvYwgQ40R7PpSL7tDKXbQKtJgmnY40lKbyRqb83JMAVRmD64/kfr7B+v79rtZIt9AZ4YBz6V2MyMH4GL+eA3/TOhgz9YiLDW5YnPRcx2YnAbzRyKY0+8cYz8Y6woLFol6nrl7Un8qTMy6IK1QyTRIEdT5jWhKV2Yet1yjmuWmFFbfwVPMlSyC1ts3kQq0lzx4xK3HFhaJF9VmlsQbhHmPoiQZB4m5GNU/bOuc6w+OFnEpxqxAlXIsHKcag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o/XM72WB+mZlWW3u6HsEFUKvGxSut23RF2WdynuFULY=;
 b=i2jlAh8hH3FxgYzj5jags6uWtG+4AdWY2+wMOpm994bwQTdLPNktEkVOpot4vJGHdjQ1HaI7WOXlfKgiVtH22jboF64faui0XBYyw+kEjgcqkLe3wNC7JRhxARtOXpp1oknGI/HFg4brQO06YFyVTMYiW7Rta9NavfVFo7Irc2s=
Authentication-Results: konsulko.com; dkim=none (message not signed)
 header.d=none;konsulko.com; dmarc=none action=none header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1809.namprd11.prod.outlook.com (2603:10b6:404:102::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20; Tue, 19 May
 2020 23:15:20 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3000.022; Tue, 19 May 2020
 23:15:20 +0000
Subject: Re: [oe] [meta-python][PATCH] python3-absl: Upgrade to 0.9.0
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200519143031.18358-1-leon.anavi@konsulko.com>
Cc: Leon Anavi <leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <07d7699e-5e3d-758d-82e0-228cefec81f8@windriver.com>
Date: Tue, 19 May 2020 19:15:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200519143031.18358-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::25) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend Transport; Tue, 19 May 2020 23:15:19 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58837d05-7cde-4bec-ddde-08d7fc4a7fc0
X-MS-TrafficTypeDiagnostic: BN6PR11MB1809:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB1809D8C6E182B672ABA52AD09FB90@BN6PR11MB1809.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-Forefront-PRVS: 040866B734
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TCw1pdheHtl5/l1KHflyoO7rI/3paOH+fi8WWPu8Xsyr63clLEitHc88iiicpIFAwnc4Gx5t7ztCBaiWBw+I0ht2zapwLlvpuQa3iot84YPB+dQlpoL6mUAeYFsQWWfjasulzzArToRQC3YfxGDUUNpwpBO13grOdL7eOGs4uSeXg86PygZ/+VH0GJzNB+UIe4pxheTeDJcJD7ZPCY65TeH5R1TBjVdijVvrJeL14LoUTZMmx3XtVzxSOqDtDUZVhrKLHum9g58bjnehAl7uKV0kWVxAQZrwPeXTR6l0RwJ1cS/ZW4B/5s4LiAxLGP5UIpVOTptsaz6Zo2mLU9ZeYXOtTtUmyVH4p8gZHiJbTmECmVgFCzrg/LlPr/ZxM/l1OSUO2VeQn6ORcKmZs92FFa2j7+O+zi+fV+uEu9U/8LP+m/3BUw07NWc9X/a0Ym58+T/EZznL3cm97KPl/U0ybV0s2laPIUFzPIT7Z6er8z6sWcb8Eylb6KKddC/6kUexB8EDig5DtoMYS6Fr4DYx6ekAR9mIiH6tATBQ+GBhbYMVn4GP1irMaS9oyCIqdcOn5e6uBGec2aMQ2Kmh1uQD/g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(26005)(8936002)(966005)(498600001)(31696002)(86362001)(8676002)(6486002)(166002)(36756003)(4326008)(5660300002)(16526019)(53546011)(31686004)(956004)(44832011)(16576012)(2906002)(2616005)(186003)(52116002)(33964004)(66556008)(66476007)(66946007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	d1xdKZrqA9uFJ55NG+4BuQ88+/ak1wU4WKMc/L3qfG0k2eT5WzrqsGe6a7ozyOfSWUYZqP4kj978ui5+WJD0Mik+rMb4NIDBqzM+IZkjRGVNz5sfH2Gj6RpETzgpMtZrHHqDVqngn/XVHssqi5BNzUOwRKx+2XddjjNwBfwu05QPFFrqmxv6voE5qiPsBEajydgZUkP3x4ICWoYdDAYkDTzhuPgLtDsH0Nsqr1IagusOD2Ih/liqkCoO01P57JDGBGtyg2+yAZTi0NY3tbBViJ4bqoGxgItMXHxxWGCke0R2CU48Z36zECgXMiFowAlHCGbjbHenbFryufSfCebaVUz5dKmIliyaEaYr+hvlxHRV/SQ5KjEmUAlDzmOviSXUWLclZfiWKF37RcoVOpgG7wodK3p7iWWGW7IdZfUCSkVhFN+IlgN4bD4J4WHouc/FqbPu2dIIywL4F7p4ygcTuGJvcRLRkts8EjDdP3iu/hi08M0L3KkihOhwxq8OFwm0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58837d05-7cde-4bec-ddde-08d7fc4a7fc0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2020 23:15:19.9199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZZ6SV/4PZPik+Q78CaFaIeKDriVALZGvJWqAs71Hzb4WZogp88FyIQgl8BHeTI5iwGS5+XC1/7eWhcksIoeoXxv53XU07+OIJgWULy2mNUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1809
Content-Type: multipart/alternative;
 boundary="------------B7970CAA1FD70405689F4FD8"
Content-Language: en-US

--------------B7970CAA1FD70405689F4FD8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/19/20 10:30 AM, Leon Anavi wrote:
> Upgrade to release 0.9.0.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-absl_0.7.0.bb => python3-absl_0.9.0.bb}     | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-absl_0.7.0.bb => python3-absl_0.9.0.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-absl_0.7.0.bb b/meta-python/recipes-devtools/python/python3-absl_0.9.0.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-absl_0.7.0.bb
> rename to meta-python/recipes-devtools/python/python3-absl_0.9.0.bb
> index c65a6d7da..a8f47ba4c 100644
> --- a/meta-python/recipes-devtools/python/python3-absl_0.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-absl_0.9.0.bb
> @@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>   
>   SRC_URI = "git://github.com/abseil/abseil-py.git"
> -SRCREV ?= "e3ce504183c57fc4eca52fe84732c11cda99d131"
> +SRCREV ?= "06edd9c20592cec39178b94240b5e86f32e19768"
>   
>   inherit setuptools3
>   
>
> 

--------------B7970CAA1FD70405689F4FD8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/19/20 10:30 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200519143031.18358-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.9.0.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200519143031.18358-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-absl_0.7.0.bb =&gt; python3-absl_0.9.0.bb}     | 2 &#43;-
 1 file changed, 1 insertion(&#43;), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-absl_0.7.0.bb =&gt; python3-absl_0.9.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-absl_0.7.0.bb b/meta-python/recipes-devtools/python/python3-absl_0.9.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-absl_0.7.0.bb
rename to meta-python/recipes-devtools/python/python3-absl_0.9.0.bb
index c65a6d7da..a8f47ba4c 100644
--- a/meta-python/recipes-devtools/python/python3-absl_0.7.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-absl_0.9.0.bb
@@ -5,7 &#43;5,7 @@ LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57">&quot;file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57&quot;</a>
 
 SRC_URI = &quot;git://github.com/abseil/abseil-py.git&quot;
-SRCREV ?= &quot;e3ce504183c57fc4eca52fe84732c11cda99d131&quot;
&#43;SRCREV ?= &quot;06edd9c20592cec39178b94240b5e86f32e19768&quot;
 
 inherit setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------B7970CAA1FD70405689F4FD8--
