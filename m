Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QOYsn-0008WS-7L for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 19:25:33 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QOYpu-0000la-D9 for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 19:22:34 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2011 19:22:34 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2011 19:22:34 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 23 May 2011 19:22:21 +0200
Message-ID: <ire54d$f35$1@dough.gmane.org>
References: <1306170935-13946-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1306170935-13946-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH] uclibc: Recipes are moved to openembedde-core layer
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
X-List-Received-Date: Mon, 23 May 2011 17:25:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-05-11 19:15, raj.khem@gmail.com wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta-oe/recipes-core/uclibc/site_config/funcs      |  474 --
>  meta-oe/recipes-core/uclibc/site_config/headers    |  156 -
>  meta-oe/recipes-core/uclibc/site_config/types      |   21 -
>  meta-oe/recipes-core/uclibc/uClibc.distro          |  157 -
>  meta-oe/recipes-core/uclibc/uclibc-config.inc      |  116 -
>  .../uclibc/uclibc-git/argp-headers.patch           |  581 ---
>  .../uclibc/uclibc-git/argp-support.patch           | 5189 --------------------
>  .../uclibc/uclibc-git/arm/uClibc.machine           |   69 -
>  .../uclibc/uclibc-git/armeb/uClibc.machine         |   53 -
>  .../uclibc/uclibc-git/armv5te/uClibc.machine       |   76 -
>  .../uclibc/uclibc-git/detect-bx-availibility.patch |   75 -
>  .../uclibc/uclibc-git/efika/uClibc.machine         |   45 -
>  .../uclibc/uclibc-git/i386/uClibc.machine          |   59 -
>  .../uclibc/uclibc-git/i486/uClibc.machine          |   62 -
>  .../uclibc/uclibc-git/i586/uClibc.machine          |   62 -
>  .../uclibc/uclibc-git/i686/uClibc.machine          |   59 -
>  .../uclibc/uclibc-git/include-arm-asm.h.patch      |   65 -
>  ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |   21 -
>  .../uclibc/uclibc-git/mips64/uClibc.machine        |   63 -
>  .../uclibc/uclibc-git/mipsel/uClibc.machine        |   63 -
>  .../uclibc/uclibc-git/nslu2be/uClibc.machine       |   73 -
>  .../uclibc/uclibc-git/powerpc/uClibc.machine       |   46 -
>  .../uclibc/uclibc-git/powerpc_copysignl.patch      |  107 -
>  .../uclibc/uclibc-git/qemuarm/uClibc.machine       |   76 -
>  .../uclibc/uclibc-git/qemumips/uClibc.machine      |   63 -
>  .../uclibc/uclibc-git/qemux86/uClibc.machine       |   59 -
>  .../uclibc-git/remove-eabi-oabi-selection.patch    |   91 -
>  .../uclibc-git/remove-sub-arch-variants.patch      |  215 -
>  .../uclibc-git/remove_attribute_optimize_Os.patch  |  186 -
>  .../uclibc/uclibc-git/reorder-use-BX.patch         |   72 -
>  .../uclibc/uclibc-git/select-force-thumb.patch     |  172 -
>  .../uclibc/uclibc-git/sh4/uClibc.machine           |   48 -
>  .../uclibc-git/transform-eabi-oabi-choice.patch    |   71 -
>  .../recipes-core/uclibc/uclibc-git/uClibc.distro   |  160 -
>  .../uclibc/uclibc-git/uclibc-arm-ftruncate64.patch |   13 -
>  .../uclibc-git/uclibc_enable_log2_test.patch       |   30 -
>  .../uclibc/uclibc-git/x86_64/uClibc.machine        |   42 -
>  meta-oe/recipes-core/uclibc/uclibc-initial_git.bb  |   39 -
>  meta-oe/recipes-core/uclibc/uclibc.inc             |  215 -
>  meta-oe/recipes-core/uclibc/uclibc_git.bb          |   31 -
>  40 files changed, 0 insertions(+), 9275 deletions(-)

Do you really want to delete them, or do you want keep them to provide a
staging area for changes flowing into oe-core?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN2pfNMkyGM64RGpERAiO9AKCa3F4M6BQczpV6JNiUv8nrSPPIJwCfbXDc
O9LVvVLwgWHEGvedp8X5A3c=
=s3ms
-----END PGP SIGNATURE-----



