Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1SrxL2-0008ON-Jc
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 22:28:44 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69) with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SrxA4-0005e5-I9>; Thu, 19 Jul 2012 22:17:24 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69) with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SrxA4-0007xO-Am>; Thu, 19 Jul 2012 22:17:24 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1SrxA2-0007QH-7r; Thu, 19 Jul 2012 22:17:22 +0200
Date: Thu, 19 Jul 2012 22:17:22 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120719201721.GA28427@mi.fu-berlin.de>
References: <1342576568-31044-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1342576568-31044-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Cc: Khem Raj <rak.khem@gmail.com>
Subject: Re: [meta-java][PATCH 1/3] llvm: Use default PACKAGES var
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
X-List-Received-Date: Thu, 19 Jul 2012 20:28:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 17, 2012 at 06:56:06PM -0700, Khem Raj wrote:
> avoids packaging errors with oe-core master
> 
> Signed-off-by: Khem Raj <rak.khem@gmail.com>
> ---
>  recipes-core/llvm/llvm.inc |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/recipes-core/llvm/llvm.inc b/recipes-core/llvm/llvm.inc
> index 578cd40..5a46092 100644
> --- a/recipes-core/llvm/llvm.inc
> +++ b/recipes-core/llvm/llvm.inc
> @@ -65,8 +65,6 @@ EXTRA_OECMAKE = "\
>  # We need to reset this to avoid breakage as we build out of tree
>  TOOLCHAIN_OPTIONS = ""
>  
> -PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}"
> -
>  PACKAGES_DYNAMIC = "llvm-*"
>  
>  # the difference to the non-native build is that we do not need
> -- 
> 1.7.9.5

Thanks, applied to meta-java master branch.

Bye Henning


