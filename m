Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 31B176E20A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2013 08:34:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB68YBAX020972
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 Dec 2013 00:34:11 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 6 Dec 2013 00:34:10 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Dec 2013 16:34:16 +0800
Message-ID: <1386318856-1566-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH meta-networking v2] proftpd: use /bin/false as the login shell and add home-dir
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
X-List-Received-Date: Fri, 06 Dec 2013 08:34:12 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Use /bin/false as the login shell, just like what Ubuntu does,
otherwise there might be secure issue; add /var/lib/ftp as user
ftp home-dir.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../files/close-RequireValidShell-check.patch      |   27 ++++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |    4 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/close-RequireValidShell-check.patch

diff --git a/meta-networking/recipes-daemons/proftpd/files/close-RequireValidShell-check.patch b/meta-networking/recipes-daemons/proftpd/files/close-RequireValidShell-check.patch
new file mode 100644
index 0000000..cb73c2d
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/close-RequireValidShell-check.patch
@@ -0,0 +1,27 @@
+close RequireValidShell check
+
+Upstream-Status: Inappropriate [configuration]
+
+close RequireValidShell check since we like to make /bin/false as shell
+for ftp user
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ sample-configurations/basic.conf |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/sample-configurations/basic.conf b/sample-configurations/basic.conf
+index 314eb79..abcb284 100644
+--- a/sample-configurations/basic.conf
++++ b/sample-configurations/basic.conf
+@@ -53,6 +53,7 @@ AllowOverwrite		on
+   # We want clients to be able to login with "anonymous" as well as "ftp"
+   UserAlias			anonymous ftp
+ 
++  RequireValidShell	 	off	
+   # Limit the maximum number of anonymous logins
+   MaxClients			10
+ 
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
index 6537b77..eb502d6 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
@@ -13,6 +13,7 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
            file://proftpd-basic.init \
            file://default \
            file://move-pidfile-to-var-run.patch \
+           file://close-RequireValidShell-check.patch \
 "
 
 SRC_URI[md5sum] = "0871e0b93c9c3c88ca950b6d9a04aed2"
@@ -62,6 +63,7 @@ INITSCRIPT_PARAM = "defaults 85 15"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system ${FTPGROUP}"
-USERADD_PARAM_${PN} = "--system -g ${FTPGROUP} ${FTPUSER}"
+USERADD_PARAM_${PN} = "--system -g ${FTPGROUP} --home-dir /var/lib/${FTPUSER} --no-create-home \
+                       --shell /bin/false ${FTPUSER}"
 
 FILES_${PN} += "/home/${FTPUSER}"
-- 
1.7.10.4


