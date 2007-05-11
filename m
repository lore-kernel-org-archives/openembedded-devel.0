Received: from [216.182.48.170] (helo=beastbox.kfctristate.com)
	by linuxtogo.org with smtp (Exim 4.67)
	(envelope-from <tom@openhardware.net>) id 1HmZCQ-0003DX-I7
	for openembedded-devel@openembedded.org; Fri, 11 May 2007 19:46:40 +0200
Received: (qmail 8326 invoked from network); 11 May 2007 17:45:47 -0000
Received: from unknown (HELO ?172.30.107.2?) (172.30.107.2)
	by beastbox.kfctristate.com with SMTP; 11 May 2007 17:45:47 -0000
Message-ID: <4644ABCB.6080202@openhardware.net>
Date: Fri, 11 May 2007 13:45:47 -0400
From: Tom Walsh <tom@openhardware.net>
User-Agent: Thunderbird 1.5.0.10 (X11/20070305)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: do_rootfs fails
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
X-List-Received-Date: Fri, 11 May 2007 17:46:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Ok, I admit it, I am totally confused by this whole "debian", 
"multimachine", "package_ipk" stuff.  I've been able to avoid 
understanding this and think that this might be why bootstrap.image 
won't build a filesystem image.

Prior to a month ago, I was using my own task + image bb files to build 
my image.  Since a lot of work has been done to make the task-base more 
generic, I have moved my project over to using the stock 
bootstrap-image.bb and task-base.bb files.  However, it fails to build 
properly.

When running a "bitbake bootstrap-image", everything builds but then 
fails with:

========= begin ============
[tom@jtag oezipit]$ bitbake bootstrap-image
NOTE: Using cache in '/home/tom/oezipit/tmp/cache/zipit'
NOTE: Handling BitBake files: \ (4534/4534) [100 %]
NOTE: Parsing finished. 4329 cached, 0 parsed, 205 skipped, 0 masked.

NOTE: build 200705111324: started

OE Build Configuration:
BB_VERSION     = "1.6.7"
OE_REVISION    = "<unknown>"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "zipit"
DISTRO         = "zipit"
DISTRO_VERSION = "1.0"
TARGET_FPU     = "soft"

NOTE: multiple providers are available (db3, db);
NOTE: consider defining PREFERRED_PROVIDER_virtual/db
NOTE: multiple providers are available (db3-native, db-native);
NOTE: consider defining PREFERRED_PROVIDER_virtual/db-native
NOTE: package bootstrap-image-1.0: started
NOTE: package bootstrap-image-1.0-r0: task do_rootfs: started
ERROR: function do_rootfs failed
ERROR: see log in 
/home/tom/oezipit/tmp/work/zipit-linux/bootstrap-image-1.0-r0/temp/log.do_rootfs.17150
NOTE: Task failed: 
/home/tom/oezipit/tmp/work/zipit-linux/bootstrap-image-1.0-r0/temp/log.do_rootfs.17150
NOTE: package bootstrap-image-1.0-r0: task do_rootfs: failed
ERROR: TaskFailed event exception, aborting
NOTE: package bootstrap-image-1.0: failed
ERROR: Build of bootstrap-image failed
========= snip =============

When I check the logfile, it says that "sh: fakeroot: command not 
found".  This is correct, fakeroot-native has NOT been built.  So, I do 
a "bitbake -c rebuild fakeroot-native", then run "bitbake 
bootstrap-image" again.

It then fails with a logfile message of 
"/home/tom/oezipit/tmp/work/zipit-linux/bootstrap-image-1.0-r0/temp/run.do_rootfs.24175: 
line 312: ipkg-cl: command not found".  Again, this is true, ipkg-native 
is not present.  So, I do a "bitbake -c rebuild ipkg-native", then run 
"bitbake bootstrap-image" again.

Now it builds the filesystem target tarball image.

How can I automate those needs for fakeroot-native and ipkg-native?  I'm 
not sure where to look, this was working a few weeks ago.

Regards,

TomW





-- 
Tom Walsh - WN3L - Embedded Systems Consultant
http://openhardware.net http://cyberiansoftware.com http://openzipit.org
"Windows? No thanks, I have work to do..."
----------------------------------------------------




