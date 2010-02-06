Received: from qmta14.westchester.pa.mail.comcast.net ([76.96.59.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pspreadborough@comcast.net>) id 1NdnVl-0006bu-7N
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Feb 2010 17:28:00 +0100
Received: from omta15.westchester.pa.mail.comcast.net ([76.96.62.87])
	by qmta14.westchester.pa.mail.comcast.net with comcast
	id ecuA1d0091swQuc5EgQRJC; Sat, 06 Feb 2010 16:24:25 +0000
Received: from sz0154.wc.mail.comcast.net ([76.96.58.220])
	by omta15.westchester.pa.mail.comcast.net with comcast
	id egRl1d0024l5d103bgRluG; Sat, 06 Feb 2010 16:25:45 +0000
Date: Sat, 6 Feb 2010 16:24:25 +0000 (UTC)
From: pspreadborough@comcast.net
To: openembedded-devel@lists.openembedded.org
Message-ID: <1845727150.568251265473465526.JavaMail.root@sz0154a.westchester.pa.mail.comcast.net>
In-Reply-To: <1265464878.5019.25.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
X-Originating-IP: [76.24.64.15]
X-Mailer: Zimbra 5.0.19_GA_3172.RHEL5_64 (ZimbraWebClient - FF3.0
	(Linux)/5.0.19_GA_3177.RHEL5_64)
X-SA-Exim-Connect-IP: 76.96.59.212
X-SA-Exim-Mail-From: pspreadborough@comcast.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: EABI pain and frustration!
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
X-List-Received-Date: Sat, 06 Feb 2010 16:28:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


----- "Phil Blundell" <philb@gnu.org> wrote: 
> On Fri, 2010-02-05 at 14:43 -0600, Travis Stratman wrote: 
> > >From my understanding of this issue he has an OABI rootfs and is trying 
> > to run an EABI executable on top of it. This just doesn't work period 
> > AFAIK; the kernel can boot either OABI or EABI with the compatibility 
> > flags config'd in, but all of the binaries on the filesystem must match. 
> 
> I don't think this is strictly true: there shouldn't be any particular 
> reason why OABI and EABI binaries couldn't coexist on the same 
> filesystem. Of course, you would need to have both sets of runtimes 
> installed (ld.so and libc at a mininum, plus whatever other libraries 
> are needed by your apps) so this would not be completely trivial to 
> arrange, but I can't think of anything that would impose a hard 
> requirement for everything on the system to be using the same ABI. 

I used a statically linked executable in order to avoid having to install 
the support binaries. 

Pete 


