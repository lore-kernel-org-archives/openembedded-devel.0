Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.59])
 by mx.groups.io with SMTP id smtpd.web10.15065.1609774390824769275
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jan 2021 07:33:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=KMsNOk33;
 spf=pass (domain: windriver.com, ip: 40.107.94.59, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxKQLF03vUmvQEdgiaChEkxfkBO7zW4x2irodtAYHYW6kkUarq+GV4Fu+yZkIZrNFiNuGh4Du87SENgxJWtzTOgDvVxPCTLZCbrxypyWqNY+Q7h9b/aoLcGNA6zIyg1G6Ix7dKZrrGK6B2SJ8ExuVJMUa+MlpuKJ5Wt5HeF+LXRGYOJxtQDzGRXAS9RQ0xzmV57ibrC5PGTu1intD94AOv188EMbrduXX66weJceUXRIeL0G+bBC+osrJkw0u/lxnMkTW0whRDHWWgOOi6yT7XphyRAmEzn9ysh1eBAfYTUWQHi/sUZubENLr2uCw7s4YLWkBggsZ9+r37rtNf2kwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsYkeW7/B53OgUHY/RltdjDYpGy35B0YV75LcZahcXE=;
 b=Pdg/5LUPQfRVOlHKYriwwR1w++pzpoyMu64d1o9mRn/Nkp3EEBf9FgYqYF0quYibvNg9wOnVoEB48ODi8nuILcWJtMuK+ux++7Y701z4FuUiunccOGkLTCl1EfNcOkpdvq0rvpH4s31BzF44mrEZFrWmbBFaN1H6xmhxOxSCimIt34yhFhxHjh8dMLnZ1PHYf6SfeAu5/aHLyM1dtWAR31p90vBiVPW22LKMEoboMRGnsfnhFqA0Y+RZh+17rBQAooi5GlQ8mt7aOEFgL3T3mdct++BP0KJws3kO+Mg4XL9hERr3d6yFpRJXWs5tZXZAU2uxb7txLVK8o2jF2RuZMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsYkeW7/B53OgUHY/RltdjDYpGy35B0YV75LcZahcXE=;
 b=KMsNOk33rYhfJyy7eIwg3SpkXJEvkaW5gdUFW3ytmTXsLU1xW9bIjzYPIcdhXwthYLvWTl5z1jxQOiO+u94wiWyLcFWLFByGXGYfNZGR5wAziTYR8XbPE/wZ6c0kZ0n+KKMyk50gea3QLNZDv7h+LsoBg1Tvifui6xB3g1aqVoQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5053.namprd11.prod.outlook.com (2603:10b6:a03:2af::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Mon, 4 Jan
 2021 15:33:10 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::6806:275a:a0b:55f6%7]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 15:33:10 +0000
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-gmqtt: Upgrade 0.6.8 -> 0.6.9
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201222215727.25166-1-leon.anavi@konsulko.com>
 <20201222215727.25166-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <159364d9-bb79-68a4-fcbd-14c928a37faf@windriver.com>
Date: Mon, 4 Jan 2021 10:33:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20201222215727.25166-2-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BL1PR13CA0341.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::16) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BL1PR13CA0341.namprd13.prod.outlook.com (2603:10b6:208:2c6::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.4 via Frontend Transport; Mon, 4 Jan 2021 15:33:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a1456809-1314-499f-977c-08d8b0c60aa4
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5053:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB505339360C5E7A43A99BBD379FD20@SJ0PR11MB5053.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UJRm+YWfsiWcSGx1KT00EQZ8w+14yXsb/6nmrIUSwnq0Wm1m1QjYvmHi+JXmASkDIlS2XkktsKhcqnDArBDTrz74WEr82JTQMHhcIQYNaO0r6dD79pWB9cVJcBfx0/Bj83Gb1jc0b3HCWImVQtESQ2R1IfpG21BLlXHKCy/eCCBo2AG8GhFLmPzGQ5o+jV/v0MrzDb9m8gXBO2+zg+TrgjWV4NRMUD+JhxkOvFKg7z5s+qaAD3NwuET9wVsJeELoYcoFJNx41HpTw6EPM9IsFBo1d0Kh1UP7tImeZ/nkvZVmxelmsH99zg0uMlEDaUI7RSiitXDRfu3xBmftmdJFYMXUfBFpwUvFtcuhTYzYiDZc5lVweYlYlGL/K4hFS8IIBUxZvgrtfIzjfHAq8igs/jl7t6LYw1eohSOzz1JSP6ijrM3lAi+ZVmnX2VA/OgKk4DZVYgDloTzx+bBOUMZGABZTpn10EXcRz6OQUU0qRTYKvtx7y8r/j3gdlEIDNE6o8vyzuzFLqoKbGMFweiFIkbYB/pCDWaGlGgE38Hq5pDnhdtO7Kr3pt8wPje0I0IoE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(136003)(376002)(396003)(66556008)(52116002)(2616005)(478600001)(53546011)(166002)(66946007)(36756003)(966005)(66476007)(26005)(31696002)(6486002)(4001150100001)(16526019)(2906002)(956004)(186003)(5660300002)(86362001)(8676002)(33964004)(83380400001)(44832011)(16576012)(8936002)(31686004)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NW9LM0ZLQ2ZEaERHeE13MVE2SlhSNHg3ZjJmTG1TUTJCRmFlTmpVMjJIVmxo?=
 =?utf-8?B?UGdNVlV4bU9DVTlVdDhpVHloa2VEMDJSNkE5d1Z0cEVnODNJYUYzV3RKMkZi?=
 =?utf-8?B?Rzk0YWZPN0x2cU9FbTJkdklpNEF1cEZuaUZDOHVleHhrTkkrMW8wNHVBMTRy?=
 =?utf-8?B?VVFXZXNNOGFyaitEeXJrdCtmSmhjNGtkcXlORG40eEJKYnM2SnhGcTVBVmlP?=
 =?utf-8?B?d0RpSkRGbSs3cjkwT2g4Z3RFRi9taU5mNmEwRW9jNERHZXI5VFJjb1BmRGdM?=
 =?utf-8?B?V1JqbndLSVFJVHpnTDE5bzU3UmJYNXl1ejRHQXhrY0FzVThpODVYREFhSFo4?=
 =?utf-8?B?OTR2ZzNXVk0zSnVONEJ2aVJtT21TTGtvaVFyK1ZNbmFTcktHNkVkSlFmUG9D?=
 =?utf-8?B?cUVjUmtHaUthZDB1Tk9oYTNNS3cwYlhKQ0xSQk5nSWJ5d2dMUjZsNHlhcWZq?=
 =?utf-8?B?TkU0Q3R3TnV3Q09vZkJRcXNCS2dHbnhzbDk3K2NkYjVrK0hNaXNkelREc3RG?=
 =?utf-8?B?YXMyK2Q5K1B0UCt0OGE1MHE4NWJjcjNVSEZCOWZGRTJUeFdWeHM2RjN4a0RY?=
 =?utf-8?B?ZXcvQVhBNXZESWhsSTA1MU9RcGFZeHJmYXhZeG1VRE1yTmg2NnNGNWM4TGZu?=
 =?utf-8?B?bGErYXNyQUxhd01EaUt5eWMzeGE0UWVjd21VRFZjMzBkTXpIL0JkSmZCQXRw?=
 =?utf-8?B?a2hpZlN1SjE4L3RhcGJyZjYvN0FvQmxpRmJqMFpQS24zUVQ1STl2NG1vRTEy?=
 =?utf-8?B?Mk1IVisxck04SEw3ZWdFOXl2ZXpMbExOaTF6dXJCRThEeFh5aE03aE1zSzdp?=
 =?utf-8?B?MmQrYUdMRFFkK29jcFU4ZmhSWnIzVm9LcWRLVWpqNUlIVFVYKzdtRmVsR1lh?=
 =?utf-8?B?L2Z0MnBSZjEyb2R3czhzaVBBQy9vOHczSDNFWGVSRnFNNWZidlJiN21idDd3?=
 =?utf-8?B?Zmxld3UxY0J3VEE5ZXFLT0V0dWo5dFRKUjhOTjZHU0JWei95TnNNelhSL2Jy?=
 =?utf-8?B?bGNTZTRKdmVRWnNSaGV1NjJxY244Z1U5SzlnTnN1SUtYUzJWenJRZ1JzZisr?=
 =?utf-8?B?Z1hOaXJ6WTVFcXVSMmFkTkxzOTBVY1h2enFpZHUzU0p1MUNJS3hJMUtoTnRT?=
 =?utf-8?B?dk5tLzZXT01pWnhiKzAzSXREMW9EdXAvSW9VQkNHeVhPbWoyYUNZWHZrYXFt?=
 =?utf-8?B?b1NEU0FhNWxQZ3MzakJHaTRFcFRrcXZ5VmwralBNUi84N1lINW9FdHMzemxk?=
 =?utf-8?B?NHMwUDlyS2MwdDFvM3laVm1LQ0lhbG5zQ1EzRE9ycnd4QkxKRTJCK25pNjZs?=
 =?utf-8?Q?M7ItdP0bXi9Y7Te0SDlz3iP8xqrVhWB1yD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2021 15:33:10.0088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: a1456809-1314-499f-977c-08d8b0c60aa4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsZ4vvzGWvRjlHUs+PQvkIGlnkIMOVDK9MSy1BHC+SLYqaQUF0yzagLXwEIS4g0q/Gk+wt1pdxyvmu9fAlRmygjOBbWGUqXu219Vc81wOVI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5053
Content-Type: multipart/alternative;
 boundary="------------3394FD9B500D4EEADCB7F22F"
Content-Language: en-US

--------------3394FD9B500D4EEADCB7F22F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2020-12-22 4:57 p.m., Leon Anavi wrote:
> - Handle unexpected errors while reconnecting
> - Improve tests: Increased the time for waiting of the message
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-gmqtt_0.6.8.bb => python3-gmqtt_0.6.9.bb}  | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.8.bb => python3-gmqtt_0.6.9.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.9.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
> rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.9.bb
> index 6219d20093..73c0ae0acf 100644
> --- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
> +++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.9.bb
> @@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
>   
> -SRC_URI[md5sum] = "8745f3b576e5247310276f0ef5c32f65"
> -SRC_URI[sha256sum] = "1285c428a5faf4c6aaac1e2ccb876383b4c7e087ef34ff7edb9f549a78cdebf1"
> +SRC_URI[sha256sum] = "0e98a964393834e724c93b5dce9524c9f1255c338c0d972188794f54c6559f04"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------3394FD9B500D4EEADCB7F22F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2020-12-22 4:57 p.m., Leon Anavi
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201222215727.25166-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Handle unexpected errors while reconnecting
- Improve tests: Increased the time for waiting of the message

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201222215727.25166-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-gmqtt_0.6.8.bb =&gt; python3-gmqtt_0.6.9.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.8.bb =&gt; python3-gmqtt_0.6.9.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.9.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.9.bb
index 6219d20093..73c0ae0acf 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.8.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.9.bb
@@ -3,8 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/wialon/gmqtt">&quot;https://github.com/wialon/gmqtt&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=903f1792621a3b35ee546da75d139177">&quot;file://LICENSE;md5=903f1792621a3b35ee546da75d139177&quot;</a>
 
-SRC_URI[md5sum] = &quot;8745f3b576e5247310276f0ef5c32f65&quot;
-SRC_URI[sha256sum] = &quot;1285c428a5faf4c6aaac1e2ccb876383b4c7e087ef34ff7edb9f549a78cdebf1&quot;
+SRC_URI[sha256sum] = &quot;0e98a964393834e724c93b5dce9524c9f1255c338c0d972188794f54c6559f04&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------3394FD9B500D4EEADCB7F22F--
