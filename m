Received: from ns.penguin.cz ([84.21.108.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1NY7An-00078v-1S
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 01:14:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id C8EE1140973E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 01:15:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at ns.penguin.cz
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (ns.penguin.cz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TSW07VS71GJX
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 01:15:00 +0100 (CET)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 97CA11409732
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 01:15:00 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hjan00$419$1@ger.gmane.org>
References: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<201001211102.11252.holger+oe@freyther.de>
	<883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>
	<hj9giu$mfp$1@ger.gmane.org> <1264111223.7697.31.camel@utx.utx.cz>
	<hjan00$419$1@ger.gmane.org>
Date: Fri, 22 Jan 2010 01:13:34 +0100
Message-Id: <1264119214.7697.73.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.0 
X-SA-Exim-Connect-IP: 84.21.108.25
X-SA-Exim-Mail-From: utx@penguin.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Getting patches committed
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
X-List-Received-Date: Fri, 22 Jan 2010 00:14:52 -0000
Content-Type: text/plain; charset="ISO-8859-2"
Content-Transfer-Encoding: 7bit

Rolf Leggewie wrote:
> Stanislav Brabec wrote:
> > org.openembedded.open (or .staging or .public)
> 
> funny thing.  I was discussing something like this with RP just when you
> sent this mail.  It's not as straightforward as it may sound, though.
> First of all, I think we'd need several, possibly unlimited number of
> FFA branches.  Second, RP and I agreed that security implications are a
> concern if we allow commit access completely uninhibited.

Security in world of open source is is always based on web of trust.

If any enterprise OE customer wants, it's possible to introduce digital
signatures of recipes including digital signatures of checksums and all
referred sources, classes etc.

Then anybody can create virtual team of trusted people and ignore
unsigned recipes.

But this alone does not prevent use of hacked upstream tarballs or
malicious software.

Well, and OE probably has vulnerable software.

For example CVE-2008-1372 was present in bzip2 for more than a year:
Full disclosure date: 10/17/2008
Fixed in OE: 01/10/2010

Watching this would probably require professional team subscribed to
vendor-sec, and backporting fixes to stable branches.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



