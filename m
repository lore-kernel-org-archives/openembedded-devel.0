Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.83])
 by mx.groups.io with SMTP id smtpd.web11.1606.1594487928823393485
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jul 2020 10:18:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=qFv9sUIT;
 spf=pass (domain: windriver.com, ip: 40.107.77.83, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mKMHkh915SAozmVtLSyouuILbr0xQieVUizvgiKmij0qAbdRB/jv1qFdNQm/g+K5vNQSsSZfdGO4QyW9/jGKY+t4DIJmUYqNFca6tVoqjfCYX8jQ+aK5vkYN4jOZ8EsgeBiqnRzz8j5kvX6Mmttgnn63/d9uLO0f2+vbOAOB76W7dgn8ObIu58+f15F374OCPIwbtt12Wna1iwm7WDb3fpPylGiX4UMiJeo8GhfXeQghPQSOcWpxn51DCEgG7LS1QNjlggDRp7uq5siGj0eFDPMsTG6kD5djez0UyC18YI2qVgX9r+7AqlunyKNHGI67KekbIG9SvD+OBgZ1iX5yuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JTS476nvlFedBMXcJ7c32B4sOxiSOquv38GMTZYZPo=;
 b=WUeuazYgEqHcMuCNT9SU1jh6vGSNO9E9afNhcHuU4vGo6px3eox4w+3JwGjs9pPklBil9+vwzzRkMooczQZQVcwIEMFBD/QCrBGpEZVpR8nkWWvq2vbCY+K2vnuzsIwg9KhuFT8gYdBLkoAZVYL3qDPpiH+BEcF10TZtzS7fW3gTzqyL6WmRTtvArfvkMt9PeoBEp4nWwNUKuEYskXdnV58OmqpDYy6dnJm6/Bd7I/q/kxgZpC5sWQj2im4Hw1T8KeSf0YqDLsSMUDm0DBKD1Ck/wGdI0M3nzVB33Z2Q/JV3Kq5y6UW4a9hZO4pUUhD08G9RAHNtaxinnW4NXRmUVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JTS476nvlFedBMXcJ7c32B4sOxiSOquv38GMTZYZPo=;
 b=qFv9sUIT4thJsPjn1Bm+7mXiM4p2pH5gLZXrgz5bXMeCrqYpNw4Tm5zfSe2/dWM0a693QrI2WwxiKSFv4FSbhWSTd5vSLeEXKqpLNJGrA7sL/AtXMSrJV1dmGCifySi+xdz1DkX/Ccz5OjF0MLFJ4+7Po761C6QEGW83Lu8ZXww=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB2843.namprd11.prod.outlook.com (2603:10b6:5:c7::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21; Sat, 11 Jul 2020 17:18:47 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.031; Sat, 11 Jul 2020
 17:18:47 +0000
Subject: Re: [oe] [meta-python][PATCH 2/4] python3-icu: add new package
To: akuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20200710040109.22600-1-akuster808@gmail.com>
 <20200710040109.22600-3-akuster808@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <365c5353-a5eb-9521-e1ce-69615975ee4b@windriver.com>
Date: Sat, 11 Jul 2020 13:18:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200710040109.22600-3-akuster808@gmail.com>
X-ClientProxiedBy: YTBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::42) To DM5PR11MB0011.namprd11.prod.outlook.com
 (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YTBPR01CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::42) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend Transport; Sat, 11 Jul 2020 17:18:47 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ec8d2b7-8853-44b1-a935-08d825be78c1
X-MS-TrafficTypeDiagnostic: DM6PR11MB2843:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB28433B753CF65ED8D0DAB6A49F620@DM6PR11MB2843.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:170;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5PFYrTK1U9eYPho8z2uSP1HP+gsrpt+RKzV6+rYG3VZRZTWX6acynT3Z5ykGbq9zDFT4+irJnUrc4+FUomfjz7V/g1sHfX4r7Bf9MRiLqs6/KUY6Bz6qJr686ph6QnH8Wfim/76FEuuYTM3l+Ghc6+PdFjuknG5Xm8nN5ipxPoCYJUQaN128A1csq1MjbRzK930MIjd2ytTlUjQwso1F/YVlFT7hfXOtbi3MWq7sFQMCEXKC2WMIpjAISZhAI/Y6fPAyy8jxi5KYhQ3fNJwQdidpH9PGc6UOhnw/ASjRtyNFBJVay6QWm86LSXfbWBCNnzeGnFN9I3gTu+/Ta14rwumKyadTMYq41xS3r0IMkVEX7QA1YDivR99Tge1d74ipUGqrdJuegO9l9hajHuDwx/9+3RvHqwSKmoPruWTbKa/1ehbogOdnEh6ZDnRFSMmIQ3f6lxge91FOY+78usYOjA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(39840400004)(346002)(376002)(136003)(396003)(26005)(66946007)(36756003)(31696002)(478600001)(86362001)(966005)(186003)(2906002)(53546011)(66476007)(66556008)(6486002)(31686004)(16526019)(5660300002)(33964004)(16576012)(52116002)(2616005)(8936002)(956004)(316002)(44832011)(166002)(8676002)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	LMftxoh3YNWhDG+os4D30pjiYxQYJnboDQ3uHq04QKKKVqoX2dnnSx8ZqH/W3JQsTNFdfDK6Rkb7GiTSBezTJcWtdwjMM9P5+U6j91JmXYB21d8ZYZupJ3VDX2YiMHvO8zlqVJ3QSwa/LrdTvBtsUpOACpukBdha1qaEBN/dvd6ftBAZsUXnR3hqAfKzlUOnqGq3Y1maIVb4hGmpv4oM6F4DR8wzmfP4HAo5+BWKpRNtc3l3kGMV5FP5yYm/R+RwcEckoISIYkq2tpFiM+ADDNzZeUrsWcIF8NkrOIMsdGlZSMAHXy4rSQW3RRafWByqu2q1ct27BHSgjSfFblUgt+Keoe6QkGO/60OcOSMpMXX38sq2ZySoiH4F+tylnPngnVi3QMjO6fS2MkMwJOEzroACLKSgBzzf1980gKd9VcG7WcAjVIpgfrwcF25mFXPDU78ePDyRE5H3Y75XuL8Qzxlcma7LCO4djm6jcO5a92k=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec8d2b7-8853-44b1-a935-08d825be78c1
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2020 17:18:47.4965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69Jg03eGONxCFLiiou+ozesbfbSBIzg1yHWLwi5aS3mrCDLPat/2uzah+1RQKSJ4A1/uJm1r+TdKmQ0O87IIxG4jM+hrDuRLAKoaFqDMCrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2843
Content-Type: multipart/alternative;
 boundary="------------C31D0927D0FF30FE6216D770"
Content-Language: en-US

--------------C31D0927D0FF30FE6216D770
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/10/20 12:01 AM, akuster wrote:
> needed by python3-natsort
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-icu/fix_host_include.patch | 30 +++++++++++++++++++
>   .../python/python3-icu_2.5.bb                 | 13 ++++++++
>   2 files changed, 43 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-icu/fix_host_include.patch
>   create mode 100644 meta-python/recipes-devtools/python/python3-icu_2.5.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-icu/fix_host_include.patch b/meta-python/recipes-devtools/python/python3-icu/fix_host_include.patch
> new file mode 100644
> index 0000000000..1b6e890436
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-icu/fix_host_include.patch
> @@ -0,0 +1,30 @@
> +Fixed host contamination of include files
> +
> +python3-icu-2.5-r0 do_package_qa: QA Issue: python3-icu: The compile log indicates that host include and/or library paths were used.
> +
> +Also, don't use icu-config
> +
> +Upstream-Status: [inappropriate] OE specific
> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
> +
> +Index: PyICU-2.5/setup.py
> +===================================================================
> +--- PyICU-2.5.orig/setup.py
> ++++ PyICU-2.5/setup.py
> +@@ -81,7 +81,7 @@ Building PyICU %s for ICU %s (max ICU ma
> +
> + CONFIGURE_WITH_ICU_CONFIG = {
> +     'darwin': True,
> +-    'linux': True,
> ++    'linux': False,
> +     'freebsd': False, # not tested
> +     'win32': False,   # no icu-config
> +     'sunos5': False,  # not tested
> +@@ -274,7 +274,6 @@ setup(name="PyICU",
> +       ext_modules=[Extension('_icu',
> +                              [filename for filename in sorted(os.listdir(os.curdir))
> +                               if filename.endswith('.cpp')],
> +-                             include_dirs=_includes,
> +                              extra_compile_args=_cflags,
> +                              extra_link_args=_lflags,
> +                              libraries=_libraries)],
> diff --git a/meta-python/recipes-devtools/python/python3-icu_2.5.bb b/meta-python/recipes-devtools/python/python3-icu_2.5.bb
> new file mode 100644
> index 0000000000..5e8c8a3a02
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-icu_2.5.bb
> @@ -0,0 +1,13 @@
> +SUMMARY = "Python extension wrapping the ICU C++ API"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c7c4bfd81a21e3b6368bdcced992bf59"
> +
> +DEPENDS += "pkgconfig icu"
> +
> +PYPI_PACKAGE = "PyICU"
> +SRC_URI[sha256sum] = "a120b68c53f769f37bfb70b7e84ca12c3f4ab1e4df43e87a02dff05ae472cdbc"
> +
> +SRC_URI += "file://fix_host_include.patch"
> +
> +inherit pypi setuptools3
>
> 

--------------C31D0927D0FF30FE6216D770
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/10/20 12:01 AM, akuster wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200710040109.22600-3-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">needed by python3-natsort

Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200710040109.22600-3-akuster808@gmail.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../python/python3-icu/fix_host_include.patch | 30 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 .../python/python3-icu_2.5.bb                 | 13 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;
 2 files changed, 43 insertions(&#43;)
 create mode 100644 meta-python/recipes-devtools/python/python3-icu/fix_host_include.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-icu_2.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-icu/fix_host_include.patch b/meta-python/recipes-devtools/python/python3-icu/fix_host_include.patch
new file mode 100644
index 0000000000..1b6e890436
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-icu/fix_host_include.patch
@@ -0,0 &#43;1,30 @@
&#43;Fixed host contamination of include files
&#43;
&#43;python3-icu-2.5-r0 do_package_qa: QA Issue: python3-icu: The compile log indicates that host include and/or library paths were used.
&#43;
&#43;Also, don't use icu-config
&#43;
&#43;Upstream-Status: [inappropriate] OE specific
&#43;Signed-off-by: Armin Kuster <a class="moz-txt-link-rfc2396E" href="mailto:akuster808@gmail.com">&lt;akuster808@gmail.com&gt;</a>
&#43;
&#43;Index: PyICU-2.5/setup.py
&#43;===================================================================
&#43;--- PyICU-2.5.orig/setup.py
&#43;&#43;&#43;&#43; PyICU-2.5/setup.py
&#43;@@ -81,7 &#43;81,7 @@ Building PyICU %s for ICU %s (max ICU ma
&#43; 
&#43; CONFIGURE_WITH_ICU_CONFIG = {
&#43;     'darwin': True,
&#43;-    'linux': True,
&#43;&#43;    'linux': False,
&#43;     'freebsd': False, # not tested
&#43;     'win32': False,   # no icu-config
&#43;     'sunos5': False,  # not tested
&#43;@@ -274,7 &#43;274,6 @@ setup(name=&quot;PyICU&quot;,
&#43;       ext_modules=[Extension('_icu',
&#43;                              [filename for filename in sorted(os.listdir(os.curdir))
&#43;                               if filename.endswith('.cpp')],
&#43;-                             include_dirs=_includes,
&#43;                              extra_compile_args=_cflags,
&#43;                              extra_link_args=_lflags,
&#43;                              libraries=_libraries)],
diff --git a/meta-python/recipes-devtools/python/python3-icu_2.5.bb b/meta-python/recipes-devtools/python/python3-icu_2.5.bb
new file mode 100644
index 0000000000..5e8c8a3a02
--- /dev/null
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-icu_2.5.bb
@@ -0,0 &#43;1,13 @@
&#43;SUMMARY = &quot;Python extension wrapping the ICU C&#43;&#43; API&quot;
&#43;SECTION = &quot;devel/python&quot;
&#43;LICENSE = &quot;MIT&quot;
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=c7c4bfd81a21e3b6368bdcced992bf59">&quot;file://LICENSE;md5=c7c4bfd81a21e3b6368bdcced992bf59&quot;</a>
&#43;
&#43;DEPENDS &#43;= &quot;pkgconfig icu&quot;
&#43;
&#43;PYPI_PACKAGE = &quot;PyICU&quot;
&#43;SRC_URI[sha256sum] = &quot;a120b68c53f769f37bfb70b7e84ca12c3f4ab1e4df43e87a02dff05ae472cdbc&quot;
&#43;
&#43;SRC_URI &#43;= <a class="moz-txt-link-rfc2396E" href="file://fix_host_include.patch">&quot;file://fix_host_include.patch&quot;</a>
&#43;
&#43;inherit pypi setuptools3
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------C31D0927D0FF30FE6216D770--
