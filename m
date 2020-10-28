Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.73])
 by mx.groups.io with SMTP id smtpd.web08.10491.1603898398405291876
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=CXEf/RPE;
 spf=pass (domain: windriver.com, ip: 40.107.94.73, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcHix5xn1e04oPnzREgxWz3nn2LORjH+8w+ayo+CxR0fJwhR+cIyqNpME34J67Z2o20mmFPKC5gyFgqveL2aRokKhqKS+djRHkn47M7Ur+yWTnYLA5Z+8gnh3POWyqWalOwYZQSvcDXndCatSPHqlVuWYLc7Akh2Tn4k31+cj+ABlB+k7YtCTjP0wIp7oFuct0e+Hpkw+aZkYZha2Jz/UmoBlGhamvP+gMjCMuxgeJ+6c3CMJeGKIAXJ2bkI2doSAVX/5ij25HId1s4nRSC5AbF5hZFRE1wZFM6tPYojDkRScquACJT/xVywWftsjUOd6YysVHmfBdNYZsQ7LhlPrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09DOBhE64HHBWDlYA88o6V38JFlyKkIbMasP8VI1kqI=;
 b=n2V29kYbmZGIvV2gSI7JlfsVWRJSmoPO0+TkJivedge+xWm8l4EIkaEGidbYLLdwTrPFuwKnwJwqp1qR9yPGy/+wnLdd7RmTNgX3sWRuh39PHFSGIEa1qjwXv3DsYkx6QwUNxPw28YvuuP3yQlXz3Zkubm7Jx1NmMZBbIBYeIqcVn1oJe0po+lWcnlkfWCxa4bFegh9UU60QY4F1YGU/SsfNnwuik/m5pJ1HzFY1o64VPUG1EKcAiTyc5Xs+oIqXGKGTltC+ulpHOubPCJDRfQ/g4HgPLQ70ONTRD0rbTyuHH0LePq1PnxCe4UvI3HooqA3PMgQJ8rSJTAUSeapxtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=09DOBhE64HHBWDlYA88o6V38JFlyKkIbMasP8VI1kqI=;
 b=CXEf/RPECtD2eu3TSDtvVxP4meMnrUjggf2xz7lfyh8tW6S0sDecwuolt36WLyuUuH7XAK/RpH/WcWVklcbk4lT6Jd4egOhYxnllETTn2YA9XtU6TUjAEynAnNFE9lrevJ8W/ePpmLqAqNNJbsJehC68zl1FhV1b2m28wEK2h5Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3189.namprd11.prod.outlook.com (2603:10b6:a03:7c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 15:19:55 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::7875:99b3:15ae:5df2%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 15:19:55 +0000
Subject: Re: [oe] [meta-python][PATCH 1/3] python3-traitlets: Upgrade 5.0.4 -> 5.0.5
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20201022141749.14950-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <80d952af-5d2e-1507-bd01-7213036e4101@windriver.com>
Date: Wed, 28 Oct 2020 11:19:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
In-Reply-To: <20201022141749.14950-1-leon.anavi@konsulko.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: BYAPR11CA0088.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by BYAPR11CA0088.namprd11.prod.outlook.com (2603:10b6:a03:f4::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Wed, 28 Oct 2020 15:19:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d43f74c-ccd2-440a-8237-08d87b54ecad
X-MS-TrafficTypeDiagnostic: BYAPR11MB3189:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3189C24D0F2135E4797DBC8C9F170@BYAPR11MB3189.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xtkjn7TwmTjm9syZ6i3BjDET64wbdrsWwpTsGAgYr6rOVDp+qgHo3MA9eiWPeHSs6AW36ZFhWlX6pnttLs93v30IvDie9Ra5xwWXxBGDDdK8NeHN0tPUhDCuy05lrlN380P5O3+cq80bzNrR3gCkYgk8IbW+JMHbQH2xRUCRf7YYDVKJzpySrKLCpC6PDZM0Pr8qpxhLeqJJ66alqg6TlY8/FUVMyYexrAEzrh8d/ptBgGghFTi1qHdYltj+Q1EY5qq4SG5faxtc97YWCfvv2hNQ/77MUnwmS0xzo0zMmahP+6U3+Pwime0KqXt3OPOWvZuXbPa5MqhHHc4oLR2vSv32MXWkQjOqld+lY2hpph1W1TCl2M+psHDep55a2Q6RbY9FPFwPp6hmBVzFxg6oInq7WY1YchYcuwYk00wXYSF7yJ9hWB8k6swTOmYv5G4FcOKQ2ZL0NqeRJqkJ4pV2tA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(346002)(396003)(136003)(376002)(16576012)(66556008)(44832011)(86362001)(66946007)(31696002)(36756003)(53546011)(66476007)(52116002)(5660300002)(316002)(83380400001)(33964004)(2906002)(956004)(478600001)(26005)(8936002)(16526019)(166002)(6486002)(2616005)(966005)(31686004)(186003)(8676002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	JxVRmRaszHL7KJflzX9hWAynq8LQJMCwH3DCSsWNOK0F5Lkj2kVUQWaBR6lDtMfFG4QXvKsAs9jpjVuUmkc6CWtO9zUHkewRZevGflKNve9qN8p1kQ1HYbJP9n/ENK6emZs1fQRKFuMG+4Y8MT/wakx/Z1qNUVvVKcQF6XRBTc1SmgUZFQuWLb5lPVJhtA7EOiPgQ0r2A7eM41q+8tuEwz0BQMz5hWQ0r3kOFXb/12geLe90I7YY+c1QyI7gWuIFRVcY+VQg6fuQWqu/19EhfY/kRCuDsyyxcesonXnm94jU0Nz3zffPL/uazL7XAsacmV/oHxLt4fl+Yr93xY/ydMOBvgGHJ2LrLSvzteXDS7YvULrbd/8t1oxOMngPQX11hH6mHHaBQNp2VqO3VtEq+JgBx5QrRMhzfUG4SvEPc7aZdma1AuIMTs13OJ4MA2T6nv55U77vd+xOyFv2ITAiNe5MzSdDTi4ekd9jM33AIjMeqVFmyulSwgk62TmfNHADPNaKLdSXoTLok+1WVg7pyX1QAOs06AZ3RgB5WhdaJ9DjVqpQjvjS24TsA8OaWhouV03F3TzvLIJXABBhme7w4XOEMpdtlNF3q/0tuX00x75oC1fE+ZjiciaqFLD4tDLM0nroPioVNLeb0PmJpqAXng==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d43f74c-ccd2-440a-8237-08d87b54ecad
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2020 15:19:55.5596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nwp+jO9+ODvUIp/1DnPuzG8vBObZi0+a0OSrIVAGAUsq2+57u2FDXJkx+heYQOWaIJGL3kyNRqaX8E+TJBY8pWKBnbokG/iDiJ5c/hI+kPE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3189
Content-Type: multipart/alternative;
 boundary="------------616D6D19680A8EEE72646BFF"
Content-Language: en-US

--------------616D6D19680A8EEE72646BFF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/22/20 10:17 AM, Leon Anavi wrote:
> - Support deprecated literals for sets, tuples on the command-line:
>    nbconvert --TagRemovePreprocessor.remove_cell_tags='{"tag"}'
> - Fix from_string_list for Tuples in general
> - Fix support for List(default_value=None, allow_none=True) and
>    other Container traits
> - Fix help output for nested aliases and tuple traits
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...{python3-traitlets_5.0.4.bb => python3-traitlets_5.0.5.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-traitlets_5.0.4.bb => python3-traitlets_5.0.5.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.0.5.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb
> rename to meta-python/recipes-devtools/python/python3-traitlets_5.0.5.bb
> index 194193f63e..53451cd3ce 100644
> --- a/meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb
> +++ b/meta-python/recipes-devtools/python/python3-traitlets_5.0.5.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46"
>   
>   PYPI_PACKAGE = "traitlets"
>   
> -SRC_URI[md5sum] = "592dde72b6b706d09ea624cce9af3cf5"
> -SRC_URI[sha256sum] = "86c9351f94f95de9db8a04ad8e892da299a088a64fd283f9f6f18770ae5eae1b"
> +SRC_URI[md5sum] = "2ffe54aee5d0d87890127dd28ce3f6c4"
> +SRC_URI[sha256sum] = "178f4ce988f69189f7e523337a3e11d91c786ded9360174a3d9ca83e79bc5396"
>   
>   RDEPENDS_${PN} = "\
>       ${PYTHON_PN}-ipython-genutils \
>
> 
>

--------------616D6D19680A8EEE72646BFF
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10/22/20 10:17 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20201022141749.14950-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">- Support deprecated literals for sets, tuples on the command-line:
  nbconvert --TagRemovePreprocessor.remove_cell_tags='{&quot;tag&quot;}'
- Fix from_string_list for Tuples in general
- Fix support for List(default_value=None, allow_none=True) and
  other Container traits
- Fix help output for nested aliases and tuple traits

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20201022141749.14950-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...{python3-traitlets_5.0.4.bb =&gt; python3-traitlets_5.0.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.0.4.bb =&gt; python3-traitlets_5.0.5.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.0.5.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.0.5.bb
index 194193f63e..53451cd3ce 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.0.5.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46">&quot;file://COPYING.md;md5=eec4de4d599518742e54e75954e33b46&quot;</a>
 
 PYPI_PACKAGE = &quot;traitlets&quot;
 
-SRC_URI[md5sum] = &quot;592dde72b6b706d09ea624cce9af3cf5&quot;
-SRC_URI[sha256sum] = &quot;86c9351f94f95de9db8a04ad8e892da299a088a64fd283f9f6f18770ae5eae1b&quot;
+SRC_URI[md5sum] = &quot;2ffe54aee5d0d87890127dd28ce3f6c4&quot;
+SRC_URI[sha256sum] = &quot;178f4ce988f69189f7e523337a3e11d91c786ded9360174a3d9ca83e79bc5396&quot;
 
 RDEPENDS_${PN} = &quot;\
     ${PYTHON_PN}-ipython-genutils \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------616D6D19680A8EEE72646BFF--
