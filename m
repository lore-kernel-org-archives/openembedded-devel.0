Return-Path: <B40290@freescale.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe006.messaging.microsoft.com [213.199.154.209])
	by mail.openembedded.org (Postfix) with ESMTP id 7F1CF6A5A1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 06:34:19 +0000 (UTC)
Received: from mail110-am1-R.bigfish.com (10.3.201.235) by
	AM1EHSOBE021.bigfish.com (10.3.207.143) with Microsoft SMTP Server id
	14.1.225.22; Tue, 23 Jul 2013 06:34:18 +0000
Received: from mail110-am1 (localhost [127.0.0.1])	by
	mail110-am1-R.bigfish.com (Postfix) with ESMTP id A37CC802AB	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 06:34:18 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz9371I542Izz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah1de097h1de096h8275bh8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dfeh1dffh1e1dhbe9i1155h)
Received: from mail110-am1 (localhost.localdomain [127.0.0.1]) by mail110-am1
	(MessageSwitch) id 1374561256131707_17166;
	Tue, 23 Jul 2013 06:34:16 +0000 (UTC)
Received: from AM1EHSMHS012.bigfish.com (unknown [10.3.201.227])	by
	mail110-am1.bigfish.com (Postfix) with ESMTP id 1B98C4A0048	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2013 06:34:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS012.bigfish.com
	(10.3.207.112) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 23 Jul 2013 06:34:13 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.249]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.03.0136.001;
	Tue, 23 Jul 2013 06:34:12 +0000
From: Guo Chunrong-B40290 <B40290@freescale.com>
To: Guo Chunrong-B40290 <B40290@freescale.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH] Install a systemd unit into
	${systemd_unitdir} only with systemd in DISTRO_FEATURES
Thread-Index: AQHOeUCT3Q65+FIybkad+UNxztZkPplx6ooQ
Date: Tue, 23 Jul 2013 06:34:11 +0000
Message-ID: <B21730BB6DA1D24B83348D9301EA417E104258EA@039-SN2MPN1-021.039d.mgd.msft.net>
References: <1373002142-5129-1-git-send-email-B40290@freescale.com>
In-Reply-To: <1373002142-5129-1-git-send-email-B40290@freescale.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.206]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: Yu Zongchun-B40527 <B40527@freescale.com>
Subject: Re: [meta-networking][PATCH] Install a systemd unit into ${systemd_unitdir} only with systemd in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 23 Jul 2013 06:34:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please apply the patch .


-----Original Message-----
From: Guo Chunrong-B40290=20
Sent: Friday, July 05, 2013 1:29 PM
To: openembedded-devel@lists.openembedded.org
Cc: Liu Ting-B28495; Luo Zhenhua-B19537; Guo Chunrong-B40290; Yu Zongchun-B=
40527; Guo Chunrong-B40290
Subject: [meta-networking][PATCH] Install a systemd unit into ${systemd_uni=
tdir} only with systemd in DISTRO_FEATURES

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.bb   |   11 +++++++----
 .../recipes-support/dnsmasq/dnsmasq.inc            |    5 ++++-
 .../recipes-support/nis/yp-tools_2.12.bb           |    8 +++++---
 .../recipes-support/nis/ypbind-mt_1.36.bb          |    8 +++++---
 meta-networking/recipes-support/ntp/ntp.inc        |   12 +++++++-----
 5 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb b=
/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
index d21995a..2eece50 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://README;beginline=3D3;endline=
=3D8;md5=3D7f7f00ba639ac8e8deb5
=20
 DEPENDS =3D "openssl libnl pciutils"
=20
-PR =3D "r1"
+PR =3D "r2"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
         file://init \
@@ -51,9 +51,12 @@ do_install_append() {
         -e "s@^includedir=3D.*@includedir=3D${STAGING_INCDIR}@g" \
         -e "s@^libdir=3D.*@libdir=3D${STAGING_LIBDIR}@g" \
         -i ${STAGING_BINDIR}/net-snmp-config
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/sy=
stem
+   =20
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; th=
en
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/sy=
stem
+        install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir=
}/system
+    fi
 }
=20
 PACKAGES =3D "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static $=
{PN}-libs \ diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.in=
c b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 0f5b273..242f143 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -31,9 +31,11 @@ do_install () {
     install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
=20
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)};=20
+ then
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/syst=
em
-
+    fi
+  =20
     if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" !=3D =
"" ]; then
         install -d ${D}${sysconfdir}/dbus-1/system.d
         install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d=
/
@@ -46,3 +48,4 @@ RPROVIDES_${PN} +=3D "${PN}-systemd"
 RREPLACES_${PN} +=3D "${PN}-systemd"
 RCONFLICTS_${PN} +=3D "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} =3D "dnsmasq.service"
+
diff --git a/meta-networking/recipes-support/nis/yp-tools_2.12.bb b/meta-ne=
tworking/recipes-support/nis/yp-tools_2.12.bb
index 0017845..65c4429 100644
--- a/meta-networking/recipes-support/nis/yp-tools_2.12.bb
+++ b/meta-networking/recipes-support/nis/yp-tools_2.12.bb
@@ -1,7 +1,7 @@
 # This package builds tools to manage NIS  # The source package is utils/n=
et/NIS/yp-tools  # -PR =3D "r3"
+PR =3D "r4"
 DESCRIPTION=3D"\
 Network Information Service tools.  \
 This package contains ypcat, ypmatch, ypset, \ @@ -26,6 +26,8 @@ RCONFLICT=
S_${PN} +=3D "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} =3D "domainname.service"
=20
 do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_unitdir}/s=
ystem
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; th=
en
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_unitdi=
r}/system
+    fi
 }
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb b/meta-n=
etworking/recipes-support/nis/ypbind-mt_1.36.bb
index 35ef16a..85ecaf8 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
@@ -1,7 +1,7 @@
 # This package builds the NIS ypbind daemon  # The source package is utils=
/net/NIS/ypbind-mt  # -PR =3D "r3"
+PR =3D "r4"
 DESCRIPTION=3D"\
 Multithreaded NIS bind service (ypbind-mt).  \  ypbind-mt is a complete ne=
w implementation of a NIS \ @@ -40,8 +40,10 @@ do_install_append () {
     # TODO, use update-rc.d
     ln -s ../init.d/ypbind ${D}${sysconfdir}/rcS.d/S44ypbind
=20
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/syste=
m
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; th=
en
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/s=
ystem
+    fi
 }
=20
 inherit systemd
diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/=
recipes-support/ntp/ntp.inc
index 79e7401..6006aeb 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -8,7 +8,7 @@ SECTION =3D "console/network"
 LICENSE =3D "NTP"
 LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dfea4b50c33b18c2194b4b1c9ca512=
670"
=20
-INC_PR =3D "r6"
+INC_PR =3D "r7"
=20
 SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${P=
V}.tar.gz \
            file://tickadj.c.patch \
@@ -59,10 +59,12 @@ do_install_append() {
     install -d ${D}/${sysconfdir}/network/if-up.d
     ln -s ${bindir}/ntpdate-sync ${D}/${sysconfdir}/network/if-up.d
=20
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/syst=
em/
-    install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}/system/
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; th=
en
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/=
system/
+        install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/sys=
tem/
+        install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}/sys=
tem/
+    fi
 }
=20
 PACKAGES +=3D "ntpdate sntp ${PN}-tickadj ${PN}-utils"
--
1.7.5.4



