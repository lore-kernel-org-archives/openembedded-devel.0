Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id E66D672369
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Dec 2014 18:03:36 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id et14so9247165pad.29
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Dec 2014 10:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1Cj0Ty0vDPu0VbQg5Eg89p/HwYPKNyIGnFS3qpgcsKk=;
	b=hWosK/bdf8SdXcKf0dxaCOmY90XvllJ8C8T074ksay8Mcd/WFijgQcCOlLsAobgKOd
	NfyEWVKaicL63EBKRBRr/WNQxWd4/rZRZ7OGZcx20rBJeZ2CH2rLn4YtGwmB9eEueCQh
	l7gq37Yh2ZrFZvcQRVal6SQcRQi3w36fYuSNDUVdB0mVmispLTItpIUAFY5pgDFzmqmz
	r2ydzWGOku5urbKXUXSt1iaynXV5zh4WDBK5ZVH6rMRBSXNoUSlmrAwhOAW1m7hwI9Qr
	DZu3d0HgjBmR0/qqqW9LCWLqe14zVQ5kvEZ2hMbF+fqnaOl1S4cFQZNuBKIoNauF39C8
	O3Og==
X-Received: by 10.70.101.97 with SMTP id ff1mr36641695pdb.142.1418493816731;
	Sat, 13 Dec 2014 10:03:36 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id y3sm4771951pbt.44.2014.12.13.10.03.34
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 13 Dec 2014 10:03:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Dec 2014 10:03:32 -0800
Message-Id: <1418493812-17585-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH V2] netkit-tftp: new package
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
X-List-Received-Date: Sat, 13 Dec 2014 18:03:39 -0000

V2: fix license
    moved xinent.d config to file
    remove INSANE

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../netkit-tftp/netkit-tftp/tftp.conf              | 11 +++++
 .../recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb | 54 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/tftp.conf
 create mode 100644 meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb

diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/tftp.conf b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/tftp.conf
new file mode 100644
index 0000000..7bc6ca9
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp/tftp.conf
@@ -0,0 +1,11 @@
+service tftp
+{
+    disable        = no
+    socket_type    = dgram
+    port           = 69
+    protocol       = udp
+    wait           = yes
+    user           = nobody
+    server         = /usr/sbin/in.tftpd
+    server_args    = /tftpboot
+}
diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
new file mode 100644
index 0000000..43075d7
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
@@ -0,0 +1,54 @@
+DESCRIPTION = " tftp - Trivial file transfer protocol client \
+    tftpd- Trivial file transfer protocol server "
+SECTION = "networking" LICENSE = "BSD-4-Clause"
+DEPENDS = " tcp-wrappers"
+
+LIC_FILES_CHKSUM = "file://tftp/tftp.c;beginline=2;endline=3;md5=84d2cfe1e60863a7d82648734ba4d30c"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive \
+        ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-18.diff.gz;name=patch18 \
+        file://tftp.conf \
+"
+
+SRC_URI[archive.md5sum] = "b7262c798e2ff50e29c2ff50dfd8d6a8"
+SRC_URI[archive.sha256sum] = "3a43c0010d4e61f412563fd83769d4667d8b8e82903526d21cb9205fe55ad14d"
+SRC_URI[patch18.md5sum] = "cb29e7a33dd85105ba6e6ec4f971e42c"
+SRC_URI[patch18.sha256sum] = "092437d27b4fa88c044ef6290372fee5ce06d223607f0e22a6e527065c8930e7"
+
+inherit autotools-brokensep
+
+do_configure () {
+    ./configure --prefix=${prefix}
+    echo "CFLAGS=${CFLAGS}" > MCONFIG
+}
+
+do_compile () {
+    oe_runmake 'CC=${CC}' 'LD=${LD}' 'LDFLAGS=${LDFLAGS}' 'CFLAGS=${CFLAGS}'
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -d ${D}${sbindir}
+    install -d ${D}${mandir}/man1
+    install -d ${D}${mandir}/man8
+    install -d ${D}${sysconfdir}/xinetd.d
+
+    sed -i 's/install -s/install/' tftp/Makefile
+    sed -i 's/install -s/install/' tftpd/Makefile
+
+    oe_runmake 'INSTALLROOT=${D}' 'BINMODE=0755' \
+    'DAEMONMODE=0755' 'MANMODE=0644' \
+    'BINDIR=${bindir}' 'SBINDIR=${sbindir}' \
+    'MANDIR=${mandir}' install
+
+    install ${WORKDIR}/tftp.conf ${D}/${sysconfdir}/xinetd.d/tftp
+}
+
+PACKAGES = "${PN}-client ${PN}-server ${PN}-doc ${BPN}-dbg"
+FILES_${PN}-client = "${bindir}/*"
+FILES_${PN}-server = "${sbindir}/* ${sysconfdir}/xinetd.d/*"
+FILES_${PN}-doc = "${mandir}"
+FILES_${PN}-dbg = "${prefix}/src/debug \
+            ${bindir}/.debug ${sbindir}/.debug"
+
+RDEPENDS_${PN}-server = "tcp-wrappers xinetd"
-- 
1.9.1


