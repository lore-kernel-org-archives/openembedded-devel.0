Return-Path: <eduardas.m@fods.com>
Received: from pastas.balt.net (lex.balt.net [217.117.28.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3D7DB79456
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Dec 2018 15:33:01 +0000 (UTC)
Received: from eduardas-HP-EliteDesk-800-G2-TWR.lifodas.local (unknown
	[213.197.143.19]) (Authenticated sender: eduardas.m@fods.com)
	by pastas.balt.net (Postfix) with ESMTPA id 3A054478A0
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Dec 2018 17:33:02 +0200 (EET)
From: Eduardas Meile <eduardas.m@fods.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Dec 2018 17:33:00 +0200
Message-Id: <20181206153300.402-1-eduardas.m@fods.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-openembedded][PATCHv2] mksh: add version 56
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
X-List-Received-Date: Thu, 06 Dec 2018 15:33:02 -0000

The MirBSD Korn Shell is a permissively licensed shell currently used
by Android.

Signed-off-by: Eduardas Meile <eduardas.m@fods.com>
---
 meta-oe/recipes-shells/mksh/mksh_56.bb | 36 ++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-shells/mksh/mksh_56.bb

diff --git a/meta-oe/recipes-shells/mksh/mksh_56.bb b/meta-oe/recipes-shells/mksh/mksh_56.bb
new file mode 100644
index 000000000..324b5b611
--- /dev/null
+++ b/meta-oe/recipes-shells/mksh/mksh_56.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "The MirBSD Korn Shell - an enhanced version of the public domain ksh"
+HOMEPAGE = "http://www.mirbsd.org/mksh.htm"
+SECTION = "base/shell"
+
+LICENSE = "${@bb.utils.contains("TCLIBC", "glibc", "MirOS & ISC", "MirOS", d)}"
+LIC_FILES_CHKSUM = "file://main.c;beginline=6;endline=25;md5=7204fec4d12912f2a13fe8745bc356f9 \
+                    file://strlcpy.c;beginline=1;endline=17;md5=d953f28f0c43ee29e238ec9bc15df2a0 \
+                   "
+
+SRC_URI = "http://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R56c.tgz"
+
+SRC_URI[md5sum] = "4799a9ac6d55871d79ba66713d928663"
+SRC_URI[sha256sum] = "dd86ebc421215a7b44095dc13b056921ba81e61b9f6f4cdab08ca135d02afb77"
+
+inherit update-alternatives
+
+S = "${WORKDIR}/${PN}"
+
+ALTERNATIVE_${PN} = "sh"
+ALTERNATIVE_LINK_NAME[sh] = "${base_bindir}/sh"
+ALTERNATIVE_TARGET[sh] = "${base_bindir}/${BPN}"
+ALTERNATIVE_PRIORITY = "100"
+
+do_compile() {
+    sh ${S}/Build.sh -r
+}
+
+do_install() {
+    install -d ${D}${base_bindir}
+    install -m 0755 ${S}/mksh ${D}${base_bindir}/mksh
+
+    install -d ${D}${sysconfdir}/skel
+    install -m 0644 ${S}/dot.mkshrc ${D}${sysconfdir}/skel/.mkshrc
+}
+
+RPROVIDES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '/bin/sh', '', d)}"
-- 
2.17.1


