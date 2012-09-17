Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lucas.gerads@gmail.com>) id 1TDbLD-0005D6-1N
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Sep 2012 15:26:23 +0200
Received: by daks35 with SMTP id s35so3980062dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2012 06:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=xWzXPZSpYHplXNNz/OGWaAnBRrxI8/y6BnBx8NOD930=;
	b=Ab7itw45nxuuCM7iDOwoKNa56A6voHS9cNHpec4gXPKoidytFs1YAS4LjUZc1wzpvV
	VcnV/b3HUz0nP1Y0661+ijWRnDuAOxgOXSOBB0YUGOBVj0jFSwyQNwfjSUUemeojiODU
	tNOh/digZMz5og+Q2muGlyBr8wwvRT++LGNf7BxgO1Wbb8aZpGDFXMe2E++5MKFdpT1B
	voTVeX5+pjNgmKK9GQMMuNXn+bgooGEqfYYClG4JH3rcC3xhH1DmWJ/faA/j3rT2Vza+
	IQuyqhzLa6D6Gkrt8F6Wy/ZBv5IvAHOSLHJeUyj5CZ/W4SIMVTK5qshsCOaVaz1eWKzD
	SjLg==
MIME-Version: 1.0
Received: by 10.68.237.38 with SMTP id uz6mr23088360pbc.23.1347887623653; Mon,
	17 Sep 2012 06:13:43 -0700 (PDT)
Received: by 10.68.237.41 with HTTP; Mon, 17 Sep 2012 06:13:43 -0700 (PDT)
Date: Mon, 17 Sep 2012 15:13:43 +0200
Message-ID: <CALEMqRG1qnHH-whuSm4fhB9x3jS4qS=6wukswge0phcWoOWG9A@mail.gmail.com>
From: Lucas <lucas.gerads@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: package gobject-introspection-native-0.9.10-r1: task do_compile: Failed
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
X-List-Received-Date: Mon, 17 Sep 2012 13:26:23 -0000
Content-Type: text/plain; charset=UTF-8

Hello list,

excuse me, but I am fairly inexperienced developing with openembedded. I am
trying to build the beagleboard-demo-image, but get an error and I am not
sure how to go about fixing it. Could you please advice on how/where I have
to look to fix the problem. The OpenEmbedded build process is still a
little unclear to me, so I am not sure where to start. I would be grateful
for any leads and advice. I updated OpenEmbedded just now before building.
Below you find the complete output:

lucas@ubuntu:~/Work/oe$ bitbake beagleboard-demo-image
Loading cache: 100%
|#############################################################################################################################################|
Time: 00:00:09
Loaded 7101 entries from dependency cache.
NOTE: angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been
replaced by
bluez4
| ETA:  00:02:27
NOTE: angstrom DOES NOT support fso-apm because regular apmd is good
enough
| ETA:  00:02:06
NOTE: angstrom DOES NOT support bluez-utils because bluez-utils 3.x has
been replaced by
bluez4                                                                   |
ETA:  00:01:45
NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred
multimedia
library
| ETA:  00:01:18
NOTE: angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been
replaced by
bluez4
| ETA:  00:01:01
NOTE: angstrom DOES NOT support libiconv because the glibc builtin iconv
replacement is
used                                                                      |
ETA:  00:00:57
NOTE: angstrom DOES NOT support xcursor-watchonly-theme because
xcursor-transparent-theme is good
enough                                                          | ETA:
00:00:49
NOTE: angstrom DOES NOT support hotplug-ng because hotplug functionality is
provided by
udev                                                                      |
ETA:  00:00:44
NOTE: angstrom DOES NOT support bluez-utils because bluez-utils 3.x has
been replaced by
bluez4                                                                   |
ETA:  00:00:43
NOTE: angstrom DOES NOT support hotplug2 because hotplug functionality is
provided by
udev
| ETA:  00:00:42
NOTE: angstrom DOES NOT support bluez-libs because bluez-libs 3.x has been
replaced by
bluez4
| ETA:  00:00:35
NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred
multimedia
library#######
| ETA:  00:00:28
NOTE: angstrom DOES NOT support linux-hotplug because hotplug functionality
is provided by
udev###                                                                |
ETA:  00:00:26
NOTE: angstrom DOES NOT support bash-noemu because doesn't work on the
target################################
| ETA:  00:00:22
NOTE: angstrom DOES NOT support libiconv because the glibc builtin iconv
replacement is
used#####################                                                 |
ETA:  00:00:21
NOTE: angstrom DOES NOT support hotplug-ng because hotplug functionality is
provided by
udev##########################################                            |
ETA:  00:00:12
NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred
multimedia
library##################################################
| ETA:  00:00:10
NOTE: angstrom DOES NOT support ffmpeg because libav is the preferred
multimedia
library#####################################################
| ETA:  00:00:08
NOTE: angstrom DOES NOT support linux-hotplug because hotplug functionality
is provided by
udev####################################################               |
ETA:  00:00:06
NOTE: angstrom DOES NOT support ipkg because ipkg has been superseded by
opkg#######################################################################
| ETA:  00:00:05
NOTE: angstrom DOES NOT support libiconv because the glibc builtin iconv
replacement is
used#############################################################         |
ETA:  00:00:03
Parsing recipes: 100%
|###########################################################################################################################################|
Time: 00:00:57
Parsing of 7216 .bb files complete (6455 cached, 761 parsed). 7885 targets,
310 skipped, 0 masked, 0 errors.

Build Configuration:
BB_VERSION        = "1.12.0"
METADATA_BRANCH   = "master"
METADATA_REVISION = "c1f52c5"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beagleboard"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2012.09"
TARGET_FPU        = "hard"

NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for runtime x11vnc (x11vnc,
libvncserver)
NOTE: consider defining a PREFERRED_PROVIDER entry to match x11vnc
NOTE: multiple providers are available for runtime gnash-browser-plugin
(gnash, gnash-fb)
NOTE: consider defining a PREFERRED_PROVIDER entry to match
gnash-browser-plugin
NOTE: multiple providers are available for runtime xserver-kdrive
(xserver-kdrive, xserver-kdrive-1300)
NOTE: consider defining a PREFERRED_PROVIDER entry to match xserver-kdrive
NOTE: multiple providers are available for runtime abiword (abiword,
abiword-embedded)
NOTE: consider defining a PREFERRED_PROVIDER entry to match abiword
NOTE: multiple providers are available for runtime pstree (pstree, psmisc)
NOTE: consider defining a PREFERRED_PROVIDER entry to match pstree
NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
NOTE: Running task 3417 of 9585 (ID: 8222,
virtual:native:/home/lucas/Work/oe/openembedded/recipes/gobject-introspection/
gobject-introspection_0.9.10.bb, do_compile)
NOTE: package gobject-introspection-native-0.9.10-r1: task do_compile:
Started
ERROR: Logfile of failure stored in:
/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/temp/log.do_compile.2677
Log data follows:
| + do_compile
| + base_do_compile
| + '[' -e Makefile -o -e makefile -o -e GNUmakefile ']'
| + oe_runmake
| + oenote make
| + echo NOTE: make
| NOTE: make
| + make
| make  all-recursive
| make[1]: Entering directory
`/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10'
| Making all in girepository
| make[2]: Entering directory
`/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/girepository'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory
`/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/girepository'
| Making all in giscanner
| make[2]: Entering directory
`/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/giscanner'
| make  all-am
| make[3]: Entering directory
`/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/giscanner'
| make[3]: Nothing to be done for `all-am'.
| make[3]: Leaving directory
`/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/giscanner'
| make[2]: Leaving directory
`/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/giscanner'
| Making all in tools
| make[2]: Entering directory
`/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/tools'
| make[2]: Nothing to be done for `all'.
| make[2]: Leaving directory
`/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/tools'
| Making all in gir
| make[2]: Entering directory
`/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/gir'
|   GICOMP cairo-1.0.gir
|
/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/tools/.libs/lt-g-ir-compiler:
symbol lookup error: /usr/lib/libgirepository-1.0.so.1: undefined symbol:
g_mutex_lock
| make[2]: *** [cairo-1.0.typelib] Error 127
| make[2]: Leaving directory
`/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10/gir'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/gobject-introspection-0.9.10'
| make: *** [all] Error 2
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
NOTE: package gobject-introspection-native-0.9.10-r1: task do_compile:
Failed
ERROR: Function 'do_compile' failed (see
/home/lucas/Work/oe/tmp/work/x86_64-linux/gobject-introspection-native-0.9.10-r1/temp/log.do_compile.2677
for further information)
ERROR: Task 8222
(virtual:native:/home/lucas/Work/oe/openembedded/recipes/gobject-introspection/
gobject-introspection_0.9.10.bb, do_compile) failed with exit code '1'
ERROR:
'virtual:native:/home/lucas/Work/oe/openembedded/recipes/gobject-introspection/
gobject-introspection_0.9.10.bb' failed
lucas@ubuntu:~/Work/oe$

