Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NZ4pr-0001Tf-Ka for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 16:57:14 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NZ4nb-0002zL-Qb
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 16:54:51 +0100
Received: from p5b3b1abd.dip.t-dialin.net ([91.59.26.189])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 16:54:51 +0100
Received: from no2spam by p5b3b1abd.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 16:54:51 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sun, 24 Jan 2010 16:54:29 +0100
Message-ID: <4B5C6D35.1030002@nospam.arcornews.de>
References: <201001241235.23795.holger+oe@freyther.de>
	<hjhfid$tqo$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5b3b1abd.dip.t-dialin.net
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
In-Reply-To: <hjhfid$tqo$1@ger.gmane.org>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Request to revert latest devicekit patch
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
X-List-Received-Date: Sun, 24 Jan 2010 15:57:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 24-01-10 12:35, Holger Hans Peter Freyther wrote:
>> Can anyone ack the revert please?
> 
> The commit says:
> 
> Note: Another (maybe better) fix would be to package up docbook-xsl but
> that is overkill for these two recipes.

To introduce something new that patch breaks something for somebody else
that was previously working.  I thought it was commonly accepted that
it's then the author's (and possibly the committer's) responsibility to
come up with something better to fix this regression.

> Wouldn't that be a better option than introducing a regression?

The regression was introduced with the patch.  Not by reverting it.

A revert gets my ACK if this bothers Holger enough in his workflow.  I
would suggest Holger and David-John should talk about a time-frame in
which David-John can cook up a proper patch.  Based on this information
a decision should be made if a revert is necessary in the meantime or
not.  I trust Holger's judgment here.


PS: David-John, the whole discussion is at
http://thread.gmane.org/gmane.comp.handhelds.openembedded/29524



