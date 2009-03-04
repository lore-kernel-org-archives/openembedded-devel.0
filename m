Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hrw@juszkiewicz.com.pl>) id 1Letb2-0005fB-KA
	for openembedded-devel@openembedded.org; Wed, 04 Mar 2009 17:05:24 +0100
Received: (qmail 27007 invoked by uid 813007); 4 Mar 2009 15:53:51 -0000
X-clamdmail: clamdmail 0.18a
Received: from 89.78.173.235 (HELO localhost)
	(smtp?user@juszkiewicz.com.pl@89.78.173.235)
	by 195.149.226.213 with ESMTPA; 4 Mar 2009 15:53:51 -0000
Received: from hrw by localhost with local (Exim 4.69)
	(envelope-from <hrw@hrw.one.pl>)
	id 1LetPk-0001Dp-FB; Wed, 04 Mar 2009 16:53:44 +0100
From: Marcin Juszkiewicz <openembedded@haerwu.biz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Mar 2009 16:52:39 +0100
Message-Id: <1236182004-4523-25-git-send-email-openembedded@haerwu.biz>
X-Mailer: git-send-email 1.6.1.3
In-Reply-To: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
References: <1236182004-4523-1-git-send-email-openembedded@haerwu.biz>
Cc: Marcin Juszkiewicz <hrw@openedhand.com>
Subject: [PATCH 24/70] yum: added 3.2.18 (from Poky)
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
X-List-Received-Date: Wed, 04 Mar 2009 16:05:25 -0000

From: Marcin Juszkiewicz <hrw@openedhand.com>

git-svn-id: https://svn.o-hand.com/repos/poky@5379 311d38ba-8fff-0310-9ca6-ca027cbcb966
---
 .../yum/{yum-native => files}/extract-postinst.awk |    0
 packages/yum/{yum-native => files}/hacks.patch     |    0
 packages/yum/{yum-native => files}/paths.patch     |    0
 .../yum-install-recommends.py                      |    0
 packages/yum/yum_3.2.18.bb                         |   24 ++++++++++++++++++++
 5 files changed, 24 insertions(+), 0 deletions(-)
 rename packages/yum/{yum-native => files}/extract-postinst.awk (100%)
 rename packages/yum/{yum-native => files}/hacks.patch (100%)
 rename packages/yum/{yum-native => files}/paths.patch (100%)
 rename packages/yum/{yum-native => files}/yum-install-recommends.py (100%)
 create mode 100644 packages/yum/yum_3.2.18.bb

diff --git a/packages/yum/yum-native/extract-postinst.awk b/packages/yum/files/extract-postinst.awk
similarity index 100%
rename from packages/yum/yum-native/extract-postinst.awk
rename to packages/yum/files/extract-postinst.awk
diff --git a/packages/yum/yum-native/hacks.patch b/packages/yum/files/hacks.patch
similarity index 100%
rename from packages/yum/yum-native/hacks.patch
rename to packages/yum/files/hacks.patch
diff --git a/packages/yum/yum-native/paths.patch b/packages/yum/files/paths.patch
similarity index 100%
rename from packages/yum/yum-native/paths.patch
rename to packages/yum/files/paths.patch
diff --git a/packages/yum/yum-native/yum-install-recommends.py b/packages/yum/files/yum-install-recommends.py
similarity index 100%
rename from packages/yum/yum-native/yum-install-recommends.py
rename to packages/yum/files/yum-install-recommends.py
diff --git a/packages/yum/yum_3.2.18.bb b/packages/yum/yum_3.2.18.bb
new file mode 100644
index 0000000..67e9ad7
--- /dev/null
+++ b/packages/yum/yum_3.2.18.bb
@@ -0,0 +1,24 @@
+HOMEPAGE = "http://linux.duke.edu/projects/yum/"
+
+SRC_URI = "http://linux.duke.edu/projects/yum/download/3.2/yum-${PV}.tar.gz \
+           file://hacks.patch;patch=1 \
+           file://paths.patch;patch=1 \
+	   file://yum-install-recommends.py \
+	   file://extract-postinst.awk"
+
+DEPENDS = "rpm python python-iniparse python-urlgrabber yum-metadata-parser libxml2"
+
+S = "${WORKDIR}/yum-${PV}"
+
+inherit autotools
+
+do_compile_append () {
+	sed -e 's#!/usr/bin/python#!${bindir}/python#' -e 's#/usr/share#${datadir}#' -i ${S}/bin/yum.py
+	sed -e 's#!/usr/bin/python#!${bindir}/python#' -e 's#/usr/share#${datadir}#' -i ${S}/bin/yum-updatesd.py
+}
+
+do_install_append () {
+	install -d ${D}${bindir}/
+	install ${WORKDIR}/extract-postinst.awk ${D}${bindir}/
+	install ${WORKDIR}/yum-install-recommends.py ${D}${bindir}/
+}
-- 
1.6.1.3





