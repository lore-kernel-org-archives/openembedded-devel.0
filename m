Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 7D5EA60167
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 06:27:15 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1XWg2m-00013s-Qv for openembedded-devel@lists.openembedded.org;
	Wed, 24 Sep 2014 08:27:16 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 08:27:16 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 08:27:16 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 24 Sep 2014 08:27:07 +0200
Message-ID: <lvto7r$7em$1@ger.gmane.org>
References: <1411537323-29871-1-git-send-email-rongqing.li@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
In-Reply-To: <1411537323-29871-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH] iscsi-initiator-utils: add recipe file
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
X-List-Received-Date: Wed, 24 Sep 2014 06:27:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

rongqing.li@windriver.com schreef op 24-09-14 07:42:
> From: Roy Li <rongqing.li@windriver.com>
> 
> The package provides the server daemon for the iSCSI protocol, as well as
> the utility programs used to manage it. iSCSI is a protocol for
> distributed disk access using SCSI commands sent over Internet Protocol
> networks
> 
> It's a fairly basic utility, so copy it from meta-cloud-service to
> meta-oe
> 
> Signed-off-by: Roy Li <rongqing.li@windriver.com> ---

[..]

> +++
> b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils.inc

Is
> 
there a specific reason to use an .inc+.bb instead of just a .bb?

> @@ -0,0 +1,112 @@ +SUMMARY = "iSCSI daemon and utility programs" 
> +DESCRIPTION = \ +"Open-iSCSI project is a high performance, transport
> independent, \ +multi-platform implementation of RFC3720. The iscsi
> package provides \ +the server daemon for the iSCSI protocol, as well as
> the utility \ +programs used to manage it. iSCSI is a protocol for
> distributed \ +disk access using SCSI commands sent over Internet
> Protocol networks." +SECTION = "console/network" + +HOMEPAGE =
> "http://www.open-iscsi.org/" + +UPSTREAM_name = "open-iscsi"

This variable is not used in OE-core, remove it

> + +#iscsi-initiator-utils-{use-var-for-config}.patch are from fedora 
> +#change nodes,send_targets... from /etc/iscsi to /var/lib/iscsi +SRC_URI
> = "http://www.open-iscsi.org/bits/${UPSTREAM_name}-${PV}.tar.gz \ +
> file://iscsi-initiator-utils-use-var-for-config.patch \ +
> file://iscsi-initiator-utils-dont-use-static.patch	\ +
> file://initd.debian	\ +           file://99_iscsi-initiator-utils \ +" +S
> = "${WORKDIR}/${UPSTREAM_name}-${PV}" +TARGET_CC_ARCH += "${LDFLAGS}"

Move TARGET_CC_ARCH to be right above do_configure

> + +#utils/fwparam_ibft/prom_parse.y utils/fwparam_ibft/prom_lex.l 
> +#already parsed in source 2.0 but still depends on flex and bison 
> +#native in case future version they are not parsed +DEPENDS += "openssl
> flex-native bison-native"

DEPENDS goes at the top, somewhere between HOMEPAGE and SRC_URI

> + +PACKAGES =+ "${PN}-tests" + +FILES_${PN}-tests =
> "/opt/${BPN}-tests/*" +RDEPENDS_${PN}-tests = "perl"

PACKAGES, FILES, R* go below do_install

> + +inherit update-rc.d

inherits go above SRC_URI

> + +do_configure () { +	#need to support cross-compiling in open-isns
> only +	(cd utils/open-isns; \ +	 ./configure --host=${TARGET_SYS}
> --build=${BUILD_SYS} --with-security=no ) +}

You should run at least 'gnu-configize' if it's autotools based.

> + +do_compile () { +	#make iscsistart one of PROGRAMS if install_user in
> do_install +	#sed -i -e '/^PROGRAMS = /s;$; usr/iscsistart;' Makefile + +
> #fix the ar used in open-isns +	sed -i -e 's:ar cr :$(AR) cr :'
> ${S}/utils/open-isns/Makefile +	oe_runmake user + +} + +do_install () { +
> #completely override the install_user as bugs in Makefile +	#oe_runmake
> DESTDIR="${D}" install_user + +	#install necessary directories +	install
> -d ${D}${base_sbindir} \ +		${D}${sysconfdir}/init.d \ +
> ${D}${sysconfdir}/iscsi \ +		${D}${localstatedir}/lib/iscsi/nodes \ +
> ${D}${localstatedir}/lib/iscsi/send_targets \ +
> ${D}${localstatedir}/lib/iscsi/static \ +
> ${D}${localstatedir}/lib/iscsi/isns \ +
> ${D}${localstatedir}/lib/iscsi/slp \ +
> ${D}${localstatedir}/lib/iscsi/ifaces \ +		${D}/${mandir}/man8 + +
> install -p -m 755 ${S}/usr/iscsid ${S}/usr/iscsiadm \ +
> ${S}/utils/iscsi-iname \ +		${S}/usr/iscsistart ${D}/${base_sbindir} + +
> install -p -m 644 ${S}/doc/iscsiadm.8 ${S}/doc/iscsid.8
> ${D}/${mandir}/man8 +	install -p -m 644 ${S}/etc/iscsid.conf
> ${D}${sysconfdir}/iscsi +	install -p -m 755 ${WORKDIR}/initd.debian
> ${D}${sysconfdir}/init.d/iscsid + +	#install regression tests +	[ ! -d
> ${D}/opt/${BPN}-tests ] && mkdir -p ${D}/opt/${BPN}-tests +	install
> ${S}/test/regression.dat ${S}/test/regression.sh ${D}/opt/${BPN}-tests/ 
> + +	#open-isns tests +	mkdir -p ${D}/opt/${BPN}-tests/isns-tests +
> install ${S}/utils/open-isns/tests/*.pl
> ${D}/opt/${BPN}-tests/isns-tests/ +	install
> ${S}/utils/open-isns/tests/genkey \ +
> ${S}/utils/open-isns/tests/client.conf \ +
> ${S}/utils/open-isns/tests/server.conf \ +
> ${D}/opt/${BPN}-tests/isns-tests/ +	cp -a ${S}/utils/open-isns/tests/data
> ${D}/opt/${BPN}-tests/isns-tests/

/opt shouldn't be used in normal packaging, ${datadir} would be a better place

> +	install -d ${D}/etc/default/volatiles +	install -m 0644
> ${WORKDIR}/99_iscsi-initiator-utils ${D}/etc/default/volatiles +} + 
> +pkg_postinst_${PN}() { +	#default there is no initiatorname.iscsi
> installed +	#but it is needed or iscsid will fail + +	#will run only when
> postinst on target +	if [ "x$D" != "x" ]; then +		exit 1 +	fi +	if [ ! -f
> ${sysconfdir}/iscsi/initiatorname.iscsi ]; then +		echo
> "InitiatorName=$(${base_sbindir}/iscsi-iname)" > \ +
> ${sysconfdir}/iscsi/initiatorname.iscsi +	fi + +	if [ -e
> /etc/init.d/populate-volatile.sh ]; then +
> /etc/init.d/populate-volatile.sh update +	fi +} + +INITSCRIPT_NAME =
> "iscsid" +INITSCRIPT_PARAMS = "start 30 1 2 3 4 5 . stop 70 0 1 2 3 4 5 6
> ." diff --git
> a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
> b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
>
> 
new file mode 100644
> index 0000000..e85a5d2 --- /dev/null +++
> b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.0-873.bb
>
> 
@@ -0,0 +1,9 @@
> +LICENSE = "GPLv2 & LGPLv2.1" +LIC_FILES_CHKSUM = \ +
> "file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \ +
> file://utils/open-isns/COPYING;md5=7fbc338309ac38fefcd64b04bb903e34" + 
> +SRC_URI[md5sum] = "8b8316d7c9469149a6cc6234478347f7" +SRC_URI[sha256sum]
> = "7dd9f2f97da417560349a8da44ea4fcfe98bfd5ef284240a2cc4ff8e88ac7cd9" + 
> +require ${PN}.inc
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFUImQ7MkyGM64RGpERAqcMAKCBpCVSNZRwECsE5NAWMaKE97fjqACfQB+j
Z4q+8rh/QYRnQ+kUQKTYsEU=
=kCre
-----END PGP SIGNATURE-----


