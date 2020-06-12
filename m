Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.60])
 by mx.groups.io with SMTP id smtpd.web12.21603.1591972849807786476
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 07:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aXZs0As2;
 spf=pass (domain: windriver.com, ip: 40.107.93.60, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nh9gdPQ5XWUjC7GvyFAM3MkEqak/PSCdDk8sb08/n21GGKQIaHvAODgRiOx+mEdnrCglJvyMq469VmWjrEUrFmL1iM5RdfSh/3boIr86/JaNg4jfuAcD/mwozOSEoELQVSD8aBM+7W2SsO9GWXk0pu4dckoF5oUkpqysA2QOcCjyPScaJXuPwg9tjd3eO4Gor7aOS38woyCTSz36nIye483kPV1f1NqzqTfFY1SRsTwCbX4Q3gahvSZn7L4UHtay9fab04kxNPHJEtpqaYe2c5VRwiHvUzULKx3cjeYO/7E8G/YX7KKtYCBu/5XllxopQIbCRZNEgNBusdE04IRtBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7golJepZvKuM+yFNrhYyrCwyJjbePvBzEsxasrIxKg=;
 b=LusLlHOwkTbGfPSltAQjBXdPH8yFCpXLmPBqPRO35SGovtAAMjaxLBstwcygNaFyqe38z0fTLOS5eH/jSlT4OulPGCxI1u4JxRXYizjYLeUVPoP4i6aMT3u+zQlTwzbJL+GXEdn4MGK6gaJTWlPxhjonWk1yeZCqPQI9++Yj/KdrNVkR17tgfSmWNUdgjwak8bOCMaLs4Tt+Y67Bw7gUFOyXrqs1Dj2HEJKPU7d4rpgk+MyYVZX2UIgPHeIz6eC2icBo5u/XiUdakFGF4/gY111IOVK6Q0buBWNdDB4VNXyQlnVTb8Ixz6TifOogiYVG4aX/c2UDqs20EzGb0HfSNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7golJepZvKuM+yFNrhYyrCwyJjbePvBzEsxasrIxKg=;
 b=aXZs0As2KqfF8wtKr7w+8rlz1s3H9Q2WSKZ8UwjHpTa8oLGOf/zPugFh/bYowS5+eqSSZTXV65y9WYlcOThTIE5pAWeO5PSxTGZvtf3P0GEvqTkt1371yg5WCdTJ1EEgwSn2Jaq0pL2s7lKm731MssbV91M146r5fbb6mySoJ0k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB1233.namprd11.prod.outlook.com (2603:10b6:404:44::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Fri, 12 Jun
 2020 14:40:48 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Fri, 12 Jun 2020
 14:40:48 +0000
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-packaging: Upgrade 20.3 -> 20.4
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200612094757.22146-1-leon.anavi@konsulko.com>
 <20200612094757.22146-2-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6c74c0c0-9e60-e549-f806-8e50880ba563@windriver.com>
Date: Fri, 12 Jun 2020 10:40:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200612094757.22146-2-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0100.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::9) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0100.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21 via Frontend Transport; Fri, 12 Jun 2020 14:40:48 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2145a806-ad0c-49f9-ca80-08d80ede9900
X-MS-TrafficTypeDiagnostic: BN6PR11MB1233:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB123338CE850369660E7876789F810@BN6PR11MB1233.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-Forefront-PRVS: 0432A04947
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BvjqFKgAgpflKVnpHBpYCjmptsz+e5dgAAEIJNFn/WQ0IaIAj4EaJUOGr9RCM5nGV5+rBD6no4jJM0yaBoWB0tXNqspvneOEcrmpKkrcMzd34OnovntiPMjyaY/6u7HJWhwpxD7tyC26fVB0bjZ4GMzsRvy37nYxbYdtJZc1XWB9DzcLpR0uc58qbSPWw5Nguk2zjDxdSFCkEw4GofQ1umYh3bHw2I5zR22hwWuQAEeNzMbm2c2+XQorO0wWCQec9obM8ZZE6Pj/gBODgIKb57MlnxDaGcSFAmTCA4DZEYuedNRqcqxWlakLPfkKSTquhUIC6vCjIoN1amK4ci+fPBi48RaY00qIM44onGtaXYbVSq3FEF7T7HUQwQXvw39rbWv46lklkqbcFbO7Vp4IERAqkruXWEt0lPVFlN01A9qWk630krsrr1pX0LTvWWe624zsbgTPr9ox6l0EtaktqA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39850400004)(346002)(396003)(376002)(366004)(6486002)(66946007)(31686004)(66476007)(66556008)(478600001)(16576012)(2906002)(966005)(316002)(36756003)(16526019)(5660300002)(83380400001)(53546011)(33964004)(26005)(186003)(31696002)(86362001)(8936002)(8676002)(2616005)(166002)(52116002)(44832011)(956004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	KnY/nO5s9Nz1K8e58duDtI3558VUquOyehMeMwdaLfL7MKtpBOVl36gwlcUrWlDCROtjvPq6uCa0vLvxbkr9PLU1sIujU5GmiggIztLJr01ocRpq5W1VS+jnZQP4vigB8DAPqCkhuNMvDcHYIvc0CEZX5vnNTDkBggGZsun5mtiNA14LsFEaVO34qgU6eFl0QDKjmG5TLD0d42FaszPdRvqh0sICHh0M4vbH5EXIaIPkxe0T5yRzA/ZR3uCXmxrVdgTtH14cwAsjAzKyD3XSdzQO+YY5tEF7Y9CDw+DNyBo6epqjpyyT60xwPH7S8YuaR/NPrp2JPGUtvLr/svoFq7PsmZmheGrwUskhD5RUU0ZQyxaHdqS0udzdL/ei0COs4cpSQlBpU4I6o+Gw4zQSYzoezBX7qMK3CVeAQ9oppJ96+IN/YdxxpqaesmFq/DuLwdVOHilfpkwak/Qvcru4aycwxME2DP69k4V9eQ1h3T36gpiQJjZTcPFhmJbt4dHd
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2145a806-ad0c-49f9-ca80-08d80ede9900
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2020 14:40:48.6908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s7YwtxxLELwowKMKzOWpmTBSs4LnUsCVECShWoxLKxVwv5fTbsW95KAAptZacUQocjmUnFNu6md2bTnFFeleH7fOFlgQL9jtYbSpFdKn2qs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1233
Content-Type: multipart/alternative;
 boundary="------------1DA7889AFB0F700E7B6E2E59"
Content-Language: en-US

--------------1DA7889AFB0F700E7B6E2E59
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/12/20 5:47 AM, Leon Anavi wrote:
> Upgrade to release 20.4 with the following improvements:
>
> - Canonicalize version before comparing specifiers
> - specifiers: don't rely on hashes for equality
> - Add a NewType for normalized names
> - Bug fixes
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../{python3-packaging_20.3.bb => python3-packaging_20.4.bb}  | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-packaging_20.3.bb => python3-packaging_20.4.bb} (70%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-packaging_20.3.bb b/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
> similarity index 70%
> rename from meta-python/recipes-devtools/python/python3-packaging_20.3.bb
> rename to meta-python/recipes-devtools/python/python3-packaging_20.4.bb
> index 9eee84b1b..0f78fd016 100644
> --- a/meta-python/recipes-devtools/python/python3-packaging_20.3.bb
> +++ b/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
> @@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/pypa/packaging"
>   LICENSE = "Apache-2.0 & BSD"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
>   
> -SRC_URI[md5sum] = "19e0d1f82a9007b448650ccfeffd0a26"
> -SRC_URI[sha256sum] = "3c292b474fda1671ec57d46d739d072bfd495a4f51ad01a055121d81e952b7a3"
> +SRC_URI[md5sum] = "3208229da731c5d8e29d4d8941e75005"
> +SRC_URI[sha256sum] = "4357f74f47b9c12db93624a82154e9b120fa8293699949152b22065d556079f8"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------1DA7889AFB0F700E7B6E2E59
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/12/20 5:47 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200612094757.22146-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 20.4 with the following improvements:

- Canonicalize version before comparing specifiers
- specifiers: don't rely on hashes for equality
- Add a NewType for normalized names
- Bug fixes

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200612094757.22146-2-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../{python3-packaging_20.3.bb =&gt; python3-packaging_20.4.bb}  | 4 &#43;&#43;--
 1 file changed, 2 insertions(&#43;), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-packaging_20.3.bb =&gt; python3-packaging_20.4.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-packaging_20.3.bb b/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-packaging_20.3.bb
rename to meta-python/recipes-devtools/python/python3-packaging_20.4.bb
index 9eee84b1b..0f78fd016 100644
--- a/meta-python/recipes-devtools/python/python3-packaging_20.3.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-packaging_20.4.bb
@@ -3,8 &#43;3,8 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://github.com/pypa/packaging">&quot;https://github.com/pypa/packaging&quot;</a>
 LICENSE = &quot;Apache-2.0 &amp; BSD&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=faadaedca9251a90b205c9167578ce91">&quot;file://LICENSE;md5=faadaedca9251a90b205c9167578ce91&quot;</a>
 
-SRC_URI[md5sum] = &quot;19e0d1f82a9007b448650ccfeffd0a26&quot;
-SRC_URI[sha256sum] = &quot;3c292b474fda1671ec57d46d739d072bfd495a4f51ad01a055121d81e952b7a3&quot;
&#43;SRC_URI[md5sum] = &quot;3208229da731c5d8e29d4d8941e75005&quot;
&#43;SRC_URI[sha256sum] = &quot;4357f74f47b9c12db93624a82154e9b120fa8293699949152b22065d556079f8&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------1DA7889AFB0F700E7B6E2E59--
