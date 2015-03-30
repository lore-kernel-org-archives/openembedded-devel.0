Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5ADBE6AC36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2015 08:58:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t2U8wWo9023847
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Mar 2015 01:58:32 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 30 Mar 2015 01:58:32 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 30 Mar 2015 16:51:36 +0800
Message-ID: <1427705496-30307-2-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1427705496-30307-1-git-send-email-wenzong.fan@windriver.com>
References: <1427705496-30307-1-git-send-email-wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2][meta-networking] postfix: add LSB init infos
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
 meta-networking/recipes-daemons/postfix/files/postfix | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-networking/recipes-daemons/postfix/files/postfix b/meta-networking/recipes-daemons/postfix/files/postfix
index 7bcc816..0ea67ef 100755
--- a/meta-networking/recipes-daemons/postfix/files/postfix
+++ b/meta-networking/recipes-daemons/postfix/files/postfix
@@ -1,4 +1,12 @@
 #!/bin/sh
+### BEGIN INIT INFO
+# Provides: postfix MTA
+# Default-Start: 2345
+# Default-Stop: 016
+# Short-Description: start and stop postfix
+# Description: Postfix is a Mail Transport Agent, which is the program
+#              that moves mail from one machine to another.
+### END INIT INFO
 
 success() {
         echo " Successful"
-- 
1.9.1


