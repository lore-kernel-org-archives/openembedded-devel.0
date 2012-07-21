Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1SsWOv-0004y5-18
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Jul 2012 11:55:05 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SsWDv-0002KB-1h>; Sat, 21 Jul 2012 11:43:43 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-devel@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1SsWDu-0001RT-Ul>; Sat, 21 Jul 2012 11:43:43 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1SsWDt-0000yw-SH
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jul 2012 11:43:41 +0200
Date: Sat, 21 Jul 2012 11:43:41 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120721094341.GF31778@mi.fu-berlin.de>
References: <1342825008-24903-1-git-send-email-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1342825008-24903-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [meta-java][PATCH] openjdk-6-common.inc: Change jdk_arch for powerpc
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
X-List-Received-Date: Sat, 21 Jul 2012 09:55:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 20, 2012 at 03:56:48PM -0700, Khem Raj wrote:
> ppc is used in openjdk/jre but original jdk_arch
> is defined as powerpc which means we have errors
> compiling and installing openjdk for ppc platforms
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  recipes-core/openjdk/openjdk-6-common.inc |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
> index 6e984f6..02a4cb7 100644
> --- a/recipes-core/openjdk/openjdk-6-common.inc
> +++ b/recipes-core/openjdk/openjdk-6-common.inc
> @@ -109,6 +109,10 @@ def get_jdk_arch(d):
>      jdk_arch = bb.data.getVar('TARGET_ARCH', d, 1)
>      if jdk_arch == "x86_64":
>          jdk_arch = "amd64"
> +    elif jdk_arch == "powerpc":
> +        jdk_arch = "ppc"
> +    elif jdk_arch == "powerpc64":
> +        jdk_arch = "ppc64"
>      elif (jdk_arch == "i486" or jdk_arch == "i586" or jdk_arch == "i686"):
>          jdk_arch = "i386"
>  
> @@ -323,7 +327,6 @@ do_install() {
>  		rm ${D}${JDK_HOME}/bin/$bf
>  		ln -s ${JDK_HOME}/jre/bin/$bf ${D}${JDK_HOME}/bin/$bf
>  	done
> -
>          install -m644 ${WORKDIR}/jvm.cfg  ${D}${JDK_HOME}/jre/lib/${JDK_ARCH}/
>  }
>  
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

Thanks,

patch is applied to master.

Bye Henning


