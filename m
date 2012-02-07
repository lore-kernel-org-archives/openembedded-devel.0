Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RunTR-0007jb-MA for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 17:00:53 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RunLe-0000v0-0Q for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:52:50 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 16:52:50 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 16:52:50 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 07 Feb 2012 16:52:37 +0100
Message-ID: <jgrhc8$r0l$1@dough.gmane.org>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe][RFC 00/27] systemd / initmanager rework
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
X-List-Received-Date: Tue, 07 Feb 2012 16:00:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 07-02-12 16:12, Andreas Müller schreef:
> The RFC series is intended to
> 
> * reduce efforts/pitfalls when implementing native systemd support *
> enable a global configuration for selecting of systemd/syvinit (sysvinit 
> needs further efforts)
> 
> The whole series' can be found at (branches 'systemd' meta-oe:
> git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded-systemd.git 
> meta-angstrom:
> git://gitorious.org/schnitzeltony-oe-meta/meta-angstrom-systemd.git
> 
> Notes: * These are my first python experiences - suggestions welcome. *
> In local.conf (or in distro) the configuration variable INIT_MANAGER
> selects the initmanager to be build into an image. When changing the
> selection, a build from scratch is required. INIT_MANAGER currently
> defaults to systemd (see image.bbclass and initmanager.bbclass)

NAK! The initmanager decision is up the image, not the distro. The distro
can use blacklist.bbclass to blacklist the initmanagers it doesn't support
if needed.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk8xSMMACgkQMkyGM64RGpGDXwCdEcF3nvp+R1KdPAP1ohy5UBHD
CQgAoJUS0t+iaLza+HA7Ckd9xQbZrI4N
=so2j
-----END PGP SIGNATURE-----



