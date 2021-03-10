Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.52])
 by mx.groups.io with SMTP id smtpd.web10.11637.1615394814857485754
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Mar 2021 08:46:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SLOQPdTJ;
 spf=pass (domain: windriver.com, ip: 40.107.236.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+5IxDIXi42FpSunywsYNm8oF6zn5sOnF/zo1nuRsA22SV74HkChGG6BQVaaxq0If+u0mbHm6erEuLbDGXM3q9WCragPZ9ZIZ/aC6SrGeEd5vObGKSMMHj7iEH4Fv4yWG0EtgHVfHAwFXyo/HS0EK6QvJBYHN6/mxT5uvuWDlGxBk/ID4ntIaPcplP6L3p9FsQCFW1FRWYmqXNgnJhTMUSZVWXi6cAb401lsfSQytGAriBpCWAm9H3ZThcKVs9163oBwd3Jq1TrWfIw9emuyXjL4HJOEFk1AH6XGOOx350fNMw2iqmwpPDbqlBIQKvvKfcE7MPlH9RU6AtklxrO27A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXAU3yve7gCfV2Q/gE6GQJu+LsrRgOsETaHePAtu/BE=;
 b=hSaiJ/mFNDiylMfPxzZlOr9H6gg9aV9t5FaV0zteFHkRtZdUrHg4rQbDdEFwtbifqXEw9niJkKvPQ0Chh+hM+wDdC3mLApX0OmJf8fy4DWk6rAYl/3JnNjDiTNQScHlwjjRPg1Z+zbFo84G7qX7tR40LMo0yw7gTvZkwtepx8Ql0ou68+xNSzeEiOm1YCyahAMJM1Qf5SRHGKxQsPBzeKHjdGCEdrwLVycC6StMBeNYBgjmbnl2ZQkcJMSS26sI+0NDTI1V4NHW7XOuuZ9+QOcM5/CaqcWqzoNCCQQP+59iIFh0C5u8+ipSj+K/5nrWnivO6Tsh+uAWRYwnwNp7gcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXAU3yve7gCfV2Q/gE6GQJu+LsrRgOsETaHePAtu/BE=;
 b=SLOQPdTJqCDefGrBiPgVMI74U3fk8igjgVQ26ZbcqU8gyTY0JbGRjZTHMmgEMpFP+xWWr0CwfJoEM0ZGaBGuOUL8GG3trfdKYiRWwFeF56iF3JXL8/6tAYAVAwKulSHZJT8+N1BeOU1LL2BF/YOjyIsruKApD4ulftgoBISDDmo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2680.namprd11.prod.outlook.com (2603:10b6:a02:c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Wed, 10 Mar
 2021 16:46:53 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3912.029; Wed, 10 Mar 2021
 16:46:53 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-pychromecast: Upgrade 8.1.0 -> 9.1.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20210308161810.21582-1-leon.anavi@konsulko.com>
 <20210308161810.21582-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <3be600c1-4a03-c570-2f8e-2860fc34b341@windriver.com>
Date: Wed, 10 Mar 2021 11:46:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210308161810.21582-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BN6PR1701CA0024.namprd17.prod.outlook.com
 (2603:10b6:405:15::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BN6PR1701CA0024.namprd17.prod.outlook.com (2603:10b6:405:15::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Wed, 10 Mar 2021 16:46:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb67b81e-4605-42a9-259a-08d8e3e41bb6
X-MS-TrafficTypeDiagnostic: BYAPR11MB2680:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2680190F4DDA6D692A7344289F919@BYAPR11MB2680.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:121;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ToosV9D3wjnMK22GgWXIHdhnZgN5Kkb8WA9IPAz/83KPgGmnbs6VHtS6Xy+akxXX+LkYwLmF33Hx1u7pztYohZ5uY8lVKD/qhqxgiOzVi+rPeHSYp2NFJ90216gEhVyK4wkqb3mfn9W5iR7rvfCCVL3NokcBOQa2i3rj/sLaU3JIECGBW+sK9nznl2/ni/ljNs0Q0OTz57i/Y+LwNb8vUPcFegDzuAu9LkNRUPMZfg5ecEIC8rRl1Mt5X1Hk+TFG4L/CNULhq7XpndIv44tRDEaBdhuMp5rVbRYrSlkBGMmu16Djg1as7GwzY3B1VergnfzRjXMX14LmRStgWpP/prmxoBA2BIm50xiWtyjX96TOGr9CmjUc5tQlC44UxrvBSg8SBLvHfxyfIe0cIlU57pfh6RIXu19nG4dE3R5Q8NohqGCWEmX1D8r2h6TK7u3sXx1cvFyvXc2Hxrt2E+nnTXJRAP0RJZlEa7rfbkg4ZOqxYHSHXcLi/VVSNf59INZOiSPlOzabrHXZWkA++XBmDjVc/3x1lvVuJlwgO0MsegN3S1n27oTpeU7BmSZaLYwuCC0ck0m01AgkkJJnc1STnMZFAmcsRNZckdrc1qV/u50SuDPT5+YngKaC8ZYZuAKaXBei9BtPy6GrQncO+Zs4R5KRaIJMgYoxsRrxnuiT40K5ZpgQ27nDOoCs8CguY62+
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(376002)(39850400004)(136003)(66556008)(66476007)(966005)(186003)(5660300002)(2906002)(8676002)(166002)(6486002)(8936002)(66946007)(53546011)(33964004)(316002)(16576012)(86362001)(31696002)(16526019)(31686004)(478600001)(83380400001)(956004)(2616005)(36756003)(26005)(44832011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?ak9YbnF1d3ExelNHR0FZSjhMVFoxMFNWdmZJUEpHNDQyY0JsTHJNbE1RNEp2?=
 =?utf-8?B?NTZ1RjJuSVdLSUxrOHdLVURPc0g3QmFxK0JwNHNZSFFEZlRrcWlqUW1vVEpJ?=
 =?utf-8?B?amlRRXo5WGw0NVovMW50M0ZGOHUxWVNuWjZ3UmZyNVlMdGFrK3J6YVkxV2pV?=
 =?utf-8?B?VjF6SjZyQTlWbkl2MDZhWEJ0RSswRXl5ZzJCTzZoMTM2bEJWNmd3L3duN09C?=
 =?utf-8?B?YXhqMnFMcFl4Sm45SVZONGhZeWpnVnlXYlBRYVVUNXcyNjJCQlUxMTdUc09N?=
 =?utf-8?B?SmlHL0VBOGRtTFI1SG01aFh6QW10dlJwUkxGQVdoS2Q5SGMvQ05YaC9kZlA0?=
 =?utf-8?B?dmZ6OXJtZ3o0NGZjZHhRdEQ5M09sOFgvY2VGUUE3eDVPZUlxOElVOTlxU0dn?=
 =?utf-8?B?QitBcGZBbmFlekFLYlo4Wmc3UDRrb256V3J6WjJSMUF2MzZUU2MzamlGakVF?=
 =?utf-8?B?QjFCdlR1Y0NabmZuZDhWTTBhQ0prSGVKTE8yeldXUk5iUUtNWVJ6NXNMVmVP?=
 =?utf-8?B?ZnNxWU53T0x0R0JUL055UFlQU05VcmJTMVF0YTRoYVdTc1RPQklMQ2FzRDV0?=
 =?utf-8?B?Z2pFcGl0VXAyUUZIWk10bWd1OE11d2o3dW8vVUE1cExzWHEyTlZyTUsxNHIr?=
 =?utf-8?B?Yk1KSWtNNW56N0xFNWlydzJKMnBHTHVOZTExQUJlNW5aRzBQZlZJRXJHTWlX?=
 =?utf-8?B?b2xxVitiTHRUZ01LWDl2dGQ5bmJJMWZKUXZjV0RNZzF4YlpFeW16SEkrdCtO?=
 =?utf-8?B?VmxmNUhWQTFMUlQ4TlU5SnY3MFRYaWhuR1Uzai91dW1VeThiTkNyczh3OUw5?=
 =?utf-8?B?MkNsSksyV201SDZidmh4OHVaWUJBYXlxbWpKcHo5UUtkVG1scGRuRzZ4ZVVv?=
 =?utf-8?B?cHZoOXBId1BoZzk0SDJiVUlHVjRUTDhTYlFHdzcyZnVFVzVSTTNlalpJYUVy?=
 =?utf-8?B?MWhkYzhKM1A5Nmlrc0xqWFRKeDRpMFc0dTlTWEwwK1g0eXQ4cmJ2ZFpnRVlx?=
 =?utf-8?B?SlJuRGJqdEZvaCsyMUJWTW5SYTNRbUpQQ2FHRTRpODVPeWttYk11YUtybVA0?=
 =?utf-8?B?TUw1SUFhWW5tbis4V3EyZ3lHaHczQ01oa3NFL21YeE1sZk1WTittNTNCSXNF?=
 =?utf-8?B?S1A2WEdrRGRUSS9rdGNWY1FkaHI1Tk91SlN4QUw4OEQxQURLT1dPN3d6eHZr?=
 =?utf-8?B?T3lPaG5ydTR4NGlJRDlRNkZnTnlHcmNlMlpNYjBGZFltaFB0NkZUeVlLOUh3?=
 =?utf-8?B?VCtQWDNkUFVSY0x3cFRUK01oeVcxd016dkRZQUQ0UUpPYy9nZjFvNEpNQ0Uy?=
 =?utf-8?B?U0NTUHhSZXNlUzNRekhDbE0rUGNmYlYvRXY4dlFYcmZvNE11QjYwM2ZtdEdQ?=
 =?utf-8?B?cnhyRWRaeGdtU001b1dGVVJJZ2o3TW42S2FVQUIyc29FZFdVekJBOEo3UkJr?=
 =?utf-8?B?S1Zid2tmc1pZZXhVZXJhR21DT1VLTTV1ZWdmSndleWRCalpVelYyTUlxK29D?=
 =?utf-8?B?TUlnYUlMUDY2QWNaRzhRVWUyWkxIYzAvRXI3eDRKZmYyWlQ2bWNLL01ycFp1?=
 =?utf-8?B?ZXZ2UWR4Q1NmVU8zdU1HVkR0bnhDMGZsM1lyT3lDeEZFc2ZwOGozaTk2VUxT?=
 =?utf-8?B?RWRKQkE0YlFObFMxNnlKRko0SU9EYWxhOEd5ODRWcGhoaEpLSGZjbnI3VlBS?=
 =?utf-8?B?d3lGVGE5ejZYWmIxSkFuV1kzdzgvK0NCcEdMcml3NW5Md2RnanpOK2prSHNj?=
 =?utf-8?Q?gSaEN/UfNZd1goXwAnU+gcBfop5hGPYmXD+SAiX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb67b81e-4605-42a9-259a-08d8e3e41bb6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2021 16:46:53.1934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DwHddweHNUi8QdlSKJezcqkTP5wvkxppJRabFE0iaEjyn2Q7kxeQgRz3ZZkqOJeXmwLnZ56fC0SoyV13aPibFF9XvIhm5akg0bX//g6soBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2680
Content-Type: multipart/alternative;
 boundary="------------62CE49E5F8C4306764CE6339"
Content-Language: en-US

--------------62CE49E5F8C4306764CE6339
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-03-08 11:18 a.m., Leon Anavi wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Upgrade to release 9.1.1:
>
> - BREAKING CHANGE: Update discovery to support a list of known
>    hosts
> - Add HostBrowser.update_hosts
> - Handle audio groups removed from known host
> - Bump pylint from 2.7.1 to 2.7.2
> - Remove useless pylint and flake8 directives
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...hon3-pychromecast_8.1.0.bb => python3-pychromecast_9.1.1.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pychromecast_8.1.0.bb => python3-pychromecast_9.1.1.bb} (76%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_9.1.1.bb
> similarity index 76%
> rename from meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-pychromecast_9.1.1.bb
> index 7b2b5142e..3d0b84cf0 100644
> --- a/meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pychromecast_9.1.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
>
> -SRC_URI[sha256sum] = "df0295f653cee752de38cf8ef09f13ad9782c53924dfbaa191ca62bd5e1dce14"
> +SRC_URI[sha256sum] = "ab9da1d2ef424b1fc755f6436f545a56056ec6de24075e93f369eac8eb821837"
>
>   PYPI_PACKAGE = "PyChromecast"
>
> --
> 2.17.1
>
>
> 
>

--------------62CE49E5F8C4306764CE6339
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-03-08 11:18 a.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210308161810.21582-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

Upgrade to release 9.1.1:

- BREAKING CHANGE: Update discovery to support a list of known
  hosts
- Add HostBrowser.update_hosts
- Handle audio groups removed from known host
- Bump pylint from 2.7.1 to 2.7.2
- Remove useless pylint and flake8 directives

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20210308161810.21582-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...hon3-pychromecast_8.1.0.bb =&gt; python3-pychromecast_9.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_8.1.0.bb =&gt; python3-pychromecast_9.1.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_9.1.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_9.1.1.bb
index 7b2b5142e..3d0b84cf0 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_8.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_9.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/balloob/pychromecast">&quot;https://github.com/balloob/pychromecast&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5">&quot;file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5&quot;</a>

-SRC_URI[sha256sum] = &quot;df0295f653cee752de38cf8ef09f13ad9782c53924dfbaa191ca62bd5e1dce14&quot;
+SRC_URI[sha256sum] = &quot;ab9da1d2ef424b1fc755f6436f545a56056ec6de24075e93f369eac8eb821837&quot;

 PYPI_PACKAGE = &quot;PyChromecast&quot;

--
2.17.1

</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------62CE49E5F8C4306764CE6339--
