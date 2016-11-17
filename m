Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5EA6971987
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2016 05:45:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAH5j9jQ028424
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 21:45:09 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 16 Nov 2016 21:45:08 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Nov 2016 13:37:35 +0800
Message-ID: <20161117053737.309-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/3] samba: Fix qa issue and update ctdb-tests
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
X-List-Received-Date: Thu, 17 Nov 2016 05:45:10 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Fix file-rdeps QA warning by replace shell interpreter of script
${bindir}/onnode with /bin/sh that it doesn't has any bashism.

File ${bindir}/ctdb_run_cluster_tests which is a link to
${bindir}/ctdb_run_tests is split into package samba. That causes wrong
runtime dependency that samba depends on samba-ctdb-tests. Split the
file to samba-ctdb-tests to fix the issue.

Script ctdb_run_tests calls command 'getopt', so add runtime dependency
util-linux-getopt. Install config file and test cases for
samba-ctdt-tests at same time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-connectivity/samba/samba_4.4.5.bb           | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index e9694d4..fe63701 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -43,7 +43,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${SYSVIN
 "
 
 RDEPENDS_${PN}-base += "${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'lsb', '', d)}"
-RDEPENDS_${PN}-ctdb-tests += "bash"
+RDEPENDS_${PN}-ctdb-tests += "bash util-linux-getopt"
 
 PACKAGECONFIG[acl] = "--with-acl-support,--without-acl-support,acl"
 PACKAGECONFIG[fam] = "--with-fam,--without-fam,gamin"
@@ -122,6 +122,19 @@ do_install_append() {
     install -d ${D}${sysconfdir}/sysconfig/
     install -m644 packaging/systemd/samba.sysconfig ${D}${sysconfdir}/sysconfig/samba
 
+    # install ctdb config file and test cases
+    install -D -m 0644 ${S}/ctdb/tests/onnode/nodes ${D}${sysconfdir}/ctdb/nodes
+    # the items are from ctdb/tests/run_tests.sh
+    for d in onnode takeover tool eventscripts cunit simple complex; do
+        testdir=${D}${datadir}/ctdb-tests/$d
+        install -d $testdir
+        cp ${S}/ctdb/tests/$d/*.sh $testdir
+        cp -r ${S}/ctdb/tests/$d/scripts ${S}/ctdb/tests/$d/stubs $testdir || true
+    done
+
+    # fix file-rdeps qa warning
+    sed -i 's:\(#!/bin/\)bash:\1sh:' ${D}${bindir}/onnode
+
     rm -rf ${D}/run ${D}${localstatedir}/run ${D}${localstatedir}/log
 }
 
@@ -140,6 +153,8 @@ FILES_${PN}-base = "${sbindir}/nmbd \
 "
 
 FILES_${PN}-ctdb-tests = "${bindir}/ctdb_run_tests \
+                          ${bindir}/ctdb_run_cluster_tests \
+                          ${sysconfdir}/ctdb/nodes \
                           ${libdir}/ctdb-tests \
                           ${datadir}/ctdb-tests \
                           /run/ctdb \
-- 
2.10.1


