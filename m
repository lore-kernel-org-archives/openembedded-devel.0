Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.58])
 by mx.groups.io with SMTP id smtpd.web11.36001.1601297826350865948
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 05:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SSXRGKNE;
 spf=pass (domain: windriver.com, ip: 40.107.92.58, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nq8Ie4wnDxd6it2RwlK8lyA/hkS5wUnYJiQTOGFz2rh8REp9+y6bVmombakkn+iPKJjLSuQwYHt9iOSyEP6ouBzUXHSZ+kRJwxTkA21qzVq8Vib2DUDRxcmmbY9ilpDSrzcsXQESatoQwZxHouaaQnTCKa2rNLyAQ27K5JxlED53MaegeA2iH6BEJ96GVhHtPCYHnVI/ICtof7nG/ozxm7yRdHpfE2SnvxBTdg+T4oufpsBZQG/EfN1muVVrp/w+LCb23u4XdYL96wX8A7pEO5hPR0u2CXaIwyVUf8wEoFTN/4VU9YddPj2OJqXWVOWHxpBC6fWXguG/cjSZxggB6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYR4mMXpT5fNSfJ31ATwf0nMwVwMMK9aqnv0gXQenbE=;
 b=cZ+hHQRPQeg6O51ImIh0ZqKcpckpPkIYtp7Cos+H4ZnXI8mXWToPaYErAhmqjLsQuy5pBPH06htkuHajToL2MBUVmO1a9UviL5PbGOaM3qQje2ueF/ygaVvZs/dHMwz6ZlYtC/LCljxAx5OkTjFX3u1oi9es3b+phvVqRM7t5T+rtZd3nVpGpPITdVpCuWMi+HfvH56bo1Hj0ArPti+FGES2KfTfLRQqGzVUHFWxNqdLYHdYhNdMInloH6FKH4MPGJdKofZFHJbUo3R1iMLq3NWQ+1TsqjkZBpacxqJNDMbBVxBBIEbL1Z7ARo2Qj/zOQXbemjYWKmdnZGkgH//UHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYR4mMXpT5fNSfJ31ATwf0nMwVwMMK9aqnv0gXQenbE=;
 b=SSXRGKNEMqUCi2O20mTSukVBOAWXbVg5gjOJQsLolmK7Z9IK3GyIy1vD1PNq2nLCCrZMp5szkP2ZGKHoaEOvUWFQe5glQf7bAob79A/FJE6JITt7SEzy3ZFPBSD+jPCB/8xIVr2NcrW+1xBZZ6eHEf3OMTtIpfXjemwerYnaweE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4435.namprd11.prod.outlook.com (2603:10b6:a03:1ce::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.20; Mon, 28 Sep
 2020 12:57:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3412.028; Mon, 28 Sep 2020
 12:57:05 +0000
Subject: Re: [oe] [meta-python][PATCH 3/4] python3-gevent: Upgrade 20.6.2 -> 20.9.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200925112321.3195-1-leon.anavi@konsulko.com>
 <20200925112321.3195-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <73e3c957-5a5c-d1f4-938e-eb280f57c87a@windriver.com>
Date: Mon, 28 Sep 2020 08:57:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200925112321.3195-3-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: YT1PR01CA0114.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::23) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0114.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend Transport; Mon, 28 Sep 2020 12:57:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6344dd97-121f-4580-1cf5-08d863adffea
X-MS-TrafficTypeDiagnostic: BY5PR11MB4435:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB443530AF024DF98C4589C2C59F350@BY5PR11MB4435.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7GMuTag04sRdFB41UMLUIVtAAtM06VW/aH3o4sgDbTbe96q8Y4W1DQGeiGoEvlz/aIs0nPFaFkOSxqMPVjZvhOoW+wySfUsLrnux6jEd49VmZVJTwiT6dawaF7XjVOvsgrtgJu6W2qVYuWRsq6bPP0gm/2Od2aHY3lTkdpNbSeaxGrNiFRhC/H3LMZKFju9BnXTwlyzCny+v8v0TQh4Xen6vIZsFJnO6pHW6XqbOdUSf5qg1ZlYJqbM8nQad+emd3acPb6aY70Y7LqWkQmutvkRF1Ej+OfDsRx5f4H9zkcgYuUyBu66+DTpjPHY1XVAhvnUqSD3lukMUYPgfSiWaACYlcn3dTIZtMn9OzGudveXa1OjvP0y49jIiLufc6RnGUsQQnYg3a/OlxbZuSKhRKWIXFgPrID4R6Ch9FPyVQEBPU2dvY05AwbOmcphGJiFeLVpZxFI8K4+DKmK/3XTLPtQnOMxafYk0a4HVHxqQF229Tpyeur8inwsLms3rKydA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(39850400004)(136003)(396003)(166002)(86362001)(36756003)(31686004)(956004)(83380400001)(2616005)(16526019)(186003)(6486002)(8936002)(33964004)(8676002)(66476007)(66556008)(66946007)(316002)(16576012)(31696002)(53546011)(26005)(44832011)(2906002)(478600001)(966005)(52116002)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	42nWJPxbJaXK83X7diTZk66qpHcRW45fCix9MJbnBll89j3i7rNb6XW2BpmFGqHRNuBV5t/8DQiLJDNc31YE2g4MDPikzJF9btVY6Nlf2rMmDm+2ecSHKkPYUsWNoYYk0hqLRcHm3SrzIXZuNMYz6pHhNpeaPeaiCtAVP5voX35H7ZpVzBCrqVzVe7rLOi8i2FaFnj4Taxx5nVuWZhUsB1n7q0yoJ3F5hej4SaAuLu6d5XgoE4rXwm1eW001HqwlpGnEI5H7dVlvisZojgCvFhsaDbpMhyDP41jUCzHFbMa8muSsLtaWLsoNO909CW2E0QDE28cR2ud4UaJfsoRxiLmEcrtAlTSm7oDwEInTFZzSZtEviUTfhrtWy04jK4FkfmTRQ6OX+ETA9V4bWPiNzgjqWAKdNdfxC42bEOOkHTHZsvMUOfIt1eRqH7+X3cUoRONLcEcLFTuhUPdYFOudgTNaYd4r4TOoOfDiYzuZpW95Tg4YtbZVRVa/PwlYDiPihLiiGybWYEapQiw8MVF3wslI5U5H0V4w4bgy81mJY7ufUji5wqTXIQorEsUZGI914GxTVE90dS34wDikaB0qjYRt5CbQgRAhOjhYzx81d0IKlTk78cRgPQUpjnZt226sMw9sXmEKO/ozAxvf7fP2Cg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6344dd97-121f-4580-1cf5-08d863adffea
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 12:57:04.8829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgmA8LfH6KtZm9YWvSEJihOBG2Ii5gQUtgFlrpq0lcQvj0xA3eEo9DHr1gjMbDL3nL2LUiS8RGBSOiEAtKD7JHfnAI1Q74vWgu5Y9hFtOkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4435
Content-Type: multipart/alternative;
 boundary="------------47AEDFC8B218E7FCA250655C"
Content-Language: en-US

--------------47AEDFC8B218E7FCA250655C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/25/20 7:23 AM, Leon Anavi wrote:
> Upgrade to release 20.9.0:
>
> - The embedded libev is now asked to detect the availability of
>    clock_gettime and use the realtime and/or monotonic clocks, if
>    they are available. On Linux, this can reduce the number of
>    system calls libev makes. Originally provided by Josh Snyder.
> - On CPython, depend on greenlet >= 0.4.17. This version is binary
>    incompatible with earlier releases on CPython 3.7 and later.
> - On Python 3.7 and above, the module gevent.contextvars is no
>    longer monkey-patched into the standard library. contextvars are
>    now both greenlet and asyncio task local.
> - The DummyThread objects created automatically by certain
>    operations when the standard library threading module is
>    monkey-patched now match the naming convention the standard
>    library uses ("Dummy-12345"). Previously (since gevent 1.2a2)
>    they used "DummyThread-12345".
> - Fix compatibility with dnspython 2.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-gevent_20.6.2.bb => python3-gevent_20.9.0.bb}    | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-gevent_20.6.2.bb => python3-gevent_20.9.0.bb} (89%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb b/meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb
> similarity index 89%
> rename from meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb
> rename to meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb
> index dbeb3a60c1..06c45f2ed9 100644
> --- a/meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb
> @@ -20,8 +20,8 @@ SRC_URI_append = " \
>       file://libev-conf.patch;patch=1;pnum=1 \
>   "
>   
> -SRC_URI[md5sum] = "27b07fe9fdfff2d75e3d140e890489b1"
> -SRC_URI[sha256sum] = "a23c2abf08e851c988723f6a2996d495f513a2c0dc70f9956af03af8debdb5d1"
> +SRC_URI[md5sum] = "9366ee7eebed48003f8a748568ef1f70"
> +SRC_URI[sha256sum] = "5f6d48051d336561ec08995431ee4d265ac723a64bba99cc58c3eb1a4d4f5c8d"
>   
>   # The python-gevent has no autoreconf ability
>   # and the logic for detecting a cross compile is flawed
>
> 
>

--------------47AEDFC8B218E7FCA250655C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/25/20 7:23 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200925112321.3195-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 20.9.0:

- The embedded libev is now asked to detect the availability of
  clock_gettime and use the realtime and/or monotonic clocks, if
  they are available. On Linux, this can reduce the number of
  system calls libev makes. Originally provided by Josh Snyder.
- On CPython, depend on greenlet &gt;= 0.4.17. This version is binary
  incompatible with earlier releases on CPython 3.7 and later.
- On Python 3.7 and above, the module gevent.contextvars is no
  longer monkey-patched into the standard library. contextvars are
  now both greenlet and asyncio task local.
- The DummyThread objects created automatically by certain
  operations when the standard library threading module is
  monkey-patched now match the naming convention the standard
  library uses (&quot;Dummy-12345&quot;). Previously (since gevent 1.2a2)
  they used &quot;DummyThread-12345&quot;.
- Fix compatibility with dnspython 2.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200925112321.3195-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-gevent_20.6.2.bb =&gt; python3-gevent_20.9.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_20.6.2.bb =&gt; python3-gevent_20.9.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb b/meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb
rename to meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb
index dbeb3a60c1..06c45f2ed9 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_20.6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_20.9.0.bb
@@ -20,8 +20,8 @@ SRC_URI_append = &quot; \
     <a class="moz-txt-link-freetext" href="file://libev-conf.patch;patch=1;pnum=1">file://libev-conf.patch;patch=1;pnum=1</a> \
 &quot;
 
-SRC_URI[md5sum] = &quot;27b07fe9fdfff2d75e3d140e890489b1&quot;
-SRC_URI[sha256sum] = &quot;a23c2abf08e851c988723f6a2996d495f513a2c0dc70f9956af03af8debdb5d1&quot;
+SRC_URI[md5sum] = &quot;9366ee7eebed48003f8a748568ef1f70&quot;
+SRC_URI[sha256sum] = &quot;5f6d48051d336561ec08995431ee4d265ac723a64bba99cc58c3eb1a4d4f5c8d&quot;
 
 # The python-gevent has no autoreconf ability
 # and the logic for detecting a cross compile is flawed
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------47AEDFC8B218E7FCA250655C--
