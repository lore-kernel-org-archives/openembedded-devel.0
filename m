Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TDbrI-0008Ao-Ec
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 15:59:32 +0200
Received: from localhost ([127.0.0.1]:55734 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TDbf3-0006Wk-Ou
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 13:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=IWBaPNvLBFHuYmyh0ZgI4rBibcY=; b=qSw+yS8eWPBAEvxyHWizeTOisYa4
	X9G7ppN080mQngHEHjp4lSAK1I5vwXld1X7bFvGt7phYHaEfu0g0j1CPqM+qzu4E
	ruDX+Ad8Gy4bzKDEDuoZqPdLqUci/UDcnvdsOV+pT+q2Grngo7o6LEZSI3P6rweE
	rV880vutmf+mKwY=
Received: from [195.171.99.130] (port=34572 helo=[192.168.0.42])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TDbf3-0006Wg-KK
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 13:46:53 +0000
Message-ID: <50572A31.90206@communistcode.co.uk>
Date: Mon, 17 Sep 2012 14:48:33 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120910 Thunderbird/15.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CALEMqRG1qnHH-whuSm4fhB9x3jS4qS=6wukswge0phcWoOWG9A@mail.gmail.com>
In-Reply-To: <CALEMqRG1qnHH-whuSm4fhB9x3jS4qS=6wukswge0phcWoOWG9A@mail.gmail.com>
Subject: Re: package gobject-introspection-native-0.9.10-r1: task do_compile: Failed
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
X-List-Received-Date: Mon, 17 Sep 2012 13:59:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 17/09/12 14:13, Lucas wrote:
> Hello list,
>
> excuse me, but I am fairly inexperienced developing with openembedded. I am
> trying to build the beagleboard-demo-image, but get an error and I am not
> sure how to go about fixing it. Could you please advice on how/where I have
> to look to fix the problem. The OpenEmbedded build process is still a
> little unclear to me, so I am not sure where to start. I would be grateful
> for any leads and advice. I updated OpenEmbedded just now before building.
> Below you find the complete output:
>
> lucas@ubuntu:~/Work/oe$ bitbake beagleboard-demo-image
> Loading cache: 100%
> |#############################################################################################################################################|
> Time: 00:00:09
> Loaded 7101 entries from dependency cache.
> NOTE: angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been
> replaced by
> bluez4
> | ETA:  00:02:27
> NOTE: angstrom DOES NOT support fso-apm because regular apmd is good
> enough
> | ETA:  00:02:06
> NOTE: angstrom DOES NOT support bluez-utils because bluez-utils 3.x has
> been replaced by
> bluez4                                                                   |
> ETA:  00:01:45
> NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred
> multimedia
> library
> | ETA:  00:01:18
> NOTE: angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been
> replaced by
> bluez4
> | ETA:  00:01:01
> NOTE: angstrom DOES NOT support libiconv because the glibc builtin iconv
> replacement is
> used                                                                      |
> ETA:  00:00:57
> NOTE: angstrom DOES NOT support xcursor-watchonly-theme because
> xcursor-transparent-theme is good
> enough                                                          | ETA:
> 00:00:49
> NOTE: angstrom DOES NOT support hotplug-ng because hotplug functionality is
> provided by
> udev                                                                      |
> ETA:  00:00:44
> NOTE: angstrom DOES NOT support bluez-utils because bluez-utils 3.x has
> been replaced by
> bluez4                                                                   |
> ETA:  00:00:43
> NOTE: angstrom DOES NOT support hotplug2 because hotplug functionality is
> provided by
> udev
> | ETA:  00:00:42
> NOTE: angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been
> replaced by
> bluez4
> | ETA:  00:00:35
> NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred
> multimedia
> library#######
> | ETA:  00:00:28
> NOTE: angstrom DOES NOT support linux-hotplug because hotplug functionality
> is provided by
> udev###                                                                |
> ETA:  00:00:26
> NOTE: angstrom DOES NOT support bash-noemu because doesn't work on the
> target################################
> | ETA:  00:00:22
> NOTE: angstrom DOES NOT support libiconv because the glibc builtin iconv
> replacement is
> used#####################                                                 |
> ETA:  00:00:21
> NOTE: angstrom DOES NOT support hotplug-ng because hotplug functionality is
> provided by
> udev##########################################                            |
> ETA:  00:00:12
> NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred
> multimedia
> library##################################################
> | ETA:  00:00:10
> NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred
> multimedia
> library#####################################################
> | ETA:  00:00:08
> NOTE: angstrom DOES NOT support linux-hotplug because hotplug functionality
> is provided by
> udev####################################################               |
> ETA:  00:00:06
> NOTE: angstrom DOES NOT support ipkg because ipkg has been superseded by
> opkg#######################################################################
> | ETA:  00:00:05
> NOTE: angstrom DOES NOT support libiconv because the glibc builtin iconv
> replacement is
> used#############################################################         |
> ETA:  00:00:03
> Parsing recipes: 100%
> |###########################################################################################################################################|
> Time: 00:00:57
> Parsing of 7216 .bb files complete (6455 cached, 761 parsed). 7885 targets,
> 310 skipped, 0 masked, 0 errors.
>
> Build Configuration:
> BB_VERSION        = "1.12.0"
> METADATA_BRANCH   = "master"
> METADATA_REVISION = "c1f52c5"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "beagleboard"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "v2012.09"
> TARGET_FPU        = "hard"
>
> NOTE: Resolving any missing task queue dependencies
> NOTE: multiple providers are available for runtime x11vnc (x11vnc,
> libvncserver)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match x11vnc
> NOTE: multiple providers are available for runtime gnash-browser-plugin
> (gnash, gnash-fb)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match
> gnash-browser-plugin
> NOTE: multiple providers are available for runtime xserver-kdrive
> (xserver-kdrive, xserver-kdrive-1300)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match xserver-kdrive
> NOTE: multiple providers are available for runtime abiword (abiword,
> abiword-embedded)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match abiword
> NOTE: multiple providers are available for runtime pstree (pstree, psmisc)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match pstree
> NOTE: Preparing runqueue
> NOTE: Executing RunQueue Tasks
> NOTE: Running task 3417 of 9585 (ID: 8222,
> virtual:native:/home/lucas/Work/oe/openembedded/recipes/gobject-introspection/
> gobject-introspection_0.9.10.bb, do_compile)
> NOTE: package gobject-introspection-native-0.9.10-r1: task do_compile:
> Started
> ERROR: Logfile of failure stored in:
> /home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/temp/log.do_compile.2677
> Log data follows:
> | + do_compile
> | + base_do_compile
> | + '[' -e Makefile -o -e makefile -o -e GNUmakefile ']'
> | + oe_runmake
> | + oenote make
> | + echo NOTE: make
> | NOTE: make
> | + make
> | make  all-recursive
> | make[1]: Entering directory
> `/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10'
> | Making all in girepository
> | make[2]: Entering directory
> `/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/girepository'
> | make[2]: Nothing to be done for `all'.
> | make[2]: Leaving directory
> `/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/girepository'
> | Making all in giscanner
> | make[2]: Entering directory
> `/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/giscanner'
> | make  all-am
> | make[3]: Entering directory
> `/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/giscanner'
> | make[3]: Nothing to be done for `all-am'.
> | make[3]: Leaving directory
> `/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/giscanner'
> | make[2]: Leaving directory
> `/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/giscanner'
> | Making all in tools
> | make[2]: Entering directory
> `/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/tools'
> | make[2]: Nothing to be done for `all'.
> | make[2]: Leaving directory
> `/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/tools'
> | Making all in gir
> | make[2]: Entering directory
> `/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/gir'
> |   GICOMP cairo-1.0.gir
> |
> /home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/tools/.libs/lt-g-ir-compiler:
> symbol lookup error: /usr/lib/libgirepository-1.0.so.1: undefined symbol:
> g_mutex_lock
> | make[2]: *** [cairo-1.0.typelib] Error 127
> | make[2]: Leaving directory
> `/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/gir'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> `/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10'
> | make: *** [all] Error 2
> | + die 'oe_runmake failed'
> | + oefatal 'oe_runmake failed'
> NOTE: package gobject-introspection-native-0.9.10-r1: task do_compile:
> Failed
> ERROR: Function 'do_compile' failed (see
> /home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/temp/log.do_compile.2677
> for further information)
> ERROR: Task 8222
> (virtual:native:/home/lucas/Work/oe/openembedded/recipes/gobject-introspection/
> gobject-introspection_0.9.10.bb, do_compile) failed with exit code '1'
> ERROR:
> 'virtual:native:/home/lucas/Work/oe/openembedded/recipes/gobject-introspection/
> gobject-introspection_0.9.10.bb' failed
> lucas@ubuntu:~/Work/oe$
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
Where did your build scripts come from? If they didn't come from [1] 
then I would suggest re-trying with the instructions on that page.

[1] http://www.angstrom-distribution.org/building-angstrom

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



