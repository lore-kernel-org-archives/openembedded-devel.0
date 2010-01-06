Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NSe6L-0007KQ-CQ for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 23:11:40 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NSe4L-0008KB-Da
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 23:09:33 +0100
Received: from p5b3b2a17.dip.t-dialin.net ([91.59.42.23])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2010 23:09:33 +0100
Received: from no2spam by p5b3b2a17.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2010 23:09:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Wed, 06 Jan 2010 23:09:10 +0100
Message-ID: <hi31m7$hc3$1@ger.gmane.org>
References: <201001060507.31754.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b2a17.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <201001060507.31754.holger+oe@freyther.de>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: QA Goals for OpenEmbedded
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
X-List-Received-Date: Wed, 06 Jan 2010 22:11:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> 	*) Does bitbake world work? If not it would be cool if someone could take
>             a look?

I was hoping for bitbake world to work as a QA tool.  But my efforts on
the world target didn't really receive a warm welcome.  By now world is
so utterly broken that bitbake won't even ever start to execute any
tasks (I killed bitbake after two days when it still did nothing the
last time I tried).

Unfortunately, currently there is no consensus in OE that
"MACHINE=$machine bitbake $bb" shouldn't arbitrarily fail somewhere.
Right now, OE does not have the tools in place to specify that for
example $bb1 does not compile for $machineA (some people are very
allergic to COMPATIBLE_MACHINE for no particular reason).  Bitbake can't
do versioned depends and so we can't say that $bb2-$version does not
compile with gcc less than 3.4.x, for example.  Those are just two
examples.  XorA "solved" this in a hackish way with angsstrom.bbclass.



