Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSL-0007zC-Nk
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:42:33 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247498bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=yBRiDvLnBIq0j6ASQpljuIEHDKrPQ/uK3iWi4G2HheU=;
	b=wqiDUtpgYAekxMhEVAuB8A5bdh3NLphb5jPU/BEwJhOpxK//RU+LXzQEhWx7v9pIeB
	w5werz155MlFYopJLxTmQmO1Oe+xdl2RAWmdoKe9Qd/R88QDHLt3GzOdzndFM6Wwpvot
	zZosXDBpqfxAaGPg1nEEX/Q/rR27laD+ldsAmk8r2q/PwYD/jS+NyXkYeZAjCbrIF6s7
	5Sr/rP4ieIkO1LzTIhm69JU/j/xwIkIfuymmlr5jvJLPast8em311PpapvjsxZEXXOkF
	aVAtJovXqnhIW+Bk6J6Yt9Efdyc2K6XUifkBJJDaRPX/99NNng708NJ03NF3ojD4JmGn
	Pn0A==
Received: by 10.205.117.141 with SMTP id fm13mr105643bkc.125.1342168281905;
	Fri, 13 Jul 2012 01:31:21 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:18 +0200
Message-Id: <1342168240-7760-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe,V2 10/32] gdm: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:42:35 -0000
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
index 0000000..7308346
--- /dev/null
+++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
@@ -0,0 +1,13 @@
+# look for files in the layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
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
1.7.6.5



