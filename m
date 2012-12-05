Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1TgIGS-0000qE-2B
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 17:56:04 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qB5GfcX0016390
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 5 Dec 2012 08:41:38 -0800 (PST)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 5 Dec 2012 08:41:38 -0800
Received: from yow-jmacdona-d2.windriver.com (yow-jmacdona-d2.wrs.com
	[128.224.146.166])	by yow-jmacdona-d1.ottawa.wrs.com (Postfix) with
	ESMTP id 7BF937FE2	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Dec 2012 11:40:41 -0500 (EST)
Received: by yow-jmacdona-d2.windriver.com (Postfix, from userid 1000)	id
	1C24F6A7EA8; Wed,  5 Dec 2012 11:41:37 -0500 (EST)
Date: Wed, 5 Dec 2012 11:41:37 -0500
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20121205164136.GJ5359@windriver.com>
References: <cover.1354622319.git.Martin.Jansa@gmail.com>
	<8a6d73cf1bdcb97f82284a220840b1eb281433e9.1354622319.git.Martin.Jansa@gmail.com>
	<50BE9288.4050407@pabigot.com>
MIME-Version: 1.0
In-Reply-To: <50BE9288.4050407@pabigot.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 3/5] ntp: cleanup recipes and fix SSL support
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
X-List-Received-Date: Wed, 05 Dec 2012 16:56:05 -0000
X-Groupsio-MsgNum: 42002
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liqSWPDvh3eyfZ9k"
Content-Disposition: inline

--liqSWPDvh3eyfZ9k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [oe] [PATCH 3/5] ntp: cleanup recipes and fix SSL support] On 12.12.04=
 (Tue 18:17) Peter A. Bigot wrote:

> On 12/04/2012 05:59 AM, Martin Jansa wrote:
> >From: Paul Eggleton <paul.eggleton@linux.intel.com>
> >
> >* Move common definitions to the inc file
> >* Drop override of do_configure which doesn't seem to be needed anymore
> >* Fold ntp-ssl into the ntp recipe as a PACKAGECONFIG option for those
> >   who want it (default to off) and fix configure-time checks to detect
> >   OpenSSL properly so that it gets enabled when selected
> >* Remove ntp-bin package and put its contents in currently empty
> >   ntp-utils package (with migration path)
> >* Fix hardcoded paths in ntpd initscript
> >* Specify ntpd.conf as a configuration file for packaging purposes
> >* Rearrange so that packaging definitions are towards the end in the
> >   expected order
> >* Delete unused "ntp" initscript file
> >* Add SUMMARY
> >* Update HOMEPAGE
> >
> >This reapplies some of the changes from the original patch by
> >Morgan Little <morgan.little@windriver.com>.
> >
> >Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> >Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >---
> >  meta-networking/recipes-support/ntp/files/ntp      | 31 --------
> >  .../recipes-support/ntp/files/openssl-check.patch  | 59 +++++++++++++++
> >  .../recipes-support/ntp/ntp-ssl_4.2.6p5.bb         | 11 ---
> >  meta-networking/recipes-support/ntp/ntp.inc        | 87 ++++++++++++++=
+++-----
> >  meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb | 44 +----------
> >  5 files changed, 131 insertions(+), 101 deletions(-)
> >  delete mode 100755 meta-networking/recipes-support/ntp/files/ntp
> >  create mode 100644 meta-networking/recipes-support/ntp/files/openssl-c=
heck.patch
> >  delete mode 100644 meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5=
=2Ebb
> >
> >diff --git a/meta-networking/recipes-support/ntp/files/ntp b/meta-networ=
king/recipes-support/ntp/files/ntp
> >deleted file mode 100755
> >index e91a528..0000000
> >--- a/meta-networking/recipes-support/ntp/files/ntp
> >+++ /dev/null
> >@@ -1,31 +0,0 @@
> >-#! /bin/sh
> >-
> >-FLAGS=3D"defaults 23"
> >-
> >-test -f /usr/bin/ntpd || exit 0
> >-
> >-case "$1" in
> >-	start)
> >-		echo -n "Starting NTP server: ntpd"
> >-  		start-stop-daemon --start --quiet --exec /usr/bin/ntpd
> >-		echo "."
> >-  		;;
> >-	stop)
> >-		echo -n "Stopping NTP server: ntpd"
> >-  		start-stop-daemon --stop --quiet --exec /usr/bin/ntpd
> >-		echo "."
> >-  		;;
> >-	restart|force-reload)
> >-		echo -n "Restarting NTP server: ntpd... "
> >-  		start-stop-daemon --stop --quiet --exec /usr/bin/ntpd
> >-  		sleep 2
> >-  		start-stop-daemon --start --quiet --exec /usr/bin/ntpd
> >-		echo "done."
> >-  		;;
> >-	*)
> >-  		echo "Usage: /etc/init.d/ntp {start|stop|restart|force-reload}"
> >-  		exit 1
> >-		;;
> >-esac
> >-
> >-exit 0
> >diff --git a/meta-networking/recipes-support/ntp/files/openssl-check.pat=
ch b/meta-networking/recipes-support/ntp/files/openssl-check.patch
> >new file mode 100644
> >index 0000000..8b4a673
> >--- /dev/null
> >+++ b/meta-networking/recipes-support/ntp/files/openssl-check.patch
> >@@ -0,0 +1,59 @@
> >+Hack OpenSSL check to work when libssl and libcrypto aren't in same dir
> >+
> >+Upstream-Status: Inappropriate [config]
> >+
> >+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> >+---
> >+ configure         |    4 ++--
> >+ m4/ntp_openssl.m4 |    4 ++--
> >+ sntp/configure    |    4 ++--
> >+ 3 files changed, 6 insertions(+), 6 deletions(-)
> >+
> >+diff --git a/configure b/configure
> >+index aae2c01..6a3c15e 100755
> >+--- a/configure
> >++++ b/configure
> >+@@ -22868,8 +22868,8 @@ case "$ans" in
> >+ 	    test -f $i/libcrypto.dylib -a -f $i/libssl.dylib && break
> >+ 	    ;;
> >+ 	 *)
> >+-	    test -f $i/libcrypto.so -a -f $i/libssl.so && break
> >+-	    test -f $i/libcrypto.a -a -f $i/libssl.a && break
> >++	    test -f $i/libssl.so && break
> >++	    test -f $i/libssl.a && break
> >+ 	    ;;
> >+ 	esac
> >+     done
> >+diff --git a/m4/ntp_openssl.m4 b/m4/ntp_openssl.m4
> >+index 7d9f477..67bdd55 100644
> >+--- a/m4/ntp_openssl.m4
> >++++ b/m4/ntp_openssl.m4
> >+@@ -41,8 +41,8 @@ case "$ans" in
> >+ 	    test -f $i/libcrypto.dylib -a -f $i/libssl.dylib && break
> >+ 	    ;;
> >+ 	 *)
> >+-	    test -f $i/libcrypto.so -a -f $i/libssl.so && break
> >+-	    test -f $i/libcrypto.a -a -f $i/libssl.a && break
> >++	    test -f $i/libssl.so && break
> >++	    test -f $i/libssl.a && break
> >+ 	    ;;
> >+ 	esac
> >+     done
> >+diff --git a/sntp/configure b/sntp/configure
> >+index 7782c29..55e82d9 100755
> >+--- a/sntp/configure
> >++++ b/sntp/configure
> >+@@ -14810,8 +14810,8 @@ case "$ans" in
> >+ 	    test -f $i/libcrypto.dylib -a -f $i/libssl.dylib && break
> >+ 	    ;;
> >+ 	 *)
> >+-	    test -f $i/libcrypto.so -a -f $i/libssl.so && break
> >+-	    test -f $i/libcrypto.a -a -f $i/libssl.a && break
> >++	    test -f $i/libssl.so && break
> >++	    test -f $i/libssl.a && break
> >+ 	    ;;
> >+ 	esac
> >+     done
> >+--
> >+1.7.1
> >+
> >diff --git a/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb b/me=
ta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
> >deleted file mode 100644
> >index a158990..0000000
> >--- a/meta-networking/recipes-support/ntp/ntp-ssl_4.2.6p5.bb
> >+++ /dev/null
> >@@ -1,11 +0,0 @@
> >-require ntp_${PV}.bb
> >-DEPENDS =3D "openssl"
> >-
> >-S =3D "${WORKDIR}/ntp-${PV}"
> >-
> >-EXTRA_OECONF =3D "--with-openssl-libdir=3D${STAGING_LIBDIR} \
> >-	        --with-openssl-incdir=3D${STAGING_INCDIR}/openssl"
> >-
> >-
> >-SRC_URI[md5sum] =3D "98e16c7aa4ecd4c004b51bff18962e95"
> >-SRC_URI[sha256sum] =3D "9f4a5271a285d390c9225e3ea28f70049ea377d30fc6de4=
659007cfff278671a"
> >diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networki=
ng/recipes-support/ntp/ntp.inc
> >index 1d740f0..a614e3f 100644
> >--- a/meta-networking/recipes-support/ntp/ntp.inc
> >+++ b/meta-networking/recipes-support/ntp/ntp.inc
> >@@ -1,35 +1,86 @@
> >+SUMMARY =3D "Network Time Protocol daemon and utilities"
> >  DESCRIPTION =3D "The Network Time Protocol (NTP) is used to \
> >  synchronize the time of a computer client or server to \
> >  another server or reference time source, such as a radio \
> >  or satellite receiver or modem."
> >-HOMEPAGE =3D "http://ntp.isc.org/bin/view/Main/WebHome"
> >+HOMEPAGE =3D "http://support.ntp.org"
> >  SECTION =3D "console/network"
> >  LICENSE =3D "ntp"
> >  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dfea4b50c33b18c2194b4b1c9c=
a512670"
> >-RSUGGESTS_${PN} =3D "iana-etc"
> >-SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P}=
=2Etar.gz \
> >-	file://ipv6only-workaround.patch \
> >-	file://ntpd \
> >-	file://ntp.conf \
> >-	file://ntpdate \
> >-	file://ntpd.service \
> >-"
> >+INC_PR =3D "r2"
> >-inherit autotools update-rc.d
> >+SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-=
${PV}.tar.gz \
> >+           file://tickadj.c.patch \
> >+           file://ntp-4.2.4_p6-nano.patch \
> >+           file://openssl-check.patch \
> >+           file://ntpd \
> >+           file://ntp.conf \
> >+           file://ntpdate \
> >+           "
> >-INITSCRIPT_NAME =3D "ntpd"
> >-# No dependencies, so just go in at the standard level (20)
> >-INITSCRIPT_PARAMS =3D "defaults"
> >+inherit autotools update-rc.d
> >  # The ac_cv_header_readline_history is to stop ntpdc depending on eith=
er
> >  # readline or curses
> >-EXTRA_OECONF =3D "--without-openssl --without-crypto ac_cv_header_readl=
ine_history_h=3Dno"
> >+EXTRA_OECONF +=3D "--with-net-snmp-config=3Dno --without-ntpsnmpd ac_cv=
_header_readline_history_h=3Dno"
> >  CFLAGS_append =3D " -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED"
> >-PACKAGES +=3D "ntpdate ${PN}-bin ${PN}-tickadj ${PN}-utils"
> >+PACKAGECONFIG ??=3D ""
> >+PACKAGECONFIG[openssl] =3D "--with-openssl-libdir=3D${STAGING_LIBDIR} \
> >+                          --with-openssl-incdir=3D${STAGING_INCDIR} \
> >+                          --with-crypto, \
> >+                          --without-openssl --without-crypto, \
> >+                          openssl"
> >+
> >+do_install_append() {
> >+	install -d ${D}${sysconfdir}/init.d
> >+	install -m 644 ${WORKDIR}/ntp.conf ${D}${sysconfdir}
> >+	install -m 755 ${WORKDIR}/ntpd ${D}${sysconfdir}/init.d
> >+
> >+	# Fix hardcoded paths in scripts
> >+	sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/ntpd
> >+	sed -i 's!/usr/bin/!${bindir}/!g' ${D}${sysconfdir}/init.d/ntpd
> >+	sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/ntpd
> >+	sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/ntpd
> >+
> >+	install -d ${D}${sysconfdir}/network/if-up.d
> >+	install -m 755 ${WORKDIR}/ntpdate ${D}${sysconfdir}/network/if-up.d
> >+}
> >+
> >+PACKAGES +=3D "ntpdate ${PN}-tickadj ${PN}-utils"
> >  # NOTE: you don't need ntpdate, use "ntpd -q -g -x"
> >-# or the ntpdate systemd service
> >-# This should use rc.update
> >-FILES_ntpdate =3D "${bindir}/ntpdate ${sysconfdir}/init.d/ntpdate"
> >+# ntp originally includes tickadj. It's split off for inclusion in smal=
l firmware images on platforms
> >+# with wonky clocks (e.g. OpenSlug)
> >+RDEPENDS_${PN} =3D "${PN}-tickadj"
> >+# Handle move from bin to utils package
> >+RPROVIDES_${PN}-utils =3D "${PN}-bin"
> >+RREPLACES_${PN}-utils =3D "${PN}-bin"
> >+RCONFLICTS_${PN}-utils =3D "${PN}-bin"
> >+
> >+RSUGGESTS_${PN} =3D "iana-etc"
> >+
> >+FILES_${PN} =3D "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/in=
it.d/ntpd ${sbindir} ${libdir}"
> >+FILES_${PN}-tickadj =3D "${bindir}/tickadj"
> >+FILES_${PN}-utils =3D "${bindir}"
> >+FILES_ntpdate =3D "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpd=
ate"
> >+
> >+CONFFILES_${PN} =3D "${sysconfdir}/ntp.conf"
> >+
> >+INITSCRIPT_NAME =3D "ntpd"
> >+# No dependencies, so just go in at the standard level (20)
> >+INITSCRIPT_PARAMS =3D "defaults"
> >+
> >+pkg_postinst_ntpdate() {
> >+if test "x$D" !=3D "x"; then
> >+        exit 1
> >+else
> >+        if ! grep -q -s ntpdate /var/spool/cron/root; then
> >+                echo "adding crontab"
> >+                test -d /var/spool/cron || mkdir -p /var/spool/cron
> >+                echo "30 * * * *    /usr/bin/ntpdate -b -s -u pool.ntp.=
org" >> /var/spool/cron/root
> >+        fi
> >+fi
> >+}
> >+
> >diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb b/meta-n=
etworking/recipes-support/ntp/ntp_4.2.6p5.bb
> >index f7c5b68..f1e9ecd 100644
> >--- a/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> >+++ b/meta-networking/recipes-support/ntp/ntp_4.2.6p5.bb
> >@@ -1,45 +1,7 @@
> >  require ntp.inc
> >-SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-=
${PV}.tar.gz \
> >-        file://tickadj.c.patch \
> >-        file://ntp-4.2.4_p6-nano.patch \
> >-        file://ntpd \
> >-        file://ntp.conf \
> >-        file://ntpdate \
> >-"
> >+PR =3D "${INC_PR}.0"
> >-SRC_URI[md5sum] =3D "59876a9009b098ff59767ee45a88ebd2"
> >-SRC_URI[sha256sum] =3D "6e84d4ddfa14b911c3ed88463af10867e1fa9b287e7b34d=
8a02e78be85a7c40e"
> >-
> >-EXTRA_OECONF +=3D " --with-net-snmp-config=3Dno --without-ntpsnmpd"
> >-
> >-do_install_append() {
> >-	install -d ${D}/${sysconfdir}/init.d
> >-	install -m 644 ${WORKDIR}/ntp.conf ${D}/${sysconfdir}
> >-	install -m 755 ${WORKDIR}/ntpd ${D}/${sysconfdir}/init.d
> >-	install -d ${D}/${sysconfdir}/network/if-up.d
> >-	install -m 755 ${WORKDIR}/ntpdate ${D}/${sysconfdir}/network/if-up.d
> >-}
> >-
> >-FILES_${PN}-bin =3D "${bindir}/ntp-wait ${bindir}/ntpdc ${bindir}/ntpq =
${bindir}/ntptime ${bindir}/ntptrace"
> >-FILES_${PN} =3D "${bindir}/ntpd ${sysconfdir}/ntp.conf ${sysconfdir}/in=
it.d/ntpd"
> >-FILES_${PN}-tickadj =3D "${bindir}/tickadj"
> >-FILES_ntp-utils =3D "${bindir}/*"
> >-FILES_ntpdate =3D "${bindir}/ntpdate ${sysconfdir}/network/if-up.d/ntpd=
ate"
> >-
> >-# ntp originally includes tickadj. It's split off for inclusion in smal=
l firmware images on platforms
> >-# with wonky clocks (e.g. OpenSlug)
> >-RDEPENDS_${PN} =3D "${PN}-tickadj"
> >-
> >-pkg_postinst_ntpdate() {
> >-if test "x$D" !=3D "x"; then
> >-        exit 1
> >-else
> >-        if ! grep -q -s ntpdate /var/spool/cron/root; then
> >-                echo "adding crontab"
> >-                test -d /var/spool/cron || mkdir -p /var/spool/cron
> >-                echo "30 * * * *    /usr/bin/ntpdate -b -s -u pool.ntp.=
org" >> /var/spool/cron/root
> >-        fi
> >-fi
> >-}
> >+SRC_URI[md5sum] =3D "00df80a84ec9528fcfb09498075525bc"
> >+SRC_URI[sha256sum] =3D "d6ab8371f9d31e594eb6922823d5ccd03dcc4e9d84b0e23=
ea25ac1405432f91c"
> I would like to see the checksum correction made as a separate
> commit on danny ASAP and before applying this more significant set
> of changes, so there's a working stable point to back up to if
> something goes wrong. Accepting
> http://patches.openembedded.org/patch/39697/ onto danny would
> accomplish this; alternatively I could re-submit that specifically
> for danny if that's preferable.

Agreed.  As a first step to sorting out the NTP thing, I've merged the
above referenced patch into danny.  Sorry about the delay.

--=20
-Joe MacDonald.
:wq

--liqSWPDvh3eyfZ9k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAlC/eUAACgkQPN8S4W6ZZnePBACfc3xAviW14ACwqxfO4ENSiJTv
s2IAnRrbF474yiv4G7N++hEAt+zVsflW
=iv8l
-----END PGP SIGNATURE-----

--liqSWPDvh3eyfZ9k--
