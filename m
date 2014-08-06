Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E394165C70
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 03:18:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s763IwE6012836
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 5 Aug 2014 20:18:59 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 5 Aug 2014 20:18:58 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 5 Aug 2014 23:18:56 -0400
Message-ID: <1407295136-11730-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsyslog: use syslog as the script name of syslog-init
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
X-List-Received-Date: Wed, 06 Aug 2014 03:19:01 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Use syslog as the default symlink and INITSCRIPT_NAME
just as sysklogd and syslog-ng did.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
index 3bb92fa..6ee571e 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
@@ -64,14 +64,14 @@ PACKAGECONFIG[gui] = "--enable-gui,--disable-gui,,"
 
 do_install_append() {
     install -d "${D}${sysconfdir}/init.d"
-    install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/rsyslogd
+    install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/syslog.${BPN}
     install -m 644 ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
     install -m 644 ${WORKDIR}/rsyslog.logrotate ${D}${sysconfdir}/logrotate.rsyslog
 }
 
 FILES_${PN} += "${bindir}"
 
-INITSCRIPT_NAME = "rsyslogd"
+INITSCRIPT_NAME = "syslog"
 INITSCRIPT_PARAMS = "defaults"
 
 # higher than sysklogd's 100
@@ -101,6 +101,5 @@ python () {
         pn = d.getVar('PN', True)
         sysconfdir = d.getVar('sysconfdir', True)
         d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-init')
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslogd' % (sysconfdir))
-        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-init', '%s/init.d/rsyslogd' % (sysconfdir))
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (sysconfdir))
 }
-- 
2.0.0


