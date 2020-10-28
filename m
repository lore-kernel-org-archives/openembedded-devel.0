Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.70])
 by mx.groups.io with SMTP id smtpd.web12.10622.1603898531040926083
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Og3ekccR;
 spf=pass (domain: windriver.com, ip: 40.107.94.70, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bk8wnxFThl+6LgbApOr34QJaC5hwk+vTOrP6Fi3tbHugryjSGbXdm7xFCYL/g2Sls2hi2TyQxmWKoWzDrtlhp6h5Z0PjhbtFvq4XJ0L4TlJWGGjUK6WPER46Vtrzp2BM+t7WQdi1O8iyafmMSPcYV6RHIablRRejSwoJNp2nHN//g+ZwWjjzDg2NFVnJW+TowPsg8l+emnUPfA0GChla9LWw+zgMUqY0yIZ3jbtg9tn7DNSHddvSYsgcsrDcKOiL8Ttj20NeDVG1P+E3Yy7F+bzyUhf4XpqyAAJjvRbcUyPzxePyqLsVsiAMPVxdDBxQqV6SUD9NtlP3FL1Adlt1ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wa+2H1Tbp95MXZGJKpqHBUzH3yqHfm+0R3dV3mvUKsY=;
 b=abulutlzlA8uGvifdTf3cflfXmd4l0cxN4WVS1ftSqAO0RQYcmKdQy1i2frNIYi2OlmExBIjhO0qEoJ9RE8YNzoGd4NvnWLhBF6VOtEbvYxJKSRobQEGUjke3T9WOwBPvVvbfz+fAHqyYgJBEausLYNGfBQ0fe6vobLe/f+r/an6G2jCo+HaI+fRVyOrptcV4KyNvRyvYZO/MrnS9LrVdTEh85XhkmLatXPLUSltuo91Bz1o8bZAlY6qDCuQcRfoVdYUO4brOwb3Vabs13/m4caYX7jf+4sAFDpCQ1DXhs7SAeHj9PAMb7L3Jqez9cM7QvvSO8pC1S1QoKdR2q8ROQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wa+2H1Tbp95MXZGJKpqHBUzH3yqHfm+0R3dV3mvUKsY=;
 b=Og3ekccRyFEhSdBGEM9s831aX76wbDz/e0kOefAs14E8xF+ch4AZbgQM7YP81vIyU5I3vDbpbru/NKF1XxCwNuGKB5L1k82RLkK3/TyePKEWehzl5Im552FRi4atRbsT/1WDrBSQepojXZndikzOmml8Zt3lG5esBwEUjfMmeXQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3189.namprd11.prod.outlook.com (2603:10b6:a03:7c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 15:22:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:22:05 +0000
Subject: Re: [oe] [meta-python][PATCH 4/5] python3-zipp: Upgrade 3.3.1 -> 3.4.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201026090217.21174-1-leon.anavi@konsulko.com>
 <20201026090217.21174-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <9f74651a-3993-6c10-7e39-5a6cef9fb994@windriver.com>
Date: Wed, 28 Oct 2020 11:22:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201026090217.21174-4-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR06CA0070.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::47) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR06CA0070.namprd06.prod.outlook.com (2603:10b6:a03:14b::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Wed, 28 Oct 2020 15:22:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5ed62d4-adde-4b51-a978-08d87b5539ca
X-MS-TrafficTypeDiagnostic: BYAPR11MB3189:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB31895D5ADBFADB1CB6F4F7979F170@BYAPR11MB3189.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:198;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ExquuDMfn91J0IE6njN6N45LT9xT8FBQUKC3AouOtpk/wIj7um0+Jnj9hQ6i22of1ih0rJ0dKvIOC0aLxDD3+ycsjE48Z+ialjwVHQgaE23vyrFliFXxNh7gIZgkF0AoX8DXKgjIbWY6VY5538t81z4dLOKZIo3lLOtgjt46zJTUPFDCI66DmWftyCCn+N73hx4xMmKO8if5NoWqWpvslPsXHteywyUzphvbR/XduLuNBd/XkuKnD9FTSqpR7cDfYsn19SAjT9hK865WHGugeA/c74IdzcrEWm2vqDcui23oWoh1ScmKpB9Kh6dx4p3xFTUXasV6oHcRlLAgwl8GdVG7oohn+asCcOsl7DtBUqQdk4PDt0iCIqg8xzYZj253o66R3FdeWBGZKqizj3F6l7qRi0eEJoFvENwjeaQhzSm1ZZkUTKA3uxKuadhZc/PfUWX1vo11Bvqpsy3rQKojLg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39850400004)(366004)(956004)(33964004)(2906002)(478600001)(316002)(83380400001)(26005)(166002)(6486002)(2616005)(186003)(8676002)(966005)(31686004)(8936002)(16526019)(66556008)(86362001)(66946007)(31696002)(44832011)(16576012)(5660300002)(36756003)(66476007)(52116002)(53546011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	ds7gVmq+qUJyOQ0DCousbxyK81N9Y5rxn+rKleiAU0CpT8grbNxMvctY5zfnG5oACDrPohRtxQoMIfECjsmwHUi+IeN4/PGMMeB+c9LqKk7xFURnBIu5Y1DC4naT2sIuaa0MGczsr+pAJGggFNkBgvsvDv5Cr9A/uTq85+sWCUtHNPkFqMaIEYG6WBGUyTL4zvP3MkACuL61rifp7zvGx8+lzwbp7h5gJlzjNDHpy4HMYVQtKVBLg0R3KoWvat8nsessUvFDLuZOpHTfC7ypoSZcGLLOOf1H9tUbIf5xlTV9bnpR5TNdMo6VAeopJqkJMgnN7hcHmcbV1Zgjen/DsfujIOzXjVA8+QwTXGWlC2gFq/IzXEGjvXwlgZvZlgv0oGPyfbuuulSfso4PJmRjDlA3+t1XrTNaFLWte2Hf0RzBtawYoFswPuSvldGTVA26OzQA8NaH8v6hyJ3o+ujhFZUg2RdEw1zVFNYzE68x65MovXBHqdZlEi1c+5VuPkmWf6uP9bCuKdB9GcCbvh2ld24ErHofYQPPvHyvAemr2O3gwf1q7XI5VhDNW0cRJPrCOT0a7Gi3YYy1LWkKShPiu0GAK8JnfEygBg+ajOYCQeAuwwfTBnmD+Rwfd7NpJ2AnzFZ+v9PjWNhLBfFzwoq0Hw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ed62d4-adde-4b51-a978-08d87b5539ca
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:22:05.3769
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wdnGSrd227ztYEaPL6jflaqBRLAKGJTEaQFk4hbsnyx5fB9b9dszj7vHcEGhXNu+aSO1VJYr4e1TJLV1BaFZD7TEiqAE+j5Vwfu16Vf/5gU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3189
Content-Type: multipart/alternative;
 boundary="------------66909F7FD661009347C4C5AF"
Content-Language: en-US

--------------66909F7FD661009347C4C5AF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/26/20 5:02 AM, Leon Anavi wrote:
> - Path.joinpath now takes arbitrary positional arguments and no
>    longer accepts add as a keyword argument.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-zipp_3.3.1.bb => python3-zipp_3.4.0.bb}   | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-zipp_3.3.1.bb => python3-zipp_3.4.0.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb b/meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb
> rename to meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb
> index 1cb4c2aa88..97523e8e7c 100644
> --- a/meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
>   
> -SRC_URI[md5sum] = "8bc697a6f65b8e2f75bcadfb90e98e58"
> -SRC_URI[sha256sum] = "c1532a8030c32fd52ff6a288d855fe7adef5823ba1d26a29a68fd6314aa72baa"
> +SRC_URI[md5sum] = "ae81f228995578b840d76d1b7d87fede"
> +SRC_URI[sha256sum] = "ed5eee1974372595f9e416cc7bbeeb12335201d8081ca8a0743c954d4446e5cb"
>   
>   DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   
>
> 
>

--------------66909F7FD661009347C4C5AF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/26/20 5:02 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201026090217.21174-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Path.joinpath now takes arbitrary positional arguments and no
  longer accepts add as a keyword argument.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20201026090217.21174-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-zipp_3.3.1.bb =&gt; python3-zipp_3.4.0.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-zipp_3.3.1.bb =&gt; python3-zipp_3.4.0.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb b/meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb
index 1cb4c2aa88..97523e8e7c 100644
--- a/meta-python/recipes-devtools/python/python3-zipp_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zipp_3.4.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/jaraco/zipp">&quot;https://github.com/jaraco/zipp&quot;</a>
 LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6">&quot;file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6&quot;</a>
 
-SRC_URI[md5sum] = &quot;8bc697a6f65b8e2f75bcadfb90e98e58&quot;
-SRC_URI[sha256sum] = &quot;c1532a8030c32fd52ff6a288d855fe7adef5823ba1d26a29a68fd6314aa72baa&quot;
+SRC_URI[md5sum] = &quot;ae81f228995578b840d76d1b7d87fede&quot;
+SRC_URI[sha256sum] = &quot;ed5eee1974372595f9e416cc7bbeeb12335201d8081ca8a0743c954d4446e5cb&quot;
 
 DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------66909F7FD661009347C4C5AF--
