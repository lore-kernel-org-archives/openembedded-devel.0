Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.85])
 by mx.groups.io with SMTP id smtpd.web12.12541.1598359437369628271
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 05:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=O2zR34/3;
 spf=pass (domain: windriver.com, ip: 40.107.223.85, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdKDtc4arNnwqxYFtZjwjyyJ2yxBR3JQrj8wZ14fw3bHtbz06Fi4kSJibgUk8WyR2Fb6HKbJ9pmWWFYwKs+EZEWnKFIV8YOReY9EaQ0sGZQUBYePIy/mxSRXPLJEMrzakJgXr/hZTiskpJ3USMTs0ZjhBEB3uSUgliqAQUcWfbJ1gvqDvVsEMoHHPM2aL7CaM70WZpD6MCrpwG9XWpFqcFFrx2X/CBtYlIGgM14/MzFIGOterRyAFdEwm+hRkgOpX3HgPFHyWyUvfoQ3ylNeQFk0nyFpA3LuYdVCzXGlQuKiJkvgTuv4DimTOL6cgtBjp5f/aP7IopPKdJ39HsP9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KGST4WqkK+Tj+5WBUa4EnNGp80Lqn/0Cv4EsrvfqPQ=;
 b=QBOKIRnxVP9robT2iLa/ojw2k/iQoVf9MrFcJ1h7ZHcMJy2JlSEjXdAeMCjPBQgGmu+evhdWjss0awZJNP/Jc3Cf598dBqr3tBFqd4iiBza0m3Lna1f4bW238qYjOjYekQPsKs3NpyHmVjeuKOz29Rwb2nOc/PjOawxSivYj7d/YMIrLokQnXe0kXPZLrhM6MwtA6BYD9bDuFdGx0L90iGWmM2tdbrzfLNokCNGm429BVW70GP1BDMVV3RUI6/wRJg8UllBcHoi/x39CJOFY8k4Deq3PGWDvHYm9mdazWE1O3KeU+RuQPIwtyB6gCtHlfPjxMUgVMCkFpGwqcoidMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KGST4WqkK+Tj+5WBUa4EnNGp80Lqn/0Cv4EsrvfqPQ=;
 b=O2zR34/3eEaI4xXUsBLqlEPwVHsJajWF7CN53WgI/X2yestsEQt7Jkt4cSc+rO+3eTdEAsiwdwDaH+h8BT1wJY5OfJZ8Ktcm1jiKEDOhDjvLKmXQsaw2nJa+2mmgdHt7ZeVB1Eo4pgsY1eLAPnyM6cCASduPqohJjwsd2MlViw8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4260.namprd11.prod.outlook.com (2603:10b6:a03:1ba::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 12:43:56 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3326.019; Tue, 25 Aug 2020
 12:43:56 +0000
Subject: Re: [oe] [meta-python][PATCH 1/5] python3-diskcache: Upgrade 4.1.0 -> 5.0.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200824091457.3360-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <2a59492e-bba7-107b-f2b4-071f2b63aa58@windriver.com>
Date: Tue, 25 Aug 2020 08:43:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200824091457.3360-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0151.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::30) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by YT1PR01CA0151.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Tue, 25 Aug 2020 12:43:55 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7c5bbe68-efb7-45ae-e501-08d848f487c5
X-MS-TrafficTypeDiagnostic: BY5PR11MB4260:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4260129CAE46A35948A47FBF9F570@BY5PR11MB4260.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:262;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	b5WX2PS/2MPdU5Et4HcPN/9Xw4VoBuXQRwApdROaLcz62v9d88BjsoyQCP6kXwPoKWuYzq4RzLULAxpjAYpvtgidDkjKbvI3hLtzC57UVyE24+CCwj5FtYmiAF8s/35xYBxcKOhil3ztwSej40SMB5rk05meiGAScszn29fajRTy5aXihIYFtSvpNoKWt68SqEBp3t8rRl+hGmUq14hj0p9JVxwObdHpDXWiY9fg3r0IH5icGnmxNVTab17xadQGm8cW/Aqp/uI1K4ohUgcwp4ZW8L7aNxQt/+37Dz3Q+J2wzbmpx4LRHpj385MFrPCRm3pNs38+wn48U2XxGeTCsIZB6Kfkf2bBMwi6YosSNdg/Xh7f6oRGijao5gNr7w5DVHb8wJ1DQvNUHFNfuSy3/tIBBBmIzMseIMw9ydnBDGdV+DgqbYfMYLXC5fngzKpiezwaWH4Mod2WdlIlbk4u2A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(376002)(39850400004)(346002)(86362001)(2616005)(956004)(53546011)(26005)(83380400001)(2906002)(8936002)(44832011)(478600001)(166002)(8676002)(36756003)(33964004)(966005)(186003)(66556008)(66476007)(52116002)(6486002)(66946007)(31696002)(5660300002)(316002)(31686004)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	c/xW77ULg4/otCynEyQz9RyUDDvs9n3h83UyqgIaVuOW6Kj+NJbt5IbOddZr8+zhDrCgcJWBG9RU1PDkxebmRe4yFvNYvRlmy7HHHiAkLLXMsZ+BEmc/2JK2sSq0xvtH0ueAKnIv7zUDbwSqtpSpt3bhRmqs+DF4N9ljKM2UfANnnY5PSOdCHwq1Ph9mt+Ihldo4t6OdsS4Kro6+JLjUkJlrnyr7amsFxIPJ873/X3bgU3Y68YCn7uAYYIxKzDk9QKeJxoWwuuMWuVji0j9GCJYb1rvze94Vcb0kxLkPXV4YTIuI/crJvyqI/TM7iDuABVsjgrDg/pUTxfEvnMj9v/b0bLNiK/jvUW9Ex/BdFCocdt3sDyD9OfajynSYEeS55SOxOVm7E8XCaTdCIvh9pyGDgvoLlO01g+lO2zTemEqvdbmaiskM8KKs2TyZuIeU50sY4OtQZpU4MCE5qaLlqS133LGLO/+ZzwgLjiFewv+XY6nGAxJbJvREzm+Cxptil5JoeWzvGL+1K3LqYwpqXF/2cnYILda35un+T6vv4n/r5lUCqZbX2iHfXYrl9azbrOgLVcPvv3SCG0RecJTHC3A1Uw+CtqsLm0ObF+14UMBgGlORKHYqbcfLCyAOpn4UVpoCX4zhD+DYUROptvsTZw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c5bbe68-efb7-45ae-e501-08d848f487c5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 12:43:56.1897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AKyHKzC4eNBd9mlaP031/KopDUfiH5A7bFmiJP0emsTl5xiBrBXiPdPlb7Fi7QirpC4iej6FWRTnziZT5RhQt4/wlAYc3pYT3m8DvhAoYPk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4260
Content-Type: multipart/alternative;
 boundary="------------FB1870D116E5C1430C5D1D93"
Content-Language: en-US

--------------FB1870D116E5C1430C5D1D93
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/24/20 5:14 AM, Leon Anavi wrote:
> Upgrade to release 5.0.1:
>
> - Drop Python 2.7 and 3.4 testing and add 3.8
> - Use unittest.mock in tests
> - Remove unused "env" setting from pytest section
> - Remove nose references
> - Add locked method to Lock
> - Add paragraph to caveats about cache volume for Issue
>
> License-Update: Update year
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...ython3-diskcache_4.1.0.bb => python3-diskcache_5.0.1.bb} | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-diskcache_4.1.0.bb => python3-diskcache_5.0.1.bb} (50%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb
> similarity index 50%
> rename from meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb
> rename to meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb
> index 91cff0cd1..9f92fde22 100644
> --- a/meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb
> @@ -1,10 +1,10 @@
>   DESCRIPTION = "Disk Cache -- Disk and file backed persistent cache."
>   HOMEPAGE = "http://www.grantjenks.com/docs/diskcache/"
>   LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=9e046ce8fae71087134866418f646ec3"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68"
>   
> -SRC_URI[md5sum] = "21c9945e7707799e1c64956f8a54d4c3"
> -SRC_URI[sha256sum] = "bcee5a59f9c264e2809e58d01be6569a3bbb1e36a1e0fb83f7ef9b2075f95ce0"
> +SRC_URI[md5sum] = "5c8c5789f584a36eacc7240921eee35c"
> +SRC_URI[sha256sum] = "b24a2da03d6a45edcec14ea6ef7129ddf0de78f04497557308d1461753d90633"
>   
>   PYPI_PACKAGE = "diskcache"
>   
>
> 

--------------FB1870D116E5C1430C5D1D93
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/24/20 5:14 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200824091457.3360-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.0.1:

- Drop Python 2.7 and 3.4 testing and add 3.8
- Use unittest.mock in tests
- Remove unused &quot;env&quot; setting from pytest section
- Remove nose references
- Add locked method to Lock
- Add paragraph to caveats about cache volume for Issue

License-Update: Update year

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200824091457.3360-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...ython3-diskcache_4.1.0.bb =&gt; python3-diskcache_5.0.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-diskcache_4.1.0.bb =&gt; python3-diskcache_5.0.1.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb b/meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb
rename to meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb
index 91cff0cd1..9f92fde22 100644
--- a/meta-python/recipes-devtools/python/python3-diskcache_4.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-diskcache_5.0.1.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = &quot;Disk Cache -- Disk and file backed persistent cache.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://www.grantjenks.com/docs/diskcache/">&quot;http://www.grantjenks.com/docs/diskcache/&quot;</a>
 LICENSE = &quot;Apache-2.0&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=9e046ce8fae71087134866418f646ec3">&quot;file://LICENSE;md5=9e046ce8fae71087134866418f646ec3&quot;</a>
+LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68">&quot;file://LICENSE;md5=c985b6a9269e57a1073d5f142d68eb68&quot;</a>
 
-SRC_URI[md5sum] = &quot;21c9945e7707799e1c64956f8a54d4c3&quot;
-SRC_URI[sha256sum] = &quot;bcee5a59f9c264e2809e58d01be6569a3bbb1e36a1e0fb83f7ef9b2075f95ce0&quot;
+SRC_URI[md5sum] = &quot;5c8c5789f584a36eacc7240921eee35c&quot;
+SRC_URI[sha256sum] = &quot;b24a2da03d6a45edcec14ea6ef7129ddf0de78f04497557308d1461753d90633&quot;
 
 PYPI_PACKAGE = &quot;diskcache&quot;
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------FB1870D116E5C1430C5D1D93--
