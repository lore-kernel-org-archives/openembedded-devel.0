Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8ED896EAF7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Feb 2014 05:40:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1B5ejaj003181
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2014 21:40:45 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 10 Feb 2014 21:40:45 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 11 Feb 2014 13:41:34 +0800
Message-ID: <1392097295-32258-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] proftpd: move the runing created file under /var/run
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
X-List-Received-Date: Tue, 11 Feb 2014 05:40:46 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../proftpd/files/move-runfile-to-var-run.patch    |   39 ++++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |    1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/move-runfile-to-var-run.patch

diff --git a/meta-networking/recipes-daemons/proftpd/files/move-runfile-to-var-run.patch b/meta-networking/recipes-daemons/proftpd/files/move-runfile-to-var-run.patch
new file mode 100644
index 0000000..1561ed8
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/move-runfile-to-var-run.patch
@@ -0,0 +1,39 @@
+redefine PR_RUN_DIR as ${localstatedir}/run
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ configure    |    2 +-
+ configure.in |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index ebed38e..445d5bc 100755
+--- a/configure
++++ b/configure
+@@ -33579,7 +33579,7 @@ _ACEOF
+ 
+ 
+ cat >>confdefs.h <<_ACEOF
+-#define PR_RUN_DIR "`eval echo "${localstatedir}"`"
++#define PR_RUN_DIR "`eval echo "${localstatedir}"/run/`"
+ _ACEOF
+ 
+ cat >>confdefs.h <<_ACEOF
+diff --git a/configure.in b/configure.in
+index c17929c..df9186a 100644
+--- a/configure.in
++++ b/configure.in
+@@ -2788,7 +2788,7 @@ locale_dir="`eval echo ${localedir}`"
+ locale_dir="`eval echo ${locale_dir}`"
+ AC_DEFINE_UNQUOTED(PR_LOCALE_DIR, "`eval echo "${locale_dir}"`")
+ 
+-AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}"`")
++AC_DEFINE_UNQUOTED(PR_RUN_DIR, "`eval echo "${localstatedir}/run"`")
+ AC_DEFINE_UNQUOTED(PR_CONFIG_FILE_PATH, "`eval echo "${sysconfdir}/proftpd.conf"`")
+ AC_DEFINE_UNQUOTED(PR_PID_FILE_PATH, "`eval echo "${localstatedir}/run/proftpd.pid"`")
+ 
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
index eb502d6..cfbadfb 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
@@ -14,6 +14,7 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
            file://default \
            file://move-pidfile-to-var-run.patch \
            file://close-RequireValidShell-check.patch \
+           file://move-runfile-to-var-run.patch \
 "
 
 SRC_URI[md5sum] = "0871e0b93c9c3c88ca950b6d9a04aed2"
-- 
1.7.10.4


