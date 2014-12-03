Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 40A1460030
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Dec 2014 05:04:32 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id y10so14629095pdj.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Dec 2014 21:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=JwuhEmiJyouLUU6FDSk4UI8IxJcrnw3aCbiCW0B4Mxg=;
	b=kCu223wRCuW7KgpZlOAHpju8S/7CWZwBF7bRWM2HW4moRusiDZ1Tbe3wPlIy7nZExo
	5A7+BOuRvW45MbQGjjjsDWMnUGA76bCMjT1K+W97tq0c50wUGg61OsJS4ObWZwSnEKzP
	WkWCWj736cRXbKarZ8jFg1z59O8PCDkihSW3yAtaWxQRstyYQY3HllZLd1Yunnd0BDHm
	YRH6b0Qn4axkNA7OdWPtfz1EgEgKLGB7/91zDrEr9IPx5/hX8HGC79lgwgIIk3BvIfJT
	pJTS7ic+JlVBzsT+GWUz5N+OL261VO9nHG0qSwvwFQUDpLpAarPcyxesBX+MqtPzfu9x
	ZsOw==
X-Received: by 10.67.23.134 with SMTP id ia6mr5445557pad.50.1417583073014;
	Tue, 02 Dec 2014 21:04:33 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id ut7sm21738265pbc.8.2014.12.02.21.04.30
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Dec 2014 21:04:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Dec 2014 21:04:27 -0800
Message-Id: <1417583067-19852-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH] netkit-rusers: new package
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
X-List-Received-Date: Wed, 03 Dec 2014 05:04:35 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../netkit-rusers/netkit-rusers_0.17.bb            | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb

diff --git a/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
new file mode 100644
index 0000000..880b5c9
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rusers/netkit-rusers_0.17.bb
@@ -0,0 +1,72 @@
+DESCRIPTION = "netkit-rusers includes rusers - Displays who is logged in to machines on local network \
+    rusersd - Logged in users server"
+
+SECTION = "networking"
+HOMEPAGE="ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
+LICENSE = "BSD"
+
+DEPENDS = " tcp-wrappers libtirpc rpcbind"
+
+LIC_FILES_CHKSUM = "file://rusers/rusers.c;beginline=2;endline=3;md5=f4fc634a4ce8c569911196b72b10770e"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;name=archive \
+            ${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-8.diff.gz;name=patch8 \
+"
+
+SRC_URI[archive.md5sum] = "dc99a80b9fde2ab427c874f88f1c1602"
+SRC_URI[archive.sha256sum] = "f00138651865ad2dcfec5dedda0cda403cb80c4ab68efcc3bbccafe198c24b6d"
+SRC_URI[patch8.md5sum] = "1ff498113e0f920d92088092e5570bdc"
+SRC_URI[patch8.sha256sum] = "14882dbdda4e37baa84d55b54b46c7e063a20fc9e04d1be1a2807643cd0f3067"
+
+inherit autotools-brokensep 
+
+do_configure () {
+    ./configure --prefix=${prefix}
+    echo "LDFLAGS=${LDFLAGS}" >> MCONFIG
+    echo "USE_GLIBC=1" >> MCONFIG
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -d ${D}${sbindir}
+    install -d ${D}${mandir}/man1
+    install -d ${D}${mandir}/man8
+    install -d ${D}${sysconfdir}/xinetd.d
+
+    sed -i 's/install -s/install/' rusers/Makefile
+    sed -i 's/install -s/install/' rup/Makefile
+    sed -i 's/install -s/install/' rpc.rusersd/Makefile
+
+    oe_runmake 'INSTALLROOT=${D}' 'BINMODE=0755' \
+    'DAEMONMODE=0755' 'MANMODE=0644' \
+    'BINDIR=${bindir}' 'SBINDIR=${sbindir}' \
+    'MANDIR=${mandir}' install
+
+    # create the xinetd config file  
+    cat >rusersd.conf <<EOF
+ service rusersd
+ {
+    disable     = yes
+    type        = RPC
+    rpc_version = 1-2
+    socket_type = dgram
+    protocol    = udp
+    wait        = yes
+    user        = root
+    server      = ${sbindir}/rpc.rusersd
+ }
+EOF
+    install rusersd.conf ${D}/${sysconfdir}/xinetd.d/rusersd
+}
+
+
+INSANE_SKIP_${PN} = "already-stripped"
+
+PACKAGES = "${PN}-client ${PN}-server ${PN}-doc ${BPN}-dbg"
+FILES_${PN}-client = "${bindir}/*"
+FILES_${PN}-server = "${sbindir}/* ${sysconfdir}"
+FILES_${PN}-doc = "${mandir}"
+FILES_${PN}-dbg = "${prefix}/src/debug \
+            ${bindir}/.debug ${sbindir}/.debug"
+
+RDEPENDS_${PN}-server = "tcp-wrappers xinetd rpcbind"
-- 
1.9.1


