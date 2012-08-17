Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1T2HSq-00059m-TY
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Aug 2012 09:59:28 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1T2HHI-00073W-Q3>; Fri, 17 Aug 2012 09:47:32 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1T2HHI-0001ki-NJ>; Fri, 17 Aug 2012 09:47:32 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1T2HHH-0004if-Ke
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Aug 2012 09:47:31 +0200
Date: Fri, 17 Aug 2012 09:47:31 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120817074731.GA17007@mi.fu-berlin.de>
References: <1343761391-3440-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1343761391-3440-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [meta-java][PATCH V2 1/3] llvm: Accept ppc64
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
X-List-Received-Date: Fri, 17 Aug 2012 07:59:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 31, 2012 at 12:03:09PM -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-core/llvm/llvm.inc                |    2 +-
>  recipes-core/openjdk/openjdk-6-common.inc |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes-core/llvm/llvm.inc b/recipes-core/llvm/llvm.inc
> index c1f7f45..0718a12 100644
> --- a/recipes-core/llvm/llvm.inc
> +++ b/recipes-core/llvm/llvm.inc
> @@ -203,7 +203,7 @@ def get_llvm_arch(d):
>          arch = "ARM"
>      elif arch == "mipsel" or arch == "mips":
>          arch = "mips"
> -    elif arch == "powerpc":
> +    elif arch == "powerpc" or arch == "powerpc64":
>          arch = "PowerPC"
>      else:
>          bb.error("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
> diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
> index 02a4cb7..c7693fe 100644
> --- a/recipes-core/openjdk/openjdk-6-common.inc
> +++ b/recipes-core/openjdk/openjdk-6-common.inc
> @@ -151,7 +151,7 @@ def get_llvm_configure_arch(d):
>          arch = "arm"
>      elif arch == "mipsel" or arch == "mips":
>          arch = "mips"
> -    elif arch == "powerpc":
> +    elif arch == "powerpc" or arch == "powerpc64":
>          arch = "powerpc"
>      else:
>          bb.error("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
> -- 

Patch is applied to master, thanks and do not forget to update patch-work.

Bye Henning


