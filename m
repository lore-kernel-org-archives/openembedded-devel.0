Return-Path: <jake42@rommel.stw.uni-erlangen.de>
Received: from sheldon.rommel.stw.uni-erlangen.de
	(mail.rommel.stw.uni-erlangen.de [131.188.24.4])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7586E306
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2014 15:38:20 +0000 (UTC)
Received: from rommel-9-145.rommel.stw.uni-erlangen.de ([172.17.9.145]
	helo=ahorn.rommel.stw.uni-erlangen.de)
	by sheldon.rommel.stw.uni-erlangen.de with esmtpsa
	(TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256) (Exim 4.80)
	(envelope-from <jake42@rommel.stw.uni-erlangen.de>)
	id 1W2jam-00049b-G3; Mon, 13 Jan 2014 16:38:20 +0100
From: Jakob Drexel <jake42@rommel.stw.uni-erlangen.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Jan 2014 16:38:12 +0100
Message-Id: <1389627492-4327-2-git-send-email-jake42@rommel.stw.uni-erlangen.de>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1389627492-4327-1-git-send-email-jake42@rommel.stw.uni-erlangen.de>
References: <1389627492-4327-1-git-send-email-jake42@rommel.stw.uni-erlangen.de>
Subject: [meta-oe][PATCH 2/2] pidgin: Add pidgin-otr recipe and patch to fix configure-issue
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
X-List-Received-Date: Mon, 13 Jan 2014 15:38:20 -0000

---
 .../ignore_extra-portability_warnings.patch           | 11 +++++++++++
 meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb    | 19 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-support/pidgin/pidgin-otr/ignore_extra-portability_warnings.patch
 create mode 100644 meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb

diff --git a/meta-oe/recipes-support/pidgin/pidgin-otr/ignore_extra-portability_warnings.patch b/meta-oe/recipes-support/pidgin/pidgin-otr/ignore_extra-portability_warnings.patch
new file mode 100644
index 0000000..a81b6e7
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/pidgin-otr/ignore_extra-portability_warnings.patch
@@ -0,0 +1,11 @@
+--- a/configure.ac	2012-09-01 17:03:19.000000000 +0200
++++ b/configure.ac	2014-01-12 21:59:24.920300215 +0100
+@@ -4,7 +4,7 @@
+ 
+ AM_CONFIG_HEADER(config.h)
+ 
+-AM_INIT_AUTOMAKE([-Wall -Werror])
++AM_INIT_AUTOMAKE([-Wall -Werror -Wno-extra-portability])
+ 
+ AC_PROG_CC
+ 
diff --git a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
new file mode 100644
index 0000000..d8f9fdd
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "(OTR) Messaging allows you to have private conversations over instant messaging"
+HOMEPAGE = "http://www.cypherpunks.ca/otr/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=92fe174bad6da3763f6e9e9eaff6df24"
+DEPENDS = "libgcrypt libotr pidgin"
+
+SRC_URI = "http://www.cypherpunks.ca/otr/${P}.tar.gz \
+           file://ignore_extra-portability_warnings.patch;apply=yes \
+"
+
+SRC_URI[md5sum] = "eadb953376acc474e56041d4c12aa2c8"
+SRC_URI[sha256sum] = "d56b3f092dbe9ee6597641c7d2dd294884dc04ba47aaf4ec571cd54977df4691"
+
+
+FILES_${PN} = "${libdir}/pidgin/*"
+FILES_${PN}-dbg = "${libdir}/pidgin/.debug"
+FILES_${PN}-dbg += "${libdir}/pidgin/.debug/pidgin-otr.so"
+FILES_${PN}-dbg += "/usr/src/debug/pidgin-otr/${PV}-${PR}/${P}/*"
+inherit autotools pkgconfig
-- 
1.8.3.2


