Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1OozaC-0008T3-15
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 16:07:04 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 53817491284
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 15:48:42 +0200 (CEST)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 27 Aug 2010 15:48:42 +0200
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10000)
	id DEF5A72078; Fri, 27 Aug 2010 15:48:41 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Aug 2010 15:48:26 +0200
Message-Id: <1282916906-21411-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.6.4.2
X-OriginalArrivalTime: 27 Aug 2010 13:48:42.0502 (UTC)
	FILETIME=[8FAA3260:01CB45EE]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] rsyslog: keep rsyslog running as long as possible on shutdown
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
X-List-Received-Date: Fri, 27 Aug 2010 14:07:04 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/rsyslog/rsyslog.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/rsyslog/rsyslog.inc b/recipes/rsyslog/rsyslog.inc
index a3bd125..e66e971 100644
--- a/recipes/rsyslog/rsyslog.inc
+++ b/recipes/rsyslog/rsyslog.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Rsyslog is an enhanced multi-threaded syslogd"
 DEPENDS = "zlib"
 HOMEPAGE = "http://www.rsyslog.com/"
 LICENSE = "GPLv3"
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.tar.gz \
           file://rsyslog.conf \
@@ -60,3 +60,4 @@ pkg_postrm_${PN} () {
 CONFFILES_${PN} = "${sysconfdir}/rsyslog.conf"
 
 INITSCRIPT_NAME = "syslog"
+INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 90 0 1 6 ."
-- 
1.6.4.2



