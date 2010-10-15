Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P6r37-0005yD-Ml
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 22:38:46 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LAC00IFRMMO96D2@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	15 Oct 2010 15:37:49 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8297D14AF64; Fri,
	15 Oct 2010 16:37:36 -0400 (EDT)
Date: Fri, 15 Oct 2010 16:37:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101015203736.GI11514@denix.org>
References: <1287174748-29216-1-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1287174748-29216-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH 1/2] Fix Angstrom OVERRIDES settings
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
X-List-Received-Date: Fri, 15 Oct 2010 20:38:46 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 15, 2010 at 03:32:27PM -0500, Chase Maupin wrote:
> * Use the new MACHINE_OVERRIDES variable in angstrom.inc to
>   set the FEED_ARCH and SOC_FAMILY OVERRIDES
>     * NOTE: These were left in their orignal order which will
>             result in the SOC_FAMILY being more specific than
>             the FEED_ARCH.  This was done on purpose as the
>             SOC_FAMILY should be more specific.  i.e. for omap3
>             the omap3 override is more specific than the armv7a
>             override.
> * Modified the glibc include files to prepend libc-glibc, etc
>   to the OVERRIDES list.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  conf/distro/include/angstrom.inc       |    2 +-
>  conf/distro/include/eglibc.inc         |    2 +-
>  conf/distro/include/glibc-external.inc |    2 +-
>  conf/distro/include/glibc-internal.inc |    2 +-
>  conf/distro/include/glibc.inc          |    2 +-
>  conf/distro/include/uclibc.inc         |    2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/conf/distro/include/angstrom.inc b/conf/distro/include/angstrom.inc
> index 8983c86..4b38cff 100644
> --- a/conf/distro/include/angstrom.inc
> +++ b/conf/distro/include/angstrom.inc
> @@ -14,7 +14,7 @@ TARGET_VENDOR = "-angstrom"
>  SOC_FAMILY ?= "Unknown"
>  
>  # Add FEED_ARCH and SOC_FAMILY to overrides
> -OVERRIDES .= ":${FEED_ARCH}:${SOC_FAMILY}"
> +MACHINE_OVERRIDES += "${FEED_ARCH} ${SOC_FAMILY}"
>  
>  # Put links to sources in deploy/sources to make it easier for people to be GPL compliant
>  INHERIT += "src_distribute_local"
> diff --git a/conf/distro/include/eglibc.inc b/conf/distro/include/eglibc.inc
> index 0443140..5115e7f 100644
> --- a/conf/distro/include/eglibc.inc
> +++ b/conf/distro/include/eglibc.inc
> @@ -1,5 +1,5 @@
>  # Add glibc overrides to the overrides for eglibc.
> -OVERRIDES .= ":libc-glibc"
> +OVERRIDES =. "libc-glibc:"
>  
>  # The things eglibc can provide.  We default to wanting eglibc to provide them.
>  PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc"
> diff --git a/conf/distro/include/glibc-external.inc b/conf/distro/include/glibc-external.inc
> index b84d237..fd72ee8 100644
> --- a/conf/distro/include/glibc-external.inc
> +++ b/conf/distro/include/glibc-external.inc
> @@ -1,5 +1,5 @@
>  # Add glibc to the overrides.
> -OVERRIDES .= ":libc-glibc"
> +OVERRIDES =. "libc-glibc:"
>  
>  # The things glibc can provide.  We default to wanting glibc to provide them.
>  PREFERRED_PROVIDER_virtual/libiconv ?= "external-toolchain-${TOOLCHAIN_BRAND}"
> diff --git a/conf/distro/include/glibc-internal.inc b/conf/distro/include/glibc-internal.inc
> index e06b9b0..6f84f5e 100644
> --- a/conf/distro/include/glibc-internal.inc
> +++ b/conf/distro/include/glibc-internal.inc
> @@ -1,5 +1,5 @@
>  # Add glibc to the overrides.
> -OVERRIDES .= ":libc-glibc"
> +OVERRIDES =. "libc-glibc:"
>  
>  # The things glibc can provide.  We default to wanting glibc to provide them.
>  PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
> diff --git a/conf/distro/include/glibc.inc b/conf/distro/include/glibc.inc
> index f1c80dc..5a6e3eb 100644
> --- a/conf/distro/include/glibc.inc
> +++ b/conf/distro/include/glibc.inc
> @@ -1,5 +1,5 @@
>  # Add glibc to the overrides.
> -OVERRIDES .= ":libc-glibc"
> +OVERRIDES =. "libc-glibc:"
>  
>  # The things glibc can provide.  We default to wanting glibc to provide them.
>  PREFERRED_PROVIDER_virtual/libiconv ?= "glibc"
> diff --git a/conf/distro/include/uclibc.inc b/conf/distro/include/uclibc.inc
> index b40fbf5..dd00647 100644
> --- a/conf/distro/include/uclibc.inc
> +++ b/conf/distro/include/uclibc.inc
> @@ -1,5 +1,5 @@
>  # Add uclibc overrides to the overrides.
> -OVERRIDES .= ":libc-uclibc"
> +OVERRIDES =. "libc-uclibc:"
>  
>  # The things uclibc can provide.  We default to wanting uclibc to provide them.
>  PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


