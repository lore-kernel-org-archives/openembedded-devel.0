Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PsmPU-0004Kg-RN
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 02:23:57 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PsmOB-0005Pe-L0 from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 17:22:35 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 24 Feb 2011 17:22:35 -0800
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Thu, 24 Feb 2011 17:22:34 -0800
Message-ID: <4D67044E.5050303@mentor.com>
Date: Thu, 24 Feb 2011 18:22:22 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <4D668BB8.1090707@mentor.com>	<1298590758-8843-1-git-send-email-denis@denix.org>
	<1298590758-8843-3-git-send-email-denis@denix.org>
In-Reply-To: <1298590758-8843-3-git-send-email-denis@denix.org>
X-OriginalArrivalTime: 25 Feb 2011 01:22:35.0484 (UTC)
	FILETIME=[7B9FD9C0:01CBD48A]
Subject: Re: [PATCH 3/3] gst-ffmpeg: remove 4-year old hack that sets CC	directly
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
X-List-Received-Date: Fri, 25 Feb 2011 01:23:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2011 04:39 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko<denys@ti.com>
>
> The hack that sets CC variable directly is 4 year old and no longer required.
> On the other hand, it now breaks setups when --sysroot needs to be passed to
> the toolchain. Hence, remove the hack.
>
> Signed-off-by: Denys Dmytriyenko<denys@ti.com>

Acked-by: Tom Rini <tom_rini@mentor.com>

> ---
>   recipes/gstreamer/gst-ffmpeg_0.10.11.bb |    6 ++----
>   1 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/recipes/gstreamer/gst-ffmpeg_0.10.11.bb b/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
> index 3a6533a..563521e 100644
> --- a/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
> +++ b/recipes/gstreamer/gst-ffmpeg_0.10.11.bb
> @@ -5,6 +5,8 @@ LICENSE = "LGPL"
>   HOMEPAGE = "http://www.gstreamer.net/"
>   DEPENDS = "ffmpeg gstreamer gst-plugins-base zlib"
>
> +PR = "r1"
> +
>   inherit autotools pkgconfig
>
>   SRC_URI = "http://gstreamer.freedesktop.org/src/${PN}/${PN}-${PV}.tar.bz2 \
> @@ -23,7 +25,3 @@ EXTRA_OECONF = " --with-system-ffmpeg "
>   # We do this because the install program is called with -s which causes it to
>   # call "strip" and it then mangles cross compiled stuff..
>   PATH_prepend := "${TOOLCHAIN_PATH}/${TARGET_SYS}/bin:"
> -
> -# Hack to get STAGING_LIBDIR into the linker path when building ffmpeg
> -CC = "${CCACHE} ${HOST_PREFIX}gcc ${TARGET_CC_ARCH} -L${STAGING_LIBDIR}"
> -


-- 
Tom Rini
Mentor Graphics Corporation


