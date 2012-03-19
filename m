Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9df1-00059K-91
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 15:34:11 +0100
Received: by wera1 with SMTP id a1so5940138wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2012 07:25:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=3rSer6+pAGtTP/2Lh/eLK2n7M5qT0Y83S7vmPbJyBfE=;
	b=RQ5iLmv7N15I4XL2zfB5DAp86Gf3sLiW78Jecv5Xoh6m8iMc2QxfnBdfwr3mlQ0KJO
	8Wb71eAnELSV2J4cFyPgwv8Kq1cnFEI0fjP2qAXoFApt/RPnY0aFoBdCHHSw+6u9dTs9
	cQc2wl5syBGumaAz2jpIRUJleL4uv+2LR9ikznGEVOAkaaC/89jlukWo9x7j1scPU3vS
	KbgawnF3rKHvcGnyjxKMucme87td0IU1Wr7CHEfXhbz+mzqtwBQV5vtWPNk/p1BocsR7
	P5EXcrfgbGrkiW9atojSgOQa3Sf6J2cN3x1S2AX00y3qg11BEU3iVcFWOyg1lYl4wme0
	/fvQ==
Received: by 10.216.135.102 with SMTP id t80mr7179354wei.59.1332167119752;
	Mon, 19 Mar 2012 07:25:19 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ff9sm25974360wib.2.2012.03.19.07.25.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 07:25:18 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2012 15:25:12 +0100
Message-Id: <1332167114-24083-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQld43PbpK2RHN0tdmPDTlkS0dZ082XEXisJqh7cD1JN9JP0UdIsSrlOs61TUvSEWrzdYplV
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 1/3] dropbear: update bbappend to match update recipe in oe-core
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
X-List-Received-Date: Mon, 19 Mar 2012 14:34:11 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../dropbear/dropbear_2011.54.bbappend             |   17 -----------------
 .../dropbear/dropbear_2012.55.bbappend             |   17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
 create mode 100644 meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend

diff --git a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
deleted file mode 100644
index fc5d047..0000000
--- a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
+++ /dev/null
@@ -1,17 +0,0 @@
-inherit systemd
-
-PRINC := "${@int(PRINC) + 2}"
-
-# look for files in the layer first
-FILESEXTRAPATHS := "${THISDIR}/${PN}"
-
-SRC_URI += "file://dropbearkey.service \
-            file://dropbear@.service \
-            file://dropbear.socket"
-
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE_${PN}-systemd = "dropbear.socket"
-
-do_install_append() {
-	ln -sf /dev/null ${D}${systemd_unitdir}/system/dropbear.service
-}
diff --git a/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend b/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
new file mode 100644
index 0000000..fc5d047
--- /dev/null
+++ b/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
@@ -0,0 +1,17 @@
+inherit systemd
+
+PRINC := "${@int(PRINC) + 2}"
+
+# look for files in the layer first
+FILESEXTRAPATHS := "${THISDIR}/${PN}"
+
+SRC_URI += "file://dropbearkey.service \
+            file://dropbear@.service \
+            file://dropbear.socket"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "dropbear.socket"
+
+do_install_append() {
+	ln -sf /dev/null ${D}${systemd_unitdir}/system/dropbear.service
+}
-- 
1.7.2.5



