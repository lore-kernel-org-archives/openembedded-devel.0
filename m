Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RgbOl-00059L-QY for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 13:17:23 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RgbHl-0004UH-DU for openembedded-devel@lists.openembedded.org;
	Fri, 30 Dec 2011 13:10:09 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 13:10:09 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2011 13:10:09 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 30 Dec 2011 13:09:57 +0100
Message-ID: <jdk9ml$cdj$1@dough.gmane.org>
References: <cover.1325091927.git.otavio@ossystems.com.br>
	<2eaa23a3419bfd9b5aea6c1f059242a38eb03608.1325091927.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <2eaa23a3419bfd9b5aea6c1f059242a38eb03608.1325091927.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.3.4
Subject: Re: [meta-oe][PATCH 1/1] xserver-nodm-init: move systemd service to xserver-nodm-init-systemd
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
X-List-Received-Date: Fri, 30 Dec 2011 12:17:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 28-12-11 18:05, Otavio Salvador schreef:
> Move systemd service to xserver-nodm-init-systemd to be consistent with
> other packages.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

I'm not going to merge such patches unless a reasonable effort has been made
to tasks/images using the packages in question.
The breakage caused by patches like this is too subtle to notice immediately
since doing $packagemanager upgrade will now silently remove the startup
units. Similar breakage when using tasks, building images, etc.

And I have the holidays off, so most patches need to wait till the second
week of january.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk79qhEACgkQMkyGM64RGpFG7QCgl9RP++hD+eLwBlCGXZJrwTX0
xCoAoKST/4Og6nMRBFkXBd+LIKVbyhZ2
=jiKc
-----END PGP SIGNATURE-----



