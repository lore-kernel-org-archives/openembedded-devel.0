Return-Path: <xiao.zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E0DD46AD68
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 06:53:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5B6re65008663
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 23:53:40 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 10 Jun 2014 23:53:39 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 11 Jun 2014 14:53:37 +0800
Message-ID: <1402469617-23634-1-git-send-email-xiao.zhang@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] tftp-hpa: bug fix on separated CR and LF
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
X-List-Received-Date: Wed, 11 Jun 2014 06:53:40 -0000
Content-Type: text/plain

In ascii mode, if the CR and LF was separated into different transfer
blocks, This LF will be just dropped instead of replacing the previous
CR. Add a checking on the first character to fix it.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 .../tftp-hpa-bug-fix-on-separated-CR-and-LF.patch  |   38 ++++++++++++++++++++
 .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |    1 +
 2 files changed, 39 insertions(+), 0 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-separated-CR-and-LF.patch

diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-separated-CR-and-LF.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-separated-CR-and-LF.patch
new file mode 100644
index 0000000..3e220ec
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-separated-CR-and-LF.patch
@@ -0,0 +1,38 @@
+From 6ed1eb8829dee351b54e183bc42c007cb306aaa5 Mon Sep 17 00:00:00 2001
+From: Zhang Xiao <xiao.zhang@windriver.com>
+Date: Wed, 11 Jun 2014 14:01:16 +0800
+Subject: [PATCH] tftp-hpa: bug fix on separated CR and LF
+
+In ascii mode, if the CR and LF was separated into different transfer
+blocks, LF will be just dropped instead of replacing the previous CR.
+Add a checking on the first character to fix it.
+
+Upstream-Status: pending
+
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+---
+ common/tftpsubs.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/common/tftpsubs.c b/common/tftpsubs.c
+index b4d4ffe..b4ea3f2 100644
+--- a/common/tftpsubs.c
++++ b/common/tftpsubs.c
+@@ -207,6 +207,14 @@ int write_behind(FILE * file, int convert)
+     p = buf;
+     ct = count;
+     count = 0;
++
++    /* Check the first character together with prevchar */
++    c = *p;
++    if ((prevchar == '\r') && (c == '\n')) {
++        lseek(fileno(file), -1, SEEK_CUR);
++        count++;
++    }
++
+     while (ct--) {              /* loop over the buffer */
+         c = *p++;               /* pick up a character */
+         if (prevchar == '\r') { /* if prev char was cr */
+-- 
+1.8.5.2.233.g932f7e4
+
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index 6978e06..eb8d00e 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-${PV}.t
            file://default \
            file://init \
            file://add-error-check-for-disk-filled-up.patch \
+           file://tftp-hpa-bug-fix-on-separated-CR-and-LF.patch \
 "
 
 SRC_URI[md5sum] = "46c9bd20bbffa62f79c958c7b99aac21"
-- 
1.7.0.4


