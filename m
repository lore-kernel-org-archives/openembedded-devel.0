Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rbfi0-0008CB-Ax
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 22:52:52 +0100
Received: by iakh37 with SMTP id h37so1513613iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 13:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Lk7YiO8RovuG1lmXy/2BwF6cZIKBAOoDrpPSgDAhstA=;
	b=FjqPz21LsP+lvbR1alwb8DB28e9oLLzZlu6Ksf4GouJAungOOZ0NjPQUY8z2sRDsK4
	vKRZzRKHejbKdHKdnsV8LBDf/Xs9h/1Yp7NVdNsqP7VmwkATaQu4ZsPpo4Ocwfjj8HQF
	f4nTGPsPMvOBQzfWsdzroOLV/2Eu5bPx6ui3Q=
Received: by 10.50.160.134 with SMTP id xk6mr10759769igb.59.1324071947028;
	Fri, 16 Dec 2011 13:45:47 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id e2sm36763007ibe.0.2011.12.16.13.45.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Dec 2011 13:45:45 -0800 (PST)
Date: Fri, 16 Dec 2011 13:46:02 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111216214602.GB28832@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <20111215132901.GC4419@jama.jama.net>
	<1323955898-31477-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1323955898-31477-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH][meta-oe][meta-efl 4/6] mplayer2: drop FULL_OPTIMIZATION_armv7a and add -fno-tree-vectorize
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
X-List-Received-Date: Fri, 16 Dec 2011 21:52:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/12/11 14:31), Martin Jansa wrote:
> * we had -ftree-vectorize instead of -frename-registers here, but that's
>   causing ICE with latest gcc-4.6 from meta-oe
> * qemux86-64 was still failing without -fno-tree-vectorize
> * similar to issue in libvpx
>   http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-November/036001.html
>   and lowering to -O3 is not enough in this case
>   | libmpcodecs/ad_imaadpcm.c: In function 'qt_ima_adpcm_decode_block':
>   | libmpcodecs/ad_imaadpcm.c:177:12: internal compiler error: Segmentation fault
>   | Please submit a full bug report,
>   | with preprocessed source if appropriate.
>   | See <http://gcc.gnu.org/bugs.html> for instructions.
>   | make: *** [libmpcodecs/ad_imaadpcm.o] Error 1
> 

can you create a preprocessed file for this please so we can look at it


> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb |    5 ++---
>  1 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> index ee64ca8..72d5754 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
> @@ -21,7 +21,7 @@ SRCREV = "e3f5043233336d8b4b0731c6a8b42a8fda5535ac"
>  ARM_INSTRUCTION_SET = "ARM"
>  
>  PV = "2.0+gitr${SRCPV}"
> -PR = "r3"
> +PR = "r4"
>  
>  PARALLEL_MAKE = ""
>  
> @@ -130,8 +130,7 @@ EXTRA_OECONF = " \
>  EXTRA_OECONF_append_armv6 = " --enable-armv6"
>  EXTRA_OECONF_append_armv7a = " --enable-armv6 --enable-neon"
>  
> -FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O4 -ffast-math"
> -FULL_OPTIMIZATION_armv7a = "-fexpensive-optimizations  -ftree-vectorize -fomit-frame-pointer -O4 -ffast-math"
> +FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O4 -ffast-math -fno-tree-vectorize"
>  BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
>  
>  CFLAGS_append = " -I${S}/libdvdread4 "
> -- 
> 1.7.8
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


