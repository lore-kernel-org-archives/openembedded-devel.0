Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1U9tEP-0008U2-Iw
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Feb 2013 09:16:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1P5OJhF009408
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Feb 2013 21:24:19 -0800 (PST)
Received: from pek-usp-11.wrs.com (128.224.163.66) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 24 Feb 2013 21:24:17 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Feb 2013 13:24:11 +0800
Message-ID: <1361769851-28342-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Joe.MacDonald@windriver.com, Jackie.Huang@windriver.com,
	Zhenfeng.Zhao@windriver.com
Subject: [meta-networking][PATCH] ebtables: move ebtables-save to sbindir to avoid QA issue
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
X-List-Received-Date: Mon, 25 Feb 2013 08:16:22 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fix the QA issue:
WARNING: QA Issue: ebtables: Found a reference to /usr/ in
    /path/to/tmp/work/x86_64-wrs-linux/ebtables-2.0.10-4-r1/packages-split/ebtables/sbin/ebtables-save
WARNING: QA Issue: Shell scripts in base_bindir and base_sbindir should not reference anything in exec_prefix

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-filter/ebtables/ebtables_2.0.10-4.bb   |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index bca34c0..d6d803a 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -2,7 +2,7 @@ SUMMARY = "Utility for basic Ethernet frame filtering on a Linux bridge, MAC NAT
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=53b4a999993871a28ab1488fdbd2e73e"
 SECTION = "console/network"
-PR = "r1"
+PR = "r2"
 
 RDEPENDS_${PN} += "perl"
 
@@ -44,6 +44,11 @@ do_install () {
 	# Fix hardcoded paths in scripts
 	sed -i 's!/sbin/!${base_sbindir}/!g' ${D}/${sysconfdir}/init.d/ebtables
 	sed -i 's!/etc/!${sysconfdir}/!g' ${D}/${sysconfdir}/init.d/ebtables
+
+	# The script ebtables-save refernces perl in exec_prefix, so
+	# move it to sbindir to avoid QA issue
+	install -d ${D}/${sbindir}
+	mv ${D}/${base_sbindir}/ebtables-save ${D}/${sbindir}
 }
 
 CONFFILES_${PN} += "${sysconfdir}/default/ebtables"
-- 
1.7.4.1



