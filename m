Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <morphis@gravedo.de>) id 1QHj0O-0005RL-Ew
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 22:49:08 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id C1B3B79900F; Wed,  4 May 2011 22:46:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h1108419.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=6.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Received: from [192.168.178.21] (dslb-088-071-187-171.pools.arcor-ip.net
	[88.71.187.171]) by gravedo.de (Postfix) with ESMTPSA id 0500B79900D
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 May 2011 22:46:30 +0200 (CEST)
Message-ID: <4DC1BB25.1070808@gravedo.de>
Date: Wed, 04 May 2011 22:46:29 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110419 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DC17C80.3060001@gravedo.de>
	<1304528108-5217-1-git-send-email-morphis@gravedo.de>
In-Reply-To: <1304528108-5217-1-git-send-email-morphis@gravedo.de>
Subject: Re: [PATCH] cmake.bbclass: set the rpath for native binaries build with cmake
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
X-List-Received-Date: Wed, 04 May 2011 20:49:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04.05.2011 18:55, Simon Busch wrote:
> In the default configuration cmake does not set a rpath for its builded binaries. This
> leads to errors at runtime when the binaries not find their needed runtime libraries.
> Please note that this is only done for recipes inheriting the native class!
> 
> Signed-off-by: Simon Busch <morphis@gravedo.de>
> ---
>  classes/cmake.bbclass |   11 +++++++++++
>  1 files changed, 11 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/cmake.bbclass b/classes/cmake.bbclass
> index 40fadea..e8e485a 100644
> --- a/classes/cmake.bbclass
> +++ b/classes/cmake.bbclass
> @@ -24,6 +24,13 @@ OECMAKE_CXX_FLAGS ?= "${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} ${TARGET_CPPFLAGS} -f
>  OECMAKE_C_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
>  OECMAKE_CXX_FLAGS_RELEASE ?= "${SELECTED_OPTIMIZATION} -DNDEBUG"
>  
> +OECMAKE_RPATH ?= ""
> +python __anonymous() {
> +    # Only set OECMAKE_RPATH if we build a native recipe
> +    if bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
> +        bb.data.setVar('OECMAKE_RPATH', '${libdir}', d)
> +}
> +
>  cmake_do_generate_toolchain_file() {
>  # CMake system name must be something like "Linux".
>  # This is important for cross-compiling.
> @@ -44,6 +51,10 @@ cmake_do_generate_toolchain_file() {
>    echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )" >> ${WORKDIR}/toolchain.cmake
>  # Use qt.conf settings
>    echo "set( ENV{QT_CONF_PATH} ${WORKDIR}/qt.conf )" >> ${WORKDIR}/toolchain.cmake
> +
> +# We need to set the rpath to the correct directory as cmake does not provide any
> +# directory as rpath by default
> +  echo "set( CMAKE_INSTALL_RPATH ${OECMAKE_RPATH} )" >> ${WORKDIR}/toolchain.cmake
>  }
>  
>  addtask generate_toolchain_file after do_patch before do_configure


To proof this: I tested it with native and non-native recipes (all
builded with cmake.bbclass) and grep'ed through the resulting binaries
afterwards to be sure there is a rpath in the native ones (and the
correct one) and no one in the non native recipes:

morphis@nirvana ...root/tmp/sysroots/x86_64-linux/usr/bin % objdump -x
generatorrunner | grep RPATH
  RPATH                $ORIGIN/../lib:$ORIGIN/../lib

morphis@nirvana ...libshiboken-1.0.2-r0.0/package/usr/lib % pwd
/home/morphis/oe/buildroot/tmp/work/armv7a-oe-linux-gnueabi/libshiboken-1.0.2-r0.0/package/usr/lib
morphis@nirvana ...libshiboken-1.0.2-r0.0/package/usr/lib % objdump -x
libshiboken-python2.6.so.1.0.2 | grep RPATH
1 morphis@nirvana ...libshiboken-1.0.2-r0.0/package/usr/lib %

[...]

regards,
Simon


