Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D303273B10
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jul 2015 03:21:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t683LGvf005791
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 7 Jul 2015 20:21:16 -0700 (PDT)
Received: from localhost.localdomain (128.224.153.43) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 7 Jul 2015 20:21:15 -0700
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 8 Jul 2015 11:21:14 +0800
Message-ID: <1436325674-22267-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.7.0.5
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
X-List-Received-Date: Wed, 08 Jul 2015 03:21:16 -0000
Content-Type: text/plain

The script ypbind will cause error if using ypdomainname command
provided by busybox. So add RDEPENDCY on yp-tools and change
the path of ypdomainname.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 recipes-support/nis/files/ypbind-yocto.init | 11 ++++++-----
 recipes-support/nis/ypbind-mt_1.36.bb       |  1 +
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/recipes-support/nis/files/ypbind-yocto.init b/recipes-support/nis/files/ypbind-yocto.init
index da533a1..f97a3e1 100644
--- a/recipes-support/nis/files/ypbind-yocto.init
+++ b/recipes-support/nis/files/ypbind-yocto.init
@@ -26,6 +26,7 @@
 
 YPBIND_BIN=/usr/sbin/ypbind
 pidfile=/var/run/ypbind.pid
+YPDOMAINNAME_bin=/usr/bin/ypdomainname
 
 [ -f /etc/default/ypbind ] && . /etc/default/ypbind
 
@@ -34,14 +35,14 @@ case "$1" in
 	echo -n "Starting ypbind"
 	## If the domainname is not set, skip starting of ypbind
 	## and return with "program not configured"
-        /bin/ypdomainname &> /dev/null
-        if [ $? -ne 0 -o -z "`/bin/ypdomainname 2>/dev/null`" ]; then
+        $YPDOMAINNAME_bin &> /dev/null
+        if [ $? -ne 0 -o -z "`$YPDOMAINNAME_bin 2>/dev/null`" ]; then
            if [ -f /etc/defaultdomain ]; then
              XDOMAINNAME=`cat /etc/defaultdomain`
-             /bin/ypdomainname "$XDOMAINNAME"
+             $YPDOMAINNAME_bin "$XDOMAINNAME"
 	   fi
-           /bin/ypdomainname &> /dev/null
-           if [ $? -ne 0 -o -z "`/bin/ypdomainname 2>/dev/null`" ]; then
+           $YPDOMAINNAME_bin &> /dev/null
+           if [ $? -ne 0 -o -z "`$YPDOMAINNAME_bin 2>/dev/null`" ]; then
 	     # Tell the user this has skipped
 	     echo -n " . . . . . . . . . . No domainname set"
              # service is not configured
diff --git a/recipes-support/nis/ypbind-mt_1.36.bb b/recipes-support/nis/ypbind-mt_1.36.bb
index 35ef16a..4fdef9f 100644
--- a/recipes-support/nis/ypbind-mt_1.36.bb
+++ b/recipes-support/nis/ypbind-mt_1.36.bb
@@ -50,3 +50,4 @@ RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "ypbind.service"
+RDEPENDS_${PN} += "yp-tools"
-- 
1.8.5.2.233.g932f7e4


