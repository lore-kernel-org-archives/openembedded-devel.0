Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BB05D65E94
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Oct 2014 05:24:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9H5OR4u006666
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 22:24:27 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 16 Oct 2014 22:24:26 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Oct 2014 13:24:24 +0800
Message-ID: <1413523465-30242-2-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1413523465-30242-1-git-send-email-rongqing.li@windriver.com>
References: <1413523465-30242-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2][meta-networking] tftp-hpa: fix the empty file writing error
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
X-List-Received-Date: Fri, 17 Oct 2014 05:24:30 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

make write_behind to return 0 if a empty file is written, to
distinguish a true writing failure[on which the write_behind
will return -1], then the annoying wrong log will disappear.
    ____
    |Error code 3: Disk full or allocation exceeded
    -----
Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../tftp-hpa/files/fix-writing-emtpy-file.patch    |   39 ++++++++++++++++++++
 .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |    1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/fix-writing-emtpy-file.patch

diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/fix-writing-emtpy-file.patch b/meta-networking/recipes-daemons/tftp-hpa/files/fix-writing-emtpy-file.patch
new file mode 100644
index 0000000..452aa05
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/fix-writing-emtpy-file.patch
@@ -0,0 +1,39 @@
+[PATCH] fix the empty file writting
+
+Upstream-Status: pending
+
+With the feature that checking the disk filled up, the return
+value of function write_behind was checked and used to detect
+the disk status. While for empty file, without data being
+written, this function will return -1 thus the disk filled up
+error was miss-raised.
+
+make write_behind to return 0 if written file is empty, to fix
+the this bug.
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ common/tftpsubs.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/common/tftpsubs.c b/common/tftpsubs.c
+index b4ea3f2..9f6cafc 100644
+--- a/common/tftpsubs.c
++++ b/common/tftpsubs.c
+@@ -198,9 +198,12 @@ int write_behind(FILE * file, int convert)
+     nextone = !nextone;         /* incr for next time */
+     buf = dp->th_data;
+ 
+-    if (count <= 0)
++    if (count < 0)
+         return -1;              /* nak logic? */
+ 
++    if (count == 0)
++        return 0;
++
+     if (convert == 0)
+         return write(fileno(file), buf, count);
+ 
+-- 
+1.9.1
+
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index 1951747..3f17fd6 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-${PV}.t
            file://init \
            file://add-error-check-for-disk-filled-up.patch \
            file://tftp-hpa-bug-fix-on-separated-CR-and-LF.patch \
+           file://fix-writing-emtpy-file.patch \
 "
 
 SRC_URI[md5sum] = "46c9bd20bbffa62f79c958c7b99aac21"
-- 
1.7.10.4


