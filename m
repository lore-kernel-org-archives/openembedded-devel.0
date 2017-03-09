Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A9A5775C4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Mar 2017 01:57:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v291vGc5022581
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 8 Mar 2017 17:57:16 -0800
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 8 Mar 2017 17:57:15 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 9 Mar 2017 09:56:00 +0800
Message-ID: <1489024560-2427-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-oe][PATCH] syslog-ng: fix syntax error in syslog-ng.conf
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
X-List-Received-Date: Thu, 09 Mar 2017 01:57:16 -0000
Content-Type: text/plain

The backtick as a special character causes a syntax error by the parser
in comment line:
Error performing backtick substitution in configuration file;
error='missing closing backtick (`) character',
filename='/etc/syslog-ng/syslog-ng.conf', line='55:1'

Replace it with single quote and bump the conf version to 3.8.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
index f0da2b7..0c6f543 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 3.5
+@version: 3.8
 #
 # Syslog-ng configuration file, compatible with default Debian syslogd
 # installation. Originally written by anonymous (I can't find his name)
@@ -52,7 +52,7 @@ destination d_newscrit { file("/var/log/news/news.crit"); };
 destination d_newserr { file("/var/log/news/news.err"); };
 destination d_newsnotice { file("/var/log/news/news.notice"); };
 
-# Some `catch-all' logfiles.
+# Some 'catch-all' logfiles.
 #
 destination d_debug { file("/var/log/debug"); };
 destination d_error { file("/var/log/error"); };
-- 
2.7.4


