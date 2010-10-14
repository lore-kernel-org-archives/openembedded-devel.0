Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P6ICR-0008SB-Bo for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 09:26:05 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P6IBy-0000Ku-UX for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 09:25:34 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 09:25:34 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 09:25:34 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 14 Oct 2010 09:25:27 +0200
Message-ID: <i96b97$hgk$1@dough.gmane.org>
References: <i94r56$spo$1@dough.gmane.org>
	<1287005185-27109-1-git-send-email-bengardiner@nanometrics.ca>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <1287005185-27109-1-git-send-email-bengardiner@nanometrics.ca>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] distro, toolchain-external: override TARGET_VENDOR with TOOLCHAIN_VENDOR
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
X-List-Received-Date: Thu, 14 Oct 2010 07:26:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

For the angstrom part:

Signed-off-by: Koen Kooi <koen@openembedded.org>

On 13-10-10 23:26, Ben Gardiner wrote:
> Trying to use an external toolchain like the 2009q1 toolchain from codesourcery
> has some strange results since the toolchain has vendor 'none' but
> distributions like angstrom set TARGET_VENDOR unconditionally.
> 
> This patch overrides the TARGET_VENDOR with the value of TOOLCHAIN_VENDOR,
> if set. TOOLCHAIN_VENDOR can be set in the local configuration alongside the
> other TOOLCHAIN_* variables. The override is performed in
> toolchain-external.inc, as suggested by Koen Kooi [1]. It also reorders the
> inclusion of the distro and toolchain-* so that toolchain-external can override
> the value of TARGET_VENDOR, as suggested by Denys Dmytriyenko [2].
> 
> Tested with angstrom-2008.1 and the codesourcery 2009q1 toolchain by assigning
> TOOLCHAIN_VENDOR = "-none"
> TOOLCHAIN_TYPE = "external"
> TOOLCHAIN_BRAND = "csl"
> , in addition to putting the CSL in the PATH.
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> CC: Koen Kooi <k.kooi@student.utwente.nl>
> CC: Víctor M. Jáquez L. <vjaquez@igalia.com>
> CC: CC: Denys Dmytriyenko <denis@denix.org>
> 
> [1] http://article.gmane.org/gmane.comp.handhelds.openembedded/38053
> [2] http://article.gmane.org/gmane.comp.handhelds.openembedded/38188
> ---
>  conf/distro/angstrom-2008.1.conf           |    8 ++++----
>  conf/distro/angstrom-2010.x.conf           |    8 ++++----
>  conf/distro/include/toolchain-external.inc |    2 ++
>  conf/distro/kaeilos.conf                   |    8 ++++----
>  4 files changed, 14 insertions(+), 12 deletions(-)
> 
> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
> index ec4f21e..1fd5ab6 100644
> --- a/conf/distro/angstrom-2008.1.conf
> +++ b/conf/distro/angstrom-2008.1.conf
> @@ -124,10 +124,6 @@ PREFERRED_VERSION_binutils_avr32 = "2.17"
>  PREFERRED_VERSION_binutils-cross_avr32 = "2.17"
>  PREFERRED_VERSION_binutils-cross-sdk_avr32 = "2.17"
>  
> -# Toolchain virtuals:
> -require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
> -require conf/distro/include/arm-thumb.inc
> -
>  PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
>  PREFERRED_PROVIDER_hotplug               = "udev"
>  PREFERRED_PROVIDER_opkg                 ?= "opkg"
> @@ -143,6 +139,10 @@ ANGSTROMLIBC ?= "glibc"
>  
>  require conf/distro/include/angstrom.inc
>  
> +# Toolchain virtuals:
> +require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
> +require conf/distro/include/arm-thumb.inc
> +
>  # Set DISTRO_FEED_CONFIGS to our config var, assigned in the above .inc
>  DISTRO_FEED_CONFIGS = "${ANGSTROM_FEED_CONFIGS}"
>  
> diff --git a/conf/distro/angstrom-2010.x.conf b/conf/distro/angstrom-2010.x.conf
> index b872450..8693cda 100644
> --- a/conf/distro/angstrom-2010.x.conf
> +++ b/conf/distro/angstrom-2010.x.conf
> @@ -114,10 +114,6 @@ PREFERRED_VERSION_binutils_avr32 = "2.17"
>  PREFERRED_VERSION_binutils-cross_avr32 = "2.17"
>  PREFERRED_VERSION_binutils-cross-sdk_avr32 = "2.17"
>  
> -# Toolchain virtuals:
> -require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
> -require conf/distro/include/arm-thumb.inc
> -
>  PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
>  PREFERRED_PROVIDER_hotplug               = "udev"
>  PREFERRED_PROVIDER_opkg                 ?= "opkg"
> @@ -131,6 +127,10 @@ ANGSTROM_BLACKLIST_pn-ipkg			= "ipkg has been superseded by opkg"
>  
>  require conf/distro/include/angstrom.inc
>  
> +# Toolchain virtuals:
> +require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
> +require conf/distro/include/arm-thumb.inc
> +
>  # Set DISTRO_FEED_CONFIGS to our config var, assigned in the above .inc
>  DISTRO_FEED_CONFIGS = "${ANGSTROM_FEED_CONFIGS}"
>  
> diff --git a/conf/distro/include/toolchain-external.inc b/conf/distro/include/toolchain-external.inc
> index ff83f5a..585d50e 100644
> --- a/conf/distro/include/toolchain-external.inc
> +++ b/conf/distro/include/toolchain-external.inc
> @@ -6,3 +6,5 @@ PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-toolchain-${TOOLCHAIN
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-toolchain-${TOOLCHAIN_BRAND}"
>  #PREFERRED_PROVIDER_linux-libc-headers = "external-toolchain-${TOOLCHAIN_BRAND}"
>  
> +TOOLCHAIN_VENDOR ?= "${TARGET_VENDOR}"
> +TARGET_VENDOR = "${TOOLCHAIN_VENDOR}"
> diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
> index 1287ea1..6625ba1 100644
> --- a/conf/distro/kaeilos.conf
> +++ b/conf/distro/kaeilos.conf
> @@ -119,10 +119,6 @@ PREFERRED_VERSION_binutils_avr32 = "2.17"
>  PREFERRED_VERSION_binutils-cross_avr32 = "2.17"
>  PREFERRED_VERSION_binutils-cross-sdk_avr32 = "2.17"
>  
> -# Toolchain virtuals:
> -require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
> -require conf/distro/include/arm-thumb.inc
> -
>  PREFERRED_PROVIDER_dbus-glib             = "dbus-glib"
>  PREFERRED_PROVIDER_hotplug               = "udev"
>  PREFERRED_PROVIDER_opkg                 ?= "opkg"
> @@ -135,6 +131,10 @@ ANGSTROM_BLACKLIST_pn-fso-apm       = "regular apmd is good enough"
>  
>  require conf/distro/include/kaeilos.inc
>  
> +# Toolchain virtuals:
> +require conf/distro/include/toolchain-${TOOLCHAIN_TYPE}.inc
> +require conf/distro/include/arm-thumb.inc
> +
>  # If we're using an .ipk based rootfs, we want to have opkg installed so postinst script can run
>  # We also take this opportunity to inject angstrom-version and the feed configs into the rootfs
>  IPKG_VARIANT = "opkg angstrom-version ${ANGSTROM_FEED_CONFIGS}"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMtrBmMkyGM64RGpERAowsAJkBS8Frfu7Esx+5cWdOprO5yGCelgCfUlyC
5Eo7/8LDBos6wZir903GRRI=
=M8RJ
-----END PGP SIGNATURE-----



