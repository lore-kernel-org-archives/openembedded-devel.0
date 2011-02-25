Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PsmPL-0004KS-7E
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 02:23:47 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1PsmO2-0005PI-06 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 17:22:26 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 24 Feb 2011 17:22:25 -0800
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Thu, 24 Feb 2011 17:22:25 -0800
Message-ID: <4D670444.2010207@mentor.com>
Date: Thu, 24 Feb 2011 18:22:12 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D668BB8.1090707@mentor.com>	<1298590758-8843-1-git-send-email-denis@denix.org>
	<1298590758-8843-2-git-send-email-denis@denix.org>
In-Reply-To: <1298590758-8843-2-git-send-email-denis@denix.org>
X-OriginalArrivalTime: 25 Feb 2011 01:22:25.0753 (UTC)
	FILETIME=[75D30490:01CBD48A]
Subject: Re: [PATCH 2/3] ffmpeg: pass --sysroot to configure script directly
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
X-List-Received-Date: Fri, 25 Feb 2011 01:23:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2011 04:39 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko<denys@ti.com>
>
> ffmpeg's custom configure script fails some checks for specific headers, even
> though we pass --sysroot through CFLAGS. Use configure's specific --sysroot
> option to fix that.
>
> Signed-off-by: Denys Dmytriyenko<denys@ti.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>   recipes/ffmpeg/ffmpeg_0.5.bb   |    3 ++-
>   recipes/ffmpeg/ffmpeg_0.6.1.bb |    3 ++-
>   recipes/ffmpeg/ffmpeg_git.bb   |    3 ++-
>   3 files changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/recipes/ffmpeg/ffmpeg_0.5.bb b/recipes/ffmpeg/ffmpeg_0.5.bb
> index f3a6d21..623c369 100644
> --- a/recipes/ffmpeg/ffmpeg_0.5.bb
> +++ b/recipes/ffmpeg/ffmpeg_0.5.bb
> @@ -2,7 +2,7 @@ require ffmpeg.inc
>
>   DEPENDS += "schroedinger libgsm"
>
> -PR = "${INC_PR}.1"
> +PR = "${INC_PR}.2"
>
>   DEFAULT_PREFERENCE = "1"
>
> @@ -47,6 +47,7 @@ EXTRA_OECONF = " \
>           --enable-cross-compile \
>           --extra-cflags="${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
>           --extra-ldflags="${TARGET_LDFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
> +        --sysroot="${STAGING_DIR_TARGET}" \
>           --enable-hardcoded-tables \
>           ${EXTRA_FFCONF} \
>   "
> diff --git a/recipes/ffmpeg/ffmpeg_0.6.1.bb b/recipes/ffmpeg/ffmpeg_0.6.1.bb
> index fb941a5..74a1161 100644
> --- a/recipes/ffmpeg/ffmpeg_0.6.1.bb
> +++ b/recipes/ffmpeg/ffmpeg_0.6.1.bb
> @@ -2,7 +2,7 @@ require ffmpeg.inc
>
>   LICENSE = "LGPLv2.1+"
>   DEPENDS += "schroedinger libgsm"
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>
>   SRC_URI = "http://ffmpeg.org/releases/ffmpeg-${PV}.tar.bz2"
>   SRC_URI[md5sum] = "4f5d732d25eedfb072251b5314ba2093"
> @@ -26,6 +26,7 @@ EXTRA_OECONF = " \
>           --enable-swscale \
>           --extra-cflags="${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
>           --extra-ldflags="${TARGET_LDFLAGS}" \
> +        --sysroot="${STAGING_DIR_TARGET}" \
>           --prefix=${prefix}/ \
>           --target-os=linux \
>           ${EXTRA_FFCONF} \
> diff --git a/recipes/ffmpeg/ffmpeg_git.bb b/recipes/ffmpeg/ffmpeg_git.bb
> index 27e88ea..24c81ea 100644
> --- a/recipes/ffmpeg/ffmpeg_git.bb
> +++ b/recipes/ffmpeg/ffmpeg_git.bb
> @@ -6,7 +6,7 @@ DEPENDS += "virtual/libsdl schroedinger libgsm libvpx"
>   SRCREV = "a4f5af13fb00d7f55946470bb0f52e1dbf5f3c6a"
>
>   PV = "0.6.1+${PR}+gitr${SRCPV}"
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>
>   DEFAULT_PREFERENCE = "-1"
>   DEFAULT_PREFERENCE_angstrom = "1"
> @@ -47,6 +47,7 @@ EXTRA_OECONF = " \
>           --enable-cross-compile \
>           --extra-cflags="${TARGET_CFLAGS} ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}" \
>           --extra-ldflags="${TARGET_LDFLAGS}" \
> +        --sysroot="${STAGING_DIR_TARGET}" \
>           --enable-hardcoded-tables \
>           ${EXTRA_FFCONF} \
>   "


-- 
Tom Rini
Mentor Graphics Corporation


