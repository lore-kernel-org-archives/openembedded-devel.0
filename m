Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9655775669
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 03:15:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6G3Fq6D025391
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jul 2015 20:15:52 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Wed, 15 Jul 2015 20:15:51 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 16 Jul 2015 11:14:26 +0800
Message-ID: <1437016466-30851-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking][v2] inetutils: fix tcpd path in xinetd configuration file
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
X-List-Received-Date: Thu, 16 Jul 2015 03:15:53 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

tcpd from tcp-wrapper is installed into /usr/sbin/, not /usr/bin/
using sed to dynamical update the path to add the robust

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../inetutils/inetutils-1.9.2/rexec.xinetd.inetutils                  | 4 ++--
 .../inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils                 | 4 ++--
 .../inetutils/inetutils-1.9.2/rsh.xinetd.inetutils                    | 4 ++--
 .../inetutils/inetutils-1.9.2/telnet.xinetd.inetutils                 | 2 +-
 .../inetutils/inetutils-1.9.2/tftpd.xinetd.inetutils                  | 2 +-
 meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb     | 3 +++
 6 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils
index 80aed36..30e81ef 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils
@@ -14,7 +14,7 @@ service exec
 	group		= root
 	log_on_success	+= USERID
 	log_on_failure	+= USERID
-	server		= /usr/bin/tcpd
-	server_args	= /usr/sbin/in.rexecd
+	server		= @SBINDIR@/tcpd
+	server_args	= @SBINDIR@/in.rexecd
 	disable		= yes
 }
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils
index 00dbf93..21b55da 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils
@@ -14,8 +14,8 @@ service login
 	group		= root
 	log_on_success	+= USERID
 	log_on_failure	+= USERID
-	server		= /usr/bin/tcpd
-	server_args	= /usr/sbin/in.rlogind -a
+	server		= @SBINDIR@/tcpd
+	server_args	= @SBINDIR@/in.rlogind -a
 	disable		= yes
 }
 							
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils
index ad59b62..2b894a7 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils
@@ -15,7 +15,7 @@ service shell
 	group		= root
 	log_on_success	+= USERID
 	log_on_failure	+= USERID
-	server		= /usr/bin/tcpd
-	server_args	= /usr/sbin/in.rshd -aL
+	server		= @SBINDIR@/tcpd
+	server_args	= @SBINDIR@/in.rshd -aL
 	disable		= yes
 }
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnet.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnet.xinetd.inetutils
index 2a2a12e..2d9a040 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnet.xinetd.inetutils
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/telnet.xinetd.inetutils
@@ -8,6 +8,6 @@ service telnet
 	socket_type	= stream
 	wait		= no
 	user		= root
-	server		= /usr/sbin/in.telnetd
+	server		= @SBINDIR@/in.telnetd
 	log_on_failure	+= USERID
 }
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/tftpd.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/tftpd.xinetd.inetutils
index f549163..67b44c4 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/tftpd.xinetd.inetutils
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/tftpd.xinetd.inetutils
@@ -13,7 +13,7 @@ service tftp
         wait            = yes
         user            = root
         group           = root
-        server          = /usr/sbin/in.tftpd
+        server          = @SBINDIR@/in.tftpd
         server_args     = /tftpboot
 }
 
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
index cd7b425..73c90d6 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.2.bb
@@ -68,6 +68,9 @@ do_install_append () {
     cp ${WORKDIR}/rsh.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/rsh
     cp ${WORKDIR}/telnet.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/telnet
     cp ${WORKDIR}/tftpd.xinetd.inetutils  ${D}/${sysconfdir}/xinetd.d/tftpd
+
+    sed -e 's,@SBINDIR@,${sbindir},g' -i ${D}/${sysconfdir}/xinetd.d/*
+
     rm -rf ${D}${libexecdir}/
     # remove usr/lib if empty
     rmdir ${D}${libdir}
-- 
1.9.1


