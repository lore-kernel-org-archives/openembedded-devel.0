Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.43])
 by mx.groups.io with SMTP id smtpd.web10.66975.1597759565073092239
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 07:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GkyDq1a+;
 spf=pass (domain: windriver.com, ip: 40.107.223.43, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMbNv0wHy++ULQgjqbAKVZhDDl8IPjEfSrELzVdM3Q9KGTNuKz/XN953VXv9Zm+ucd1J/2qND8URmGJVJanUL7nnfdr4RNkY2RS7JK/KmSpKWXskfmJLwFsQX9EzsaFHM0MTOsWoGcRaZoEIJWMFENIppJCPGevpHLaNTTKMvq/uF2wGmu5UIa4TKvVJOT2jZq8eOf5kwFFti8xWVfT0GTzRykcGTj3NlsKWjX5g1Xc6DzVMR9fdU59aW1fSIwvMmEBQNtuieJeaFTqt/2lGX3kJwOtyUPFeCvEIlw+o2mAbRpcAG3V4NX3uL3yx3s18yrX3TOAWyb91IiZPW/B1Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7t2S0HM0CPIhCHa05hLPga9GANzSLOZNgWG4cMr4TA=;
 b=WNZCblzEN3N6yHUrORcGKkb1j6Pl7ObTYdkgTgOxzlpB1Gzvp7hF1gq4GcW0hp8qj+MBN8wC2N0mklrt3L80+gJtyf+7LCveTTnI2427HAcpmXeWzQFlpHSI06rXUfbk1+ctab9BOq5Hfwm+M7Yqq7PPpXyvT7O/kxVH7nWzrPych0MBQQioPP+xdj6xGbJ+RdEw9F0jthLg7Ts6HA5RYA/+aRWqRlccHuKRW1t3i9ZqugpWknlXeDT08WtKCcJ5oqJ0KvbtobHV1cVGXFqTbTxdtvX2swl0t58VCk2xZIdVGz6oKR8VlGqfi/K4R7cqohxsP31/yc/jVlWF0aTN7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x7t2S0HM0CPIhCHa05hLPga9GANzSLOZNgWG4cMr4TA=;
 b=GkyDq1a+7K8JkWv/tesS5f50/w+6a5hdfPDdWpnXi3PkvpSTn0AD0mECQKc++1FZrYptEPyXXbzadh5XWmngjUbeOWezX5VHN+SO6WydschNxBQnwABSU3yTxrTKjeovZATT+qj2w0XrKllH+d30VPMztkP7+IETWjeycZ8QZsk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB2726.namprd11.prod.outlook.com (2603:10b6:a02:be::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Tue, 18 Aug
 2020 14:06:03 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3283.028; Tue, 18 Aug 2020
 14:06:03 +0000
Subject: Re: [oe] [meta-python][PATCH 01/10] python3-matplotlib: Upgrade 3.3.0 -> 3.3.1
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200817112901.28914-1-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <5945aa2b-35f1-7083-5df3-e623a06ae046@windriver.com>
Date: Tue, 18 Aug 2020 10:06:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200817112901.28914-1-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0140.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::19) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0140.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16 via Frontend Transport; Tue, 18 Aug 2020 14:06:02 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32b2cf76-db69-41a9-96b2-08d8437fd7d3
X-MS-TrafficTypeDiagnostic: BYAPR11MB2726:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2726E16EEA815DB48656E6E19F5C0@BYAPR11MB2726.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lQLREk/QWCavEyIF34YA7KTygI1Q5ubBQADOeL+G0RyULXlj9WBE5Ifd4Ohc7U+lUtacJJljgvn+WkgPucg0MViVZNGCS7BNU5iz0xrQeDCKqydDkgyA5eouFTb/8AMo+R1SsfzM0Mnn8R1vObPPXGlZKR9OEB6w+svEvBO5VL+yTVpzuugVCqCFUGvmXAFIJYB6oJVAh3apVXPXFtliGT3pBrYAqANj29+knjBKtK0ETYnUn3CADkdY3/qmm1gowNuX1zP4vE0AdmcIaa60oFLnZewvVKCp1Jkxs1RujMV2z0iH+DTkEECfY3bU5fxuBZhvKLRd5TknK8/OfdRirIkgbvCQ+9JcmA4YLC777yWfg5XhvZSoQVZwceiu4tQjEErrC7x9qMd5rWOWC4B7lzWvfCrqX/bgRMDjWmStOiAcbGaJPhYX4XczwSUcHyTGqQ+lg2bBSLyfx51cfXDd9A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(136003)(346002)(366004)(396003)(376002)(31686004)(2616005)(26005)(6486002)(966005)(86362001)(956004)(186003)(16526019)(166002)(83380400001)(36756003)(66946007)(66476007)(66556008)(5660300002)(31696002)(478600001)(44832011)(16576012)(52116002)(8676002)(53546011)(2906002)(316002)(8936002)(33964004)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	0DmbrQ7dWFSzIDd+YA9pUqT44epGv8RRsrGbaXue9iOLD4yjW/1LxdOSpqs2vrEHQZXlOwU76V2EFSAM9sMNWcQ9uN2eJGc+l1izIoY6I9c1X2lfNIoiogShqlbfVWBk2CXw3u4pWVE8O90H/0jZNCVubpBlmVDW+8zZgVL9n1jjRa2qjJGcb6pN7Gu5VQpeDVZZP4rlKXXmoKXJKWBE9p1v98gjJAp2O2Ej1cyrbxhFbJuvXF/MJ0HQSnT66fcQCrJr04gfwRjh01NTqY1j3lNbOSXc3yypxeikIT9u1dn5xydHWFOq0Vli8lCAOcAa0gSoIScTCMWU6WPE0VcSz32DrsPwGv7DVG/EIyTSIBiQdG2pU41SH8NaKqbRjxETM2UeUMOQKNqmc0lRfcnpO4oj+fCBjcsvfJrmM0rsxjzI8lEqu99/svhB3rzge34GPKH7enVxXVDP8NKobhaEmgDu7mRO2ROh1/6UmexaiYRxVTUQ4QyqYQrUgUf2hl/U/bbzjkV/J7ywcRfE60aGkaqwskMK+9vHAUCZwrHk/9uySd+Z3rQqc/R14vKIhDvwbSLYF0dH/kjrt/vBLYIJtbN7FXLDRQcgcu3jHEtJObkyns2hE2VxVT7RZ9MJLBN/vdehl067bb8hHnTyPL0yUQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b2cf76-db69-41a9-96b2-08d8437fd7d3
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2020 14:06:03.7878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k7MYy46T8hLBv0ZLcDZpyNvwYTQBpa2jIDXJdu6JUpU2UCSeADdj0CYYK4K/0K/oD+z6z2G18fQ1CHJQ3vs5FgUPz875Joj5ETM0eTzQalo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2726
Content-Type: multipart/alternative;
 boundary="------------C25A1A3A32937B5CC3084F67"
Content-Language: en-US

--------------C25A1A3A32937B5CC3084F67
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/17/20 7:28 AM, Leon Anavi wrote:
> Upgrade to release 3.3.1 that contains several critical bug-fixes:
>
> - fix docstring import issues when running Python with
>    optimization
> - fix hist with categorical data, such as with Pandas
> - fix install on BSD systems
> - fix nbagg compatibility with Chrome 84+
> - fix ordering of scatter marker size in 3D plots
> - fix performance regression when plotting Paths
> - fix reading from URL in imread
> - fix several regressions with new date epoch handling
> - fix some bad constrained and tight layout interactions
>    with colorbars
> - fix use of customized toolbars in TkAgg and WXAgg backends
>
> Add the native recipe for python3-certifi to DEPENDS.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   ...thon3-matplotlib_3.3.0.bb => python3-matplotlib_3.3.1.bb} | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-matplotlib_3.3.0.bb => python3-matplotlib_3.3.1.bb} (86%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb
> similarity index 86%
> rename from meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
> rename to meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb
> index bc2054a4d..6273ee2f2 100644
> --- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb
> @@ -16,10 +16,11 @@ DEPENDS = "\
>       python3-numpy-native \
>       python3-dateutil-native \
>       python3-pytz-native \
> +    python3-certifi-native \
>   "
>   
> -SRC_URI[md5sum] = "b1de7185687c6f5c092689e3431a69b3"
> -SRC_URI[sha256sum] = "24e8db94948019d531ce0bcd637ac24b1c8f6744ac86d2aa0eb6dbaeb1386f82"
> +SRC_URI[md5sum] = "f3a405f340be5b151cb2042c4d8d16f7"
> +SRC_URI[sha256sum] = "87f53bcce90772f942c2db56736788b39332d552461a5cb13f05ff45c1680f0e"
>   
>   inherit pypi setuptools3 pkgconfig
>   
>
> 

--------------C25A1A3A32937B5CC3084F67
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
    <blockquote type="cite" cite="mid:20200817112901.28914-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 3.3.1 that contains several critical bug-fixes:

- fix docstring import issues when running Python with
  optimization
- fix hist with categorical data, such as with Pandas
- fix install on BSD systems
- fix nbagg compatibility with Chrome 84+
- fix ordering of scatter marker size in 3D plots
- fix performance regression when plotting Paths
- fix reading from URL in imread
- fix several regressions with new date epoch handling
- fix some bad constrained and tight layout interactions
  with colorbars
- fix use of customized toolbars in TkAgg and WXAgg backends

Add the native recipe for python3-certifi to DEPENDS.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200817112901.28914-1-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 ...thon3-matplotlib_3.3.0.bb =&gt; python3-matplotlib_3.3.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-matplotlib_3.3.0.bb =&gt; python3-matplotlib_3.3.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb
index bc2054a4d..6273ee2f2 100644
--- a/meta-python/recipes-devtools/python/python3-matplotlib_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-matplotlib_3.3.1.bb
@@ -16,10 +16,11 @@ DEPENDS = &quot;\
     python3-numpy-native \
     python3-dateutil-native \
     python3-pytz-native \
+    python3-certifi-native \
 &quot;
 
-SRC_URI[md5sum] = &quot;b1de7185687c6f5c092689e3431a69b3&quot;
-SRC_URI[sha256sum] = &quot;24e8db94948019d531ce0bcd637ac24b1c8f6744ac86d2aa0eb6dbaeb1386f82&quot;
+SRC_URI[md5sum] = &quot;f3a405f340be5b151cb2042c4d8d16f7&quot;
+SRC_URI[sha256sum] = &quot;87f53bcce90772f942c2db56736788b39332d552461a5cb13f05ff45c1680f0e&quot;
 
 inherit pypi setuptools3 pkgconfig
 
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C25A1A3A32937B5CC3084F67--
