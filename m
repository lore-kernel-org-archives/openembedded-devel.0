Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D92D60603
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 May 2018 09:24:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w429OBS4024897
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 May 2018 02:24:11 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 2 May 2018 02:24:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 May 2018 17:31:54 +0800
Message-ID: <1525253514-23554-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] krb5: support environment setting on systemd
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
X-List-Received-Date: Wed, 02 May 2018 09:24:12 -0000
Content-Type: text/plain

Let krb5 support environment setting on systemd startup.
Here is one requirement of environment setting from upstream krb5
...
https://web.mit.edu/kerberos/krb5-1.16/doc/admin/conf_files/kdc_conf.html
|Normally, the kdc.conf file is found in the KDC state directory,
LOCALSTATEDIR/krb5kdc. You can override the default location by
setting the environment variable KRB5_KDC_PROFILE.
...

The fix of (krb5-admin-server.service/krb5-kdc.service) refers ubuntu 1604

Variable RUN_KADMIND is sysvinit, move it out from default/krb5-admin-server

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-connectivity/krb5/krb5/etc/default/krb5-admin-server | 4 +---
 meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-server.service     | 1 +
 meta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.service              | 1 +
 meta-oe/recipes-connectivity/krb5/krb5_1.16.bb                       | 5 +++++
 4 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/etc/default/krb5-admin-server b/meta-oe/recipes-connectivity/krb5/krb5/etc/default/krb5-admin-server
index 2835929..e097353 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5/etc/default/krb5-admin-server
+++ b/meta-oe/recipes-connectivity/krb5/krb5/etc/default/krb5-admin-server
@@ -1,6 +1,4 @@
 # Automatically generated.  If you change anything in this file other than the
-# values of RUN_KADMIND or DAEMON_ARGS, first run dpkg-reconfigure
+# values of DAEMON_ARGS, first run dpkg-reconfigure
 # krb5-admin-server and disable managing the kadmin configuration with
 # debconf.  Otherwise, changes will be overwritten.
-
-RUN_KADMIND=true
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-server.service b/meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-server.service
index 1b42716..21939a1 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-server.service
+++ b/meta-oe/recipes-connectivity/krb5/krb5/krb5-admin-server.service
@@ -7,6 +7,7 @@ ConditionPathExists=/etc/krb5.conf
 Type=forking
 ExecStartPre=/bin/sh -c "test ! -f /var/log/kadmind.log || test ! -x /sbin/restorecon || /sbin/restorecon -F /var/log/kadmind.log"
 ExecStart=/usr/sbin/kadmind
+EnvironmentFile=-/etc/default/krb5-admin-server
 SuccessExitStatus=1 2 SIGKILL
 TimeoutStopSec=30
 
diff --git a/meta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.service b/meta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.service
index d5e5a95..bf37c45 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.service
+++ b/meta-oe/recipes-connectivity/krb5/krb5/krb5-kdc.service
@@ -6,6 +6,7 @@ ConditionPathExists=/etc/krb5.conf
 [Service]
 Type=forking
 ExecStart=/usr/sbin/krb5kdc
+EnvironmentFile=-/etc/default/krb5-kdc
 SuccessExitStatus=1 2 SIGKILL
 TimeoutStopSec=30
 
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
index ce21345..f95240f 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.16.bb
@@ -78,12 +78,17 @@ do_install_append() {
         mkdir -p ${D}/${sysconfdir}/default/volatiles
         echo "d root root 0755 ${localstatedir}/run/krb5kdc none" \
               > ${D}${sysconfdir}/default/volatiles/87_krb5
+
+        echo "RUN_KADMIND=true" >> ${D}/${sysconfdir}/default/krb5-admin-server
     fi
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/tmpfiles.d
         echo "d /run/krb5kdc - - - -" \
               > ${D}${sysconfdir}/tmpfiles.d/krb5.conf
 
+        mkdir -p ${D}/${sysconfdir}/default
+        install -m 0644 ${WORKDIR}/etc/default/* ${D}/${sysconfdir}/default
+
         install -d ${D}${systemd_system_unitdir}
         install -m 0644 ${WORKDIR}/krb5-admin-server.service ${D}${systemd_system_unitdir}
         install -m 0644 ${WORKDIR}/krb5-kdc.service ${D}${systemd_system_unitdir}
-- 
2.7.4


