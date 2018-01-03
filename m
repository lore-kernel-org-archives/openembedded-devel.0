Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBA5B71C71
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jan 2018 01:00:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w0310Fbq006619
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 2 Jan 2018 17:00:15 -0800
Received: from localhost (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 2 Jan 2018 17:00:14 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 3 Jan 2018 08:58:35 +0800
Message-ID: <1514941115-27329-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.134]
Subject: [meta-oe][PATCH] stat: add the recipe from oe-core
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
X-List-Received-Date: Wed, 03 Jan 2018 01:00:14 -0000
Content-Type: text/plain

The stat hasn't any update since 2002. All modern Linux distributions
use stat from coreutils as default. It is no longer needed by oe-core.
Move it to meta-oe.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../stat/stat-3.3/fix-error-return.patch           | 16 +++++
 .../stat/stat-3.3/fix-security-format.patch        | 68 ++++++++++++++++++++++
 meta-oe/recipes-extended/stat/stat_3.3.bb          | 35 +++++++++++
 3 files changed, 119 insertions(+)
 create mode 100644 meta-oe/recipes-extended/stat/stat-3.3/fix-error-return.patch
 create mode 100644 meta-oe/recipes-extended/stat/stat-3.3/fix-security-format.patch
 create mode 100644 meta-oe/recipes-extended/stat/stat_3.3.bb

diff --git a/meta-oe/recipes-extended/stat/stat-3.3/fix-error-return.patch b/meta-oe/recipes-extended/stat/stat-3.3/fix-error-return.patch
new file mode 100644
index 0000000..032995d
--- /dev/null
+++ b/meta-oe/recipes-extended/stat/stat-3.3/fix-error-return.patch
@@ -0,0 +1,16 @@
+This patch fixies the wrong return code of stat -h.
+
+Upstream-Status: Pending
+Signed-off-by: Zhangle Yang <zhangle.yang@windriver.com>
+
+--- stat-3.3/stat.c.orig	2013-08-22 10:49:45.000000000 +0800
++++ stat-3.3/stat.c	2013-08-22 10:50:31.000000000 +0800
+@@ -845,7 +845,7 @@
+     fprintf(stderr, "\t\t%%S - Security ID in SE-Linux\n");
+     fprintf(stderr, "\t\t%%C - Security context in SE-Linux\n");
+     fprintf(stderr, "\t\t%%d - Free file nodes in file system\n");
+-    exit(1);
++    exit(0);
+ }
+   
+ 
diff --git a/meta-oe/recipes-extended/stat/stat-3.3/fix-security-format.patch b/meta-oe/recipes-extended/stat/stat-3.3/fix-security-format.patch
new file mode 100644
index 0000000..0c01ed0
--- /dev/null
+++ b/meta-oe/recipes-extended/stat/stat-3.3/fix-security-format.patch
@@ -0,0 +1,68 @@
+stat: Fixing security formatting issues
+
+Fix security formatting issues related to printf without NULL argument 
+
+stat.c: In function 'print_human_access':
+stat.c:292:13: error: format not a string literal and no format arguments [-Werror=format-security]
+     printf (access);
+             ^
+stat.c: In function 'print_human_time':
+stat.c:299:57: error: format not a string literal and no format arguments [-Werror=format-security]
+   if (strftime(str, 40, "%c", localtime(t)) > 0) printf(str);
+                                                         ^
+stat.c: In function 'print_it':
+stat.c:613:6: error: format not a string literal and no format arguments [-Werror=format-security]
+      printf(b);
+      ^
+stat.c:642:6: error: format not a string literal and no format arguments [-Werror=format-security]
+      printf(b);
+      ^
+
+[YOCTO #9550]
+[https://bugzilla.yoctoproject.org/show_bug.cgi?id=9550]
+
+Upstream-Status: Pending
+
+Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
+
+diff --git a/stat.c b/stat.c
+index 1ed07a9..2be6f62 100644
+--- a/stat.c
++++ b/stat.c
+@@ -289,15 +289,15 @@ void print_human_access(struct stat *statbuf)
+     default:
+       access[0] = '?';
+     }
+-    printf (access);
++    fputs(access,stdout);
+ }
+ 
+ void print_human_time(time_t *t)
+ {
+   char str[40];
+   
+-  if (strftime(str, 40, "%c", localtime(t)) > 0) printf(str);
+-  else printf("Cannot calculate human readable time, sorry");
++  if (strftime(str, 40, "%c", localtime(t)) > 0) fputs(str,stdout);
++  else fputs("Cannot calculate human readable time, sorry",stdout);
+ }
+ 
+ /* print statfs info */
+@@ -610,7 +610,7 @@ void print_it(char *masterformat, char *filename,
+ 	{
+ 	    strcpy (pformat, "%");
+ 	    *m++ = '\0';
+-	    printf(b);
++	    fputs(b,stdout);
+ 
+ 	    /* copy all format specifiers to our format string */
+ 	    while (isdigit(*m) || strchr("#0-+. I", *m))
+@@ -639,7 +639,7 @@ void print_it(char *masterformat, char *filename,
+ 	}
+ 	else
+ 	{
+-	    printf(b);
++	    fputs(b,stdout);
+ 	    b = NULL;
+ 	}
+     }
diff --git a/meta-oe/recipes-extended/stat/stat_3.3.bb b/meta-oe/recipes-extended/stat/stat_3.3.bb
new file mode 100644
index 0000000..8ac8e89
--- /dev/null
+++ b/meta-oe/recipes-extended/stat/stat_3.3.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Command line file status display utility"
+HOMEPAGE = "http://www.ibiblio.org/pub/Linux/utils/file/"
+DESCRIPTION = "Displays all information about a file that the stat() call provides and all information about a filesystem that statfs() provides."
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=39886b077fd072e876e5c4c16310b631 \
+                    file://GPL;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+SRC_URI = "http://www.ibiblio.org/pub/Linux/utils/file/${BP}.tar.gz \
+           file://fix-security-format.patch \
+           file://fix-error-return.patch"
+
+SRC_URI[md5sum] = "37e247e8e400ad9205f1b0500b728fd3"
+SRC_URI[sha256sum] = "7071f0384a423a938dd542c1f08547a02824f6359acd3ef3f944b2c4c2d1ee09"
+
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
+do_install() {
+	install -d ${D}${base_bindir} ${D}${mandir}/man1
+	install -m 755 stat ${D}${base_bindir}/stat.stat
+	install -m 644 stat.1 ${D}${mandir}/man1
+}
+
+inherit update-alternatives
+
+ALTERNATIVE_${PN} = "stat"
+ALTERNATIVE_PRIORITY[stat] = "200"
+ALTERNATIVE_LINK_NAME[stat] = "${base_bindir}/stat"
+ALTERNATIVE_TARGET[stat] = "${base_bindir}/stat.stat"
+
+ALTERNATIVE_${PN}-doc = "stat.1"
+ALTERNATIVE_LINK_NAME[stat.1] = "${mandir}/man1/stat.1"
+
+BBCLASSEXTEND = "native"
+
-- 
2.7.4


