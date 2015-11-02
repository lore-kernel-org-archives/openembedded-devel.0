Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 64BF360232
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Nov 2015 06:05:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tA265lsj006442
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 1 Nov 2015 22:05:47 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 1 Nov 2015 22:05:47 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Nov 2015 01:05:46 -0500
Message-ID: <1446444346-78456-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] ypbind-mt: set path of ypdomainname in ypbind script
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
X-List-Received-Date: Mon, 02 Nov 2015 06:05:48 -0000
Content-Type: text/plain

From: Jian Liu <jian.liu@windriver.com>

The script ypbind will cause error if using ypdomainname command
provided by busybox. So add RDEPENDCY on yp-tools and change
the path of ypdomainname.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-networking/recipes-support/nis/files/ypbind.init | 11 ++++++-----
 meta-networking/recipes-support/nis/ypbind-mt_1.38.bb |  2 ++
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-support/nis/files/ypbind.init b/meta-networking/recipes-support/nis/files/ypbind.init
index 244dc78..669c19c 100644
--- a/meta-networking/recipes-support/nis/files/ypbind.init
+++ b/meta-networking/recipes-support/nis/files/ypbind.init
@@ -26,6 +26,7 @@
 
 YPBIND_BIN=/usr/sbin/ypbind
 pidfile=/var/run/ypbind.pid
+YPDOMAINNAME_bin=/usr/bin/ypdomainname
 
 [ -f /etc/default/ypbind ] && . /etc/default/ypbind
 
@@ -34,14 +35,14 @@ case "$1" in
 	echo -n "Starting ypbind"
 	## If the domainname is not set, skip starting of ypbind
 	## and return with "program not configured"
-        /bin/ypdomainname >/dev/null 2>&1
-        if [ $? -ne 0 -o -z "`/bin/ypdomainname 2>/dev/null`" ]; then
+        $YPDOMAINNAME_bin >/dev/null 2>&1
+        if [ $? -ne 0 -o -z "`$YPDOMAINNAME_bin 2>/dev/null`" ]; then
            if [ -f /etc/defaultdomain ]; then
              XDOMAINNAME=`cat /etc/defaultdomain`
-             /bin/ypdomainname "$XDOMAINNAME"
+             $YPDOMAINNAME_bin "$XDOMAINNAME"
 	   fi
-           /bin/ypdomainname >/dev/null 2>&1
-           if [ $? -ne 0 -o -z "`/bin/ypdomainname 2>/dev/null`" ]; then
+           $YPDOMAINNAME_bin >/dev/null 2>&1
+           if [ $? -ne 0 -o -z "`$YPDOMAINNAME_bin 2>/dev/null`" ]; then
 	     # Tell the user this has skipped
 	     echo -n " . . . . . . . . . . No domainname set"
              # service is not configured
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
index 5702cd6..d113b82 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_1.38.bb
@@ -21,6 +21,8 @@ DEPENDS = " \
            yp-tools \
            ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
           "
+RDEPENDS_${PN} += "yp-tools"
+
 # ypbind-mt now provides all the functionality of ypbind
 # and is used in place of it.
 PROVIDES += "ypbind"
-- 
1.9.1


