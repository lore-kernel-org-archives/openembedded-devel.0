Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2826460438
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2014 03:19:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7E3Je1Z003899
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Aug 2014 20:19:41 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 13 Aug 2014 20:19:40 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Aug 2014 11:19:42 +0800
Message-ID: <1407986382-29305-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH][meta-oe] eject: three fixes
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
X-List-Received-Date: Thu, 14 Aug 2014 03:19:40 -0000
Content-Type: text/plain

From: Morgan Little <morgan.little@windriver.com>

eject-2.1.1-verbose.patch: Kept to help with debugging
eject-2.1.5-spaces.patch: help with spaces in the mount path
eject-timeout.patch: allow a longer timeout

Signed-off-by: Morgan Little <morgan.little@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../eject/eject/eject-2.1.1-verbose.patch          |   19 ++++++
 .../eject/eject/eject-2.1.5-spaces.patch           |   66 ++++++++++++++++++++
 .../eject/eject/eject-timeout.patch                |   17 +++++
 meta-oe/recipes-support/eject/eject_2.1.5.bb       |    3 +
 4 files changed, 105 insertions(+)
 create mode 100644 meta-oe/recipes-support/eject/eject/eject-2.1.1-verbose.patch
 create mode 100644 meta-oe/recipes-support/eject/eject/eject-2.1.5-spaces.patch
 create mode 100644 meta-oe/recipes-support/eject/eject/eject-timeout.patch

diff --git a/meta-oe/recipes-support/eject/eject/eject-2.1.1-verbose.patch b/meta-oe/recipes-support/eject/eject/eject-2.1.1-verbose.patch
new file mode 100644
index 0000000..7403606
--- /dev/null
+++ b/meta-oe/recipes-support/eject/eject/eject-2.1.1-verbose.patch
@@ -0,0 +1,19 @@
+Kept to help with debugging
+
+Upstream-Status: Pending
+
+Signed-off-by: Morgan Little <morgan.little@windriver.com>
+
+--- eject-2.1.1/eject.c.tn	2005-08-24 11:27:42.000000000 +0200
++++ eject-2.1.1/eject.c	2005-08-24 11:33:05.000000000 +0200
+@@ -638,7 +638,9 @@
+ 	unsigned char sense_buffer[32];
+ 
+ 	if ((ioctl(fd, SG_GET_VERSION_NUM, &k) < 0) || (k < 30000)) {
+-	  printf("not an sg device, or old sg driver\n");
++	  if (v_option) {
++		  printf(_("not an sg device, or old sg driver\n"));
++	  }
+ 	  return 0;
+ 	}
+ 
diff --git a/meta-oe/recipes-support/eject/eject/eject-2.1.5-spaces.patch b/meta-oe/recipes-support/eject/eject/eject-2.1.5-spaces.patch
new file mode 100644
index 0000000..a16c4b1
--- /dev/null
+++ b/meta-oe/recipes-support/eject/eject/eject-2.1.5-spaces.patch
@@ -0,0 +1,66 @@
+Kept to help with spaces in the mount path
+
+Upstream-Status: Backport
+
+Linux mangles spaces in mount points by changing them to an octal string
+of '\040'.  So lets scan the mount point and fix it up by replacing all
+occurrences off '\0##' with the ASCII value of 0##.  Requires a writable
+string as input as we mangle in place.  Some of this was taken from the
+util-linux package.
+
+Signed-off-by: Morgan Little <morgan.little@windriver.com>
+--- eject/eject.c.ori   2007-06-24 00:08:44 -0700
++++ eject/eject.c       2007-06-24 00:12:44 -0700
+@@ -370,6 +370,30 @@
+ 
+ 
+ /*
++ * Linux mangles spaces in mount points by changing them to an octal string
++ * of '\040'.  So lets scan the mount point and fix it up by replacing all
++ * occurrences off '\0##' with the ASCII value of 0##.  Requires a writable
++ * string as input as we mangle in place.  Some of this was taken from the
++ * util-linux package.
++ */
++#define octalify(a) ((a) & 7)
++#define tooctal(s) (64*octalify(s[1]) + 8*octalify(s[2]) + octalify(s[3]))
++#define isoctal(a) (((a) & ~7) == '0')
++static char *DeMangleMount(char *s)
++{
++	char *tmp = s;
++	while ((tmp = strchr(tmp, '\\')) != NULL) {
++		if (isoctal(tmp[1]) && isoctal(tmp[2]) && isoctal(tmp[3])) {
++			tmp[0] = tooctal(tmp);
++			memmove(tmp+1, tmp+4, strlen(tmp)-3);
++		}
++		++tmp;
++	}
++	return s;
++}
++
++
++/*
+  * Given name, such as foo, see if any of the following exist:
+  *
+  * foo (if foo starts with '.' or '/')
+@@ -884,8 +908,8 @@
+ 			if (((strcmp(s1, name) == 0) || (strcmp(s2, name) == 0)) ||
+ 				((maj != -1) && (maj == mtabmaj) && (min == mtabmin))) {
+ 				FCLOSE(fp);
+-				*deviceName = strdup(s1);
+-				*mountName = strdup(s2);
++				*deviceName = DeMangleMount(strdup(s1));
++				*mountName = DeMangleMount(strdup(s2));
+ 				return 1;
+ 			}
+ 		}
+@@ -928,8 +952,8 @@
+ 		rc = sscanf(line, "%1023s %1023s", s1, s2);
+ 		if (rc >= 2 && s1[0] != '#' && strcmp(s2, name) == 0) {
+ 			FCLOSE(fp);
+-			*deviceName = strdup(s1);
+-			*mountName = strdup(s2);
++			*deviceName = DeMangleMount(strdup(s1));
++			*mountName = DeMangleMount(strdup(s2));
+ 			return 1;
+ 		}
+ 	}
diff --git a/meta-oe/recipes-support/eject/eject/eject-timeout.patch b/meta-oe/recipes-support/eject/eject/eject-timeout.patch
new file mode 100644
index 0000000..de8146f
--- /dev/null
+++ b/meta-oe/recipes-support/eject/eject/eject-timeout.patch
@@ -0,0 +1,17 @@
+allow a longer timeout
+
+Upstream-Status: Backport 
+
+Signed-off-by: Morgan Little <morgan.little@windriver.com>
+
+--- eject/eject.c.orig	2006-08-07 16:35:15.000000000 +0200
++++ eject/eject.c	2006-08-07 16:35:54.000000000 +0200
+@@ -723,7 +723,7 @@
+ 	io_hdr.dxfer_len = 0;
+ 	io_hdr.dxferp = inqBuff;
+ 	io_hdr.sbp = sense_buffer;
+-	io_hdr.timeout = 2000;
++	io_hdr.timeout = 10000;
+ 
+ 	io_hdr.cmdp = allowRmBlk;
+ 	status = ioctl(fd, SG_IO, (void *)&io_hdr);
diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index 9534577..0440f0c 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -7,6 +7,9 @@ inherit autotools gettext update-alternatives
 
 SRC_URI = "http://sources.openembedded.org/${BP}.tar.gz \
            file://eject-2.1.5-error-return.patch \
+           file://eject-2.1.1-verbose.patch \
+           file://eject-2.1.5-spaces.patch \
+           file://eject-timeout.patch \
 "
 
 SRC_URI[md5sum] = "b96a6d4263122f1711db12701d79f738"
-- 
1.7.10.4


