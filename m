Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SmsOC-0004tN-QP
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jul 2012 22:11:00 +0200
Received: by yenl13 with SMTP id l13so7410685yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jul 2012 12:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=wr8fkJZAcR+TuYncDUqkv5hTx4sh8WopRxp8iqy4Qas=;
	b=aqqBFcZYQd0+0IniP/2BcC+cW83DnN4EUyEPf34fKoYtSMmBw8AvwTgDIEukIcMXFf
	v5cqgBgt6DowapFO2NF5FWxcYvRa7E7NxDZl9j11r2QVMNjol6OM2G61vZvTDHVPll1M
	P4ssY4O2WIjn4X1WJNuUxs+sd/d742Kb/SZAEMzNMeyfFg/tdYEtCHlnLaX0RDBrbJfG
	qoYBU3alhUM3f+X5UZenOzrA92UYSPjqsEUAVVB133FNQ6UZ2f1+AhwaGrRU0cOarG3Z
	R1eEiFxBitdkEUNBZGA8Cp5NpP+mFh3lFiEwBBFhLHDBx5o3HUMKfa3Dpyai9YRBexcO
	Pz2g==
Received: by 10.66.89.170 with SMTP id bp10mr39646014pab.12.1341518395301;
	Thu, 05 Jul 2012 12:59:55 -0700 (PDT)
Received: from localhost.localdomain ([94.205.108.162])
	by mx.google.com with ESMTPS id ns5sm20327570pbb.26.2012.07.05.12.59.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 12:59:54 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jul 2012 23:59:43 +0400
Message-Id: <1341518383-20990-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-openembedded] lighttpd: Rename to lighttpd_1.4.31.bbappend.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2012 20:11:01 -0000

This commit renames the lighttpd bbappend file to match the recipe version
provided in poky/meta-oe/recipes-extended/lighttpd

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 .../lighttpd/lighttpd_1.4.30.bbappend              |   10 ----------
 .../lighttpd/lighttpd_1.4.31.bbappend              |   10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
 create mode 100644 meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend

diff --git a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
deleted file mode 100644
index 1341405..0000000
--- a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.30.bbappend
+++ /dev/null
@@ -1,10 +0,0 @@
-FILESEXTRAPATHS := "${THISDIR}/${PN}"
-
-PRINC := "${@int(PRINC) + 3}"
-
-inherit systemd
-
-SRC_URI += "file://lighttpd.service"
-
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "lighttpd.service"
diff --git a/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
new file mode 100644
index 0000000..1341405
--- /dev/null
+++ b/meta-oe/recipes-extended/lighttpd/lighttpd_1.4.31.bbappend
@@ -0,0 +1,10 @@
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
+
+PRINC := "${@int(PRINC) + 3}"
+
+inherit systemd
+
+SRC_URI += "file://lighttpd.service"
+
+SYSTEMD_PACKAGES = "${PN}"
+SYSTEMD_SERVICE_${PN} = "lighttpd.service"
-- 
1.7.9.5



