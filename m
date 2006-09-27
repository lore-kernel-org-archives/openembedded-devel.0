Received: from [64.233.166.177] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <pmiscml@gmail.com>) id 1GSezE-0004MS-4D
	for openembedded-devel@lists.openembedded.org;
	Wed, 27 Sep 2006 21:22:28 +0200
Received: by py-out-1112.google.com with SMTP id i75so367275pye
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Sep 2006 12:17:30 -0700 (PDT)
Received: by 10.35.77.1 with SMTP id e1mr2025755pyl;
	Wed, 27 Sep 2006 12:17:29 -0700 (PDT)
Received: from CUBE ( [82.193.96.236])
	by mx.gmail.com with ESMTP id i5sm775914nzi.2006.09.27.12.17.28;
	Wed, 27 Sep 2006 12:17:29 -0700 (PDT)
Date: Wed, 27 Sep 2006 22:17:30 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <661829260.20060927221730@gmail.com>
To: Joaquim Duran <joaquinduran@adtelecom.es>
In-Reply-To: <451A29EA.1080309@adtelecom.es>
References: <45190D58.2020807@adtelecom.es>
	<1865823264.20060926150138@gmail.com>
	<451948D7.6000904@adtelecom.es> <451A29EA.1080309@adtelecom.es>
MIME-Version: 1.0
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 27 Sep 2006 19:22:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Joaquim,

Wednesday, September 27, 2006, 10:36:10 AM, you wrote:

> Hello,

> As I've the impression that Bitbake is very related to OE. I post the 
> bug here.

> I execute: bitbake -g boostrap-image.

  Have to say I didn't try -g myself yet. --dry-run --verbose what I
usually use, as was suggested on this last before. And I just tried
that it actuially works without any packages built. Specifically:

bitbake --dry-run --verbose gpe-image|grep "current path"

NOTE: current path: gpe-image (gpe-image)
NOTE: current path: gpe-image (gpe-image) -> ipkg-native (ipkg-native)
NOTE: current path: gpe-image (gpe-image) -> ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native)
NOTE: current path: gpe-image (gpe-image) -> ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) -> autoconf-nati
NOTE: current path: gpe-image (gpe-image) -> ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) -> autoconf-nati
NOTE: current path: gpe-image (gpe-image) -> ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) -> autoconf-nati
NOTE: current path: gpe-image (gpe-image) -> ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) -> autoconf-nati
NOTE: current path: gpe-image (gpe-image) -> ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) -> automake-nati
NOTE: current path: gpe-image (gpe-image) -> ipkg-native (ipkg-native) -> pkgconfig-native (pkgconfig-native) -> libtool-nativ
NOTE: current path: gpe-image (gpe-image) -> ipkg-utils-native (ipkg-utils-native)
NOTE: current path: gpe-image (gpe-image) -> fakeroot-native (fakeroot-native)
NOTE: current path: gpe-image (gpe-image) -> file-native (file-native)

Just in case, I'm using bitbake 1.6.1 (from SVN).


> Output:

> NOTE: Parsing finished. 3962 cached, 0 parsed, 139 skipped, 27 masked.

> Traceback (most recent call last):
>    File "/home/qduran/oe/bitbake/bin/bitbake", line 1161, in ?
>      main()
>    File "/home/qduran/oe/bitbake/bin/bitbake", line 1156, in main
>      cooker.cook( BBConfiguration( options ), args[1:] )
>    File "/home/qduran/oe/bitbake/bin/bitbake", line 962, in cook
>      self.generateDotGraph( pkgs_to_build, 
> self.configuration.ignored_dot_deps )
>    File "/home/qduran/oe/bitbake/bin/bitbake", line 544, in generateDotGraph
>      add_depends( pkgs_to_build )
>    File "/home/qduran/oe/bitbake/bin/bitbake", line 467, in add_depends
>      fn = myFilterProvider(providers, package)[0]
>    File "/home/qduran/oe/bitbake/bin/bitbake", line 413, in myFilterProvider
>      preferred_versions[pn] = bb.providers.findBestProvider(pn, pkg_pn)[2:4]
> TypeError: findBestProvider() takes at least 3 arguments (2 given)

  Needs to be fixed, sure. Worth a bugreport at
http://bugs.openembedded.org .

> Hope this helps.



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



