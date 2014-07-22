Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E7987701C2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 08:25:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6M8PU7r025461
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 01:25:30 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Jul 2014 01:25:30 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Jul 2014 16:25:35 +0800
Message-ID: <1406017535-412-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-webserver] webmin: make reconfigure webmin be able to work
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
X-List-Received-Date: Tue, 22 Jul 2014 08:25:39 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

when move a file, test if this file exist or not

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
index 0f8781f..91ec5d7 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
@@ -36,12 +36,12 @@ do_configure() {
     rm -rf stunnel squid sarg pptp-client pptp-server jabber openslp sentry cluster-* vgetty burner heartbeat
 
     # Adjust configs
-    mv init/config-debian-linux init/config-generic-linux
+    [ -f init/config-debian-linux ] && mv init/config-debian-linux init/config-generic-linux
     sed -i "s/shutdown_command=.*/shutdown_command=poweroff/" init/config-generic-linux
     echo "exclude=bootmisc.sh,single,halt,reboot,hostname.sh,modutils.sh,mountall.sh,mountnfs.sh,networking,populate-volatile.sh,rmnologin.sh,save-rtc.sh,umountfs,umountnfs.sh,hwclock.sh,checkroot.sh,banner.sh,udev,udev-cache,devpts.sh,psplash.sh,sendsigs,fbsetup,bootlogd,stop-bootlogd,sysfs.sh,syslog,syslog.busybox,urandom,webmin,functions.initscripts,read-only-rootfs-hook.sh" >> init/config-generic-linux
     echo "excludefs=devpts,devtmpfs,usbdevfs,proc,tmpfs,sysfs,debugfs" >> mount/config-generic-linux
 
-    mv exports/config-debian-linux exports/config-generic-linux
+    [ -f exports/config-debian-linux ] && mv exports/config-debian-linux exports/config-generic-linux
     sed -i "s/killall -HUP rpc.nfsd && //" exports/config-generic-linux
     sed -i "s/netstd_nfs/nfsserver/g" exports/config-generic-linux
 
-- 
1.7.10.4


