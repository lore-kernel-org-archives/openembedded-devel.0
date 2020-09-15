Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.45])
 by mx.groups.io with SMTP id smtpd.web11.14688.1600180025983317277
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 07:27:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Mj7J/xuy;
 spf=pass (domain: windriver.com, ip: 40.107.94.45, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPQBPfE9SpJnVdP0xRuI7TQ9/gUO2O29HA9zobwGiGzEYPsB0ckIYY7YeFAAaJaaYuIMZqzK7TNhARABuKU9T0FnVfgQYOj1ZAhcX0QLm6vKbwvAIUCjpjbI3djFZpF+vrTriJh8r1I2VhhO4ukL75Z+UnUGjg4RjT0VvSyRmlDYqZvyHcXT48bknMnOsLoTViHWJrtFWRDFlEdwwGPe3XgiVsGs9xr+kRb+aOYIeyl6wylbstW+Y9dGEaK38K96yw1DYYOHuc3e5l2nxqjXkE5AU1Y9OaBv67BfI5EDnYdXB7mQ6UuT5JxNmVJGzYvQ4no46gA6tt6yRCgEiD+BJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4IUPddr0PGah+/XdpfLagLpnN2xP0/7F8o1xBRXXUQ=;
 b=BgMsWE8ISg0Is5en97DJq6ByHNoMJklN2d0GKZ0gKmGU5epi55BNH0B+biHP8BbHv5f7giolsby7KyZEChg6ZpKKyTe8HuE22G2w+Spzkdad5EgJjbxsHvOxc/hBI2/h3hT5LnrMnI2thqF2pWW825X3JVxG3+zWUNiowX9neI2SwwnPhauBlYOpjGo4ZA/ND/4UpA3vSpIwZ/VAtkRyK6IdnJ3Rc1yQpKMDs4nE48JADzp5qX2Kx0xDDzQ9XUJP47WaOQ4oWkci/gLnHlv3cIj2EbIbycKMV3/bBTXrlUszWvvCU0XPZChaViev0/88neUiSF9yBDizJx12UuiVOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4IUPddr0PGah+/XdpfLagLpnN2xP0/7F8o1xBRXXUQ=;
 b=Mj7J/xuyj3s4Out/xBDhK5lbiSlNAHi/Y7h9gZGR/FHgYuSVK3lcsCg5Pfu0QberZZ/6vU4dLpekBQ0trXcwHO9VHUVvtqS9DVHMzIvGnSzSlbjF5hx1D4n2r9LEgm72BKfNGJwigiXrscPPdry5sD9l3ahnLEuciB4BKFOEBDY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3767.namprd11.prod.outlook.com (2603:10b6:a03:fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 15 Sep
 2020 14:27:05 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 14:27:05 +0000
Subject: Re: [oe] [meta-python][PATCH 07/10] python3-trafaret: Upgrade 2.0.2 -> 2.1.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200914090419.19171-1-leon.anavi@konsulko.com>
 <20200914090419.19171-7-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a3482de6-ca31-534d-711a-5206db2dbcef@windriver.com>
Date: Tue, 15 Sep 2020 10:27:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200914090419.19171-7-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::34) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0057.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11 via Frontend Transport; Tue, 15 Sep 2020 14:27:04 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e4b52c2-1025-4ab5-574c-08d859836b44
X-MS-TrafficTypeDiagnostic: BYAPR11MB3767:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3767C8492788519DC309817A9F200@BYAPR11MB3767.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:288;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CmtjoUGrM03C+w+hP6rG2IgMdO5VRWx1kjQ/lfVr+sB3QJRWshawrJnqnkHTpib3lTaiDgGoVhc4asFngYZEe/2iTymYlPPruB8txCODT//MgvPK8ctus17qJjdu+BB1MKtG7JRZY3S2HNEtfRNorrKt3I2Fs3Ij4Vg4rOt2uQpvQuKo2+FWCjkUYiDON7gIHeyx7V7DqJbuNdgTLmtNl2eEyK8oPfav8Unn8iULVSGxkDj4OhhKfYKvxlb6k4I8tW95/33dF1U+rbwYN8Ei815wkPvxC7PMqp1B8pza7AHkLYM5EBRzygSCXd7eOvBJ2pxM+UryppBVcOeap8t0e+EfNy3FVDEb4cetGq+73FjWF5aQ5zO9SHkVDx7DJPWCOOFq4qIUmvLzHdigPfByBncEElBMnRT+uh7+NYxcGZv56DZ9mNgy/RHWArAnl83TGSLX2p8iDY4iQiwGHzbOQw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(396003)(136003)(366004)(346002)(2906002)(966005)(66556008)(66476007)(66946007)(478600001)(33964004)(53546011)(26005)(16526019)(186003)(52116002)(44832011)(5660300002)(2616005)(956004)(316002)(16576012)(36756003)(31686004)(83380400001)(166002)(8676002)(8936002)(6486002)(86362001)(31696002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	Iy2RFJe1lJDjgfOwbvskh+ELA7OIuZzJWJDgn5NvvWbgTAGoPKEDIg+zdnPW4YjE9eorvNnGPLN5cjJH16vm0dXIMy942Dn9OMA22B3P5fBxri2PvpV/ACkEHTCRECJfrHPbo4GX9gcD6nbvHNlcSsiV5j4xpfreVoghWMYVqcFiGCHVqtFSLEXwo+A6tfsLGb653WJ2qJlfNBKyA9QB9NlgqdZIpYdr/QCOVgdjco8LLC5MvCsc1656miz5z5BHU390PQfdZ1WKB7R1gSee/kLWJa94NDBHiY24GQ5Wklha/RMvkTeqKkde+++M7ifncKXtRbSxhHB0p3abiM0OwcC68fF40GK7yvL4JasUF7IzL+ZDBgFP7wbTYtLvm39Wqe617yzndiLFa9UKDgC2ZG8MYTei0tU5xnnIQxn20fLpnbuZ9SN/ACaDXhmGl2tisgfPGwNZWb7PKONe+jvQkvkFOro4lQs7ZJT95+1mN/UvT3h/DFJ4ZdOVHBGVp9GQPBAVKyfrwHrM4YH9iK5P0ocnVWs5YcHrvMMcSlfhMUnh0VAVknXcpHg41TDhavOO+aMkzNy8TttBVPRCFctKvosx6Wp0yUdwE3p9MRsH16X9D/P5bP5f/kj/a2o7nzCkinFfd1XgwyGfvJDcf8t5hw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e4b52c2-1025-4ab5-574c-08d859836b44
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2020 14:27:04.9743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnKgfskNTv+bbSjPmk7EcCHP8DYVdmObAkGlnhpVVUaYJ0YizrxFrJYAumXnNMsrvVlRf1zgE3VGJF6l2JzjdXhRap53Scsk5iajkbk76t4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3767
Content-Type: multipart/alternative;
 boundary="------------37B1D3290BA42F31897D93C5"
Content-Language: en-US

--------------37B1D3290BA42F31897D93C5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/14/20 5:04 AM, Leon Anavi wrote:
> Upgrade to release 2.1.0:
>
> - fix for `Dict` merge
> - new `is_valid` method
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-trafaret_2.0.2.bb => python3-trafaret_2.1.0.bb}   | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-trafaret_2.0.2.bb => python3-trafaret_2.1.0.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-trafaret_2.0.2.bb b/meta-python/recipes-devtools/python/python3-trafaret_2.1.0.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-trafaret_2.0.2.bb
> rename to meta-python/recipes-devtools/python/python3-trafaret_2.1.0.bb
> index 4e814073b..96602016e 100644
> --- a/meta-python/recipes-devtools/python/python3-trafaret_2.0.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-trafaret_2.1.0.bb
> @@ -3,7 +3,8 @@ SUMMARY = "Ultimate transformation library that supports validation, contexts an
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=21ecc7aa8f699874e706fc1354903437"
>   
> -SRC_URI[sha256sum] = "61dfc25b574f70bfdf7ee3a808ec423061811c13a10b8d3c9e11ab539b96ab65"
> +SRC_URI[sha256sum] = "72c342ede27fb34cd219b62855119380ae1c87006b6106be163c01159eb955ff"
> +SRC_URI[md5sum] = "228675376012fb27dd7f70ab685e7766"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------37B1D3290BA42F31897D93C5
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/14/20 5:04 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200914090419.19171-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 2.1.0:

- fix for `Dict` merge
- new `is_valid` method

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200914090419.19171-7-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-trafaret_2.0.2.bb =&gt; python3-trafaret_2.1.0.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-trafaret_2.0.2.bb =&gt; python3-trafaret_2.1.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-trafaret_2.0.2.bb b/meta-python/recipes-devtools/python/python3-trafaret_2.1.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-trafaret_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-trafaret_2.1.0.bb
index 4e814073b..96602016e 100644
--- a/meta-python/recipes-devtools/python/python3-trafaret_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-trafaret_2.1.0.bb
@@ -3,7 +3,8 @@ SUMMARY = &quot;Ultimate transformation library that supports validation, contexts an
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=21ecc7aa8f699874e706fc1354903437">&quot;file://LICENSE.txt;md5=21ecc7aa8f699874e706fc1354903437&quot;</a>
 
-SRC_URI[sha256sum] = &quot;61dfc25b574f70bfdf7ee3a808ec423061811c13a10b8d3c9e11ab539b96ab65&quot;
+SRC_URI[sha256sum] = &quot;72c342ede27fb34cd219b62855119380ae1c87006b6106be163c01159eb955ff&quot;
+SRC_URI[md5sum] = &quot;228675376012fb27dd7f70ab685e7766&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------37B1D3290BA42F31897D93C5--
