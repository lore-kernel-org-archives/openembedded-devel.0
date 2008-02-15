Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <rpurdie@rpsys.net>) id 1JQAAa-0002O4-Mc
	for openembedded-devel@openembedded.org; Sat, 16 Feb 2008 00:40:53 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1FNeKYQ011172;
	Fri, 15 Feb 2008 23:40:20 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10791-09; Fri, 15 Feb 2008 23:40:16 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m1FNeERC011166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 15 Feb 2008 23:40:14 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Paul Sokolovsky <pmiscml@gmail.com>,
	openembedded-devel <openembedded-devel@openembedded.org>
Date: Fri, 15 Feb 2008 23:40:16 +0000
Message-Id: <1203118816.8636.164.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: initramfs generation with OE
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
X-List-Received-Date: Fri, 15 Feb 2008 23:40:53 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

So if recursive bitbake isn't an option (its not), how do we generate an
initramfs with OE? I've had a think about this and I have an idea. Its
totally untested but its also neat and simple so here goes.

We don't actually care if we generate a normal kernel as a side effect
and Pauls code already does this. Its even really close to whats needed,
it just misses some task dependency magic. My untested solution would
be:

"""

INITRAMFS_SYMLINK_NAME ?= "initramfs-${MACHINE}"
INITRAMFS_IMAGE_TARGET ?= "initramfs-image"

do_builtin_initramfs() {
       unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
       cp "${DEPLOY_DIR_IMAME}/${INITRAMFS_SYMLINK_NAME}" usr/initramfs_data.cpio.gz
       oe_runmake ${KERNEL_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
       install -d ${DEPLOY_DIR_IMAGE}
       install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}-initramfs.bin
       # Make sure to kill injected initramfs, in case someone will do "-c compile -f"
       rm usr/initramfs_data.cpio.gz
}
addtask builtin_initramfs after do_deploy before do_build
do_builtin_initramfs[nostamp] = "1"
do_builtin_initramfs[depends] = "${INITRAMFS_IMAGE_TARGET}:do_rootfs"

"""

of which the last line is the magic key. From that, bitbake should be
able to handle the rest. In addition to this you need to add something
to initramfs-image that:

* symlinks from ${DEPLOY_DIR_IMAME}/${INITRAMFS_SYMLINK_NAME} to the initramfs image
* makes sure IMAGE_FSTYPES has cpio.gz in it

Also note that task should move to a separate .bbclass since it is now
added before do_build and not everything will want to build this.
Alternatively, we can drop the "before do_build" bit and mean users
manually run:

bitbake kernel -c builtin_initramfs

Anyhow, this is something we can discuss and find a way forward with if
the basic idea works.

So to summarise what should happen, the kernel will compile and build as
normal. It should then trigger the do_rootfs task in
INITRAMFS_IMAGE_TARGET to run. Once that has run, the builtin_initramfs
task should run.

Bitbake should be clever enough to work out that the package tasks need
to run before the image is generated and all the dependencies should
fall into place. One potential problem is if anything in the image
generation has a recursive dependency on do_build in which case it will
break. I don't see any reason an image should have that dependency (meta
tasks and toolchains do) but I haven't tested anything.

If this doesn't work for any reason I will do what I can to fix it. Note
that I'm not around tomorrow and whilst I may find time on Sunday, I
can't guarantee it so it may be Monday before I can look at any
problems. Please bear with me on that.

Cheers,

Richard




