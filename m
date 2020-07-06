Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.64])
 by mx.groups.io with SMTP id smtpd.web11.60769.1594050232989693041
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2020 08:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Agbu6ZfY;
 spf=pass (domain: windriver.com, ip: 40.107.243.64, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juWMLBUKGUIZ+4VowR3qigFbjYZqWp2gD4zeGg+g/SZVhEMVqcHnoZmQhlX5CE23VMlcJXAdpb8wbho3oelwZjwADoafW1zAEw8KEoHrAD7juv7Y/01ODVml/7YwXAR9rArnijO04CY3ql+T4VsGcBzTYTt2oO+2mJRLcL53Z2KXmXliD6kNgsjFbIVvfIGOWZjBI0DzEBquseEWeQZ0sdvTB94fc50TDLtu1ddzmqfuaU6S7O7D4xtGy+9nIIueMt/UNKZ4oyrY6KLEdyeulaE6X3bKbXERYJGuwu47JhcfCPRW4HSJ3h0nGTEpnRWw2m0huwHtGmat0uw101HdeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/6y139Z4tc3MV/D/i/mqlnoVsPjcNdLLwaGZDaT4FE=;
 b=hlURQS1z9YY99z9eC6xmwdqCnefYbanoAJxEkEDJsZgM9+xeVKJmxNs+W+SfiqjKM+OcnHGkc/OIIQv5HfdHyJeeTe5nXmceZRnJOE383IwRyiZRbO3EFpoV/PdRK7kckqZAkMmrU9qnQI3sAi+x/CbT4Ax/F0F4cfLYT6tolRFBh2NSiW6ORW2cHa3f7KyDZaRQWPCklbU99Z3tYWHA0Rg1ef8ipaoNgXmcOmU9YqDZghf5soAc5tA98FLF1SlfKFCzMZCeslxN2jZzsDNTfSP4588YG+kEQ/MeMrjpBTTIiGYEGucfrguEIfyckkCXyUZYxFFGZXGoiKPKpqrGbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/6y139Z4tc3MV/D/i/mqlnoVsPjcNdLLwaGZDaT4FE=;
 b=Agbu6ZfYOuw2d6Xos5JDF6IUlbZWKYuJraNdOsUMPAzwhwLk3uMsirBydkI4tbGuC4HkPWX5w5pmglLdt0YQMPRN8taIagW9L57kq8JDFCGFVY4fUw1/Q2vKYfczMfFxT4jzreJF57CpXcOW5tGBMU3aQAa/ws8bk52iTqo4XDM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29) by
 DM6PR11MB3275.namprd11.prod.outlook.com (2603:10b6:5:5e::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.23; Mon, 6 Jul 2020 15:43:51 +0000
Received: from DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2]) by DM5PR11MB0011.namprd11.prod.outlook.com
 ([fe80::c970:4bd8:f35c:d6d2%5]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 15:43:51 +0000
Subject: Re: [oe] [meta-python][PATCH 5/5] python3-h5py: Upgrade 2.9.0 -> 2.10.0
To: Leon Anavi <leon.anavi@konsulko.com>,
 openembedded-devel@lists.openembedded.org
References: <20200702104819.14256-1-leon.anavi@konsulko.com>
 <20200702104819.14256-5-leon.anavi@konsulko.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <aa928fef-da5b-646a-60d7-d6dfed1895ff@windriver.com>
Date: Mon, 6 Jul 2020 11:43:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
In-Reply-To: <20200702104819.14256-5-leon.anavi@konsulko.com>
X-ClientProxiedBy: YT1PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::33)
 To DM5PR11MB0011.namprd11.prod.outlook.com (2603:10b6:4:6b::29)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.30] (174.115.236.231) by YT1PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Mon, 6 Jul 2020 15:43:51 +0000
X-Originating-IP: [174.115.236.231]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb1827d0-52e2-4e32-a2fe-08d821c361cc
X-MS-TrafficTypeDiagnostic: DM6PR11MB3275:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB32754CD2ACA60ADEF364351F9F690@DM6PR11MB3275.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7TjAI8j0NwQyzY35oIheazFkLbVk+F3OO3tinksDOifPW23X9OWBWQiGtbt3CHAy0C+rkXNdmtCkMOvvo6AdUGxR+3piKBAp7r+0+v2zucuvQD7fceaeSYsn0PJz1XUufQ59ROYBGRTWsiras+ecfg5NkcwhZYjgte4ogV/XHQHvZA41yk4+rlv7ny0GRAzhRz3AuOvF94lfLxp/iypdbtwNTOFxQuVtO+sYTgBH0B22m4pX9dHfRQa3kBRau14Zxfr8eseGPo9Plm59NJHEENEUBf6X5JgV1DZegxqunEefrjaid8anPb+ImaGllge7eIsxNJTUp8/ce08/6hOcztme7ZL+PbPxrVJrsFdSH8yHxLKJNtg+ZjHBB2Z9CPln7c3fP5q1PGUeRMuKWef6U6ouCze4Qi1Qvq9MYzcjJAhNwbvHA7e5HHthSBHvBN1R3854Ws/nK8DhBCIyHCkUKRHncYdvwFaXFMKwX7ow2a/zB6qdMoHqlqe3MiZt0LjG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR11MB0011.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(346002)(376002)(366004)(39850400004)(396003)(33964004)(16576012)(36756003)(26005)(8936002)(8676002)(316002)(31696002)(19273905006)(6486002)(16526019)(86362001)(2616005)(83380400001)(44832011)(186003)(956004)(2906002)(166002)(66946007)(52116002)(31686004)(66556008)(66476007)(5660300002)(21615005)(53546011)(478600001)(966005)(43740500002)(562404015)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	R4C3HLM23PX1uE+FEUzyIjOm5+EPZMfbWymk4Q+38EEwCazRfWUU/SaWnLu9I+p5HsFpPgldEIlVNuttrsCrpTpoiKqWMDGUNn5yaZWnJ94dFaf7rFrf8HhPP9XRwi+m0lmfeo7qFzLWq/X7ZBHDgFlHjaEdzbXfhB2Eljk0fJaOvmiB9diFKkVH3mtbLbgV1bFrrpsXx592xB/Lc8saePMe9NGQ2WXe/BQBZUmq/X90eRi8IM4bkCIoRamd63QwLFhQDf/LClFN3qzCYOLks51ftCZH2BGMh03/5z9imewHEUoZvCVaHLxVcnVBj8sevKbEvuG4a3ZvgC2c5xjqOlPqbHby1ts3pTjbTxAmtIgLikUH7oHOnzd8oPnfUioboGD66YgZMG4NrK3SFWszh9K+S8esIo3QWuUsrFQlOzvrdzvQlxRn5nceLx2wnq1I83pidBumOZV2+TRmod3qZVnE1ptnUGu3GIY1cW8An+0wao5UAmPMFQcsgU3p3Qis
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb1827d0-52e2-4e32-a2fe-08d821c361cc
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB0011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 15:43:51.7744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gou3tFIbCyg6bGucVxqEKRpp+HmbFVhQeMpRb0iPgmE6orkqV4h+NVfzY+77N9kf9VG9dGyEHo8uUlgzRYrxsxziRGm9tyx8lkZmoL/MSjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3275
Content-Type: multipart/alternative;
 boundary="------------E86C6F33F8287524B1CD1A88"
Content-Language: en-US

--------------E86C6F33F8287524B1CD1A88
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/2/20 6:48 AM, Leon Anavi wrote:
> Inherit pypi. Use LICENSE for LIC_FILES_CHKSUM.
>
> Upgrade to release 2.10.0, for details:
> http://docs.h5py.org/en/stable/whatsnew/index.html
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../0001-cross-compiling-support.patch           | 15 ++++++++-------
>   ...hon3-h5py_2.9.0.bb => python3-h5py_2.10.0.bb} | 16 ++++++++--------
>   2 files changed, 16 insertions(+), 15 deletions(-)
>   rename meta-python/recipes-devtools/python/{python3-h5py_2.9.0.bb => python3-h5py_2.10.0.bb} (62%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
> index ff50c85a0..8c0b91432 100644
> --- a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
> +++ b/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
> @@ -1,4 +1,4 @@
> -From 7e3b1745c1fef34683a0610381dd3308ad4d1ba9 Mon Sep 17 00:00:00 2001
> +From 364fd0906efa349ea44a761820408dcf6b2b8726 Mon Sep 17 00:00:00 2001
>   From: Hongxu Jia <hongxu.jia@windriver.com>
>   Date: Tue, 29 Jan 2019 17:08:32 +0800
>   Subject: [PATCH] cross compiling support
> @@ -8,16 +8,17 @@ Remove useless dirs
>   Upstream-Status: Inappropriate [oe specific]
>   
>   Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
>   ---
>    setup_build.py     | 4 ----
>    setup_configure.py | 2 +-
>    2 files changed, 1 insertion(+), 5 deletions(-)
>   
>   diff --git a/setup_build.py b/setup_build.py
> -index 85b321a..2c78e92 100644
> +index c0e9a28c..ffd3bef7 100644
>   --- a/setup_build.py
>   +++ b/setup_build.py
> -@@ -53,10 +53,6 @@ if sys.platform.startswith('win'):
> +@@ -55,10 +55,6 @@ if sys.platform.startswith('win'):
>            ('_HDF5USEDLL_', None),
>            ('H5_BUILT_AS_DYNAMIC_LIB', None)
>        ])
> @@ -29,11 +30,11 @@ index 85b321a..2c78e92 100644
>    class h5py_build_ext(build_ext):
>    
>   diff --git a/setup_configure.py b/setup_configure.py
> -index a2de76a..197f2da 100644
> +index 5576775e..75f4141e 100644
>   --- a/setup_configure.py
>   +++ b/setup_configure.py
> -@@ -208,7 +208,7 @@ def autodetect_version(hdf5_dir=None):
> -     else:
> +@@ -206,7 +206,7 @@ def autodetect_version(hdf5_dir=None):
> +         default_path = 'libhdf5.so'
>            regexp = re.compile(r'^libhdf5.so')
>    
>   -    libdirs = ['/usr/local/lib', '/opt/local/lib']
> @@ -42,5 +43,5 @@ index a2de76a..197f2da 100644
>            if pkgconfig.exists("hdf5"):
>                libdirs.extend(pkgconfig.parse("hdf5")['library_dirs'])
>   --
> -2.7.4
> +2.17.1
>   
> diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb b/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
> similarity index 62%
> rename from meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb
> rename to meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
> index 7822e463e..3904abbb4 100644
> --- a/meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
> @@ -1,17 +1,17 @@
> -SUMMARY = "Provides both a high- and low-level interface to the HDF5 library from Python. "
> +SUMMARY = "Provides both a high- and low-level interface to the HDF5 library from Python."
>   HOMEPAGE = "https://www.h5py.org/"
>   SECTION = "devel/python"
>   LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://setup.py;beginline=107;endline=107;md5=795ecad0d261c998cc526c84a822dff6"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
>   
> -SRC_URI = "git://github.com/h5py/h5py.git \
> +SRC_URI[md5sum] = "504b595237409ab766fbbe568e60a080"
> +SRC_URI[sha256sum] = "84412798925dc870ffd7107f045d7659e60f5d46d1c70c700375248bf6bf512d"
> +
> +SRC_URI_append = " \
>              file://0001-cross-compiling-support.patch \
>             "
> -SRCREV ?= "8d96a14c3508de1bde77aec5db302e478dc5dbc4"
> -
> -inherit setuptools3
>   
> -S = "${WORKDIR}/git"
> +inherit pypi setuptools3
>   
>   BBCLASSEXTEND = "native"
>   
> @@ -27,4 +27,4 @@ RDEPENDS_${PN} = "python3-numpy \
>                     python3-six \
>                    "
>   
> -export HDF5_VERSION="1.8.19"
> +export HDF5_VERSION="1.8.21"
>
> 

--------------E86C6F33F8287524B1CD1A88
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/2/20 6:48 AM, Leon Anavi wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20200702104819.14256-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">Inherit pypi. Use LICENSE for LIC_FILES_CHKSUM.

Upgrade to release 2.10.0, for details:
<a class="moz-txt-link-freetext" href="http://docs.h5py.org/en/stable/whatsnew/index.html">http://docs.h5py.org/en/stable/whatsnew/index.html</a>

Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a></pre>
    </blockquote>
    Acked-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
    <blockquote type="cite" cite="mid:20200702104819.14256-5-leon.anavi@konsulko.com">
      <pre class="moz-quote-pre" wrap="">
---
 .../0001-cross-compiling-support.patch           | 15 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-------
 ...hon3-h5py_2.9.0.bb =&gt; python3-h5py_2.10.0.bb} | 16 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;--------
 2 files changed, 16 insertions(&#43;), 15 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_2.9.0.bb =&gt; python3-h5py_2.10.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
index ff50c85a0..8c0b91432 100644
--- a/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-h5py/0001-cross-compiling-support.patch
@@ -1,4 &#43;1,4 @@
-From 7e3b1745c1fef34683a0610381dd3308ad4d1ba9 Mon Sep 17 00:00:00 2001
&#43;From 364fd0906efa349ea44a761820408dcf6b2b8726 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
 Date: Tue, 29 Jan 2019 17:08:32 &#43;0800
 Subject: [PATCH] cross compiling support
@@ -8,16 &#43;8,17 @@ Remove useless dirs
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
&#43;Signed-off-by: Leon Anavi <a class="moz-txt-link-rfc2396E" href="mailto:leon.anavi@konsulko.com">&lt;leon.anavi@konsulko.com&gt;</a>
 ---
  setup_build.py     | 4 ----
  setup_configure.py | 2 &#43;-
  2 files changed, 1 insertion(&#43;), 5 deletions(-)
 
 diff --git a/setup_build.py b/setup_build.py
-index 85b321a..2c78e92 100644
&#43;index c0e9a28c..ffd3bef7 100644
 --- a/setup_build.py
 &#43;&#43;&#43; b/setup_build.py
-@@ -53,10 &#43;53,6 @@ if sys.platform.startswith('win'):
&#43;@@ -55,10 &#43;55,6 @@ if sys.platform.startswith('win'):
          ('_HDF5USEDLL_', None),
          ('H5_BUILT_AS_DYNAMIC_LIB', None)
      ])
@@ -29,11 &#43;30,11 @@ index 85b321a..2c78e92 100644
  class h5py_build_ext(build_ext):
  
 diff --git a/setup_configure.py b/setup_configure.py
-index a2de76a..197f2da 100644
&#43;index 5576775e..75f4141e 100644
 --- a/setup_configure.py
 &#43;&#43;&#43; b/setup_configure.py
-@@ -208,7 &#43;208,7 @@ def autodetect_version(hdf5_dir=None):
-     else:
&#43;@@ -206,7 &#43;206,7 @@ def autodetect_version(hdf5_dir=None):
&#43;         default_path = 'libhdf5.so'
          regexp = re.compile(r'^libhdf5.so')
  
 -    libdirs = ['/usr/local/lib', '/opt/local/lib']
@@ -42,5 &#43;43,5 @@ index a2de76a..197f2da 100644
          if pkgconfig.exists(&quot;hdf5&quot;):
              libdirs.extend(pkgconfig.parse(&quot;hdf5&quot;)['library_dirs'])
 -- 
-2.7.4
&#43;2.17.1
 
diff --git a/meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb b/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
index 7822e463e..3904abbb4 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_2.9.0.bb
&#43;&#43;&#43; b/meta-python/recipes-devtools/python/python3-h5py_2.10.0.bb
@@ -1,17 &#43;1,17 @@
-SUMMARY = &quot;Provides both a high- and low-level interface to the HDF5 library from Python. &quot;
&#43;SUMMARY = &quot;Provides both a high- and low-level interface to the HDF5 library from Python.&quot;
 HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="https://www.h5py.org/">&quot;https://www.h5py.org/&quot;</a>
 SECTION = &quot;devel/python&quot;
 LICENSE = &quot;BSD-3-Clause&quot;
-LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://setup.py;beginline=107;endline=107;md5=795ecad0d261c998cc526c84a822dff6">&quot;file://setup.py;beginline=107;endline=107;md5=795ecad0d261c998cc526c84a822dff6&quot;</a>
&#43;LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=113251d71fb0384712c719b567261c5c">&quot;file://LICENSE;md5=113251d71fb0384712c719b567261c5c&quot;</a>
 
-SRC_URI = &quot;git://github.com/h5py/h5py.git \
&#43;SRC_URI[md5sum] = &quot;504b595237409ab766fbbe568e60a080&quot;
&#43;SRC_URI[sha256sum] = &quot;84412798925dc870ffd7107f045d7659e60f5d46d1c70c700375248bf6bf512d&quot;
&#43;
&#43;SRC_URI_append = &quot; \
            <a class="moz-txt-link-freetext" href="file://0001-cross-compiling-support.patch">file://0001-cross-compiling-support.patch</a> \
           &quot;
-SRCREV ?= &quot;8d96a14c3508de1bde77aec5db302e478dc5dbc4&quot;
-
-inherit setuptools3
 
-S = &quot;${WORKDIR}/git&quot;
&#43;inherit pypi setuptools3
 
 BBCLASSEXTEND = &quot;native&quot;
 
@@ -27,4 &#43;27,4 @@ RDEPENDS_${PN} = &quot;python3-numpy \
                   python3-six \
                  &quot;
 
-export HDF5_VERSION=&quot;1.8.19&quot;
&#43;export HDF5_VERSION=&quot;1.8.21&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------E86C6F33F8287524B1CD1A88--
