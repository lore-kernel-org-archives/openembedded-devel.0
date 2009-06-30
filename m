Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MLhYR-0002ue-BW
	for openembedded-devel@openembedded.org; Tue, 30 Jun 2009 19:55:39 +0200
Received: (qmail 18352 invoked from network); 30 Jun 2009 17:43:48 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 30 Jun 2009 10:43:48 -0700
Date: Tue, 30 Jun 2009 10:43:47 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090630174347.GL23935@smtp.west.cox.net>
References: <1246379925-1377-1-git-send-email-k.kooi@student.utwente.nl>
MIME-Version: 1.0
In-Reply-To: <1246379925-1377-1-git-send-email-k.kooi@student.utwente.nl>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [STABLE][PATCH] lirc: update to 0.8.5
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
X-List-Received-Date: Tue, 30 Jun 2009 17:55:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2009 at 06:38:45PM +0200, Koen Kooi wrote:

> From: Koen Kooi <koen@openembedded.org>
> 
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>

Acked-by: Tom Rini <trini@embeddedalley.com>

> ---
>  conf/checksums.ini                 |    8 ++++
>  recipes/lirc/lirc-modules_0.8.5.bb |   30 ++++++++++++++++
>  recipes/lirc/lirc_0.8.5.bb         |   67 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 105 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/lirc/lirc-modules_0.8.5.bb
>  create mode 100644 recipes/lirc/lirc_0.8.5.bb
> 
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 066b442..bb1224c 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -15150,6 +15150,10 @@ sha256=8bc1c6cfc6a9c312c8f5b8cc79b501e26b438c96a2d245f42e50bfb353617716
>  md5=1101c44d542807a4f9f5e33349b5bf56
>  sha256=d6e68935e69c82bba091cb102bbc4b63428eb8deb94c7d00e14ea3b673e10712
>  
> +[http://downloads.sourceforge.net/lirc/lirc-0.8.5.tar.gz]
> +md5=a9e44df2adbd71be586e0df6304605cc
> +sha256=ab5752e9af2df5f4cd2bd6d4f13872fbb519d7fa1bd3f187cc14dcb163440234
> +
>  [http://lisa-home.sourceforge.net/src/lisa-0.2.2.tar.bz2]
>  md5=cba116a4880f77205e0813d93bf14310
>  sha256=986a923a5247468db1d2a03e93268f4025ae5dc27e911dafc7b37e6a802122db
> @@ -17094,6 +17098,10 @@ sha256=e42d3b3f30de0c1ad0a86aa039b35cf2bf64c7f64c29ee333cbf934784639973
>  md5=0e942f22864e601406a994420231075b
>  sha256=28e76af491ea3696885e4558ae2f5628a4b9ebdbefc2f1d9cf1b35db2813e497
>  
> +[ftp://ftp.netperf.org/netperf/netperf-2.4.4.tar.bz2]
> +md5=0e942f22864e601406a994420231075b
> +sha256=28e76af491ea3696885e4558ae2f5628a4b9ebdbefc2f1d9cf1b35db2813e497
> +
>  [ftp://ftp.debian.org/debian/pool/non-free/n/netperf/netperf_2.3.orig.tar.gz]
>  md5=b50e49d5f0d3780438af0027a182b997
>  sha256=0578f4fafb309adf3413c9f56076b1b16476cb71e83c02ff7efafad172d91adb
> diff --git a/recipes/lirc/lirc-modules_0.8.5.bb b/recipes/lirc/lirc-modules_0.8.5.bb
> new file mode 100644
> index 0000000..e077775
> --- /dev/null
> +++ b/recipes/lirc/lirc-modules_0.8.5.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION = "LIRC is a package that allows you to decode and send infra-red signals of many commonly used remote controls. This package contains the lirc kernel modules."
> +SECTION = "base"
> +PRIORITY = "optional"
> +HOMEPAGE = "http://www.lirc.org"
> +LICENSE = "GPL"
> +DEPENDS = "virtual/kernel fakeroot-native setserial"
> +
> +SRCDATE=${@bb.data.getVar('PV', d, 1)[9:]}
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/lirc/lirc-${PV}.tar.gz"
> +S = "${WORKDIR}/lirc-${PV}"
> +
> +
> +inherit autotools module
> +
> +require lirc-config.inc
> +
> +MAKE_TARGETS = "KERNEL_PATH=${STAGING_KERNEL_DIR} MAKE='make V=1' -C drivers"
> +
> +fakeroot do_install() {
> +	oe_runmake -C drivers DESTDIR="${D}" moduledir="/lib/modules/${KERNEL_VERSION}/lirc" install
> +	rm -rf ${D}/dev
> +}
> +
> +# this is for distributions that don't use udev
> +pkg_postinst_append() {
> +if [ ! -c $D/dev/lirc -a ! -f /sbin/udevd ]; then mknod $D/dev/lirc c 61 0; fi
> +}
> +
> +FILES_${PN} = "/lib/modules"
> diff --git a/recipes/lirc/lirc_0.8.5.bb b/recipes/lirc/lirc_0.8.5.bb
> new file mode 100644
> index 0000000..34a40ff
> --- /dev/null
> +++ b/recipes/lirc/lirc_0.8.5.bb
> @@ -0,0 +1,67 @@
> +DESCRIPTION = "LIRC is a package that allows you to decode and send infra-red signals of many commonly used remote controls."
> +DESCRIPTION_append_lirc = " This package contains the lirc daemon, libraries and tools."
> +DESCRIPTION_append_lirc-x = " This package contains lirc tools for X11."
> +DESCRIPTION_append_lirc-exec = " This package contains a daemon that runs programs on IR signals."
> +DESCRIPTION_append_lirc-remotes = " This package contains some config files for remotes."
> +DESCRIPTION_append_lirc-nslu2example = " This package contains a working config for RC5 remotes and a modified NSLU2."
> +SECTION = "console/network"
> +PRIORITY = "optional"
> +HOMEPAGE = "http://www.lirc.org"
> +LICENSE = "GPL"
> +DEPENDS = "virtual/kernel virtual/libx11 libxau libsm libice"
> +DEPENDS_nslu2 = "virtual/kernel lirc-modules"
> +RDEPENDS = "lirc-modules"
> +RDEPENDS_lirc-x = "lirc"
> +RDEPENDS_lirc-exec = "lirc"
> +RDEPENDS_lirc-nslu2example = "lirc lirc-exec"
> +RRECOMMENDS_lirc = "lirc-exec"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/lirc/lirc-${PV}.tar.gz \
> +           file://lircd.init file://lircmd.init file://lircexec.init"
> +SRC_URI_append_nslu2 = " file://lircd.conf_nslu2 file://lircrc_nslu2"
> +
> +S = "${WORKDIR}/lirc-${PV}"
> +
> +inherit autotools module-base update-rc.d
> +
> +INITSCRIPT_PACKAGES = "lirc lirc-exec"
> +INITSCRIPT_NAME = "lircd"
> +INITSCRIPT_PARAMS = "defaults 20"
> +INITSCRIPT_NAME_lirc-exec = "lircexec"
> +INITSCRIPT_PARAMS_lirc-exec = "defaults 21"
> +
> +require lirc-config.inc
> +
> +EXTRA_OEMAKE = 'SUBDIRS="daemons tools"'
> +
> +do_stage() {
> +        oe_libinstall -so -C tools liblirc_client ${STAGING_LIBDIR}
> +	install -d ${STAGING_INCDIR}/lirc/
> +	install -m 0644 tools/lirc_client.h ${STAGING_INCDIR}/lirc/
> +}
> +
> +do_install_append() {
> +	install -d ${D}${sysconfdir}/init.d
> +	install ${WORKDIR}/lircd.init ${D}${sysconfdir}/init.d/lircd
> +	install ${WORKDIR}/lircexec.init ${D}${sysconfdir}/init.d/lircexec
> +        install -d ${D}${datadir}/lirc/
> +        cp -pPR ${S}/remotes ${D}${datadir}/lirc/
> +	rm -rf ${D}/dev
> +}
> +
> +do_install_append_nslu2() {
> +	install -d ${D}${sysconfdir}
> +	install ${WORKDIR}/lircd.conf_nslu2 ${D}${sysconfdir}/lircd.conf
> +	install ${WORKDIR}/lircrc_nslu2 ${D}${sysconfdir}/lircrc
> +}
> +
> +PACKAGES =+ "lirc-x lirc-exec lirc-remotes"
> +PACKAGES_prepend_nslu2 = "lirc-nslu2example "
> +
> +FILES_${PN}-dbg += "${bindir}/.debug ${sbindir}/.debug"
> +FILES_${PN} = "${bindir} ${sbindir} ${libdir} ${sysconfdir}/init.d"
> +FILES_lirc-x = "${bindir}/irxevent ${bindir}/xmode2"
> +FILES_lirc-exec = "${bindir}/irexec ${sysconfdir}/init.d/lircexec"
> +FILES_lirc-remotes = "${datadir}/lirc/remotes"
> +FILES_lirc-nslu2example = "${sysconfdir}/lircd.conf ${sysconfdir}/lircrc"
> +CONFFILES_lirc-nslu2example = "${FILES_lirc-nslu2example}"
> -- 
> 1.6.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 

-- 
Tom Rini


