Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NWZbX-0006yR-Lv for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 19:12:06 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NWZZN-0001fL-7i
	for openembedded-devel@lists.openembedded.org;
	Sun, 17 Jan 2010 19:09:49 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 19:09:49 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 19:09:49 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 17 Jan 2010 19:09:28 +0100
Message-ID: <hivjon$vmv$1@ger.gmane.org>
References: <alpine.LFD.2.00.1001171141210.11393@localhost>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <alpine.LFD.2.00.1001171141210.11393@localhost>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
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
X-List-Received-Date: Sun, 17 Jan 2010 18:12:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-01-10 17:47, Robert P. J. Day wrote:
> 
>   given that (on my fedora 12 system, anyway), the gnome-games package
> has been unbuildable for weeks now, i finally threw in the towel,
> removed the reference to it from the beagleboard task, and can now
> build beagleboard-demo-image.
> 
>   that package was the final obstacle to getting a BB-demo-image
> build.  other packages that were failing -- e2fsprogs, mplayer --
> have recently been fixed, leaving gnome-games as the sole remaining
> cause of build grief.
> 
>   a suggestion -- until the issue with gnome-games is resolved, why
> not just remove its inclusion from the bb-demo-image task?  i'm being
> quite serious -- it's obviously not a critical package, and if it's
> the only thing keeping people from building and testing the OE dev
> branch for the beagleboard, take it out so folks can get back to
> testing.
> 
>   it seems counter-productive to allow a single games package to put
> the brakes on an entire build.

And I have yet to reproduce a single build failure with that recipe, and
I build beagleboard-demo-image daily.

It seems counter-productive remove everything that might fail for a
handfull of people. I remember busybox triggering an OOM on Philip's
build machine not too long ago :)

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLU1JYMkyGM64RGpERAn4XAJoCqmAwDzr1fBf0pGW60RXB+NN+OgCgu5bn
FTEb3qMBUBqRwppKqhYm0TY=
=B0Ix
-----END PGP SIGNATURE-----



