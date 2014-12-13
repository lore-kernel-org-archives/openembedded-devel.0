Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id E782965D34
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Dec 2014 01:13:51 +0000 (UTC)
Received: by mail-pd0-f178.google.com with SMTP id r10so8201540pdi.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 17:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=miAzYrxuh7A+MrHxlhDFAF/kLXjlbkAuOp9KSbmb22I=;
	b=iWMovNfQDmqAPcGQ8hvnxfcpMWIGqv8Woa0PJIVCsLs9cvMT1ZnhPJXnTNfi4+hbjT
	kr+oWJ1k7i+5fUuAHSpxFJ5naDpCFcO0l1l8fB1Nk5EU/VSbo8oTDuuJFMEH2LiAL/Ia
	mRKxiFWA8fAqweuwESO3bi7h7R/SPRFuynRz6jBBdJZPOQY9t+JF1UTX0Xtv/ZJ1cYsN
	QHgtCqFNx/lbxKlOVOwyFB9SGCa44KqUgZgBaTY+eIpSjHmDYIt+vw4IMshHgYF2rfdB
	DxF/YpHdBuqtzB4c+Dl4h8bgk9Zwut8hKjqcSTGD8F0lVCsyff+JlFu5zRUqF9DNRiHX
	GMGA==
X-Received: by 10.68.69.48 with SMTP id b16mr30864569pbu.59.1418433232015;
	Fri, 12 Dec 2014 17:13:52 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	og12sm2603499pdb.43.2014.12.12.17.13.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 12 Dec 2014 17:13:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Dec 2014 17:13:47 -0800
Message-Id: <1418433227-14617-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] netkit-tftp: new package
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
X-List-Received-Date: Sat, 13 Dec 2014 01:13:54 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb

diff --git a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
new file mode 100644
index 0000000..bd5c113
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
@@ -0,0 +1,70 @@
+DESCRIPTION = " tftp - Trivial file transfer protocol client \
+    tftpd- Trivial file transfer protocol server "
+SECTION = "networking"
+LICENSE = "BSD"
+DEPENDS = " tcp-wrappers"
+
+LIC_FILES_CHKSUM = "file://tftp/tftp.c;beginline=2;endline=3;md5=84d2cfe1e60863a7d82648734ba4d30c"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive \
+        ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-18.diff.gz;name=patch18 \
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
+    # create the xinetd config file  
+    cat >tftp.conf <<EOF
+ service tftp 
+ {
+    disable        = no 
+    socket_type    = dgram
+    port           = 69
+    protocol       = udp 
+    wait           = yes
+    user           = nobody 
+    server         = ${sbindir}/in.tftpd
+    server_args    = /tftpboot
+ }
+EOF
+    install tftp.conf ${D}/${sysconfdir}/xinetd.d/tftp
+}
+
+INSANE_SKIP_${PN} = "already-stripped"
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


