Return-Path: <ml@communistcode.co.uk>
X-Greylist: delayed 2003 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 23 Jan 2015 11:05:33 UTC
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0ACDD65C7B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jan 2015 11:05:33 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Jan 2015 10:32:07 +0000
Message-Id: <1422009127-6666-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 2.2.2
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [meta-oe][PATCH] rsyslog: init file has been renamed, reflect in logrotate conf file
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
X-List-Received-Date: Fri, 23 Jan 2015 11:05:37 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

rsyslogs init file was recently changed to support update-alternatives
and in the process the init file is now /etc/init.d/syslogd rather than
/etc/init.d/rsyslogd, change the logrotate config file to reflect this,
other wise the daemon won't get restarted and the log files will get
rotated but not re-created.

Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
index ba1120a..4853167 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
@@ -9,7 +9,7 @@
         delaycompress
         compress
         postrotate
-		/etc/init.d/rsyslog reload 2> /dev/null || true
+		/etc/init.d/syslog reload 2> /dev/null || true
         endscript
 }
 
@@ -34,6 +34,6 @@
         delaycompress
         sharedscripts
         postrotate
-		/etc/init.d/rsyslog reload 2> /dev/null || true
+		/etc/init.d/syslog reload 2> /dev/null || true
         endscript
 }
-- 
2.2.2


