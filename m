Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sledz@dresearch.de>) id 1P4Bjn-0006W0-FF
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 14:07:56 +0200
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 1016B491287;
	Fri,  8 Oct 2010 14:07:27 +0200 (CEST)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 8 Oct 2010 14:07:26 +0200
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10000)
	id 7BA317207E; Fri,  8 Oct 2010 14:07:26 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Oct 2010 14:07:20 +0200
Message-Id: <1286539640-9333-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.7.1
X-OriginalArrivalTime: 08 Oct 2010 12:07:26.0736 (UTC)
	FILETIME=[5F936100:01CB66E1]
X-SA-Exim-Connect-IP: 87.193.137.100
X-SA-Exim-Mail-From: sledz@dresearch.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] syslog-ng: increase u-a priority to 200
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
X-List-Received-Date: Fri, 08 Oct 2010 12:07:58 -0000

Priority for update-alternatives was 50 before which was the
same like the one for busybox-syslog. Resulting order now is:

* 300 rsyslogd
* 200 syslog-ng
* 100 sysklogd
* 50 busybox-syslog

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/syslog-ng/syslog-ng.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/syslog-ng/syslog-ng.inc b/recipes/syslog-ng/syslog-ng.inc
index fbe9adf..e58f1ea 100644
--- a/recipes/syslog-ng/syslog-ng.inc
+++ b/recipes/syslog-ng/syslog-ng.inc
@@ -22,7 +22,7 @@ do_install_append() {
 CONFFILES_${PN} = "${sysconfdir}/${PN}.conf"
 
 pkg_postinst_${PN} () {
-        update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 50
+        update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 200
 
         if test "x$D" != "x"; then
                 OPT="-r $D"
-- 
1.7.1



