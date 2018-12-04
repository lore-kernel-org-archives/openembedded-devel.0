Return-Path: <eduardas.m@fods.com>
X-Greylist: delayed 1971 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 04 Dec 2018 13:33:38 UTC
Received: from pastas.balt.net (pastas.balt.net [217.117.28.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5E6816C50C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2018 13:33:38 +0000 (UTC)
Received: from eduardas-HP-EliteDesk-800-G2-TWR.lifodas.local (unknown
	[213.197.143.19]) (Authenticated sender: eduardas.m@fods.com)
	by pastas.balt.net (Postfix) with ESMTPA id 82E4E1DDAB
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Dec 2018 15:00:46 +0200 (EET)
From: Eduardas Meile <eduardas.m@fods.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2018 15:00:48 +0200
Message-Id: <20181204130048.19432-1-eduardas.m@fods.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.4 at neptunas1.balt.net
X-Virus-Status: Clean
Subject: [PATCH 1/1] Add MirBSD Korn Shell recipe
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
X-List-Received-Date: Tue, 04 Dec 2018 13:33:39 -0000

---
 meta-oe/recipes-shells/mksh/mksh_56.bb | 34 ++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-shells/mksh/mksh_56.bb

diff --git a/meta-oe/recipes-shells/mksh/mksh_56.bb b/meta-oe/recipes-shells/mksh/mksh_56.bb
new file mode 100644
index 000000000..2ddcc6607
--- /dev/null
+++ b/meta-oe/recipes-shells/mksh/mksh_56.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "The MirBSD Korn Shell - an enhanced version of the public domain ksh"
+HOMEPAGE = "http://www.mirbsd.org/mksh.htm"
+SECTION = "base/shell"
+
+LICENSE = "MirOS & ISC"
+LIC_FILES_CHKSUM = "file://main.c;beginline=6;endline=25;md5=7204fec4d12912f2a13fe8745bc356f9 \
+                    file://strlcpy.c;beginline=1;endline=17;md5=d953f28f0c43ee29e238ec9bc15df2a0 \
+                   "
+
+SRC_URI = "http://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R56c.tgz"
+
+SRC_URI[md5sum] = "4799a9ac6d55871d79ba66713d928663"
+SRC_URI[sha256sum] = "dd86ebc421215a7b44095dc13b056921ba81e61b9f6f4cdab08ca135d02afb77"
+
+inherit autotools update-alternatives
+
+S = "${WORKDIR}/${PN}"
+
+ALTERNATIVE_${PN} = "sh"
+ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
+ALTERNATIVE_TARGET[sh] = "${base_bindir}/${BPN}"
+ALTERNATIVE_PRIORITY = "100"
+
+do_compile() {
+    chmod +x ${S}/Build.sh
+    ${S}/Build.sh
+}
+
+do_install() {
+    install -d ${D}${base_bindir}
+    install -m 0755 ${S}/mksh ${D}${base_bindir}/mksh
+}
+
+RPROVIDES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sh', '', d)}"
-- 
2.17.1


