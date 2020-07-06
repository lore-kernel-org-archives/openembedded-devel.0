Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.53])
 by mx.groups.io with SMTP id smtpd.web11.60927.1594050600818779406
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WFY9UDys;
 spf=pass (domain: windriver.com, ip: 40.107.244.53, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cH5k2x4H0/HqPrciAAjD2rxnpJTlX6GvVzQvsz/T++JJCVSDnEk3Rp4o6hFTIyuBL4Kd0ix5p+uYKfdFikdsGGbjnZNgsJZr7PYcXuIvv2++DxEF4w4/r5iD6UTz3i/D7mUJ/4M2yQkSqtW6lNcKQ5S3JPsXD6DQvO6hVZLdMz+W7dT1ff3sg12S33Y8MEreZ03de4Z0JNUN2bbFh76V0Z4whCFBQf9APgvPhQL8EKaO0n9mv3hspJ8rhuIALMzJLYVTaFxgLPD2jSl6t981E0rn5vcGxYGkOhwZMx56zC8oXlUmCaYdwG/YAA2tMleIDU4HU2zblqnsyALdDV9zRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0IM56XWBBtCX1z2jl/eIkQ8JUMJueME+Qaxc2b7apI=;
 b=fEgOPDQ0XDMxBSuyRtmKoHHjYe6p9FimBbvK81hP5isyFPm6eevLhDbNIwzrUbt4OXjGmZbml2/jUQtRSHjiKIQhwoWrkK8ju2oVCDyBY+UU67v9BI/d80ll47K5PTJksg0f+Ou+uYU7zLgLqUB23oXNcCHauxXGKA/DkMKb+DE4kHcdKci23qNqnchwLcbXau3vb8dUgs5sROCwM6ccB8T4nlxpu784cMAOOE69tloRg6Schzg1p+qFBaSDi94sMPuwqfU/uD3GmWsA2dBJ4Yl7ZI2B49eo296DzIMsNiiXGZAEgedDIcEx4Wy6EklbdcR+V4WqG+EIBf9HG/IDAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B0IM56XWBBtCX1z2jl/eIkQ8JUMJueME+Qaxc2b7apI=;
 b=WFY9UDys2U6NZTsUPM+oSRVggjVCrY0WdAvnROhoVVYI5otzlBtYAe9odz/i5pYoz91t4TOoBxx2i0JzNVSu2rLn4dG9i27Dmknx2s0J5IFVCyfP5qsdT8RwvERjDlpJ6w5FbOMVqEqM+RUdKhijG/OreDWY5xKgrAK02j7e54c=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM5PR11MB1899.namprd11.prod.outlook.com (2603:10b6:3:10b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.27; Mon, 6 Jul 2020 15:49:59 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:49:59 +0000
Subject: Re: [oe] [meta-python][PATCH 09/10] python3-pyasn1-modules: Upgrade 0.2.7 -> 0.2.8
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200703093020.3514-1-leon.anavi@konsulko.com>
 <20200703093020.3514-9-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <e70976c4-ab47-0bc7-ac08-7f7275bab3aa@windriver.com>
Date: Mon, 6 Jul 2020 11:49:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200703093020.3514-9-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTXPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::45) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTXPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::45) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Mon, 6 Jul 2020 15:49:59 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c461599-4b29-4b2f-3177-08d821c43d37
X-MS-TrafficTypeDiagnostic: DM5PR11MB1899:
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB189967806CE2BB66FC24EE279F690@DM5PR11MB1899.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VEltfdPxUCIqlFgcMhO6FOEBasbsVFxXevbGwneKKbAf0UXr+LxVycOUI+Ie40yr2EQeGNIgWk3K0fvU5qt8pLVyKZ6GxhZ3tFhfsP5MpvP3uGhMS3A5LUJ2ccxFPf/6dj6GJlmEpnTg6PMVIEV3HaxI5eTY2cCAemsdUZ3yj8o7X2f4PJoQuGz8rqfuOG7vMkWaYlpZSSe4YOuj25MwCmY8MRHd+HQq8JV5+QeDfULUku6rOq8CbGTQ1MoZ7RRoU0l0ZVsrd3+hYUhyViql2Gw8xvSw4NyffRG5+KrRlUMheN5cr9qqctKPlfUp/FpctnjP/6eNkcp634P/MZtTHUS6oKNw+wKs58wT0FCJjOj4A+cJzGLDu1D7NtBeVn26br83sMBJKIn/m1OR4Pdy1HiKOi8lCg7kswBn1ooJfSfJkhOoQY4c7swfRZLvbl+avSYuLyAmVbqepgpOmFjxVw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(346002)(376002)(366004)(39850400004)(136003)(16576012)(5660300002)(31686004)(478600001)(86362001)(83380400001)(31696002)(6486002)(966005)(36756003)(316002)(66574015)(956004)(2616005)(186003)(16526019)(33964004)(44832011)(166002)(52116002)(8936002)(8676002)(66946007)(66476007)(66556008)(2906002)(53546011)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	0PO52UL1Vfsb0lLgU4nIa8KQLHBIsWJNf7pExuT3np/QIromCVq8dZnrLIDABxF/kr2HmLeow1Hl/3DHG1MEaIvqEaN6XrxFiXP9cM31iC1c5cFlj3yFIAaui7UuWorq2wsn8aAasKcdZwB+saJ2rJSeBOfM4vD6vuDqIZG/4yO087m1FIVcEIL23jYY7OzMgeJnloGt+UDjiDXMni5m9w6+0Sec/eRjkgucyJQHNV0t/eR9rt2O4joMCScWIayK7ZkC/4PQSDx7HN1c0skWhc0r1PzFYHTUKE4TxlZ92SzPM/PDlld5rHmGRk/LNSWKDMLC20KgPkAZ//uCw9KTgZ0qga978ng2LfPwzBKxvezqE9d62k02Cbplh9CAuQk9HrztK3MuGVlbz4bnpCmVQ3/HDSm30TtzdS1oVAQghRubk66Zzr8mOxrr0bQ2GyrpNhAtqKVRkv5BOJgZsUOx5ZjnT8JjmEzTLn7J5ph8cldeHObPtYfxf5uFez8EgVS6
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c461599-4b29-4b2f-3177-08d821c43d37
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:49:59.8298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g6jBweEGCMeEH6kUmDjH967GRLtVxB0cIejz0fser2ZIDqYwCWwPZuMGoHscqPtwQAa9WhiBoArMn0e52ELRLZJO4AtARxv9VqPcoAVLplo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1899
Content-Type: multipart/alternative;
 boundary="------------75E5BD3248423DF5A7E6F74C"
Content-Language: en-US

--------------75E5BD3248423DF5A7E6F74C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/3/20 5:30 AM, Leon Anavi wrote:
> Upgrade to release 0.2.8:
>
> - Improve test routines for modules that use certificate extensions
> - Improve test for RFC3709 with a real world certificate
> - Added RFC7633 providing TLS Features Certificate Extension
> - Added RFC7229 providing OIDs for Test Certificate Policies
> - Added tests for RFC3280, RFC3281, RFC3852, and RFC4211
> - Added RFC6960 providing Online Certificate Status Protocol (OCSP)
> - Added RFC6955 providing Diffie-Hellman Proof-of-Possession Algorithms
> - Updated the handling of maps for use with openType for RFC 3279
> - Added RFC6486 providing RPKI Manifests
> - Added RFC6487 providing Profile for X.509 PKIX Resource Certificates
> - Added RFC6170 providing Certificate Image in the Internet X.509 Public
>    Key Infrastructure, and import the object identifier into RFC3709.
> - Added RFC6187 providing Certificates for Secure Shell Authentication
> - Added RFC6482 providing RPKI Route Origin Authorizations (ROAs)
> - Added RFC6664 providing S/MIME Capabilities for Public Keys
> - Added RFC6120 providing Extensible Messaging and Presence Protocol
>    names in certificates
> - Added RFC4985 providing Subject Alternative Name for expression of
>    service names in certificates
> - Added RFC5924 providing Extended Key Usage for Session Initiation
>    Protocol (SIP) in X.509 certificates
> - Added RFC5916 providing Device Owner Attribute
> - Added RFC7508 providing Securing Header Fields with S/MIME
> - Update RFC8226 to use ComponentPresentConstraint() instead of the
>    previous work around
> - Add RFC2631 providing OtherInfo for Diffie-Hellman Key Agreement
> - Add RFC3114 providing test values for the S/MIME Security Label
> - Add RFC5755 providing Attribute Certificate Profile for Authorization
> - Add RFC5913 providing Clearance Attribute and Authority Clearance
>    Constraints Certificate Extension
> - Add RFC5917 providing Clearance Sponsor Attribute
> - Add RFC4043 providing Internet X.509 PKI Permanent Identifier
> - Add RFC7585 providing Network Access Identifier (NAI) Realm Name
>    for Certificates
> - Update RFC3770 to support openType for attributes and reported errata
> - Add RFC4334 providing Certificate Extensions and Attributes for
>    Authentication in PPP and Wireless LAN Networks
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...yasn1-modules_0.2.7.bb => python3-pyasn1-modules_0.2.8.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-pyasn1-modules_0.2.7.bb => python3-pyasn1-modules_0.2.8.bb} (83%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.8.bb
> similarity index 83%
> rename from meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb
> rename to meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.8.bb
> index f2a836b04a..dd39e8c405 100644
> --- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.8.bb
> @@ -6,8 +6,8 @@ HOMEPAGE = "https://github.com/etingof/pyasn1-modules"
>   LICENSE = "BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a14482d15c2249de3b6f0e8a47e021fd"
>   
> -SRC_URI[md5sum] = "18c77d56abeef631d94f95ff2d652859"
> -SRC_URI[sha256sum] = "0c35a52e00b672f832e5846826f1fb7507907f7d52fba6faa9e3c4cbe874fe4b"
> +SRC_URI[md5sum] = "107e1ece7d0a41d782f69f8a95a4d9bc"
> +SRC_URI[sha256sum] = "905f84c712230b2c592c19470d3ca8d552de726050d1d1716282a1f6146be65e"
>   
>   inherit pypi ptest setuptools3
>   
>
> 

--------------75E5BD3248423DF5A7E6F74C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/3/20 5:30 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200703093020.3514-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 0.2.8:

- Improve test routines for modules that use certificate extensions
- Improve test for RFC3709 with a real world certificate
- Added RFC7633 providing TLS Features Certificate Extension
- Added RFC7229 providing OIDs for Test Certificate Policies
- Added tests for RFC3280, RFC3281, RFC3852, and RFC4211
- Added RFC6960 providing Online Certificate Status Protocol (OCSP)
- Added RFC6955 providing Diffie-Hellman Proof-of-Possession Algorithms
- Updated the handling of maps for use with openType for RFC 3279
- Added RFC6486 providing RPKI Manifests
- Added RFC6487 providing Profile for X.509 PKIX Resource Certificates
- Added RFC6170 providing Certificate Image in the Internet X.509 Public
  Key Infrastructure, and import the object identifier into RFC3709.
- Added RFC6187 providing Certificates for Secure Shell Authentication
- Added RFC6482 providing RPKI Route Origin Authorizations (ROAs)
- Added RFC6664 providing S/MIME Capabilities for Public Keys
- Added RFC6120 providing Extensible Messaging and Presence Protocol
  names in certificates
- Added RFC4985 providing Subject Alternative Name for expression of
  service names in certificates
- Added RFC5924 providing Extended Key Usage for Session Initiation
  Protocol (SIP) in X.509 certificates
- Added RFC5916 providing Device Owner Attribute
- Added RFC7508 providing Securing Header Fields with S/MIME
- Update RFC8226 to use ComponentPresentConstraint() instead of the
  previous work around
- Add RFC2631 providing OtherInfo for Diffie-Hellman Key Agreement
- Add RFC3114 providing test values for the S/MIME Security Label
- Add RFC5755 providing Attribute Certificate Profile for Authorization
- Add RFC5913 providing Clearance Attribute and Authority Clearance
  Constraints Certificate Extension
- Add RFC5917 providing Clearance Sponsor Attribute
- Add RFC4043 providing Internet X.509 PKI Permanent Identifier
- Add RFC7585 providing Network Access Identifier (NAI) Realm Name
  for Certificates
- Update RFC3770 to support openType for attributes and reported errata
- Add RFC4334 providing Certificate Extensions and Attributes for
  Authentication in PPP and Wireless LAN Networks

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200703093020.3514-9-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...yasn1-modules_0.2.7.bb =&gt; python3-pyasn1-modules_0.2.8.bb} | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyasn1-modules_0.2.7.bb =&gt; python3-pyasn1-modules_0.2.8.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.8.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.8.bb
index f2a836b04a..dd39e8c405 100644
--- a/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.7.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-pyasn1-modules_0.2.8.bb
@@ -6,8 &#43;6,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/etingof/pyasn1-modules">&quot;https://github.com/etingof/pyasn1-modules&quot;</a>
 LICENSE = &quot;BSD-2-Clause&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=a14482d15c2249de3b6f0e8a47e021fd">&quot;file://LICENSE.txt;md5=a14482d15c2249de3b6f0e8a47e021fd&quot;</a>
 
-SRC_URI[md5sum] = &quot;18c77d56abeef631d94f95ff2d652859&quot;
-SRC_URI[sha256sum] = &quot;0c35a52e00b672f832e5846826f1fb7507907f7d52fba6faa9e3c4cbe874fe4b&quot;
&#43;SRC_URI[md5sum] = &quot;107e1ece7d0a41d782f69f8a95a4d9bc&quot;
&#43;SRC_URI[sha256sum] = &quot;905f84c712230b2c592c19470d3ca8d552de726050d1d1716282a1f6146be65e&quot;
 
 inherit pypi ptest setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------75E5BD3248423DF5A7E6F74C--
