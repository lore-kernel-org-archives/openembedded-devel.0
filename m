Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.46])
 by mx.groups.io with SMTP id smtpd.web11.5549.1599332524048450475
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 12:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=kUAyNAtL;
 spf=pass (domain: windriver.com, ip: 40.107.102.46, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=StxNkInTe7x9UuCw21nei+vKuYkCe1kGa5/G0yH2ED7uOK6snerX7WPdQlNPTQixzoZ4tnrJXfTUQjzQ/VoDUJDRJtHse5Cab1qv79BHSrwjfUlX/az8KkLLs254QFkDAb0IB3KhHsP9UVKnYqDuzKzW+lpWQg+ANTtutqYe8PHCgmghGrfD25UH8syaTdT2oL70o666gVkuYvn4R4itK8iLB55R3OcN1izBWi+ei23NRL4yWEFmrLcfcPlFd41FrlF+ZgL57+8ZcO/eE/2N1f1j/2ZsHAWB5y4oKE/eKSCuQuyCkOaPizu990VrMx9y6VVNo5MRZMELZBwwMSfg4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9EF0UNpOVH+F3SwbiWpSIWqIKbo/OtbPathwKe5UwM=;
 b=JaY+J4dV3C70Vbo7aWicIfmI3KudgprPOMgA65K9CIy76Xjc9HLgbfpWfqts8s7gHsSq92zLBIpz44BDz/uNAurzb7Z3OYCzCmZTYy2Oe7bpzfVnWbKG16Jc3NuGH+9lOHapc6UgZj4N3/3wX4qy77xR/NPV0nagcHbMTp21CjK6YVUllgG2jFpXHufU9WGoFOrYZY+FOE2umvNh2TzxXmUxdbEIgMZWGlh3dGkjKjX6T5aVQnIULDFG3M9UljdS/ukPDOT9NXAZa8AqJCR8seg1HOBgMB8YuHJ1/6hX1BzNQiChvoZdm/+O+3SrlGqlz6O/5vr2I4vOFMXcBLuegg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9EF0UNpOVH+F3SwbiWpSIWqIKbo/OtbPathwKe5UwM=;
 b=kUAyNAtLJu504W4ep/aa/r8dsRLXLmYfwsW6tqrJDGBeW4iWXBglSVTk2ZBq57hsz8iHXBVpp6Ssgk8/jvSYEUf+aMdEt5K1YoJ9CSK5Z1pZb1KZeZwy0XvRHVSX8E6+txp/uWEccmWf1HicgesbDP0Svji6QmeeAHJ+uTe/ZrE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2952.namprd11.prod.outlook.com (2603:10b6:a03:82::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Sat, 5 Sep
 2020 19:02:01 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3348.015; Sat, 5 Sep 2020
 19:02:01 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-pyzmq: Upgrade 17.1.0 -> 19.0.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200902112808.18547-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <23c6407e-c2ae-b3ad-7f67-c0a880ddd2de@windriver.com>
Date: Sat, 5 Sep 2020 15:01:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200902112808.18547-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::17) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend Transport; Sat, 5 Sep 2020 19:02:01 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 82ce7f6a-0587-453b-48f1-08d851ce2bd0
X-MS-TrafficTypeDiagnostic: BYAPR11MB2952:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB295228470BB84DCF5DCD632C9F2A0@BYAPR11MB2952.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:159;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	a5IRRN5gQ4j92n5gkaS5wVB+J7/FcJSbYL9vGKbJpK6LLbivjTxUWGvXMR4QSXGpZP/PmRuEnkBkBMQ3O5Q9eQ419lNLrimEH7tUhCkwyeHetiGos7WJXuvx2sVZ6ww6ihKYQ7+3POkK6z+eSFBF6ICExiNLJ9DUB4KzhLQcULZ0Wc4q8OQ1Lsvv+wm+tEkGwzryEUBd3B8jH0PumD3KhMdFeIqSRKPrR+YRu65h+H1cAAGin2SFyHq0RJWqtt79IS24W/Il3dk9BRTxsREw/jAcRKZNK0gD3UYSjr/WbhfNog2jP4vLgs79ZLF27/wojhaXnzm3cytNmxy1JcnbiX4WLm+yvQVEwT3F6MmHDvZ1MSY4HbBvXGkIXR2W336WYPnMYKJr7+8MMt8JBs83wSSgV2pnV5iYf8zNBL9xKmRFNv6EUlJ5b3kSolfvRuR8ffpNEWSYrCWl+kgr7yKC/w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(39840400004)(376002)(346002)(396003)(53546011)(66556008)(66946007)(8936002)(16526019)(26005)(186003)(166002)(8676002)(16576012)(83380400001)(316002)(31686004)(36756003)(86362001)(33964004)(31696002)(2616005)(5660300002)(2906002)(966005)(66476007)(44832011)(52116002)(478600001)(956004)(6486002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	bAGiiVkPZRiLDYBCid/FlrOLPrp/9p8tUsTEzK9R8iFgQTJVERC1kOUPoeULVl1VolXE4wepaD0zNY3jKKqB3orjBNzKwDczK76K4o6/j12ORoWH7mhg9/SRRKodSiXvtAyutmFUUdupVaZMgp106KgfdxoMDhjc5/ImLf5DHVQ39sMY4hzPCVX/WNnjHbxpnIAquT2CpRbIMTPDxqA6xMJfrxgiunGEwtAIG3JG4xCfplcdKaxbISIvWwN/RHkaYM4Vtox0D1LeF1xC1VpLR594ZhITyVuGKfFxLPMIlCl8OZxGErvQesHj9mvycTterBqyuWuGiMGjL1SgDvPT0L8wC93fIA2YBcTIKrMKO511BVqPA41T6raMvtzcdprdbq9flPK4YUOfh4+cHEfjtywGaog2lk594iFePazFBPE9BeKabw8MkCud33wxKCO9gc+tvxlJZT0MEacCnNWh6pzDCmU5arOcI319JSGrHCQDXXs/BXeXoWpamWpmSI3GCwS/yHVJQLtz120Ym2JBYTWzYTcc72j+trz3wF97egPM0ddK/ny1HoYBQ0KGowwMy9rRRQmWHvs02B066BtmmfJNS+CW3xR/zXIvWbzKJcZuWd9svAi1/mi9ttOFsNYWzKgfihU9im5cBAYNn+UMvA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ce7f6a-0587-453b-48f1-08d851ce2bd0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2020 19:02:01.5167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6gqWklEq9qkjzLR5ta/EpAG6N7S1teteViA08b7c/HQiMMSPtJlWdwvdlhSFqu3i87d38MssqzwMK3K5+gRG570dzrYbtWVvkuKbFe9FVY8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2952
Content-Type: multipart/alternative;
 boundary="------------CA157DEF1545CC6A82DD0FC8"
Content-Language: en-US

--------------CA157DEF1545CC6A82DD0FC8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/2/20 7:28 AM, Leon Anavi wrote:
> - Cython backend: Build Cython extensions with language level
>    "3str" (requires Cython 0.29)
> - Cython backend: You can now cimport zmq
> - Asyncio: Fix memory leak in Poller
> - Log: Much improved logging in zmq.log (see Asynchronous Logging
>    via PyZMQ)
> - Log: add python -m zmq.log entrypoint
> - Sources generated with Cython 0.29.15
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-pyzmq_17.1.0.bb => python3-pyzmq_19.0.2.bb}      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyzmq_17.1.0.bb => python3-pyzmq_19.0.2.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_17.1.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-pyzmq_17.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb
> index 2369f067e..3c4e32b5e 100644
> --- a/meta-python/recipes-devtools/python/python3-pyzmq_17.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb
> @@ -8,8 +8,8 @@ DEPENDS = "zeromq"
>   FILESEXTRAPATHS_prepend := "${THISDIR}/python-pyzmq:"
>   
>   SRC_URI += "file://club-rpath-out.patch"
> -SRC_URI[md5sum] = "aecdfc328193fbd81f6dc23228319943"
> -SRC_URI[sha256sum] = "2199f753a230e26aec5238b0518b036780708a4c887d4944519681a920b9dee4"
> +SRC_URI[md5sum] = "200abc1a75bdcfff7adf61304f46f55e"
> +SRC_URI[sha256sum] = "296540a065c8c21b26d63e3cea2d1d57902373b16e4256afe46422691903a438"
>   
>   inherit pypi pkgconfig setuptools3
>   
>
> 

--------------CA157DEF1545CC6A82DD0FC8
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/2/20 7:28 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200902112808.18547-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Cython backend: Build Cython extensions with language level
  &quot;3str&quot; (requires Cython 0.29)
- Cython backend: You can now cimport zmq
- Asyncio: Fix memory leak in Poller
- Log: Much improved logging in zmq.log (see Asynchronous Logging
  via PyZMQ)
- Log: add python -m zmq.log entrypoint
- Sources generated with Cython 0.29.15

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200902112808.18547-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-pyzmq_17.1.0.bb =&gt; python3-pyzmq_19.0.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyzmq_17.1.0.bb =&gt; python3-pyzmq_19.0.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyzmq_17.1.0.bb b/meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyzmq_17.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb
index 2369f067e..3c4e32b5e 100644
--- a/meta-python/recipes-devtools/python/python3-pyzmq_17.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyzmq_19.0.2.bb
@@ -8,8 +8,8 @@ DEPENDS = &quot;zeromq&quot;
 FILESEXTRAPATHS_prepend := &quot;${THISDIR}/python-pyzmq:&quot;
 
 SRC_URI += <a class="moz-txt-link-rfc2396E" href="file://club-rpath-out.patch">&quot;file://club-rpath-out.patch&quot;</a>
-SRC_URI[md5sum] = &quot;aecdfc328193fbd81f6dc23228319943&quot;
-SRC_URI[sha256sum] = &quot;2199f753a230e26aec5238b0518b036780708a4c887d4944519681a920b9dee4&quot;
+SRC_URI[md5sum] = &quot;200abc1a75bdcfff7adf61304f46f55e&quot;
+SRC_URI[sha256sum] = &quot;296540a065c8c21b26d63e3cea2d1d57902373b16e4256afe46422691903a438&quot;
 
 inherit pypi pkgconfig setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------CA157DEF1545CC6A82DD0FC8--
