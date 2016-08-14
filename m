Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 119897714F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Aug 2016 14:21:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7EELAlQ001454
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Aug 2016 07:21:10 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 14 Aug 2016 07:21:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 14 Aug 2016 07:21:08 -0700
Message-ID: <20160814142108.7811-2-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160814142108.7811-1-liezhi.yang@windriver.com>
References: <20160814142108.7811-1-liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] samba: remove ${localstatedir}/log
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
X-List-Received-Date: Sun, 14 Aug 2016 14:21:11 -0000
Content-Type: text/plain

Fixed do_package error:
WARNING: samba-4.4.2-r0 do_package: FILES contains file '/var/log/samba' which resides under a directory symlink. Please fix the recipe and use the real path for the file.
ERROR: samba-4.4.2-r0 do_package: File './var/log/samba' cannot be packaged into 'samba-base' because its parent directory structure does not exist. One of its parent directories is a symlink whose target directory is not included in the package.
ERROR: samba-4.4.2-r0 do_package: Function failed: populate_packages

It has a file ${sysconfdir}/tmpfiles.d/samba.conf which will create
/var/log/samba when systemd, and volatiles.03_samba when sysvinit.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
index 1a5d54f..c515696 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.2.bb
@@ -123,7 +123,7 @@ do_install_append() {
     install -d ${D}${sysconfdir}/sysconfig/
     install -m644 packaging/systemd/samba.sysconfig ${D}${sysconfdir}/sysconfig/samba
 
-    rm -rf ${D}/run ${D}${localstatedir}/run
+    rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
 }
 
 PACKAGES += "${PN}-python ${PN}-python-dbg ${PN}-pidl libwinbind libwinbind-dbg libwinbind-krb5-locator"
@@ -136,7 +136,6 @@ FILES_${PN}-base = "${sbindir}/nmbd \
                     ${sbindir}/smbd \
                     ${sysconfdir}/init.d \
                     ${localstatedir}/lib/samba \
-                    ${localstatedir}/log/samba \
                     ${localstatedir}/nmbd \
                     ${localstatedir}/spool/samba \
 "
-- 
2.9.0


