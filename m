Received: from [212.227.126.186] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@linuxdevelopment.de>)
	id 1Km2iX-0006CL-LZ; Sat, 04 Oct 2008 10:42:25 +0200
Received: from [10.0.0.200] (M80c3.m.pppool.de [89.49.128.195])
	by mrelayeu.kundenserver.de (node=mrelayeu2) with ESMTP (Nemesis)
	id 0MKwtQ-1Km2eJ3ydM-00058K; Sat, 04 Oct 2008 10:38:04 +0200
Message-ID: <48E72B6B.8090907@linuxdevelopment.de>
Date: Sat, 04 Oct 2008 10:38:03 +0200
From: =?UTF-8?B?Um9iZXJ0IFfDtnJsZQ==?= <robert@linuxdevelopment.de>
User-Agent: Thunderbird 2.0.0.16 (X11/20080720)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4883BCB1.7020102@atmel.com> <48E60608.4060105@linuxdevelopment.de>
	<gc5djj$4em$1@ger.gmane.org>
In-Reply-To: <gc5djj$4em$1@ger.gmane.org>
X-Enigmail-Version: 0.95.7
X-Provags-ID: V01U2FsdGVkX18JA67kwCxARMrDv3O2/4icIHfngazwb3Wz+8i
	YJLHWx0Zw8zqDRZtbG2BztkeFXgAEbfgswzxhM34s8+zna0Utg
	BASdQEmwDLoSa9Tochy9zcOSfp2pxb8AOVDi7wwXqM=
Cc: openembedded-devel@openembedded.org
Subject: Re: binutils fails for AVR32
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
X-List-Received-Date: Sat, 04 Oct 2008 08:42:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



Koen Kooi wrote:
> On 03-10-2008 13:46, Robert Wörle wrote:
>>> | Configuring in ./intl
>>> | configure: warning: build_alias=i686-linux: invalid host type
>>> | configure: warning: host_alias=i686-linux: invalid host type
>>> | configure: error: can only configure for one host and one target at a
>>> time
>>> | make[1]: *** [configure-intl] Error 1
>>> | make[1]: Leaving directory
>>> `/mnt/home/ulf/OpenEmbedded/build-avr32/tmp/work/avr32-angstrom-linux-uclibc/binutils-cross-2.17-r6/binutils-2.17/build.i686-linux.avr32-angstrom-linux-uclibc'
>>>
>>>
>>> | make: *** [all] Error 2
>>> | FATAL: oe_runmake failed
>>>
>>> These problems seems to be caused by build_alias, host_alias and
>>> target_alias beeing passed to "configure", but these are only
>>> supported by binutils-2.18 and not 2.17 which is used by the AVR32.
>>>
>>> I am adding
>>> ~ (cd ${B}&&  sed -i -e "s,'host_alias=i686-linux',," Makefile)
>>> ~ (cd ${B}&&  sed -i -e "s,'build_alias=i686-linux',," Makefile)
>>> ~ (cd ${B}&&  sed -i -e "s,'target_alias=avr32-angstrom-linux-uclibc',,"
>>> Makefile)
>>>
>>> to the do_avr32_configure_bfd
>>>
>> Did you add this as prepend to this stage ? in which bb file did you add
>> it ?
>> Did the whole toolchain work out for you now ?
> 
> It seems your metadata is obsolete, avr32 builds have 'just worked' for
> a few months now thanks to several companies funding OE avr32 work.
> 
> A sample of what angstrom can do now:
> 
> http://www.youtube.com/watch?v=vvOyixL8BRM
> 

wow thats cool !
btw .. i just managed to build avr32 again with the current meta`s by
just removing the binutils-avr32.inc !!  It went on and finished
minimal-image !
And that on a x86_64 host !  What a joy

Hail you, Koen and the others .. feels like i can now relay on the oe
chain again and start building up more products on this nice cpu

Cheers Rob

> 
> Koen




