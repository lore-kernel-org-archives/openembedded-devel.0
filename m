Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.62])
 by mx.groups.io with SMTP id smtpd.web12.35898.1611578587404143540
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 04:43:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=e4fhsffb;
 spf=pass (domain: windriver.com, ip: 40.107.94.62, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NW/B0SH2urniNao0nUbssFheWaWmOqS0kwWB7DztV8R169B1CGPr3zY7zyfVYjq0FJzMJCJfi7TqHZ2/HYQYfGnCXhzzA2/XaPnFnoQnbHYTG8A4nZNs3xod6DfHwFmZhrPHNHkOHkYXxPaZ+6Yn3mpR5rvurBpkgSTUwSQL0sjRuLA9rBtm/naPMZPUhCjPNIn7qINkYW8toRuPC+yZZS71gC9abwGVmHAu6fpdNwSJbv0UsywLSB5+RomWumLoFQXdwU644IUQ3n4UKxOwjE1StzOQ6270ExvX98hEwyFMqJ2CqGXjqltYJD0xAXHRe5KmnSEeJhPnSjCDFpaXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVi6x6qwsfebxgBmA4A9iip8Y3xB+fmXnUVvpTVMPmk=;
 b=Pq3EYSb6Jr7X6lsKmlE0/6G1UaUW/Xos/1ueQHx4Uc47GbKT+aWE2YUjelmQ9XoG3dxWrYZHebWQ5VoKca9JgGB3W0+2bIrOhn6yItFQNoiK2yEqoHVng2exrlq0sJ2DSbusWJ88qMziQmIR2vjAPfpdGwRBuSrV2JFhPfs3fcfz63TqKPisQDd9GKYmDbfIBgd1er7MbMB3sXOCaXlTU7axop0CHzhyW33bnF2yekvrv/UquVI6EU98Wywi3F3vDcZB+2beIP6PTWBqs1CxblK0WhdPOpFrWYaui9U23mx9KB1jA0PsAxE+DNipWUD7zcd+QnXpYSlj/HkUKURAWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVi6x6qwsfebxgBmA4A9iip8Y3xB+fmXnUVvpTVMPmk=;
 b=e4fhsffbwvq7mo/r6fHzIyHmyzA9EyE2fH0dWCXfgARji4p1bUR0sFIHYW8vdZhNCeTPNduEn5IcM0Bz9qbWcbEesuY8cDAChRpuPDt+MJ8Z7O+EAaReaRyNnxM2E/ZnHSzXyDjFN7bgUJTs4m6Xm9CRy83hVuhbBmbkP4EbVlw=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 by MN2PR11MB3647.namprd11.prod.outlook.com (2603:10b6:208:ec::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.17; Mon, 25 Jan
 2021 12:43:06 +0000
Received: from MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44]) by MN2PR11MB3919.namprd11.prod.outlook.com
 ([fe80::5462:9c04:72b3:6c44%7]) with mapi id 15.20.3763.019; Mon, 25 Jan 2021
 12:43:06 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-ujson: Upgrade 4.0.1 -> 4.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210122101126.25982-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <25edb01c-f5d3-a24e-6cc4-781e607076e7@windriver.com>
Date: Mon, 25 Jan 2021 07:43:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210122101126.25982-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN9PR03CA0445.namprd03.prod.outlook.com
 (2603:10b6:408:113::30) To MN2PR11MB3919.namprd11.prod.outlook.com
 (2603:10b6:208:13b::27)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN9PR03CA0445.namprd03.prod.outlook.com (2603:10b6:408:113::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.14 via Frontend Transport; Mon, 25 Jan 2021 12:43:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3960856a-d27a-49bd-f24a-08d8c12ec326
X-MS-TrafficTypeDiagnostic: MN2PR11MB3647:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB3647F51422AA954285C0890E9FBD9@MN2PR11MB3647.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d1N9tOz285z1RF8qc0BKJcYuqIHS+uvZVsgXrsV0xtXt9hHi/18k7e8EKIPEzETb79O1t8UPOV4eY+HVgfEFQz7HThyyht+Debe3g0wwzzOJfh5K8agBC8YO8q2+pDZPL2u7sKmLeUNus9ogVJEp8vAqGTlz+ZtUmrWwWYFt9epSR8KS3akpSlV+IOQ64M2UnuncpdlfKEahs4uW1m/W9YWigfq2WoXdYfI3IEN7IwNBs8MR/q9G9OWsMWsR0/yZ09p0ocKy3tf6KNYbhtUlZ9mcykw6En3AxIobi/b9SnhWpRtxHO1PpxjmVSPr5OX0psABcVuG6aKWWJAFebtwfD7VpcfyoEemEvlY+b1LoF3RQoO1SO6kPx1eo7nDUlTWgqAp6sww/SUeCSUsuGoeTh9nPFWojpVjLHp8poWFENiaMq571qI4CZSw0ACSPB6o2FXYSPlJXEKtNu59ZO3gXV6sNFnUSzU6TsVXHIoBn38aQRumvIcXfTzw3y+bgQ2rVPi7v8th7wDaKlmqNPzNnzuoN1HbkepVFldOVV1rA3f7fBsmPhsXmV6+TG/BVqxR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB3919.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(346002)(136003)(366004)(66946007)(8936002)(5660300002)(44832011)(86362001)(31686004)(956004)(166002)(186003)(966005)(66476007)(66556008)(36756003)(478600001)(26005)(52116002)(16526019)(16576012)(2906002)(316002)(83380400001)(2616005)(31696002)(53546011)(33964004)(6486002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?T1YwS1lOQlROTkNKTzFnSWVoS2VqSmNPdjJOdGRKdVVDeW1NT2E2aE9sOStX?=
 =?utf-8?B?YzZjTGxWMlNtL0x0Q2RxMUJoc3FrcThoZHZoMTQ1T2w1Z01lb2huK1dPQzdo?=
 =?utf-8?B?MTArdWpPZ2tyeVcrY0FqU0FBRmN3aHJzQmhGa1UySGloTEpsUXdBamR2RGhj?=
 =?utf-8?B?MFdKYjdqUmFoNmo4bUUrSVJiUlF0V3RnQkt5M0UzSWNaSDNZL0l6bGc4TFN1?=
 =?utf-8?B?ZDM0UXJPcU11UTVybHFLU1pHb2RlZXAxclVtd21Sb0lXTXNQTGM2NkFmNU1F?=
 =?utf-8?B?SG5OOU4rVVpDL1h4VzZZV2VYc3FhVGJnOEhnUndFOUF2WDMvRWVtaVFVT2Jk?=
 =?utf-8?B?dmlpU3ZHR3hxVExmK2x3OFVhbUw1YUE0aDdsMC91QnE0QWpWUG8zaEZSVmJy?=
 =?utf-8?B?aWZpSnBmM1RGTHhYaS8vbW1icjVvV2FyWlVkcVVZZEQ5MUhjdWQ2c3hsNDNP?=
 =?utf-8?B?TTBXRnM2MXlQOEkzUms2ZGpnd1ppTWhLNWNuanJVa2plL0EyMTk2U3poRzRu?=
 =?utf-8?B?Wm42T3FnMDR3YU5OeFhPMVQvazNVaVhMYVhRK3dVMzFHbmovM3dnZWFjWk5v?=
 =?utf-8?B?dlRjQ2dneXdzNW9odXhGOXg5dFFZaW4rbUdOTFNDd241ODNyVlIrRm9ndXdv?=
 =?utf-8?B?dTFaMkxzMzBXdElRTUYrdi9JU3dHMXYrU2lRRFlPZUdyUnhQWlZPcTJSWEFx?=
 =?utf-8?B?Q0Y0NlFPcnhBWjF6OXJjR1I3dkRKV2VKWk5EUlFGS1JWWVl1Z1ZpNzVTYTFN?=
 =?utf-8?B?VnpFU3ZoN20yVE5qNkpvb1pIOGZ3RXoxcGYzUk1IYVF4VGRuYlJCRXczTDhR?=
 =?utf-8?B?d2RMSGZ1S0JIeVdCMHdMM1BiVzZkbmJQZkthRFhQbVFvNVdBSXdOeXB3OUlx?=
 =?utf-8?B?RW1sQU40ZExPanhsSngwa0h5WjFXMmRTTFoyUWtiOXV2eFNzM2VXeDYwVTNT?=
 =?utf-8?B?YmNxdWpPSGc2TVh0a1pmSVhLY3ZYcytnM2JUcFBVWUdiQWY5WHdrMEFnc00r?=
 =?utf-8?B?SFp2OTczZmxrTlRVWkNCaFlBenB1cHoxcXNLaHhNUVpPUGNKT3BUakdaUWpP?=
 =?utf-8?B?V3NxSjQ3NkR2bHJ3VERMdDBIVVdvazRXOGJuWUM1Q05na0RzbC9hZE5xWW9a?=
 =?utf-8?B?bU9rTEl2TWladW90aTYramJGVDZmbXQxcEZMV2E4OG9rZzJyY21Mek1aQ0Zs?=
 =?utf-8?B?M0NXbWwvcjdaejhQZmNraWI4THBBZzhtWS9tL2JMSUpvdHpjUGF6STRvTENV?=
 =?utf-8?B?UVJOYjRRRjdKZXd5elJjTUEzMzZxdWIxUFF0aGZNeHpEaTYySUhaYVkwTWtR?=
 =?utf-8?Q?OSwtoQ2ZDsB1Su0jUXfVL9lij3LrMU6m3u?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3960856a-d27a-49bd-f24a-08d8c12ec326
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB3919.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 12:43:06.1080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/hrwVYsrlHtCBCk2wjaVPEVjYl7SQSp6EWTIFzGAywMXTPP4w3b3vfc6pILuDytudgD8p+nPi5G87LDWzbcJZmtyqLR3lR7hHon8TtL7k4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3647
Content-Type: multipart/alternative;
 boundary="------------B79D6DEC53F5055388B16F8A"
Content-Language: en-US

--------------B79D6DEC53F5055388B16F8A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-01-22 5:11 a.m., Leon Anavi wrote:
> - Travis CI: Test on 3.9 final, remove 3.8
> - Toward matching Python standard library output for float
> - Fix errors on reading long decimal floats
> - Make empty dict/list indented serialization match stdlib json
> - Fix dealing with None types
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-ujson_4.0.1.bb => python3-ujson_4.0.2.bb}  | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-ujson_4.0.1.bb => python3-ujson_4.0.2.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb b/meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb
> rename to meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb
> index 2475306f9..d79206fe6 100644
> --- a/meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb
> @@ -4,8 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe"
>   
> -SRC_URI[md5sum] = "c8030a62912c3be18ff99fa5b25258b8"
> -SRC_URI[sha256sum] = "26cf6241b36ff5ce4539ae687b6b02673109c5e3efc96148806a7873eaa229d3"
> +SRC_URI[sha256sum] = "c615a9e9e378a7383b756b7e7a73c38b22aeb8967a8bfbffd4741f7ffd043c4d"
>   
>   inherit pypi ptest setuptools3
>   
>
> 
>

--------------B79D6DEC53F5055388B16F8A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-01-22 5:11 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210122101126.25982-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Travis CI: Test on 3.9 final, remove 3.8
- Toward matching Python standard library output for float
- Fix errors on reading long decimal floats
- Make empty dict/list indented serialization match stdlib json
- Fix dealing with None types

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210122101126.25982-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-ujson_4.0.1.bb =&gt; python3-ujson_4.0.2.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_4.0.1.bb =&gt; python3-ujson_4.0.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb b/meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb
index 2475306f9..d79206fe6 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_4.0.2.bb
@@ -4,8 +4,7 @@ DESCRIPTION = &quot;UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = &quot;BSD-3-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe">&quot;file://PKG-INFO;beginline=8;endline=8;md5=10fa10456417c0252bcb8a498e498ffe&quot;</a>
 
-SRC_URI[md5sum] = &quot;c8030a62912c3be18ff99fa5b25258b8&quot;
-SRC_URI[sha256sum] = &quot;26cf6241b36ff5ce4539ae687b6b02673109c5e3efc96148806a7873eaa229d3&quot;
+SRC_URI[sha256sum] = &quot;c615a9e9e378a7383b756b7e7a73c38b22aeb8967a8bfbffd4741f7ffd043c4d&quot;
 
 inherit pypi ptest setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------B79D6DEC53F5055388B16F8A--
