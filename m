Received: from smtp-out04.alice.it ([85.37.17.100])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1O7w0v-0007QH-LJ
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Apr 2010 21:36:43 +0200
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out04.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 30 Apr 2010 21:32:58 +0200
Received: from FBCMCL01B07.fbc.local ([192.168.171.45]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 30 Apr 2010 21:32:58 +0200
Received: from [192.168.1.116] ([80.117.39.139]) by FBCMCL01B07.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 30 Apr 2010 21:32:57 +0200
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1272612823-16981-1-git-send-email-eric@eukrea.com>
References: <1272548191.2313.0.camel@gnutoo-desktop>
	<1272612823-16981-1-git-send-email-eric@eukrea.com>
Date: Fri, 30 Apr 2010 21:32:56 +0200
Message-ID: <1272655976.2381.0.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 30 Apr 2010 19:32:57.0734 (UTC)
	FILETIME=[EFFC3A60:01CAE89B]
X-SA-Exim-Connect-IP: 85.37.17.100
X-SA-Exim-Mail-From: GNUtoo@no-log.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] mplayer_svn : fix compilation problem
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
X-List-Received-Date: Fri, 30 Apr 2010 19:36:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2010-04-30 at 09:33 +0200, Eric Benard wrote:
> - this patch fix the following error (met for a x86 target) :
> 
> | loader/module.o: In function `MODULE_GetProcAddress':
> | module.c:(.text+0x125): undefined reference to `report_entry'
> | module.c:(.text+0x12f): undefined reference to `report_ret'
> | module.c:(.text+0x139): undefined reference to `wrapper_target'
> | module.c:(.text+0x13e): undefined reference to `wrapper'
> | loader/module.o: In function `LoadLibraryExA':
> | module.c:(.text+0x10d4): undefined reference to `report_entry'
> | module.c:(.text+0x10de): undefined reference to `report_ret'
> | module.c:(.text+0x10ea): undefined reference to `wrapper_target'
> | module.c:(.text+0x10f0): undefined reference to `wrapper'
> | collect2: ld returned 1 exit status
> | make: *** [mplayer] Error 1
> 
> - also add --disable-xss --disable-dga1 --disable-dga2 in order to
> prevent configure to autodetect these options which leads to a
> dependency problem.
> 
> Signed-off-by: Eric Benard <eric@eukrea.com>
> ---
> v2 : increase PR and add 3 options to configure
> 
>  recipes/mplayer/files/fix-emu_qtx_api.diff |   33 ++++++++++++++++++++++++++++
>  recipes/mplayer/mplayer_svn.bb             |    6 ++++-
>  2 files changed, 38 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/mplayer/files/fix-emu_qtx_api.diff
> 
> diff --git a/recipes/mplayer/files/fix-emu_qtx_api.diff b/recipes/mplayer/files/fix-emu_qtx_api.diff
> new file mode 100644
> index 0000000..e657475
> --- /dev/null
> +++ b/recipes/mplayer/files/fix-emu_qtx_api.diff
> @@ -0,0 +1,33 @@
> +http://bugs.gentoo.org/213836
> +
> +Fix the following error :
> +
> +| loader/module.o: In function `MODULE_GetProcAddress':
> +| module.c:(.text+0x125): undefined reference to `report_entry'
> +| module.c:(.text+0x12f): undefined reference to `report_ret'
> +| module.c:(.text+0x139): undefined reference to `wrapper_target'
> +| module.c:(.text+0x13e): undefined reference to `wrapper'
> +| loader/module.o: In function `LoadLibraryExA':
> +| module.c:(.text+0x10d4): undefined reference to `report_entry'
> +| module.c:(.text+0x10de): undefined reference to `report_ret'
> +| module.c:(.text+0x10ea): undefined reference to `wrapper_target'
> +| module.c:(.text+0x10f0): undefined reference to `wrapper'
> +| collect2: ld returned 1 exit status
> +| make: *** [mplayer] Error 1
> +
> +---
> +diff --git a/loader/module.c b/loader/module.c
> +index e316cf0..2023acb 100644
> +--- a/loader/module.c
> ++++ b/loader/module.c
> +@@ -9,8 +9,8 @@
> +  */
> + 
> + // define for quicktime calls debugging and/or MacOS-level emulation:
> +-#ifndef __APPLE__
> +-#define EMU_QTX_API
> ++#ifdef __APPLE__
> ++#undef EMU_QTX_API
> + #endif /* __APPLE__ */
> + 
> + // define for quicktime debugging (verbose logging):
> diff --git a/recipes/mplayer/mplayer_svn.bb b/recipes/mplayer/mplayer_svn.bb
> index dd94767..f26318c 100644
> --- a/recipes/mplayer/mplayer_svn.bb
> +++ b/recipes/mplayer/mplayer_svn.bb
> @@ -14,6 +14,7 @@ SRC_URI = "svn://svn.mplayerhq.hu/mplayer;module=trunk \
>         file://fix-exp.diff;patch=1;maxrev=30291 \
>  	   file://fix-addrinfo.patch;patch=1;maxrev=30302 \
>         file://fix-avconfig.diff;patch=1;maxrev=30376 \
> +	   file://fix-emu_qtx_api.diff;patch=1;maxrev=30165 \
>  "
>  
>  SRCREV = "30165"
> @@ -39,7 +40,7 @@ RCONFLICTS_${PN} = "mplayer-atty"
>  RREPLACES_${PN} = "mplayer-atty"
>  
>  PV = "0.0+1.0rc3+svnr${SRCPV}"
> -PR = "r19"
> +PR = "r20"
>  DEFAULT_PREFERENCE = "-1"
>  DEFAULT_PREFERENCE_angstrom = "1"
>  DEFAULT_PREFERENCE_shr = "1"
> @@ -156,6 +157,9 @@ EXTRA_OECONF = " \
>  	--disable-tga \
>  	--disable-pnm \
>  	--disable-md5sum \
> +	--disable-xss \
> +	--disable-dga1 \
> +	--disable-dga2 \
>  	\
>  	--enable-alsa \
>  	--enable-ossaudio \
Seems ok,I'll test it on 2 machines and if it's ok I'll push.
Ping me if I forget to do so.

Denis.




