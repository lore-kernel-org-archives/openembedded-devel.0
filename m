Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 2091F60E23
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jun 2014 06:23:37 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Wri8G-0006Yc-EE for openembedded-devel@lists.openembedded.org;
	Tue, 03 Jun 2014 08:23:36 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jun 2014 08:23:36 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jun 2014 08:23:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 03 Jun 2014 08:23:27 +0200
Message-ID: <lmjpkv$ajq$1@ger.gmane.org>
References: <1401743690-25537-1-git-send-email-eduardo@monkey.io>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
In-Reply-To: <1401743690-25537-1-git-send-email-eduardo@monkey.io>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH] [meta-webserver]: add Monkey HTTP Server.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jun 2014 06:23:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Eduardo Silva schreef op 02-06-14 23:14:
> This patch add the initial recipe for Monkey HTTP Server v1.5.0.
> 
> Signed-off-by: Eduardo Silva <eduardo@monkey.io> --- 
> .../recipes-httpd/monkey/monkey_1.5.0.bb           | 36
> ++++++++++++++++++++++ 1 file changed, 36 insertions(+) create mode
> 100644 meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> 
> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb new file mode
> 100644 index 0000000..25a9530 --- /dev/null +++
> b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb @@ -0,0 +1,36 @@ 
> +SUMMARY = "Fast and Lightweight HTTP Server for Linux" +HOMEPAGE =
> "http://monkey-project.com" +BUGTRACKER =
> "https://github.com/monkey/monkey/issues" + +LICENSE = "Apache-2.0" 
> +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93" + +SECTION = "net" 
> + +SRC_URI =
> "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz" 
> +SRC_URI[md5sum] = "9123fc371334621fde1c060ab17adcd3" +SRC_URI[sha256sum]
> = "f7a5e4839822750930a723f63a4edbf700e0fb8299a4b3637bd8bab5b1d098a7" + 
> +EXTRA_OECONF = " \ +             --plugdir=${libdir}/monkey/ \ +
> --logdir=/var/log/monkey/ \ +             --pidfile=/var/run/monkey.pid
> \ +             --default-user=www-data \ +
> --datadir=/var/www/monkey/ \

/var -> ${localstatedir} ?


> +             --sysconfdir=${sysconfdir}/monkey/ \ +
> --enable-plugins=* \ +             --disable-plugins=polarssl \ +
> --debug \ +             --malloc-libc \ +" + +inherit autotools pkgconfig
> update-rc.d systemd + +INITSCRIPT_NAME = "monkey" +INITSCRIPT_PARAMS =
> "defaults 70" + +SYSTEMD_SERVICE_${PN} = "monkey.service" + +FILES_${PN}
> += "/www" + +CONFFILES_${PN} = "${sysconfdir}/monkey/"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFTjWnfMkyGM64RGpERAleHAJ98+/IM1m1Ddw708zXerzZummo+0QCdH9Yl
t/mM47yqio6yGosSXuuTVBY=
=BunW
-----END PGP SIGNATURE-----


