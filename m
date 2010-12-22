Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PVK2w-0002Ic-TR for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 09:27:42 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PVK2n-0002X1-0u for openembedded-devel@lists.openembedded.org;
	Wed, 22 Dec 2010 09:27:33 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 09:27:33 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Dec 2010 09:27:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 22 Dec 2010 09:27:19 +0100
Message-ID: <iescp7$keo$1@dough.gmane.org>
References: <20101208053240.GD3186@jama>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.15) Gecko/20101031 Shredder/3.0.11pre
In-Reply-To: <20101208053240.GD3186@jama>
X-Enigmail-Version: 1.0.1
Subject: Re: glib-2.0_2.26.1 missing dependency on dbus
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
X-List-Received-Date: Wed, 22 Dec 2010 08:27:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-12-10 06:32, Martin Jansa wrote:
> Hi,
> 
> simply adding it to depends create circular dependency
> 
> bitbake@jama ~/dev/recipes $ grep glib dbus/dbus.inc 
> DEPENDS = "expat glib-2.0 virtual/libintl libsm libice virtual/libx11"
> 
> dbus needs glib it only for dbus-viewer and builds ok without glib, so
> I've removed glib-2.0 in dbus and added dbus to glib-2.0_2.26.1 and 
> tried again...
> 
> These are usually caused by circular dependencies and any circular 
> dependency chains found will be printed below. Increase the debug 
> level to see a list of unbuildable tasks.
> 
> It didn't detect it.. so I had to find it manually:
> bitbake@jama ~/dev/recipes $ grep glib dbus/dbus.inc
> DEPENDS = "expat glib-2.0 virtual/libintl libsm libice virtual/libx11"
> 
> bitbake@jama ~/dev/recipes $ grep util-linux-ng xorg-lib/libsm_1.2.0.bb
> DEPENDS += "libice xproto xtrans util-linux-ng"
> bitbake@jama ~/dev/recipes $ grep udev util-linux-ng/util-linux-ng.inc
> DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} udev  zlib ncurses virtual/libintl"
> bitbake@jama ~/dev/recipes $ grep glib udev/udev_151.bb
> # Needed for udev-extras
> DEPENDS = "gperf-native usbutils acl glib-2.0"
> 
> util-linux-ng seems to build fine without udev but is there better place
> to break this curcular dependency?

If util-linux-ng builds without udev nowadays, we should remove it. IIRC
I only added it to fix a build error.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNEbZmMkyGM64RGpERAqQDAJ0WFzv9Iqr2Hzb6aWqOwpZusCEk8wCcDlz8
u0D1MLe1T2dj3ptxHpRlxp4=
=GQ+U
-----END PGP SIGNATURE-----



