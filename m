Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 651C2731F7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 09:38:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0R9c2er010263
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 01:38:03 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 27 Jan 2016 01:38:02 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jan 2016 17:36:51 +0800
Message-ID: <1453887411-6981-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] netkit-telnet: Add to generate telnetlogin.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jan 2016 09:38:02 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Add oe_runmake line for telnetlogin to make the telnetlogin
folder to be built.
* Add FILES_${PN} line to let ${libdir}/telnetlogin to be
included in netkit-telnet package.
* Customize "install -D -m 4750 ${B}/telnetlogin/telnetlogin
${D}/${libdir}/telnetlogin" to let the telnetlogin to be
installed under /usr/lib64 on 64bit system.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index 0806518..9438adc 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -25,6 +25,7 @@ do_configure () {
 do_compile () {
     oe_runmake 'CC=${CC}' 'LD=${LD}' 'LDFLAGS=${LDFLAGS}' SUB=telnet
     oe_runmake 'CC=${CC}' 'LD=${LD}' 'LDFLAGS=${LDFLAGS}' LIBS=-lutil SUB=telnetd
+    oe_runmake 'CC=${CC}' 'LD=${LD}' 'LDFLAGS=${LDFLAGS}' SUB=telnetlogin
 }
 
 do_install () {
@@ -36,6 +37,7 @@ do_install () {
     install -d ${D}${mandir}/man8
     oe_runmake SUB=telnetd install
     rm -rf ${D}${mandir}/man1
+    install -D -m 4750 ${B}/telnetlogin/telnetlogin ${D}/${libdir}/telnetlogin
     # fix up hardcoded paths
     sed -i -e 's,/usr/sbin/,${sbindir}/,' ${WORKDIR}/telnet-xinetd
     install -d  ${D}/etc/xinetd.d/
@@ -54,3 +56,4 @@ pkg_prerm_${PN} () {
 
 SRC_URI[md5sum] = "d6beabaaf53fe6e382c42ce3faa05a36"
 SRC_URI[sha256sum] = "9c80d5c7838361a328fb6b60016d503def9ce53ad3c589f3b08ff71a2bb88e00"
+FILES_${PN} += "${sbindir}/in.* ${libdir}/* ${sysconfdir}/xinetd.d/*"
-- 
1.9.1


