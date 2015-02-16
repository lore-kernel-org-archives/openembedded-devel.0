Return-Path: <sledz@dresearch-fe.de>
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id 2A29A71EC3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 18:37:54 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 121DCE00E9;
	Mon, 16 Feb 2015 19:37:52 +0100 (CET)
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id 8BE267001FF; Mon, 16 Feb 2015 19:37:51 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org,
	Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 16 Feb 2015 19:37:34 +0100
Message-Id: <1424111855-22867-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 2.3.0
In-Reply-To: <1423846960-4749-1-git-send-email-sledz@dresearch-fe.de>
References: <1423846960-4749-1-git-send-email-sledz@dresearch-fe.de>
Subject: [meta-oe][PATCH v2] rsyslog: fix name of syslogd ua group
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
X-List-Received-Date: Mon, 16 Feb 2015 18:37:55 -0000

All the other syslogd implementations use 'syslogd' as update alternatives
group name. So rsyslogd should use this too.

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


