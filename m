Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1RjvoK-0004Ps-KJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Jan 2012 17:41:32 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4230611001B1
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Jan 2012 17:34:08 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7F5C6110018B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Jan 2012 17:34:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (f052065057.adsl.alicedsl.de
	[78.52.65.57]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Jan 2012 17:34:07 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 96E8A3C4B0; Sun,  8 Jan 2012 17:34:06 +0100 (CET)
Date: Sun, 8 Jan 2012 17:34:06 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120108163406.GB23476@rhein.zuhause.netz>
References: <1325801399-24880-1-git-send-email-raj.khem@gmail.com>
	<1325801399-24880-2-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1325801399-24880-2-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-java][PATCH 2/2] llvm, openjdk: Add mips to known architectures
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
X-List-Received-Date: Sun, 08 Jan 2012 16:41:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 05, 2012 at 02:09:59PM -0800, Khem Raj wrote:
> correct a typo Mips -> mips
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-core/llvm/llvm.inc                |    4 ++--
>  recipes-core/openjdk/openjdk-6-common.inc |    2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-core/llvm/llvm.inc b/recipes-core/llvm/llvm.inc
> index 5cc9957..578cd40 100644
> --- a/recipes-core/llvm/llvm.inc
> +++ b/recipes-core/llvm/llvm.inc
> @@ -203,8 +203,8 @@ def get_llvm_arch(d):
>      arch = "X86"
>    elif arch == "arm":
>      arch = "ARM"
> -  elif arch == "mipsel":
> -    arch = "Mips"
> +  elif arch == "mipsel" or arch == "mips":
> +    arch = "mips"
>    elif arch == "powerpc":
>      arch = "PowerPC"
>    else:
> diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
> index 461ccd9..bc56105 100644
> --- a/recipes-core/openjdk/openjdk-6-common.inc
> +++ b/recipes-core/openjdk/openjdk-6-common.inc
> @@ -153,7 +153,7 @@ def get_llvm_configure_arch(d):
>      arch = "x86"
>    elif arch == "arm":
>      arch = "arm"
> -  elif arch == "mipsel":
> +  elif arch == "mipsel" or arch == "mips":
>      arch = "mips"
>    elif arch == "powerpc":
>      arch = "powerpc"
> -- 
> 1.7.5.4

Thanks Khem,

it is applied.

Bye Henning


