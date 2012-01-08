Received: from familie-heinold.de ([85.214.48.103]
	helo=mail.familie-heinold.de) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1Rjvo2-0004PP-IO
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Jan 2012 17:41:14 +0100
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 934A211001B1
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Jan 2012 17:33:44 +0100 (CET)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 8C8D0110018B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Jan 2012 17:33:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
Received: from rhein.familie-heinold.de (f052065057.adsl.alicedsl.de
	[78.52.65.57]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Jan 2012 17:33:42 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id AC1163C4B0; Sun,  8 Jan 2012 17:33:40 +0100 (CET)
Date: Sun, 8 Jan 2012 17:33:40 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120108163340.GA23476@rhein.zuhause.netz>
References: <1325801399-24880-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1325801399-24880-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [meta-java][PATCH 1/2] llvm, openjdk: Use bb.error instread of oefatal
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
X-List-Received-Date: Sun, 08 Jan 2012 16:41:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 05, 2012 at 02:09:58PM -0800, Khem Raj wrote:
> oefatal is not available in oe-core so replace
> it with bbfatal in classes and oe.error in recipes
> which use it in anonymous python. bb.fatal aborts
> parsing. So we want to give an error but not
> stop parsing.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  classes/java.bbclass                      |    6 +++---
>  recipes-core/llvm/llvm.inc                |    2 +-
>  recipes-core/openjdk/openjdk-6-common.inc |    2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/classes/java.bbclass b/classes/java.bbclass
> index 6a45065..fe24648 100644
> --- a/classes/java.bbclass
> +++ b/classes/java.bbclass
> @@ -39,7 +39,7 @@ oe_jarinstall() {
>        destname=$1
>        ;;
>      -*)
> -      oefatal "oe_jarinstall: unknown option: $1"
> +      bbfatal "oe_jarinstall: unknown option: $1"
>        ;;
>      *)
>        break;
> @@ -105,7 +105,7 @@ oe_makeclasspath() {
>                fi
>                ;;
>            -*)
> -              oefatal "oe_makeclasspath: unknown option: $1"
> +              bbfatal "oe_makeclasspath: unknown option: $1"
>                ;;
>            *)
>                file=$dir/$1.jar
> @@ -146,7 +146,7 @@ oe_java_simple_wrapper() {
>        output=$1
>        ;;
>      -*)
> -      oefatal "oe_java_simple_wrapper: unknown option: $1"
> +      bbfatal "oe_java_simple_wrapper: unknown option: $1"
>        ;;
>      *)
>        if [ $mainclass ]
> diff --git a/recipes-core/llvm/llvm.inc b/recipes-core/llvm/llvm.inc
> index c675c4d..5cc9957 100644
> --- a/recipes-core/llvm/llvm.inc
> +++ b/recipes-core/llvm/llvm.inc
> @@ -208,7 +208,7 @@ def get_llvm_arch(d):
>    elif arch == "powerpc":
>      arch = "PowerPC"
>    else:
> -    oefatal("Your target architecture is not supported by this recipe");
> +    bb.error("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
>  
>    return arch
>  
> diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
> index 1a3c52b..461ccd9 100644
> --- a/recipes-core/openjdk/openjdk-6-common.inc
> +++ b/recipes-core/openjdk/openjdk-6-common.inc
> @@ -158,7 +158,7 @@ def get_llvm_configure_arch(d):
>    elif arch == "powerpc":
>      arch = "powerpc"
>    else:
> -    oefatal("Your target architecture is not supported by this recipe");
> +    bb.error("%s does not support %s yet" % (bb.data.getVar('PN', d, 1), arch) );
>  
>    return arch
>  
> 1.7.5.4

Thanks Khem,

it is applied.

Bye Henning


