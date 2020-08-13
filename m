Received: from NAM04-SN1-obe.outbound.protection.outlook.com (NAM04-SN1-obe.outbound.protection.outlook.com [40.107.70.66])
 by mx.groups.io with SMTP id smtpd.web11.13276.1597334177937830167
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2020 08:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=AQrbWXgW;
 spf=pass (domain: windriver.com, ip: 40.107.70.66, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABMXK5B/hBV328satqxoEe1Xa3rH+FAoJBh962ohxLut9XK1sBevwRmbg1D6YEZn9UG7xzbtO1jgxTJORa+4iLnrkz+zHEo06nICjgq5313ZxCYQZ/dEhjGIdXKL56vRQvA8yjU+JS/uNNWw9PHTKC2t3Yh+1pilnn0xUg8idXip+texScLM12iYUKhSV/Njkbcy9hpaqAFTOQ+IYNl8/V8/l2XZU/gtW4/msnnbYg8J+rs6X1nbVq53VBIFg9w4WVYsCZtodtFhL5F7y1OIEJOeU/EggDhkkvgc/ZhVaQcbEsW8IXvnh8TPyDAu/kFMa29qXCZknFULUYVT1Slc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CV2WAI1TbqxYkZweocepfQeS9t1+9u8ceFZIfbugtzA=;
 b=LmomrFY0ZHNZ+ZfsGQ+djTjXdTmimlIHogmZuTOVUlH06uzCyo1wW3z2CKTP1QBLObFjsMIJFfOsAmYkv6CJclEt2sHHIjL0B9JjFHcTTZNEHoktv2uppTMe+UYxcKYISbqjMZHaIFFhV8mgqx0DdpCbroJI7PQLc13yncy3e53k8zJLQSXEbv5cMh8Z1R3AyDrj50QJtpklMJLqfRssIQEToW4eI/hpWoSX5EaniITaF1FiIW8MB2rgDXqNwq3F4pK155+q8eNag53TsZMHeqPxMXwBXVf3OElaUoeCTaR5cMv0B6/yDFBWHKSNNI4vopyuwND5989H+jaeMnmfYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CV2WAI1TbqxYkZweocepfQeS9t1+9u8ceFZIfbugtzA=;
 b=AQrbWXgW7uox9ezqz5XaZKop2BVn9TuQR29GHLYMUOvOrSN69nQBHOXJb8HDWHrzmqi+r6q1mpARl+GK9HFIHDI94jTJpai/iuQIQ8m0u/8q2/p0hsIGbk3muz9i/x9VGzr2JB/b42ErPKG79leMAzPLa++EAVimhZLhCxlgaVA=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3814.namprd11.prod.outlook.com (2603:10b6:a03:fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.15; Thu, 13 Aug
 2020 15:56:16 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d65:f6f9:ce31:8d47%5]) with mapi id 15.20.3261.024; Thu, 13 Aug 2020
 15:56:16 +0000
Subject: Re: [oe] [meta-python][PATCH 3/5] python3-rsa: Upgrade 3.4.2 -> 4.6
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200812102726.4376-1-leon.anavi@konsulko.com>
 <20200812102726.4376-3-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <fba4a81c-709e-3852-b0c0-767558fe233a@windriver.com>
Date: Thu, 13 Aug 2020 11:56:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200812102726.4376-3-leon.anavi@konsulko.com>
X-ClientProxiedBy: YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::29) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTOPR0101CA0016.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15 via Frontend Transport; Thu, 13 Aug 2020 15:56:15 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cad4a458-88d2-4d3f-3927-08d83fa16963
X-MS-TrafficTypeDiagnostic: BYAPR11MB3814:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3814387E6369AFCC8A9A5E239F430@BYAPR11MB3814.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	znSgnH8wX9YI+2/KvMpWoE5/4svrwf9wIQ6+pVes7e5DS+zVp5FFPbDs9rXUona3M3aupF7atCY1LN3xcfeaLL9gCLd3dsb3Rhw9Y5/6htsbQWof0qMrE8ZfaqIA2K+z+IlKfdStU7DQ2TX/AniaGv4aybHtDlavEY4DPgXjo82MNIxYGk4jz8vfpO/w9WFu/rflT/hkYK9E17FpBxCyE5bkVhWpK1ozCANGC3g03TQZfZbCT/NA2UJ2B1WrhrdN8/Fy6iIdsnXdokmVPGZaBh9LjlSDQTr2uTWjkQKGH+6i7CSE5mwh/h+TdLdIZXhsdGrSsrI51QkpjxPUauPXRysOi6Aw/Xr0cn37d4CNoytI/SotjbOS2Zj+8t0PwKU4DMiJked5Q07Klh75EfmrrwrsCbWRUkvqJZyRZTpg8LBtmyC5/Q0+3QHfHjoLk3J1M+sFqCGsbiUBcws55WSjSQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(396003)(39850400004)(376002)(366004)(136003)(346002)(8936002)(16526019)(66946007)(66556008)(966005)(66476007)(2616005)(31686004)(31696002)(44832011)(186003)(956004)(36756003)(166002)(83380400001)(26005)(86362001)(5660300002)(16576012)(53546011)(33964004)(6486002)(52116002)(8676002)(316002)(2906002)(478600001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	dao2fSQKYu4NkjKgrsVQ4PLcncRHbEXJiExmLYdnoO44i+fMGCdEUGV6nAdxpuyRTKy5DD3cAYI5jVZjDYWszOsNCdz4FWBXh8nKKPcnYwDNHH+XCy//A5ZjxnzvUg+kdC6vTiFyCMwgXI4c+1xO+EXznNsS5pJKea62x36jUo83G5OBNYN19Rf8nYIIoKxcYWJ6SBdkA7cAmzzXLhxHyezKAa/sXXD1ptSK6YGwG6ggGtf7cn4FljrfDqXon/3CW7TSR0PAEU6KVu8ZdiiIJ1rdci5Xp7+RaRk/QY1QPlrbVTyRbK5pbPtD7bPhX663F5GaQASY5VOvN6kKlaw5VIc5AqJuERi3W1X4IFK7dxgWGuh8CmEQP5UBUcUSdc8IRvL01GnWQjD2nXelaB+ldgaxwPJ5stfpExnS3f/b1sdNGWU9LBkw9BIigDN+liIMbro2LMg+XU8aWrRePiy0Q1hNABFaInFaU1q0e/Edm8jiIjhv8z8U7jYKrKEYV88U3RowU0mAVVRfMWZyd4Z4Wxdel43oazOhjIklZoG12TPZ4azlq3eBjRQua0iyQkwmj3rWZ20fZUe03N/TjKGDPvyxosvrnoq0YJNqQkjTw0JLVAZpcrjnfGmWN8ToemWPNkVgEecIGGuMdYzsfyl9OA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cad4a458-88d2-4d3f-3927-08d83fa16963
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2020 15:56:16.7407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BF182dKvWeybzAcn5Wrj7bBL3Gw8wwHFbf9ttJlpimY1Z2ymeq3+c6u8FH9Cn+aGWKVdElhMVVA9vxGE6IDsKlQsacWXf03RQWZ7R7SFsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3814
Content-Type: multipart/alternative;
 boundary="------------5ED675CB453C3D398739B263"
Content-Language: en-US

--------------5ED675CB453C3D398739B263
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/12/20 6:27 AM, Leon Anavi wrote:
> Upgrade to release 4.6:
>
> - Rolled back the switch to Poetry, and reverted back to using
>    Pipenv + setup.py for dependency management. There apparently
>    is an issue no-binary installs of packages build with Poetry.
> - Limited SHA3 support to those Python versions (3.6+) that
>    support it natively. The third-party library that adds support
>    for this to Python 3.5 is a binary package, and thus breaks the
>    pure-Python nature of Python-RSA.
> - To avoid older Python installations from trying to upgrade to
>    RSA 4.4, this is now made explicit in the python_requires
>    argument in setup.py
>
> The encrypt/decrypt-bigfile CLI commands have been removed in
> 2016 therefore the recipe has been updated accordingly.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/{python3-rsa_3.4.2.bb => python3-rsa_4.6.bb}    | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-rsa_3.4.2.bb => python3-rsa_4.6.bb} (77%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb b/meta-python/recipes-devtools/python/python3-rsa_4.6.bb
> similarity index 77%
> rename from meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb
> rename to meta-python/recipes-devtools/python/python3-rsa_4.6.bb
> index 759214fa3..d2b108635 100644
> --- a/meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-rsa_4.6.bb
> @@ -4,15 +4,14 @@ AUTHOR = "Sybren A. Stuvel"
>   LICENSE = "Apache-2.0"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
>   
> -SRC_URI[sha256sum] = "25df4e10c263fb88b5ace923dd84bf9aa7f5019687b5e55382ffcdb8bede9db5"
> +SRC_URI[md5sum] = "bbf1c954865319bd542600ab07f92aca"
> +SRC_URI[sha256sum] = "109ea5a66744dd859bf16fe904b8d8b627adafb9408753161e766a92e7d681fa"
>   
>   inherit pypi setuptools3 update-alternatives
>   
>   ALTERNATIVE_${PN} = "\
>       pyrsa-decrypt \
> -    pyrsa-decrypt-bigfile \
>       pyrsa-encrypt \
> -    pyrsa-encrypt-bigfile \
>       pyrsa-keygen \
>       pyrsa-priv2pub \
>       pyrsa-sign \
> @@ -20,9 +19,7 @@ ALTERNATIVE_${PN} = "\
>   "
>   
>   ALTERNATIVE_LINK_NAME[pyrsa-decrypt] = "${bindir}/pyrsa-decrypt"
> -ALTERNATIVE_LINK_NAME[pyrsa-decrypt-bigfile] = "${bindir}/pyrsa-decrypt-bigfile"
>   ALTERNATIVE_LINK_NAME[pyrsa-encrypt] = "${bindir}/pyrsa-encrypt"
> -ALTERNATIVE_LINK_NAME[pyrsa-encrypt-bigfile] = "${bindir}/pyrsa-encrypt-bigfile"
>   ALTERNATIVE_LINK_NAME[pyrsa-keygen] = "${bindir}/pyrsa-keygen"
>   ALTERNATIVE_LINK_NAME[pyrsa-priv2pub] = "${bindir}/pyrsa-priv2pub"
>   ALTERNATIVE_LINK_NAME[pyrsa-sign] = "${bindir}/pyrsa-sign"
>
> 

--------------5ED675CB453C3D398739B263
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/12/20 6:27 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200812102726.4376-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Upgrade to release 4.6:

- Rolled back the switch to Poetry, and reverted back to using
  Pipenv + setup.py for dependency management. There apparently
  is an issue no-binary installs of packages build with Poetry.
- Limited SHA3 support to those Python versions (3.6+) that
  support it natively. The third-party library that adds support
  for this to Python 3.5 is a binary package, and thus breaks the
  pure-Python nature of Python-RSA.
- To avoid older Python installations from trying to upgrade to
  RSA 4.4, this is now made explicit in the python_requires
  argument in setup.py

The encrypt/decrypt-bigfile CLI commands have been removed in
2016 therefore the recipe has been updated accordingly.

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200812102726.4376-3-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/{python3-rsa_3.4.2.bb =&gt; python3-rsa_4.6.bb}    | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rsa_3.4.2.bb =&gt; python3-rsa_4.6.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb b/meta-python/recipes-devtools/python/python3-rsa_4.6.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb
rename to meta-python/recipes-devtools/python/python3-rsa_4.6.bb
index 759214fa3..d2b108635 100644
--- a/meta-python/recipes-devtools/python/python3-rsa_3.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rsa_4.6.bb
@@ -4,15 +4,14 @@ AUTHOR = &quot;Sybren A. Stuvel&quot;
 LICENSE = &quot;Apache-2.0&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634">&quot;file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634&quot;</a>
 
-SRC_URI[sha256sum] = &quot;25df4e10c263fb88b5ace923dd84bf9aa7f5019687b5e55382ffcdb8bede9db5&quot;
+SRC_URI[md5sum] = &quot;bbf1c954865319bd542600ab07f92aca&quot;
+SRC_URI[sha256sum] = &quot;109ea5a66744dd859bf16fe904b8d8b627adafb9408753161e766a92e7d681fa&quot;
 
 inherit pypi setuptools3 update-alternatives
 
 ALTERNATIVE_${PN} = &quot;\
     pyrsa-decrypt \
-    pyrsa-decrypt-bigfile \
     pyrsa-encrypt \
-    pyrsa-encrypt-bigfile \
     pyrsa-keygen \
     pyrsa-priv2pub \
     pyrsa-sign \
@@ -20,9 +19,7 @@ ALTERNATIVE_${PN} = &quot;\
 &quot;
 
 ALTERNATIVE_LINK_NAME[pyrsa-decrypt] = &quot;${bindir}/pyrsa-decrypt&quot;
-ALTERNATIVE_LINK_NAME[pyrsa-decrypt-bigfile] = &quot;${bindir}/pyrsa-decrypt-bigfile&quot;
 ALTERNATIVE_LINK_NAME[pyrsa-encrypt] = &quot;${bindir}/pyrsa-encrypt&quot;
-ALTERNATIVE_LINK_NAME[pyrsa-encrypt-bigfile] = &quot;${bindir}/pyrsa-encrypt-bigfile&quot;
 ALTERNATIVE_LINK_NAME[pyrsa-keygen] = &quot;${bindir}/pyrsa-keygen&quot;
 ALTERNATIVE_LINK_NAME[pyrsa-priv2pub] = &quot;${bindir}/pyrsa-priv2pub&quot;
 ALTERNATIVE_LINK_NAME[pyrsa-sign] = &quot;${bindir}/pyrsa-sign&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------5ED675CB453C3D398739B263--
