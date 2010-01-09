Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NTitY-0003lC-Hw for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 22:30:55 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NTirW-0008KX-2S
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Jan 2010 22:28:46 +0100
Received: from p5b3b1d48.dip.t-dialin.net ([91.59.29.72])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2010 22:28:46 +0100
Received: from no2spam by p5b3b1d48.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Jan 2010 22:28:46 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sat, 09 Jan 2010 22:28:23 +0100
Message-ID: <hiasdn$j8g$1@ger.gmane.org>
References: <1262640317.3767.6.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b1d48.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <1262640317.3767.6.camel@gnutoo-desktop>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: ro/rw boot order
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
X-List-Received-Date: Sat, 09 Jan 2010 21:30:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

GNUtoo wrote:
> and in angstrom /etc/rcS.d there is:
> S03udev
> S10checkroot
> 
> And when booting it freeze unless you change udev/checkroot order or put
> rw to the kernel command line.

Oh, I just realized you already asked the question I sent just 5 minutes
ago ;-)

Take a look at bugs 5090 and 5246.  We should come up with a proper
solution.  Let's hope Denys finds some time soon.



