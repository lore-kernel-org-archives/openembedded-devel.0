Return-Path: <xiao.zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 19CE171435
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Sep 2014 09:40:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s849eNEn029680
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 4 Sep 2014 02:40:23 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 4 Sep 2014 02:40:22 -0700
From: Zhang Xiao <xiao.zhang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 4 Sep 2014 17:40:17 +0800
Message-ID: <1409823617-1310-1-git-send-email-xiao.zhang@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] tftp-hpa: bug fix on empty file put error
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
X-List-Received-Date: Thu, 04 Sep 2014 09:40:28 -0000
Content-Type: text/plain

With the feature that checking the disk filled up, the return value of
function write_behind was checked and used to detect the disk status.
While for empty file, without data being written, this function will
return -1 thus the disk filled up error was miss-raised. Fix it.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
---
 .../tftp-hpa-bug-fix-on-empty-file-put-error.patch | 33 ++++++++++++++++++++++
 .../recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb       |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-empty-file-put-error.patch

diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-empty-file-put-error.patch b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-empty-file-put-error.patch
new file mode 100644
index 0000000..aa29d9c
--- /dev/null
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/tftp-hpa-bug-fix-on-empty-file-put-error.patch
@@ -0,0 +1,33 @@
+tftp-hpa: bug fix on empty file put error
+
+With the feature that checking the disk filled up, the return value of
+function write_behind was checked and used to detect the disk status.
+While for empty file, without data being written, this function will
+return -1 thus the disk filled up error was miss-raised. Fix it.
+
+Upstream-Status: pending
+
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+---
+ tftpd/tftpd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+--- a/tftpd/tftpd.c
++++ b/tftpd/tftpd.c
+@@ -1692,7 +1692,7 @@ static void tftp_recvfile(const struct f
+             syslog(LOG_WARNING, "tftpd: write(ack): %m");
+             goto abort;
+         }
+-        if(write_behind(file, pf->f_convert) < 0) {
++        if(write_behind(file, pf->f_convert) < -1) {
+             nak(ENOSPACE, NULL);
+             (void)fclose(file);
+             goto abort;
+@@ -1727,7 +1727,7 @@ static void tftp_recvfile(const struct f
+             goto abort;
+         }
+     } while (size == segsize);
+-    if(write_behind(file, pf->f_convert) < 0) {
++    if(write_behind(file, pf->f_convert) < -1) {
+         nak(ENOSPACE, NULL);
+         (void)fclose(file);
+         goto abort;
diff --git a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
index 1951747..e58a4b1 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
+++ b/meta-networking/recipes-daemons/tftp-hpa/tftp-hpa_5.2.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://kernel.org/pub/software/network/tftp/tftp-hpa/tftp-hpa-${PV}.t
            file://init \
            file://add-error-check-for-disk-filled-up.patch \
            file://tftp-hpa-bug-fix-on-separated-CR-and-LF.patch \
+           file://tftp-hpa-bug-fix-on-empty-file-put-error.patch \
 "
 
 SRC_URI[md5sum] = "46c9bd20bbffa62f79c958c7b99aac21"
-- 
1.8.5.2.233.g932f7e4


