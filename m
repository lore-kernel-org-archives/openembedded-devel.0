Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C8A075796
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jul 2015 08:30:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t668UMge027745
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Jul 2015 01:30:22 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 6 Jul 2015 01:30:21 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Jul 2015 16:29:39 +0800
Message-ID: <1436171379-32162-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ypbind-yocto.init: add status command
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
X-List-Received-Date: Mon, 06 Jul 2015 08:30:24 -0000
Content-Type: text/plain

From: Zhu Yanjun <yanjun.zhu@windriver.com>

Add the "status" command to check the status of ypbind.

Signed-off-by: Zhu Yanjun <yanjun.zhu@windriver.com>
---
 meta-networking/recipes-support/nis/files/ypbind-yocto.init | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-networking/recipes-support/nis/files/ypbind-yocto.init b/meta-networking/recipes-support/nis/files/ypbind-yocto.init
index 5f50a53..da533a1 100644
--- a/meta-networking/recipes-support/nis/files/ypbind-yocto.init
+++ b/meta-networking/recipes-support/nis/files/ypbind-yocto.init
@@ -21,6 +21,9 @@
 #	the NIS binding information.
 ### END INIT INFO
 
+# Need to use status function
+. /etc/init.d/functions
+
 YPBIND_BIN=/usr/sbin/ypbind
 pidfile=/var/run/ypbind.pid
 
@@ -92,6 +95,10 @@ case "$1" in
 	echo -n "Reload service ypbind"
 	start-stop-daemon --stop --quiet --signal 1 --pidfile $pidfile
 	;;
+    status)
+	echo -n "Checking for ypbind: "
+	status $YPBIND_BIN
+	;;
     *)
 	echo "Usage: $0 {start|stop|status|try-restart|restart|force-reload|reload|probe}"
 	exit 1
-- 
1.9.1


