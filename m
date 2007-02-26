Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HLn2O-0007Gr-E0
	for openembedded-devel@openembedded.org; Mon, 26 Feb 2007 22:05:36 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1QL5aPZ024593
	for <openembedded-devel@openembedded.org>; Mon, 26 Feb 2007 21:05:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23458-09 for <openembedded-devel@openembedded.org>;
	Mon, 26 Feb 2007 21:05:32 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l1QL5UJI024585
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 26 Feb 2007 21:05:30 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <45E2CC8E.5040505@4g-systems.com>
References: <200702231326.37015.ranaldo@unina.it>
	<7010259346.20070225203430@gmail.com>
	<200702261215.07980.ranaldo@unina.it>
	<45E2CC8E.5040505@4g-systems.com>
Date: Mon, 26 Feb 2007 21:05:31 +0000
Message-Id: <1172523931.24429.6.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: testing with qemu, was Re: Angstrom and h2200
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
X-List-Received-Date: Mon, 26 Feb 2007 21:05:37 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-02-26 at 13:03 +0100, Patrick Fischer wrote: 
> Nicola Ranaldo wrote:
> > I already use it to emulate x86 machines, but i was not able before to find 
> > the qemu-system-arm command!!! the poky-runqemu documentation seems to be 
> > complex, to run the test images at 
> > http://www.angstrom-distribution.org/unstable/images/20070120/qemuarm/  i 
> > simply used the following command:
> >
> > qemu-system-arm -M versatilepb -kernel 
> > zImage-2.6.18-qemuarm-20070120215313.bin -hda 
> > Angstrom-gpe-image-test-20070120-qemuarm.rootfs.ext2  -append "root=/dev/sda"
> > When the system asked to calibrate to touchscreen i pressed ESC and gpe 
> > appeared!
> >
> This is my test script for qemu

> ./testqemu.sh tmp/deploy/images/bzImage-qemux86.bin tmp/deploy/images/bootstrap-image-qemux86-20070112211142.rootfs.ext2.gz

Lets reinvent the wheel too...

This should work just the same as 
poky-runqemu tmp/deploy/images/bzImage-qemux86.bin tmp/deploy/images/bootstrap-image-qemux86-20070112211142.rootfs.ext2

(except the same command works with qemuarm and several zaurus images if
you have the right qemu)

Note you have to use an ext2 image, not a gzipped one but my setup
generates ext2 files, not ext2.gz ones...

> > I did not use the file modules-2.6.18-qemuarm.tgz.... is there a 
> > reason it's there?

Anyone developing a kernel finds it useful, otherwise just ignore it. 

Regards,

Richard



