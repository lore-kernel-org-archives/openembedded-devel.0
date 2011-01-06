Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1PapH3-00055R-81
	for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 13:49:01 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 908F4314C8B5;
	Thu,  6 Jan 2011 13:48:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id f2lCMzpTzIgg; Thu,  6 Jan 2011 13:48:31 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 7D522314BE42;
	Thu,  6 Jan 2011 13:48:30 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Thu, 06 Jan 2011 12:48:30 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Jan 2011 12:48:27 +0000
Message-Id: <1294318110-23521-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.2.3
Subject: [PATCH 1/4] python-wifi: add recipe for version 0.5.0
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
X-List-Received-Date: Thu, 06 Jan 2011 12:49:01 -0000

* package previously unpackaged files into -doc and -examples

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
CC: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/python/python-wifi_0.5.0.bb |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 recipes/python/python-wifi_0.5.0.bb

diff --git a/recipes/python/python-wifi_0.5.0.bb b/recipes/python/python-wifi_0.5.0.bb
new file mode 100644
index 0000000..faa3b43
--- /dev/null
+++ b/recipes/python/python-wifi_0.5.0.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "Provides access to Linux Wireless Extensions"
+HOMEPAGE = "http://pythonwifi.wikispot.org/"
+SECTION = "devel/python"
+LICENSE = "LGPLv2+"
+LICENSE_${PN}-examples = "GPLv2+"
+RDEPENDS_${PN} = "python-ctypes python-datetime"
+
+SRC_URI = "http://download.berlios.de/pythonwifi/${P}.tar.bz2"
+SRC_URI[md5sum] = "8fe7fd0a4edce1f9bedaff4acb7fd500"
+SRC_URI[sha256sum] = "3e3f645d37ab20450f60c785cec5f21b330f28a6c46c7c1b0898305dd7a34b26"
+
+inherit setuptools
+
+do_install_append() {
+        install -d ${D}${docdir}/${PN}
+        mv ${D}${datadir}/README ${D}${docdir}/${PN}
+        mv ${D}${datadir}/INSTALL ${D}${docdir}/${PN}
+        mv ${D}${datadir}/docs/* ${D}${docdir}/${PN}
+        install -d ${D}${sbindir}
+        mv ${D}${datadir}/examples/* ${D}${sbindir}
+}
+
+PACKAGES =+ "${PN}-examples"
+
+FILES_${PN}-examples = "${sbindir}"
-- 
1.7.2.3



