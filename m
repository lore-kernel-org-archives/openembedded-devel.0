Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QtLkl-0001co-7N for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 17:40:31 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QtLgI-0001uX-Kl for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 17:35:54 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 17:35:54 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 17:35:54 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 16 Aug 2011 17:35:41 +0200
Message-ID: <j2e2od$g94$1@dough.gmane.org>
References: <cover.1313501855.git.anders@chargestorm.se>
	<b2a661498def56a184f05a3c7cde1528aa1b0e8d.1313501855.git.anders@chargestorm.se>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <b2a661498def56a184f05a3c7cde1528aa1b0e8d.1313501855.git.anders@chargestorm.se>
X-Enigmail-Version: 1.2
Subject: Re: [meta-oe][PATCH 1/1] connman: conditionally enable wifi and bluetooth
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
X-List-Received-Date: Tue, 16 Aug 2011 15:40:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-08-11 15:38, Anders Darander schreef:
> Use DISTRO_FEATURES to conditionally depend and enable wifi and bluetooth.
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se> --- meta-oe/recipes-connectivity/connman/connman.inc   |    7 ++++++- .../recipes-connectivity/connman/connman_0.76.bb   |    4 ++-- 2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-connectivity/connman/connman.inc b/meta-oe/recipes-connectivity/connman/connman.inc index 2652125..284edd2 100644 --- a/meta-oe/recipes-connectivity/connman/connman.inc +++ b/meta-oe/recipes-connectivity/connman/connman.inc @@ -14,7 +14,12 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \ file://src/main.c;beginline=1;endline=20;md5=4b55b550fa6b33cc2055ef30dd262b3e"
> 
> # we need to define the depends here, the dynamic stuff is too late -DEPENDS  = "wpa-supplicant dbus glib-2.0 ppp busybox dhcp resolvconf bluez4 iptables gnutls ntp" +BLUEZDEPENDS = "bluez4" +WIFIDEPENDS = "wpa-supplicant" +DEPENDS  = "dbus glib-2.0 ppp busybox dhcp resolvconf iptables gnutls ntp
> \ +            ${@base_contains('DISTRO_FEATURES', 'bluetooth','${BLUEZDEPENDS}', '', d)} \ +            ${@base_contains('DISTRO_FEATURES', 'wifi','${WIFIDEPENDS}', '', d)} \

Are those helper vars really needed?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOSo5NMkyGM64RGpERAjb6AJ9pUdvD2Ida/gShyst/YrVgUfvflwCgkz3y
afoEW11A6q6GHXyJJer6NfM=
=OXpK
-----END PGP SIGNATURE-----



