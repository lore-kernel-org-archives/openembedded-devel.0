Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 40BA178D64
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 10:12:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6UAD0EP025652
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2018 03:13:00 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 30 Jul 2018 03:12:59 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Jul 2018 18:16:56 +0800
Message-ID: <1532945816-1482-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsyslog: fix configuration file for logrotate
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2018 10:12:59 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The logrotate.rsyslog file uses 'cat /var/run/rsyslogd.pid' to
determine the pid of rsyslogd daemon. This is incorrect, because
rsyslogd may start in a way that does not create rsyslog.pid file.

Failing to send HUP signal to rsyslogd daemon will result in
unexpected behaviour. e.g. rsyslogd is writing to /var/log/messages-xxxx
instead of /var/log/messages.

We should really use pkill to send HUP signal to rsyslogd to ensure
correct behaviour.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate | 4 ++--
 meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb         | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
index 94ec517..5f8568f 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
@@ -9,7 +9,7 @@
         delaycompress
         compress
         postrotate
-		/bin/kill -HUP `cat /var/run/rsyslogd.pid 2> /dev/null` 2> /dev/null || true
+		@BINDIR@/pkill -HUP rsyslogd 2> /dev/null || true
         endscript
 }
 
@@ -34,6 +34,6 @@
         delaycompress
         sharedscripts
         postrotate
-		/bin/kill -HUP `cat /var/run/rsyslogd.pid 2> /dev/null` 2> /dev/null || true
+		@BINDIR@/pkill -HUP rsyslogd 2> /dev/null || true
         endscript
 }
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
index 9737892..d90695a 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.36.0.bb
@@ -125,6 +125,7 @@ do_install_append() {
     install -m 755 ${WORKDIR}/initscript ${D}${sysconfdir}/init.d/syslog
     install -m 644 ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
     install -m 644 ${WORKDIR}/rsyslog.logrotate ${D}${sysconfdir}/logrotate.d/logrotate.rsyslog
+    sed -i -e "s#@BINDIR@#${bindir}#g" ${D}${sysconfdir}/logrotate.d/logrotate.rsyslog
 }
 
 FILES_${PN} += "${bindir}"
-- 
1.9.1


