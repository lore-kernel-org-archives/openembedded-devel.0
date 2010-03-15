Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1NrK6C-0007IO-Ex
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 00:53:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id CC9E9A5054
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 23:50:27 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id ACMJ6LJ-Hafm
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 23:50:25 +0000 (GMT)
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id B4DF0A5013
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 23:50:24 +0000 (GMT)
Received: by xora-desktop.xora.org.uk (Postfix, from userid 500)
	id DE6B325CA1; Mon, 15 Mar 2010 23:51:00 +0000 (GMT)
Date: Mon, 15 Mar 2010 23:51:00 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100315235100.GE2425@xora-desktop.xora.org.uk>
References: <ac9c93b11003141453n7df620c7gca609efe00e0e6f@mail.gmail.com>
	<hnl05u$1r0$1@dough.gmane.org>
	<ac9c93b11003150431k384114e6i11cab70a9d377da9@mail.gmail.com>
	<20100315114313.GB2425@xora-desktop.xora.org.uk>
	<ac9c93b11003150659g3bb78a4dk4feec888b80c97f5@mail.gmail.com>
	<20100315154453.GC2425@xora-desktop.xora.org.uk>
MIME-Version: 1.0
In-Reply-To: <20100315154453.GC2425@xora-desktop.xora.org.uk>
User-Agent: Mutt/1.5.20 (2009-08-17)
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Re; [PATCH 7/8] autoconf: add 2.65
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
X-List-Received-Date: Mon, 15 Mar 2010 23:53:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 15, 2010 at 03:44:53PM +0000, Graeme Gregory wrote:
> On Mon, Mar 15, 2010 at 02:59:21PM +0100, Frans Meulenbroeks wrote:
> > 2010/3/15 Graeme Gregory <dp@xora.org.uk>:
> > > On Mon, Mar 15, 2010 at 12:31:10PM +0100, Frans Meulenbroeks wrote:
> > >> And any help related to getting autoconf up to 2.65 is appreciated.
> > >> I'm not that much an autoconf wiz.
> > >>
> > > There was no wizardry needed to get 2.65 working, I have a build
> > > currently running to test the new version.
> > 
> > Oops.
> > Actually I misworded things. I noticed some recipes not working any
> > more with 2.65 and would like some help to fix this.
> > The most troublesome I had was libpcap. That one generated a configure
> > file that had syntax errors.
> > The other one I ran into was php-native where configure was stuck in
> > an endless loop, with yes eating up 100% CPU time.
> > 
> Well this branch may be of interest to you then :-)
> 
> http://www.xora.org.uk/cgi-bin/cgit.cgi/openembedded/log/?h=xora/autoconf-2.65
> 
And that branch now contains fixes for all php versions we currently have
in OE.

Graeme



