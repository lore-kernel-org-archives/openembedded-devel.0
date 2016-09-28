Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA67B600BB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 07:44:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8S7iIGO023701
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Sep 2016 00:44:18 -0700 (PDT)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 28 Sep 2016 00:44:17 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Sep 2016 15:44:16 +0800
Message-ID: <1475048656-83199-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] edac-utils: add systemd init script for edac
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Sep 2016 07:44:18 -0000
Content-Type: text/plain

In order to add the systemd init script for edac, we need to add
some perl module to make sure the correct startup.

(LOCAL REV: NOT UPSTREAM) -- Send to meta-openembedded 20160928

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 meta-oe/recipes-support/edac-utils/edac-utils_git.bb  | 14 +++++++++++++-
 meta-oe/recipes-support/edac-utils/files/edac.service | 11 +++++++++++
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/edac-utils/files/edac.service

diff --git a/meta-oe/recipes-support/edac-utils/edac-utils_git.bb b/meta-oe/recipes-support/edac-utils/edac-utils_git.bb
index c0ad665..b3ff1cc 100644
--- a/meta-oe/recipes-support/edac-utils/edac-utils_git.bb
+++ b/meta-oe/recipes-support/edac-utils/edac-utils_git.bb
@@ -14,9 +14,10 @@ S = "${WORKDIR}/git"
 SRC_URI = "git://github.com/grondo/edac-utils \
     file://make-init-script-be-able-to-automatically-load-EDAC-.patch \
     file://add-restart-to-initscript.patch \
+    file://edac.service \
 "
 
-inherit autotools-brokensep
+inherit autotools-brokensep systemd
 
 do_configure_prepend () {
     touch ${S}/ChangeLog
@@ -31,4 +32,15 @@ RDEPENDS_${PN}_powerpc = "dmidecode"
 RDEPENDS_${PN}_powerpc64 = "dmidecode"
 RDEPENDS_${PN}_append = " \
     perl-module-file-basename perl-module-file-find perl-module-getopt-long perl-module-posix \
+    perl-module-overload \
+    perl-module-overloading \
+    perl-module-file-glob \
 "
+
+do_install_append() {
+	install -d ${D}${systemd_unitdir}/system
+	install -m 644 ${WORKDIR}/edac.service ${D}/${systemd_unitdir}/system
+	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}/${systemd_unitdir}/system/edac.service
+}
+
+SYSTEMD_SERVICE_${PN} = "edac.service"
diff --git a/meta-oe/recipes-support/edac-utils/files/edac.service b/meta-oe/recipes-support/edac-utils/files/edac.service
new file mode 100644
index 0000000..9f687a8
--- /dev/null
+++ b/meta-oe/recipes-support/edac-utils/files/edac.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Initialize EDAC Drivers For Machine Hardware
+
+[Service]
+Type=oneshot
+ExecStart=@SBINDIR@/edac-ctl --register-labels
+ExecStop=@SBINDIR@/edac-ctl --unload
+RemainAfterExit=yes
+
+[Install]
+WantedBy=multi-user.target
-- 
2.7.4


