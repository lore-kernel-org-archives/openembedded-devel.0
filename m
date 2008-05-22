Received: from [38.98.186.166] (helo=smtp.01.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ken@buglabs.net>) id 1JzI0r-0003bS-Rr
	for openembedded-devel@openembedded.org; Thu, 22 May 2008 23:07:50 +0200
Received: from asav-2.01.com (localhost.localdomain [127.0.0.1])
	by asav-2.01.com (8.13.1/8.13.1) with SMTP id m4ML52K1005210
	for <openembedded-devel@openembedded.org>;
	Thu, 22 May 2008 16:05:02 -0500
Received: from smtp-2.01.com (smtp-2.01.com [38.98.186.158])
	by asav-2.01.com (asav-2.01.com [10.25.1.12])
	id k4LG520360420608EZ ret-id none; Thu, 22 May 2008 16:05:02 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp-2.01.com (Postfix) with ESMTP id 330C11AD3C1
	for <openembedded-devel@openembedded.org>;
	Thu, 22 May 2008 16:05:02 -0500 (CDT)
Received: from smtp-2.01.com ([127.0.0.1])
	by localhost (smtp-2.01.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmyG7qSsob3K for <openembedded-devel@openembedded.org>;
	Thu, 22 May 2008 16:05:02 -0500 (CDT)
Received: from [192.168.20.184] (ip-64-32-229-194.dsl.nyc.megapath.net
	[64.32.229.194]) by smtp-2.01.com (Postfix) with ESMTP id EBA591AD390
	for <openembedded-devel@openembedded.org>;
	Thu, 22 May 2008 16:05:01 -0500 (CDT)
Message-ID: <4835DFFD.80702@buglabs.net>
Date: Thu, 22 May 2008 17:05:01 -0400
From: Ken Gilmer <ken@buglabs.net>
User-Agent: Thunderbird 2.0.0.14 (X11/20080518)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <mailman.5128.1211185830.10988.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.5128.1211185830.10988.openembedded-devel@lists.openembedded.org>
X-FSL-MailScanner-Information: Please contact postmaster@01.com for more
	information
X-FSL-MailScanner: Found to be clean
X-FSL-MailScanner-SpamCheck: 
X-FSL-MailScanner-From: ken@buglabs.net
Subject: Kernel Dependency Issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Thu, 22 May 2008 21:07:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Hello :)

  I've been having an issue with dependency resolution.  I have taken
stock org.openembedded.stable from last week, and added my own machine
and kernel recipie.  My conf/local references my machine:

> MACHINE = "bug"

My machine specifies my preferred kernel:

> PREFERRED_PROVIDER_virtual/kernel = "linux-bug"

And my kernel recipie inherets from kernel such that the PROVIDES
variable is set.  Despite this, I get this message when trying to build
the kernel:

kgilmer@t61 ~/dev/sandbox/oe-stable $ bitbake linux
NOTE: Out of date cache found, rebuilding...
NOTE: Handling BitBake files: - (4978/4978) [100 %]
NOTE: Parsing finished. 0 cached, 4738 parsed, 240 skipped, 0 masked.
NOTE: build 200805221644: started

OE Build Configuration:
BB_VERSION     = "1.8.11"
OE_REVISION    = "0a63e1d7756e807c77d989e9473d42567671c819"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux-gnueabi"
MACHINE        = "bug"
DISTRO         = "angstrom"
DISTRO_VERSION = "2007.12-r14"
TARGET_FPU     = "soft"

NOTE: Resolving any missing task queue dependencies
NOTE: preferred version 2.5 of glibc not available (for item
virtual/arm-angstrom-linux-gnueabi-libc-for-gcc)
NOTE: Preparing runqueue
ERROR: Multiple .bb files are due to be built which each provide
virtual/kernel
(/home/kgilmer/dev/sandbox/oe-stable/org.openembedded.stable/packages/linux/linux_2.6.21.bb
/home/kgilmer/dev/sandbox/oe-stable/org.openembedded.stable/packages/linux/linux-bug_2.6.19.2.bb).
 This usually means one provides something the other doesn't and should.
...


I've asked some questions on IRC and thanks to the folks on there for
giving me suggestions.  Running with "-DDD" or getting the dependency
tree "-g" does not seem to tell me anything on how to determine what I'm
missing.  A similar machine/kernel configuration works in Poky/Pinky
3.1.  What could I be missing?

TIA
ken


