Received: from [85.37.17.112] (helo=smtp-out112.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <GNUtoo@no-log.org>) id 1Lesq6-0007VG-Aw
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Mar 2009 16:16:54 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out112.alice.it
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 4 Mar 2009 16:12:46 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 4 Mar 2009 16:12:40 +0100
Received: from [192.168.1.107] ([79.44.163.114]) by FBCMCL01B06.fbc.local with
	Microsoft SMTPSVC(6.0.3790.3959); Wed, 4 Mar 2009 16:12:40 +0100
From: GNUtoo <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1234542101.3592.46.camel@mill.internal.reciva.com>
References: <200902131525.34787.openembedded@haerwu.biz>
	<1234542101.3592.46.camel@mill.internal.reciva.com>
Date: Tue, 03 Mar 2009 18:02:33 +0100
Message-Id: <1236099753.10359.25.camel@port4>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.4 
X-OriginalArrivalTime: 04 Mar 2009 15:12:40.0430 (UTC)
	FILETIME=[A90640E0:01C99CDB]
Subject: Re: Machine config generator (FOSDEM idea)
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
X-List-Received-Date: Wed, 04 Mar 2009 15:16:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2009-02-13 at 16:21 +0000, Phil Blundell wrote:
> On Fri, 2009-02-13 at 15:25 +0100, Marcin Juszkiewicz wrote:
> > OE developers usually know that machine config is simple but tell that 
> > to Joe Random who only knows that his board use s3c2443 etc. So idea was 
> > to create simple few steps wizard which will ask few questions and 
> > produce machine config as result. More work would be required on 
> > creating kernel recipe because kernel can be from svn/cvs/git or tarball 
> > + quilt patchset etc...
> 
> This seems like it's really a documentation problem.  It's hard to see
> that the wizard would be able to perform any useful, non-trivial
> processing of its own: it'd basically just be taking the information
> from the user and regurgitating it in a slightly different format.
> 
> If users are finding it hard to figure out how to create a machine
> description then the right answer is probably a wiki page or a chapter
> in the manual that explains in small words how to do it.
Sorry for bumping this old thread but I just remembered that I didn't
respond to this thread yet
Maybe most of the machine that can be added already run some sort of
GNU/Linux,with another toolchain/build environment  such as the vendor
provided toolchain/build environment.
So an easy solution for the user would be to make some shell script that
would run on the device and gather all necessary data.
But there may be some problem such as:
*what if there is no tune file for the CPU
*I had the case[1] where a 2.6.10 kernel was given,but no omap-2.6.10
kernel could be found and it had to be diffed against a full 2.6.10
kernel...not very efficient(specially for porting the driver to a more
recent omap kernel)
*The developers may want to exploit the full capabilities of the machine
that are only available with proprietary distributions,and/or to stay
close to the original distribution:
That can happen if the device is a consumer product and has proprietary
things in userland...for Instance I have a pma430 that has a modified
qtopia that gives you the tv-out feature(at least that's what I remember
of what I was told).That implies a custom distribution with an external
toolchain.

[1] The device was an Archos 605 and I would have added it in oe if I
had bought it(unlockable version) but I didn't because It had to be
unlocked by the developers themselves(they don't want to spread the
unlocker because they want to stay in good therm with Archos(They know
people working at Archos) ),which is complicated for me because I have
to send the unit to a developer.
The fact that it had a 2.6.10 kernel also stopped me from buying
it(2.6.10=>no arm-eabi)




