Return-Path: <prvs=2577514f3=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id D33A66D9B6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 11:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1577447298; x=1608983298;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=JEs/Kx9t9YPolH/yAyIw1tBrCdFqVrAhODaPnodvsvY=;
	b=dM0tLigdzOC6ghrXwRoM1a96+BfhuLPLs6z9s4z7j15SnwP595TNTUdo
	QsNy8UTpPDl4hTAczJTrpNaeG1RYx/3FX9APWl8WL7E3a1RausP90OBg/
	y7Ak0hK1Yg3ZRU9yR7havKNj/glMTe/u/CRhGUTVMLJuY7IwPaZz2ZnPR
	wGMIWqdtGKrlk+t9Iwi14nf7KPfGn1MtDAtyRMoMvTNnI27VzcN7bGe7B
	kYshbXCToyJfrE3qt8IsUnrinxsLXB8XuiY/bC+Bv2vJVSsHwE/+fAxqg
	eyAptYneirEQ3SB4BDkl73UlsT1TLJ75wHDkXnPy9686rq2g1xGLgYQ5i Q==;
IronPort-SDR: c5mzaUPSMpG4emydqqv8mzcUn4GLS2l/BWQijjMZlsjvNB0UtlByaNapFJDZ65maaYR/BEtFP6
	NRQ0siTeRMWrrRNJV7lQojgXAKi/jGoHeLjwThY3bOFnodbKIluIhVY3woZXMPqYfN9Jd9lhgq
	hvWc8r1YSvpawP6DDztVfc0mCg2q7SUee7CZOJe47ftxelb8cY6/eewZdGH4oopT8VlHlk5IjG
	Rvf87IUtkzSpnXFuxwXqcSQVsovAd8kwYtVUQhYGkWBxVNR/Hc21+baxlTM9ZJcEHqwtQnj7Wi
	IZo=
X-IronPort-AV: E=Sophos;i="5.69,362,1571695200"; d="scan'208";a="21733687"
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	<openembedded-devel@lists.openembedded.org>
References: <20190113111308.19021-1-git@andred.net>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <9a4a7e8c-2178-b338-7995-646d1efaafad@skidata.com>
Date: Fri, 27 Dec 2019 12:48:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20190113111308.19021-1-git@andred.net>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] remove True option to getVar calls
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Dec 2019 11:48:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,
this is a note to let you know that I've just added this patch to the
master-next branch of the meta-java repository at
       git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;Richard.L

On 13/01/2019 12:13, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> getVar() has been defaulting to expanding by default for
> a long time (2016), thus remove the True option from
> getVar() calls with a regex search and replace.
> 
> Search & replace made using the following command:
>      sed -e 's|\(d\.getVar \?\)( \?\([^,()]*\), \?True)|\1(\2)|g' \
>          -i $(git grep -E 'getVar ?\( ?([^,()]*), ?True\)' \
>               | cut -d':' -f1 \
>               | sort -u)
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>
> ---
>   classes/java-library.bbclass              |  4 ++--
>   classes/openjdk-build-helper.bbclass      | 10 +++++-----
>   recipes-core/openjdk/openjdk-7-common.inc |  2 +-
>   recipes-core/openjdk/openjdk-8-common.inc |  4 ++--
>   recipes-core/openjdk/openjdk-8-cross.inc  | 10 +++++-----
>   5 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/classes/java-library.bbclass b/classes/java-library.bbclass
> index e0159ba..d801930 100644
> --- a/classes/java-library.bbclass
> +++ b/classes/java-library.bbclass
> @@ -27,8 +27,8 @@ def java_package_name(d):
>     pre=""
>     post=""
>   
> -  bpn = d.getVar('BPN', True)
> -  ml = d.getVar('MLPREFIX', True)
> +  bpn = d.getVar('BPN')
> +  ml = d.getVar('MLPREFIX')
>     if not bpn.startswith("lib"):
>       pre='lib'
>   
> diff --git a/classes/openjdk-build-helper.bbclass b/classes/openjdk-build-helper.bbclass
> index 01ed591..8d83e02 100644
> --- a/classes/openjdk-build-helper.bbclass
> +++ b/classes/openjdk-build-helper.bbclass
> @@ -9,7 +9,7 @@ EXTRA_OEMAKE_remove_task-install = "${PARALLEL_MAKEINST}"
>   # In OE we have PARALLEL_MAKE which is the actual option passed to make,
>   # e.g. "-j 4".
>   def openjdk_build_helper_get_parallel_make(d):
> -    pm = d.getVar('PARALLEL_MAKE', True);
> +    pm = d.getVar('PARALLEL_MAKE');
>       if not pm or '-j' not in pm:
>           return 1
>   
> @@ -55,7 +55,7 @@ def openjdk_build_helper_get_target_cflags(d):
>   def openjdk_build_helper_get_jdk_arch(d):
>       import bb
>   
> -    jdk_arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
> +    jdk_arch = d.getVar('TRANSLATED_TARGET_ARCH')
>       if jdk_arch == "x86-64":
>           jdk_arch = "amd64"
>       elif jdk_arch == "powerpc":
> @@ -73,7 +73,7 @@ def openjdk_build_helper_get_jdk_arch(d):
>   def openjdk_build_helper_get_llvm_configure_arch(d):
>       import bb;
>   
> -    arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
> +    arch = d.getVar('TRANSLATED_TARGET_ARCH')
>       if arch in ['i386', 'i486', 'i586', 'i686', 'x86-64']:
>           arch = "x86"
>       elif arch in ['mipsel', 'mips']:
> @@ -84,7 +84,7 @@ def openjdk_build_helper_get_llvm_configure_arch(d):
>           arch = "arm"
>       else:
>           if 'shark' in d.getVar('PACKAGECONFIG').split():
> -            bb.warn("%s does not support %s in Shark builds yet" % (d.getVar('PN', True), arch) );
> +            bb.warn("%s does not support %s in Shark builds yet" % (d.getVar('PN'), arch) );
>   
>       return arch
>   
> @@ -93,7 +93,7 @@ def openjdk_build_helper_get_llvm_configure_arch(d):
>   def openjdk_build_helper_get_icedtea_arch(d):
>       import bb;
>   
> -    arch = d.getVar('TRANSLATED_TARGET_ARCH', True)
> +    arch = d.getVar('TRANSLATED_TARGET_ARCH')
>       if arch == "x86-64":
>           arch = "amd64"
>       elif arch in ['i386', 'i486', 'i586', 'i686']:
> diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
> index 794bf58..d59a57a 100644
> --- a/recipes-core/openjdk/openjdk-7-common.inc
> +++ b/recipes-core/openjdk/openjdk-7-common.inc
> @@ -93,7 +93,7 @@ export ALT_CUPS_HEADERS_PATH = "${STAGING_INCDIR}"
>   export ALT_FREETYPE_HEADERS_PATH = "${STAGING_INCDIR}/freetype2"
>   export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
>   export CACAO_CONFIGURE_ARGS = " \
> -    ${@['','--enable-softfloat'][d.getVar('TARGET_FPU', True) == 'soft']}"
> +    ${@['','--enable-softfloat'][d.getVar('TARGET_FPU') == 'soft']}"
>   
>   JAVA_HOME[unexport] = "1"
>   
> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> index 4d8f935..1fbe7fe 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -163,8 +163,8 @@ export DEBUG_BINARIES = "true"
>   
>   ALTERNATIVE_PRIORITY = "50"
>   
> -OPENJDK_UPDATE_VERSION = "${@d.getVar('PV', True).split('b')[0]}"
> -OPENJDK_BUILD_NUMBER = "b${@d.getVar('PV', True).split('b')[1]}"
> +OPENJDK_UPDATE_VERSION = "${@d.getVar('PV').split('b')[0]}"
> +OPENJDK_BUILD_NUMBER = "b${@d.getVar('PV').split('b')[1]}"
>   EXTRA_OECONF_append = "\
>           --with-build-number=${OPENJDK_BUILD_NUMBER} \
>           --with-update-version=${OPENJDK_UPDATE_VERSION} \
> diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
> index d04b0d3..7d6c1a5 100644
> --- a/recipes-core/openjdk/openjdk-8-cross.inc
> +++ b/recipes-core/openjdk/openjdk-8-cross.inc
> @@ -108,14 +108,14 @@ EXTRA_OEMAKE_append = '\
>   '
>   
>   python remove_debuglink() {
> -    dvar = d.getVar('PKGD', True)
> -    objcopy = d.getVar("OBJCOPY", True)
> +    dvar = d.getVar('PKGD')
> +    objcopy = d.getVar("OBJCOPY")
>   
>       # Remove the previous debuglink if it has existed, because it has a different file name with that we will add.
> -    if d.getVar('PN', True).find("jre") != -1:
> -        file = dvar + d.getVar("JRE_HOME", True) + "/lib/" + d.getVar("JDK_ARCH", True) + "/server/libjvm.so"
> +    if d.getVar('PN').find("jre") != -1:
> +        file = dvar + d.getVar("JRE_HOME") + "/lib/" + d.getVar("JDK_ARCH") + "/server/libjvm.so"
>       else:
> -        file = dvar + d.getVar("JDK_HOME", True) + "/jre/lib/" + d.getVar("JDK_ARCH", True) + "/server/libjvm.so"
> +        file = dvar + d.getVar("JDK_HOME") + "/jre/lib/" + d.getVar("JDK_ARCH") + "/server/libjvm.so"
>   
>       cmd = "'%s' --remove-section .gnu_debuglink '%s'" % (objcopy, file)
>       oe.utils.getstatusoutput(cmd)
> 

