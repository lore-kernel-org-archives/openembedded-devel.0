Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <jeesmann@gmx.de>) id 1NWJZh-0006jn-2T
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 02:05:08 +0100
Received: (qmail invoked by alias); 17 Jan 2010 01:02:51 -0000
Received: from p5DE7827F.dip.t-dialin.net (EHLO [192.168.2.100])
	[93.231.130.127]
	by mail.gmx.net (mp047) with SMTP; 17 Jan 2010 02:02:51 +0100
X-Authenticated: #55411201
X-Provags-ID: V01U2FsdGVkX19XGMdXFpVXoOTTUE8nqyKLM+i+ZknWWDx4A33Gm6
	/IMe9fWyP5Z8mI
From: Joerg Eesmann <jeesmann@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1263057308.6614.7.camel@fred.uchi.de>
References: <1262986639.11887.8.camel@fred.uchi.de>
	<20100108223915.GA29981@gmail.com>
	<1263057308.6614.7.camel@fred.uchi.de>
Date: Sun, 17 Jan 2010 02:02:50 +0100
Message-Id: <1263690170.10477.7.camel@fred.uchi.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Y-GMX-Trusted: 0
X-FuHaFi: 0.55000000000000004
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
X-List-Received-Date: Sun, 17 Jan 2010 01:05:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi all,
with your help I came to the point, where I could remotely set
breakpoints. I added "--disable-pie" to EXTRA_OECONF.
Now it should work, but the only way, I can set breakpoints is with
function names.
In the executable I find in the workdir of bluez (bluetoothd), I do not
see the filenames. Right now, I am using Codelite as frontend for gdb,
and codelite only can set breakpoints like filename:line (I guess like
every other frontend).
Is there a way to have an executable with all the debug information in?
Or am I wrong here, and I just did not get the right configuration?
(with filename:line I tried only filename, full path, relative path to
Make-Dir, but nothing worked)
thank you for your help,
best regards
Joerg Eesmann


On Sat, 2010-01-09 at 18:15 +0100, Joerg Eesmann wrote:
> Hi again,
> sometimes one can`t see the obvious, but thanks for help.
> I connected gdb remote. But I got following message:
> 
> warning: The current binary is a PIE (Position Independent Executable),
> which
> GDB does NOT currently support.  Most debugger features will fail if
> used
> in this session.
> 
> Reading symbols
> from /home/joerg/prj/OpenMoko/shr/shr-build/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/bluez4-4.59-r5.0/bluez-4.59/src/.libs/bluetoothd...done.
> (gdb) target remote 192.168.0.202:3333
> Remote debugging using 192.168.0.202:3333
> warning: Unable to find dynamic linker breakpoint function.
> GDB will be unable to debug shared library initializers
> and track explicitly loaded dynamic code.
> 
> and I cannot set breakpoints or whatever.
> I thought, gdb 7.0 is supporting PIE.
> Is there any possibility to compile bluez4 not as PIE, would it work?
> While googeling, I found some patches for gdb, which may help.
> Any ideas?
> 
> (by the way, is there a usable graphical frontend for gdb for this case:
> remote-debugging wit cross gdb)?
> I only managed to get it running (until the message) textbased.
> 
> Thank you for supporting me,
> best regards,
> Joerg
> 
> 
> On Fri, 2010-01-08 at 14:39 -0800, Khem Raj wrote:
> > On (08/01/10 22:37), Joerg Eesmann wrote:
> > > Hi there,
> > > I am trying to remote debug my Openmoko freerunner.
> > > I already installed succesfully gdbserver, and can attach it to the
> > > progem I am going to debug.
> > > The question is, what to do on host side?
> > > I bitbaked gdb-cross-sdk, I bitbaked my changed package (bluez4)
> > > So I will install a debug version of the package, and attach to the
> > > bluetoothd-demon.
> > > On host side, I guessed I needed a gdb, that can handle ARM-processor,
> > > therefore gdb-cross-sdk.
> > > Now I should have everything... but a few questions left.
> > > GDB ist only ipk-package, what to do with this?
> > 
> > you need gdb-cross once you build that you should be able to use it
> > from same place as cross gcc.
> > 
> > > Where do I find the arm-compiler bluetoothd on my host (I guess in work,
> > > but will this be the strippded version or not, because also stripped
> > > package has been made).
> > > Am I on the right way? Is there any howto or something like that
> > > availlable, where you could point me?
> > > 
> > 
> > if you build it then the non stripped version should be there in 
> > your workdir (where the package was built)
> > 
> > -Khem
> > > thank you for your help in advance,
> > > best regards,
> > > Joerg
> > > 
> > > 
> > > 
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



