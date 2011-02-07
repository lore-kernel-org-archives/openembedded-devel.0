Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PmU5L-0004aw-Ep for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 17:37:07 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PmU4O-0005YJ-9D for openembedded-devel@lists.openembedded.org;
	Mon, 07 Feb 2011 17:36:08 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Feb 2011 17:36:07 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Feb 2011 17:36:07 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 07 Feb 2011 17:35:55 +0100
Message-ID: <iip71b$7tv$1@dough.gmane.org>
References: <1297093986-24331-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<1297093986-24331-2-git-send-email-enrico.scholz@sigma-chemnitz.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1297093986-24331-2-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] gcc-4.5: added thumb2 build patch
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
X-List-Received-Date: Mon, 07 Feb 2011 16:37:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07-02-11 16:53, Enrico Scholz wrote:
> Fix for http://gcc.gnu.org/bugzilla/show_bug.cgi?id=43999 and is
> required to build gcc for Thumb2 only architectures (e.g. Cortex-M3).
> 
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
> ---
>  recipes/gcc/gcc-4.5.inc                |    3 ++-
>  recipes/gcc/gcc-4.5/thumb2-build.patch |   11 +++++++++++
>  2 files changed, 13 insertions(+), 1 deletions(-)
>  create mode 100644 recipes/gcc/gcc-4.5/thumb2-build.patch
> 
> diff --git a/recipes/gcc/gcc-4.5.inc b/recipes/gcc/gcc-4.5.inc
> index b630528..9ba2e22 100644
> --- a/recipes/gcc/gcc-4.5.inc
> +++ b/recipes/gcc/gcc-4.5.inc
> @@ -8,7 +8,7 @@ DEPENDS = "mpfr gmp libmpc libelf"
>  NATIVEDEPS = "mpfr-native gmp-native libmpc-native"
>  
>  
> -INC_PR = "r31"
> +INC_PR = "r32"
>  
>  SRCREV = "168622"
>  PV = "4.5"
> @@ -166,6 +166,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH} \
>  #	   file://linaro/gcc-4.5-linaro-r99457.patch \
>  	   file://gcc-scalar-widening-pr45847.patch \
>  	   file://gcc-arm-volatile-bitfield-fix.patch \
> +	   file://thumb2-build.patch \
>  	  "
>  
>  SRC_URI_append_mips64 = " file://mips64-nomultilib.patch "
> diff --git a/recipes/gcc/gcc-4.5/thumb2-build.patch b/recipes/gcc/gcc-4.5/thumb2-build.patch
> new file mode 100644
> index 0000000..8fefbfa
> --- /dev/null
> +++ b/recipes/gcc/gcc-4.5/thumb2-build.patch
> @@ -0,0 +1,11 @@
> +Index: gcc/config/arm/lib1funcs.asm
> +===================================================================
> +--- a/gcc/config/arm/lib1funcs.asm	(revision 163231)
> ++++ b/gcc/config/arm/lib1funcs.asm	(working copy)
> +@@ -642,5 +642,5 @@
> + 	cmp	\dividend, #0			@ Early termination?
> +-	do_it	hs, t
> ++	do_it	ne, t
> + 	movnes	\curbit,   \curbit,  lsr #4	@ No, any more bits to do?
> + 	movne	\divisor,  \divisor, lsr #4
> + 	bne	1b

COuld you please add some more information to the thumb2-build.patch
file? The author and bugzilla link should be enough.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNUB9rMkyGM64RGpERArtIAJsGlpCCEoVhxGVTNKyUAc1tFak9tACeJuvO
4aiwFXOVPWtxIRXxQfTsXFg=
=hrQn
-----END PGP SIGNATURE-----



