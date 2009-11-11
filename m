Received: from [12.173.51.132] (helo=emailgateway.hillcrestlabs.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Chris.Conroy@hillcrestlabs.com>) id 1N8KmJ-0004um-Tb
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 22:31:03 +0100
X-AuditID: 0a1e000a-b7b8cae000000d7b-f8-4afb2cc53b34
From: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
To: Gary Thomas <gary@mlbassoc.com>
In-Reply-To: <4AFB27AD.1010602@mlbassoc.com>
References: <4AFAEDC3.80404@mlbassoc.com>
	<1257971990.4924.37.camel@conroy-linux> <4AFB27AD.1010602@mlbassoc.com>
Date: Wed, 11 Nov 2009 16:29:42 -0500
Message-Id: <1257974982.4924.56.camel@conroy-linux>
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
X-List-Received-Date: Wed, 11 Nov 2009 21:31:03 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-11-11 at 14:07 -0700, Gary Thomas wrote:
> 
> Thanks for the pointer.  Given that I'm really new with OE, can you
> give me a clue as to how to use that recipe?  Can I just add some
> magic to my local.conf to make this work (instead of the lines quoted above)?
> 

Sure thing. Sadly the snapshot of OE that we're working with internally
had some issues which required us to pull a few changes from poky and
make some local changes which I haven't been able to push upstream yet.
Long story short, I'm not 100% in sync with trunk here so you may need
to change a couple of things, but this will get you most of the way
there. Most of my issues were in the creation, not in the sourcing of
the toolchain.

We allow developers to choose between an "external" or "scratch" (let OE
build it) toolchain and use a paradigm similar to the pokymode. In my
local.conf I have

> TOOLCHAIN="external"

In my distro conf I have:

> #Default to build the toolchain if no external one is selected
> TOOLCHAIN ?= "scratch"
> require conf/toolchain-${TOOLCHAIN}.conf

My toolchain-external.conf looks like:
> PREFERRED_PROVIDER_linux-libc-headers = "external-toolchain"
> PREFERRED_PROVIDER_glibc-thread-db = "external-toolchain"
> PREFERRED_PROVIDER_libstdc++-dev = "external-toolchain"
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-toolchain"
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-toolchain"
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-toolchain"
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =  "external-toolchain"
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-toolchain"
> PREFERRED_PROVIDER_virtual/binutils = "external-toolchain"
> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =  "external-toolchain" 
> PREFERRED_PROVIDER_virtual/libc =  "external-toolchain" 
> PREFERRED_PROVIDER_virtual/libintl =  "external-toolchain" 
> PREFERRED_PROVIDER_virtual/libiconv =  "external-toolchain" 
> 
> 
> TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
> PATH =. "${SDK_PREFIX}/bin:"

I believe the SDK_PREFIX is a pokyism. I also pulled in the BUILDSDK_CPPFLAGS and friends from poky.

in bitbake.conf...
> export BUILDSDK_CPPFLAGS = "-isystem${STAGING_INCDIR}"
> export BUILDSDK_CFLAGS = "${BUILDSDK_CPPFLAGS} ${BUILD_OPTIMIZATION}"
> export BUILDSDK_LDFLAGS = "-L${STAGING_LIBDIR} \
>                     -Wl,-rpath-link,${STAGING_LIBDIR} \
>                     -Wl,-rpath,${libdir} -Wl,-O1"

in sdk.bbclass...
> CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
> CFLAGS = "${BUILDSDK_CFLAGS}"
> CXXFLAGS = "${BUILDSDK_CFLAGS}"
> LDFLAGS = "${BUILDSDK_LDFLAGS}"


Hopefully that helps. Ideally this stuff would just work out of the box, but it sounds like the toolchain setup is going to get a major makeover soon.

--Chris Conroy


