Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 09C3565C91
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Nov 2014 01:03:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAA13K6s018518
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 9 Nov 2014 17:03:20 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.163.178) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 9 Nov 2014 17:03:19 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 10 Nov 2014 09:03:18 +0800
Message-ID: <1415581398-8497-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][meta-networking] postfix: create or update aliases.db when using systemd
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
X-List-Received-Date: Mon, 10 Nov 2014 01:03:24 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

aliases.db should be created by postinstall script, but failed since
queue_directory is not includes root dir ${D}:
    ------
    |newaliases: fatal: chdir /var/spool/postfix: No such file or directory
    ------
initscript will recall newaliases before start postfix daemon, the similar
method, which run aliasesdb to create aliases.db when using systemd, is
introduced to fix this issue.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../recipes-daemons/postfix/files/aliasesdb          | 20 ++++++++++++++++++++
 .../recipes-daemons/postfix/files/postfix.service    |  1 +
 meta-networking/recipes-daemons/postfix/postfix.inc  |  3 +++
 3 files changed, 24 insertions(+)
 create mode 100755 meta-networking/recipes-daemons/postfix/files/aliasesdb

diff --git a/meta-networking/recipes-daemons/postfix/files/aliasesdb b/meta-networking/recipes-daemons/postfix/files/aliasesdb
new file mode 100755
index 0000000..421b47e
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/aliasesdb
@@ -0,0 +1,20 @@
+#!/bin/sh
+
+ALIASESDB_STAMP=/var/lib/misc/postfix.aliasesdb-stamp
+
+make_aliasesdb() {
+        if [ "$(/usr/sbin/postconf -h alias_database)" == "hash:/etc/aliases" ]
+        then
+                # /etc/aliases.db may be used by other MTA, make sure nothing
+                # has touched it since our last newaliases call
+                [ /etc/aliases -nt /etc/aliases.db ] ||
+                        [ "$ALIASESDB_STAMP" -nt /etc/aliases.db ] ||
+                        [ "$ALIASESDB_STAMP" -ot /etc/aliases.db ] || return 0
+                /usr/bin/newaliases
+                touch -r /etc/aliases.db "$ALIASESDB_STAMP"
+        else
+                /usr/bin/newaliases
+        fi
+}
+
+make_aliasesdb
diff --git a/meta-networking/recipes-daemons/postfix/files/postfix.service b/meta-networking/recipes-daemons/postfix/files/postfix.service
index 6ea9214..c781038 100644
--- a/meta-networking/recipes-daemons/postfix/files/postfix.service
+++ b/meta-networking/recipes-daemons/postfix/files/postfix.service
@@ -6,6 +6,7 @@ Conflicts=sendmail.service exim.service
 [Service]
 Type=forking
 PIDFile=/var/spool/postfix/pid/master.pid
+ExecStartPre=-/usr/libexec/postfix/aliasesdb
 ExecStart=/usr/sbin/postfix start
 ExecReload=/usr/sbin/postfix reload
 ExecStop=/usr/sbin/postfix stop
diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index c58787e..d2f3356 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -22,6 +22,7 @@ SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV
 	   file://postfix \
 	   file://internal_recipient \
 	   file://postfix.service \
+	   file://aliasesdb \
 	   "
 
 S = "${WORKDIR}/postfix-${PV}"
@@ -149,6 +150,8 @@ do_install () {
 	install -m 0644 ${WORKDIR}/postfix.service ${D}${systemd_unitdir}/system
 	sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${systemd_unitdir}/system/postfix.service
 
+	install -m 0755 ${WORKDIR}/aliasesdb ${D}${exec_prefix}/libexec/postfix/
+
 	install -m 770 -d ${D}${localstatedir}/spool/postfix
 	chown postfix:postfix ${D}${localstatedir}/spool/postfix
 	chown postfix:postfix ${D}${localstatedir}/lib/postfix
-- 
2.1.0


