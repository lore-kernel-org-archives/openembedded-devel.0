Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1M9kOU-00009Q-2B
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 May 2009 20:31:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id C91754C678A;
	Thu, 28 May 2009 14:23:37 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10771-10; Thu, 28 May 2009 14:23:37 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 1A63945CF84; Thu, 28 May 2009 14:23:37 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 4B0514C67BB;
	Thu, 28 May 2009 14:23:33 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 3A3491B48AE; Thu, 28 May 2009 14:23:33 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 May 2009 14:23:33 -0400
Message-Id: <1243535013-10090-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1243535013-10090-1-git-send-email-msmith@cbnco.com>
References: <1243535013-10090-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH 2/2] tcpdump 4.0.0-r2: remove extra ${sbindir}/tcpdump.4.0.0
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
X-List-Received-Date: Thu, 28 May 2009 18:32:01 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 recipes/tcpdump/tcpdump_4.0.0.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes/tcpdump/tcpdump_4.0.0.bb b/recipes/tcpdump/tcpdump_4.0.0.bb
index c807fb1..a9e8a0d 100644
--- a/recipes/tcpdump/tcpdump_4.0.0.bb
+++ b/recipes/tcpdump/tcpdump_4.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD"
 SECTION = "console/network"
 PRIORITY = "optional"
 DEPENDS = "libpcap"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.tcpdump.org/release/tcpdump-${PV}.tar.gz \
            file://tcpdump_configure_no_-O2.patch;patch=1 \
@@ -23,3 +23,8 @@ do_configure() {
 	sed -i 's:/usr/lib:${STAGING_LIBDIR}:' ./Makefile
 	sed -i 's:/usr/include:${STAGING_INCDIR}:' ./Makefile
 }
+
+do_install_append() {
+	# tcpdump 4.0.0 installs a copy to /usr/sbin/tcpdump.4.0.0
+	rm -f ${D}${sbindir}/tcpdump.${PV}
+}
-- 
1.5.6.5



