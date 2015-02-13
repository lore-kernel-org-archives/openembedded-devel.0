Return-Path: <sledz@dresearch-fe.de>
X-Greylist: delayed 412 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 13 Feb 2015 17:09:47 UTC
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id BD8F07066B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 17:09:47 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 9B2A6E009D;
	Fri, 13 Feb 2015 18:02:54 +0100 (CET)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id 1E84B7001FF; Fri, 13 Feb 2015 18:02:53 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Feb 2015 18:02:40 +0100
Message-Id: <1423846960-4749-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 2.3.0
Subject: [PATCH] rsyslog: fix name of syslogd ua group
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
X-List-Received-Date: Fri, 13 Feb 2015 17:09:51 -0000

All the other syslogd implementations use syslogd for this. So rsyslogd
should use this too.

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
index 422def3..5ab6a30 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_7.4.4.bb
@@ -127,10 +127,10 @@ INITSCRIPT_PARAMS = "defaults"
 # higher than sysklogd's 100
 ALTERNATIVE_PRIORITY = "110"
 
-ALTERNATIVE_${PN} = "rsyslogd syslog-conf syslog-logrotate"
+ALTERNATIVE_${PN} = "syslogd syslog-conf syslog-logrotate"
 
-ALTERNATIVE_LINK_NAME[rsyslogd] = "${base_sbindir}/syslogd"
-ALTERNATIVE_TARGET[rsyslogd] = "${sbindir}/rsyslogd"
+ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
+ALTERNATIVE_TARGET[syslogd] = "${sbindir}/rsyslogd"
 ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
 ALTERNATIVE_TARGET[syslog-conf] = "${sysconfdir}/rsyslog.conf"
 ALTERNATIVE_LINK_NAME[syslog-logrotate] = "${sysconfdir}/logrotate.d/syslog"
-- 
2.3.0


