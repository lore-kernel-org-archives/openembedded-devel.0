Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Md38V-0004qd-W3
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Aug 2009 16:24:38 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id B605E1B10C0A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Aug 2009 14:11:18 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Aug 2009 16:06:57 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <4A8960BC.4000603@cam.ac.uk>
In-Reply-To: <4A8960BC.4000603@cam.ac.uk>
MIME-Version: 1.0
Message-Id: <200908171606.57153.holger+oe@freyther.de>
Subject: Re: [PATCH] glibc 2.7 and 2.9 (arm): Remove unnecessary asm/page.h include
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
X-List-Received-Date: Mon, 17 Aug 2009 14:24:44 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 17 August 2009 15:53:00 you wrote:
> Fix compile bug for arm with recent kernel headers
> ../ports/sysdeps/unix/sysv/linux/arm/ioperm.c:48:22: error: asm/page.h: No
> such file or directory
>
> Signed-off-by: Jonathan Cameron <jic23@cam.ac.uk>

Signed-off-by: Holger Hans Peter Freyther <zecke@selfish.org>

One note worthy comment. Normally we only bump the PR when the packaged 
content is changing. In one way we had a build error so the packaging didn't 
change at all, in another way we do have existing glibc packages...

To be honest I wonder why you are triggering this area, and why other builds 
don't do that... it is  a bit frightening.



> ---
> Update to previous posting under
> [PATCH] glibc 2.9: Remove unnecessary asm/page.h include, not present in
> recent headers
>
> This patch is already included by the 2.6.1 recipe (thanks Khem)
> Prevents the following error with recent kernel headers
> ../ports/sysdeps/unix/sysv/linux/arm/ioperm.c:48:22: error: asm/page.h: No
> such file or directory
>
> Fixes problem with 2.6.29 headers against both glibc 2.7 and 2.9
>
> Related bug reports (with equivalent solutions)
> http://www.mail-archive.com/debian-glibc@lists.debian.org/msg38393.html
> http://sourceware.org/ml/crossgcc/2008-05/msg00014.html
> http://sourceware.org/ml/libc-ports/2008-04/msg00005.html
>
> Bug no longer exists at head of glibc ports tree. May effect other
> versions.
>
>  recipes/glibc/glibc_2.7.bb |    3 ++-
>  recipes/glibc/glibc_2.9.bb |    3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/glibc/glibc_2.7.bb b/recipes/glibc/glibc_2.7.bb
> index f152756..dcea69c 100644
> --- a/recipes/glibc/glibc_2.7.bb
> +++ b/recipes/glibc/glibc_2.7.bb
> @@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET = "arm"
>  PACKAGES_DYNAMIC = "libc6*"
>  RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
>
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>
>  # the -isystem in bitbake.conf screws up glibc do_stage
>  BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
> @@ -68,6 +68,7 @@ SRC_URI =
> "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
> file://etc/ld.so.conf \
>             file://generate-supported.mk \
>             file://march-i686.patch;patch=1;pnum=0 \
> +	   file://glibc-arm-no-asm-page.patch;patch=1 \
>             "
>
>
> diff --git a/recipes/glibc/glibc_2.9.bb b/recipes/glibc/glibc_2.9.bb
> index 6e323aa..9849c0a 100644
> --- a/recipes/glibc/glibc_2.9.bb
> +++ b/recipes/glibc/glibc_2.9.bb
> @@ -5,7 +5,7 @@ ARM_INSTRUCTION_SET = "arm"
>  PACKAGES_DYNAMIC = "libc6*"
>  RPROVIDES_${PN}-dev = "libc6-dev virtual-libc-dev"
>
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>
>  # the -isystem in bitbake.conf screws up glibc do_stage
>  BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
> @@ -65,6 +65,7 @@ SRC_URI =
> "ftp://ftp.gnu.org/pub/gnu/glibc/glibc-${PV}.tar.bz2 \
> file://generate-supported.mk \
>             file://march-i686.patch;patch=1;pnum=0 \
>  	   file://tls_i486.patch;patch=1 \
> +	   file://glibc-arm-no-asm-page.patch;patch=1 \
>             "


