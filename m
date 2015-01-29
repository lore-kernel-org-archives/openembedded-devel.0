Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E1C0D60043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jan 2015 07:46:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0T7k94A015897
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 23:46:09 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.146) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 28 Jan 2015 23:46:09 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 29 Jan 2015 15:46:14 +0800
Message-ID: <1422517574-31477-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsyslog: don't call init script in logrotate conf file
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
X-List-Received-Date: Thu, 29 Jan 2015 07:46:16 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Send HUP signal instead of calling the reload command
of init script in logrotate configure file, so that it
also works when the init system is systemd.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
index ba1120a..94ec517 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
@@ -9,7 +9,7 @@
         delaycompress
         compress
         postrotate
-		/etc/init.d/rsyslog reload 2> /dev/null || true
+		/bin/kill -HUP `cat /var/run/rsyslogd.pid 2> /dev/null` 2> /dev/null || true
         endscript
 }
 
@@ -34,6 +34,6 @@
         delaycompress
         sharedscripts
         postrotate
-		/etc/init.d/rsyslog reload 2> /dev/null || true
+		/bin/kill -HUP `cat /var/run/rsyslogd.pid 2> /dev/null` 2> /dev/null || true
         endscript
 }
-- 
1.9.1


