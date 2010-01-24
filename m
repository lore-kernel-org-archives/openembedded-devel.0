Received: from mta1.brinkster.com ([65.182.109.70])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1NZ7Jw-0001nG-NR
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 19:36:28 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta1.brinkster.com (Postfix) with ESMTP id 1BB4B380A86
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 13:26:49 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
Received: from mta1.brinkster.com ([127.0.0.1])
	by localhost (mta1.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sb7hduyVKMns
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 13:26:44 -0500 (EST)
Received: from MareImbrium (unknown [82.46.19.72])
	by mta1.brinkster.com (Postfix) with ESMTP id 7A0F3380C67
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 13:26:43 -0500 (EST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <201001241235.23795.holger+oe@freyther.de>	<hjhfid$tqo$1@ger.gmane.org>	<4B5C6D35.1030002@nospam.arcornews.de>	<hjhs7a$3oc$1@ger.gmane.org>
	<hjhssf$55g$1@ger.gmane.org>
In-Reply-To: <hjhssf$55g$1@ger.gmane.org>
Date: Sun, 24 Jan 2010 18:26:33 -0000
Message-ID: <01a901ca9d22$c508d620$4f1a8260$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-index: AcqdE2xGF5U/v4fURM6UR2mF5d0t5AADwAzw
X-SA-Exim-Connect-IP: 65.182.109.70
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
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
X-List-Received-Date: Sun, 24 Jan 2010 18:36:28 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Rolf,

Replying to your mail on-list.

As the author of said patch if people want it reverted go ahead. It has my
ACK.

> Koen Kooi wrote:
> > On 24-01-10 12:35, Holger Hans Peter Freyther wrote:
> >> Can anyone ack the revert please?
> >
> > The commit says:
> >
> > Note: Another (maybe better) fix would be to package up docbook-xsl
> but
> > that is overkill for these two recipes.
> 
> To introduce something new that patch breaks something for somebody
> else
> that was previously working.  I thought it was commonly accepted that
> it's then the author's (and possibly the committer's) responsibility to
> come up with something better to fix this regression.
> 
> > Wouldn't that be a better option than introducing a regression?
> 
> The regression was introduced with the patch.  Not by reverting it.
> 
> A revert gets my ACK if this bothers Holger enough in his workflow.  I
> would suggest Holger and David-John should talk about a time-frame in
> which David-John can cook up a proper patch.  Based on this information
> a decision should be made if a revert is necessary in the meantime or
> not.  I trust Holger's judgment here.
> 
> 
> PS: David-John, the whole discussion is at
> http://thread.gmane.org/gmane.comp.handhelds.openembedded/29524

As I stated in the original patch the correct fix is to sort out the
docbook-xsl packages but that was not something I had any intention at the
time to tackle (limited OE dev time and a seemingly infinite TODO list). I
may be able to look at it in the near future but as for being the best man
for the job, that I am not so sure about.

The sole reason for the patch was to fix a build failure on systems where
the host system docbook-xsl stuff was not available (or desired). 

Reverting the -nonet will reintroduce dependencies on components being
installed on the host system outside OE but if that is fine then go for the
revert. I understood (at the time, this is back in October) that depending
on host items outside oe's -native was a 'very bad thing' (tm) ;). Maybe
worse than requiring an internet connection but I am not the person to judge
that. 

I'll leave it to core OE devs to decide what is the lesser of 2 evils in
this case.

Regards,

John




