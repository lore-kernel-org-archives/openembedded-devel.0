Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.51])
 by mx.groups.io with SMTP id smtpd.web12.12571.1598359524829652648
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=adN8AunN;
 spf=pass (domain: windriver.com, ip: 40.107.237.51, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EF15L/PgXgSUKIvb/lnXy9/TKbTbdBlpLfma/A+rUk064BLZ/jCyUgFesguyi1/gfNPNgL3uejnGXqu2X7TMV7+4De7juuyDRLHFbqU3/iSwKbYGCmxJ/3vcTbluo86UGOtNp5Bn0+36YZM985vg1mzhd17FPZKVOO8SWhwN9pHTcSZI/csvl6093zdWRd5vnegkLjDE8o+utAvZDTpUcl9C9Y3Rt8LSTYpiMzo5J2M0Dw70fNGA0jjYdfOPsX4XFl0/YCoR7M070enJNqXyzX6IyVqlgPcgFJe8TJje+6Le/CzbgVNUbdaa6MR+ps8cxs+jO4GB/sPBuCJ02odR2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAns8O/U6dXIBH1DXu/bnfmTg5WLtZ2Hkhmbl2NZnkA=;
 b=gavHJIrew8t9Pyfak9wT0teZGAjyS97RyTo49fr1nCp1gyQkqg3A0Z2WILRZag57tp7m/EW/ewchdsJHNkfHVABPXi/VHrKXrPkwcU0cR72IxYhb1iX9EFTg51r5ezPKkYK4JZ2kMXc5x1d4T4OyTRzzSb1pJWflj7E757CokVsIF/MD0KvBOn+BoG2Unte9YzRT6AAziCrce3EnBH2qKx5JBBT5/r9E3vqbj3hGJnWIHQ2y/UOtsGt96cNPeH513+MCJjDYQDs0kjJ5KAp+BvVLkLnkKjIj080KOEHGoQouPIYsnNaZYBGEhvCHLl2ARFYe2WNXp62QTntbzAJ5LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAns8O/U6dXIBH1DXu/bnfmTg5WLtZ2Hkhmbl2NZnkA=;
 b=adN8AunNr6kxSc1Kf8M8mQoBGjJZFwxFOouOHwrTNbyl/Cv80hJvD96L4qBSFtjavtrQnGDsA9C2M+49kj33cPhMyity5DwNKxZerV2VIXIm5VLH6lG2bjW1NaE+Mrvat/xh1Vc9sm0ndQpyUoh2aPTxVpB+k456453jVq1vP2E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3766.namprd11.prod.outlook.com (2603:10b6:a03:b5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Tue, 25 Aug
 2020 12:45:23 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:45:23 +0000
Subject: Re: [oe] [meta-python][PATCH 2/7] python3-dominate: Upgrade 2.5.1 -> 2.5.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200824145004.12568-1-leon.anavi@konsulko.com>
 <20200824145004.12568-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <53cdd3e3-40a5-06bc-4fc0-0c068a63f2b6@windriver.com>
Date: Tue, 25 Aug 2020 08:45:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200824145004.12568-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0093.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::32) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0093.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend Transport; Tue, 25 Aug 2020 12:45:22 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29b5e5b6-ad70-475a-6d16-08d848f4bbc6
X-MS-TrafficTypeDiagnostic: BYAPR11MB3766:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3766419EC8802493C80391DB9F570@BYAPR11MB3766.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:478;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8WeVSiZzBjDq7ErXoXYdUwtBHjrwsMtfJb8zFj6wnqKlD4fdwI2iQlArJJ7K4xpJnnfZo3rGGx6mMKE1hkq6lCWcDP6Ohcz+AxjDc4YWbUblzLr4fBHFiarLFW8MxY5CpSWjEN0cLAVlfiDto58WMXa3aYKXd9oqy9iQRxfd6OE6dsYRe1xQx04M23QnpK0Hgte985EyZoXRG9JxYtI+NSiYWWtE/WWTN2qoQxahrKjIFTfr1AeAevIPQs4KQKxQwtsn7AkonRu8LTbLqpFymJpoLZJNQtXmLjeSDaFgzGqN1l/VAeRQe3l/3AM8Z/A046Ddk45QW5v2VJ0yE9Ce/dIBWvLYI8dAqWYUFd8Urfxg+v0Mp6L56P4tQTG4iaiNqqWuWT506jagQqczwnCnef/owYZk77IYVU23dB3b2xaNhaOVmjDPjUo7OYP+xmyl9d4kCYo6W4zDhz8J49i1bQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(39850400004)(136003)(396003)(2616005)(8676002)(5660300002)(26005)(956004)(44832011)(86362001)(53546011)(316002)(33964004)(186003)(6486002)(52116002)(16576012)(31686004)(478600001)(966005)(83380400001)(166002)(31696002)(36756003)(8936002)(66946007)(2906002)(66556008)(66476007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	lecLrfci1cgbBLkMrF0wdWi8w9a96G0rpdjYfPO2GfFh6khwECDMTOPaa+BlEzlXO3XKxWHQiTeGkoICmyJJz6FVELgjOma2ZMXGHXJM2W+ropaCIvbDRRkC+3+IDRkSLuU0HWJN12oHQ/uDZQR3sOjZU6U5BKIkFL9zPiudAaCn34KlvcBOfwXVQZGQu73Jx+X+WrLpcW1Ef6aeuR3HdRim3CSZMuc5fDOHwmMFQ9/z9xs5PShsJdyxiwXr3DYDmRNirtLpBow4drvPl+/qFat+pePM0Ty5SKNL/UC3z9/MqBP8ns1omb9uUqy5EDFCRowTs1lg9oIRyGLEp23VLbL19LGX5wAHyoHd6v71K0BFa6H2pI9B51+Fv6nRcgkiRYeuOrLfYpDTRZgli4xh+/EXMyL4x6nVO9+kBcjDhkIXfO/qHXGgDXoIM1KRDue6p8aYgx1XPNmz0e5rwpgkP0DMIzaUNIpufLT77Ne2N+xQBSK/J1Q3zTDHQznSLbDHNX+hOingm5TJTB57aeBMmbHlacInb+3MQ4xQzJ4ulxNAC+KwXaw6UqpICHNPS46RM8bA+bHDxJp/xjhuJh0ryl9M7Nb9zOlA0aWxt6UJftAHmP0co+CWpUe5qOK5quGNT+o9Fi14UMnXE+QQ3/I3aA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b5e5b6-ad70-475a-6d16-08d848f4bbc6
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:45:23.4117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OeRAbwVygLBknMXghAqt4Q7+GuKkRslnlhM9OUb8j5L2slCy5s2oFDmv2CcNpyD8Y+d4J/KWYPqud0qmFEufjgWa2pN8Xu/A8jrbHl0TItc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3766
Content-Type: multipart/alternative;
 boundary="------------436B59762033A58B3FA2E4BE"
Content-Language: en-US

--------------436B59762033A58B3FA2E4BE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/24/20 10:49 AM, Leon Anavi wrote:
> Upgrade to release 2.5.2:
>
> - Removed 'input' keyword reassignment
> - Bug fix: underscores not working in aria attributes
> - Adding some missing attrs to DASHED_ATTRIBUTES
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-dominate_2.5.1.bb => python3-dominate_2.5.2.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-dominate_2.5.1.bb => python3-dominate_2.5.2.bb} (78%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb b/meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb
> similarity index 78%
> rename from meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb
> rename to meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb
> index 75dd4ef9f..204433894 100644
> --- a/meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb
> @@ -2,8 +2,8 @@ SUMMARY = "Dominate is a Python library for creating and manipulating HTML docum
>   LICENSE = "LGPLv3"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
>   
> -SRC_URI[md5sum] = "35eeb6b5587c8c9a51cd22c83e07ac49"
> -SRC_URI[sha256sum] = "9b05481605ea8c0afd0a98c0156a9fb78d9c406368d66b3e6fedf36920fb9d78"
> +SRC_URI[md5sum] = "4a249c71cb009815923e9a47fa03ca08"
> +SRC_URI[sha256sum] = "456facce7a7ccfd9363948109cf1e978d48c58e46a46b01c71b4c0adc73b1928"
>   
>   inherit pypi setuptools3 ptest
>   
>
> 

--------------436B59762033A58B3FA2E4BE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/24/20 10:49 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200824145004.12568-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.5.2:

- Removed 'input' keyword reassignment
- Bug fix: underscores not working in aria attributes
- Adding some missing attrs to DASHED_ATTRIBUTES

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200824145004.12568-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-dominate_2.5.1.bb =&gt; python3-dominate_2.5.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dominate_2.5.1.bb =&gt; python3-dominate_2.5.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb b/meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb
rename to meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb
index 75dd4ef9f..204433894 100644
--- a/meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb
@@ -2,8 +2,8 @@ SUMMARY = &quot;Dominate is a Python library for creating and manipulating HTML docum
 LICENSE = &quot;LGPLv3&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24">&quot;file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24&quot;</a>
 
-SRC_URI[md5sum] = &quot;35eeb6b5587c8c9a51cd22c83e07ac49&quot;
-SRC_URI[sha256sum] = &quot;9b05481605ea8c0afd0a98c0156a9fb78d9c406368d66b3e6fedf36920fb9d78&quot;
+SRC_URI[md5sum] = &quot;4a249c71cb009815923e9a47fa03ca08&quot;
+SRC_URI[sha256sum] = &quot;456facce7a7ccfd9363948109cf1e978d48c58e46a46b01c71b4c0adc73b1928&quot;
 
 inherit pypi setuptools3 ptest
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------436B59762033A58B3FA2E4BE--
