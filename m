Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.65])
 by mx.groups.io with SMTP id smtpd.web11.2865.1591818747913931349
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 12:52:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=QzYH8Uz/;
 spf=pass (domain: windriver.com, ip: 40.107.236.65, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmPs08ISUiiiX7uwodvK6nGZq6wfkzwpsiJoKUOMo12cQpfdYsQCJOb4UXsXbnvxNkWNYqor8Gu+gZ9pdLX26QkQ4yVYcmAVNK1FKJG2W51JDOvWbeaNzs8m8QpNHdHp2ROYk1jtpmhjiUG7tWAfwGSjKWkx7JTSORWoLqs467puC2nXEnv9OdQviIPE6ECG3MKvj/w9aXqDoucr3t3BRsfh6m2xNWTyk556uFOuYvRs2d3k92rW+0280gmkt4r0keOJjDhpKaCxQJNfhnclRM4xRpmvEa9CdRsB79HbEgX8ZYVUtb+wr08PnHdkBEqHb6PvuxbXMJ6ruxlpiR1Y9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmlBVqYZFoLe6khyb6I3BSErcegOlYe+eUbCCcvr3/M=;
 b=DAbKqT4CjCoy/OIV5oJzicefmVLnctALlfui/4jxhld8GC/XxbeZ1mGZlkXBJquxVB4PCO52nD8aTbXuoycBsy4227GDkGoyrd2jaYcMzx1bbaKGuu0qvG3/Cc+BHIV74V105MFAMvG9vose7d7t0TjXxA9sEx5ExLiecuNNuvrHOV/gTfg6NJLSvmlC+Qgco3HeIu+s0h7dJLrbQHkFzYh1qIZB9tOaMA1HlwTAxab5OwvctGXLfeNnRtC6ighN5XB3yy9vuZKkd7w0pNOsPntaORPLYAaEEwh+pkBep9akqajnosUYxUgEIcU+zib4fZ6fI48QEA0uIwS1HxLzmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FmlBVqYZFoLe6khyb6I3BSErcegOlYe+eUbCCcvr3/M=;
 b=QzYH8Uz/HPejF6zPf2zRf7NW52ERXtpT0wmsqAyXR2WgEbr1QO5HVQmAYuQ1xjwGibg+PiGT+X4iDHP82OEcrJCb+ZmG/HXRhtAZZvL8OSYmllvr59L0zgLqiZhigTPRqMZUzXviY0wmu8ljr9rX94HKkdDMW9L9fEJbRGo2P5E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1522.namprd11.prod.outlook.com (2603:10b6:405:b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Wed, 10 Jun
 2020 19:52:26 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 19:52:26 +0000
Subject: Re: [oe] [meta-python][PATCH 5/6] python3-ujson: Upgrade 2.0.3 -> 3.0.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200609111050.32307-1-leon.anavi@konsulko.com>
 <20200609111050.32307-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <53c8a599-d374-daa3-e9f2-74bc7bb48ee7@windriver.com>
Date: Wed, 10 Jun 2020 15:52:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200609111050.32307-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::38) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YTOPR0101CA0061.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend Transport; Wed, 10 Jun 2020 19:52:26 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d729a1b-6c76-4fe6-f6e3-08d80d77cd09
X-MS-TrafficTypeDiagnostic: BN6PR11MB1522:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB15228EC3FC4E4951FB7B4C809F830@BN6PR11MB1522.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0EnBA9Z0Hir+uBaixLzYk88d5fW2ZmQjy2ffyfx/KcP9/+M70XYqVhAsftZhiF6BLFMJ0YQGO4T3iiVRJEEwIwJdGHwjK7cREV9HsTjH6vvtqzwh1h5ttSP0ULfjZ3k3HcnJ+OVp5ynwLU1jf5WQnxl4eikfsDsl2v/3jXNT807RXKaRFDX+4FGV0iLi/PBOzM7AlCOBSB+48vg80tCHYRgJQ2PVyZJbu0MchSUYLlnbbcRypk998BAgVjQubnwvKQUm/zydX9BCtibOpaW6LqWE3KN7GadmHfsiImgwZzJWTBA8F7CL+vdrAn5DO3Mr2URQdO9xx97lGkFR/l6J5Eyr5VeNDeuY/S1qR3Uv84Q6EreFRIxcYDpZRhYf0stX0sffXZcCuHx+DJIvXHokK7+3xEdBQLvERkHglj/Ox9HpJ1honxKrnl5mIT2pDlcz2Vw8YNg2rYUFjx1shtQU6g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(396003)(346002)(376002)(136003)(366004)(956004)(166002)(8676002)(8936002)(2906002)(31686004)(16526019)(16576012)(6486002)(83380400001)(2616005)(186003)(316002)(36756003)(33964004)(5660300002)(66946007)(66556008)(478600001)(966005)(66476007)(31696002)(44832011)(52116002)(86362001)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	3LvUXpykpGVAG8Bg6SZVh/UgS7/WV/pNFP+JXYc6j48c8JnwGC2/Zadc+XR3pv7sAmwp/LJS5cq0UKr1P0E/Ff9Hnrp5WwD1oUA2KnRtBUqb437WsNAPtJ3nI1AuzhfZmx/s4PgPw/9pNPBncjrQr0YGYfTLSlDaqUSPzAj1kzzo1PPXxRZyQCH9R4zvP6kouwSspcbpv4/VRYvOa5Rvcjs3bAgC0i2gCeriNDJqTez8ij/4x27hwdXCjJTaLN+VnjoR8OK6hL8N+Aej0OROkodpEzyHjYUjkH6ULPzdnIk4Tk83obYtBf+ioBKdRyLGFhJRPHJEf0ZKzGeF19v9lujDWd+RoilOFMjX4I5UcKaz8MoQjlKHbU1B8D5vxY62K+tzZPJ0hUC98DLdlbmRd+/OOF3py9cFLkJNWKMMHwwK6ire2koaUSEfZ5DVofNOZ16i+hXXf2Kr+QGjLBZScvtS0VauELEteTf2ts8REItjkm9UQoh3i7exrszoXZRD
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d729a1b-6c76-4fe6-f6e3-08d80d77cd09
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 19:52:26.6705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HRaPe3/JRi7u1eXVx3cx5xGMCjelkaRm8OsN2KAQJ8eOO2l0SVUZNrVrGMN9ALy+xKbWb8NmoLe68F1bGUoE/ZECg9flDHg667wCrhxTl38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1522
Content-Type: multipart/alternative;
 boundary="------------55E8A117F49475FD0BD7DB50"
Content-Language: en-US

--------------55E8A117F49475FD0BD7DB50
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/9/20 7:10 AM, Leon Anavi wrote:
> Upgrade to release 3.0.0.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-ujson_2.0.3.bb => python3-ujson_3.0.0.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ujson_2.0.3.bb => python3-ujson_3.0.0.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb b/meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb
> rename to meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb
> index be3dc8e64..352aedcf9 100644
> --- a/meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb
> @@ -4,8 +4,8 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
>   
> -SRC_URI[md5sum] = "80d288c186dd02579e1561494b45aa41"
> -SRC_URI[sha256sum] = "bd2deffc983827510e5145fb66e4cc0f577480c62fe0b4882139f8f7d27ae9a3"
> +SRC_URI[md5sum] = "1c13a485776a2a0dfa1795d101bb3d57"
> +SRC_URI[sha256sum] = "e0199849d61cc6418f94d52a314c6a27524d65e82174d2a043fb718f73d1520d"
>   
>   inherit pypi ptest setuptools3
>   
>
> 

--------------55E8A117F49475FD0BD7DB50
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/9/20 7:10 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200609111050.32307-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.0.0.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200609111050.32307-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-ujson_2.0.3.bb =&gt; python3-ujson_3.0.0.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_2.0.3.bb =&gt; python3-ujson_3.0.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb b/meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb
index be3dc8e64..352aedcf9 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_2.0.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-ujson_3.0.0.bb
@@ -4,8 &#43;4,8 @@ DESCRIPTION = &quot;UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe">&quot;file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe&quot;</a>
 
-SRC_URI[md5sum] = &quot;80d288c186dd02579e1561494b45aa41&quot;
-SRC_URI[sha256sum] = &quot;bd2deffc983827510e5145fb66e4cc0f577480c62fe0b4882139f8f7d27ae9a3&quot;
&#43;SRC_URI[md5sum] = &quot;1c13a485776a2a0dfa1795d101bb3d57&quot;
&#43;SRC_URI[sha256sum] = &quot;e0199849d61cc6418f94d52a314c6a27524d65e82174d2a043fb718f73d1520d&quot;
 
 inherit pypi ptest setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------55E8A117F49475FD0BD7DB50--
