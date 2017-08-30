Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33F3377FF9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 07:21:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7U7LdGD001707
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Aug 2017 00:21:39 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 30 Aug 2017 00:21:38 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1504077574-86515-1-git-send-email-dengke.du@windriver.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <37267179-b367-b086-fa4b-59c4e24fd95d@windriver.com>
Date: Wed, 30 Aug 2017 15:21:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1504077574-86515-1-git-send-email-dengke.du@windriver.com>
X-Originating-IP: [128.224.162.194]
Subject: Re: [PATCH] wolfssl: upgrade to 3.12.0
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
X-List-Received-Date: Wed, 30 Aug 2017 07:21:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Please ignore this, thanks.


On 2017年08月30日 15:19, Dengke Du wrote:
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>   ...0001-fix-no-rule-to-make-cyassl-options.h.patch | 27 ++++++++++++++++++++++
>   .../{wolfssl_3.9.0.bb => wolfssl_3.12.0.bb}        | 10 +++++---
>   2 files changed, 34 insertions(+), 3 deletions(-)
>   create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/0001-fix-no-rule-to-make-cyassl-options.h.patch
>   rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.9.0.bb => wolfssl_3.12.0.bb} (69%)
>
> diff --git a/meta-networking/recipes-connectivity/wolfssl/files/0001-fix-no-rule-to-make-cyassl-options.h.patch b/meta-networking/recipes-connectivity/wolfssl/files/0001-fix-no-rule-to-make-cyassl-options.h.patch
> new file mode 100644
> index 0000000..f304d93
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/wolfssl/files/0001-fix-no-rule-to-make-cyassl-options.h.patch
> @@ -0,0 +1,27 @@
> +From fb490136cf8f2456cfe13b0b4f796e6c155e75dc Mon Sep 17 00:00:00 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Wed, 30 Aug 2017 03:02:32 -0400
> +Subject: [PATCH] fix no rule to make cyassl/options.h
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
> +---
> + configure.ac | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 395d75d..d4a3880 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -3684,6 +3684,7 @@ AC_CONFIG_FILES([wolfssl/options.h])
> + #fi
> + AC_CONFIG_FILES([support/wolfssl.pc])
> + AC_CONFIG_FILES([rpm/spec])
> ++AC_CONFIG_FILES([cyassl/options.h])
> +
> + AX_CREATE_GENERIC_CONFIG
> + AX_AM_JOBSERVER([yes])
> +--
> +2.8.1
> +
> diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.9.0.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.12.0.bb
> similarity index 69%
> rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_3.9.0.bb
> rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_3.12.0.bb
> index afae3c8..5126190 100644
> --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.9.0.bb
> +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.12.0.bb
> @@ -12,10 +12,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>   PROVIDES += "cyassl"
>   RPROVIDES_${PN} = "cyassl"
>   
> -SRC_URI = "http://www.wolfssl.com/${BP}.zip"
> +SRC_URI = "https://github.com/wolfSSL/wolfssl/archive/v${PV}-stable.zip \
> +           file://0001-fix-no-rule-to-make-cyassl-options.h.patch \
> +          "
>   
> -SRC_URI[md5sum] = "f3396726a9befd61443c2cce216e39ba"
> -SRC_URI[sha256sum] = "98f50244f7b43f8683bd0cf5c599849d330e75e6cf077e96f14e83bda8b03ca3"
> +SRC_URI[md5sum] = "f9caf558169ab650dc8200708799ebeb"
> +SRC_URI[sha256sum] = "b6d87d3e2c8757177d69aff373c91cf162f4a3944fae90fa10d086fd5f9542e7"
> +
> +S = "${WORKDIR}/wolfssl-${PV}-stable"
>   
>   inherit autotools
>   


