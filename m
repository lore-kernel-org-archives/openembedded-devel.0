Received: from smtp-68.nebula.fi ([83.145.220.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hbragge@dcombus.com>) id 1OgbRL-00073S-IO
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 12:43:28 +0200
Received: from lumikki.dcombus.lan (unknown [83.150.95.26])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-68.nebula.fi (Postfix) with ESMTP id 9DE5C43F06A5;
	Wed,  4 Aug 2010 13:43:10 +0300 (EEST)
Received: from hbragge by lumikki.dcombus.lan with local (Exim 4.69)
	(envelope-from <hbragge@lumikki.dcombus.lan>)
	id 1OgbRG-0000ZN-GS; Wed, 04 Aug 2010 13:43:10 +0300
From: Henri Bragge <henri.bragge@dcombus.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Aug 2010 13:43:09 +0300
Message-Id: <1280918590-5969-2-git-send-email-henri.bragge@dcombus.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1280918590-5969-1-git-send-email-henri.bragge@dcombus.com>
References: <1280918590-5969-1-git-send-email-henri.bragge@dcombus.com>
X-SA-Exim-Connect-IP: 83.145.220.68
X-SA-Exim-Mail-From: hbragge@dcombus.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] recipe for gsnmp-0.3.0
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
X-List-Received-Date: Wed, 04 Aug 2010 10:43:35 -0000
X-List-Received-Date: Wed, 04 Aug 2010 10:43:35 -0000

Signed-off-by: Henri Bragge <henri.bragge@dcombus.com>
---
 recipes/gsnmp/gsnmp.inc    |    6 ++++++
 recipes/gsnmp/gsnmp_svn.bb |    8 ++++++++
 2 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gsnmp/gsnmp.inc
 create mode 100644 recipes/gsnmp/gsnmp_svn.bb

diff --git a/recipes/gsnmp/gsnmp.inc b/recipes/gsnmp/gsnmp.inc
new file mode 100644
index 0000000..66e88cc
--- /dev/null
+++ b/recipes/gsnmp/gsnmp.inc
@@ -0,0 +1,6 @@
+DESCRIPTION = "SNMP library written on top of glib and gnet."
+LICENSE = "GPLv2"
+SECTION = "libs/network"
+DEPENDS = "glib-2.0 gnet"
+
+inherit autotools pkgconfig
diff --git a/recipes/gsnmp/gsnmp_svn.bb b/recipes/gsnmp/gsnmp_svn.bb
new file mode 100644
index 0000000..ed27bb6
--- /dev/null
+++ b/recipes/gsnmp/gsnmp_svn.bb
@@ -0,0 +1,8 @@
+require gsnmp.inc
+
+SRCREV = "3372"
+PV = "0.3.0+svnr${SRCREV}"
+PR = "r1"
+
+SRC_URI = "svn://cnds.eecs.jacobs-university.de/svn/schoenw/src/gsnmp;module=trunk;proto=https"
+S = "${WORKDIR}/trunk"
-- 
1.5.6.5



