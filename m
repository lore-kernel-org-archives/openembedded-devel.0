Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0733A713EE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 07:28:59 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id p10so12967100pdj.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Sep 2014 00:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZP5vlC31JYzMYh3lVIuk2jySbMon4ehajkj3qMdj0ys=;
	b=DmiW4D3R9EsYzD/qVX4Gwn3tnd9THSe4+FUEGDpiryLN9+wwRrqTHANQ0x3d/gZKpr
	pHYIPqu4bvnvV7DcOqWFoa4C3n37bh2NlwdZNjgzdCgeQAZiKgBz0lnPH/LFxdo1l4OH
	VKgFpkjkYmwPu6rUvguB3jpSppxptyyWtXA+ImGZucOb6RrX5MK3b1XMxa94zpot46Ei
	jZpSPM3yGwqHC0qL+FVA5h0V8LW8Njc932J/rM2tT8+IaOu6gXcuDOkIF3WTm7CH+aVH
	qzRIZxJLvUcOvS1J3mUXgFNyiPAET4aqcUwbTaXTQTx3/saTcSUl85DHvpbp0Okazj5f
	erZg==
X-Received: by 10.66.161.169 with SMTP id xt9mr5608319pab.102.1409815737071;
	Thu, 04 Sep 2014 00:28:57 -0700 (PDT)
Received: from haswell.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id pn13sm845213pdb.53.2014.09.04.00.28.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Sep 2014 00:28:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Sep 2014 00:32:36 -0700
Message-Id: <1409815958-24314-4-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1409815958-24314-1-git-send-email-raj.khem@gmail.com>
References: <1409815958-24314-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/6] Fix build with glibc 2.20
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
X-List-Received-Date: Thu, 04 Sep 2014 07:29:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libmtp/libmtp-1.1.5/glibc-2.20.patch           | 36 ++++++++++++++++++++++
 .../recipes-connectivity/libmtp/libmtp_1.1.5.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/libmtp/libmtp-1.1.5/glibc-2.20.patch

diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp-1.1.5/glibc-2.20.patch b/meta-oe/recipes-connectivity/libmtp/libmtp-1.1.5/glibc-2.20.patch
new file mode 100644
index 0000000..38b45c2
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp-1.1.5/glibc-2.20.patch
@@ -0,0 +1,36 @@
+
+Include config.h so we get the defines available for subsequent
+include files
+
+Fixes errors like
+
+| In file included from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/sysroots/beaglebone/usr/include/string.h:634:0,
+|                  from /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/work/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/libmtp/1.1.5-r0/libmtp-1.1.5/src/util.c:36:
+| /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/work/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/libmtp/1.1.5-r0/libmtp-1.1.5/src/util.h:29:7: error: expected identifier or '(' before '__extension
+__'
+|  char *strndup (const char *s, size_t n);
+|        ^
+| /home/ubuntu/work/upstream/openembedded-core/build/tmp-glibc/work/cortexa8t2hf-vfp-neon-oe-linux-gnueabi/libmtp/1.1.5-r0/libmtp-1.1.5/src/util.c:111:7: error: expected identifier or '(' before '__extensio
+n__'
+|  char *strndup (const char *s, size_t n)
+|        ^
+| make[2]: *** [libmtp_la-util.lo] Error 1
+
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: libmtp-1.1.5/src/util.c
+===================================================================
+--- libmtp-1.1.5.orig/src/util.c	2011-01-10 05:37:21.000000000 -0800
++++ libmtp-1.1.5/src/util.c	2014-09-03 23:50:44.703563888 -0700
+@@ -22,6 +22,8 @@
+  * Boston, MA 02111-1307, USA.
+  */
+ 
++#include "config.h"
++
+ /* MSVC does not have these */
+ #ifndef _MSC_VER
+ #include <sys/time.h>
diff --git a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
index 004323a..de63c72 100644
--- a/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
+++ b/meta-oe/recipes-connectivity/libmtp/libmtp_1.1.5.bb
@@ -19,6 +19,7 @@ SCM_URI = "git://git.code.sf.net/p/libmtp/code"
 SRC_URI = "\
     ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
     file://69-libmtp.rules \
+    file://glibc-2.20.patch \
 "
 SRC_URI[md5sum] = "f80e45c0e6e5798c434bb1c26a7b602d"
 SRC_URI[sha256sum] = "787679171baf8b3cf2fcc03196c705ab4d7cbc969bd71f9d3696be1ce7f1c63a"
-- 
2.1.0


