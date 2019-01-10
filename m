Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id E4AB17C08D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 20:13:22 +0000 (UTC)
Received: from localhost.localdomain (lfbn-1-8921-123.w193-250.abo.wanadoo.fr
	[193.250.63.123])
	by koncepto.io (Postfix) with ESMTPSA id 0B5DB60566;
	Thu, 10 Jan 2019 21:13:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1547151202;
	bh=VEXQa5s8ynfuOfB3S1U5qKhlUuUiGJnHvkcjsb+9XOk=;
	h=From:To:Cc:Subject:Date:From;
	b=c2I0MEJ6ESUzVn8dpkYOaYioBHYBLzq0p2AqIvVWXqNcKvy7Pnfs+Xqex7oBJXTYr
	4LAD3XjGTpJcKR/RjwY+gX4JXe+p9708FeoDOgS3GJPYG2EO3grNIPZiiLoRGNDJC+
	SBCfU2UKXNKaqdX+9jetNn6h0YbhW17JdSnaBDUPUNmjnn2O6SM3zFjX9nLEd5pOvs
	7+eAxCmA9OVwJgSS1amE7ULUw9nu78KAEBSyN1pmipSfJiqIPFbIMOqGbUNqBIyA0Y
	EL+NTV8+hNF2awSNMcAsK1TwD67/GxULYR8folWR3fue1za4w+wE35WtBaKw0s0Vmy
	vMcYwQZnPTygQ==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2019 21:12:40 +0100
Message-Id: <1547151161-31217-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH v2 1/2] minicoredumper: Update to 2.0.1
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
X-List-Received-Date: Thu, 10 Jan 2019 20:13:23 -0000

- Drop upstreamed patch
- Update COPYING file checksum: the copyright date changes
	 and there is a convertion to SPDX Format.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---

Changes in v2: Commit Log

 .../minicoredumper/minicoredumper_2.0.0.bb         | 47 ----------------------
 .../minicoredumper/minicoredumper_2.0.1.bb         | 46 +++++++++++++++++++++
 2 files changed, 46 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb

diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
deleted file mode 100644
index bae5cf4..0000000
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = "minicoredumper provides an alternate core dump facility for Linux \
-to allow minimal and customized crash dumps"
-LICENSE = " LGPLv2.1 & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=aa846ae365f71b69e9fa0d21a56391ec \
-                    file://COPYING.BSD;md5=b915ac80d5236d6aa659cb986daf00e5 \
-                    file://COPYING.LGPLv2.1;md5=321bf41f280cf805086dd5a720b37785 \
-                   "
-DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux json-c"
-
-inherit autotools pkgconfig systemd update-rc.d
-
-SRCREV = "1c0d5960b0bb4bac7566e6afe8bc9705399cc76b"
-
-PR .= "+git${SRCPV}"
-
-SRC_URI = "git://git.linuxfoundation.org/diamon/minicoredumper.git;protocol=http \
-           file://minicoredumper.service \
-           file://minicoredumper.init \
-           file://0001-minicoredumper-Initialize-pointer-to-config-struct-t.patch \
-           "
-
-S = "${WORKDIR}/git"
-
-SYSTEMD_SERVICE_${PN} = "minicoredumper.service"
-SYSTEMD_AUTO_ENABLE = "enable"
-
-INITSCRIPT_PACKAGES = "${PN}"
-INITSCRIPT_NAME_${PN} = "minicoredumper"
-INITSCRIPT_PARAMS_${PN} = "defaults 89"
-
-do_install_append() {
-    rmdir ${D}${localstatedir}/run
-    install -d ${D}/${sysconfdir}/minicoredumper
-    cp -rf ${S}/etc/* ${D}/${sysconfdir}/
-
-    install -d ${D}${systemd_system_unitdir}
-    install -m 0644 ${WORKDIR}/minicoredumper.service ${D}${systemd_system_unitdir}
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0644 ${WORKDIR}/minicoredumper.init ${D}${sysconfdir}/init.d/minicoredumper
-
-    # correct path of minicoredumper
-    sed -i -e s:/usr/bin/minicoredumper:${sbindir}/minicoredumper:g ${D}${sysconfdir}/init.d/minicoredumper
-    sed -i -e s:/usr/bin/minicoredumper:${sbindir}/minicoredumper:g ${D}${systemd_system_unitdir}/minicoredumper.service
-}
-
-# http://errors.yoctoproject.org/Errors/Details/186966/
-EXCLUDE_FROM_WORLD_libc-musl = "1"
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
new file mode 100644
index 0000000..50dab8d
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
@@ -0,0 +1,46 @@
+SUMMARY = "minicoredumper provides an alternate core dump facility for Linux \
+to allow minimal and customized crash dumps"
+LICENSE = " LGPLv2.1 & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=71827c617ec7b45a0dd23658347cc1e9 \
+                    file://COPYING.BSD;md5=b915ac80d5236d6aa659cb986daf00e5 \
+                    file://COPYING.LGPLv2.1;md5=321bf41f280cf805086dd5a720b37785 \
+                   "
+DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux json-c"
+
+inherit autotools pkgconfig systemd update-rc.d
+
+SRCREV = "16a0d44f1725eaa93096eaa0e086f42ef4c2712c"
+
+PR .= "+git${SRCPV}"
+
+SRC_URI = "git://git.linuxfoundation.org/diamon/minicoredumper.git;protocol=http \
+           file://minicoredumper.service \
+           file://minicoredumper.init \
+           "
+
+S = "${WORKDIR}/git"
+
+SYSTEMD_SERVICE_${PN} = "minicoredumper.service"
+SYSTEMD_AUTO_ENABLE = "enable"
+
+INITSCRIPT_PACKAGES = "${PN}"
+INITSCRIPT_NAME_${PN} = "minicoredumper"
+INITSCRIPT_PARAMS_${PN} = "defaults 89"
+
+do_install_append() {
+    rmdir ${D}${localstatedir}/run
+    install -d ${D}/${sysconfdir}/minicoredumper
+    cp -rf ${S}/etc/* ${D}/${sysconfdir}/
+
+    install -d ${D}${systemd_system_unitdir}
+    install -m 0644 ${WORKDIR}/minicoredumper.service ${D}${systemd_system_unitdir}
+    install -d ${D}${sysconfdir}/init.d
+    install -m 0644 ${WORKDIR}/minicoredumper.init ${D}${sysconfdir}/init.d/minicoredumper
+
+    # correct path of minicoredumper
+    sed -i -e s:/usr/bin/minicoredumper:${sbindir}/minicoredumper:g ${D}${sysconfdir}/init.d/minicoredumper
+    sed -i -e s:/usr/bin/minicoredumper:${sbindir}/minicoredumper:g ${D}${systemd_system_unitdir}/minicoredumper.service
+}
+
+# http://errors.yoctoproject.org/Errors/Details/186966/
+EXCLUDE_FROM_WORLD_libc-musl = "1"
-- 
2.7.4


