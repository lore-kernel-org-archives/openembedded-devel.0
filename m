Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1N8UCC-0005Yw-10
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 08:34:23 +0100
Received: from tamarin.localnet (123-192-145-111.dynamic.kbronet.com.tw
	[123.192.145.111])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 813B51B10C04
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 07:43:53 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2009 08:32:32 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <alpine.LFD.2.00.0911120045170.1265@localhost>
	<alpine.LFD.2.00.0911120125380.1977@localhost>
	<200911120820.08344.holger+oe@freyther.de>
In-Reply-To: <200911120820.08344.holger+oe@freyther.de>
MIME-Version: 1.0
Message-Id: <200911120832.32197.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xterm: either fix it, or remove it. please.
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
X-List-Received-Date: Thu, 12 Nov 2009 07:34:23 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 12 November 2009 08:20:08 Holger Hans Peter Freyther wrote:
> On Thursday 12 November 2009 07:36:32 Robert P. J. Day wrote:
> >   anyway, this is about the fourth time i've explained this, either
> > here or on the angstrom-devel list.  that's the error, and it's
> > entirely reproducible on my f11 system.  at this point, i'm leaving it
> > with the powers that be, and you're free to deal with it or totally
> > ignore it.  whatever suits you.
> 
> Robert,
> 
> I totally agree that bugs should be fixed. Your attitude is somehow weird
>  as you demand others to fix problems you are experiencing. Honestly
>  speaking I am a bit disturbed by this attitude. Work on OE is purely
>  community driven, if something reported is not picked up, it is saddening,
>  but you really can't play the escalation game from the commercial world.
> 
> Did you consider updating xterm from 207 to something more recent, or did
>  you consider taking a newer install script and patch it into 207?
>  Apparently between 207 and 243 (as of ubuntu) there must have been
>  changes.

And diffing sinstall.sh from 207 to 243 one is seeing some interesting
changes... the first is to set the locale to C (good change) and the second
is in changing PROGRAM_MODE.. Maybe you want to test this and then
come up with a patch? I'm happy to review and land it.

z.


-       PROG_MODE=`echo ".$cf_mode" | sed -e 's/^..//' -e 's/rw./7/g' -e 's/r-./5/g' -e 's/--[sxt]/1/g'`
+       PROG_MODE=`echo ".$cf_mode" | sed -e 's/^..//' -e 's/rw./7/g' -e 's/r-./5/g' -e 's/---/0/g' -e 's/--[sxt]/1/g' -e 's/+//g'`


