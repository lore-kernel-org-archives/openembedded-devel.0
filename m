Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.52])
 by mx.groups.io with SMTP id smtpd.web12.22637.1600263382631398009
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2020 06:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=apOGXInX;
 spf=pass (domain: windriver.com, ip: 40.107.243.52, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4d+l4vYfIMd35aLSHxr0PCoWBMiWt6dCKcvJp7EpImNRXAQOIYbDiIri+x//2NnwEJGY5Mbjq4Ux+PRv5L6z/bKbBSgOM4J43NoweSaSR1ozQ/tw4XQ2Emb/FfEC8aY3VzJSYsVdIcF5XWDa8hW6plCInBmUGCXbY83igZ4vy/6oYe5fMVMUtTEL7vTI9+SYM24dw8gCeRby8+G45DfBAQbBzzbyduiJ+zhMgZSUSc/Nkgaf3EWiDGtWjMDYRTzOE3IIg7Q3qs1f2TZ/gL/CtQBbAVhlMz4+/PGIfFPK9yQZunxy6RdThnbO8ONcfeN9566mP3AwWcl0Nng/05GTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQzTXDcHYRi1hpM9jRKRMt3JX2F5YDgz8h6G/orGETM=;
 b=m+7lHEDi/d+BUVq6NfbtD5grOEkpiVuYcAymX0I2kmLAC0F3gATn6N4YHTKM6JvYR1TnMpwSp7x9necJJvnWGCTUq3OrdS7JHLFRVBAI8l18zj6ITjikMmY1laqEDwi2trn97MhlO02edcBt3lE9WK7knwWJu8jzH2sl7xG2nD6/FW46AyJYlBSYRIiKFGkZB9H93xd5vB4exrYfcubnMWZ3UgEabmZB1js0KQ7I4tdpvR9rKFZUz5VY4amKXw6GnTQ5eqDU5BN2ZMbm7I64qMEmhr4Fwb0df/MPkRQrtWXXzgWuDtLURCGrCP5eLY+s8S39Id3KCLjAiCehjsxUBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQzTXDcHYRi1hpM9jRKRMt3JX2F5YDgz8h6G/orGETM=;
 b=apOGXInX0WClJQztFTq0gh9jaPVJfUgZmD8rMfKxFwgq+LuhyHt+jlabi+OxAunI8Ilv3sOnBaUaz5Gx8IEW1rovHZgfDM25lE2kKpWuz6V+5OIb/qmPkvWkgja3NfrMHVF0XC+nMWfEfNVbhnmw6p3XlAZhcm/NpAvGuactlms=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3765.namprd11.prod.outlook.com (2603:10b6:a03:f6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Wed, 16 Sep
 2020 13:36:21 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.014; Wed, 16 Sep 2020
 13:36:21 +0000
Subject: Re: [oe] [meta-python][PATCH 02/10] python3-google-api-python-client: Upgrade 1.11.0 -> 1.12.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200915090303.14367-1-leon.anavi@konsulko.com>
 <20200915090303.14367-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <12214cb9-cd1c-b3d7-3b99-e1edfe7ee029@windriver.com>
Date: Wed, 16 Sep 2020 09:36:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200915090303.14367-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0083.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YT1PR01CA0083.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13 via Frontend Transport; Wed, 16 Sep 2020 13:36:20 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bd742fb-9a6d-4ee4-9f16-08d85a457f79
X-MS-TrafficTypeDiagnostic: BYAPR11MB3765:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3765971C529260CF598564459F210@BYAPR11MB3765.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JJYTzLurGdgcqZqT7Exp5C7ONnoTE0Freu/llpTiQ6IX5ava7TktPDKTXvZ9LKszVXm19hfGnpMdDmPB1ohOnQe5n25CgUWvdGQhz86xsg3ZtCUkzfV/OWyM3J7jYXG08KbOoiJuPUoJn8oH8jBg4P1g4Yp7n25Xqu3OBjugjTYy14h8XK+huOK+Cz/urSuyonoY61vh8HaoyRxDWp6JLpeHCezlx3kYzSjfbIBs5QuRLxztxpake/eEvvujVHvxn3Ht0tlZssYxtdO3wlvDyReJ4eArY8fj8e+yK/bFx28CNrYyAyNy9m0zI+uOGX6pbhCt1BCFflgs6KlhWQi3N+xxJA357FHT8qGctvulcH7f308SlRwUQq7ju2MaJ+gKWcP8uiTRDxJ2lTz6x3DqiPxUWPhjgWbC+JuphqYHn0MrEjfKFnvnjYKCFQYEuHrPwxtLEhE8RB1Ko/7wFqsdiA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(366004)(396003)(39830400003)(44832011)(966005)(26005)(66946007)(478600001)(31686004)(66476007)(956004)(2616005)(53546011)(66556008)(6486002)(33964004)(166002)(8676002)(8936002)(16576012)(186003)(83380400001)(52116002)(31696002)(86362001)(316002)(16526019)(5660300002)(2906002)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	71qCUgnD/30yO2ZD29nKzRtlBIlmujUkPO6Td9lnaQFvxwgeZmPgc/+Z9DBbEKgj5OG+oq5fz9GpGXfK1ZyhyREsgaEYCETfIVmgM/CW+AQ6F/81leECAJM6Mh0J2IVQ4Q3QEt+ACZBiBguAUphQhADp40Fsl7zYyJ3Z1kVlDzjWSwKLZrFTrNflaJ8p4qzsv5F0fxk48mDLoQ+NQzspFP5CrOow2uT3pD7gir/+7wxOWWSRVY00nChg3sOdGel0pc9wGBQ3lXNx+7vK6cXgX+PAFTWyznZUCCQSbymBwl41p24ziOLrBW3BXIkrpxyEEB5xnzfQeHIMlxaEjY8c3Zn0bneee/27Kf4AL/6DwSGOAGS/2bnITR1qH7Y0zcAKprcwW4eOCx9YJuP21GDvxmSK4RB+WAPpkzKnnVO6VqmOHB82PgxFynCGFNWAShkRGMBpJtz2tDZQLslVL+yhuzNeF/VGJGZlob2r0k48y/Lr6D2jEuRvftTstDMn7UvrPuzINQRx94KW9zeVHjEgUF60ZYhIQHyMMWQqiGsoeJL5VcD0rBn+GPQX00kzucuYi5BgJHLlXzawlq7OgKGEuyOSR4k/9bJJwmTPXpI4YhnW57u2+T6rqJvuBjP2PiO9NimmxPh6rhmSq1L6sHg6Zw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd742fb-9a6d-4ee4-9f16-08d85a457f79
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 13:36:21.3803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YnZwhxd3+8HGwuVvKamyVU7NZhDoolrBANGHv1TubiWqwPBBuK/FNt2UjnD3LjYTzhnb84a1k82WQn/l8zd4GHCSdvo5pVx7mIH6U5fa6N0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3765
Content-Type: multipart/alternative;
 boundary="------------6DFB299DBE7D3E3A95FE33C1"
Content-Language: en-US

--------------6DFB299DBE7D3E3A95FE33C1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/15/20 5:02 AM, Leon Anavi wrote:
> Upgrade to release 1.12.1:
>
> - deps: require six>=1.13.0
> - add quota_project, credentials_file, and scopes support
> - convert print statement to function
> - remove http from batch execute docs
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...t_1.11.0.bb => python3-google-api-python-client_1.12.1.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.11.0.bb => python3-google-api-python-client_1.12.1.bb} (69%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.11.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.1.bb
> similarity index 69%
> rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.11.0.bb
> rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.1.bb
> index c14b17254..d79ac3c39 100644
> --- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.11.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
>   
> -SRC_URI[md5sum] = "b9a09d60cffda35887a8e09b600a73b0"
> -SRC_URI[sha256sum] = "caf4015800ef1a18d06d117f47f0219c0c0641f21978f6b1bb5ede7912fab97b"
> +SRC_URI[md5sum] = "92106822131f76ca77b77009674e78e4"
> +SRC_URI[sha256sum] = "ddadc243ce627512c2a27e11d369f5ddf658ef80dbffb247787499486ef1ea98"
>   
>   inherit pypi setuptools3
>
> 

--------------6DFB299DBE7D3E3A95FE33C1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/15/20 5:02 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200915090303.14367-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.12.1:

- deps: require six&gt;=1.13.0
- add quota_project, credentials_file, and scopes support
- convert print statement to function
- remove http from batch execute docs

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200915090303.14367-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...t_1.11.0.bb =&gt; python3-google-api-python-client_1.12.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.11.0.bb =&gt; python3-google-api-python-client_1.12.1.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.11.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.1.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.11.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.1.bb
index c14b17254..d79ac3c39 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/googleapis/google-api-python-client">&quot;https://github.com/googleapis/google-api-python-client&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3">&quot;file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3&quot;</a>
 
-SRC_URI[md5sum] = &quot;b9a09d60cffda35887a8e09b600a73b0&quot;
-SRC_URI[sha256sum] = &quot;caf4015800ef1a18d06d117f47f0219c0c0641f21978f6b1bb5ede7912fab97b&quot;
+SRC_URI[md5sum] = &quot;92106822131f76ca77b77009674e78e4&quot;
+SRC_URI[sha256sum] = &quot;ddadc243ce627512c2a27e11d369f5ddf658ef80dbffb247787499486ef1ea98&quot;
 
 inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------6DFB299DBE7D3E3A95FE33C1--
