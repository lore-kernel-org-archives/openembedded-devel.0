Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SFUZZ-0006WL-O5 for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2012 20:04:45 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SFUQi-0006Kx-LI for openembedded-devel@lists.openembedded.org;
	Wed, 04 Apr 2012 19:55:36 +0200
Received: from 50-1-53-18.dedicated.static.sonic.net ([50.1.53.18])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2012 19:55:36 +0200
Received: from koen by 50-1-53-18.dedicated.static.sonic.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2012 19:55:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 04 Apr 2012 10:55:26 -0700
Message-ID: <jli1uf$7nt$1@dough.gmane.org>
References: <20120404091720.4b743c5b@eb-e6520>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 50-1-53-18.dedicated.static.sonic.net
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
In-Reply-To: <20120404091720.4b743c5b@eb-e6520>
X-Enigmail-Version: 1.4
Subject: Re: build meta-oe without systemd
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
X-List-Received-Date: Wed, 04 Apr 2012 18:04:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 04-04-12 00:17, Eric Bénard schreef:
> Hi,
> 
> would that make sense to support systemd as a DISTRO_FEATURES ? That
> would make builds using older udev (< 174) possible with meta-oe as this
> actually fails because of systemd.

We talked about this during the yocto bsp summit this week and I'm working
on a patchset to send as RFC later this month (post 1.2 release):

commit b98d45b1bc2d9cf9ba41629240e6c21f19ddceff
Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Apr 3 14:13:59 2012 -0700

    meta-systemd: move over systemd from meta-oe

    Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

commit 59c57bd73d1f157dfada233df889852fdb4a692f
Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Apr 3 14:12:42 2012 -0700

    meta-systemd: create layer

    Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJPfIsKAAoJEHZqAkdh1vT6Xq0QALgix1tbsk+pl9hmjHus9ZQr
OgFmzRO3158a7yMeTJiwwG4fZ1nUWXt/xxAtUqJeDykRUDPPIxf47dPfe+z07iiL
Y5T3ZFulCCtmNnvxZXDzoN+ksp0adKF2CSvp/1azinJQyau//iKGRpJIlINa1DA/
aHUclT70E81lGMuKoL6Corsc1I4d9eCd+K1SFi+ZCcRW0DN3VjpXzHShmovpx6CS
MwFydTZHmNjrYRxRMmCs8Ifn9mlA6APWF4+aukQOwafm0wVGSW4K197VpSmeIPqb
ODO+C7+MxcVOOatCYHzJ+QsQ9oc7aBKmPA+9moCj3BkiFV/X58xLMLm/SomvsekY
LE00WcDyGwa5aBJRW4rVX/o8hQHv4rAv2703MHhbteYOGo0M70IDd7AA602GQDCY
QvVjycuTww2ciHAYxrOublWkPZJijfuq4iRi1Qrx4YdUv4esFWKklz7GgS789oEN
/MLraT2ICmIH2STwc7bMiTzq2AYwxE2/WSMQZ6K378SiftQ36SgkotMxGA7GSyVS
r8eWr5s4l9TU0vVxObYys1zJ8LbtqKgNnn+N753BTenQ7ypzYnx3Uh3ifN244TGd
FHLwaYWSAHxkNni2yuwNkBBLLjPlsJo+//vNuee4TtzE0IJOl0lRDVyY8haiC5Re
IxuJvhNxkY5GW+C/R1u/
=2Mdp
-----END PGP SIGNATURE-----



