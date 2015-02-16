Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 67B2065C85
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 07:57:40 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="57783914"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 16 Feb 2015 15:54:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t1G7uqtD008295
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 15:56:52 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 16 Feb 2015 15:57:40 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Feb 2015 15:52:35 +0800
Message-ID: <1424073156-18834-2-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1424073156-18834-1-git-send-email-biannm@cn.fujitsu.com>
References: <1424073156-18834-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-networking][PATCH v2 1/2] postfix: don't hard-code PATH in service file
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
X-List-Received-Date: Mon, 16 Feb 2015 07:57:40 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 meta-networking/recipes-daemons/postfix/files/postfix.service | 10 +++++-----
 meta-networking/recipes-daemons/postfix/postfix.inc           |  4 +++-
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-daemons/postfix/files/postfix.service b/meta-networking/recipes-daemons/postfix/files/postfix.service
index c781038..02ea640 100644
--- a/meta-networking/recipes-daemons/postfix/files/postfix.service
+++ b/meta-networking/recipes-daemons/postfix/files/postfix.service
@@ -5,11 +5,11 @@ Conflicts=sendmail.service exim.service
 
 [Service]
 Type=forking
-PIDFile=/var/spool/postfix/pid/master.pid
-ExecStartPre=-/usr/libexec/postfix/aliasesdb
-ExecStart=/usr/sbin/postfix start
-ExecReload=/usr/sbin/postfix reload
-ExecStop=/usr/sbin/postfix stop
+PIDFile=@LOCALSTATEDIR@/spool/postfix/pid/master.pid
+ExecStartPre=-@LIBEXECDIR@/aliasesdb
+ExecStart=@SBINDIR@/postfix start
+ExecReload=@SBINDIR@/postfix reload
+ExecStop=@SBINDIR@/postfix stop
 
 [Install]
 WantedBy=multi-user.target
diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index e73f2f0..a6909e9 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -147,7 +147,9 @@ do_install () {
 
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/postfix.service ${D}${systemd_unitdir}/system
-    sed -i 's,/usr/sbin/,${sbindir}/,g' ${D}${systemd_unitdir}/system/postfix.service
+    sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}${systemd_unitdir}/system/postfix.service
+    sed -i -e 's#@LOCALSTATEDIR@#${localstatedir}#g' ${D}${systemd_unitdir}/system/postfix.service
+    sed -i -e 's#@SBINDIR@#${sbindir}#g' ${D}${systemd_unitdir}/system/postfix.service
 
     install -m 0755 ${WORKDIR}/aliasesdb ${D}${libexecdir}
 
-- 
1.9.1


