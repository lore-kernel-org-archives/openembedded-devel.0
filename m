Return-Path: <net147@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 22ED66AFFD
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2013 13:05:00 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id lf11so4364587pab.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jul 2013 06:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=q+ucvU1scky5hsGotmaLKn5p5OdvMf1aVfDvgKbhCIc=;
	b=qyAXGUsjOeozvN+n9EZ8rw+nB0KyVT6rlNe5ZZUHpfngcIUS45nJ8sqFuozNq+xxKz
	DbhNklJvPWjQO+cMw/AHUQVrx3MAhUxzAfmguZapR+FMKO948zZ4106ko0Td5ClhEfOc
	1QVlCatoEHHywrcwiW441N7RS3+O5BiOv6zrIDWpt+KZxP6lCXEvJZQgdq1VHJ2YvIHY
	ON7L4+ONXIIsJQ5YEUEu/W9YJecodbpLc8t/KpoSE0D9EQv7/IWs/GHJO7f65/DGF8CO
	gkKXxFp9N9Q9m3ifVgjPy34NcHXuX87nN6BGPU5ggWnf0F623imjCpWbv46ZkLk2ib/U
	oSRA==
X-Received: by 10.68.210.103 with SMTP id mt7mr21135781pbc.179.1373288701190; 
	Mon, 08 Jul 2013 06:05:01 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id lk9sm6275204pab.2.2013.07.08.06.04.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Jul 2013 06:05:00 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Jul 2013 23:20:32 +1000
Message-Id: <1373289632-16273-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-webserver][PATCH] nostromo: fix installed but not shipped /run and /run/nostromo warnings
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
X-List-Received-Date: Mon, 08 Jul 2013 13:05:00 -0000

Changes:
- Remove unnecessary -c option from install
- Add tmpfiles.d config to create /run/nostromo when systemd is
  enabled in DISTRO_FEATURES
- Add postinst script to create /run/nostromo using tmpfiles.d if
  running systemd (detected by existence of /sys/fs/cgroup/systemd),
  otherwise using populate-volatile.sh if it exists
- Remove /var/log/nostromo and /var/run/nostromo from package

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../recipes-httpd/nostromo/files/tmpfiles.conf       |  1 +
 .../recipes-httpd/nostromo/nostromo_1.9.5.bb         | 20 ++++++++++++++++----
 2 files changed, 17 insertions(+), 4 deletions(-)
 create mode 100644 meta-webserver/recipes-httpd/nostromo/files/tmpfiles.conf

diff --git a/meta-webserver/recipes-httpd/nostromo/files/tmpfiles.conf b/meta-webserver/recipes-httpd/nostromo/files/tmpfiles.conf
new file mode 100644
index 0000000..b7a9f48
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nostromo/files/tmpfiles.conf
@@ -0,0 +1 @@
+d /run/nostromo - www-data www-data -
diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
index 94c32d8..e34fba2 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://www.nazgul.ch/dev/${BPN}-${PV}.tar.gz \
            file://0001-GNUmakefile-add-possibility-to-override-variables.patch \
            file://nhttpd.conf \
            file://volatiles \
+           file://tmpfiles.conf \
            file://nostromo \
 "
 
@@ -35,18 +36,29 @@ do_install() {
     install -d ${D}${localstatedir}/nostromo/conf
     install -d ${D}${localstatedir}/nostromo/htdocs/cgi-bin
     install -d ${D}${localstatedir}/nostromo/icons
-    install -d ${D}${localstatedir}/log/nostromo
-    install -d ${D}${localstatedir}/run/nostromo
     install -d ${D}${sysconfdir}/init.d
     install -m 0644 conf/mimes ${D}${localstatedir}/nostromo/conf/mimes
     install -m 0644 ${WORKDIR}/nhttpd.conf ${D}${sysconfdir}
     install -m 0755 ${WORKDIR}/nostromo ${D}${sysconfdir}/init.d
-    install -c -D -m 644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/nostromo
+    install -D -m 0644 ${WORKDIR}/volatiles ${D}${sysconfdir}/default/volatiles/nostromo
+    if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
+        install -D -m 0644 ${WORKDIR}/tmpfiles.conf ${D}${sysconfdir}/tmpfiles.d/nostromo.conf
+    fi
     install -m 0644 htdocs/index.html ${D}${localstatedir}/nostromo/htdocs/index.html
     install -m 0644 htdocs/nostromo.gif ${D}${localstatedir}/nostromo/htdocs/nostromo.gif
     install -m 0644 icons/dir.gif ${D}${localstatedir}/nostromo/icons/dir.gif
     install -m 0644 icons/file.gif ${D}${localstatedir}/nostromo/icons/file.gif
-    chown -R www-data:www-data ${D}/${localstatedir}/nostromo ${D}/${localstatedir}/log/nostromo ${D}/${localstatedir}/run/nostromo
+    chown -R www-data:www-data ${D}/${localstatedir}/nostromo
 }
 
 CONFFILES_${PN} += "/var/nostromo/conf/mimes ${sysconfdir}/nhttpd.conf"
+
+pkg_postinst_${PN} () {
+    if [ -z "$D" ]; then
+        if [ -e /sys/fs/cgroup/systemd ]; then
+            systemd-tmpfiles --create
+        elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
+            ${sysconfdir}/init.d/populate-volatile.sh update
+        fi
+    fi
+}
-- 
1.8.3.2


