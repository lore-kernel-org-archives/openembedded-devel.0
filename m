Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S4qJ8-0006U6-DK for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 10:03:46 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S4qAq-0007bi-OU for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 09:55:12 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 09:55:12 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 09:55:12 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 06 Mar 2012 09:54:57 +0100
Message-ID: <jj4jcv$dnp$1@dough.gmane.org>
References: <1330986957-24272-1-git-send-email-obi@opendreambox.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <1330986957-24272-1-git-send-email-obi@opendreambox.org>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe][PATCH v2] udev: consolekit package requires x11
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
X-List-Received-Date: Tue, 06 Mar 2012 09:03:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 05-03-12 23:35, Andreas Oberritter schreef:
> * consolekit fails to build without x11, so drop the runtime dependency
> on consolekit if x11 is unavailable.
> 
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org> --- v1->v2:
> Instead of removing the package, drop the runtime dependency on
> consolekit.

It's only missing a PR bump now :)

regards,

Koen


> 
> meta-oe/recipes-core/udev/udev_173.bb |    2 +- 
> meta-oe/recipes-core/udev/udev_175.bb |    2 +- 
> meta-oe/recipes-core/udev/udev_181.bb |    2 +- 3 files changed, 3
> insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-core/udev/udev_173.bb
> b/meta-oe/recipes-core/udev/udev_173.bb index e4e634a..a111f11 100644 ---
> a/meta-oe/recipes-core/udev/udev_173.bb +++
> b/meta-oe/recipes-core/udev/udev_173.bb @@ -81,7 +81,7 @@ FILES_${PN} +=
> "/lib/udev*" FILES_${PN}-dbg += "/lib/udev/.debug"
> 
> FILES_${PN}-consolekit += "${libdir}/ConsoleKit" 
> -RDEPENDS_${PN}-consolekit += "consolekit" +RDEPENDS_${PN}-consolekit +=
> "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
> 
> do_install () { install -d ${D}${usrsbindir} \ diff --git
> a/meta-oe/recipes-core/udev/udev_175.bb
> b/meta-oe/recipes-core/udev/udev_175.bb index b6484d9..114dbe9 100644 ---
> a/meta-oe/recipes-core/udev/udev_175.bb +++
> b/meta-oe/recipes-core/udev/udev_175.bb @@ -77,7 +77,7 @@ FILES_${PN} +=
> "/lib/udev*" FILES_${PN}-dbg += "/lib/udev/.debug"
> 
> FILES_${PN}-consolekit += "${libdir}/ConsoleKit" 
> -RDEPENDS_${PN}-consolekit += "consolekit" +RDEPENDS_${PN}-consolekit +=
> "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
> 
> do_install () { install -d ${D}${usrsbindir} \ diff --git
> a/meta-oe/recipes-core/udev/udev_181.bb
> b/meta-oe/recipes-core/udev/udev_181.bb index 1e0a02a..5e27706 100644 ---
> a/meta-oe/recipes-core/udev/udev_181.bb +++
> b/meta-oe/recipes-core/udev/udev_181.bb @@ -73,7 +73,7 @@ FILES_${PN} +=
> "/lib/udev*" FILES_${PN}-dbg += "/lib/udev/.debug"
> 
> FILES_${PN}-consolekit += "${libdir}/ConsoleKit" 
> -RDEPENDS_${PN}-consolekit += "consolekit" +RDEPENDS_${PN}-consolekit +=
> "${@base_contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
> 
> FILES_udev-utils = "${bindir}/udevadm"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk9V0N8ACgkQMkyGM64RGpEd0gCcC49CpgTooJffNtAtfnDqUJhG
AzYAnA3AWyRgf+wGGXvHQeYIGlOjvHWM
=Zt3c
-----END PGP SIGNATURE-----



