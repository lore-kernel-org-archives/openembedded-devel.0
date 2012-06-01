Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1SaMhB-0001tA-UP
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jun 2012 09:54:54 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69) with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SaMXD-0006GI-D7>; Fri, 01 Jun 2012 09:44:35 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69) with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SaMXD-0007GO-AY>; Fri, 01 Jun 2012 09:44:35 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1SaMXB-00026b-7y; Fri, 01 Jun 2012 09:44:33 +0200
Date: Fri, 1 Jun 2012 09:44:33 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120601074432.GA8017@mi.fu-berlin.de>
References: <4FA2448C.6050401@nedap.com>
	<1337075762-8696-1-git-send-email-jlu@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <1337075762-8696-1-git-send-email-jlu@pengutronix.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Cc: Jan Luebbe <jlu@pengutronix.de>
Subject: Re: [meta-java][PATCH] llvm2.8: fix llvm compile error by including unistd.h
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
X-List-Received-Date: Fri, 01 Jun 2012 07:54:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 15, 2012 at 11:56:02AM +0200, Jan Luebbe wrote:
> Thanks to Jaap de Jong and Khem Raj for reporing the problem and suggesting the fix.
> 
> Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> ---
>  recipes-core/llvm/llvm2.8/add-unistd.patch |   12 ++++++++++++
>  recipes-core/llvm/llvm2.8_2.8.bb           |    3 +++
>  2 files changed, 15 insertions(+)
>  create mode 100644 recipes-core/llvm/llvm2.8/add-unistd.patch
> 
> diff --git a/recipes-core/llvm/llvm2.8/add-unistd.patch b/recipes-core/llvm/llvm2.8/add-unistd.patch
> new file mode 100644
> index 0000000..1c51b30
> --- /dev/null
> +++ b/recipes-core/llvm/llvm2.8/add-unistd.patch
> @@ -0,0 +1,12 @@
> +Index: llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp
> +===================================================================
> +--- llvm-2.8.orig/lib/ExecutionEngine/JIT/Intercept.cpp	2012-05-14 18:31:21.008318473 +0200
> ++++ llvm-2.8/lib/ExecutionEngine/JIT/Intercept.cpp	2012-05-14 18:32:53.523734850 +0200
> +@@ -19,6 +19,7 @@
> + #include "llvm/Support/ErrorHandling.h"
> + #include "llvm/System/DynamicLibrary.h"
> + #include "llvm/Config/config.h"
> ++#include <unistd.h>
> + using namespace llvm;
> + 
> + // AtExitHandlers - List of functions to call when the program exits,
> diff --git a/recipes-core/llvm/llvm2.8_2.8.bb b/recipes-core/llvm/llvm2.8_2.8.bb
> index 310e94e..3459885 100644
> --- a/recipes-core/llvm/llvm2.8_2.8.bb
> +++ b/recipes-core/llvm/llvm2.8_2.8.bb
> @@ -4,9 +4,12 @@ require llvm.inc
>  LICENSE = "NCSA"
>  LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=0ac5f799a2d89477c75b0a378b221855"
>  
> +PR = "r1"
> +
>  SRC_URI += " \
>              file://30may-llvm2.8-pr399-ppc-arm.patch \
>              file://0019-issue6065.patch \
> +            file://add-unistd.patch \
>             "
>  
>  SRC_URI_append_arm = " file://llvm-mc_disable.patch "
> -- 
> 1.7.10

Thanks for the patch, it was applied to meta-java master and jdk-7 branch.

Bye Henning


