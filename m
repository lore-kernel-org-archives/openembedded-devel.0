Received: from [66.249.82.236] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <zhangwenbin@gmail.com>) id 1HWCR9-0004qa-79
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2007 16:14:11 +0200
Received: by wx-out-0506.google.com with SMTP id t14so2411304wxc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2007 07:14:10 -0700 (PDT)
Received: by 10.90.87.5 with SMTP id k5mr8081182agb.1175004849945;
	Tue, 27 Mar 2007 07:14:09 -0700 (PDT)
Received: by 10.90.31.20 with HTTP; Tue, 27 Mar 2007 07:14:09 -0700 (PDT)
Message-ID: <78671ac40703270714l208722b5pf370e3c630899cf9@mail.gmail.com>
Date: Tue, 27 Mar 2007 10:14:09 -0400
From: "Wenbin Zhang" <zhangwenbin@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Openembedded compile problem
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
X-List-Received-Date: Tue, 27 Mar 2007 14:14:11 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I am using openembedded to compile OPIE for Arm phone(Moto E680i)
http://www.openembedded.org/wiki/GettingStarted
but get below error while I was using bitbake:

#bitbake opie-image

The output is:

NOTE: build 200703270602: started

OE Build Configuration:
BB_VERSION     = "1.6.7"
OE_REVISION    = "3948893d2ed26ea5eca6f888be77701718112c87"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "a780"
DISTRO         = "angstrom"
DISTRO_VERSION = ""
TARGET_FPU     = ""

NOTE: package binutils-cross-2.17.50.0.12 : started
NOTE: package binutils-cross-2.17.50.0.12-r0: task do_populate_staging:
started
ERROR: function do_stage failed
ERROR: log data follows (/stuff/tmp/work/binutils- cross-2.17.50.0.12-r0
/temp/log.do_stage.3118)
| NOTE: make configure-build-libiberty all install
| make: *** No rule to make target `configure-build-libiberty'.  Stop.
| FATAL: oe_runmake failed
NOTE: Task failed: /stuff/tmp/work/binutils-cross-2.17.50.0.12-r0
/temp/log.do_stage.3118
NOTE: package binutils-cross-2.17.50.0.12-r0: task do_populate_staging:
failed
ERROR: TaskFailed event exception, aborting
NOTE: package binutils-cross-2.17.50.0.12 : failed
ERROR: Build of opie-image failed

Anybody know this problem?

Thanks,
Wenbin

