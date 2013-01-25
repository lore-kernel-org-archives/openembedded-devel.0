Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TylH9-0003QA-OC for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 16:33:13 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Tyl2L-0006Xc-PW for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 16:17:49 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 16:17:49 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 16:17:49 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 25 Jan 2013 16:17:23 +0100
Message-ID: <kdu7lv$778$1@ger.gmane.org>
References: <1359126167-30599-1-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
In-Reply-To: <1359126167-30599-1-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.4.6
Subject: Re: [PATCH][meta-systemd] meta-systemd: remove wpa-supplicant bbappend
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
X-List-Received-Date: Fri, 25 Jan 2013 15:33:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 25-01-13 16:02, Martin Jansa schreef:
> * oe-core now has wpa-supplicant 2.0, but also installs
> wpa_supplicant.service to PN * feel free to add new bbappend with only
> systemd inherit and updated SYSTEMD_PACKAGES

FWIW, wpa-supplicant shouldn't be started by init, but by the
networkmanagement app.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFRAqIDMkyGM64RGpERApZWAJ9XaUKTR3ez4xoTcXhu4TpoYo4XJgCfYN9X
wVAnjGYh7q9HZvHbwsa1EUg=
=W0Vu
-----END PGP SIGNATURE-----



