Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NY7b7-0007fR-Kw
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 01:42:04 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o0M0ZPM8018808 for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 00:35:26 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id FHcqAgOUCWF9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 00:35:25 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o0M0ZL0j018801
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2010 00:35:22 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1264119214.7697.73.camel@utx.utx.cz>
References: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>
	<201001211102.11252.holger+oe@freyther.de>
	<883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>
	<hj9giu$mfp$1@ger.gmane.org> <1264111223.7697.31.camel@utx.utx.cz>
	<hjan00$419$1@ger.gmane.org>  <1264119214.7697.73.camel@utx.utx.cz>
Date: Fri, 22 Jan 2010 00:40:25 +0000
Message-Id: <1264120825.29044.73.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
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
X-List-Received-Date: Fri, 22 Jan 2010 00:42:04 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2010-01-22 at 01:13 +0100, Stanislav Brabec wrote:
> Rolf Leggewie wrote:
> > funny thing.  I was discussing something like this with RP just when you
> > sent this mail.  It's not as straightforward as it may sound, though.
> > First of all, I think we'd need several, possibly unlimited number of
> > FFA branches.  Second, RP and I agreed that security implications are a
> > concern if we allow commit access completely uninhibited.
> 
> Security in world of open source is is always based on web of trust.
[...]
> Watching this would probably require professional team subscribed to
> vendor-sec, and backporting fixes to stable branches.

Lets live in the real world here. Allowing what amounts to anonymous
access to an account on the server is not what I'd call sensible. No, OE
isn't perfect about security fixes but thats totally unrelated to
whether we'd like the main server to be secure.

Yes, there are ways of restricting access to the commands anonymous
access could run but we don't have a full time team of admins looking
after it and I don't like the idea of painting a target on the machine.

I would be perfectly happy to see a repo that anyone can request access
to and maintain branches in of their patches. This would make it easier
to review and for devs to pull from. If an enterprising person starts
collating patches and does a good job they stand a good chance of
getting .dev access - the subsystem maintainer model of the Linux kernel
works well.

There is a new gitosis replacement available that allows branch level
access control and I'd like us to start using it.

Cheers,

Richard



