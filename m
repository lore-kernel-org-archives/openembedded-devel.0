Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.76])
 by mx.groups.io with SMTP id smtpd.web11.12098.1591799379009763054
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jun 2020 07:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=V0JZcNm5;
 spf=pass (domain: windriver.com, ip: 40.107.93.76, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DdNtKma8M/Hg035C9i0N0Ybhkuzqtb8dGKO0TeDpZskGjkLuAelnQNyskr0REgOymG6N9M1+W+bZvNkjSj/DW3rL7FvMJc/K/N8xe6Tv2Z88AkgxlQ8Lyo7c8aEedhGdDdnITFqK2tpnBIV04k3zY5BlBc/kObKhCTml5Xel5YEntuDgjEbb7daveTN1FyooEtQ9cruJRyiEaoQEUpFFOicF1qSG/brU4qyJm8T1QNTbDr3mV+1M3zUTXUonEebqllR/LLyTrZ5+odAwU/gf8aPLfBzxUGJln+sYxiqVNghIs8HqAlLsQPXM+s80o1nh5YMYhvdTa2zlKnQ7wXweyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5pdU9SltJhSexQM2IFKCUyUwAPvKWd0w57I6q5yKcA=;
 b=jLVcVcpF8RFnNhOAxC2tDpVtTCPHrWFY5qg++21++y9CDRJSrrW+pO1BXMMGxy4wq4fP0HSMqhfuXOX0DxnSbggJ4VOrDq1pzOjNzYfpoN5NjLwXlk3a+TSnZdelEHG91DC1tHlhBzEbk8HOsFMS5HO75533F/hVNLydMV+voTOsOHXcjXdo9p0/AFVuCJyQ9SZ3Pjo1AATxyWjaKpezzKF72ZKOTLfX8WIc12vfOIf1mCdfbOJ1BjoaIxEZLuXYYOR1AF+5Pn7l67pAJ5NB2cJBV9wwybSammWEjARvzfvJ4ighkthrW/4fe1T7jKUmJGeH0WJETpODAxZwWz4BNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5pdU9SltJhSexQM2IFKCUyUwAPvKWd0w57I6q5yKcA=;
 b=V0JZcNm5Z1NwBtJfyLMWBZk1jATgmOIr1gm2KRiNYZhwn6DRF/xIHNrH3v3HJjQAsKHOPkZONPskh/clT1EUoJRczQ/kswKVWvFRWm/xonMfCWGepAcFrYRSsNTx8pUURQGrF4Hynl/Ej/EtwOI02cU3L+1osdbeTjqpL4+D3Lo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN6PR11MB0003.namprd11.prod.outlook.com (2603:10b6:405:61::26)
 by BN6PR11MB3953.namprd11.prod.outlook.com (2603:10b6:405:7f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.19; Wed, 10 Jun
 2020 14:29:37 +0000
Received: from BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7]) by BN6PR11MB0003.namprd11.prod.outlook.com
 ([fe80::518f:1382:bbeb:91e7%4]) with mapi id 15.20.3088.021; Wed, 10 Jun 2020
 14:29:37 +0000
Subject: Re: [oe] [meta-python][PATCH 4/7] python3-humanfriendly: Upgrade 4.18 -> 8.2
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200608121410.5814-1-leon.anavi@konsulko.com>
 <20200608121410.5814-4-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <f959190e-1c88-62df-e5db-cc561f327856@windriver.com>
Date: Wed, 10 Jun 2020 10:29:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200608121410.5814-4-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::7) To BN6PR11MB0003.namprd11.prod.outlook.com
 (2603:10b6:405:61::26)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.16] (174.115.236.231) by YT1PR01CA0068.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18 via Frontend Transport; Wed, 10 Jun 2020 14:29:37 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ee69703-34ba-48da-d2f3-08d80d4ab456
X-MS-TrafficTypeDiagnostic: BN6PR11MB3953:
X-Microsoft-Antispam-PRVS: 
	<BN6PR11MB3953B65DEF6D3DAF13A372799F830@BN6PR11MB3953.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-Forefront-PRVS: 0430FA5CB7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rVinvZIIjkgGH76I9DhHLbuTAEuV9bR+be/RHjLfj4CZc8i/Tr2OcgUsiiQhm2Ia4PEG9N6oGB+LSm98n7g+G+9Ze0NUcm08LkpCthSx2GntlFH4GdoU+h3uE5eKzhncfhM9NfL0q6EgGY9af9gpNTriiJOC7QsNhalOngsZykqiNiXHZCYD0xMOWD03TdZgIrYM8Gm8TgHi/QrTOVFu6UB7k8jSeH3up8yEammsDFU3hpry8HLvoyV0yaJennoFU2iexQdJhQ66SYOqJTc9HXPNvbNMgpyDlccHdZdsH41JXOGhkJoKNPNKVl295Nxm+SkVfvPFsert6r71UyioMw+grUxxwy402TdU/2aIqWvh1k/sLmNIElt0Yg5X/FmNN4zB0Cqoaz1CIMSVX9TO/3m65Yv9r5mlvGv1g/ERIs9AlkxOjvZgeQmYKco81Lri7WSf7dhDWfwe+SMBzx++Ew==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB0003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(376002)(366004)(346002)(136003)(8676002)(8936002)(66556008)(66946007)(66476007)(5660300002)(31696002)(86362001)(31686004)(966005)(33964004)(36756003)(316002)(6486002)(166002)(478600001)(2906002)(2616005)(186003)(26005)(44832011)(83380400001)(53546011)(956004)(16576012)(16526019)(52116002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	CXS7y2KTPetPYkwLU5/pujV7C1NB8QiOT3+h7urxZLhx0ZwKyUqvSLBBIftthcvE5R00TiVE5bgMBFz6sYZHFORZxCTyCFNzFlicuhCWj59qZ+Dm2gWOnFShTTrYe3SWvqh3a2PeF0c8/w/Hb0h1cTljliklJ68usm5trm+hmx5jo7lPwzu5hTC69N2AJTWIlcD3lgIb2XSgo14SzF4XBnPYOIDmlAr2hiqBaC+H2qLRbocunKLBiE5OhgihGgfDwF8LryZ9B5CZlhodXnkJXbjbNhQInf+5HmRS3mqfTdDkSoBSnGVBiu3P1ukc2XVAM1hRpgkWbhYpyFgKDSY//Rp3tVCCQ8IuHK4IlpvEZTpIaI3l3v3TAbtfZl8cUhT7YQSOWg6Qddr95IxPP2GN61vEPWFP9aKytx60a4JVBWOkrtYplt9aIA5Lo49KKyZNQyRS7jPtAAmqi4idHhC6Xhlu+AD7o9XA9YaY8yaTnwc=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee69703-34ba-48da-d2f3-08d80d4ab456
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2020 14:29:37.9014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDexQpeI8VSpOBh5W+/LZLS5COqj2lssQELX93rUB3ckFoDXWHfauCSWivrkTI06IJeIB61J+pZINBaR+rJNZnv1RK/KVa3UkeO1hYyrhhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3953
Content-Type: multipart/alternative;
 boundary="------------E2583EBF6B79F278897180B6"
Content-Language: en-US

--------------E2583EBF6B79F278897180B6
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/8/20 8:14 AM, Leon Anavi wrote:
> Upgrade to release 8.2. Consolidate inc and bb files into a
> single bb file. The year in file LICENCE has been recently
> updated therefore the checksum has been changed but it still
> remains a MIT License.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../recipes-devtools/python/python3-humanfriendly_4.18.bb | 2 --
>   ...hon-humanfriendly.inc => python3-humanfriendly_8.2.bb} | 8 ++++----
>   2 files changed, 4 insertions(+), 6 deletions(-)
>   delete mode 100644 meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb
>   rename meta-python/recipes-devtools/python/{python-humanfriendly.inc => python3-humanfriendly_8.2.bb} (65%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb b/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb
> deleted file mode 100644
> index 2ca5fe36f..000000000
> --- a/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -inherit setuptools3
> -require python-humanfriendly.inc
> diff --git a/meta-python/recipes-devtools/python/python-humanfriendly.inc b/meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb
> similarity index 65%
> rename from meta-python/recipes-devtools/python/python-humanfriendly.inc
> rename to meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb
> index 94f7f8b81..61c969d76 100644
> --- a/meta-python/recipes-devtools/python/python-humanfriendly.inc
> +++ b/meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb
> @@ -2,14 +2,14 @@ DESCRIPTION = "Human friendly output for text interfaces using Python"
>   HOMEPAGE = "https://humanfriendly.readthedocs.io/"
>   SECTION = "devel/python"
>   LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=690da298a43805797a4fa7bbe180b3c6"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b"
>   
>   PYPI_PACKAGE = "humanfriendly"
>   
> -SRC_URI[md5sum] = "9573f9f37a5454d8205cfd1b9b8db9d2"
> -SRC_URI[sha256sum] = "33ee8ceb63f1db61cce8b5c800c531e1a61023ac5488ccde2ba574a85be00a85"
> +SRC_URI[md5sum] = "e6064a6fe099c4231c3e969ca5fea335"
> +SRC_URI[sha256sum] = "bf52ec91244819c780341a3438d5d7b09f431d3f113a475147ac9b7b167a3d12"
>   
> -inherit pypi
> +inherit pypi setuptools3
>   
>   RDEPENDS_${PN}_class-target += " \
>       ${PYTHON_PN}-datetime \
>
> 

--------------E2583EBF6B79F278897180B6
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/8/20 8:14 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200608121410.5814-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 8.2. Consolidate inc and bb files into a
single bb file. The year in file LICENCE has been recently
updated therefore the checksum has been changed but it still
remains a MIT License.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200608121410.5814-4-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../recipes-devtools/python/python3-humanfriendly_4.18.bb | 2 --
 ...hon-humanfriendly.inc =&gt; python3-humanfriendly_8.2.bb} | 8 &#43;&#43;&#43;&#43;----
 2 files changed, 4 insertions(&#43;), 6 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb
 rename meta-python/recipes-devtools/python/{python-humanfriendly.inc =&gt; python3-humanfriendly_8.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb b/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb
deleted file mode 100644
index 2ca5fe36f..000000000
--- a/meta-python/recipes-devtools/python/python3-humanfriendly_4.18.bb
&#43;&#43;&#43; /dev/null
@@ -1,2 &#43;0,0 @@
-inherit setuptools3
-require python-humanfriendly.inc
diff --git a/meta-python/recipes-devtools/python/python-humanfriendly.inc b/meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python-humanfriendly.inc
rename to meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb
index 94f7f8b81..61c969d76 100644
--- a/meta-python/recipes-devtools/python/python-humanfriendly.inc
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-humanfriendly_8.2.bb
@@ -2,14 &#43;2,14 @@ DESCRIPTION = &quot;Human friendly output for text interfaces using Python&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://humanfriendly.readthedocs.io/">&quot;https://humanfriendly.readthedocs.io/&quot;</a>
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;MIT&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=690da298a43805797a4fa7bbe180b3c6">&quot;file://LICENSE.txt;md5=690da298a43805797a4fa7bbe180b3c6&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b">&quot;file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b&quot;</a>
 
 PYPI_PACKAGE = &quot;humanfriendly&quot;
 
-SRC_URI[md5sum] = &quot;9573f9f37a5454d8205cfd1b9b8db9d2&quot;
-SRC_URI[sha256sum] = &quot;33ee8ceb63f1db61cce8b5c800c531e1a61023ac5488ccde2ba574a85be00a85&quot;
&#43;SRC_URI[md5sum] = &quot;e6064a6fe099c4231c3e969ca5fea335&quot;
&#43;SRC_URI[sha256sum] = &quot;bf52ec91244819c780341a3438d5d7b09f431d3f113a475147ac9b7b167a3d12&quot;
 
-inherit pypi
&#43;inherit pypi setuptools3
 
 RDEPENDS_${PN}_class-target &#43;= &quot; \
     ${PYTHON_PN}-datetime \
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E2583EBF6B79F278897180B6--
