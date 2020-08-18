Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.86])
 by mx.groups.io with SMTP id smtpd.web12.66448.1597759602490789633
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 07:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gR2hlW6q;
 spf=pass (domain: windriver.com, ip: 40.107.243.86, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DYz2LomEm+qbUu9LnqCwcc2znEqJwRqEZEgoVzxfhsK3Ltawecdb/z2NrBLCHstOVy0Q9SYLTt5mTid3N0U2en5rMitCYiHsG3x/y+y3xdB4lsD8UAE5iUym3BDWT0Aw96VfgFWOkvS57WtVMM04ByordwFToLOI8XzCFDherWL3hDwwxx1h/Yg0hVQnIPz7V1ELP+ob16cnCUZ3L6p1HzxClPhaqs2cozMMU9bxyuPmMlp+hSixgAa0f08cvPU8EIYK+ADPt7Mpz/MOPl/2AKu9+D46Cf/aO43voAb/oUm8aWTDOeHFkAmBEVVMRSWI6XWX8py+0NJjYNHryo9vgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwshXnrF5aW+QYi0/DGeCFz/wDxyzuUE71e4/Ava1OI=;
 b=jcit05xaYhys7eQFTyGUFA7VEqcdGhfoMbadJYDZUrM1zByjf32AoRsJNm53AMpVEqc5wjc8yM0Sl2SsXvdrdx6mYvc3oKxh5PWVl9mB2+12ZmusfSPPCwDszzoZvFCB9OQonhufbEeVAGCcg+A9DS4GitNDF5wefIurAp/9mXdeBr5uR5GOheVJ+3/LqOlVB2lQHnvGvRHHnAsSuYnsAhU6ER8WrJZJXsM/I+Httiqp+pbIF6U44OOIy9Ou2t89SSeeoRbeFDL/oekjE62nSwnv3BB0Jrp3RqU9JhBDFegYrbE+wB6rBThgmXGyF4TBoeeOO5cawRK8fZRWLqbwvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xwshXnrF5aW+QYi0/DGeCFz/wDxyzuUE71e4/Ava1OI=;
 b=gR2hlW6qLc7BeSZVZQEYm2uYhJNaO7OOzE2R9VuXf2PrXkwcnhvJJhzwqY83d5ZyNo83vwpqGYzTjOKU9J8JCq5pXvhmPbjE8PlH1hky53207Jfua6gBcrZWmdhiUiNG6giAwMwqXdr/ZlAQCWr+jkkVx9F8gGsIeUKfLqazUhc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3398.namprd11.prod.outlook.com (2603:10b6:a03:19::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Tue, 18 Aug
 2020 14:06:40 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 14:06:40 +0000
Subject: Re: [oe] [meta-python][PATCH 04/10] python3-isort: Upgrade 5.3.2 -> 5.4.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
 <20200817112901.28914-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <48ed86be-defa-0530-8a33-3f168c0a616e@windriver.com>
Date: Tue, 18 Aug 2020 10:06:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200817112901.28914-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0149.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::28) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0149.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 14:06:39 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4897ac5-6eab-497d-9d1d-08d8437fed80
X-MS-TrafficTypeDiagnostic: BYAPR11MB3398:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3398586209AFD0831347F9249F5C0@BYAPR11MB3398.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yrVs39fx0YORrSyFKzjxilEmQ7YlUR1cu0VAC9XUM8f+DedsVqH8SgKc5lkU0oDMS+BFmVhl/5c0pluLWin+6NG9qaNPDmLbKfQ+P980KldoSTINpEfk2bmaK6GRDWxFh5L1mQBCiR0EqWmick2MGLXc32PK4yT6gxfrSJFguXRkrY8J8e0ixht54rJXkSGDZUCG3F6rbMTH582G3pgsosOuBUR5xUH1Ylf6jKqsAn1H34RE88200H3rs8PvL6JxfuW+SerssEN8mTW9iKfX6mSrerPYssyCT6Of7LiiYI+8B6QF5srG+ip6c55HfiHu4/BzER6XW+NF61GjF2CrE7xNkR2M8Kmu4jez4U2/dq+i4XehgrViNzcqjLs0SbrrZdlSJeTieF1wR4QkvHULibMB7U+CjJTa1jW4acgwB3W4lrkpTJXNC7OyZyVEn+sXlJg0Ap1bxezI/4VnTwF8Zw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(39850400004)(346002)(136003)(166002)(966005)(36756003)(31686004)(478600001)(956004)(2616005)(16576012)(6486002)(2906002)(66946007)(66556008)(44832011)(66476007)(316002)(5660300002)(53546011)(26005)(52116002)(31696002)(16526019)(86362001)(8676002)(8936002)(83380400001)(33964004)(186003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	p6Wkl4EHWEb5uCA+MeH9GNoLPkt1M9Dh+AaeCvOzyLtpRObOT4FqAXDWFgTRHWwT27jJUuAAHHayIeqYxo7CZhLkLgd6Drr7rymGcV8hHkCTIs0l3rbLopVYMckFWjomfaH6UWFLnLK5Aznanibf+cK8m7E4KnQivaix06/H9CH8TJMctbRyCRBfCTP42E+YFkSfQQcuZGyHSq6ngZnlE1YQ3xz0WAbA9p9MTCspR15mDv7FMHJJa98hEReWTMnPOFH59AZCk0CLmHEHwpLRQODUI2B45/DO4EkJFYESJly1l8feTzT//Oe6QmK40Vzw3wCnKEBzuXmHN1JOWC2K5kK2Z2zcnwfWkeIdVBnPDVcmZM7bwEC3Ito0H8R+drafImZ94as+F8zjoAVm8s+ls6F6VLVTKpuVcFPT4M4LD0uC1aQc+PVFfBWfVwsLKooEynPPHWg1kGlwPMgPAsDVdw0MPxrPjaDc5SupwOxcIl8NkkHIVzXzkMaWrpNq3UVVbVtTnvyK1mrVpMg5VzrUJSD8sbNyANIp4H/c3MEhsjgDiWT/gkUeS7DfALUqixjtEnJLz2C8sXoqS6stRJgGJxoqUqwwN48ou+N+mGP6Fg9N5Oo0qQtecYJk3GsT822L2r2EtFmzUvkAcT1w86w3jw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4897ac5-6eab-497d-9d1d-08d8437fed80
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 14:06:40.1139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fMjIGuy+aT54N3vPn8h9IExnGAHxQ5TC5A/TTetc735fNKVyCYDKIN2jSTwA1qDXtw92SpgKEm6g2Rd2UMamSFFN2DYvHSmV/iBiNkd5Wf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3398
Content-Type: multipart/alternative;
 boundary="------------9ABF261DD30641904B4E135B"
Content-Language: en-US

--------------9ABF261DD30641904B4E135B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/17/20 7:28 AM, Leon Anavi wrote:
> Upgrade to release 5.4.2:
>
> - Fixed: Known other does not work anymore with .editorconfig.
> - Fixed: Regression in first known party path expansion.
> - Fixed: --combine-as loses # noqa in different circumstances.
> - Implemented: support for length sort only of direct (AKA
>    straight) imports.
> - Fixed: --combine-as loses # noqa.
> - Fixed: --dont-order-by-type CLI broken.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-isort_5.3.2.bb => python3-isort_5.4.2.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-isort_5.3.2.bb => python3-isort_5.4.2.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-isort_5.3.2.bb b/meta-python/recipes-devtools/python/python3-isort_5.4.2.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-isort_5.3.2.bb
> rename to meta-python/recipes-devtools/python/python3-isort_5.4.2.bb
> index 2f1a9838e..6b1cee40d 100644
> --- a/meta-python/recipes-devtools/python/python3-isort_5.3.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-isort_5.4.2.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>   SECTION = "devel/python"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
>   
> -SRC_URI[md5sum] = "5ef33a4fe121b3f24493ad8ac450baac"
> -SRC_URI[sha256sum] = "ba83762132a8661d3525f87a86549712fb7d8da79eeb452e01f327ada9e87920"
> +SRC_URI[md5sum] = "59592b6e14beba48149d651e900e3815"
> +SRC_URI[sha256sum] = "d488ba1c5a2db721669cc180180d5acf84ebdc5af7827f7aaeaa75f73cf0e2b8"
>   
>   inherit pypi setuptools3
>   
>
> 

--------------9ABF261DD30641904B4E135B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/17/20 7:28 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200817112901.28914-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.4.2:

- Fixed: Known other does not work anymore with .editorconfig.
- Fixed: Regression in first known party path expansion.
- Fixed: --combine-as loses # noqa in different circumstances.
- Implemented: support for length sort only of direct (AKA
  straight) imports.
- Fixed: --combine-as loses # noqa.
- Fixed: --dont-order-by-type CLI broken.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200817112901.28914-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-isort_5.3.2.bb =&gt; python3-isort_5.4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.3.2.bb =&gt; python3-isort_5.4.2.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.3.2.bb b/meta-python/recipes-devtools/python/python3-isort_5.4.2.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.3.2.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.4.2.bb
index 2f1a9838e..6b1cee40d 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.4.2.bb
@@ -4,8 +4,8 @@ LICENSE = &quot;MIT&quot;
 SECTION = &quot;devel/python&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489&quot;</a>
 
-SRC_URI[md5sum] = &quot;5ef33a4fe121b3f24493ad8ac450baac&quot;
-SRC_URI[sha256sum] = &quot;ba83762132a8661d3525f87a86549712fb7d8da79eeb452e01f327ada9e87920&quot;
+SRC_URI[md5sum] = &quot;59592b6e14beba48149d651e900e3815&quot;
+SRC_URI[sha256sum] = &quot;d488ba1c5a2db721669cc180180d5acf84ebdc5af7827f7aaeaa75f73cf0e2b8&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------9ABF261DD30641904B4E135B--
