Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RORqY-0007yE-J6 for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 11:27:02 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RORkV-0000LB-HD for openembedded-devel@lists.openembedded.org;
	Thu, 10 Nov 2011 11:20:47 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 11:20:47 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Nov 2011 11:20:47 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 10 Nov 2011 11:20:34 +0100
Message-ID: <j9g8hi$43b$1@dough.gmane.org>
References: <201111092321.33622.schnitzeltony@gmx.de>
	<20111110074717.GC3933@ad.chargestorm.se>
	<2977361.KIYvSC26hZ@helios>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <2977361.KIYvSC26hZ@helios>
X-Enigmail-Version: 1.3.2
Subject: Re: systemd packages -> image
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
X-List-Received-Date: Thu, 10 Nov 2011 10:27:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 10-11-11 10:47, Paul Eggleton schreef:
> On Thursday 10 November 2011 08:47:17 Anders Darander wrote:
>> * Andreas Müller <schnitzeltony@gmx.de> [111109 23:17]:
>>> Imagine a recipe is included into an image by a task and later gets 
>>> systemd- native support. How about forcing the packages in
>>> SYSTEMD_PACKAGES packed into images in case
>>> 
>>> IMAGE_INIT_MANAGER  = "systemd"
>>> 
>>> is found in the image definition?
>> 
>> Sure, that sounds like a nice idea. Although, in that case, SysV-init 
>> files should probably also be packaged in separate packages and be 
>> installed in a similar manner.
> 
> Why are we going to such an effort to provide both sysvinit and systemd
> in the same distro? Why not make it a distro policy decision? This would
> save a huge amount of work.

So I can start sending patches to add the systemd files to ${PN} in oe-core
recipes now? That's the big hold up: lack of vision from the OE-core folks.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOu6VyMkyGM64RGpERAsQzAKCiZU39orO0DUQ7sUw6y5Dk/pbk9ACggabc
BcceXFVsVOS2GqnFvC2KbZ4=
=MYbw
-----END PGP SIGNATURE-----



