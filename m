Received: from smtp-68.nebula.fi ([83.145.220.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hbragge@dcombus.com>) id 1Ogw4G-0008U3-4B
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 10:44:54 +0200
Received: from lumikki.dcombus.lan (unknown [83.150.95.26])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-68.nebula.fi (Postfix) with ESMTP id 0969A43F021E;
	Thu,  5 Aug 2010 11:44:42 +0300 (EEST)
Received: from hbragge by lumikki.dcombus.lan with local (Exim 4.69)
	(envelope-from <hbragge@lumikki.dcombus.lan>)
	id 1Ogw49-0001Zm-TD; Thu, 05 Aug 2010 11:44:41 +0300
From: Henri Bragge <henri.bragge@dcombus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Aug 2010 11:44:40 +0300
Message-Id: <1280997881-6037-1-git-send-email-henri.bragge@dcombus.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <AANLkTik=Xm39yJcLnLH12heRyvS0gUEvSwFCJMBtWeLi@mail.gmail.com>
References: <AANLkTik=Xm39yJcLnLH12heRyvS0gUEvSwFCJMBtWeLi@mail.gmail.com>
X-SA-Exim-Connect-IP: 83.145.220.68
X-SA-Exim-Mail-From: hbragge@dcombus.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3 1/2] recipe for gsnmp-0.3.0
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
X-List-Received-Date: Thu, 05 Aug 2010 08:45:00 -0000


Signed-off-by: Henri Bragge <henri.bragge@dcombus.com>
---
 recipes/gsnmp/gsnmp_0.3.0.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gsnmp/gsnmp_0.3.0.bb

diff --git a/recipes/gsnmp/gsnmp_0.3.0.bb b/recipes/gsnmp/gsnmp_0.3.0.bb
new file mode 100644
index 0000000..b191762
--- /dev/null
+++ b/recipes/gsnmp/gsnmp_0.3.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "SNMP library written on top of glib and gnet."
+SECTION = "libs/network"
+LICENSE = "GPLv2"
+DEPENDS = "glib-2.0 gnet"
+PR = "r0"
+
+SRC_URI = "ftp://ftp.ibr.cs.tu-bs.de/local/gsnmp/gsnmp-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "466699c11b70e18a04d51388b8f89f1c"
+SRC_URI[sha256sum] = "e428b61071b8ba2971fc8737ed2987210b04a71ffde307900df12c06a0bed0f9"
+
+inherit autotools pkgconfig
-- 
1.5.6.5



