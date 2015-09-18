Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 301BF76D84
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Sep 2015 05:51:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8I5pPjG003773
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Sep 2015 22:51:25 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.235.1; Thu, 17 Sep 2015 22:51:24 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <Joe_MacDonald@mentor.com>
Date: Fri, 18 Sep 2015 13:41:06 +0800
Message-ID: <1442554866-20498-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] inetutils: fix rcp to work with large file
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
X-List-Received-Date: Fri, 18 Sep 2015 05:51:28 -0000
Content-Type: text/plain

This issue occurs When we copy file by rcp command between target and host,
if the file > 2GB, it will fail.
The cause is that it used incorrect data type on file size in sink() of rcp.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0001-rcp-fix-to-work-with-large-files.patch    | 31 ++++++++++++++++++++++
 .../inetutils/inetutils_1.9.4.bb                   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/inetutils/inetutils/0001-rcp-fix-to-work-with-large-files.patch

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils/0001-rcp-fix-to-work-with-large-files.patch b/meta-networking/recipes-connectivity/inetutils/inetutils/0001-rcp-fix-to-work-with-large-files.patch
new file mode 100644
index 0000000..d4764f5
--- /dev/null
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils/0001-rcp-fix-to-work-with-large-files.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Pending
+
+Subject: rcp: fix to work with large files
+
+When we copy file by rcp command, if the file > 2GB, it will fail.
+The cause is that it used incorrect data type on file size in sink() of rcp.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/rcp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/rcp.c b/src/rcp.c
+index 21f55b6..bafa35f 100644
+--- a/src/rcp.c
++++ b/src/rcp.c
+@@ -876,9 +876,9 @@ sink (int argc, char *argv[])
+   enum
+   { YES, NO, DISPLAYED } wrerr;
+   BUF *bp;
+-  off_t i, j;
++  off_t i, j, size;
+   int amt, count, exists, first, mask, mode, ofd, omode;
+-  int setimes, size, targisdir, wrerrno;
++  int setimes, targisdir, wrerrno;
+   char ch, *cp, *np, *targ, *vect[1], buf[BUFSIZ];
+   const char *why;
+ 
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
index adfc940..50aedd3 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.4.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz \
            file://tftpd.xinetd.inetutils \
            file://inetutils-1.9-PATH_PROCNET_DEV.patch \
            file://inetutils-only-check-pam_appl.h-when-pam-enabled.patch \
+           file://0001-rcp-fix-to-work-with-large-files.patch \
 "
 
 SRC_URI[md5sum] = "04852c26c47cc8c6b825f2b74f191f52"
-- 
1.9.1


