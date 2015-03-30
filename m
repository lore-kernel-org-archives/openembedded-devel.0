Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 036A36013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2015 08:58:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t2U8wVdb007153
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2015 01:58:31 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 30 Mar 2015 01:58:31 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Mar 2015 16:51:35 +0800
Message-ID: <1427705496-30307-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2][meta-networking] vsftpd / init: add LSB init infos
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
X-List-Received-Date: Mon, 30 Mar 2015 08:58:32 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Keep compatibility with chkconfig tool.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-networking/recipes-daemons/vsftpd/files/init | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-networking/recipes-daemons/vsftpd/files/init b/meta-networking/recipes-daemons/vsftpd/files/init
index d0ec010..72adf0d 100755
--- a/meta-networking/recipes-daemons/vsftpd/files/init
+++ b/meta-networking/recipes-daemons/vsftpd/files/init
@@ -1,4 +1,13 @@
 #!/bin/sh
+### BEGIN INIT INFO
+# Provides: vsftpd
+# Default-Start:  2345
+# Default-Stop:   016
+# Short-Description: Very Secure Ftp Daemon
+# Description: vsftpd is a Very Secure FTP daemon. It was written completely from
+#              scratch
+### END INIT INFO
+
 DAEMON=/usr/sbin/vsftpd
 NAME=vsftpd
 DESC="FTP Server"
-- 
1.9.1


