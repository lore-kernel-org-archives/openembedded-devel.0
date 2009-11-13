Received: from [12.173.51.132] (helo=emailgateway.hillcrestlabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1N916s-0000gb-7n
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 19:43:05 +0100
X-AuditID: 0a1e000a-b7b8cae000000d7b-33-4afda862a857
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: Gary Thomas <gary@mlbassoc.com>
In-Reply-To: <4AFD968E.3050205@mlbassoc.com>
References: <4AFAEDC3.80404@mlbassoc.com>
	<1257971990.4924.37.camel@conroy-linux> <4AFB27AD.1010602@mlbassoc.com>
	<1257974982.4924.56.camel@conroy-linux> <4AFD67D9.7080608@mlbassoc.com>
	<1258127837.4913.25.camel@conroy-linux> <4AFD968E.3050205@mlbassoc.com>
Date: Fri, 13 Nov 2009 13:41:36 -0500
Message-Id: <1258137696.4913.55.camel@conroy-linux>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-Brightmail-Tracker: AAAAAA==
X-SA-Exim-Connect-IP: 12.173.51.132
X-SA-Exim-Mail-From: Chris.Conroy@hillcrestlabs.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Prebuilt toolchains
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
X-List-Received-Date: Fri, 13 Nov 2009 18:43:05 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-11-13 at 10:25 -0700, Gary Thomas wrote:
> This helped me find the problem - libgcc was required by busybox and
> the default provider for libgcc included gcc-cross.
> 
> I ended up with only these [few] changes to get my own toolchain to
> do the job:
> 
>    #
>    # Use prebuilt compiler components
>    #
>    TOOLCHAIN = "external"
>    HOST_SYS = "${TARGET_ARCH}-${TARGET_OS}"
>    TARGET_SYS = "${TARGET_ARCH}-${TARGET_OS}"
>    ASSUME_PROVIDED += " linux-libc-headers "
>    ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc "
>    ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc-cross "
>    ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc-initial "
>    ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc-intermediate "
>    ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}binutils "
>    ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}libc-for-gcc "
>    ASSUME_PROVIDED += " libgcc "
>    ASSUME_PROVIDED += " virtual/libc "
>    ASSUME_PROVIDED += " virtual/libintl "
>    ASSUME_PROVIDED += " virtual/libiconv "
>    export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${layout_libdir} \
>                             -Wl,-rpath-link,${STAGING_DIR_TARGET}${layout_libdir} \
>                             -Wl,-O1"
> 
> The HOST_SYS and TARGET_SYS changes were necessary because my toolchain
> is called 'powerpc-linux-XXX', not 'powerpc-oe-linux-XXX'.
> 
> I chose these changes (instead of just your advice) because I was already
> down this path.  Sadly, this incantation *did* complete the build, but the
> resulting file system did not import any of the "provided" libraries from
> my external toolchain.  Did I miss something that would let the build
> import these libraries?

Yeah, this is the problem with ASSUME_PROVIDED as I see it. It removes
the build system knowledge of these things and basically gives the
responsibility for managing them back to you. Not good.

> 
> Finally, in an effort to explore and understand more, I tried your method:
>    #
>    # Use prebuilt compiler components
>    #
>    TOOLCHAIN = "external"
>    HOST_SYS = "${TARGET_ARCH}-${TARGET_OS}"
>    TARGET_SYS = "${TARGET_ARCH}-${TARGET_OS}"
>    export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${layout_libdir} \
>                             -Wl,-rpath-link,${STAGING_DIR_TARGET}${layout_libdir} \
>                             -Wl,-O1"
>    PREFERRED_PROVIDER_linux-libc-headers = "external-toolchain"
>    PREFERRED_PROVIDER_glibc-thread-db = "external-toolchain"
>    PREFERRED_PROVIDER_libstdc++-dev = "external-toolchain"
>    PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-toolchain"
>    PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-toolchain"
>    PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-toolchain"
>    PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =  "external-toolchain"
>    PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-toolchain"
>    PREFERRED_PROVIDER_virtual/binutils = "external-toolchain"
>    PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =  "external-toolchain"
>    PREFERRED_PROVIDER_virtual/libc =  "external-toolchain"
>    PREFERRED_PROVIDER_virtual/libintl =  "external-toolchain"
>    PREFERRED_PROVIDER_virtual/libiconv =  "external-toolchain"
> 
> Which led to these errors right away:
>    ERROR: Conflicting PREFERRED_PROVIDER entries were found which resulted in an attempt to select multiple providers
>    (['/local/Angstrom_BeagleBoard  /openembedded/recipes/glibc/glibc_2.6.1.bb',
>    '/local/Angstrom_BeagleBoard/openembedded/recipes/meta/external-toolchain.bb']) for runtime dependecy libsegfault
>    The entries resulting in this conflict were: ['PREFERRED_PROVIDER_virtual/libc = glibc', 'PREFERRED_PROVIDER_virtual/libintl = external-toolchain']
>    ERROR: Conflicting PREFERRED_PROVIDER entries were found which resulted in an attempt to select multiple providers
>    (['/local/Angstrom_BeagleBoard/openembedded/recipes/gcc/gcc-cross_4.4.2.bb',
>    '/local/Angstrom_BeagleBoard/openembedded/recipes/meta/external-toolchain.bb']) for runtime dependecy libgcc
>    The entries resulting in this conflict were: ['PREFERRED_PROVIDER_virtual/powerpc-linux-gcc = gcc-cross', 'PREFERRED_PROVIDER_virtual/libintl = external-toolchain']
> 

You may need to edit the RPROVIDES of your toolchain. Here's what mine
looks like:

RPROVIDES = " glibc-dbg glibc catchsegv sln nscd ldd localedef
glibc-utils glibc-dev glibc-locale libsegfault glibc-extra-nss
glibc-thread-db glibc-pcprofile \
              libgcc libgcc-dev libstdc++-dev libstdc++"
PACKAGES_DYNAMIC = "glibc-gconv-*"
INHIBIT_DEFAULT_DEPS = "1"




