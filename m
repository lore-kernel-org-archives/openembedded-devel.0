Received: from smtp-68.nebula.fi ([83.145.220.68])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hbragge@dcombus.com>) id 1OelXj-0003kj-9n
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Jul 2010 11:06:18 +0200
Received: from lumikki.dcombus.lan (unknown [83.150.95.26])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-68.nebula.fi (Postfix) with ESMTP id 3E0D943F0A57;
	Fri, 30 Jul 2010 12:03:51 +0300 (EEST)
Received: from hbragge by lumikki.dcombus.lan with local (Exim 4.69)
	(envelope-from <hbragge@lumikki.dcombus.lan>)
	id 1OelVP-0004DB-49; Fri, 30 Jul 2010 12:03:51 +0300
From: henri.bragge@dcombus.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jul 2010 12:03:51 +0300
Message-Id: <1280480631-23360-2-git-send-email-henri.bragge@dcombus.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1280480631-23360-1-git-send-email-henri.bragge@dcombus.com>
References: <1280480631-23360-1-git-send-email-henri.bragge@dcombus.com>
X-SA-Exim-Connect-IP: 83.145.220.68
X-SA-Exim-Mail-From: hbragge@dcombus.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] recipe for scli-0.4.0
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
X-List-Received-Date: Fri, 30 Jul 2010 09:06:18 -0000

From: Henri Bragge <henri.bragge@dcombus.com>

Signed-off-by: Henri Bragge <henri.bragge@dcombus.com>
---
 recipes/scli/scli.inc    |    6 ++++++
 recipes/scli/scli_svn.bb |    8 ++++++++
 2 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 recipes/scli/scli.inc
 create mode 100644 recipes/scli/scli_svn.bb

diff --git a/recipes/scli/scli.inc b/recipes/scli/scli.inc
new file mode 100644
index 0000000..abe341d
--- /dev/null
+++ b/recipes/scli/scli.inc
@@ -0,0 +1,6 @@
+DESCRIPTION = "SNMP Command Line Interface"
+LICENSE = "GPLv2"
+SECTION = "console/network"
+DEPENDS = "gsnmp readline libxml2 ncurses"
+
+inherit autotools
diff --git a/recipes/scli/scli_svn.bb b/recipes/scli/scli_svn.bb
new file mode 100644
index 0000000..45bd08e
--- /dev/null
+++ b/recipes/scli/scli_svn.bb
@@ -0,0 +1,8 @@
+require scli.inc
+
+SRCREV = "3285"
+PV = "0.4.0+svnr${SRCREV}"
+PR = "r1"
+
+SRC_URI = "svn://cnds.eecs.jacobs-university.de/svn/schoenw/src/scli;module=trunk;proto=https"
+S = "${WORKDIR}/trunk"
-- 
1.5.6.5



