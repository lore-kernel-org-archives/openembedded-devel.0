Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q5wRY-00048A-R9 for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 10:44:28 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Q5wPW-0002T7-SL for openembedded-devel@lists.openembedded.org;
	Sat, 02 Apr 2011 10:42:22 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Apr 2011 10:42:22 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Apr 2011 10:42:22 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 02 Apr 2011 10:40:28 +0200
Message-ID: <in6nds$ub9$1@dough.gmane.org>
References: <cover.1301695158.git.raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <cover.1301695158.git.raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 0/7] Uclibc update for meta-oe
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
X-List-Received-Date: Sat, 02 Apr 2011 08:44:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 02-04-11 00:02, Khem Raj wrote:
> This brings in uclibc-git from oe with new set of patches needed to compile 
> lot more software using uclibc into meta-oe
> 
> Pull URL: git://git.openembedded.org/meta-openembedded-contrib
>   Branch: kraj/uclibc-meta-oe
>   Browse: http://git.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=kraj/uclibc-meta-oe

Thanks, merged into master!

> 
> Thanks,
>     Khem Raj <raj.khem@gmail.com>
> ---
> 
> 
> Khem Raj (7):
>   uclibc: Add uclibc 0.9.32(to be)
>   siteinfo.bbclass: Use linux-uclibceabi instead of uclibcgnueabi
>   openssl-0.9.8m, binutils-2.20.1: Use linux-uclibceabi instead of
>     uclibcgnueabi
>   proxy-libintl: Bring in recipes from OE
>   dbus.inc: Add missing dependency on libxdmcp
>   gcc-runtime_4.5.bb: Remove construct to filter
>     -feliminate-dwarf2-dups
>   libgpg-error_1.8.bb: Inherit gettext
> 
>  meta-oe/classes/siteinfo.bbclass                   |    4 +-
>  .../openssl/openssl-0.9.8m/configure-targets.patch |    4 +-
>  meta-oe/recipes-core/dbus/dbus.inc                 |    2 +-
>  .../create-as-shared-lib.patch                     |   31 +
>  .../proxy-libintl-20080418/soname.patch            |   23 +
>  .../proxy-libintl-20080418/stub-only.patch         |   72 +
>  .../proxy-libintl/proxy-libintl_20080418.bb        |   39 +
>  meta-oe/recipes-core/uclibc/site_config/funcs      |  474 ++
>  meta-oe/recipes-core/uclibc/site_config/headers    |  156 +
>  meta-oe/recipes-core/uclibc/site_config/types      |   21 +
>  meta-oe/recipes-core/uclibc/uClibc.distro          |  157 +
>  meta-oe/recipes-core/uclibc/uclibc-config.inc      |  116 +
>  .../uclibc/uclibc-git/argp-headers.patch           |  581 +++
>  .../uclibc/uclibc-git/argp-support.patch           | 5189 ++++++++++++++++++++
>  .../uclibc/uclibc-git/arm/uClibc.machine           |   69 +
>  .../uclibc/uclibc-git/armeb/uClibc.machine         |   53 +
>  .../uclibc/uclibc-git/armv5te/uClibc.machine       |   76 +
>  .../uclibc/uclibc-git/detect-bx-availibility.patch |   75 +
>  .../uclibc/uclibc-git/efika/uClibc.machine         |   45 +
>  .../uclibc/uclibc-git/fts-support.patch            | 1375 ++++++
>  .../uclibc/uclibc-git/i386/uClibc.machine          |   59 +
>  .../uclibc/uclibc-git/i486/uClibc.machine          |   62 +
>  .../uclibc/uclibc-git/i586/uClibc.machine          |   62 +
>  .../uclibc/uclibc-git/i686/uClibc.machine          |   59 +
>  .../uclibc/uclibc-git/include-arm-asm.h.patch      |   65 +
>  ...so_use_arm_dl_linux_resolve_in_thumb_mode.patch |   21 +
>  .../uclibc/uclibc-git/mips64/uClibc.machine        |   63 +
>  .../uclibc/uclibc-git/mipsel/uClibc.machine        |   63 +
>  .../uclibc/uclibc-git/nslu2be/uClibc.machine       |   73 +
>  .../uclibc/uclibc-git/powerpc/uClibc.machine       |   46 +
>  .../uclibc/uclibc-git/powerpc_copysignl.patch      |  107 +
>  .../uclibc/uclibc-git/qemuarm/uClibc.machine       |   76 +
>  .../uclibc/uclibc-git/qemumips/uClibc.machine      |   63 +
>  .../uclibc/uclibc-git/qemux86/uClibc.machine       |   59 +
>  .../uclibc-git/remove-eabi-oabi-selection.patch    |   91 +
>  .../uclibc-git/remove-sub-arch-variants.patch      |  215 +
>  .../uclibc-git/remove_attribute_optimize_Os.patch  |  186 +
>  .../uclibc/uclibc-git/reorder-use-BX.patch         |   72 +
>  .../uclibc/uclibc-git/select-force-thumb.patch     |  172 +
>  .../uclibc/uclibc-git/sh4/uClibc.machine           |   48 +
>  .../uclibc-git/transform-eabi-oabi-choice.patch    |   71 +
>  .../recipes-core/uclibc/uclibc-git/uClibc.distro   |  157 +
>  .../uclibc/uclibc-git/uclibc-arm-ftruncate64.patch |   13 +
>  .../uclibc-git/uclibc_enable_log2_test.patch       |   30 +
>  .../uclibc/uclibc-git/x86_64/uClibc.machine        |   42 +
>  meta-oe/recipes-core/uclibc/uclibc-initial_git.bb  |   33 +
>  meta-oe/recipes-core/uclibc/uclibc.inc             |  212 +
>  meta-oe/recipes-core/uclibc/uclibc_git.bb          |   44 +
>  .../binutils-2.20.1/110-arm-eabi-conf.patch        |    4 +-
>  meta-oe/recipes-devtools/gcc/gcc-runtime_4.5.bb    |    5 -
>  .../libgpg-error/libgpg-error_1.8.bb               |    2 +-
>  51 files changed, 10824 insertions(+), 13 deletions(-)
>  create mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/create-as-shared-lib.patch
>  create mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/soname.patch
>  create mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl-20080418/stub-only.patch
>  create mode 100644 meta-oe/recipes-core/proxy-libintl/proxy-libintl_20080418.bb
>  create mode 100644 meta-oe/recipes-core/uclibc/site_config/funcs
>  create mode 100644 meta-oe/recipes-core/uclibc/site_config/headers
>  create mode 100644 meta-oe/recipes-core/uclibc/site_config/types
>  create mode 100644 meta-oe/recipes-core/uclibc/uClibc.distro
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-config.inc
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/argp-headers.patch
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/argp-support.patch
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/arm/uClibc.machine
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/armeb/uClibc.machine
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/armv5te/uClibc.machine
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/detect-bx-availibility.patch
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/efika/uClibc.machine
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/fts-support.patch
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/i386/uClibc.machine
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/i486/uClibc.machine
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/i586/uClibc.machine
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/i686/uClibc.machine
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/include-arm-asm.h.patch
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/mips64/uClibc.machine
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/mipsel/uClibc.machine
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/nslu2be/uClibc.machine
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/powerpc/uClibc.machine
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/powerpc_copysignl.patch
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/qemuarm/uClibc.machine
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/qemumips/uClibc.machine
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/qemux86/uClibc.machine
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/remove-eabi-oabi-selection.patch
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/remove-sub-arch-variants.patch
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/remove_attribute_optimize_Os.patch
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/reorder-use-BX.patch
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/select-force-thumb.patch
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/sh4/uClibc.machine
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/transform-eabi-oabi-choice.patch
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/uClibc.config
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/uClibc.distro
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/uclibc-arm-ftruncate64.patch
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/uclibc_enable_log2_test.patch
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-git/x86_64/uClibc.machine
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc-initial_git.bb
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc.inc
>  create mode 100644 meta-oe/recipes-core/uclibc/uclibc_git.bb
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNluD7MkyGM64RGpERAhwmAJ43oZGUZZ82wI5ks0/V5gLMN2B27ACgmYMW
6rYXNxg3bR4GdF8WvckL8E4=
=Exzf
-----END PGP SIGNATURE-----



