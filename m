Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Se7sF-0003Pe-03 for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jun 2012 18:53:51 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Se7i1-0003kd-BE for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jun 2012 18:43:17 +0200
Received: from adsl-68-88-77-36.dsl.rcsntx.swbell.net ([68.88.77.36])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2012 18:43:17 +0200
Received: from koen by adsl-68-88-77-36.dsl.rcsntx.swbell.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jun 2012 18:43:17 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 11 Jun 2012 11:43:05 -0500
Message-ID: <jr576n$tsp$1@dough.gmane.org>
References: <cover.1339428767.git.otavio@ossystems.com.br>
	<5c52e769ac49b8f283659530cf3d959c2280db48.1339428767.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: adsl-68-88-77-36.dsl.rcsntx.swbell.net
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <5c52e769ac49b8f283659530cf3d959c2280db48.1339428767.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH][meta-oe 1/3] owfs: add init script for owfs
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
X-List-Received-Date: Mon, 11 Jun 2012 16:53:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 11-06-12 10:34, Otavio Salvador schreef:
> owfs has the capability of use an FUSE based service and it seems logical
> to init it during system boot; this adds the required init script for
> it.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br> --- 
> meta-oe/recipes-extended/owfs/owfs/owfs      |   59
> ++++++++++++++++++++++++++ meta-oe/recipes-extended/owfs/owfs_2.8p15.bb |
> 9 +++- 2 files changed, 65 insertions(+), 3 deletions(-) create mode
> 100755 meta-oe/recipes-extended/owfs/owfs/owfs
> 
> diff --git a/meta-oe/recipes-extended/owfs/owfs/owfs
> b/meta-oe/recipes-extended/owfs/owfs/owfs new file mode 100755 index
> 0000000..766bbbb --- /dev/null +++
> b/meta-oe/recipes-extended/owfs/owfs/owfs

That's missing LSB headers

> @@ -0,0 +1,59 @@ +#!/bin/sh + +PATH=/sbin:/bin:/usr/bin + +DAEMON="owfs" 
> + +test -f /usr/bin/${DAEMON} || exit 0 + +if test -f
> /etc/default/${DAEMON} ; then +. /etc/default/${DAEMON} +else +: +fi + 
> +if [ "$START_OWFS" != "yes" ] +then +	exit 0 +fi + +startdaemon(){ +
> echo -n "Starting ${DAEMON}: " +	start-stop-daemon --start -x
> /usr/bin/${DAEMON} --  ${CMDLINE} --pid_file /var/run/${DAEMON}.pid +
> echo "done" +} + +stopdaemon(){ +	echo -n "Stopping ${DAEMON}: " +
> start-stop-daemon --stop -p /var/run/${DAEMON}.pid +        echo "done" 
> +} + + + +case "$1" in +  start) +	startdaemon +	;; +  stop) +
> stopdaemon +	;; +  force-reload) +	stopdaemon +	startdaemon +	;; +
> restart) +	stopdaemon +	startdaemon +	;; +  reload) +	stopdaemon +
> startdaemon +	;; +  *) +	echo "Usage: ${DAEMON} { start | stop | restart
> | reload }" >&2 +	exit 1 +	;; +esac + +exit 0 diff --git
> a/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb
> b/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb index d7c5040..2a00276
> 100644 --- a/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb +++
> b/meta-oe/recipes-extended/owfs/owfs_2.8p15.bb @@ -8,9 +8,10 @@
> LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f
> \
> 
> DEPENDS = "fuse virtual/libusb0"
> 
> -PR = "r1" +PR = "r2"
> 
> SRC_URI = "${SOURCEFORGE_MIRROR}/owfs/owfs-${PV}.tar.gz \ +
> file://owfs \ file://owhttpd \ file://owserver " SRC_URI[md5sum] =
> "24ec3d04ded1b199831f03e70d9e2f1f" @@ -36,6 +37,7 @@ EXTRA_OECONF = " \ 
> do_install_prepend() { install -d ${D}${sysconfdir}/default/ install -d
> ${D}${sysconfdir}/init.d/ +        install -m 0755 ${WORKDIR}/owfs
> ${D}${sysconfdir}/init.d/owfs install -m 0755 ${WORKDIR}/owhttpd
> ${D}${sysconfdir}/init.d/owhttpd install -m 0755 ${WORKDIR}/owserver
> ${D}${sysconfdir}/init.d/owserver } @@ -64,9 +66,10 @@ FILES_libowcapi =
> "${libdir}/libowcapi-*" FILES_libow = "${libdir}/libow-*" FILES_libownet
> = "${libdir}/libownet-*"
> 
> -INITSCRIPT_PACKAGES = "owhttpd owserver" +INITSCRIPT_PACKAGES = "owfs
> owhttpd owserver" +INITSCRIPT_NAME_owfs = "owfs" INITSCRIPT_NAME_owserver
> = "owserver" INITSCRIPT_NAME_owhttpd = "owhttpd" +INITSCRIPT_PARAMS_owfs
> = "defaults 20" INITSCRIPT_PARAMS_owserver = "defaults 20" 
> INITSCRIPT_PARAMS_owhttpd = "defaults 21" -

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iQIcBAEBAgAGBQJP1iAZAAoJEHZqAkdh1vT6qXIP/AwH21dzOYgZaJbC2u5QYTXb
1VCPiExoEP/1EriZ9B3O4RCPSBB/J7Ejc/VZzLw3GdN8KC2QxLWJqTHbMRN7R648
sBtCPBhBgKi6M7DCHs4auHzbM/tK7PBq5zlUy9wmDrzt47aOe0i/x7HM7/L3760M
CjGkSYbErkXfRug3VVRs/Z0yK0LYbbnbzaQ759iH5hX1N/bPKbTQpYUloeZRrL1I
BEzWuqxNCbgzIkODyqghT8rH+yFgWA3GjhJsVLraiO3C+WbYYwlr6SR8zVrZuPWX
385+ekY90ZP3YT6V6u+VeRgB93RfhWLYpyIoX+c1DN1nF2nOoDGbGS47TaOpohru
Bc52j6tslpDBxQ91JbUhp/RusdI5AVSnzm/veElo0YSvx+7Rz279lV8aDnrld4u2
8bvQ/O2nTd5VcfwEEn3vr1K+Q358qP0CRpWdP9t7VBpSLuq8CWqO07lEagUuxlez
HdSJ+M98mH+DCGk1OTZew7jZ2oUBiK4Kjk2QFTKP+sKSeHV9e2w8cgRwtiA4tTA6
mVThCL2Pw2qALDCV2h0Mgu7mtypwD9ELTQpKtq6TbvLS1Ne84fdtFF63Uoh9XFIc
khYJ2NIv5v1pcKCN9l9oYXLRVmgDy5Rx6JsuEC19Zmh5TYdCwMyedgnWgHQptO9u
xJdl9/oLrHBzi1cZTzcS
=sfm4
-----END PGP SIGNATURE-----



