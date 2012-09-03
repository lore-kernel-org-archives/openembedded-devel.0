Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T8Q0S-0003XJ-9P for openembedded-devel@lists.openembedded.org;
	Mon, 03 Sep 2012 08:19:32 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T8PoX-0007bC-6g for openembedded-devel@lists.openembedded.org;
	Mon, 03 Sep 2012 08:07:13 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Sep 2012 08:07:13 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Sep 2012 08:07:13 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 03 Sep 2012 08:06:59 +0200
Message-ID: <k21he4$npr$1@ger.gmane.org>
References: <1346633420-10990-1-git-send-email-joe.macdonald@windriver.com>
	<1346633420-10990-2-git-send-email-joe.macdonald@windriver.com>
	<1346633420-10990-3-git-send-email-joe.macdonald@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <1346633420-10990-3-git-send-email-joe.macdonald@windriver.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe][PATCH 2/2] meta-networking: stylize dnsmasq recipe
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
X-List-Received-Date: Mon, 03 Sep 2012 06:19:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 03-09-12 02:50, Joe MacDonald schreef:
> Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com> --- 
> .../recipes-daemons/dnsmasq/dnsmasq-dbus_2.55.bb           | 10
> +++++----- meta-networking/recipes-daemons/dnsmasq/dnsmasq.inc        |
> 14 +++++++------- meta-networking/recipes-daemons/dnsmasq/dnsmasq_2.55.bb
> |  3 ++- 3 files changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/meta-networking/recipes-daemons/dnsmasq/dnsmasq-dbus_2.55.bb
> b/meta-networking/recipes-daemons/dnsmasq/dnsmasq-dbus_2.55.bb index
> 896952d..5c4500f 100644 ---
> a/meta-networking/recipes-daemons/dnsmasq/dnsmasq-dbus_2.55.bb +++
> b/meta-networking/recipes-daemons/dnsmasq/dnsmasq-dbus_2.55.bb @@ -1,13
> +1,13 @@ # dnsmasq with support for DBus interface - -require
> dnsmasq_${PV}.bb +DEPENDS = "dbus"
> 
> S = "${WORKDIR}/dnsmasq-${PV}"
> 
> -DEPENDS = "dbus" EXTRA_OEMAKE = "COPTS=-DHAVE_DBUS"
> 
> do_install_append () { -        install -d
> ${D}${sysconfdir}/dbus-1/system.d -        install -m 644
> dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/ +    install -d
> ${D}${sysconfdir}/dbus-1/system.d +    install -m 644 dbus/dnsmasq.conf
> ${D}${sysconfdir}/dbus-1/system.d/ } + +require dnsmasq_${PV}.bb

The require should remain on top by the looks of it

> diff --git a/meta-networking/recipes-daemons/dnsmasq/dnsmasq.inc
> b/meta-networking/recipes-daemons/dnsmasq/dnsmasq.inc index
> e994852..3c87abf 100644 ---
> a/meta-networking/recipes-daemons/dnsmasq/dnsmasq.inc +++
> b/meta-networking/recipes-daemons/dnsmasq/dnsmasq.inc @@ -17,13 +17,13 @@
> INITSCRIPT_NAME = "dnsmasq" INITSCRIPT_PARAMS = "defaults"
> 
> do_install () { -        oe_runmake "PREFIX=${D}${prefix}" \ -
> "BINDIR=${D}${bindir}" \ -                   "MANDIR=${D}${mandir}" \ -
> install -        install -d ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d
> ${D}${sysconfdir}/dnsmasq.d -        install -m 644
> ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/ -        install -m 755
> ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq +    oe_runmake
> "PREFIX=${D}${prefix}" \ +               "BINDIR=${D}${bindir}" \ +
> "MANDIR=${D}${mandir}" \ +               install +    install -d
> ${D}${sysconfdir}/ ${D}${sysconfdir}/init.d ${D}${sysconfdir}/dnsmasq.d +
> install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/ +    install -m
> 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq }
> 
> CONFFILES_${PN} = "${sysconfdir}/dnsmasq.conf" diff --git
> a/meta-networking/recipes-daemons/dnsmasq/dnsmasq_2.55.bb
> b/meta-networking/recipes-daemons/dnsmasq/dnsmasq_2.55.bb index
> 5f87704..e98f61c 100644 ---
> a/meta-networking/recipes-daemons/dnsmasq/dnsmasq_2.55.bb +++
> b/meta-networking/recipes-daemons/dnsmasq/dnsmasq_2.55.bb @@ -1,4 +1,5
> @@ -require dnsmasq.inc
> 
> SRC_URI[dnsmasq-2.55.md5sum] = "b093d7c6bc7f97ae6fd35d048529232a" 
> SRC_URI[dnsmasq-2.55.sha256sum] =
> "cf63ecf5977f00474cbda98376a9d8743500a82fd98e13f43d7037bce9f9f929" + 
> +require dnsmasq.inc
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQREkDMkyGM64RGpERAlR8AKC4IFFZEdpWSKGRXgSmXbIkALNU0QCePCWY
Es2gc0ph/ZPH/Kqcmg7syrM=
=EbfW
-----END PGP SIGNATURE-----



