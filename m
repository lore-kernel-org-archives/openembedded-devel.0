Received: from mta5.brinkster.com ([65.182.109.74])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1NWa0s-0003eO-Kk
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 19:38:18 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta5.brinkster.com (Postfix) with ESMTP id 1FBEA2C03E1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 13:27:59 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
Received: from mta5.brinkster.com ([127.0.0.1])
	by localhost (mta5.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YehRYAiuPdkU
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 13:27:53 -0500 (EST)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta5.brinkster.com (Postfix) with ESMTP id 0A5BF2C02D6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 13:27:52 -0500 (EST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <alpine.LFD.2.00.1001171141210.11393@localhost>
	<hivjon$vmv$1@ger.gmane.org>
In-Reply-To: <hivjon$vmv$1@ger.gmane.org>
Date: Sun, 17 Jan 2010 18:27:33 -0000
Message-ID: <009501ca97a2$bd9bc940$38d35bc0$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcqXoGnaiUP+4XDdSMOCJsSvKb3lJgAAQ8/Q
X-SA-Exim-Connect-IP: 65.182.109.74
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: beagleboard-demo-image, and the evil that is "gnome-games"
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
X-List-Received-Date: Sun, 17 Jan 2010 18:38:18 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

> >   that package was the final obstacle to getting a BB-demo-image
> > build.  other packages that were failing -- e2fsprogs, mplayer --
> > have recently been fixed, leaving gnome-games as the sole remaining
> > cause of build grief.
> >
> >   a suggestion -- until the issue with gnome-games is resolved, why
> > not just remove its inclusion from the bb-demo-image task?  i'm being
> > quite serious -- it's obviously not a critical package, and if it's
> > the only thing keeping people from building and testing the OE dev
> > branch for the beagleboard, take it out so folks can get back to
> > testing.

Just to chip in on this,

I build 3 or 4 images daily that feature gnome-games (inc. bb-demo) on
several build hosts (ok, none are Fedora based, mostly DEB based setups). 

Can't say I have had any build issues with gnome-games on any of those
setups (gnome-system-tools is my nemesis today and that's no in bb-demo
;-)).

I personally don't favour taking packages out of an image if there are build
issues on a small subset of systems. I think Phil (or someone else) suggest
you consider contributing your build logs to OESTATS/TinderBox
(http://wiki.openembedded.net/index.php/How_do_I_send_automatic_success_and_
failure_reports) at least with that setup you leave a reference the failing
logs in bug reports/mails so people can have a look into all the gory
details :).

Cheers,

John





