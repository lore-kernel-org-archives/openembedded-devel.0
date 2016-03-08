Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 770B273172
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Mar 2016 02:58:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u282wGmH016947
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Mar 2016 18:58:17 -0800 (PST)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Mon, 7 Mar 2016 18:58:15 -0800
To: <akuster@mvista.com>
References: <1457196897-9174-1-git-send-email-akuster808@gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <56DE3FC4.3070508@windriver.com>
Date: Tue, 8 Mar 2016 10:58:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1457196897-9174-1-git-send-email-akuster808@gmail.com>
X-Originating-IP: [128.224.162.200]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][jethro][fido][PATCH] python-m2crypto: fix SSLv2 symbol issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Mar 2016 02:58:17 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I got a build error when applied this patch on jethro branch:

building 'M2Crypto.__m2crypto' extension
swigging SWIG/_m2crypto.i to SWIG/_m2crypto_wrap.c
swig -python 
-I/buildarea/poky/build-m2/tmp/sysroots/qemux86/usr/include/python2.7 
-I/buildarea/poky/build-m2/tmp/sysroots/qemux86/usr/include -includeall 
-modern -builtin -outdir build/lib.linux-x86_64-2.7/M2Crypto -o 
SWIG/_m2crypto_wrap.c SWIG/_m2crypto.i
swig error : Unrecognized option OPENSSL_NO_SSL2
Use 'swig -help' for available options.
error: command 'swig' failed with exit status 1
ERROR: python setup.py build execution failed.
ERROR: Function failed: do_compile (log file is located at 
/buildarea/poky/build-m2/tmp/work/i586-poky-linux/python-m2crypto/0.21.1-r0/temp/log.do_compile.9461)



Thanks,
Yi


在 2016年03月06日 00:54, Armin Kuster 写道:
> From: Armin Kuster <akuster@mvista.com>
>
> ERROR: Failed to import the "M2Crypto" module: .../usr/lib/python2.7/site-packages/M2Crypto/__m2crypto.so: undefined symbol: SSLv2_method
>
> disable using SSLv2_method if not supported in openssl. This is now the case
> with the advent of CVE-2016-0800
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>   ...y_build_with_SSLv2_when_it_is_not_available.patch | 20 ++++++++++++++++++++
>   .../python/python-m2crypto_0.21.1.bb                 |  4 +++-
>   2 files changed, 23 insertions(+), 1 deletion(-)
>   create mode 100644 meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch
>
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch b/meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch
> new file mode 100644
> index 0000000..526c23f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-m2crypto/dont_try_build_with_SSLv2_when_it_is_not_available.patch
> @@ -0,0 +1,20 @@
> +Upstream-Status: Backport
> +https://gitlab.com/m2crypto/m2crypto/commit/ac01b38302474920288c1a9eb63fd35fa8d1db5b
> +
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +Index: M2Crypto-0.21.1/SWIG/_ssl.i
> +===================================================================
> +--- M2Crypto-0.21.1.orig/SWIG/_ssl.i
> ++++ M2Crypto-0.21.1/SWIG/_ssl.i
> +@@ -48,8 +48,10 @@ extern const char *SSL_alert_desc_string
> + %rename(ssl_get_alert_desc_v) SSL_alert_desc_string_long;
> + extern const char *SSL_alert_desc_string_long(int);
> +
> ++#ifndef OPENSSL_NO_SSL2
> + %rename(sslv2_method) SSLv2_method;
> + extern SSL_METHOD *SSLv2_method(void);
> ++#endif
> + %rename(sslv3_method) SSLv3_method;
> + extern SSL_METHOD *SSLv3_method(void);
> + %rename(sslv23_method) SSLv23_method;
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
> index ff6203f..7dfa8d8 100644
> --- a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
> +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
> @@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
>   
>   SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-${PV}.tar.gz \
>              file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
> -           file://0001-M2Crypto-Error-fix.patch"
> +           file://0001-M2Crypto-Error-fix.patch \
> +           file://dont_try_build_with_SSLv2_when_it_is_not_available.patch"
>   
>   SRC_URI[md5sum] = "f93d8462ff7646397a9f77a2fe602d17"
>   SRC_URI[sha256sum] = "25b94498505c2d800ee465db0cc1aff097b1615adc3ac042a1c85ceca264fc0a"
> @@ -19,6 +20,7 @@ inherit setuptools
>   
>   SWIG_FEATURES_x86-64 = "-D__x86_64__"
>   SWIG_FEATURES ?= ""
> +SWIG_FEATURES += "OPENSSL_NO_SSL2"
>   export SWIG_FEATURES
>   
>   # Get around a problem with swig, but only if the


