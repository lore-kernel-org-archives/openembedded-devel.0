Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PsmP5-0004KA-Qh
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 02:23:32 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PsmNm-0005OP-9A from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 17:22:10 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 24 Feb 2011 17:22:10 -0800
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Thu, 24 Feb 2011 17:22:09 -0800
Message-ID: <4D670434.6010701@mentor.com>
Date: Thu, 24 Feb 2011 18:21:56 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D668BB8.1090707@mentor.com>
	<1298590758-8843-1-git-send-email-denis@denix.org>
In-Reply-To: <1298590758-8843-1-git-send-email-denis@denix.org>
X-OriginalArrivalTime: 25 Feb 2011 01:22:10.0109 (UTC)
	FILETIME=[6C7FEED0:01CBD48A]
Subject: Re: [PATCH 1/3] bitbake.conf, native*.bbclass: pass --sysroot to TOOLCHAIN_OPTIONS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Feb 2011 01:23:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2011 04:39 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko<denys@ti.com>
>
> Commit 9c5b9db29738a89837917b1a2d8ee5a1cae0b4cc (bitbake.conf: Simplify
> TARGET_CPPFLAGS/LDFLAGS) potentially breaks external toolchains, when their
> default sysroot is different from our sysroot/staging location.
>
> Pass default --sysroot to compiler/linker through TOOLCHAIN_OPTIONS, avoiding
> native and nativesdk packages. This matches the corresponding changes in Poky.
> cross.bbclass was already doing it, since it originated from Poky, AFAIK.
>
> Signed-off-by: Denys Dmytriyenko<denys@ti.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>   classes/native.bbclass    |    2 ++
>   classes/nativesdk.bbclass |    2 ++
>   conf/bitbake.conf         |    2 +-
>   3 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/classes/native.bbclass b/classes/native.bbclass
> index 000ad61..b8a792f 100644
> --- a/classes/native.bbclass
> +++ b/classes/native.bbclass
> @@ -37,6 +37,8 @@ CXXFLAGS = "${BUILD_CFLAGS}"
>   LDFLAGS = "${BUILD_LDFLAGS}"
>   LDFLAGS_build-darwin = "-L${STAGING_LIBDIR_NATIVE} "
>
> +TOOLCHAIN_OPTIONS = ""
> +
>   STAGING_BINDIR = "${STAGING_BINDIR_NATIVE}"
>   STAGING_BINDIR_CROSS = "${STAGING_BINDIR_NATIVE}"
>
> diff --git a/classes/nativesdk.bbclass b/classes/nativesdk.bbclass
> index 6f21534..6689399 100644
> --- a/classes/nativesdk.bbclass
> +++ b/classes/nativesdk.bbclass
> @@ -36,6 +36,8 @@ CFLAGS = "${BUILDSDK_CFLAGS}"
>   CXXFLAGS = "${BUILDSDK_CFLAGS}"
>   LDFLAGS = "${BUILDSDK_LDFLAGS}"
>
> +TOOLCHAIN_OPTIONS = ""
> +
>   # Change to place files in SDKPATH
>   prefix = "${SDKPATH}"
>   exec_prefix = "${SDKPATH}"
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 34f7726..1002c01 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -460,7 +460,7 @@ export PATH
>   ##################################################################
>
>   CCACHE ?= ""
> -TOOLCHAIN_OPTIONS = ""
> +TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
>   TOOLCHAIN_PATH ?= "${STAGING_DIR_NATIVE}${prefix_native}/${BASE_PACKAGE_ARCH}"
>   TOOLCHAIN_SYSPATH ?= "${TOOLCHAIN_PATH}/${TARGET_SYS}"
>


-- 
Tom Rini
Mentor Graphics Corporation


