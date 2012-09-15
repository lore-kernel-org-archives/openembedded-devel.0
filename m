Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TCzUc-0000bp-4a
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Sep 2012 23:01:34 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Sep 2012 13:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,428,1344236400"; d="scan'208";a="222511573"
Received: from unknown (HELO helios.localnet) ([10.252.121.222])
	by fmsmga002.fm.intel.com with ESMTP; 15 Sep 2012 13:48:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Sep 2012 21:48:54 +0100
Message-ID: <1690224.cSoWkHg7G9@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <1347482311-7068-1-git-send-email-andrea.adami@gmail.com>
References: <1347481415-4249-1-git-send-email-andrea.adami@gmail.com>
	<1347482311-7068-1-git-send-email-andrea.adami@gmail.com>
MIME-Version: 1.0
Subject: Re: [meta-handheld][PATCH v2] zaurus.inc: fix xserver/mesa virtual providers
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
X-List-Received-Date: Sat, 15 Sep 2012 21:01:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 12 September 2012 22:38:31 Andrea Adami wrote:
> * xserver-xorg-lite has been removed with commit 5868358
> * mesa-xlib has been removed with commit 7a815ca
> *
> * default-providers.inc gives following settings:
> * PREFERRED_PROVIDER_virtual/xserver ?=  "xserver-xorg"
> * PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
> * PREFERRED_PROVIDER_virtual/libgl ?= "mesa-dri"
> * PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa-dri"
> * PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa-dri"
> * PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  conf/machine/include/zaurus.inc |    7 +++----
>  1 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/conf/machine/include/zaurus.inc
> b/conf/machine/include/zaurus.inc index 3f5c642..99fd7bd 100644
> --- a/conf/machine/include/zaurus.inc
> +++ b/conf/machine/include/zaurus.inc
> @@ -60,10 +60,9 @@ EXTRA_IMAGECMD_sum.jffs2_collie = "--pad -l
> --eraseblock=0x20000 -n" # xserver
>  #########
> 
> -PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg-lite"
> -PREFERRED_PROVIDER_virtual/xserver-xf86 = "xserver-xorg-lite"
> -XSERVER = "xserver-xorg-lite xf86-video-fbdev xf86-input-keyboard
> xf86-input-mouse xf86-input-evdev" -PREFERRED_PROVIDER_virtual/libgl =
> "mesa-xlib"
> +# Zaurus gets preferred providers settings
> +# from distro/include/default-providers.inc
> +XSERVER = "xserver-xorg xf86-video-fbdev xf86-input-keyboard
> xf86-input-mouse xf86-input-evdev"
> 
>  ########
>  # kernel

Merged to meta-handheld master, thanks.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


