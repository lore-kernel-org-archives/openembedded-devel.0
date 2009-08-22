Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MetiJ-0006Qd-FK
	for openembedded-devel@lists.openembedded.org;
	Sat, 22 Aug 2009 18:45:13 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 2E04F5478F4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 12:27:40 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11312-05 for <openembedded-devel@lists.openembedded.org>; 
	Sat, 22 Aug 2009 12:27:40 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 0CD135473E5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Aug 2009 12:27:40 -0400 (EDT)
Date: Sat, 22 Aug 2009 12:27:40 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1247540261-4537-4-git-send-email-msmith@cbnco.com>
Message-ID: <Pine.LNX.4.64.0908221227320.3621@juice.ott.cti.com>
References: <1247540261-4537-1-git-send-email-msmith@cbnco.com>
	<1247540261-4537-2-git-send-email-msmith@cbnco.com>
	<1247540261-4537-3-git-send-email-msmith@cbnco.com>
	<1247540261-4537-4-git-send-email-msmith@cbnco.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 4/4] xorg-xserver-common: pass --enable-glx-tls
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
X-List-Received-Date: Sat, 22 Aug 2009 16:45:16 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


... and this one?

Thanks,
Mike

On Mon, 13 Jul 2009, Michael Smith wrote:

> Uses the same inherit as mesa-dri, so they both get the same answer.
> 
> Also switch to INC_PR.
> 
> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
>  recipes/xorg-xserver/xorg-xserver-common.inc |    4 +++-
>  recipes/xorg-xserver/xserver-xorg_1.2.0.bb   |    2 +-
>  recipes/xorg-xserver/xserver-xorg_1.3.0.0.bb |    2 +-
>  recipes/xorg-xserver/xserver-xorg_1.4.2.bb   |    2 +-
>  recipes/xorg-xserver/xserver-xorg_1.4.bb     |    2 +-
>  recipes/xorg-xserver/xserver-xorg_1.5.1.bb   |    2 +-
>  recipes/xorg-xserver/xserver-xorg_1.5.3.bb   |    2 +-
>  recipes/xorg-xserver/xserver-xorg_1.6.1.bb   |    2 +-
>  8 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/recipes/xorg-xserver/xorg-xserver-common.inc b/recipes/xorg-xserver/xorg-xserver-common.inc
> index ec56515..cfd350e 100644
> --- a/recipes/xorg-xserver/xorg-xserver-common.inc
> +++ b/recipes/xorg-xserver/xorg-xserver-common.inc
> @@ -2,6 +2,8 @@ HOMEPAGE = "http://www.x.org"
>  SECTION = "x11/base"
>  LICENSE = "MIT-X"
>  
> +INC_PR = "r12"
> +
>  PROVIDES = "virtual/xserver"
>  
>  DEPENDS = "hal fontconfig freetype flex-native lbxutil kbproto \ 
> @@ -21,7 +23,7 @@ SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
>  
>  S = "${WORKDIR}/${XORG_PN}-${PV}"
>  
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig glx-use-tls
>  
>  EXTRA_OECONF += " --enable-xcalibrate \
>                    --enable-kdrive \
> diff --git a/recipes/xorg-xserver/xserver-xorg_1.2.0.bb b/recipes/xorg-xserver/xserver-xorg_1.2.0.bb
> index 61f73b3..50d182c 100644
> --- a/recipes/xorg-xserver/xserver-xorg_1.2.0.bb
> +++ b/recipes/xorg-xserver/xserver-xorg_1.2.0.bb
> @@ -2,7 +2,7 @@ MESA_VER = "6.5.2"
>  
>  require xorg-xserver-common.inc
>  PE = "1"
> -PR = "r4"
> +PR = "${INC_PR}.0"
>  
>  export LDFLAGS += " -ldl "
>  
> diff --git a/recipes/xorg-xserver/xserver-xorg_1.3.0.0.bb b/recipes/xorg-xserver/xserver-xorg_1.3.0.0.bb
> index 9d6dca4..1efea75 100644
> --- a/recipes/xorg-xserver/xserver-xorg_1.3.0.0.bb
> +++ b/recipes/xorg-xserver/xserver-xorg_1.3.0.0.bb
> @@ -2,7 +2,7 @@ MESA_VER = "6.5.2"
>  
>  require xorg-xserver-common.inc
>  PE = "1"
> -PR = "r8"
> +PR = "${INC_PR}.0"
>  
>  SRC_URI += "file://drmfix.patch;patch=1 \
>              file://glyphstr.patch;patch=1"
> diff --git a/recipes/xorg-xserver/xserver-xorg_1.4.2.bb b/recipes/xorg-xserver/xserver-xorg_1.4.2.bb
> index 2c4f3d8..13cceb9 100644
> --- a/recipes/xorg-xserver/xserver-xorg_1.4.2.bb
> +++ b/recipes/xorg-xserver/xserver-xorg_1.4.2.bb
> @@ -4,7 +4,7 @@ DESCRIPTION = "the X.Org X server"
>  DEPENDS += "pixman"
>  RDEPENDS += "hal"
>  PE = "1"
> -PR = "r11"
> +PR = "${INC_PR}.0"
>  
>  SRC_URI += "file://drmfix.patch;patch=1 \
>              file://pkgconfig_fix.patch;patch=1 \
> diff --git a/recipes/xorg-xserver/xserver-xorg_1.4.bb b/recipes/xorg-xserver/xserver-xorg_1.4.bb
> index cb9ddcd..edd1ac0 100644
> --- a/recipes/xorg-xserver/xserver-xorg_1.4.bb
> +++ b/recipes/xorg-xserver/xserver-xorg_1.4.bb
> @@ -4,7 +4,7 @@ DESCRIPTION = "the X.Org X server"
>  DEPENDS += "pixman"
>  RDEPENDS += "hal"
>  PE = "1"
> -PR = "r9"
> +PR = "${INC_PR}.0"
>  
>  SRC_URI += "file://drmfix.patch;patch=1 \
>              file://pkgconfig_fix.patch;patch=1 \
> diff --git a/recipes/xorg-xserver/xserver-xorg_1.5.1.bb b/recipes/xorg-xserver/xserver-xorg_1.5.1.bb
> index d4b8caf..4c2efd5 100644
> --- a/recipes/xorg-xserver/xserver-xorg_1.5.1.bb
> +++ b/recipes/xorg-xserver/xserver-xorg_1.5.1.bb
> @@ -4,7 +4,7 @@ DESCRIPTION = "the X.Org X server"
>  DEPENDS += "pixman libpciaccess openssl"
>  RDEPENDS += "hal"
>  PE = "1"
> -PR = "r3"
> +PR = "${INC_PR}.0"
>  
>  SRC_URI += "file://drmfix.patch;patch=1 \
>              file://sysroot_fix.patch;patch=1"
> diff --git a/recipes/xorg-xserver/xserver-xorg_1.5.3.bb b/recipes/xorg-xserver/xserver-xorg_1.5.3.bb
> index 74ea3c4..3969724 100644
> --- a/recipes/xorg-xserver/xserver-xorg_1.5.3.bb
> +++ b/recipes/xorg-xserver/xserver-xorg_1.5.3.bb
> @@ -4,7 +4,7 @@ DESCRIPTION = "the X.Org X server"
>  DEPENDS += "pixman libpciaccess openssl"
>  RDEPENDS += "hal"
>  PE = "2"
> -PR = "r5"
> +PR = "${INC_PR}.0"
>  
>  SRC_URI += "file://drmfix.patch;patch=1 \
>              file://sysroot_fix.patch;patch=1 \
> diff --git a/recipes/xorg-xserver/xserver-xorg_1.6.1.bb b/recipes/xorg-xserver/xserver-xorg_1.6.1.bb
> index f2902cf..0c5a304 100644
> --- a/recipes/xorg-xserver/xserver-xorg_1.6.1.bb
> +++ b/recipes/xorg-xserver/xserver-xorg_1.6.1.bb
> @@ -4,7 +4,7 @@ DESCRIPTION = "the X.Org X server"
>  DEPENDS += "pixman libpciaccess openssl xineramaproto libxinerama"
>  RDEPENDS += "hal"
>  PE = "2"
> -PR = "r2"
> +PR = "${INC_PR}.0"
>  
>  SRC_URI += " \
>  	file://sysroot_fix.patch;patch=1 \
> -- 
> 1.6.3
> 


