Received: from [213.4.149.66] (helo=ctsmtpout4.frontal.correo)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <joaquinduran@adtelecom.es>) id 1GSpl0-0006PC-SQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Sep 2006 08:52:31 +0200
Received: from [194.179.62.31] (217.126.70.245) by ctsmtpout4.frontal.correo
	(7.2.056.6) (authenticated as joaquinduran$adtelecom.es)
	id 4519704500041449 for openembedded-devel@lists.openembedded.org;
	Thu, 28 Sep 2006 08:47:32 +0200
Message-ID: <451B7DC2.5070304@adtelecom.es>
Date: Thu, 28 Sep 2006 08:46:10 +0100
From: Joaquim Duran <joaquinduran@adtelecom.es>
User-Agent: Mozilla Thunderbird 1.5.0.7 (X11/20060926)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
References: <45190D58.2020807@adtelecom.es>
	<1865823264.20060926150138@gmail.com>
	<451948D7.6000904@adtelecom.es> <451A29EA.1080309@adtelecom.es>
	<661829260.20060927221730@gmail.com>
In-Reply-To: <661829260.20060927221730@gmail.com>
Subject: Re: List of dependent packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Sep 2006 06:52:31 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Changing the filter I get interesting results:

$bitbake -n -v bootstrap-image|grep "Selecting"

NOTE: Selecting already-staged ipkg-native (0.99.163-r1) to satisfy 
ipkg-native
NOTE: Selecting already-staged pkgconfig-native (0.15.0-r2) to satisfy 
pkgconfig-native
NOTE: Selecting already-staged autoconf-native (2.59-r5) to satisfy 
autoconf-native
NOTE: Selecting already-staged m4-native (1.4.2-r0) to satisfy m4-native
NOTE: Selecting already-staged gnu-config-native (0.1+cvs20050701-r4) to 
satisfy gnu-config-native
NOTE: Selecting already-staged automake-native (1.9.3-r5) to satisfy 
automake-native
NOTE: Selecting already-staged libtool-native (1.5.10-r4) to satisfy 
libtool-native
[...]

It displays the list of packages selected with its version.


$bitbake -n -v bootstrap-image|grep "[Ss]electing"

NOTE: Selecting already-staged file-native (4.16-r1) to satisfy file-native
NOTE: Selecting already-staged gcc-cross (3.3.2-r1) to satisfy 
virtual/arm-linux-gcc
NOTE: selecting gcc-cross to satisfy virtual/arm-linux-gcc due to 
PREFERRED_PROVIDERS
NOTE: Selecting already-staged binutils-cross (2.14.90.driscoll-r0) to 
satisfy virtual/arm-linux-binutils
NOTE: selecting binutils-cross to satisfy virtual/arm-linux-binutils due 
to PREFERRED_PROVIDERS

It displays the list of packages selected with its version and indicates 
which packages has been selected by configuration settings.


Thanks for your comment.


Thanks and Best Regards,
Joaquim Duran



En/na Paul Sokolovsky ha escrit:
> Hello Joaquim,
> 
> Wednesday, September 27, 2006, 10:36:10 AM, you wrote:
> 
>> Hello,
> 
>> As I've the impression that Bitbake is very related to OE. I post the 
>> bug here.
> 
>> I execute: bitbake -g boostrap-image.
> 
>   Have to say I didn't try -g myself yet. --dry-run --verbose what I
> usually use, as was suggested on this last before. And I just tried
> that it actuially works without any packages built. Specifically:
> 
> bitbake --dry-run --verbose gpe-image|grep "current path"
> 
> NOTE: current path: gpe-image (gpe-image)
> NOTE: current path: gpe-image (gpe-image) -> ipkg-native (ipkg-native)
> NOTE: current path: gpe-image (gpe-image) -> ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native)
> NOTE: current path: gpe-image (gpe-image) -> ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) -> autoconf-nati
> NOTE: current path: gpe-image (gpe-image) -> ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) -> autoconf-nati
> NOTE: current path: gpe-image (gpe-image) -> ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) -> autoconf-nati
> NOTE: current path: gpe-image (gpe-image) -> ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) -> autoconf-nati
> NOTE: current path: gpe-image (gpe-image) -> ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) -> automake-nati
> NOTE: current path: gpe-image (gpe-image) -> ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) -> libtool-nativ
> NOTE: current path: gpe-image (gpe-image) -> ipkg-utils-native (ipkg-utils-native)
> NOTE: current path: gpe-image (gpe-image) -> fakeroot-native (fakeroot-native)
> NOTE: current path: gpe-image (gpe-image) -> file-native (file-native)
> 
> Just in case, I'm using bitbake 1.6.1 (from SVN).
> 
> 
>> Output:
> 
>> NOTE: Parsing finished. 3962 cached, 0 parsed, 139 skipped, 27 masked.
> 
>> Traceback (most recent call last):
>>    File "/home/qduran/oe/bitbake/bin/bitbake", line 1161, in ?
>>      main()
>>    File "/home/qduran/oe/bitbake/bin/bitbake", line 1156, in main
>>      cooker.cook( BBConfiguration( options ), args[1:] )
>>    File "/home/qduran/oe/bitbake/bin/bitbake", line 962, in cook
>>      self.generateDotGraph( pkgs_to_build, 
>> self.configuration.ignored_dot_deps )
>>    File "/home/qduran/oe/bitbake/bin/bitbake", line 544, in generateDotGraph
>>      add_depends( pkgs_to_build )
>>    File "/home/qduran/oe/bitbake/bin/bitbake", line 467, in add_depends
>>      fn = myFilterProvider(providers, package)[0]
>>    File "/home/qduran/oe/bitbake/bin/bitbake", line 413, in myFilterProvider
>>      preferred_versions[pn] = bb.providers.findBestProvider(pn, pkg_pn)[2:4]
>> TypeError: findBestProvider() takes at least 3 arguments (2 given)
> 
>   Needs to be fixed, sure. Worth a bugreport at
> http://bugs.openembedded.org .

Done

>> Hope this helps.
> 
> 
> 



