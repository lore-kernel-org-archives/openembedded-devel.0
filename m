Return-Path: <daicy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id E85E36AC4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 09:34:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2279301"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jan 2016 17:34:08 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A4E3B41890E1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jan 2016 17:33:58 +0800 (CST)
Received: from localhost.localdomain (10.167.226.51) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 6 Jan 2016 17:33:58 +0800
From: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Jan 2016 01:33:53 -0800
Message-ID: <1452072833-9938-1-git-send-email-daicy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.51]
X-yoursite-MailScanner-ID: A4E3B41890E1.AD2BA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: daicy.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
Subject: [meta-oe][PATCH] syslog-ng: 3.5.4.1 -> 3.6.4
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
X-List-Received-Date: Wed, 06 Jan 2016 09:34:13 -0000
Content-Type: text/plain

Upgrade syslog-ng from 3.5.4.1 to 3.6.4.

1) Modify the syslog-ng.service-the-syslog-ng-service.patch,since the datas has been changed.
2) Delete these patches,since they are not needed any more.
    afsql-afsql_dd_insert_db-refactor.patch
    deinit-the-new-config-when-reverting-to-the.patch
    free-global-LogTemplateOptions.patch
    still-free-the-unconsumed-item.patch
    syslog-ng-verify-the-list-before-del.patch
    rewrite-expr-grammar.ym-Free-up-token.patch
    logwriter-dont-allocate-a-new-buffer.patch
3) Fix WARNING:
    QA Issue: syslog-ng-libs rdepends on libpcre, but it isn't a build dependency? [build-deps]
    QA Issue: syslog-ng rdepends on libpcre, but it isn't a build dependency? [build-deps]
4) Fix ERROR: QA Issue: non -staticdev package contains static .a library:
    work/i586-poky-linux/syslog-ng/3.6.4-r0/packages-split/syslog-ng/usr/lib/syslog-ng/libtest/libsyslog-ng-test.a' [staticdev]

Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
---
 .../files/syslog-ng.service-the-syslog-ng-service.patch       |  3 +--
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc               |  3 ++-
 .../syslog-ng/{syslog-ng_3.5.4.1.bb => syslog-ng_3.6.4.bb}    | 11 ++---------
 3 files changed, 5 insertions(+), 12 deletions(-)
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_3.5.4.1.bb => syslog-ng_3.6.4.bb} (44%)

diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
index 90d3ef2..650b663 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.service-the-syslog-ng-service.patch
@@ -15,12 +15,11 @@ diff --git a/contrib/systemd/syslog-ng.service b/contrib/systemd/syslog-ng.servi
 index fc16f8d..8e09deb 100644
 --- a/contrib/systemd/syslog-ng.service
 +++ b/contrib/systemd/syslog-ng.service
-@@ -3,9 +3,8 @@ Description=System Logger Daemon
+@@ -3,8 +3,7 @@ Description=System Logger Daemon
  Documentation=man:syslog-ng(8)
  
  [Service]
 -Type=notify
- Sockets=syslog.socket
 -ExecStart=/usr/sbin/syslog-ng -F
 +ExecStart=/usr/sbin/syslog-ng -F -p /var/run/syslogd.pid
  ExecReload=/bin/kill -HUP $MAINPID
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 54f6920..f8db897 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -80,8 +80,9 @@ PACKAGES =+ "${PN}-libs ${PN}-libs-dev ${PN}-libs-dbg"
 FILES_${PN}-libs = "${libdir}/${BPN}/*.so ${libdir}/libsyslog-ng-*.so*"
 FILES_${PN}-libs-dev = "${libdir}/${BPN}/lib*.la"
 FILES_${PN}-libs-dbg = "${libdir}/${BPN}/.debug"
+FILES_${PN}-staticdev = "${libdir}/${BPN}/libtest/*.a"
 INSANE_SKIP_${PN}-libs = "dev-so"
-RDEPENDS_${PN} += "${PN}-libs"
+RDEPENDS_${PN} += "${PN}-libs libpcre"
 
 CONFFILES_${PN} = "${sysconfdir}/${BPN}.conf ${sysconfdir}/scl.conf"
 
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
similarity index 44%
rename from meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb
rename to meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
index e8940c0..73609af 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.6.4.bb
@@ -1,22 +1,15 @@
 require syslog-ng.inc
 
 SRC_URI += " \
-    file://afsql-afsql_dd_insert_db-refactor.patch \
-    file://deinit-the-new-config-when-reverting-to-the.patch \
     file://fix-a-memory-leak-in-log_driver_free.patch \
     file://fix-config-libnet.patch \
     file://fix-invalid-ownership.patch \
     file://Fix-the-memory-leak-problem-for-mutex.patch \
     file://Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch \
-    file://free-global-LogTemplateOptions.patch \
-    file://still-free-the-unconsumed-item.patch \
-    file://syslog-ng-verify-the-list-before-del.patch \
     file://configure.patch \
     file://dbifix.patch \
-    file://rewrite-expr-grammar.ym-Free-up-token.patch \
-    file://logwriter-dont-allocate-a-new-buffer.patch \
     file://syslog-ng.service-the-syslog-ng-service.patch \
 "
 
-SRC_URI[md5sum] = "ff3bf223ebafbaa92b69a2d5b729f368"
-SRC_URI[sha256sum] = "92c6969e4172b4fd32390f80043b4de7b116f29989d8c2e5a8a687ee6dcd6f66"
+SRC_URI[md5sum] = "e9f401615e92e5eb27396c995c1446ba"
+SRC_URI[sha256sum] = "7be11df31ac7d716f1f952e22b5ae8e2049edd633a41b223776a853d9106f4e7"
-- 
1.9.1




