Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
 by mx.groups.io with SMTP id smtpd.web10.6720.1628069127748455427
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 02:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: pengutronix.de, ip: 85.220.165.71, mailfrom: has@pengutronix.de)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <has@pengutronix.de>)
	id 1mBD9S-0005WR-5t; Wed, 04 Aug 2021 11:25:26 +0200
Received: from has by dude02.hi.pengutronix.de with local (Exim 4.92)
	(envelope-from <has@pengutronix.de>)
	id 1mBD9R-0003i6-Tc; Wed, 04 Aug 2021 11:25:25 +0200
From: "Holger Assmann" <h.assmann@pengutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Holger Assmann <h.assmann@pengutronix.de>
Subject: [meta-python][hardknott][PATCH] python3-janus: introduce new recipe
Date: Wed,  4 Aug 2021 11:19:00 +0200
Message-Id: <20210804091900.7640-1-h.assmann@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: has@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-devel@lists.openembedded.org
Content-Transfer-Encoding: 8bit

Signed-off-by: Holger Assmann <h.assmann@pengutronix.de>
---
 .../recipes-devtools/python/python3-janus_0.6.1.bb    | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-janus_0.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-janus_0.6.1.bb b/meta-python/recipes-devtools/python/python3-janus_0.6.1.bb
new file mode 100644
index 000000000000..83630eceb4e6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-janus_0.6.1.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Mixed sync-async queue to interoperate between asyncio tasks and classic threads"
+HOMEPAGE = "https://pypi.org/project/janus/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=23878c357ebb4c8ce1109be365043349"
+
+SRC_URI[sha256sum] = "4712e0ef75711fe5947c2db855bc96221a9a03641b52e5ae8e25c2b705dd1d0c"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "${PYTHON_PN}-asyncio ${PYTHON_PN}-core ${PYTHON_PN}-threading"
-- 
2.25.1

