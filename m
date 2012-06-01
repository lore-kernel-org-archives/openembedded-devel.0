Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1SaMhX-0001yA-B8
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2012 09:55:15 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69) with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SaMXY-0006LM-QC>; Fri, 01 Jun 2012 09:44:56 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69) with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SaMXY-0007JG-NS>; Fri, 01 Jun 2012 09:44:56 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1SaMXW-00026j-KN; Fri, 01 Jun 2012 09:44:54 +0200
Date: Fri, 1 Jun 2012 09:44:54 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120601074454.GB8017@mi.fu-berlin.de>
References: <1337075791-8745-1-git-send-email-jlu@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <1337075791-8745-1-git-send-email-jlu@pengutronix.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: Re: [meta-java][PATCH] jamvm: work around min heap size greater than max error
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
X-List-Received-Date: Fri, 01 Jun 2012 07:55:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 15, 2012 at 11:56:31AM +0200, Jan Luebbe wrote:
> On system with large amounts of RAM (such as 96GB), the default
> initial heap size is larger than the max heap size specified in
> some build commands. Set min_heap to the max_heap value in those
> cases instead.
> 
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> ---
>  recipes-core/jamvm/jamvm/jamvm-minmax-heap.patch |   15 +++++++++++++++
>  recipes-core/jamvm/jamvm_git.bb                  |    3 ++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-core/jamvm/jamvm/jamvm-minmax-heap.patch
> 
> diff --git a/recipes-core/jamvm/jamvm/jamvm-minmax-heap.patch b/recipes-core/jamvm/jamvm/jamvm-minmax-heap.patch
> new file mode 100644
> index 0000000..bf0fda5
> --- /dev/null
> +++ b/recipes-core/jamvm/jamvm/jamvm-minmax-heap.patch
> @@ -0,0 +1,15 @@
> +diff --git a/src/jam.c b/src/jam.c
> +index b76ce8b..dc5eac3 100644
> +--- a/src/jam.c
> ++++ b/src/jam.c
> +@@ -133,9 +133,7 @@ int parseCommandLine(int argc, char *argv[], InitArgs *args) {
> +     for(i = 1; i < argc; i++) {
> +         if(*argv[i] != '-') {
> +             if(args->min_heap > args->max_heap) {
> +-                printf("Minimum heap size greater than max!\n");
> +-                status = 1;
> +-                goto exit;
> ++                args->min_heap = args->max_heap;
> +             }
> + 
> +             if(args->props_count) {
> diff --git a/recipes-core/jamvm/jamvm_git.bb b/recipes-core/jamvm/jamvm_git.bb
> index 2a4213b..7b28600 100644
> --- a/recipes-core/jamvm/jamvm_git.bb
> +++ b/recipes-core/jamvm/jamvm_git.bb
> @@ -6,11 +6,12 @@ require jamvm.inc
>  SRCREV = "4617da717ecb05654ea5bb9572338061106a414d"
>  PV = "1.5.5+1.6.0-devel+git${SRCPV}"
>  
> -PR = "r1"
> +PR = "r2"
>  
>  SRC_URI = "git://git.berlios.de/jamvm;protocol=git \
>             file://jamvm-jni_h-noinst.patch \
>             file://libffi.patch \
> +           file://jamvm-minmax-heap.patch \
>            "
>  
>  S = "${WORKDIR}/git"
> -- 
> 1.7.10

Thanks for the patch, it was applied to meta-java master and jdk-7 branch.

Bye Henning


