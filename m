Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C85BA65C68
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Aug 2014 09:42:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s789gttd014694
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 8 Aug 2014 02:42:55 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 8 Aug 2014 02:42:54 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Aug 2014 05:42:52 -0400
Message-ID: <1407490972-15320-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] syslog-ng: fix a multilib build failure and a QA issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Aug 2014 09:42:56 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* Use BPN instead of PN to fix the multilib build failure:
ERROR: Function failed: SYSTEMD_SERVICE_lib32-syslog-ng value
lib32-syslog-ng.service does not exist

* Do not add syslog-init for systemd to fix the QA issue:
WARNING: syslog-ng: alternative target (/etc/init.d/syslog or
/etc/init.d/syslog.syslog-ng) does not exist, skipping...
WARNING: syslog-ng: NOT adding alternative provide /etc/init.d/syslog:
/etc/init.d/syslog.syslog-ng does not exist
WARNING: alt_link == alt_target: /etc/init.d/syslog ==
/etc/init.d/syslog

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 3cedba6..57976b3 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -84,11 +84,17 @@ RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "",
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${PN}.service"
-
-ALTERNATIVE_${PN} = "syslog-init"
-ALTERNATIVE_PRIORITY[syslog-init] = "200"
-ALTERNATIVE_LINK_NAME[syslog-init] = "${sysconfdir}/init.d/syslog"
+SYSTEMD_SERVICE_${PN} = "${BPN}.service"
+
+# no syslog-init for systemd
+python () {
+    if 'sysvinit' in d.getVar("DISTRO_FEATURES", True).split():
+        pn = d.getVar('PN', True)
+        sysconfdir = d.getVar('sysconfdir', True)
+        d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-init')
+        d.setVarFlag('ALTERNATIVE_PRIORITY', 'syslog-init', '200')
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (sysconfdir))
+}
 
 INITSCRIPT_NAME = "syslog"
 INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 90 0 1 6 ."
-- 
2.0.0


