Received: from [64.233.182.185] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <samgreen@gmail.com>) id 1GuAaQ-0005ht-3e
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Dec 2006 17:34:34 +0100
Received: by nf-out-0910.google.com with SMTP id l24so258927nfc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Dec 2006 08:32:59 -0800 (PST)
Received: by 10.82.127.15 with SMTP id z15mr759807buc.1165941178871;
	Tue, 12 Dec 2006 08:32:58 -0800 (PST)
Received: by 10.82.175.5 with HTTP; Tue, 12 Dec 2006 08:32:58 -0800 (PST)
Message-ID: <7b4fff750612120832t2688cd5ft4e3be102faf75d24@mail.gmail.com>
Date: Tue, 12 Dec 2006 10:32:58 -0600
From: "Sam Green" <samgreen@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: "bitburn nano" fails: ERROR: function do_stage failed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Dec 2006 16:34:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I am trying to cross-compile on OE for my iPAQ 3800/Familiar PDA. I have
carefully followed http://www.openembedded.org/wiki/GettingStarted, but I
can not get past the "bitbake nano" step. I get:

###################################################
sbgree@ubuntu:/openembedded/build$ bitbake nano
NOTE: Using cache in '/openembedded/build/tmp/cache/h3800'
NOTE: Handling BitBake files: \ (4092/4092) [100 %]
NOTE: Parsing finished. 0 cached, 3919 parsed, 173 skipped, 0 masked.

NOTE: build 200612121006: started

OE Build Configuration:
BB_VERSION     = "1.6.3"
OE_REVISION    = "d3a4f1285a8d621925836a8a2ea609ea62d1cc9d"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "h3800"
DISTRO         = "familiar"
DISTRO_VERSION = ""
TARGET_FPU     = "soft"

NOTE: package quilt-native-0.45: started
NOTE: package quilt-native-0.45-r0: task do_populate_staging: started
NOTE: SITE files /openembedded/org.openembedded.dev/site/endian-little
/openembedded/org.openembedded.dev/site/ix86-common
ERROR: function do_stage failed
ERROR: log data follows (/openembedded/build/tmp/work/quilt-native-0.45-r0
/temp/log.do_stage.5991)
| NOTE: make install
| make: *** No rule to make target `install'. Stop.
| FATAL: oe_runmake failed
NOTE: Task failed: /openembedded/build/tmp/work/quilt-native-0.45-r0
/temp/log.do_stage.5991
NOTE: package quilt-native-0.45-r0: task do_populate_staging: failed
ERROR: TaskFailed event exception, aborting
NOTE: package quilt-native-0.45: failed
ERROR: Build of nano failed
###################################################

I suspect my local.conf is my problem:

###################################################
DL_DIR = "/home/sbgree/sources"
BBFILES = "/openembedded/org.openembedded.dev/packages/*/*.bb"
TARGET_OS = "linux"
TARGET_ARCH = "arm"
TARGET_FPU = "soft"
MACHINE = "h3800"
DISTRO = "familiar"
IMAGE_FSTYPES = "jffs2 tar"
BBINCLUDELOGS = "yes"
###################################################

Can someone please give me a pointer?

Thanks,
Sam Green

