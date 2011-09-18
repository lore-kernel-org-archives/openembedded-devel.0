Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R5IuH-0000sb-Jf for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 17:03:45 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R5IpE-0007yq-Ga for openembedded-devel@lists.openembedded.org;
	Sun, 18 Sep 2011 16:58:32 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 16:58:32 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Sep 2011 16:58:32 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 18 Sep 2011 16:58:20 +0200
Message-ID: <j550uc$4s1$1@dough.gmane.org>
References: <201109181647.20828.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <201109181647.20828.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-oe] xserver: default xorg.conf
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
X-List-Received-Date: Sun, 18 Sep 2011 15:03:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 18-09-11 16:47, Andreas Müller schreef:
> Hi,
> 
> the last image for overo failed starting X. I checked xorg.conf and saw
> that ther was intel driver selected - hmm.
> 
> So I copied manually the removerd xorg.conf which belongs to overo from
> the patch
> 
> commit 44c7cdefee88e22532dcc1269d3c148a20899b6a Author: Martin Jansa
> <Martin.Jansa@gmail.com> Date:   Wed Sep 7 15:21:38 2011 +0200
> 
> xserver-xorg: drop 1.9.4 and git version
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> and everything works fine.
> 
> Now my question: Where is the intended place (where exactly in BSP) to
> put xorg.conf now?

If you use angstrom + meta-ti you will get a working xorg.conf for omap3:

http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/commit/?id=f99ad0105b79186972415a4782b2be5cb869c939
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOdgcMMkyGM64RGpERAqGZAJ4qmS/54Ang6egCgKhlLEOH4PcC9wCgrk67
Iqz7GQDss+1sxwJFVKkSOtg=
=Tffb
-----END PGP SIGNATURE-----



