Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qyjqk-0007sO-Ot for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 14:24:58 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qyjm2-0003Vg-G3 for openembedded-devel@lists.openembedded.org;
	Wed, 31 Aug 2011 14:20:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 14:20:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2011 14:20:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 31 Aug 2011 14:19:28 +0200
Message-ID: <j3l8sg$kr3$2@dough.gmane.org>
References: <1314792055-26719-1-git-send-email-anders@chargestorm.se>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
In-Reply-To: <1314792055-26719-1-git-send-email-anders@chargestorm.se>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-oe][PATCH v2] connman: fix typo with -test package
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
X-List-Received-Date: Wed, 31 Aug 2011 12:24:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 31-08-11 14:00, Anders Darander schreef:
> The typo prohibited the connman-tests package from being populated.
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se> --- V2: Bumping PR, as the packaged contents of connman differs.
> 
> meta-oe/recipes-connectivity/connman/connman.inc |    3 ++- 1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-oe/recipes-connectivity/connman/connman.inc b/meta-oe/recipes-connectivity/connman/connman.inc index eeccf50..45916d2 100644 --- a/meta-oe/recipes-connectivity/connman/connman.inc +++ b/meta-oe/recipes-connectivity/connman/connman.inc @@ -18,6 +18,7 @@ DEPENDS  = "dbus
> glib-2.0 ppp busybox dhcp resolvconf iptables gnutls ntp \ ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \ ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \ " +PR = "1"

That should go into the .bb, not the .inc


> EXTRA_OECONF += "\ ac_cv_path_WPASUPPLICANT=/usr/sbin/wpa_supplicant \ @@ -72,7 +73,7 @@ PACKAGES_DYNAMIC = "${PN}-plugin-*" PACKAGES =+ "${PN}-scripts ${PN}-tools ${PN}-tests"
> 
> FILES_${PN}-tools = "${bindir}/wispr" -FILES_${PN{-tests = "${bindir}/*-test" +FILES_${PN}-tests = "${bindir}/*-test" FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \ ${sysconfdir} ${sharedstatedir} ${localstatedir} \ ${base_bindir}/* ${base_sbindir}/*
> ${base_libdir}/*.so* ${datadir}/${PN} \

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOXibQMkyGM64RGpERApteAJ4r2A4z7Pd3nQUwreRj+UyJiSzriACgmi22
ndTJSNjpvW2BWxdsK+QJDYA=
=/Ivi
-----END PGP SIGNATURE-----



