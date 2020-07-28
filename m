Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.61])
 by mx.groups.io with SMTP id smtpd.web10.12451.1595943133637766174
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2020 06:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ma8idjBH;
 spf=pass (domain: windriver.com, ip: 40.107.243.61, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJOTcE3zCl/KJRO7/AnnPS2sLd62VlWZLkP+gpOrzRMT6o2v65K2Jbre47zHmNrSI0x9ur+gCQdQVFd+oGsc4FA3SuvAw3Twjv33on7KSqlwSgLqq0H6Kfb4Qh6krLDYgO/MIqy2Gim+rkMuRdnX1aPETL8sE9Rfc321vPyn1hIFgegDV+4SVwIs6srL2t84CzDnTl1jxAgHizRH9RyyC9EjvodwF1LnM+GnmeNaN9UoZHHnnCqgb8G5FUm9NkrzxHPjyO8JRSH2tOYrckmX0nWTzyCFmV9TIwAQx2NWbWldHEQKnkyGK96hHFlbsLse1uZGPswudd2OtNfmaihqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rK19+mc9LNbGMJXU3OGI7tQSQ1ngPfmYknVJqmpb60=;
 b=kaCrQFdE4JrZ7iH6/M4B6lT/Kxj8FdiRyK6eci+GdpmXWwII7fjg3SGfTumWcT9C+H5/qrMHk2Kae5fXHdsXPlC5Emx7ymcax65J43Cf+NZGgzNKfO1SkFJC3CYXUr0qGV4LN5j2EbZir9tEdxJ08lxQeGCiRSPWjryKY9uC42UxtHuBoc3PgOCGBirAHr01B8gokCiH8KuunIUB9w2TxLtrH9b+JHtKnOww8ZhqqDF70sPAYkJhd+tO+UQZYQP5CH/bSFInhN1sXUKWdzZBdkjoSTZzhlzVGA6j1sbCMr7eQfVFwTaIPj8tK0OdxK7qYnOu18rsjWVshvS3+OVH9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rK19+mc9LNbGMJXU3OGI7tQSQ1ngPfmYknVJqmpb60=;
 b=ma8idjBHsi9scLAQ8+CUqZnB4w3kt/mIToYteZe7HlEV/eixqLGAcaq/92V6otZsrDc4mdzMJ6UA7jKsRDc6ry21VoK9wcIFgXt2oA7A12EzPUfH6oyRC751PTb0iLzysRdZkKGwzVC9pUaygOEVAB2pHVPysRdCr5Vzgc8zQ1I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4103.namprd11.prod.outlook.com (2603:10b6:a03:18c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.28; Tue, 28 Jul
 2020 13:32:11 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3216.033; Tue, 28 Jul 2020
 13:32:11 +0000
Subject: Re: [oe] [meta-python][PATCH 1/7] python3-pytest-metadata: Upgrade 1.9.0 -> 1.10.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200724103515.21420-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <ad640a96-0597-7f3c-2a40-f9fbc303b61c@windriver.com>
Date: Tue, 28 Jul 2020 09:32:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200724103515.21420-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::7) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend Transport; Tue, 28 Jul 2020 13:32:10 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e76e8da-9df3-47e1-c638-08d832faa1c7
X-MS-TrafficTypeDiagnostic: BY5PR11MB4103:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4103B285C24E7EEFC7B614249F730@BY5PR11MB4103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eRxQs9tYxT8go2Rw2AomXVHd+bwarMoPfnq6nG5/jIKN8w4j8ZLZZTLd2wS4OiBz/Zj8ji2tR2fcAbJdHSOZhMJeXsOi7/RzHR0ArhPbKbU76fRc2B6EdApfisNtoifp7bAYsER9fhRzpEO0jWmuTyTonx/4R2aTkMr1bTsCbP2OE6GUvxitnY3aASuhHLK67gcs1r5Z2a0QrXNVAqV73NQ9Wf+RpfHgXrh27J8s01//Kt+WtzN8J2Zco4MjdWQmSBuCqgmog80x0+OfoLeH9NKRy2lE1LhqO58cirgExFbNM/TdeUqFptIndWVvUed9XpRgJfr0RzSky2zSq5sKZJAYX60wrGAyC9FRfasKNjOD2frHLUy/yM11H5dsPWSwqJkPyXkd1GW92ZPs3wVmpHYk4Ns7M9ffRCmQ0+oP38dKT3R6m1XCtQQoUZJcvWX0KhERvfqywuGQuCUfu5jIVQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(366004)(376002)(39850400004)(396003)(346002)(8936002)(478600001)(966005)(52116002)(36756003)(2906002)(33964004)(8676002)(2616005)(16576012)(44832011)(83380400001)(316002)(6666004)(86362001)(31686004)(53546011)(166002)(6486002)(16526019)(186003)(66946007)(5660300002)(66476007)(66556008)(31696002)(956004)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	sDmEPktoIajDMwPjpCG1E58IgFqPRJg6ibdi1btELfn6Q22JLtHK+P4kALK0/QBKzWLt3k1tb4nPAP7emwXZDozx4de8G95OtKB2vCEnk45FPBS823KSxnl6NQU6hZYw4Aa48M8Qp9isjilspPtDOQxwfD2CUVvJ9sFSziGU7bhk3HSr4yNsMvgAXsRNAIsP22KjGg8WB7+3f7Pm2nPp4nGEgMsK6yhi1GWFNq+QKYoGo/k4kBH2O3Pda6sgFUd9TC6XRtjnwn/qDWyZTSMV6izex1NbEBZ3eL1OesA7P/mVJc21yEb4KXEt90bhtvrakadXxz80hJWtmbQYWJS3+GLyl4z/yn84syoojt9FBVvI2zL+87rkr0EJ8SO4VCovI4qoL5d0cAC72Xs5wRGjW2NbJaj/36qkWWKokfdZ6CPvSuCKDgFv/orC6Bpxgws6KcZzcNQBNv5qDxQjL+uDmazc7bxNhkDmZsAU1f8U5/gITGQEaAfnnSA8av9teWtF
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e76e8da-9df3-47e1-c638-08d832faa1c7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 13:32:11.2610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KlCN8lYEkUwIbSh4K7eNeMT3155ZyvQEXltA7bdfCaSHS+vMB3v3dRinxEqTaCY5P34mzqx/WIH+RBsh+G75CERpAcRBM0AVHb3Of8GiXM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4103
Content-Type: multipart/alternative;
 boundary="------------8CB93AA411DC13574B0BE553"
Content-Language: en-US

--------------8CB93AA411DC13574B0BE553
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/24/20 6:35 AM, Leon Anavi wrote:
> Upgrade to release 1.10.0:
>
> - Compatible with pytest-xdist 1.22.3+, now including 2.0+
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...est-metadata_1.9.0.bb => python3-pytest-metadata_1.10.0.bb} | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>   rename meta-python/recipes-devtools/python/{python3-pytest-metadata_1.9.0.bb => python3-pytest-metadata_1.10.0.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
> rename to meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb
> index 4a77af3cf..70cc98f29 100644
> --- a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb
> @@ -4,7 +4,8 @@ DEPENDS += "${PYTHON_PN}-setuptools-scm-native"
>   LICENSE = "MPL-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132"
>   
> -SRC_URI[sha256sum] = "168d203abba8cabb65cf1b5fa675b0ba60dccbf1825d147960876a7e6f7c219c"
> +SRC_URI[sha256sum] = "b7e6e0a45adacb17a03a97bf7a2ef60cc1f4e172bcce9732ce5e814191932315"
> +SRC_URI[md5sum] = "4fcf9764e6210c4555411fce8109e7cd"
>   
>   PYPI_PACKAGE = "pytest-metadata"
>   
>
> 

--------------8CB93AA411DC13574B0BE553
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
    <blockquote type="cite" cite="mid:20200724103515.21420-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 1.10.0:

- Compatible with pytest-xdist 1.22.3+, now including 2.0+

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20200724103515.21420-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...est-metadata_1.9.0.bb =&gt; python3-pytest-metadata_1.10.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-metadata_1.9.0.bb =&gt; python3-pytest-metadata_1.10.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb
index 4a77af3cf..70cc98f29 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-metadata_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-metadata_1.10.0.bb
@@ -4,7 +4,8 @@ DEPENDS += &quot;${PYTHON_PN}-setuptools-scm-native&quot;
 LICENSE = &quot;MPL-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132">&quot;file://LICENSE;md5=5d425c8f3157dbf212db2ec53d9e5132&quot;</a>
 
-SRC_URI[sha256sum] = &quot;168d203abba8cabb65cf1b5fa675b0ba60dccbf1825d147960876a7e6f7c219c&quot;
+SRC_URI[sha256sum] = &quot;b7e6e0a45adacb17a03a97bf7a2ef60cc1f4e172bcce9732ce5e814191932315&quot;
+SRC_URI[md5sum] = &quot;4fcf9764e6210c4555411fce8109e7cd&quot;
 
 PYPI_PACKAGE = &quot;pytest-metadata&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------8CB93AA411DC13574B0BE553--
