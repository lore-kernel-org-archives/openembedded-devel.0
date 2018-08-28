Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1978874F09
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 02:27:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7S2Roe4002240
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 19:27:50 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 27 Aug 2018 19:27:49 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Aug 2018 10:27:48 +0800
Message-ID: <1535423268-17465-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH] drbd-utils: fix usrmerge install path
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
X-List-Received-Date: Tue, 28 Aug 2018 02:27:50 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Install the files under folder /usr/lib/drbd
to instead of /lib/drbd and also /usr/lib/udev
to instead of /lib/udev/ when usrmerge enabled
to fix below issue:

| WARNING: drbd-utils-9.5.0-r0 do_package: QA Issue: drbd-utils: Files/directories were installed but not shipped in any package:
  /lib/drbd/drbdsetup-84
  /lib/drbd/drbdadm-83
  /lib/drbd/drbdsetup-83
  /lib/drbd/drbdadm-84
  /lib/drbd/drbd
| Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_insta.
| drbd-utils: 5 installed and not shipped files. [installed-vs-shipped]

| ERROR: QA Issue: drbd-utils-dbg package is not obeying usrmerge distro feature. /lib should be relocated to /usr. [usrmerge]

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-networking/recipes-support/drbd/drbd-utils_9.5.0.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.5.0.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.5.0.bb
index 0e3f952..bd1e857 100644
--- a/meta-networking/recipes-support/drbd/drbd-utils_9.5.0.bb
+++ b/meta-networking/recipes-support/drbd/drbd-utils_9.5.0.bb
@@ -33,9 +33,20 @@ EXTRA_OECONF = " \
                 --with-distro debian          \
                 --with-initscripttype=both    \
                 --with-systemdunitdir=${systemd_unitdir}/system \
-                --without-manual\
+                --without-manual \
                "
 
+do_configure_prepend() {
+    # move the the file under folder /lib/drbd/ to /usr/lib/drbd when usrmerge enabled
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'true', 'false', d)}; then
+        for m_file in `find ${S} -name 'Makefile.in'`; do
+            sed -i -e "s;\$(DESTDIR)\/lib\/drbd;\$(DESTDIR)\${nonarch_libdir}\/drbd;g" $m_file
+        done
+        # move the the file under folder /lib/udev/ to /usr/lib/udev when usrmerge enabled
+        sed -i -e "s;default_udevdir=/lib/udev;default_udevdir=\${prefix}/lib/udev;g" ${S}/configure.ac
+    fi
+
+}
 do_install_append() {
     # don't install empty /var/lock to avoid conflict with base-files
     rm -rf ${D}${localstatedir}/lock
-- 
2.7.4


