Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MARlo-0001Pk-8J
	for openembedded-devel@openembedded.org; Sat, 30 May 2009 18:50:56 +0200
Received: (qmail 27435 invoked from network); 30 May 2009 16:42:23 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 30 May 2009 09:42:23 -0700
Date: Sat, 30 May 2009 09:42:22 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090530164222.GE23842@smtp.west.cox.net>
References: <Pine.LNX.4.64.0905260228240.6446@juice.ott.cti.com>
	<1243319696-16223-1-git-send-email-msmith@cbnco.com>
	<1243319696-16223-2-git-send-email-msmith@cbnco.com>
MIME-Version: 1.0
In-Reply-To: <1243319696-16223-2-git-send-email-msmith@cbnco.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 2/4] Replace obsolete base_set_filespath() with	FILESPATHPKG in some recipes.
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
X-List-Received-Date: Sat, 30 May 2009 16:50:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 26, 2009 at 02:34:54AM -0400, Michael Smith wrote:

> Signed-off-by: Michael Smith <msmith@cbnco.com>

Acked-by: Tom Rini <trini@embeddedalley.com>

> ---
> 
> Of these, the following were build tested:
> 
>  recipes/cherokee/cherokee-nossl_0.5.3.bb           |    2 +-
>  .../squashfs-lzma-tools-native_3.1r2.bb            |    2 +-
> 
> 
> The rest were not:
> 
>  recipes/freesmartphone/frameworkd-devel_git.bb     |    2 +-
>  recipes/initscripts/initscripts-openprotium_1.0.bb |    2 +-
>  recipes/vim/gvim_7.0.bb                            |    2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/recipes/cherokee/cherokee-nossl_0.5.3.bb b/recipes/cherokee/cherokee-nossl_0.5.3.bb
> index 4093660..3ea9068 100644
> --- a/recipes/cherokee/cherokee-nossl_0.5.3.bb
> +++ b/recipes/cherokee/cherokee-nossl_0.5.3.bb
> @@ -2,7 +2,7 @@ require cherokee_${PV}.bb
>  
>  DEPENDS = "libpcre"
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/cherokee-${PV}', '${FILE_DIRNAME}/cherokee', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> +FILESPATHPKG =. "cherokee-${PV}:cherokee:"
>  
>  S = "${WORKDIR}/cherokee-${PV}"
>  
> diff --git a/recipes/freesmartphone/frameworkd-devel_git.bb b/recipes/freesmartphone/frameworkd-devel_git.bb
> index f5f6c0b..a6439ee 100644
> --- a/recipes/freesmartphone/frameworkd-devel_git.bb
> +++ b/recipes/freesmartphone/frameworkd-devel_git.bb
> @@ -1,5 +1,5 @@
>  require frameworkd_git.bb
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/frameworkd', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> +FILESPATHPKG =. "frameworkd:"
>  PROVIDES = "frameworkd"
>  RPROVIDES = "frameworkd"
>  PV = "0.8.5.x+gitr${SRCREV}"
> diff --git a/recipes/initscripts/initscripts-openprotium_1.0.bb b/recipes/initscripts/initscripts-openprotium_1.0.bb
> index e787eed..aa20e29 100644
> --- a/recipes/initscripts/initscripts-openprotium_1.0.bb
> +++ b/recipes/initscripts/initscripts-openprotium_1.0.bb
> @@ -13,7 +13,7 @@ RCONFLICTS = "initscripts"
>  # a suffix
>  PR := "${PR}.11"
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/${P}', '${FILE_DIRNAME}/initscripts-${PV}', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> +FILESPATHPKG =. "${P}:initscripts-${PV}:"
>  
>  PACKAGES = "${PN}-dbg ${PN}"
>  
> diff --git a/recipes/squashfs-tools/squashfs-lzma-tools-native_3.1r2.bb b/recipes/squashfs-tools/squashfs-lzma-tools-native_3.1r2.bb
> index 5520896..8261ef5 100644
> --- a/recipes/squashfs-tools/squashfs-lzma-tools-native_3.1r2.bb
> +++ b/recipes/squashfs-tools/squashfs-lzma-tools-native_3.1r2.bb
> @@ -4,7 +4,7 @@ DEPENDS = "lzma-native"
>  
>  inherit native
>  
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/squashfs-tools-${PV}', '${FILE_DIRNAME}/squashfs-tools', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> +FILESPATHPKG =. "squashfs-tools-${PV}:squashfs-tools:"
>  PACKAGES = ""
>  
>  do_stage () {
> diff --git a/recipes/vim/gvim_7.0.bb b/recipes/vim/gvim_7.0.bb
> index 78a0c54..a073e65 100644
> --- a/recipes/vim/gvim_7.0.bb
> +++ b/recipes/vim/gvim_7.0.bb
> @@ -4,7 +4,7 @@ require vim.inc
>  
>  DEPENDS += "gtk+ xt"
>  PR = "r1"
> -FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/vim-7.0', '${FILE_DIRNAME}/vim', '${FILE_DIRNAME}/files', '${FILE_DIRNAME}' ], d)}"
> +FILESPATHPKG =. "vim-${PV}:vim:"
>  
>  EXTRA_OECONF = "--enable-gui=gtk2 --enable-gtk2-test --disable-gtktest \
>  		--disable-xim --with-features=big \
> -- 
> 1.5.6.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 
Tom Rini


