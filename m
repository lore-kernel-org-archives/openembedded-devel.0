Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A1F8B601D3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Dec 2015 10:15:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB2AFioV008212
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Dec 2015 02:15:44 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 2 Dec 2015 02:15:43 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 2 Dec 2015 05:15:40 -0500
Message-ID: <1449051341-115343-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH V2 1/2] postfix.inc: fix start postfix failed while hostname is numeric
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
X-List-Received-Date: Wed, 02 Dec 2015 10:15:45 -0000
Content-Type: text/plain

While hostname is numeric, start postfix failed
...
root@qemux86-64:~# hostname 1.2.3.4
root@qemux86-64:~# systemctl restart postfix
|Job for postfix.service failed because the control process exited
with error code. See "systemctl status postfix.service" and
"journalctl -xe" for details.

root@qemux86-64:~# systemctl status postfix -l
Dec 02 08:05:40 1.2.3.4 aliasesdb[535]: /usr/sbin/postconf: fatal: unable to use my own hostname
Dec 02 08:05:41 1.2.3.4 aliasesdb[535]: newaliases: warning: valid_hostname: numeric hostname: 1.2.3.4
Dec 02 08:05:41 1.2.3.4 postfix/sendmail[537]: warning: valid_hostname: numeric hostname: 1.2.3.4
Dec 02 08:05:41 1.2.3.4 aliasesdb[535]: newaliases: fatal: unable to use my own hostname
Dec 02 08:05:42 1.2.3.4 postfix[540]: warning: valid_hostname: numeric hostname: 1.2.3.4
Dec 02 08:05:42 1.2.3.4 postfix[540]: fatal: unable to use my own hostname
...

Refer meta/recipes-core/initscripts/initscripts-1.0/hostname.sh in oe-core,
add check_hostname.sh and invoke it before postfix start, if the hostname
is invalid, set "localhost" to main.cf.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../recipes-daemons/postfix/files/check_hostname.sh         | 13 +++++++++++++
 meta-networking/recipes-daemons/postfix/files/postfix       |  1 +
 .../recipes-daemons/postfix/files/postfix.service           |  1 +
 meta-networking/recipes-daemons/postfix/postfix.inc         |  3 +++
 4 files changed, 18 insertions(+)
 create mode 100755 meta-networking/recipes-daemons/postfix/files/check_hostname.sh

diff --git a/meta-networking/recipes-daemons/postfix/files/check_hostname.sh b/meta-networking/recipes-daemons/postfix/files/check_hostname.sh
new file mode 100755
index 0000000..37a0dd0
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/check_hostname.sh
@@ -0,0 +1,13 @@
+#! /bin/sh
+
+HOSTNAME=$(/bin/hostname)
+
+if [ -z "$HOSTNAME" -o "$HOSTNAME" = "(none)" -o ! -z "`echo $HOSTNAME | sed -n '/^[0-9]*\.[0-9].*/p'`" ]; then
+	# If hostname is invalid, and myhostname not existed in main.cf
+	/usr/sbin/postconf -h "myhostname" 2>/dev/null
+	if [ $? -ne 0 ]; then
+		# Set "localhost" to main.cf
+		/usr/sbin/postconf -e "myhostname=localhost"
+	fi
+fi
+
diff --git a/meta-networking/recipes-daemons/postfix/files/postfix b/meta-networking/recipes-daemons/postfix/files/postfix
index 0ea67ef..8c7a601 100755
--- a/meta-networking/recipes-daemons/postfix/files/postfix
+++ b/meta-networking/recipes-daemons/postfix/files/postfix
@@ -40,6 +40,7 @@ case "$1" in
           newaliases
         fi
         if ! postfix status >/dev/null 2>&1; then
+          /usr/sbin/check_hostname.sh
           postfix start
           check_return $?
         else
diff --git a/meta-networking/recipes-daemons/postfix/files/postfix.service b/meta-networking/recipes-daemons/postfix/files/postfix.service
index 02ea640..3a9a0a1 100644
--- a/meta-networking/recipes-daemons/postfix/files/postfix.service
+++ b/meta-networking/recipes-daemons/postfix/files/postfix.service
@@ -6,6 +6,7 @@ Conflicts=sendmail.service exim.service
 [Service]
 Type=forking
 PIDFile=@LOCALSTATEDIR@/spool/postfix/pid/master.pid
+ExecStartPre=-@SBINDIR@/check_hostname.sh
 ExecStartPre=-@LIBEXECDIR@/aliasesdb
 ExecStart=@SBINDIR@/postfix start
 ExecReload=@SBINDIR@/postfix reload
diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 3e7f918..271eb09 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -23,6 +23,7 @@ SRC_URI = "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${PV
     file://internal_recipient \
     file://postfix.service \
     file://aliasesdb \
+    file://check_hostname.sh \
 "
 
 S = "${WORKDIR}/postfix-${PV}"
@@ -145,6 +146,8 @@ do_install () {
     install -m 644 ${WORKDIR}/main.cf_2.0 ${D}${sysconfdir}/postfix/main.cf
     sed -i 's#@LIBEXECDIR@#${libexecdir}#' ${D}${sysconfdir}/postfix/main.cf
 
+    install -m 755 ${WORKDIR}/check_hostname.sh ${D}${sbindir}/
+
     install -m 755 ${WORKDIR}/postfix ${D}${sysconfdir}/init.d/postfix
     install -m 644 ${WORKDIR}/internal_recipient ${D}${sysconfdir}/postfix/internal_recipient
 
-- 
1.9.1


