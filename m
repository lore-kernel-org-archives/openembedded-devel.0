Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 515696FFDA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jan 2016 21:23:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0DLNwVu003563
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Jan 2016 13:23:58 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 13 Jan 2016 13:23:57 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Jan 2016 16:23:57 -0500
Message-ID: <1452720237-22319-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] ctdb: Fix rootfs creation errors
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
X-List-Received-Date: Wed, 13 Jan 2016 21:23:58 -0000
Content-Type: text/plain

While building an image I was getting an error during rootfs creation
that ctdb was conflicting with base-files as both were creating
'/var/run':

    warning: Removing ctdb-2.5.1-r0@core2_64 due to file /var/run \
      conflicting with base-files-3.0.14-r89@genericx86_64

This is normally a volatile directory so we have no need
to include this in the ctdb package, so revert the actions of the
Makefile by deleting the directory.

Although /run and $localstatedir/run are linked to be consistent we
update the .service file to use the latter. To ensure the 'ctdb'
subdir exists we patch the use of RuntimeDirectory= in to the .service
file. This will compensate for our removal of this directory creation
from the Makefile.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

This is a resend of a patch I sent 11/18/15. I see that it is yet to be
merged but I also have not received any feedback to provide me with any
details as to why this may not an acceptable change. I am open to making
the necessary changes to make it acceptable. Meanwhile the problem persists.


 ...rvice-ensure-the-PID-directory-is-created.patch | 25 ++++++++++++++++++++++
 meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb |  6 ++++--
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/ctdb/ctdb/service-ensure-the-PID-directory-is-created.patch

diff --git a/meta-networking/recipes-support/ctdb/ctdb/service-ensure-the-PID-directory-is-created.patch b/meta-networking/recipes-support/ctdb/ctdb/service-ensure-the-PID-directory-is-created.patch
new file mode 100644
index 0000000..a7e987b
--- /dev/null
+++ b/meta-networking/recipes-support/ctdb/ctdb/service-ensure-the-PID-directory-is-created.patch
@@ -0,0 +1,25 @@
+From f02ff7383f1cc0c118732352ccbae476c7b3b3ba Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Tue, 17 Nov 2015 16:17:00 -0500
+Subject: [PATCH] service: ensure the PID directory is created
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+---
+ config/ctdb.service | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/config/ctdb.service b/config/ctdb.service
+index ea37c30..8537105 100644
+--- a/config/ctdb.service
++++ b/config/ctdb.service
+@@ -5,6 +5,7 @@ After=network.target
+ [Service]
+ Type=forking
+ LimitCORE=infinity
++RuntimeDirectory=/run/ctdb
+ PIDFile=/run/ctdb/ctdbd.pid
+ ExecStart=/usr/sbin/ctdbd_wrapper /run/ctdb/ctdbd.pid start
+ ExecStop=/usr/sbin/ctdbd_wrapper /run/ctdb/ctdbd.pid stop
+-- 
+2.1.4
+
diff --git a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
index 0cc7aad..ba9c4e5 100644
--- a/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
+++ b/meta-networking/recipes-support/ctdb/ctdb_2.5.1.bb
@@ -17,6 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 SRC_URI = "https://ftp.samba.org/pub/${PN}/${BP}.tar.gz \
            file://01-support-cross-compile-for-linux-os.patch \
            file://02-link-rep_snprintf-for-ltdbtool.patch \
+           file://service-ensure-the-PID-directory-is-created.patch \
           "
 
 SRC_URI[md5sum] = "d0cd91726ff4ca2229e1b21859c94717"
@@ -36,11 +37,12 @@ do_install_append() {
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${S}/config/ctdb.service ${D}${systemd_unitdir}/system
     sed -i -e 's,/usr/sbin/,${sbindir}/,' ${D}${systemd_unitdir}/system/ctdb.service
+    sed -i -e 's,\([=\ ]\)/run/,\1${localstatedir}/run/,' ${D}${systemd_unitdir}/system/ctdb.service
+
+    rm -r ${D}/${localstatedir}/run
 }
 
 SYSTEMD_SERVICE_${PN} = "ctdb.service"
 
-FILES_${PN} += "/run"
-
 # onnode is a shell script with bashisms and bash #!
 RDEPENDS_${PN} += "bash"
-- 
2.1.4


