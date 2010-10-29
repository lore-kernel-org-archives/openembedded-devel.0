Received: from li39-162.members.linode.com ([207.192.75.162]
	helo=defiant.hybotics.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robotguy@hybotics.com>) id 1PBwDv-000479-Gy
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 23:10:58 +0200
Received: from intrepid.localnet (c-24-21-60-36.hsd1.or.comcast.net
	[24.21.60.36])
	by defiant.hybotics.com (Postfix) with ESMTPA id 946626847C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Oct 2010 16:59:57 -0400 (EDT)
From: Dale Weber <robotguy@hybotics.com>
Organization: Hybrid Robotics
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Oct 2010 14:00:38 -0700
User-Agent: KMail/1.13.5 (Linux/2.6.35-22-generic; KDE/4.5.1; i686; ; )
References: <20100927121005.26700@gmx.net> <20101029192145.GB27520@gmail.com>
In-Reply-To: <20101029192145.GB27520@gmail.com>
MIME-Version: 1.0
Message-Id: <201010291400.39166.robotguy@hybotics.com>
X-SA-Exim-Connect-IP: 207.192.75.162
X-SA-Exim-Mail-From: robotguy@hybotics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Package Grouping, Development Libraries and Headers.
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
X-List-Received-Date: Fri, 29 Oct 2010 21:10:58 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

	Greetings,

	I need to have development libraries and headers installed for certain 
packages and was told that package grouping would accomplish this. I am not so 
sure that is true and have serious doubts. Below is what I have for errors and 
the recipe I am trying to modify to get development libraries and headers 
installed.

	How can I accomplish what I need to do without doing a bunch of native 
builds just to get development libraries and headers?

	8-Dale


NOTE: Handling BitBake files: \ (7100/7100) [100 %]
Parsing of 7100 .bb files complete (6687 cached, 413 parsed). 7347 targets, 301 
skipped, 0 masked, 0 errors.

Build Configuration:
BB_VERSION        = "1.10.0"
METADATA_BRANCH   = "master"
METADATA_REVISION = "f503cc21ff0c6dbc06c22b05975c2a2c6d16ede9"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beagleboard"
DISTRO            = "angstrom"
DISTRO_VERSION    = "2010.7-test-20101029"
TARGET_FPU        = "hard"

========
THE ERRORS
========

ERROR: '['/xdev/Devel/Beagle/sources/openembedded/recipes/images/walter-
console-dev-image.bb']' RDEPENDS/RRECOMMENDS or otherwise requires the runtime 
entity 'task-sdk-native-dev' but it wasn't found in any PACKAGE or RPROVIDES 
variables
ERROR: Required build target 'walter-console-dev-image' has no buildable 
providers.
Missing or unbuildable dependency chain was: ['walter-console-dev-image', 
'task-sdk-native-dev']
NOTE: Resolving any missing task queue dependencies
ERROR: '['/xdev/Devel/Beagle/sources/openembedded/recipes/images/walter-
console-dev-image.bb']' RDEPENDS/RRECOMMENDS or otherwise requires the runtime 
entity 'task-sdk-native-dev' but it wasn't found in any PACKAGE or RPROVIDES 
variables
Unknown Event: <bb.event.NoProvider instance at 0x10bbf14c>
NOTE: Runtime target 'task-sdk-native-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-sdk-native-dev']
ERROR: Required build target 'walter-console-dev-image' has no buildable 
providers.
Missing or unbuildable dependency chain was: ['walter-console-dev-image', 
'task-sdk-native-dev']
Command execution failed: Traceback (most recent call last):
  File "/xdev/Devel/Beagle/sources/bitbake/lib/bb/command.py", line 88, in 
runAsyncCommand
    commandmethod(self.cmds_async, self, options)
  File "/xdev/Devel/Beagle/sources/bitbake/lib/bb/command.py", line 174, in 
buildTargets
    command.cooker.buildTargets(pkgs_to_build, task)
  File "/xdev/Devel/Beagle/sources/bitbake/lib/bb/cooker.py", line 784, in 
buildTargets
    taskdata.add_unresolved(localdata, self.status)
  File "/xdev/Devel/Beagle/sources/bitbake/lib/bb/taskdata.py", line 562, in 
add_unresolved
    self.remove_runtarget(self.getrun_id(target))
  File "/xdev/Devel/Beagle/sources/bitbake/lib/bb/taskdata.py", line 535, in 
remove_runtarget
    self.fail_fnid(fnid, missing_list)
  File "/xdev/Devel/Beagle/sources/bitbake/lib/bb/taskdata.py", line 490, in 
fail_fnid
    self.remove_buildtarget(target, missing_list)
  File "/xdev/Devel/Beagle/sources/bitbake/lib/bb/taskdata.py", line 519, in 
remove_buildtarget
    raise bb.providers.NoProvider
NoProvider

beagle@intrepid:/xdev/Devel/Beagle$ cat 
sources/openembedded/recipes/images/walter-console-dev-image.bb 

========
THE RECIPE:
========

#Angstrom bootstrap image
require console-base-image.bb

DEPENDS += "task-base-extended \
           "
IMAGE_FEATURES += "dev"
IMAGE_FEATURE_dev = "alsa-lib \
                        curl \
                        libusb \
                        openssl \
                        "

IMAGE_INSTALL += "task-base-extended \
    task-sdk-native \
    angstrom-led-config \
    apmd \
    minicom \
    cvs \
    git \
    subversion \
    ntp \
    tzdata \
    cherokee \
    vsftpd \
    i2c \
    i2c-tools \
    dosfstools \
    e2fsprogs \
    e2tools \
    sqlite \
    xchat \
    cron \
    sox \
    screen \
    rt73-firmware \
# Native build these for now
#    curl \
#    alsa-lib \
#    openssl \
#    libusb \
    "

export IMAGE_BASENAME = "walter-console-dev-image"

-- 
Open your mind, Read, Learn, Think, Apply..
AllStar Node 2392 / EchoLink 541558 / 73, from N7PKT!
http://www.hybotics.com - NEW main site
Just because we can, does it follow that we should?


