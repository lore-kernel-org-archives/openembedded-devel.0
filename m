Received: from [76.76.67.137] (helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1N8woK-0005lL-0C
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 15:07:40 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 8C759166089F; Fri, 13 Nov 2009 07:06:17 -0700 (MST)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 25C5B166082B;
	Fri, 13 Nov 2009 07:06:17 -0700 (MST)
Message-ID: <4AFD67D9.7080608@mlbassoc.com>
Date: Fri, 13 Nov 2009 07:06:17 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.5) Gecko/20091112 Shredder/3.0pre
MIME-Version: 1.0
To: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
References: <4AFAEDC3.80404@mlbassoc.com>	
	<1257971990.4924.37.camel@conroy-linux>
	<4AFB27AD.1010602@mlbassoc.com>
	<1257974982.4924.56.camel@conroy-linux>
In-Reply-To: <1257974982.4924.56.camel@conroy-linux>
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
X-List-Received-Date: Fri, 13 Nov 2009 14:07:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2009 02:29 PM, Chris Conroy wrote:
> On Wed, 2009-11-11 at 14:07 -0700, Gary Thomas wrote:
>>
>> Thanks for the pointer.  Given that I'm really new with OE, can you
>> give me a clue as to how to use that recipe?  Can I just add some
>> magic to my local.conf to make this work (instead of the lines quoted above)?
>>
>
> Sure thing. Sadly the snapshot of OE that we're working with internally
> had some issues which required us to pull a few changes from poky and
> make some local changes which I haven't been able to push upstream yet.
> Long story short, I'm not 100% in sync with trunk here so you may need
> to change a couple of things, but this will get you most of the way
> there. Most of my issues were in the creation, not in the sourcing of
> the toolchain.
>
> We allow developers to choose between an "external" or "scratch" (let OE
> build it) toolchain and use a paradigm similar to the pokymode. In my
> local.conf I have
>
>> TOOLCHAIN="external"
>
> In my distro conf I have:
>
>> #Default to build the toolchain if no external one is selected
>> TOOLCHAIN ?= "scratch"
>> require conf/toolchain-${TOOLCHAIN}.conf
>
> My toolchain-external.conf looks like:
>> PREFERRED_PROVIDER_linux-libc-headers = "external-toolchain"
>> PREFERRED_PROVIDER_glibc-thread-db = "external-toolchain"
>> PREFERRED_PROVIDER_libstdc++-dev = "external-toolchain"
>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-toolchain"
>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-toolchain"
>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-toolchain"
>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =  "external-toolchain"
>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-toolchain"
>> PREFERRED_PROVIDER_virtual/binutils = "external-toolchain"
>> PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =  "external-toolchain"
>> PREFERRED_PROVIDER_virtual/libc =  "external-toolchain"
>> PREFERRED_PROVIDER_virtual/libintl =  "external-toolchain"
>> PREFERRED_PROVIDER_virtual/libiconv =  "external-toolchain"
>>
>>
>> TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_HOST}"
>> PATH =. "${SDK_PREFIX}/bin:"
>
> I believe the SDK_PREFIX is a pokyism. I also pulled in the BUILDSDK_CPPFLAGS and friends from poky.
>
> in bitbake.conf...
>> export BUILDSDK_CPPFLAGS = "-isystem${STAGING_INCDIR}"
>> export BUILDSDK_CFLAGS = "${BUILDSDK_CPPFLAGS} ${BUILD_OPTIMIZATION}"
>> export BUILDSDK_LDFLAGS = "-L${STAGING_LIBDIR} \
>>                      -Wl,-rpath-link,${STAGING_LIBDIR} \
>>                      -Wl,-rpath,${libdir} -Wl,-O1"
>
> in sdk.bbclass...
>> CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
>> CFLAGS = "${BUILDSDK_CFLAGS}"
>> CXXFLAGS = "${BUILDSDK_CFLAGS}"
>> LDFLAGS = "${BUILDSDK_LDFLAGS}"
>
>
> Hopefully that helps. Ideally this stuff would just work out of the box, but it sounds like the toolchain setup is going to get a major makeover soon.

I've tried this setup and it _almost_ works.  I still have
a problem though in that it insists on building gcc-cross
(which is failing for some reason).

I can't figure out why gcc-cross is required, nor how to
override/remove this dependency.

Any ideas?

Thanks


-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


