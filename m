Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.59])
 by mx.groups.io with SMTP id smtpd.web11.52670.1598879394286013810
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 06:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=I8S5k4zD;
 spf=pass (domain: windriver.com, ip: 40.107.243.59, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNfQ3sdrd24DhCbf7zQqIltjY6evSdmY3t+dAesjiQ5vOXClX5WfG7fB/GHuGfJTg2cnOHiGGsQPKSfdxDwra51Of+FV1U8XY/FV4Es+BuJuiIEuQLhswkEAOGpS6zkf8PG9oBPzHye2axSYNer6U5w2wDDZynQt0Bo3WuRZm9Ad6A7sCUaQVXewGnFQ81OnviwQ0/vg522CV+2OW5x4pLZCgHJLYlWuqhsFWO0ead+XwFJFr+O9If4PvsSDFSCgaQ9ws4hlu/Omtc2q6PQjL4QO5nPKlvud1sylP68ulIsfWdtruYA85XhPB4DDVLX++BA5/aH/iQCL8p05PZLsGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKzeK3XBsm/NNTaQYTOT9pfLQSXFL1FTYwkfAlCUtbg=;
 b=mHEAazdO4k1/lI4pWMeSRSl+8ZsHjtkara9niQUZ2A6H5bFg5GOXv8PdEjauXJN9JydVIRsqbqKmnaPDEGNhQXEfXJkHnr4E3JXbwhumaO004yRrmbFaHEVtzU4VYjHqUnWKkXjmvocWuC4vvtkN+9il2StEOQ7jFhpNvqE5oa0YzMgnPmhStdDVL3wi6Shvstt2Azm1nX2Lnf8affnj7JQ5xXFcEFWP94IohEJT5AEhiHBJa1PvBsLoqyk3SHSo2uuRjWz9YJmxYMmmMdQFhIRVDeidKvt/BHfHu2xTiGnyH8EQViZspmNmnSOw6/9yb59y3l2ksVa2sAquntfQPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XKzeK3XBsm/NNTaQYTOT9pfLQSXFL1FTYwkfAlCUtbg=;
 b=I8S5k4zDbIE7BsLbftum4V7Yd8g12e2cZm4OhuU/HvCKX9JmHlKCJ2O87Llt+rLmJuBvoMvaeLX97EbVLnF8POG9YdadTkIc5svLSbY0owFzYizlJVRMU0o87l0C4psa3E2r8rXTGvfI4LRT6XFXSz/irM7AuWvbLv4faO0A9EY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2807.namprd11.prod.outlook.com (2603:10b6:a02:c3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Mon, 31 Aug
 2020 13:09:52 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 13:09:52 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-google-api-python-client: Upgrade 1.10.0 -> 1.10.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200827092951.15749-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <68f7a7bc-cdf3-793c-e985-3f42613d2726@windriver.com>
Date: Mon, 31 Aug 2020 09:09:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200827092951.15749-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Mon, 31 Aug 2020 13:09:51 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcef9480-e6e5-4059-ce12-08d84daf2583
X-MS-TrafficTypeDiagnostic: BYAPR11MB2807:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB280728C060B01BDACDA4E0119F510@BYAPR11MB2807.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tsVH+AmJ1ouHSIPWU0g/MYcrSqrMo4hQlYZQjvRkiIlcj3U420Q5Ko5Fd7NhtjrQhiZNm62ztZjWTqwyVVfGBBoEAgq2FenKInCEdzg7xXwoc12xHTBe9C6O0KbRRdriWYArOhy3MOwuBxVz8kErc4v2I1jkicgPxJaM4DX+xQ7hA1/Y31F0VC7ZJwiJUSGzy2J5YwbN8oEg6EawRDy9snttaTREUjA7od9NlHCbJljp5D60d8KYr2CvC+S2UCqEjjTZDEbrWOjrK3J0XkCWvCpCL9+Mv21EXflIwLaPLu18C7ugeg6Vpa+4/vJXTXbi+6/GoJY0tcfYzfM0rY+Xvj1sENF6xkWPetcgGKaUz+cjkVjCStgVRYlrfIqA4Tkhg7iYrPTOn/bW/Ez73FtRJRORnj4q17opgPxt22Bj6kmi3+yvPyECb4vP5RnQAIOuThCDTo8uFOhkH0wdqewL4A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39850400004)(376002)(346002)(316002)(2906002)(53546011)(33964004)(66556008)(166002)(478600001)(26005)(186003)(6486002)(36756003)(956004)(83380400001)(8676002)(31696002)(8936002)(66476007)(966005)(31686004)(66946007)(86362001)(2616005)(5660300002)(52116002)(16576012)(44832011)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	4lgfOkTry71NsvOKk0hA5Irrlg0bopOuM8ACRt6igyGBKGaeKxSUdfH9FPzN5tFojx6aLNBA5iqR2rlK4ll9To3h/zACaW5Tn0RFZi7KnxL7H34xnOuI+uyaNf30n+eFpBqekhztJfLxmapD07qRRj5NbTy4qGSCfai6IckVI79WD/uCIsk4PsbbyLE1JSGyi3GzDufWJHq9vXSb3b9A18KE1lXz3BG6SkukdMuG/MLLBYzBzoSb2KyxMf3IHQzLeM31d2MEFEQlCO2cDI9iD6ZhxUe/m4tJ+7QjPBBK1c3L+KAx6rmTTCgvIXHbmEthlQXgsvl7RwGANdknTp81/lrazd3czXMHfGUHlZwOJO7PQUCMSxs3PqgP7BiZD3xpxYqJ7/+CdPoKMa7ivcYfcblkz4sNK07yACdpi2BO6GXHJayn7GGZ4nsjQKW+bJgsW3FiFEJg6E9wqc5bNFmaYOrivMOjn6s8dD5P3/XI3dAFPgUj5hTLGkY6Up/8qyrpUKMgJOxmnDmpACOXe/hm4nktS2Me+A4ZUrXenbb9TNViiaREk6ryeJ6g2dKlDkao5xCrpIEoTNA51d91nulZu9Uly2PJm9VDmMLDbP/PFq1rlGRfuCztbhBvwc7Cq55ECkJd7UBrytZN7cR48qmoSg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcef9480-e6e5-4059-ce12-08d84daf2583
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 13:09:52.0063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trFt0YP/yegBMPbf5pkxBWyZxE6fH1BsrTysHNrQKwPg1PWfthddgwtH5JpGs/IpD8ZB8PiHEHbORRNxy4t5awxpgCZkYqHJ48ry1Jbn7Bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2807
Content-Type: multipart/alternative;
 boundary="------------75A654F0248A93A0ABD7027F"
Content-Language: en-US

--------------75A654F0248A93A0ABD7027F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/27/20 5:29 AM, Leon Anavi wrote:
> Upgrade to release 1.10.1:
>
> - Bug fix: discovery uses V2 when version is None
> - Fix deprecation warnings due to invalid escape sequences
> - Fix link to service accounts documentation
> - Update generated docs
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...t_1.10.0.bb => python3-google-api-python-client_1.10.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.10.0.bb => python3-google-api-python-client_1.10.1.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb
> rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb
> index 37b6fc621..b52dd467b 100644
> --- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
>   
> -SRC_URI[md5sum] = "a0064953388af9f9c61d8347f1e2ae0c"
> -SRC_URI[sha256sum] = "fa24f07f6124ff2e91ee9b7550e240481bcb31b8f77a75e8d481be1c44a6ff07"
> +SRC_URI[md5sum] = "016caa49075275f02f9b8f199dc96a75"
> +SRC_URI[sha256sum] = "aa8740103774c2b7859f73ba6f55211e794ed7a374c5c427b583869b6bfe9e6c"
>   
>   inherit pypi setuptools3
>
> 

--------------75A654F0248A93A0ABD7027F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/27/20 5:29 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200827092951.15749-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.10.1:

- Bug fix: discovery uses V2 when version is None
- Fix deprecation warnings due to invalid escape sequences
- Fix link to service accounts documentation
- Update generated docs

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200827092951.15749-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...t_1.10.0.bb =&gt; python3-google-api-python-client_1.10.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.10.0.bb =&gt; python3-google-api-python-client_1.10.1.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb
index 37b6fc621..b52dd467b 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/googleapis/google-api-python-client">&quot;https://github.com/googleapis/google-api-python-client&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3">&quot;file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3&quot;</a>
 
-SRC_URI[md5sum] = &quot;a0064953388af9f9c61d8347f1e2ae0c&quot;
-SRC_URI[sha256sum] = &quot;fa24f07f6124ff2e91ee9b7550e240481bcb31b8f77a75e8d481be1c44a6ff07&quot;
+SRC_URI[md5sum] = &quot;016caa49075275f02f9b8f199dc96a75&quot;
+SRC_URI[sha256sum] = &quot;aa8740103774c2b7859f73ba6f55211e794ed7a374c5c427b583869b6bfe9e6c&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------75A654F0248A93A0ABD7027F--
