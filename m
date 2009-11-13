Received: from [76.76.67.137] (helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1N959Y-0007Ig-7n
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Nov 2009 00:02:07 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 443C316607C3; Fri, 13 Nov 2009 16:00:39 -0700 (MST)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id A29021660462;
	Fri, 13 Nov 2009 16:00:35 -0700 (MST)
Message-ID: <4AFDE513.3080205@mlbassoc.com>
Date: Fri, 13 Nov 2009 16:00:35 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.5) Gecko/20091113 Shredder/3.0.1pre
MIME-Version: 1.0
To: Chris Conroy <Chris.Conroy@hillcrestlabs.com>
References: <4AFAEDC3.80404@mlbassoc.com>	
	<1257971990.4924.37.camel@conroy-linux>
	<4AFB27AD.1010602@mlbassoc.com>	
	<1257974982.4924.56.camel@conroy-linux>
	<4AFD67D9.7080608@mlbassoc.com>	
	<1258127837.4913.25.camel@conroy-linux>
	<4AFD968E.3050205@mlbassoc.com>
	<1258137696.4913.55.camel@conroy-linux>
In-Reply-To: <1258137696.4913.55.camel@conroy-linux>
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
X-List-Received-Date: Fri, 13 Nov 2009 23:02:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2009 11:41 AM, Chris Conroy wrote:
> On Fri, 2009-11-13 at 10:25 -0700, Gary Thomas wrote:
>> This helped me find the problem - libgcc was required by busybox and
>> the default provider for libgcc included gcc-cross.
>>
>> I ended up with only these [few] changes to get my own toolchain to
>> do the job:
>>
>>     #
>>     # Use prebuilt compiler components
>>     #
>>     TOOLCHAIN = "external"
>>     HOST_SYS = "${TARGET_ARCH}-${TARGET_OS}"
>>     TARGET_SYS = "${TARGET_ARCH}-${TARGET_OS}"
>>     ASSUME_PROVIDED += " linux-libc-headers "
>>     ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc "
>>     ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc-cross "
>>     ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc-initial "
>>     ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}gcc-intermediate "
>>     ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}binutils "
>>     ASSUME_PROVIDED += " virtual/${TARGET_PREFIX}libc-for-gcc "
>>     ASSUME_PROVIDED += " libgcc "
>>     ASSUME_PROVIDED += " virtual/libc "
>>     ASSUME_PROVIDED += " virtual/libintl "
>>     ASSUME_PROVIDED += " virtual/libiconv "
>>     export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${layout_libdir} \
>>                              -Wl,-rpath-link,${STAGING_DIR_TARGET}${layout_libdir} \
>>                              -Wl,-O1"
>>
>> The HOST_SYS and TARGET_SYS changes were necessary because my toolchain
>> is called 'powerpc-linux-XXX', not 'powerpc-oe-linux-XXX'.
>>
>> I chose these changes (instead of just your advice) because I was already
>> down this path.  Sadly, this incantation *did* complete the build, but the
>> resulting file system did not import any of the "provided" libraries from
>> my external toolchain.  Did I miss something that would let the build
>> import these libraries?
>
> Yeah, this is the problem with ASSUME_PROVIDED as I see it. It removes
> the build system knowledge of these things and basically gives the
> responsibility for managing them back to you. Not good.
>
>>
>> Finally, in an effort to explore and understand more, I tried your method:
>>     #
>>     # Use prebuilt compiler components
>>     #
>>     TOOLCHAIN = "external"
>>     HOST_SYS = "${TARGET_ARCH}-${TARGET_OS}"
>>     TARGET_SYS = "${TARGET_ARCH}-${TARGET_OS}"
>>     export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${layout_libdir} \
>>                              -Wl,-rpath-link,${STAGING_DIR_TARGET}${layout_libdir} \
>>                              -Wl,-O1"
>>     PREFERRED_PROVIDER_linux-libc-headers = "external-toolchain"
>>     PREFERRED_PROVIDER_glibc-thread-db = "external-toolchain"
>>     PREFERRED_PROVIDER_libstdc++-dev = "external-toolchain"
>>     PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc = "external-toolchain"
>>     PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++ = "external-toolchain"
>>     PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-initial = "external-toolchain"
>>     PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}gcc-intermediate =  "external-toolchain"
>>     PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}binutils = "external-toolchain"
>>     PREFERRED_PROVIDER_virtual/binutils = "external-toolchain"
>>     PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =  "external-toolchain"
>>     PREFERRED_PROVIDER_virtual/libc =  "external-toolchain"
>>     PREFERRED_PROVIDER_virtual/libintl =  "external-toolchain"
>>     PREFERRED_PROVIDER_virtual/libiconv =  "external-toolchain"
>>
>> Which led to these errors right away:
>>     ERROR: Conflicting PREFERRED_PROVIDER entries were found which resulted in an attempt to select multiple providers
>>     (['/local/Angstrom_BeagleBoard  /openembedded/recipes/glibc/glibc_2.6.1.bb',
>>     '/local/Angstrom_BeagleBoard/openembedded/recipes/meta/external-toolchain.bb']) for runtime dependecy libsegfault
>>     The entries resulting in this conflict were: ['PREFERRED_PROVIDER_virtual/libc = glibc', 'PREFERRED_PROVIDER_virtual/libintl = external-toolchain']
>>     ERROR: Conflicting PREFERRED_PROVIDER entries were found which resulted in an attempt to select multiple providers
>>     (['/local/Angstrom_BeagleBoard/openembedded/recipes/gcc/gcc-cross_4.4.2.bb',
>>     '/local/Angstrom_BeagleBoard/openembedded/recipes/meta/external-toolchain.bb']) for runtime dependecy libgcc
>>     The entries resulting in this conflict were: ['PREFERRED_PROVIDER_virtual/powerpc-linux-gcc = gcc-cross', 'PREFERRED_PROVIDER_virtual/libintl = external-toolchain']
>>
>
> You may need to edit the RPROVIDES of your toolchain. Here's what mine
> looks like:
>
> RPROVIDES = " glibc-dbg glibc catchsegv sln nscd ldd localedef
> glibc-utils glibc-dev glibc-locale libsegfault glibc-extra-nss
> glibc-thread-db glibc-pcprofile \
>                libgcc libgcc-dev libstdc++-dev libstdc++"
> PACKAGES_DYNAMIC = "glibc-gconv-*"
> INHIBIT_DEFAULT_DEPS = "1"

Still no joy, I'm afraid.  I now get a *huge* series of messages like these:

NOTE: preferred version 2.11.4.1 of xf86-video-geode not available (for item libsegfault)
NOTE: preferred version 1.0.1 of font-screen-cyrillic not available (for item libsegfault)
NOTE: preferred version 1.2.4 of opie-securityplugin-dummy not available (for item libsegfault)
NOTE: preferred version 6.9.0 of xf86-video-ati not available (for item libsegfault)
NOTE: preferred version 12.5.1 of xf86-input-vmmouse not available (for item libsegfault)
ERROR: Conflicting PREFERRED_PROVIDER entries were found which resulted in an attempt to select multiple providers 
(['/local/Angstrom_BeagleBoard/openembedded/recipes/gcc/gcc-cross_4.4.2.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxpm_3.5.7.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libice_1.0.4.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxrandr_1.2.3.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxfixes_4.0.3.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxinerama_1.0.3.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/libqpe/libqpe-opie_1.2.4.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libx11_1.1.5.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-proto/xproto_7.0.13.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxt_1.0.5.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxv_1.0.4.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxcursor_1.1.9.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxrender_0.9.4.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-xserver/xserver-xorg_1.5.3.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/gcc/gcc-cross-intermediate_4.4.2.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxext_1.0.4.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxi_1.2.0.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxmu_1.0.4.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/glibc/glibc_2.6.1.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/binutils/binutils-cross_2.20.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/glibc/glibc-initial_2.6.1.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxcomposite_0.4.0.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libsm_1.1.0.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxft_2.1.13.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/gcc/gcc-cross-initial_4.4.2.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-app/xrandr_1.2.3.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxaw_1.0.4.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxxf86vm_1.0.2.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/qte/qte-mt_2.3.10.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/xorg-lib/libxdamage_1.1.1.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/gnome/gconf-dbus_svn.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/avahi/avahi_0.6.24.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/libgpewidget/libgpewidget_0.117.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/libsdl/libsdl-x11_1.2.11.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/meta/external-toolchain.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/linux/linux_2.6.31.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/gtk+/gtk+_2.14.2.bb', 
'/local/Angstrom_BeagleBoard/openembedded/recipes/libusb/libusb_0.1.12.bb', '/local/Angstrom_BeagleBoard/openembedded/recipes/db/db3_3.2.9.bb']) for runtime dependecy libsegfault
The entries resulting in this conflict were: ['PREFERRED_PROVIDER_virtual/powerpc-linux-gcc = gcc-cross', 'PREFERRED_PROVIDER_libxpm = libxpm', 'PREFERRED_PROVIDER_libice = 
libice', 'PREFERRED_PROVIDER_libxrandr = libxrandr', 'PREFERRED_PROVIDER_libxfixes = libxfixes', 'PREFERRED_PROVIDER_libxinerama = libxinerama', 'PREFERRED_PROVIDER_virtual/libqpe1 
= libqpe-opie', 'PREFERRED_PROVIDER_virtual/libx11 = libx11', 'PREFERRED_PROVIDER_xproto = xproto', 'PREFERRED_PROVIDER_libxt = libxt', 'PREFERRED_PROVIDER_libxv = libxv', 
'PREFERRED_PROVIDER_libxcursor = libxcursor', 'PREFERRED_PROVIDER_libxrender = libxrender', 'PREFERRED_PROVIDER_virtual/xserver = xserver-xorg', 
'PREFERRED_PROVIDER_virtual/powerpc-linux-gcc-intermediate = gcc-cross-intermediate', 'PREFERRED_PROVIDER_libxext = libxext', 'PREFERRED_PROVIDER_libxi = libxi', 
'PREFERRED_PROVIDER_libxmu = libxmu', 'PREFERRED_PROVIDER_virtual/libc = glibc', 'PREFERRED_PROVIDER_virtual/powerpc-linux-binutils = binutils-cross', 
'PREFERRED_PROVIDER_virtual/powerpc-linux-libc-initial = glibc-initial', 'PREFERRED_PROVIDER_libxcomposite = libxcomposite', 'PREFERRED_PROVIDER_libsm = libsm', 
'PREFERRED_PROVIDER_libxft = libxft', 'PREFERRED_PROVIDER_virtual/powerpc-linux-gcc-initial = gcc-cross-initial', 'PREFERRED_PROVIDER_xrandr = xrandr', 'PREFERRED_PROVIDER_libxaw = 
libxaw', 'PREFERRED_PROVIDER_libxxf86vm = libxxf86vm', 'PREFERRED_PROVIDER_virtual/libqte2 = qte-mt', 'PREFERRED_PROVIDER_libxdamage = libxdamage', 
'PREFERRED_PROVIDER_linux-libc-headers = linux-libc-headers', 'PREFERRED_PROVIDER_gconf = gconf-dbus', 'PREFERRED_PROVIDER_avahi = avahi', 'PREFERRED_PROVIDER_libgpewidget = 
libgpewidget', 'PREFERRED_PROVIDER_virtual/libsdl = libsdl-x11', 'PREFERRED_PROVIDER_virtual/libintl = external-toolchain', 'PREFERRED_PROVIDER_virtual/kernel = linux', 
'PREFERRED_PROVIDER_gtk+ = gtk+', 'PREFERRED_PROVIDER_virtual/libusb0 = libusb', 'PREFERRED_PROVIDER_virtual/db = db3']

Why is this so hard??  I just want to use the tools I already
have (and my customers are comfortable with)!

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


