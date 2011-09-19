Received: from mail-wy0-f169.google.com ([74.125.82.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1R5YTH-0006lg-R2
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Sep 2011 09:40:55 +0200
Received: by wyi11 with SMTP id 11so7847328wyi.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Sep 2011 00:35:40 -0700 (PDT)
Received: by 10.216.137.10 with SMTP id x10mr2398416wei.2.1316417739058;
	Mon, 19 Sep 2011 00:35:39 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id ex16sm24674135wbb.4.2011.09.19.00.35.37
	(version=SSLv3 cipher=OTHER); Mon, 19 Sep 2011 00:35:37 -0700 (PDT)
Message-ID: <4E76F0C8.8020804@dresearch-fe.de>
Date: Mon, 19 Sep 2011 09:35:36 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0.2) Gecko/20110907 Thunderbird/6.0.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1316084002-24149-1-git-send-email-sledz@dresearch-fe.de>
In-Reply-To: <1316084002-24149-1-git-send-email-sledz@dresearch-fe.de>
X-Enigmail-Version: 1.3.1
Subject: Re: [PATCH] linux-2.6.28: allow building with GNU make >= 3.82
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
X-List-Received-Date: Mon, 19 Sep 2011 07:40:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.09.2011 12:53, Steffen Sledz wrote:
> GNU make >= 3.82 does not allow mixed implicit and normal rules
> 
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> ---
>  recipes/linux/linux-2.6.28/make-3.82.patch |   40 ++++++++++++++++++++++++++++
>  recipes/linux/linux_2.6.28.bb              |    3 +-
>  2 files changed, 42 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/linux/linux-2.6.28/make-3.82.patch
> 
> diff --git a/recipes/linux/linux-2.6.28/make-3.82.patch b/recipes/linux/linux-2.6.28/make-3.82.patch
> new file mode 100644
> index 0000000..c22717e
> --- /dev/null
> +++ b/recipes/linux/linux-2.6.28/make-3.82.patch
> @@ -0,0 +1,40 @@
> +linux-2.6.28: allow building with GNU make >= 3.82
> +    
> +GNU make >= 3.82 does not allow mixed implicit and normal rules
> +
> +Because linux-2.6.28 is superseded by newer versions it makes no sense
> +to submit this patch upstream.
> +
> +Upstream-Status: Inappropriate [other]
> +
> +Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> +
> +diff -Nurd linux-2.6.28.orig//Makefile linux-2.6.28/Makefile
> +--- linux-2.6.28.orig//Makefile	2011-09-14 16:15:53.782945380 +0200
> ++++ linux-2.6.28/Makefile	2011-09-14 16:16:50.887123688 +0200
> +@@ -439,7 +439,11 @@
> + include $(srctree)/arch/$(SRCARCH)/Makefile
> + export KBUILD_DEFCONFIG KBUILD_KCONFIG
> + 
> +-config %config: scripts_basic outputmakefile FORCE
> ++config: scripts_basic outputmakefile FORCE
> ++	$(Q)mkdir -p include/linux include/config
> ++	$(Q)$(MAKE) $(build)=scripts/kconfig $@
> ++
> ++%config: scripts_basic outputmakefile FORCE
> + 	$(Q)mkdir -p include/linux include/config
> + 	$(Q)$(MAKE) $(build)=scripts/kconfig $@
> + 
> +@@ -1607,7 +1611,11 @@
> + 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> + 
> + # Modules
> +-/ %/: prepare scripts FORCE
> ++/: prepare scripts FORCE
> ++	$(cmd_crmodverdir)
> ++	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
> ++	$(build)=$(build-dir)
> ++%/: prepare scripts FORCE
> + 	$(cmd_crmodverdir)
> + 	$(Q)$(MAKE) KBUILD_MODULES=$(if $(CONFIG_MODULES),1) \
> + 	$(build)=$(build-dir)
> diff --git a/recipes/linux/linux_2.6.28.bb b/recipes/linux/linux_2.6.28.bb
> index 9cbb15e..1356378 100644
> --- a/recipes/linux/linux_2.6.28.bb
> +++ b/recipes/linux/linux_2.6.28.bb
> @@ -1,6 +1,6 @@
>  require linux.inc
>  
> -PR = "r15"
> +PR = "r16"
>  
>  # Mark archs/machines that this kernel supports
>  DEFAULT_PREFERENCE = "-1"
> @@ -18,6 +18,7 @@ DEFAULT_PREFERENCE_mini6410 = "1"
>  
>  SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-2.6.28.tar.bz2;name=kernel \
>             ${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/patch-${PV}.10.bz2;apply=yes;name=stablepatch \
> +           file://make-3.82.patch \
>             file://defconfig"
>  
>  SRC_URI_append_at91sam9263ek = " \

applied and pushed

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


