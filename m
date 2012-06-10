Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3Q-0001gN-TX
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:12 +0200
Received: by wibhm14 with SMTP id hm14so1978843wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Qpvq8UAl/yamegv6XzG/0DmD5m2srlJksIsdJRGmO2Y=;
	b=r1iDuL7Al0b8hgaMDURLDG2cfatDFktSBImt4j+/uvYYXhrsclq9qf8heoIWdMM5zJ
	ciDoekAVVucT4FP/KnLqolLt23V6B3Dug17uN2xK6xyhpP7cNRPMhZQj9Eo+PlCH/3tu
	7JTyIQmoTWVvyb/QjGtwR1zSGEpjpTcYoD/dbHy7Yfz1SI8K6U/BzD5o2y5yDMSWsCs7
	QUJJ3cUEkwl+3wB/qSgGuzwvKDLEqjtiTYgI5PL2AhhtEKG1JziRcPdLjD8qpohkvqRx
	lIxNl8+dUzf99A9cWxzliFJ5/qyrvMaIU1VAkFYypbDBC1eBRulfFZLj91992pdhGXUH
	jmZg==
Received: by 10.216.145.157 with SMTP id p29mr5123198wej.65.1339364500551;
	Sun, 10 Jun 2012 14:41:40 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.41.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:41:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:38 +0200
Message-Id: <1339364820-2880-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 05/27] gdm: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |    8 ++------
 .../meta-gnome}/recipes-gnome/gdm/gdm/gdm.service  |    0
 .../recipes-gnome/gdm/gdm_2.32.2.bbappend          |   13 +++++++++++++
 3 files changed, 15 insertions(+), 6 deletions(-)
 rename {meta-gnome => meta-systemd/meta-gnome}/recipes-gnome/gdm/gdm/gdm.service (100%)
 create mode 100644 meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index 6ebd587..bdf249e 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "xinput gnome-panel tcp-wrappers libcanberra libxklavier grep consolekit libpam gnome-doc-utils gtk+ xrdb"
 
-PR = "r8"
+PR = "r9"
 
-inherit gnome update-rc.d systemd
+inherit gnome update-rc.d
 
 SRC_URI += " \
             file://cross-xdetection.diff \
@@ -17,7 +17,6 @@ SRC_URI += " \
             file://gdm.conf \
             file://gdm-pam \
             file://Default \
-            file://gdm.service \
            "
 
 SRC_URI[archive.md5sum] = "dbe5187a2e17881cc454e313e0ae8d1e"
@@ -48,9 +47,6 @@ do_install_append() {
 
 }
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "gdm.service"
-
 FILES_${PN} += "${datadir}/icon* \
 		${datadir}/xsession* \
                "
diff --git a/meta-gnome/recipes-gnome/gdm/gdm/gdm.service b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
similarity index 100%
rename from meta-gnome/recipes-gnome/gdm/gdm/gdm.service
rename to meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
new file mode 100644
index 0000000..2dcaa16
--- /dev/null
+++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
@@ -0,0 +1,13 @@
+# look for files in the layer first
+FILESEXTRAPATHS := "${THISDIR}/gdm"
+
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SRC_URI += " \
+            file://gdm.service \
+           "
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "gdm.service"
-- 
1.7.4.4



