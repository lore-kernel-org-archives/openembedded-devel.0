Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1TQj3U-0004xy-PJ
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Oct 2012 20:18:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9NI4oDk006339
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Oct 2012 11:04:53 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 23 Oct 2012 11:04:50 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Oct 2012 14:04:50 -0400
Message-ID: <1351015490-14442-1-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] traceroute: Add from OE-Classic, uprev and update
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
X-List-Received-Date: Tue, 23 Oct 2012 18:18:21 -0000
Content-Type: text/plain

Uprev traceroute from 2.0.12 in OE-Classic to 2.0.18.

Update SUMMERY, DESCRIPTION, LICENSE, LIC_FILES_CHKSUM, update do_install
to be similar Fedora rpm spec files, and update update alternatives to use
the update alteratives class.

Signed-off-by: Morgan Little <morgan.little@windriver.com>
---
 .../traceroute/traceroute_2.0.18.bb                |   43 ++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
new file mode 100644
index 0000000..719d9fb
--- /dev/null
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
@@ -0,0 +1,43 @@
+SUMMARY = "A new modern implementation of traceroute(8) utility for Linux systems"
+DESCRIPTION = "The traceroute utility displays the route used by IP packets on \
+their way to a specified network (or Internet) host.  Traceroute displays \
+the IP number and host name (if possible) of the machines along the \
+route taken by the packets.  Traceroute is used as a network debugging \
+tool.  If you're having network connectivity problems, traceroute will \
+show you where the trouble is coming from along the route."
+SECTION = "console/network"
+HOMEPAGE = "http://traceroute.sourceforge.net/"
+LICENSE = "GPL-2.0 LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff"
+
+inherit update-alternatives
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/traceroute-2.0.18/traceroute-2.0.18.tar.gz \
+          "
+
+SRC_URI[md5sum] = "b7254149b7f081cce07f4b9e065ba5ef"
+SRC_URI[sha256sum] = "5994a88520927fefe3c9754aaf1e02b4d0f3f8fb1f521a68fa86215c3fcab9ef"
+
+do_compile() {
+    export LDFLAGS="${TARGET_LDFLAGS} -L${S}/libsupp"
+    oe_runmake "env=yes"
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m755 ${PN}/${PN} ${D}${bindir}
+
+    install -m755 wrappers/tcptraceroute ${D}${bindir}
+
+    install -d ${D}${mandir}
+    install -p -m644 ${PN}/${PN}.8 ${D}${mandir}
+    pushd ${D}${mandir}
+    ln -s ${PN}.8 ${PN}6.8
+    ln -s ${PN}.8 tcptraceroute.8
+    popd
+
+}
+
+ALTERNATIVE_${PN} = "traceroute6"
+ALTERNATIVE_LINK_NAME[traceroute6] = "${bindir}/traceroute"
-- 
1.7.0.4



