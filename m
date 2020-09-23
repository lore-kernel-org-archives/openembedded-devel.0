Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.67])
 by mx.groups.io with SMTP id smtpd.web12.13133.1600866704584189921
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2020 06:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=XGprOQGm;
 spf=pass (domain: windriver.com, ip: 40.107.93.67, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTmXDbfGgwZvIFlCF+XQVpt9ifXtXyqJREWFkCl66kVNOPObGh5wcIPdQAHJyNLBwdscH0f6nEHtm7q+gsaq2Zk6StV7s5xUaT8R+VJBzfuid88mRmRB398+cw9DmMW+unA/fuCwJFgDqGB+KvS1ElR6047aZDiz4TcXULc+lKlm4Hy3HSCWoee4re0omwiqRwz0gank1TqPlOCIGu1VcBrZj51jDR+ZWxawtFA9HuQvylmpACWi9206uAx/zm2HLNo3+unEGYl5BUov6r4rPo2UcsJSbxdJuCeGF6tPYFfjh37/eKPHvv9n6NmT6b4r9Id8mcuTbNlpVSTgsAM8vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5Hd0cdhXi7flmlJ97J8WgCzQBvNjDbpjJTNkpiWzcI=;
 b=YMgJzzvLVltHJEvHqAYlbxLjRz4psfT4tT3Jc0DBjcxWCih3h9CskLRKKtTZBk3qbzowitIci3QLXJTsX35xoGOHBpp4Isp2KeD4KenlzYRNFua05V3W7R75bNu76g2c6Gi2FpiwviNGf++ZcTUIErasnnh+5iIhAtWo6nj/+xi3+CXY++5gq2H+l20ejBFzSucpuaItI6Kv3Rz4ZZ+dmXe+qGTlE0Ug1rQpwg8mNgSjThMMnC0hz5K6Sy92yBsf2cConrFhq5paggX/8WBk3MDpWKl9i1XknQtZzUlXA8oTFYYTdTxvMLV7xWBQfRXmZfdj1Yi34bEcXlrSQTA4kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c5Hd0cdhXi7flmlJ97J8WgCzQBvNjDbpjJTNkpiWzcI=;
 b=XGprOQGmubjOzN9d2TfKaSP4wKUq0MB6qIKHO+S/UfqDFZzVQdANsK2z1kQOh3Q3wvuTER2MG/UyxKUeihVm81hmDfQu9N9gjoSCR7dEKoPx+wTS0qcjC1fGbcCpetc0HvtH7VFdfsSiS+12aXAtv1AehAgz0q1xLwYWQT3S1IM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BY5PR11MB4103.namprd11.prod.outlook.com (2603:10b6:a03:18c::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Wed, 23 Sep
 2020 13:11:42 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::50e6:fd64:b821:78e8%7]) with mapi id 15.20.3391.026; Wed, 23 Sep 2020
 13:11:42 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-isort: Upgrade 5.5.2 -> 5.5.3
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200921134405.676-1-leon.anavi@konsulko.com>
 <20200921134405.676-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <a61b4a1c-2f91-12ea-1424-ee7b3858416d@windriver.com>
Date: Wed, 23 Sep 2020 09:11:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200921134405.676-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::47) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by YTOPR0101CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22 via Frontend Transport; Wed, 23 Sep 2020 13:11:41 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b6f3997-8635-4f0b-101b-08d85fc236eb
X-MS-TrafficTypeDiagnostic: BY5PR11MB4103:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB41033474B277FFE13483920B9F380@BY5PR11MB4103.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:568;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TQMCRPenTVhwzeBKwIpjZq/jgWJdPM4b7t8VTVPDMEZ7OrJd3W/T+8WYpk04E2t3I3oJtZHfRBs78HeuegwSJpHQ6sXr27BitDf9Tpx3yjA2mHSTpWmqexVTr6uSJBWF3qr5/kmepxiQOm9R9Gz3fPfaAUnkaFu9RjanFFaawGZYsXuz73YBDwpWe9lKp8GqMV5jZCH+j8Y1OTo5TlrX1aTXLFZO3wRnSZRllEq6a6Tkh9iYmDrYl8iG8Emqz+VU773ub14RGs98LWxViJfye9GmYQIMl084wG/+Qz5xdhBzqGJe5FVuNdFiNKRZoyb+dPu/DOCTxHbynz+xZHgXZBTZFxLAkd/ZfglcyTODgFfR5kNMxZhz/FJRmtpBCXjuwd6F6SSgsC5Grdf8z2Axodb7RHzlFnthKwAywkEHQ4pydXAj8f7FIUAtVdCUtJsM+oqjAnf4Qc+2Qlg06Hf5dyPkkGvKNvqBpfg3SXjhUTWNyfgopPnl31pxaShOOTth
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39850400004)(376002)(396003)(136003)(2906002)(33964004)(316002)(16576012)(5660300002)(36756003)(478600001)(52116002)(66946007)(66476007)(8676002)(66556008)(83380400001)(53546011)(966005)(956004)(31686004)(86362001)(2616005)(6666004)(6486002)(31696002)(8936002)(44832011)(166002)(186003)(16526019)(26005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	GHq5CwfPjl9KbtLkTDwCcBZRNycZhK4gQxbg80Xht18rtpHSADTHDpfaL8YgWeEtU5axlYdB45bJVyGobYnmEbKispj3m3eYVPp587WJjipl/NSTKrs7uOLdxeGBy+isaWzF/JMa0P3NRrl3YN9D2Olvn4lF1Dgk/oi7m4bro+3NMXKJ1dcpQ3Mv3h0DiPI2cRcFVyaFmKTIL5za47sLt4JQeqjCqRDCfR10XYxDOlq2LgRJy1Ag3FG+xHHUQ5TDzw3B0GIyK5rlLargsg2TXp0yBBIafsZkSJTMJkWcggfhHKUp8wjtADoZITG7NFfjI89hrOY7/VkzJ35RSPRV1IiY8EUXWBjWDgMC6Je+oOtgD06NRq49yHRMmv29gbdPDU6s1PvBTT2HnidQ/66B8LC4THEB2aw4ExGb+lTt/gaVA6F1YShTxunfbj4ZLO+jNyOd0LR1ViiBYcYYh2+Yq+ek1FGS/M6ik7n35dmj9DI4yUM71sroMLngiEE5xHlrq2ntN53vSk6a2hdSrNMQ2wJo8sD2DrVCCgzs1ooiw2DUT6cX7lU0TTr6gvEwQaFEzmNPvvKRrt4GgBrbubwk5WRL8LIMiCBJ4FPLKQY4zZEpBy0L+DxlHrscrbwtoUnIpROME5mqg65CaKk1kc5fUg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b6f3997-8635-4f0b-101b-08d85fc236eb
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2020 13:11:42.3873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +h7SoWTR8djgM2krAMm2XfSHpee7A3UQwUDwZ3zj89wsL5obfYtjfkSEY4la543llqDI7/fbke+0IV9FalK8jLTpVdMM6RToQK51S38/yDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4103
Content-Type: multipart/alternative;
 boundary="------------649B125B89D2A51CC5093983"
Content-Language: en-US

--------------649B125B89D2A51CC5093983
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/21/20 9:44 AM, Leon Anavi wrote:
> Upgrade to release 5.5.3:
>
> - Bug fix: in rare cases isort can mangle yield from or raise
>    from statements.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-isort_5.5.2.bb => python3-isort_5.5.3.bb} | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-isort_5.5.2.bb => python3-isort_5.5.3.bb} (73%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-isort_5.5.2.bb b/meta-python/recipes-devtools/python/python3-isort_5.5.3.bb
> similarity index 73%
> rename from meta-python/recipes-devtools/python/python3-isort_5.5.2.bb
> rename to meta-python/recipes-devtools/python/python3-isort_5.5.3.bb
> index 0d04157862..00978ec59d 100644
> --- a/meta-python/recipes-devtools/python/python3-isort_5.5.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-isort_5.5.3.bb
> @@ -4,8 +4,8 @@ LICENSE = "MIT"
>   SECTION = "devel/python"
>   LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
>   
> -SRC_URI[md5sum] = "844c49ad1bf16a957b490c27b3b9844f"
> -SRC_URI[sha256sum] = "171c5f365791073426b5ed3a156c2081a47f88c329161fd28228ff2da4c97ddb"
> +SRC_URI[md5sum] = "5200f5b09a2a648775d0e8dbf0c0d3c8"
> +SRC_URI[sha256sum] = "6187a9f1ce8784cbc6d1b88790a43e6083a6302f03e9ae482acc0f232a98c843"
>   
>   inherit pypi setuptools3
>   
>
> 
>

--------------649B125B89D2A51CC5093983
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/21/20 9:44 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200921134405.676-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 5.5.3:

- Bug fix: in rare cases isort can mangle yield from or raise
  from statements.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200921134405.676-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-isort_5.5.2.bb =&gt; python3-isort_5.5.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.5.2.bb =&gt; python3-isort_5.5.3.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.5.2.bb b/meta-python/recipes-devtools/python/python3-isort_5.5.3.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-isort_5.5.2.bb
rename to meta-python/recipes-devtools/python/python3-isort_5.5.3.bb
index 0d04157862..00978ec59d 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_5.5.3.bb
@@ -4,8 +4,8 @@ LICENSE = &quot;MIT&quot;
 SECTION = &quot;devel/python&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489">&quot;file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489&quot;</a>
 
-SRC_URI[md5sum] = &quot;844c49ad1bf16a957b490c27b3b9844f&quot;
-SRC_URI[sha256sum] = &quot;171c5f365791073426b5ed3a156c2081a47f88c329161fd28228ff2da4c97ddb&quot;
+SRC_URI[md5sum] = &quot;5200f5b09a2a648775d0e8dbf0c0d3c8&quot;
+SRC_URI[sha256sum] = &quot;6187a9f1ce8784cbc6d1b88790a43e6083a6302f03e9ae482acc0f232a98c843&quot;
 
 inherit pypi setuptools3
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------649B125B89D2A51CC5093983--
