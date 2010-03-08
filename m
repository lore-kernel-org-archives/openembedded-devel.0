Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NoWBn-0002Fb-Mh
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Mar 2010 07:11:40 +0100
Received: from tamarin.localnet (123-192-181-204.dynamic.kbronet.com.tw
	[123.192.181.204])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 3C2601B10C02
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Mar 2010 06:11:09 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 8 Mar 2010 07:08:11 +0100
User-Agent: KMail/1.13.1 (Linux/2.6.33-rc8; KDE/4.4.1; i686; ; )
References: <4B926E27.4090100@mwester.net> <1267888240.11175.32.camel@rex>
In-Reply-To: <1267888240.11175.32.camel@rex>
MIME-Version: 1.0
Message-Id: <201003080708.11546.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Encouraging distros to use newer recipe versions?
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
X-List-Received-Date: Mon, 08 Mar 2010 06:11:40 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Saturday 06 March 2010 16:10:40 Richard Purdie wrote:

> > I have no patches to do such a thing, and neither do I have time to
> > create such a thing at this point in time, but perhaps if someone
> > thinks this is worthwhile time can be made for it...
> 
> I've been keeping half an eye on what Holger has been doing and yes, I
> think this could be desirable. Its also rather straightforward to do.
> Simply create a new variable


Such a class does make sense but is only fixing 50% of the issue. E.g. when we 
look at "gpdf" there are two things.

1.) The distro builder should be informed that building gpdf is bad in regard 
to known security issues. So he might decide to throw it out of the feed.

2.) A user using the distro has the (discontinued) package still installed and 
he will not notice that his latest gpdf is "bad". Distribution makers will 
also need a way to announce such things to their users. I have wondered if we 
could create a ipk with RCONFLICTS on discontinued software or such.


z.


