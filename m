Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Shufj-0005Tk-Ax
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 05:36:35 +0200
Received: by dalh21 with SMTP id h21so1676145dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2012 20:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=uPdpoGAoKBejpF2ETt0EFErjlBuph60jkafwI+kbx/w=;
	b=KYlB+DvvmuRPwb0Cidwq20CeWGXfaLsknVzqCoYHcbDBlaeuBKKRte28Vg2S6D95t5
	T0d/JJ1MpCpE12mAHj/fFm1o8VWg2elKe9R4pUlVWYZv9/2iJAYnDsjShFSl3hVk7nEw
	qu4t3Qttvj7TxGScoRLGvf3tFAGHeOtyqPJFRif9HL5KM/tEGBILCZG2cIDm1kKnoNYz
	ukno+5RDTx6GjW+cSzCGSwWx2kY1jVAM+W73wIKYIKZq89xxTI2Mu41IWZSQ3NBL2OIf
	nsnTL0Ma8IBeTl8cf6QBknFjezSeDpJM87v9jig63vcUY5rK3aubRHEQWxY59a3+uut7
	bWig==
Received: by 10.68.237.106 with SMTP id vb10mr4711773pbc.148.1340335547757;
	Thu, 21 Jun 2012 20:25:47 -0700 (PDT)
Received: from localhost.localdomain ([94.205.109.242])
	by mx.google.com with ESMTPS id qa5sm7920087pbb.19.2012.06.21.20.25.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 20:25:46 -0700 (PDT)
From: Elvis Dowson <elvis.dowson@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Jun 2012 05:25:35 +0200
Message-Id: <1340335535-24039-1-git-send-email-elvis.dowson@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Elvis Dowson <elvis.dowson@gmail.com>
Subject: [meta-openembedded] connman: Update recipe name to connman_1.0.bbappend.
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
X-List-Received-Date: Fri, 22 Jun 2012 03:36:35 -0000

This commit updates the recipe name to connman_1.0.bbappend.

Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
---
 .../connman/connman_0.79.bbappend                  |    6 ------
 .../connman/connman_1.0.bbappend                   |    6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/connman/connman_0.79.bbappend
 create mode 100644 meta-oe/recipes-connectivity/connman/connman_1.0.bbappend

diff --git a/meta-oe/recipes-connectivity/connman/connman_0.79.bbappend b/meta-oe/recipes-connectivity/connman/connman_0.79.bbappend
deleted file mode 100644
index 167165f..0000000
--- a/meta-oe/recipes-connectivity/connman/connman_0.79.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-inherit systemd
-
-EXTRA_OECONF += "--with-systemdunitdir=${systemd_unitdir}/system/"
-
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE_${PN}-systemd = "connman.service"
diff --git a/meta-oe/recipes-connectivity/connman/connman_1.0.bbappend b/meta-oe/recipes-connectivity/connman/connman_1.0.bbappend
new file mode 100644
index 0000000..167165f
--- /dev/null
+++ b/meta-oe/recipes-connectivity/connman/connman_1.0.bbappend
@@ -0,0 +1,6 @@
+inherit systemd
+
+EXTRA_OECONF += "--with-systemdunitdir=${systemd_unitdir}/system/"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "connman.service"
-- 
1.7.9.5



