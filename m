Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9C31067024
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 14:05:51 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22326.1773324347089754169
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 07:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm1 header.b=bdzo44uY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1334352-20260312140543abda3f0f9700020751-oveby3@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260312140543abda3f0f9700020751
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 12 Mar 2026 15:05:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=3CNZ09QatXttHBRrXp+otw7K+H4vnwJWJolfASJL3D4=;
 b=bdzo44uYW99I9EVX8LTFfFciGnDMuMVMP928GXrOO9LbN87ACIVDBpPEtxjt2CYCGAPYFC
 gGJzQAYtpQttgZ9Cw1/0ODA9J5Nl+NLS6y4UQthsH4ovqIsibcGkyvETErSBuS0gC8EC+R7Z
 0ma8LBykflICSw0pG1MHY2JLPscTcQgu3EzqFIVJyQQN0MWcyiN7Us9eZskNdvJ2ruygqLvN
 OLQGsLqD6vvZ5nM7ZTrX2ejT32ys9v4c2U+cvXZKkminiNZCXMb8Y++qSjnqWrubao9KEG8R
 fU/vfRAXXx81E/oSbJrdqXxz7tgGku3s6IWCL/RY4kaA2bagtUAbqvBg==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-networking][PATCH 1/6] mosquitto: upgrade 2.0.22 -> 2.1.2
Date: Thu, 12 Mar 2026 15:04:56 +0100
Message-ID: <20260312140501.29859-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 14:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125166

License-Update: Change license to EPL-2.0 OR BSD-3-Clause
  Clarify license in LICENSE.txt: https://github.com/eclipse-mosquitto/mosquitto/commit/f466e454e016825220e8494bd6264a5736ed1112
  Updated NOTICE.md: https://github.com/eclipse-mosquitto/mosquitto/commit/827c803cb8d6376891548b856a1faa3f0ab5

Removed patch included in this release

Update PACKAGECONFIG/cmake options:

- manpages: -DDOCUMENTATION → -DWITH_DOCS (the CMake option was renamed in 2.1.x)
- ssl: removed -DWITH_EC=ON/-DWITH_EC=OFF; the WITH_EC option was dropped in 2.1.x
       since Elliptic Curve support is now always included with TLS
- websockets — adapt websockets to properly use with picohttpparser

Disable `DWITH_ADNS` option because it required Argon2, which is not part of
meta-oe layer

Disable `DWITH_TESTS` option because mosquitto start using GoogleTest
and we hit a common Yocto + CMake + GoogleTest problem

Changelog:
v2.1.2:
  https://github.com/eclipse-mosquitto/mosquitto/blob/v2.1.2/ChangeLog.txt

  Broker:
    - Forbid running with `persistence true` and with a persistence plugin at the
      same time.

  Build:
    - Build fixes for OpenBSD. Closes #3474.
    - Add missing libedit to docker builds. Closes #3476.
    - Fix static/shared linking of libwebsockets under cmake.

v2.1.1:
  https://github.com/eclipse-mosquitto/mosquitto/blob/v2.1.1/ChangeLog.txt

v2.1.0:
  https://github.com/eclipse-mosquitto/mosquitto/blob/v2.1.0/ChangeLog.txt

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../mosquitto/files/2895.patch                | 38 -------------------
 ...mosquitto_2.0.22.bb => mosquitto_2.1.2.bb} | 27 ++++++++-----
 2 files changed, 17 insertions(+), 48 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/mosquitto/files/2895.patch
 rename meta-networking/recipes-connectivity/mosquitto/{mosquitto_2.0.22.bb => mosquitto_2.1.2.bb} (70%)

diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
deleted file mode 100644
index d9432e749e..0000000000
--- a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From: Joachim Zobel <jz-2017@heute-morgen.de>
-Date: Wed, 13 Sep 2023 10:05:43 +0200
-Subject: [PATCH] Mosquitto now waits for network-online when starting
- (Closes: #1036450)
-
-See: https://github.com/eclipse/mosquitto/issues/2878
----
-Upstream-Status: Submitted [https://github.com/eclipse-mosquitto/mosquitto/pull/2895]
-
- service/systemd/mosquitto.service.simple | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/service/systemd/mosquitto.service.simple
-+++ b/service/systemd/mosquitto.service.simple
-@@ -1,8 +1,8 @@
- [Unit]
- Description=Mosquitto MQTT Broker
- Documentation=man:mosquitto.conf(5) man:mosquitto(8)
--After=network.target
--Wants=network.target
-+After=network-online.target
-+Wants=network-online.target
- 
- [Service]
- ExecStart=/usr/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf
---- a/service/systemd/mosquitto.service.notify
-+++ b/service/systemd/mosquitto.service.notify
-@@ -1,8 +1,8 @@
- [Unit]
- Description=Mosquitto MQTT Broker
- Documentation=man:mosquitto.conf(5) man:mosquitto(8)
--After=network.target
--Wants=network.target
-+After=network-online.target
-+Wants=network-online.target
- 
- [Service]
- Type=notify
diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.22.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.2.bb
similarity index 70%
rename from meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.22.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.2.bb
index 1bdf54eea1..c533240010 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.0.22.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.2.bb
@@ -6,20 +6,19 @@ provides a lightweight method of carrying out messaging using a \
 publish/subscribe model. "
 HOMEPAGE = "http://mosquitto.org/"
 SECTION = "console/network"
-LICENSE = "EPL-2.0 | EDL-1.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ca9a8f366c6babf593e374d0d7d58749 \
+LICENSE = "EPL-2.0 | BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f6d64fd27a4071b14ef656a0e8a4f4cf \
                     file://edl-v10;md5=9f6accb1afcb570f8be65039e2fcd49e \
                     file://epl-v20;md5=2dd765ca47a05140be15ebafddbeadfe \
-                    file://NOTICE.md;md5=a7a91b4754c6f7995020d1b49bc829c6 \
+                    file://NOTICE.md;md5=611234becddb76dca161d4ffce7ab420 \
 "
 DEPENDS = "uthash cjson"
 
 SRC_URI = "http://mosquitto.org/files/source/mosquitto-${PV}.tar.gz \
            file://mosquitto.init \
-           file://2895.patch \
 "
 
-SRC_URI[sha256sum] = "2f752589ef7db40260b633fbdb536e9a04b446a315138d64a7ff3c14e2de6b68"
+SRC_URI[sha256sum] = "fd905380691ac65ea5a93779e8214941829e3d6e038d5edff9eac5fd74cbed02"
 
 inherit systemd update-rc.d useradd cmake pkgconfig
 
@@ -27,16 +26,22 @@ PACKAGECONFIG ??= "ssl websockets \
                   ${@bb.utils.filter('DISTRO_FEATURES','systemd', d)} \
                   "
 
-PACKAGECONFIG[manpages] = "-DDOCUMENTATION=ON,-DDOCUMENTATION=OFF,libxslt-native docbook-xsl-stylesheets-native"
+PACKAGECONFIG[manpages] = "-DWITH_DOCS=ON,-DWITH_DOCS=OFF,libxslt-native docbook-xsl-stylesheets-native"
 PACKAGECONFIG[dns-srv] = "-DWITH_SRV=ON,-DWITH_SRV=OFF,c-ares"
-PACKAGECONFIG[ssl] = "-DWITH_TLS=ON -DWITH_TLS_PSK=ON -DWITH_EC=ON,-DWITH_TLS=OFF -DWITH_TLS_PSK=OFF -DWITH_EC=OFF,openssl"
+PACKAGECONFIG[ssl] = "-DWITH_TLS=ON -DWITH_TLS_PSK=ON,-DWITH_TLS=OFF -DWITH_TLS_PSK=OFF,openssl"
 PACKAGECONFIG[systemd] = "-DWITH_SYSTEMD=ON,-DWITH_SYSTEMD=OFF,systemd"
-PACKAGECONFIG[websockets] = "-DWITH_WEBSOCKETS=ON,-DWITH_WEBSOCKETS=OFF,libwebsockets"
+PACKAGECONFIG[websockets] = "-DWITH_WEBSOCKETS=ON -DWITH_WEBSOCKETS_BUILTIN=OFF,-DWITH_WEBSOCKETS=OFF,libwebsockets"
 PACKAGECONFIG[dlt] = "-DWITH_DLT=ON,-DWITH_DLT=OFF,dlt-daemon"
+PACKAGECONFIG[http-api] = "-DWITH_HTTP_API=ON,-DWITH_HTTP_API=OFF,libmicrohttpd"
 
+# Disable building/running tests to avoid GoogleTest discovery executing target binaries
+# during cross-compilation (Yocto). This prevents CMake from calling gtest_discover_tests().
+# See: Yocto + GTest cross-compile issues and gtest_discover_tests execution failures.
+# (Refs: SO example and googletest issue)
 EXTRA_OECMAKE = " \
     -DWITH_BUNDLED_DEPS=OFF \
-    -DWITH_ADNS=ON \
+    -DWITH_ADNS=OFF \
+    -DWITH_TESTS=OFF \
 "
 
 do_install:append() {
@@ -59,7 +64,9 @@ PACKAGE_BEFORE_PN = "${PN}-examples"
 FILES:${PN} = "${sbindir}/mosquitto \
                ${bindir}/mosquitto_passwd \
                ${bindir}/mosquitto_ctrl \
-               ${libdir}/mosquitto_dynamic_security.so \
+               ${bindir}/mosquitto_db_dump \
+               ${bindir}/mosquitto_signal \
+               ${libdir}/mosquitto_*.so \
                ${sysconfdir}/mosquitto \
                ${sysconfdir}/init.d \
                ${systemd_unitdir}/system/mosquitto.service \
-- 
2.47.3


