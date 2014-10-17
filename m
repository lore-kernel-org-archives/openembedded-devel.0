Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D1E0C708B3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Oct 2014 05:24:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9H5OPBN028346
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Oct 2014 22:24:26 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 16 Oct 2014 22:24:25 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Oct 2014 13:24:23 +0800
Message-ID: <1413523465-30242-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 1/2][meta-networking] Revert "tftp-hpa: bug fix on empty file put error"
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

This reverts commit b2eb21a5fbcb065e84ed582e87de21bdc3082f00.

It make 3d8520a0b411[tftp-hpa: add error check for disk filled up]
unable to work
---
 .../tftp-hpa-bug-fix-on-empty-file-put-error.patch |   33 --------------------
 .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |    1 -
 2 files changed, 34 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-empty-file-put-error.patch

diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-empty-file-put-error.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-empty-file-put-error.patch
deleted file mode 100644
index aa29d9c..0000000
--- a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-empty-file-put-error.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-tftp-hpa: bug fix on empty file put error
-
-With the feature that checking the disk filled up, the return value of
-function write_behind was checked and used to detect the disk status.
-While for empty file, without data being written, this function will
-return -1 thus the disk filled up error was miss-raised. Fix it.
-
-Upstream-Status: pending
-
-Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
----
- tftpd/tftpd.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
---- a/tftpd/tftpd.c
-+++ b/tftpd/tftpd.c
-@@ -1692,7 +1692,7 @@ static void tftp_recvfile(const struct f
-             syslog(LOG_WARNING, "tftpd: write(ack): %m");
-             goto abort;
-         }
--        if(write_behind(file, pf->f_convert) < 0) {
-+        if(write_behind(file, pf->f_convert) < -1) {
-             nak(ENOSPACE, NULL);
-             (void)fclose(file);
-             goto abort;
-@@ -1727,7 +1727,7 @@ static void tftp_recvfile(const struct f
-             goto abort;
-         }
-     } while (size == segsize);
--    if(write_behind(file, pf->f_convert) < 0) {
-+    if(write_behind(file, pf->f_convert) < -1) {
-         nak(ENOSPACE, NULL);
-         (void)fclose(file);
-         goto abort;
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index e58a4b1..1951747 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -25,7 +25,6 @@ SRC_URI = "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-${PV}.t
            file://init \
            file://add-error-check-for-disk-filled-up.patch \
            file://tftp-hpa-bug-fix-on-separated-CR-and-LF.patch \
-           file://tftp-hpa-bug-fix-on-empty-file-put-error.patch \
 "
 
 SRC_URI[md5sum] = "46c9bd20bbffa62f79c958c7b99aac21"
-- 
1.7.10.4


