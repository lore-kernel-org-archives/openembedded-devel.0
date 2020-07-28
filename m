Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.82])
 by mx.groups.io with SMTP id smtpd.web12.12420.1595943186436353008
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 06:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=jRiJXY2E;
 spf=pass (domain: windriver.com, ip: 40.107.243.82, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=URf2XXI1WwiKEqT/i4imymWu5PbbZ7SvEWqswe9XWFewlYlOtCyOUY7PCJbmeLRwjfsrNubJYUXncfxFQj8/I40thWZQHQ+oP1xoBVYkZq3X5pmerbmS++MtXG2KrJ5f+yNa/3c6k811opgml2Nd9bqGbztIHgPqFQ4GmNT6XyUDdtM8jIAJp60yofctrMllrhInHdAqBu/WIzZgRDD42YhRC37V9PcVoxm5TXhO6aVVxFpDEPZtAKN71d4THxo0ejO8cv9Tytk5gKWDuSeVsCzdqUp3FprmlqDuj021DMPfj5omBvquWZr4Pn9jO1zhBPpVRmJDUp8MmtjXpkUIcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaTtTmoGSmgD5VjIKqrZfBnEx2Vz4qM4Y3O5zBBdkTs=;
 b=AEZ6TvFj4VLh28C++vrGE6Zhbs2GLxMhQiebntd7gPwb1jJT8dvE0AoiTs0rfkdDuDShrmY4qKCi1m0zuGJF6ECT8t2KLv82sTTrCzmTIGGgBwS8a63qrmMFmJ+C2jsB3YPjHp10W3myJd5BcXY6PJCVSEDwll3Nt6Gd3CJES9n9hzu/CdrPkh6qH6GWKZYDF9dqAVlYaK/BgFIhRPUG+oupZ/Js9S1ZgTfChMSSYeHqYvWDO0UP3jV4xW3SgmLsE3Q2nAh5czUT0w9v442A/6sKNTEl7dni3n4SfWBsYeNJhq8AYfWEX3qREX6gUxVxAIQV3zXJWq0rcc4KbLFNNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaTtTmoGSmgD5VjIKqrZfBnEx2Vz4qM4Y3O5zBBdkTs=;
 b=jRiJXY2EaAGCBXXUyZbbkKqd6hLNpHtEtCoBOijDnCYGTk6hYA9PiMtoAYCaMOTSG80WK8jmvk0KPJoXaho77PgvRZx/P6gwe3y8NNy9t7WiFAUmqm/wUWibZf9K1oVwgVzy+oroUX+HTK/XAhIbQQGAuAbl6MnDLGqZwHUsSMY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4103.namprd11.prod.outlook.com (2603:10b6:a03:18c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.28; Tue, 28 Jul
 2020 13:33:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 13:33:05 +0000
Subject: Re: [oe] [meta-python][PATCH 6/7] python3-colorlog: Upgrade 4.1.0 -> 4.2.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200724103515.21420-1-leon.anavi@konsulko.com>
 <20200724103515.21420-6-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f9e15e46-ca28-c757-3841-1352f2e52ca5@windriver.com>
Date: Tue, 28 Jul 2020 09:33:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200724103515.21420-6-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0090.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0090.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend Transport; Tue, 28 Jul 2020 13:33:04 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9053d128-82fd-4490-f845-08d832fac207
X-MS-TrafficTypeDiagnostic: BY5PR11MB4103:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4103F6DD7495D1BE2539F7369F730@BY5PR11MB4103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:317;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	led3m24tBYZKfvpz70Z/QeTxozAwn9yZtuMuxPpdE150p+WW14sZAEFPh6hNRR/0omEN6Q5E4EZiLO9UUf397pA3EwlzmhLAJTbWS3qIwa7EuIQojPxyWsPC2fAyffmaJgCcjHy6Kavc4kKb/tsTqJzV4/b71u4ZB3mzVfrxK2ikL5AP+hn1QGPCwiO5UCEHs91QyhlAQMHAXFAL927sd33i9FiQf7xYJeXlWwdeTcwjc0p/Yo8Gsec5sSS8fruTEIMgupH6NIbuHhhe0bpUpWbm4BFElJ4KziHykM+gprtmfGciRdqI6Kgo8DK20cgtr1Lir484dz9teTp5XShzHlxr4pbzEvRJVDnswqwlcYMYgTdOymJpGjgJ+jLttGxxDQ8wKXPU4sNtIfIBM80zbiALqO5BDCFnxVFwhvNSsW64mSXFeSROLZuemdFj3fZUllywzertWLcvaHzZ3XD0zg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(376002)(39850400004)(396003)(346002)(8936002)(478600001)(966005)(52116002)(36756003)(2906002)(33964004)(8676002)(2616005)(16576012)(44832011)(83380400001)(316002)(86362001)(31686004)(53546011)(166002)(6486002)(16526019)(186003)(66946007)(5660300002)(66476007)(66556008)(31696002)(956004)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	x/594ZxQJEbqwupbymXm7oLEViRUWPzbzclkzzXDohMZpmFUt5RZifvpPEzJhXUmGiu0snlCYrE2uG1tIxOmguSHo6EEPb/0O6iMEVqbvM1PloLfjcUH5EU30u4AcbA+jpIGUpGATVDlIptd+cV7ZrAwCVtemI3Y8oGQ+NBW/QGG4se3sVFshtONe7XCvKsH2Pu4ro+K++s3m8Lgd6a/9Y193HQ6EiId6n4xOW4NGT/ndCw2u6DrcHdylavZlF6r32pW5XIhROH6aFYtYlE0lwD/W4XdAFMbGxwJ4Kdvuk7J4DWoFyEK8strjzOv9z8M/VGdVdVCxPFiboYKuHe8XfvdD/j26IQ8zM0pHbLYsun46rPYlSBDmtOR9W1caSDHQxqiCe5Ak3xLHhBNnXhPTm6y0NV3VCbv1/kq3bpGlJiiYFiyzAk2H3c9f5HxyiAWuB4Ewi/dfv+uVREYzQh/YtFAE1QtHgW57IsQ+6Zti/4=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9053d128-82fd-4490-f845-08d832fac207
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 13:33:05.4348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J+WjVdgWrKOROslEg7LYR7KxfNPAznTJRAHXGbJuq2A4SBch76ZYzlywH7RY2M09FdKDEWltXxHFJPx7dlHLHbYmtulkgcMN0IPPElPa91s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4103
Content-Type: multipart/alternative;
 boundary="------------06BDEDF7D2A4CA446A0A727B"
Content-Language: en-US

--------------06BDEDF7D2A4CA446A0A727B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/24/20 6:35 AM, Leon Anavi wrote:
> Upgrade to release 4.2.1:
>
> - Fix: product description on pypi is not formatted. For details:
>    https://github.com/borntyping/python-colorlog/issues/67
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-colorlog_4.1.0.bb => python3-colorlog_4.2.1.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-colorlog_4.1.0.bb => python3-colorlog_4.2.1.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.1.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python3-colorlog_4.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
> index ea4c575eb..a4aaa3cb6 100644
> --- a/meta-python/recipes-devtools/python/python3-colorlog_4.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
> @@ -7,5 +7,5 @@ inherit pypi setuptools3
>   
>   PYPI_PACKAGE = "colorlog"
>   
> -SRC_URI[md5sum] = "25f79b76421132e2a9e08da15e4e0a73"
> -SRC_URI[sha256sum] = "30aaef5ab2a1873dec5da38fd6ba568fa761c9fa10b40241027fa3edea47f3d2"
> +SRC_URI[md5sum] = "a01336efc6f54e58e3ed4f331d76c2f0"
> +SRC_URI[sha256sum] = "75e55822c3a3387d721579241e776de2cf089c9ef9528b1f09e8b04d403ad118"
>
> 

--------------06BDEDF7D2A4CA446A0A727B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/24/20 6:35 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200724103515.21420-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.2.1:

- Fix: product description on pypi is not formatted. For details:
  <a class="moz-txt-link-freetext" href="https://github.com/borntyping/python-colorlog/issues/67">https://github.com/borntyping/python-colorlog/issues/67</a>

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200724103515.21420-6-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-colorlog_4.1.0.bb =&gt; python3-colorlog_4.2.1.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_4.1.0.bb =&gt; python3-colorlog_4.2.1.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.1.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-colorlog_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
index ea4c575eb..a4aaa3cb6 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_4.2.1.bb
@@ -7,5 +7,5 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = &quot;colorlog&quot;
 
-SRC_URI[md5sum] = &quot;25f79b76421132e2a9e08da15e4e0a73&quot;
-SRC_URI[sha256sum] = &quot;30aaef5ab2a1873dec5da38fd6ba568fa761c9fa10b40241027fa3edea47f3d2&quot;
+SRC_URI[md5sum] = &quot;a01336efc6f54e58e3ed4f331d76c2f0&quot;
+SRC_URI[sha256sum] = &quot;75e55822c3a3387d721579241e776de2cf089c9ef9528b1f09e8b04d403ad118&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------06BDEDF7D2A4CA446A0A727B--
