Received: from [76.76.67.137] (helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1N8zvF-0001Tw-9W
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 18:27:00 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id B20B0166082E; Fri, 13 Nov 2009 10:25:38 -0700 (MST)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 8452B16606B1;
	Fri, 13 Nov 2009 10:25:34 -0700 (MST)
Message-ID: <4AFD968E.3050205@mlbassoc.com>
Date: Fri, 13 Nov 2009 10:25:34 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.5) Gecko/20091112 Shredder/3.0pre
MIME-Version: 1.0
To: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
References: <4AFAEDC3.80404@mlbassoc.com>	
	<1257971990.4924.37.camel@conroy-linux>
	<4AFB27AD.1010602@mlbassoc.com>	
	<1257974982.4924.56.camel@conroy-linux>
	<4AFD67D9.7080608@mlbassoc.com>
	<1258127837.4913.25.camel@conroy-linux>
In-Reply-To: <1258127837.4913.25.camel@conroy-linux>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
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
X-List-Received-Date: Fri, 13 Nov 2009 17:27:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2009 08:57 AM, Chris Conroy wrote:
> On Fri, 2009-11-13 at 07:06 -0700, Gary Thomas wrote:
>> On 11/11/2009 02:29 PM, Chris Conroy wrote:
>>> On Wed, 2009-11-11 at 14:07 -0700, Gary Thomas wrote:
>>>>
>>>> Thanks for the pointer.  Given that I'm really new with OE, can you
>>>> give me a clue as to how to use that recipe?  Can I just add some
>>>> magic to my local.conf to make this work (instead of the lines quoted above)?
>>>>
>>>
>>> Sure thing. Sadly the snapshot of OE that we're working with internally
>>> had some issues which required us to pull a few changes from poky and
>>> make some local changes which I haven't been able to push upstream yet.
>>> Long story short, I'm not 100% in sync with trunk here so you may need
>>> to change a couple of things, but this will get you most of the way
>>> there. Most of my issues were in the creation, not in the sourcing of
>>> the toolchain.
>>>
>>> We allow developers to choose between an "external" or "scratch" (let OE
>>> build it) toolchain and use a paradigm similar to the pokymode. In my
>>> local.conf I have
>>>
>>>> TOOLCHAIN="external"
>>>
>>> In my distro conf I have:
>>>
>>>> #Default to build the toolchain if no external one is selected
>>>> TOOLCHAIN ?= "scratch"
>>>> require conf/toolchain-${TOOLCHAIN}.conf
>>>
>>> My toolchain-external.conf looks like:
>>>> PREFERRED_PROVIDER_linux-libc-headers = "external-toolchain"
>>>> PREFERRED_PROVIDER_glibc-thread-db = "external-toolchain"
>>>> PREFERRED_PROVIDER_libstdc++-dev = "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =  "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/binutils = "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =  "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/libc =  "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/libintl =  "external-toolchain"
>>>> PREFERRED_PROVIDER_virtual/libiconv =  "external-toolchain"
>>>>
>>>>
>>>> TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
>>>> PATH =. "${SDK_PREFIX}/bin:"
>>>
>>> I believe the SDK_PREFIX is a pokyism. I also pulled in the BUILDSDK_CPPFLAGS and friends from poky.
>>>
>>> in bitbake.conf...
>>>> export BUILDSDK_CPPFLAGS = "-isystem${STAGING_INCDIR}"
>>>> export BUILDSDK_CFLAGS = "${BUILDSDK_CPPFLAGS} ${BUILD_OPTIMIZATION}"
>>>> export BUILDSDK_LDFLAGS = "-L${STAGING_LIBDIR} \
>>>>                       -Wl,-rpath-link,${STAGING_LIBDIR} \
>>>>                       -Wl,-rpath,${libdir} -Wl,-O1"
>>>
>>> in sdk.bbclass...
>>>> CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
>>>> CFLAGS = "${BUILDSDK_CFLAGS}"
>>>> CXXFLAGS = "${BUILDSDK_CFLAGS}"
>>>> LDFLAGS = "${BUILDSDK_LDFLAGS}"
>>>
>>>
>>> Hopefully that helps. Ideally this stuff would just work out of the box, but it sounds like the toolchain setup is going to get a major makeover soon.
>>
>> I've tried this setup and it _almost_ works.  I still have
>> a problem though in that it insists on building gcc-cross
>> (which is failing for some reason).
>>
>> I can't figure out why gcc-cross is required, nor how to
>> override/remove this dependency.
>>
>> Any ideas?
>
> I'd say definitely take a look at the dependency graph of whatever is
> trying to build gcc-cross (bitbake -g<package>) and inspect the
> depends.dot and task-depends.dot. Inspect the output of
>
> bitbake -n -DDD<package>  | less -i
>
> Look for gcc-cross in the output and see why it's being chosen. Looking
> at my local setup, it seems that I have
>
>> DEBUG: sorted providers for virtual/mipsel-linux-gcc are:
>> ['/home/cconroy/p4/new_trunk/hcrest.build/packages/meta/external-toolchain.bb',
>> '/home/cconroy/p4/new_trunk/hcrest.build/packages/gcc/gcc-cross_4.2.3.bb']
>
> If you find you have something similar, but just in the wrong order, you
> may need to pull my recently accepted bitbake patch which fixes how it
> works with priorities.
>

This helped me find the problem - libgcc was required by busybox and
the default provider for libgcc included gcc-cross.

I ended up with only these [few] changes to get my own toolchain to
do the job:

   #
   # Use prebuilt compiler components
   #
   TOOLCHAIN = "external"
   HOST_SYS = "${TARGET_ARCH}-${TARGET_OS}"
   TARGET_SYS = "${TARGET_ARCH}-${TARGET_OS}"
   ASSUME_PROVIDED += " linux-libc-headers "
   ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc "
   ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc-cross "
   ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc-initial "
   ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc-intermediate "
   ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}binutils "
   ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}libc-for-gcc "
   ASSUME_PROVIDED += " libgcc "
   ASSUME_PROVIDED += " virtual/libc "
   ASSUME_PROVIDED += " virtual/libintl "
   ASSUME_PROVIDED += " virtual/libiconv "
   export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${layout_libdir} \
                            -Wl,-rpath-link,${STAGING_DIR_TARGET}${layout_libdir} \
                            -Wl,-O1"

The HOST_SYS and TARGET_SYS changes were necessary because my toolchain
is called 'powerpc-linux-XXX', not 'powerpc-oe-linux-XXX'.

I chose these changes (instead of just your advice) because I was already
down this path.  Sadly, this incantation *did* complete the build, but the
resulting file system did not import any of the "provided" libraries from
my external toolchain.  Did I miss something that would let the build
import these libraries?

Finally, in an effort to explore and understand more, I tried your method:
   #
   # Use prebuilt compiler components
   #
   TOOLCHAIN = "external"
   HOST_SYS = "${TARGET_ARCH}-${TARGET_OS}"
   TARGET_SYS = "${TARGET_ARCH}-${TARGET_OS}"
   export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${layout_libdir} \
                            -Wl,-rpath-link,${STAGING_DIR_TARGET}${layout_libdir} \
                            -Wl,-O1"
   PREFERRED_PROVIDER_linux-libc-headers = "external-toolchain"
   PREFERRED_PROVIDER_glibc-thread-db = "external-toolchain"
   PREFERRED_PROVIDER_libstdc++-dev = "external-toolchain"
   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-toolchain"
   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-toolchain"
   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-toolchain"
   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =  "external-toolchain"
   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-toolchain"
   PREFERRED_PROVIDER_virtual/binutils = "external-toolchain"
   PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =  "external-toolchain"
   PREFERRED_PROVIDER_virtual/libc =  "external-toolchain"
   PREFERRED_PROVIDER_virtual/libintl =  "external-toolchain"
   PREFERRED_PROVIDER_virtual/libiconv =  "external-toolchain"

Which led to these errors right away:
   ERROR: Conflicting PREFERRED_PROVIDER entries were found which resulted in an attempt to select multiple providers
   (['/local/Angstrom_BeagleBoard  /openembedded/recipes/glibc/glibc_2.6.1.bb',
   '/local/Angstrom_BeagleBoard/openembedded/recipes/meta/external-toolchain.bb']) for runtime dependecy libsegfault
   The entries resulting in this conflict were: ['PREFERRED_PROVIDER_virtual/libc = glibc', 'PREFERRED_PROVIDER_virtual/libintl = external-toolchain']
   ERROR: Conflicting PREFERRED_PROVIDER entries were found which resulted in an attempt to select multiple providers
   (['/local/Angstrom_BeagleBoard/openembedded/recipes/gcc/gcc-cross_4.4.2.bb',
   '/local/Angstrom_BeagleBoard/openembedded/recipes/meta/external-toolchain.bb']) for runtime dependecy libgcc
   The entries resulting in this conflict were: ['PREFERRED_PROVIDER_virtual/powerpc-linux-gcc = gcc-cross', 'PREFERRED_PROVIDER_virtual/libintl = external-toolchain']



>
> Also, I found it helpful to turn the "multiple providers" state in
> bitbake into a fatal error condition. I can't recall if I ran into this
> problem or not, but it's possible this will help:
>
> In your lib/bb/runqueue.py you'll see a commented fatal error:
> #if error:
> #	bb.msg.fatal(bb.msg.domain.RunQueue, "Corrupted metadata configuration
> detected, aborting...")
>
> If you activate that error you may find this to be the cause of your
> problem. If so, you may want to make the message a bit more verbose and
> dump out the offending package and providers.
>
> Hope that helps!

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


