Received: from [76.76.67.137] (helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1N8KRG-0004pi-K5
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 22:09:18 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 8FFE6166046B; Wed, 11 Nov 2009 14:07:57 -0700 (MST)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 0A99616603C3;
	Wed, 11 Nov 2009 14:07:57 -0700 (MST)
Message-ID: <4AFB27AD.1010602@mlbassoc.com>
Date: Wed, 11 Nov 2009 14:07:57 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.6pre) Gecko/20091110 Shredder/3.0pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AFAEDC3.80404@mlbassoc.com>
	<1257971990.4924.37.camel@conroy-linux>
In-Reply-To: <1257971990.4924.37.camel@conroy-linux>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
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
X-List-Received-Date: Wed, 11 Nov 2009 21:09:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2009 01:39 PM, Chris Conroy wrote:
> On Wed, 2009-11-11 at 10:00 -0700, Gary Thomas wrote:
>> I'd like to use my own toolchains when building OpenEmbedded.
>> I've tried to follow the information at:
>>     http://docs.openembedded.org/usermanual/usermanual.html#commonuse_prebuilt_toolchain
>> It's a bit terse and confusing, so I'm just trying to see
>> what I need (I think the section tries to discuss too many
>> concepts at once)
>>
>> Anyway, I added these lines to my local.conf:
>>     TARGET_SYS = "${TARGET_ARCH}-${TARGET_OS}"
>>     ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc "
>>     ASSUME_PROVIDED += " virtual/libc "
>>
>> This led to a number of other inferences which I don't understand.
>>     NOTE: selecting glibc to satisfy virtual/libintl due to PREFERRED_PROVIDERS
>>     NOTE: selecting glibc to satisfy runtime libsegfault due to PREFERRED_PROVIDER_virtual/libc = glibc
>>     NOTE: selecting linux-libc-headers to satisfy runtime linux-libc-headers-dev due to PREFERRED_PROVIDER_linux-libc-headers = linux-libc-headers
>>     NOTE: selecting glibc to satisfy runtime glibc due to PREFERRED_PROVIDER_virtual/libc = glibc
>>     NOTE: selecting gcc-cross-intermediate to satisfy virtual/powerpc-linux-gcc-intermediate due to PREFERRED_PROVIDERS
>>     NOTE: selecting linux-libc-headers to satisfy linux-libc-headers due to PREFERRED_PROVIDERS
>>     NOTE: selecting glibc to satisfy virtual/libiconv due to PREFERRED_PROVIDERS
>>     NOTE: selecting gcc-cross to satisfy runtime libgcc due to PREFERRED_PROVIDER_virtual/powerpc-linux-gcc = gcc-cross
>>     NOTE: selecting binutils-cross to satisfy virtual/powerpc-linux-binutils due to PREFERRED_PROVIDERS
>>     NOTE: selecting glibc-initial to satisfy virtual/powerpc-linux-libc-initial due to PREFERRED_PROVIDERS
>>     NOTE: selecting glibc to satisfy virtual/powerpc-linux-libc-for-gcc due to PREFERRED_PROVIDERS
>>     NOTE: selecting gcc-cross-initial to satisfy virtual/powerpc-linux-gcc-initial due to PREFERRED_PROVIDERS
>>
>> At which point, OE goes off on its merry way to build the
>> internal toolchains.
>>
>> What am I missing?
>
> You may want to try using the external-toolchain recipe. Though it's
> mainly used for toolchains built by OE, poky has recipes for
> Codesourcery toolchains which you could certainly use as a starting
> point for your toolchain.
>
> Then in your conf file you need to set the external-toolchain as the
> PREFERRED_PROVIDER for everything it provides (gcc, libc, libstdc++,
> binutils, etc..). I think this is a bit cleaner than doing
> ASSUME_PROVIDED because it makes the use of the external toolchain a bit
> more explicit.

Thanks for the pointer.  Given that I'm really new with OE, can you
give me a clue as to how to use that recipe?  Can I just add some
magic to my local.conf to make this work (instead of the lines quoted above)?

>
> I guess this leads me to ask the rest of the list: should the user
> manual be updated to include docs on the external-toolchain recipe?
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


