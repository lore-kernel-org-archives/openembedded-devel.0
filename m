Received: from [128.2.201.16] (helo=jackfruit.srv.cs.cmu.edu)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dhuggins@cs.cmu.edu>) id 1LprOf-0005I3-06
	for openembedded-devel@openembedded.org; Fri, 03 Apr 2009 23:58:00 +0200
Received: from [128.2.222.132] (LIMA-2.SPEECH.CS.CMU.EDU [128.2.222.132])
	by jackfruit.srv.cs.cmu.edu (8.13.6/8.13.6) with ESMTP id
	n33KitcJ014009 for <openembedded-devel@lists.openembedded.org>;
	Fri, 3 Apr 2009 16:44:55 -0400 (EDT)
Message-ID: <49D67549.7040001@cs.cmu.edu>
Date: Fri, 03 Apr 2009 16:44:57 -0400
From: David Huggins-Daines <dhuggins@cs.cmu.edu>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
X-Scanned-By: mimedefang-cmuscs on 128.2.201.16
X-SA-Exim-Connect-IP: 128.2.201.16
X-SA-Exim-Mail-From: dhuggins@cs.cmu.edu
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	RDNS_NONE autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: /linuxrc link to /bin/busybox causes booting to fail (sysvinit should be used instead)
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
X-List-Received-Date: Fri, 03 Apr 2009 21:58:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

When booting base-image or minimal-image from a ramdisk, I get errors 
like the following:

RAMDISK: Compressed image found at block 0
VFS: Mounted root (ext2 filesystem) on device 1:0.
init started: BusyBox v1.13.2 (2009-04-03 15:54:42 EDT)
Bad inittab entry at line 5
can't open /dev/si: No such file or directory
can't open /dev/~~: No such file or directory
can't open /dev/l0: No such file or directory
can't open /dev/l1: No such file or directory
can't open /dev/l2: No such file or directory
can't open /dev/l3: No such file or directory
can't open /dev/l4: No such file or directory
can't open /dev/l5: No such file or directory
can't open /dev/l6: No such file or directory
can't open /dev/z6: No such file or directory
can't open /dev/S: No such file or directory
process '/sbin/sulogin' (pid 167) exited. Scheduling for restart.
process '/sbin/getty 57600 ttyAM0' (pid 168) exited. Scheduling for restart.

This is because, even though /sbin/init points to /sbin/init.sysvinit, 
there is also a /linuxrc -> /bin/busybox link, which the kernel uses in 
preference, causing busybox to run as 'init'.  The problem is that  
busybox init uses a different syntax from sysvinit.

I think this problem might have started when inittab support was added 
to busybox...

Is there a good reason for that /linuxrc link?  And if not, where is it 
coming from, so that I can remove it?

Thanks!


