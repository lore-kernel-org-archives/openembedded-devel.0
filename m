Return-Path: <Mingli.Yu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C0317F3DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 06:36:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6V6ZFiL017926
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Jul 2019 23:35:35 -0700
Received: from [128.224.162.170] (128.224.162.170) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 30 Jul 2019 23:35:18 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <20190722211814.14237-1-raj.khem@gmail.com>
	<20190722211814.14237-2-raj.khem@gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <5D413747.3050905@windriver.com>
Date: Wed, 31 Jul 2019 14:37:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <20190722211814.14237-2-raj.khem@gmail.com>
X-Originating-IP: [128.224.162.170]
Cc: Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-oe][PATCH] log4cplus: Fix build with gold linker
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
X-List-Received-Date: Wed, 31 Jul 2019 06:36:16 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Khem,

On 2019年07月23日 05:18, Khem Raj wrote:
> Fixes a potential linker error and eventual linker crash when using gold
> linker [1]
>
> [1] https://errors.yoctoproject.org/Errors/Details/253440/
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Adrian Bunk <bunk@stusta.de>
> Cc: Mingli Yu <mingli.yu@windriver.com>
> ---
>   ...-version-entry-from-ELF-.comment-sec.patch | 40 +++++++++++++++++++
>   .../log4cplus/log4cplus_2.0.4.bb              |  6 ++-
>   2 files changed, 45 insertions(+), 1 deletion(-)
>   create mode 100644 meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch
>
> diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch b/meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch
> new file mode 100644
> index 0000000000..44a835c35f
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/log4cplus/log4cplus/0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch
> @@ -0,0 +1,40 @@
> +From da5338e68f146efadab7c221291ba4c949d8f12f Mon Sep 17 00:00:00 2001
> +From: Vaclav Haisman <vhaisman@gmail.com>
> +Date: Sun, 21 Jul 2019 23:23:16 -0700
> +Subject: [PATCH] Remove log4cplus version entry from ELF .comment section
> +
> +Reverts
> +https://github.com/log4cplus/log4cplus/commit/9cb0d4ade619da4e40628c9b95ff51de3df29f1b
> +
> +Upstream-Status: Backport [https://github.com/log4cplus/log4cplus/commit/7e6addc70dffd2e30e902efd18eb845c5d5dd7bb]
> +
> +Suggested-by: Adrian Bunk <bunk@stusta.de>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + src/version.cxx | 12 ------------
> + 1 file changed, 12 deletions(-)
> +
> +diff --git a/src/version.cxx b/src/version.cxx
> +index ce18212..e002de9 100644
> +--- a/src/version.cxx
> ++++ b/src/version.cxx
> +@@ -34,16 +34,4 @@ namespace log4cplus
> + unsigned const version = LOG4CPLUS_VERSION;
> + char const versionStr[] = LOG4CPLUS_VERSION_STR LOG4CPLUS_VERSION_STR_SUFFIX;
> +
> +-namespace
> +-{
> +-
> +-#if defined (__ELF__) && (defined (__GNUC__) || defined (__clang__))
> +-char const versionStrComment[]
> +-    __attribute__ ((__used__, __section__ ((".comment"))))
> +-    = "log4cplus " LOG4CPLUS_VERSION_STR LOG4CPLUS_VERSION_STR_SUFFIX;
> +-#endif
> +-
> +-
> +-} // namespace
> +-
> + } // namespace log4cplus
> +--
> +2.22.0
> +
> diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
> index d86521aba3..b396cabf3f 100644
> --- a/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
> +++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_2.0.4.bb
> @@ -6,7 +6,9 @@ BUGTRACKER = "http://sourceforge.net/p/log4cplus/bugs/"
>   LICENSE = "Apache-2.0 & BSD-2-Clause"
>   LIC_FILES_CHKSUM = "file://LICENSE;md5=41e8e060c26822886b592ab4765c756b"
>
> -SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}-stable/${PV}/${BP}.tar.gz \
> +           file://0001-Remove-log4cplus-version-entry-from-ELF-.comment-sec.patch \
> +          "
>   SRC_URI[md5sum] = "2b5b7bc294698bf30a315a259ef9eec2"
>   SRC_URI[sha256sum] = "196eedbc7f2dd792dae721b1159c7ac132255bb368226353c24d4d5fa7c7797a"
>
> @@ -16,3 +18,5 @@ UPSTREAM_CHECK_REGEX = "log4cplus-stable/(?P<pver>\d+(\.\d+)+)/"
>   inherit autotools pkgconfig
>
>   BBCLASSEXTEND = "native"
> +
> +CXXFLAGS += "-fuse-ld=gold"

The logic [CXXFLAGS += "-fuse-ld=gold"] you added is used to fix the 
linker crash on arm though I didn't encounter.

BTW, after you add [CXXFLAGS += "-fuse-ld=gold"], it fails the build for 
"bitbake libn32-log4cplus" with below logic in local.conf
MACHINE ??= "qemumips64"
MULTILIB_GLOBAL_VARIANTS_append = " libn32"
MULTILIBS ?= "multilib:lib32 multilib:libn32"
DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
require conf/multilib.conf

Thanks,

>

