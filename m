Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1NG5iX-0007VQ-E3
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Dec 2009 08:03:12 +0100
Received: from tamarin.localnet (unknown [122.181.150.106])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 41B5C1B10C03
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Dec 2009 07:14:09 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 3 Dec 2009 08:01:20 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.31; KDE/4.3.2; i686; ; )
References: <200912021919.06663.marcin@juszkiewicz.com.pl>
	<200912030631.57262.holger+oe@freyther.de>
In-Reply-To: <200912030631.57262.holger+oe@freyther.de>
MIME-Version: 1.0
Message-Id: <200912030801.20540.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 78.46.147.237
X-SA-Exim-Mail-From: holger+oe@freyther.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SVN fetcher fix for SRCREV=AUTOREV situations
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
X-List-Received-Date: Thu, 03 Dec 2009 07:03:13 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 03 December 2009 06:31:57 Holger Hans Peter Freyther wrote:

> that sucks... we are doomed now. If the above directory is deleted in trunk
> the -r option will not work to download a old rev...


Stefan just highlighted the above might sound rude. What I tried to say is 
that IIRC I changed the code to use @rev for the case of downloading a 
revision where the directory is not in trunk with the current HEAD...

I don't think we can decide when to use -r and when to use @.. this is why I 
say we are doomed. The best thing I can think of right now is to try @ and 
then to go with -r... :(

love
	z.


