Received: from [66.249.92.174] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <samgreen@gmail.com>) id 1GuZX2-0002DI-EH
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Dec 2006 20:12:44 +0100
Received: by ug-out-1314.google.com with SMTP id e2so244077ugf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Dec 2006 11:11:03 -0800 (PST)
Received: by 10.82.113.6 with SMTP id l6mr233670buc.1166037062588;
	Wed, 13 Dec 2006 11:11:02 -0800 (PST)
Received: by 10.82.175.5 with HTTP; Wed, 13 Dec 2006 11:11:02 -0800 (PST)
Message-ID: <7b4fff750612131111t3e58ec7fo51fd8cee1a436628@mail.gmail.com>
Date: Wed, 13 Dec 2006 13:11:02 -0600
From: "Sam Green" <samgreen@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Looking for Familiar/iPAQ local.conf example
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
X-List-Received-Date: Wed, 13 Dec 2006 19:12:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I have followed http://www.openembedded.org/wiki/GettingStarted _very_
carefully, but I am unable to get past the "bitbake nano" step. Here is the
output:

kmu@debian:~/dev/oe/build$ bitbake nano
NOTE: Using cache in '/home/kmu/dev/oe/build/tmp/cache/h3800'
NOTE: Handling BitBake files: \ (4072/4072) [100 %]
NOTE: Parsing finished. 0 cached, 3899 parsed, 173 skipped, 0 masked.

NOTE: build 200612131210: started

OE Build Configuration:
BB_VERSION     = "1.6.3"
OE_REVISION    = "7dc5c6145f5a9f64aba3521e24e1a0b1ff7f0e0e"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "h3800"
DISTRO         = "familiar"
DISTRO_VERSION = "0.8.4"
TARGET_FPU     = "soft"

NOTE: package quilt-native-0.45: started
NOTE: package quilt-native-0.45-r0: task do_populate_staging: started
NOTE: SITE files /home/kmu/dev/oe/org.openembedded.dev/site/endian-little
/home/kmu/dev/oe/org.openembedded.dev/site/ix86-common
ERROR: function do_stage failed
ERROR: log data follows (/home/kmu/dev/oe/build/tmp/work/quilt-
native-0.45-r0/temp/log.do_stage.4017)
| NOTE: make install
| make: *** No rule to make target `install'.  Stop.
| FATAL: oe_runmake failed
NOTE: Task failed: /home/kmu/dev/oe/build/tmp/work/quilt-native-0.45-r0
/temp/log.do_stage.4017
NOTE: package quilt-native-0.45-r0: task do_populate_staging: failed
ERROR: TaskFailed event exception, aborting
NOTE: package quilt-native-0.45: failed
ERROR: Build of nano failed

I think my problem is my local.conf. Can someone developing for
Familiar/iPAQ post theirs?

Thanks,
Sam

