Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F33B6FA6A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jun 2014 10:08:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s56A8cx4025202
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 Jun 2014 03:08:38 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Fri, 6 Jun 2014 03:08:38 -0700
Message-ID: <53919323.80008@windriver.com>
Date: Fri, 6 Jun 2014 18:08:35 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1402019165-23981-1-git-send-email-Chong.Lu@windriver.com>
In-Reply-To: <1402019165-23981-1-git-send-email-Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH] python-m2crypto: avoid swig problem
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jun 2014 10:08:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 06/06/2014 09:46 AM, Chong Lu wrote:
> Swig is used to generate C source and it has trouble processing opensslconf.h
> sometimes. So, we help it out when multilib variants exist.
>
> For native builds, the variant header will never exist.
>
> Specific multi-lib header files might be named *-32.h or *-n32.h, so we check
> for both names. We also might check for *-n64.h although that will never exist.
> It appears that *-o??.h will never exist, so we don't check for that.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   .../python/python-m2crypto_0.21.1.bb               |   23 +++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
> index 21c0269..4f0d785 100644
> --- a/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
> +++ b/meta-oe/recipes-devtools/python/python-m2crypto_0.21.1.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "A Python crypto and SSL toolkit"
>   HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
>   
> -DEPENDS = "openssl swig-native"
> +DEPENDS = "openssl swig-native python"
>   
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
> @@ -20,4 +20,25 @@ SWIG_FEATURES_x86-64 = "-D__x86_64__"
>   SWIG_FEATURES ?= ""
>   export SWIG_FEATURES
>   
> +# Get around a problem with swig, but only if the
> +# multilib header file exists.
> +#
> +do_compile_prepend() {
> +    if [ "${baselib}" = "lib64" ];then
> +        bit="64"
It's bad condition, ${baselib} != "lib64", maybe is a 64 bit.
I will resend V2.

BR
Chong
> +    else
> +        bit="32"
> +    fi
> +
> +    if [ -e ${STAGING_INCDIR}/openssl/opensslconf-${bit}.h ] ;then
> +        for i in SWIG/_ec.i SWIG/_evp.i; do
> +            sed -i -e "s/opensslconf.*\./opensslconf-${bit}\./" "$i"
> +        done
> +    elif [ -e ${STAGING_INCDIR}/openssl/opensslconf-n${bit}.h ] ;then
> +        for i in SWIG/_ec.i SWIG/_evp.i; do
> +            sed -i -e "s/opensslconf.*\./opensslconf-n${bit}\./" "$i"
> +        done
> +    fi
> +}
> +
>   BBCLASSEXTEND = "native"


