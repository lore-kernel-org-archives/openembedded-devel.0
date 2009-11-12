Received: from [212.124.40.25] (helo=mail.huber-online.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jm@huber-online.com>) id 1N8cBP-0004R3-7N
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 17:06:06 +0100
Received: from 192.168.11.6 ([213.23.61.90]:2958)
	by mail.wiessoft.de ([192.168.62.2]:25) with [XMail 1.25 ESMTP Server]
	id <SC1BA5A> for <openembedded-devel@lists.openembedded.org> from
	<jm@huber-online.com>; Thu, 12 Nov 2009 16:59:23 +0100
From: "Johannes Maier" <jm@huber-online.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2009 16:06:03 +0000
Priority: normal
X-Priority: 3 (Normal)
Importance: normal
X-Mailer: DvISE by Tobit Software, Germany (0250.444B484C494747504A4B),
	Mime Converter 101.20
X-David-Sym: 0
X-David-Flags: 33554432
Message-ID: <DIIE.00000513001877B9@192.168.11.6>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 212.124.40.25
X-SA-Exim-Mail-From: jm@huber-online.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re-2: question meta-toolchain on x86_64 for armv5te
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
X-List-Received-Date: Thu, 12 Nov 2009 16:06:06 -0000
Content-Type: text/plain;
 charset="us-ascii"
Content-Transfer-Encoding: 7Bit

-------- Original Message --------
Subject: Re: [oe] question meta-toolchain on x86_64 for armv5te (11-Nov-2009 2:52)
From:    Holger Hans Peter Freyther <holger=oe@freyther.de>
To:      jm@huber-online.com

> On Tuesday 10 November 2009 17:03:06 Johannes Maier wrote:
> > Hi@all,
> > 
> > I'm new to openembedded and I didn't find any answers to my questions so I
> >  hope to find here some help.
> > 
> > I get an error while building the meta-toolchain on x86_64 for armv5te.
> > 
> > So I wanted to ask if it is in general better to use a 32bit system for
> >  such tasks since I don't get any error there?
> 
> This is not 32 vs 64 bits... more likely if fortify is enabled during 
> compile.. The error looks like something I had fixed... so what are you 
> building, using which OE revision?
> 
> z.
> 

Just for your information:

I did some further testing now.
- My environment is Kubuntu 9.10 64bit.
- OE version stable/2009 branch
- AFAIK 
    BUILD_CPPFLAGS += "-Wno-format-security -U_FORTIFY_SOURCE"
  is necessary since (K)ubuntu 8.10, so I use it in bitbake.conf
Of course you were right, it's not 32 vs 64 bits. But it's a matter of the new (K)ubuntu 9.10. Sorry for the disturbance and thanks for your hint.
The issue is already fixed in the dev branch but not in the stable branch. For those that want to use the 9.10 version with the stable branch can use the gdb-6.8-fix-compile-karmic.patch in the dev branch.

Thanks,
majo


> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel




