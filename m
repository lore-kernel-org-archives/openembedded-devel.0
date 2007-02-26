Received: from [192.132.34.13] (helo=amail.unina.it)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <ranaldo@unina.it>) id 1HLdqS-0001XE-03
	for openembedded-devel@openembedded.org; Mon, 26 Feb 2007 12:16:40 +0100
Received: from blaster.unina.it ([192.132.34.15]) (authenticated bits=0)
	by amail.unina.it (8.13.4/8.13.4) with ESMTP id l1QBGcEb017598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 26 Feb 2007 12:16:38 +0100
From: Nicola Ranaldo <ranaldo@unina.it>
To: Paul Sokolovsky <pmiscml@gmail.com>, openembedded-devel@openembedded.org
Date: Mon, 26 Feb 2007 12:15:07 +0100
User-Agent: KMail/1.9.6
References: <200702231326.37015.ranaldo@unina.it>
	<7010259346.20070225203430@gmail.com>
In-Reply-To: <7010259346.20070225203430@gmail.com>
MIME-Version: 1.0
Message-Id: <200702261215.07980.ranaldo@unina.it>
Subject: testing with qemu, was Re: Angstrom and h2200
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
X-List-Received-Date: Mon, 26 Feb 2007 11:16:40 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sunday 25 February 2007 19:34:30 Paul Sokolovsky wrote:
[...]
> > * the last, may i use some kind of emulator before deploying the fs image
> > to the ipaq?
>
>   Yes, QEMU.

I already use it to emulate x86 machines, but i was not able before to find 
the qemu-system-arm command!!! the poky-runqemu documentation seems to be 
complex, to run the test images at 
http://www.angstrom-distribution.org/unstable/images/20070120/qemuarm/  i 
simply used the following command:

qemu-system-arm -M versatilepb -kernel 
zImage-2.6.18-qemuarm-20070120215313.bin -hda 
Angstrom-gpe-image-test-20070120-qemuarm.rootfs.ext2  -append "root=/dev/sda"
When the system asked to calibrate to touchscreen i pressed ESC and gpe 
appeared!
I did not use the file modules-2.6.18-qemuarm.tgz.... is there a reason it's 
there?

thanks

	Nicola Ranaldo


