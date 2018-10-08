Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D4FCD71C42
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Oct 2018 05:44:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w985hogG014621
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 7 Oct 2018 22:44:32 -0700
Received: from [128.224.162.232] (128.224.162.232) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 7 Oct 2018 22:44:22 -0700
To: Khem Raj <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
References: <20181008044741.37650-1-raj.khem@gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <bb6e4c87-6555-2045-d692-fc19de270c22@windriver.com>
Date: Mon, 8 Oct 2018 13:44:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181008044741.37650-1-raj.khem@gmail.com>
Subject: Re: [meta-networking][PATCH] umip: fix recipe location typo
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
X-List-Received-Date: Mon, 08 Oct 2018 05:44:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Thanks for V2, since the troubles introduced by V1, I am testing
V2 with more builds, the build result is OK (glibc and musl)

Hi Khem,

Is nodejs supposed to be here?

//Hongxu

On 2018年10月08日 12:47, Khem Raj wrote:
> From: Hongxu Jia <hongxu.jia@windriver.com>
>
> Since `36983fe umip: move to meta-networking' applied,
> it was moved to invalid location.
>
> Fix prior partial move to meta-networking
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../umip/umip}/0001-Add-format-string-to-fprintf-call.patch     | 0
>   ...01-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch | 0
>   .../umip/umip}/0001-support-openssl-1.1.x.patch                 | 0
>   ...2-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch | 0
>   .../umip}/add-dependency-to-support-parallel-compilation.patch  | 0
>   .../recipes-connectivity/umip/umip}/mip6d                       | 0
>   .../recipes-connectivity/umip/umip}/mip6d.service               | 0
>   meta-networking/recipes-connectivity/{ => umip}/umip_1.0.bb     | 0
>   meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb                | 2 +-
>   9 files changed, 1 insertion(+), 1 deletion(-)
>   rename {meta-oe/recipes-connectivity/umip/files => meta-networking/recipes-connectivity/umip/umip}/0001-Add-format-string-to-fprintf-call.patch (100%)
>   rename {meta-oe/recipes-connectivity/umip/files => meta-networking/recipes-connectivity/umip/umip}/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch (100%)
>   rename {meta-oe/recipes-connectivity/umip/files => meta-networking/recipes-connectivity/umip/umip}/0001-support-openssl-1.1.x.patch (100%)
>   rename {meta-oe/recipes-connectivity/umip/files => meta-networking/recipes-connectivity/umip/umip}/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch (100%)
>   rename {meta-oe/recipes-connectivity/umip/files => meta-networking/recipes-connectivity/umip/umip}/add-dependency-to-support-parallel-compilation.patch (100%)
>   rename {meta-oe/recipes-connectivity/umip/files => meta-networking/recipes-connectivity/umip/umip}/mip6d (100%)
>   rename {meta-oe/recipes-connectivity/umip/files => meta-networking/recipes-connectivity/umip/umip}/mip6d.service (100%)
>   rename meta-networking/recipes-connectivity/{ => umip}/umip_1.0.bb (100%)
>
> diff --git a/meta-oe/recipes-connectivity/umip/files/0001-Add-format-string-to-fprintf-call.patch b/meta-networking/recipes-connectivity/umip/umip/0001-Add-format-string-to-fprintf-call.patch
> similarity index 100%
> rename from meta-oe/recipes-connectivity/umip/files/0001-Add-format-string-to-fprintf-call.patch
> rename to meta-networking/recipes-connectivity/umip/umip/0001-Add-format-string-to-fprintf-call.patch
> diff --git a/meta-oe/recipes-connectivity/umip/files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch b/meta-networking/recipes-connectivity/umip/umip/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch
> similarity index 100%
> rename from meta-oe/recipes-connectivity/umip/files/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch
> rename to meta-networking/recipes-connectivity/umip/umip/0001-replace-SIGCLD-with-SIGCHLD-and-include-sys-types.h.patch
> diff --git a/meta-oe/recipes-connectivity/umip/files/0001-support-openssl-1.1.x.patch b/meta-networking/recipes-connectivity/umip/umip/0001-support-openssl-1.1.x.patch
> similarity index 100%
> rename from meta-oe/recipes-connectivity/umip/files/0001-support-openssl-1.1.x.patch
> rename to meta-networking/recipes-connectivity/umip/umip/0001-support-openssl-1.1.x.patch
> diff --git a/meta-oe/recipes-connectivity/umip/files/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch b/meta-networking/recipes-connectivity/umip/umip/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch
> similarity index 100%
> rename from meta-oe/recipes-connectivity/umip/files/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch
> rename to meta-networking/recipes-connectivity/umip/umip/0002-replace-PTHREAD_MUTEX_FAST_NP-with-PTHREAD_MUTEX_NOR.patch
> diff --git a/meta-oe/recipes-connectivity/umip/files/add-dependency-to-support-parallel-compilation.patch b/meta-networking/recipes-connectivity/umip/umip/add-dependency-to-support-parallel-compilation.patch
> similarity index 100%
> rename from meta-oe/recipes-connectivity/umip/files/add-dependency-to-support-parallel-compilation.patch
> rename to meta-networking/recipes-connectivity/umip/umip/add-dependency-to-support-parallel-compilation.patch
> diff --git a/meta-oe/recipes-connectivity/umip/files/mip6d b/meta-networking/recipes-connectivity/umip/umip/mip6d
> similarity index 100%
> rename from meta-oe/recipes-connectivity/umip/files/mip6d
> rename to meta-networking/recipes-connectivity/umip/umip/mip6d
> diff --git a/meta-oe/recipes-connectivity/umip/files/mip6d.service b/meta-networking/recipes-connectivity/umip/umip/mip6d.service
> similarity index 100%
> rename from meta-oe/recipes-connectivity/umip/files/mip6d.service
> rename to meta-networking/recipes-connectivity/umip/umip/mip6d.service
> diff --git a/meta-networking/recipes-connectivity/umip_1.0.bb b/meta-networking/recipes-connectivity/umip/umip_1.0.bb
> similarity index 100%
> rename from meta-networking/recipes-connectivity/umip_1.0.bb
> rename to meta-networking/recipes-connectivity/umip/umip_1.0.bb
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
> index e3b46bc2c8..d0645007c5 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_8.12.0.bb
> @@ -44,7 +44,7 @@ do_configure () {
>       export LD="${CXX}"
>       GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
>       # $TARGET_ARCH settings don't match --dest-cpu settings
> -   ./configure --prefix=${prefix} --without-intl --without-snapshot --shared-openssl --shared-zlib \
> +   ./configure --prefix=${prefix} --with-intl=small-icu --without-snapshot --shared-openssl --shared-zlib \
>                  --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
>                  --dest-os=linux \
>                  ${ARCHFLAGS}



