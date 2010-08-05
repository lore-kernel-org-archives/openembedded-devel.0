Received: from smtp-68.nebula.fi ([83.145.220.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hbragge@dcombus.com>) id 1Ogw4G-0008U4-AL
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 10:44:59 +0200
Received: from lumikki.dcombus.lan (unknown [83.150.95.26])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-68.nebula.fi (Postfix) with ESMTP id 0B3C143F13CD;
	Thu,  5 Aug 2010 11:44:42 +0300 (EEST)
Received: from hbragge by lumikki.dcombus.lan with local (Exim 4.69)
	(envelope-from <hbragge@lumikki.dcombus.lan>)
	id 1Ogw49-0001Zo-Tr; Thu, 05 Aug 2010 11:44:41 +0300
From: Henri Bragge <henri.bragge@dcombus.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Aug 2010 11:44:41 +0300
Message-Id: <1280997881-6037-2-git-send-email-henri.bragge@dcombus.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1280997881-6037-1-git-send-email-henri.bragge@dcombus.com>
References: <AANLkTik=Xm39yJcLnLH12heRyvS0gUEvSwFCJMBtWeLi@mail.gmail.com>
	<1280997881-6037-1-git-send-email-henri.bragge@dcombus.com>
X-SA-Exim-Connect-IP: 83.145.220.68
X-SA-Exim-Mail-From: hbragge@dcombus.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH v3 2/2] recipe for scli-0.4.0
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
 recipes/scli/scli_0.4.0.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes/scli/scli_0.4.0.bb

diff --git a/recipes/scli/scli_0.4.0.bb b/recipes/scli/scli_0.4.0.bb
new file mode 100644
index 0000000..3d24910
--- /dev/null
+++ b/recipes/scli/scli_0.4.0.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "SNMP Command Line Interface"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+DEPENDS = "gsnmp readline libxml2 ncurses"
+PR = "r0"
+
+SRC_URI = "ftp://ftp.ibr.cs.tu-bs.de/pub/local/scli/scli-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "486c92c76059a35c87e88edf24cbf804"
+SRC_URI[sha256sum] = "308511589260d3da9bc5817ace363180070ac83ccba9231b7b9a01e1b0c29fe1"
+
+inherit autotools
-- 
1.5.6.5



