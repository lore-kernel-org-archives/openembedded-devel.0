Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3F5A5739BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jul 2015 08:56:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t668uoDY023041
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 Jul 2015 01:56:50 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 6 Jul 2015 01:56:49 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 Jul 2015 16:56:07 +0800
Message-ID: <1436172967-1489-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] inetutils: fix tcpd path of rlogin rsh and rexec
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
X-List-Received-Date: Mon, 06 Jul 2015 08:56:51 -0000
Content-Type: text/plain

From: Jian Liu <jian.liu@windriver.com>

rlogin, rsh and rexec xinet.d script, a wrong path is
being referenced under the server section.

server = /usr/bin/tcpd
instead of
server = /usr/sbin/tcpd

tcpd is provided by tcp-wrappers

Written-by: Herve.Patriarche <herve.patriarche@windriver.com>
Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 .../inetutils/inetutils-1.9.2/rexec.xinetd.inetutils                    | 2 +-
 .../inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils                   | 2 +-
 .../recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils
index 80aed36..7354360 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rexec.xinetd.inetutils
@@ -14,7 +14,7 @@ service exec
 	group		= root
 	log_on_success	+= USERID
 	log_on_failure	+= USERID
-	server		= /usr/bin/tcpd
+	server		= /usr/sbin/tcpd
 	server_args	= /usr/sbin/in.rexecd
 	disable		= yes
 }
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils
index 00dbf93..70493e6 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rlogin.xinetd.inetutils
@@ -14,7 +14,7 @@ service login
 	group		= root
 	log_on_success	+= USERID
 	log_on_failure	+= USERID
-	server		= /usr/bin/tcpd
+	server		= /usr/sbin/tcpd
 	server_args	= /usr/sbin/in.rlogind -a
 	disable		= yes
 }
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils
index ad59b62..a842eb9 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.2/rsh.xinetd.inetutils
@@ -15,7 +15,7 @@ service shell
 	group		= root
 	log_on_success	+= USERID
 	log_on_failure	+= USERID
-	server		= /usr/bin/tcpd
+	server		= /usr/sbin/tcpd
 	server_args	= /usr/sbin/in.rshd -aL
 	disable		= yes
 }
-- 
1.9.1


