Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U3cu1-0000UT-AU for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 02:37:23 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1U3OQd-0000Cl-J0 for openembedded-devel@lists.openembedded.org;
	Thu, 07 Feb 2013 11:10:03 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2013 11:10:03 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2013 11:10:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 07 Feb 2013 11:08:20 +0100
Message-ID: <kevuef$t7s$2@ger.gmane.org>
References: <1360102723-27891-1-git-send-email-schnitzeltony@googlemail.com>
	<1360102723-27891-6-git-send-email-schnitzeltony@googlemail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130107 Thunderbird/17.0.2
In-Reply-To: <1360102723-27891-6-git-send-email-schnitzeltony@googlemail.com>
X-Enigmail-Version: 1.5
Subject: Re: [meta-oe-meta-systemd 5/5] xinput-calibrator: do not RDEPEND xterm
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
X-List-Received-Date: Fri, 08 Feb 2013 01:37:25 -0000
X-List-Received-Date: Fri, 08 Feb 2013 01:37:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 05-02-13 23:18, Andreas Müller schreef:
> This does not break automatic calibration (at first start or plugin of
> new device). For manual recalibration we assume a terminal is installed
> and avoid multiple terminals for most images.

I ran into this a while ago, if you use GNOME, it will use xdg-utils to
launch the terminal, which wasn't installed in my system. I'm not sure where
I'd need to add the xdg-utils RDEPENDS to make it all work properly, any
suggestions?



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRE30UMkyGM64RGpERAqH/AJwOoKZTDX7el9o022dYnnETU5mUKACdFJ0X
HbT3Dk3QSbUzt4AoxskglvQ=
=aBd+
-----END PGP SIGNATURE-----



