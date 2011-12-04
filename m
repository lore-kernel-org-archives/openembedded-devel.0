Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RXGTa-0006qp-3T for openembedded-devel@lists.openembedded.org;
	Sun, 04 Dec 2011 19:07:46 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RXGN2-0006uC-W9 for openembedded-devel@lists.openembedded.org;
	Sun, 04 Dec 2011 19:01:01 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Dec 2011 19:01:00 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Dec 2011 19:01:00 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 04 Dec 2011 19:00:43 +0100
Message-ID: <jbgcgc$tmh$1@dough.gmane.org>
References: <jbb875$apq$1@dough.gmane.org>
	<1323015614-1952-1-git-send-email-eric@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1323015614-1952-1-git-send-email-eric@eukrea.com>
X-Enigmail-Version: 1.3.3
Subject: Re: [meta-oe v3] add nostromo webserver
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
X-List-Received-Date: Sun, 04 Dec 2011 18:07:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 04-12-11 17:20, Eric Bénard schreef:

> +pkg_postinst_${PN}_prepend() { +    chown -R www-data:www-data
> ${localstatedir}/nostromo ${localstatedir}/log/nostromo
> ${localstatedir}/run/nostromo +    /etc/init.d/populate-volatile.sh
> update

The chown can be done in during build IIRC, the volation call needs to check
if /etc/init.d/populate-volatile.sh is actually available since it's a
sysvinit ism.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7btUkACgkQMkyGM64RGpGSKwCfcUN5iUmbzX1R7rsGlTMLIIS2
xKIAn0A9PT/UrgCAVRWKokhKh8BnLgHM
=hXmg
-----END PGP SIGNATURE-----



