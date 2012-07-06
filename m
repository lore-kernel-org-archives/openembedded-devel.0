Received: from mail-gh0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Smz86-00041D-Fp
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jul 2012 05:22:50 +0200
Received: by ghbz2 with SMTP id z2so7673712ghb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jul 2012 20:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=KXnInG+mdQ2faTrydXwcjJ/xTGuhVhF8ecedDXlRq2s=;
	b=xWWLmbGtaMmqVLWXCbhz0F+SHNoFccGHbLWMcsq2jzltyGjei2BhcQWNcVINAG7Mm+
	70R9qWuAmpUR033SjFIwbgBQ3BKkMVFXG4qABb3ptZXeFc05dMVgpGU0qFgzbG44n8hw
	Oxrpkzr9fp6uQMT+U+Z4FM2mMQB7VccnJ0Jnr79fWMrQaq4Tm2LzDMlkk08ZJa1M78ll
	U4YBPSk/p4EFT9W5uvgakta+I/tU0tk9MjdEgioenvCQn/F0vAF2q/uhgsfaflqw97CB
	Vb6jjcuRqLSxbscOktfIHHgSUDcB0qqAEhMedYhblPsOCcfn3WpfEoQ0+dMFeQvaWd/p
	VHvA==
Received: by 10.66.78.9 with SMTP id x9mr41780641paw.84.1341544304668;
	Thu, 05 Jul 2012 20:11:44 -0700 (PDT)
Received: from localhost.localdomain ([94.205.108.162])
	by mx.google.com with ESMTPS id rs4sm20952836pbc.0.2012.07.05.20.11.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jul 2012 20:11:44 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Jul 2012 06:52:29 +0400
Message-Id: <1341543150-25096-3-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1341543150-25096-1-git-send-email-elvis.dowson@gmail.com>
References: <1341543150-25096-1-git-send-email-elvis.dowson@gmail.com>
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-openembedded 3/4] lighttpd: Rename to lighttpd_1.4.31.bbappend.
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
X-List-Received-Date: Fri, 06 Jul 2012 03:22:50 -0000

This commit renames the lighttpd bbappend file to match the recipe version
provided in poky/meta/recipes-extended/lighttpd

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



