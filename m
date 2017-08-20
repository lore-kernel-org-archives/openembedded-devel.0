Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 66D1E783B6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Aug 2017 02:52:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7K2qXg5008437
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Aug 2017 19:52:34 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Sat, 19 Aug 2017 19:52:29 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 20 Aug 2017 10:51:48 +0800
Message-ID: <1503197508-211426-1-git-send-email-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] rsyslog: CVE-2015-3243
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
X-List-Received-Date: Sun, 20 Aug 2017 02:52:33 -0000
Content-Type: text/plain

rsyslog uses weak permissions for generating log files, which allows
local users to obtain sensitive information by reading files in
/var/log/cron.log

We add "create 0600 root root" to the /etc/logrotate.d/syslog file,
this will ensure the file is created with permissions when logrotate
runs. It is also recommended that users manually set the permissions
on existing or newly installed log files in order to prevent access
by untrusted users.
https://bugzilla.redhat.com/show_bug.cgi?id=1232826

CVE: CVE-2015-3243

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
index 94ec517..7960815 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog/rsyslog.logrotate
@@ -23,6 +23,9 @@
 /var/log/user.log
 /var/log/lpr.log
 /var/log/cron.log
+{
+        create 0600 root root
+}
 /var/log/debug
 /var/log/messages
 {
-- 
1.9.1


