Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <jeesmann@gmx.de>) id 1NTewA-0007VP-F4
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 18:17:21 +0100
Received: (qmail invoked by alias); 09 Jan 2010 17:15:11 -0000
Received: from unknown (EHLO [192.168.2.100]) [93.231.162.8]
	by mail.gmx.net (mp007) with SMTP; 09 Jan 2010 18:15:11 +0100
X-Authenticated: #55411201
X-Provags-ID: V01U2FsdGVkX19j3PNnSiljbC4i5SxqDFeX14VxWe3LRMQNeAkCG4
	ZeVjoNccAkwy0f
From: Joerg Eesmann <jeesmann@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20100108223915.GA29981@gmail.com>
References: <1262986639.11887.8.camel@fred.uchi.de>
	<20100108223915.GA29981@gmail.com>
Date: Sat, 09 Jan 2010 18:15:08 +0100
Message-Id: <1263057308.6614.7.camel@fred.uchi.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.57
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: jeesmann@gmx.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Remote Debugging
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
X-List-Received-Date: Sat, 09 Jan 2010 17:17:21 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi again,
sometimes one can`t see the obvious, but thanks for help.
I connected gdb remote. But I got following message:

warning: The current binary is a PIE (Position Independent Executable),
which
GDB does NOT currently support.  Most debugger features will fail if
used
in this session.

Reading symbols
from /home/joerg/prj/OpenMoko/shr/shr-build/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/bluez4-4.59-r5.0/bluez-4.59/src/.libs/bluetoothd...done.
(gdb) target remote 192.168.0.202:3333
Remote debugging using 192.168.0.202:3333
warning: Unable to find dynamic linker breakpoint function.
GDB will be unable to debug shared library initializers
and track explicitly loaded dynamic code.

and I cannot set breakpoints or whatever.
I thought, gdb 7.0 is supporting PIE.
Is there any possibility to compile bluez4 not as PIE, would it work?
While googeling, I found some patches for gdb, which may help.
Any ideas?

(by the way, is there a usable graphical frontend for gdb for this case:
remote-debugging wit cross gdb)?
I only managed to get it running (until the message) textbased.

Thank you for supporting me,
best regards,
Joerg


On Fri, 2010-01-08 at 14:39 -0800, Khem Raj wrote:
> On (08/01/10 22:37), Joerg Eesmann wrote:
> > Hi there,
> > I am trying to remote debug my Openmoko freerunner.
> > I already installed succesfully gdbserver, and can attach it to the
> > progem I am going to debug.
> > The question is, what to do on host side?
> > I bitbaked gdb-cross-sdk, I bitbaked my changed package (bluez4)
> > So I will install a debug version of the package, and attach to the
> > bluetoothd-demon.
> > On host side, I guessed I needed a gdb, that can handle ARM-processor,
> > therefore gdb-cross-sdk.
> > Now I should have everything... but a few questions left.
> > GDB ist only ipk-package, what to do with this?
> 
> you need gdb-cross once you build that you should be able to use it
> from same place as cross gcc.
> 
> > Where do I find the arm-compiler bluetoothd on my host (I guess in work,
> > but will this be the strippded version or not, because also stripped
> > package has been made).
> > Am I on the right way? Is there any howto or something like that
> > availlable, where you could point me?
> > 
> 
> if you build it then the non stripped version should be there in 
> your workdir (where the package was built)
> 
> -Khem
> > thank you for your help in advance,
> > best regards,
> > Joerg
> > 
> > 
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



