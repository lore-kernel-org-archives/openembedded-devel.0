Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LzIWF-0007za-PI
	for openembedded-devel@openembedded.org; Thu, 30 Apr 2009 00:44:48 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LzIR7-0002Eo-4o
	for openembedded-devel@openembedded.org; Wed, 29 Apr 2009 22:39:29 +0000
Received: from cuo02-acns-ce1.cisco.com ([64.101.22.72])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 29 Apr 2009 22:39:29 +0000
Received: from msundius by cuo02-acns-ce1.cisco.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 29 Apr 2009 22:39:29 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Michael Sundius <msundius@sundius.com>
Date: Wed, 29 Apr 2009 22:39:16 +0000 (UTC)
Message-ID: <loom.20090429T222752-306@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: main.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 64.101.22.72 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.15) Gecko/20080702 Fedora/2.0.0.15-1.fc8 Firefox/2.0.0.15)
Sender: news <news@ger.gmane.org>
Subject: problem building an image
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
X-List-Received-Date: Wed, 29 Apr 2009 22:44:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I seem to be getting a build problem when I build an image. It does it
on any image, even the helloworld-image. anyone can help?

please see below the bitbake output as well as the logfile contents:

bitbake out:
------------------------------------------------

msundius@CUPLXSUNDISM01 build]$ bitbake helloworld-image
NOTE: Handling BitBake files: \ (6625/6625) [100 %]
NOTE: Parsing finished. 6339 cached, 0 parsed, 286 skipped, 0 masked.
NOTE: Cache is clean, not saving.
NOTE: build 200904291528: started

OE Build Configuration:
BB_VERSION        = "1.8.12"
METADATA_BRANCH   = "work"
METADATA_REVISION = "e8f9ef39737cdfb72d0906456e9890615a615471"
TARGET_ARCH       = "mips"
TARGET_OS         = "linux"
MACHINE           = "8kg6-ngp"
DISTRO            = "sciatl"
DISTRO_VERSION    = "1"
TARGET_FPU        = "soft"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing runqueue
NOTE: Running task 533 of 535 (ID: 9,
/home/sundism/oe/openembedded/packages/images/helloworld-image.bb, do_rootfs)
NOTE: package helloworld-image-1.0: started
NOTE: package helloworld-image-1.0-r0: task do_rootfs: started
ERROR: function do_rootfs failed
ERROR: see log in
/home/sundism/oe/out/work/8kg6-ngp-linux/helloworld-image-1.0-r0/temp/log.
do_rootfs.17498
NOTE: Task failed:
/home/sundism/oe/out/work/8kg6-ngp-linux/helloworld-image-1.0-r0/temp/log.
do_rootfs.17498
NOTE: package helloworld-image-1.0-r0: task do_rootfs: failed
ERROR: TaskFailed event exception, aborting
NOTE: package helloworld-image-1.0: failed
ERROR: Build of
/home/sundism/oe/openembedded/packages/images/helloworld-image.bb do_rootfs
 failed
ERROR: Task 9
(/home/sundism/oe/openembedded/packages/images/helloworld-image.bb, 
do_rootfs)failed
NOTE: Tasks Summary: Attempted 532 tasks of which 532 didn't need to be 
rerun and 1 failed.
ERROR: '/home/sundism/oe/openembedded/packages/images/helloworld-image.bb' 
failed
NOTE: build 200904291528: completed

logfile out:
-------------------------------
+ rm -rf /home/sundism/oe/out/rootfs
+ mkdir -p /home/sundism/oe/out/rootfs
+ mkdir -p /home/sundism/oe/out/deploy/images
+ '[' 0 '!=' 1 ']'
+ for devtable in /home/sundism/oe/openembedded/files/device_table-minimal.
txt
+ makedevs -r /home/sundism/oe/out/rootfs -D

/home/sundism/oe/openembedded/files/device_table-minimal.txt
+ rootfs_ipk_do_rootfs
+ set -x
+ package_update_index_ipk
+ set -x
+ ipkgarchs='all any noarch mips  8kg6-ngp'
+ '[' '!' -z '' ']'
+ touch /home/sundism/oe/out/deploy/ipk/Packages
+ ipkg-make-index -r /home/sundism/oe/out/deploy/ipk/Packages -p

/home/sundism/oe/out/deploy/ipk/Packages -l

/home/sundism/oe/out/deploy/ipk/Packages.filelist -m 

/home/sundism/oe/out/deploy/ipk

+ for arch in '$ipkgarchs'
+ '[' -e /home/sundism/oe/out/deploy/ipk/all/ ']'
+ touch /home/sundism/oe/out/deploy/ipk/all/Packages
+ ipkg-make-index -r /home/sundism/oe/out/deploy/ipk/all/Packages -p

/home/sundism/oe/out/deploy/ipk/all/Packages -l

/home/sundism/oe/out/deploy/ipk/all/Packages.filelist -m

/home/sundism/oe/out/deploy/ipk/all/

Reading info for package
/home/sundism/oe/out/deploy/ipk/all/update-modules-dbg_1.0-r8_all.ipk 
Traceback (most recent call last):
  File "/home/sundism/oe/out/staging/i686-linux/usr/bin/ipkg-make-index", 
line
114, in <module>
    pkg = ipkg.Package(filename)
  File "/home/sundism/oe/out/staging/i686-linux/usr/bin/ipkg.py", line 161, 
in 
__init__
    tarStream = ar.open("control.tar.gz")
  File "/home/sundism/oe/out/staging/i686-linux/usr/bin/arfile.py", line 59,
in open
    f = self._scan(fname)
  File "/home/sundism/oe/out/staging/i686-linux/usr/bin/arfile.py", line 80,
in
_scan
    size = int(descriptor[5])
ValueError: invalid literal for int() with base 10: '`'

----------------------------
I printed out what descriptor[5] was and it was a "'"  

thanks  for your help
Mike



