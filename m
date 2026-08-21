Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA09C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 09:25:58 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3821.1787304354625347621
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2026 02:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rJc86IqS;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787304354; x=1818840354;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lL5fcqxq6xdEFizXTplBYvxsNOevJgWjiRXnhKAMpXQ=;
  b=rJc86IqS1gHAc8RzRqBEvC6VofYpWeDj0/0nNRB69QcZu89nPOcyxRIe
   GJM3gsbsIjCz97YbZI/AO3BE3chbKsC9IDAuWZb9yCAAhzFCbM61iKR3t
   mJy1tH2NAFVfelArIdysK1MQKoDN4daK5B1xMg7TacH4q5Z9hL3Ne6kIf
   6FSW+KbA1AslHUETMwJ55PuyHBuYC9bU1wOzug/YP3X9BymQ4OB0M2xQa
   HcwkGYERP/xP4dgiuGi+M931ZhqVkgkN1iU008GCRprg3zAgtW/lPo8Y0
   U4fEVMY2yDqOisErfdxN17quH0TihKn2o8vTeMqOuW9n5p2yggU39Do59
   A==;
X-CSE-ConnectionGUID: oomq+B8pRjGL+wKD/QYrgg==
X-CSE-MsgGUID: HCMKBZg+Q+SJKMd5X8if5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="231061481"
X-IronPort-AV: E=Sophos;i="6.25,234,1779116400"; 
   d="scan'208";a="231061481"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 18:25:52 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 7EFF11002BB8
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 09:25:52 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3373F82A498
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 09:25:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 2B994180058C;
	Fri, 21 Aug 2026 09:25:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v5] pcsc-lite: install systemd system units
Date: Fri, 21 Aug 2026 17:25:46 +0800
Message-ID: <20260821092547.1384-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 09:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129416

From: Wang Mingyu <wangmy@fujitsu.com>

pcsc-lite 2.5.0 defaults to installing systemd user units, which leaves the
package without a system-level pcscd.service while SYSTEMD_SERVICE still
enables pcscd.socket. On target systems this makes systemctl status pcscd
fail, and systemctl --user start pcscd can fail because the user unit
requires polkit.service from the user manager.

Select upstream Meson systemdunit=system so pcscd.service and pcscd.socket
are installed as system units. Keep upstream sysusers.d packaging so
systemd-sysusers can create the pcscd system user required by the
generated service and socket units.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pcsc-lite/pcsc-lite_2.5.1.bb              | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
index ae20447050..a8735a449f 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
@@ -18,6 +18,7 @@ inherit meson systemd pkgconfig perlnative
 
 EXTRA_OEMESON = " \
     -Dlibusb=false \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemdunit=system', '', d)} \
     -Dusbdropdir=${libdir}/pcsc/drivers \
 "
 
@@ -38,7 +39,10 @@ RPROVIDES:${PN}:append:class-native = " pcsc-lite-lib-native"
 
 FILES:${PN} = "${sbindir}/pcscd \
                ${datadir}/polkit-1 \
-               ${nonarch_libdir}/systemd/user \
+               ${systemd_system_unitdir}/pcscd.service \
+               ${systemd_system_unitdir}/pcscd.socket \
+               ${libdir}/sysusers.d \
+               ${exec_prefix}/sysusers.d \
                ${sysconfdir}/default/pcscd"
 FILES:${PN}-lib = "${libdir}/libpcsclite*${SOLIBS}"
 FILES:${PN}-dev = "${includedir} \
@@ -54,12 +58,18 @@ FILES:${PN}-spy-dev = "${libdir}/libpcscspy.la \
 
 do_install:append() {
     rm -rf ${D}${datadir}/metainfo
-    # pcsc-lite installs pcscd-sysusers.conf into systemd's sysusersdir when
-    # the systemd pkg-config variable is available (${libdir}/sysusers.d),
-    # and falls back to ${exec_prefix}/sysusers.d otherwise. Drop both so the
-    # file is not left unpackaged (installed-vs-shipped QA).
-    rm -rf ${D}${libdir}/sysusers.d
-    rm -rf ${D}${exec_prefix}/sysusers.d
+    # In sysvinit environments, remove all systemd-related files
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'false', 'true', d)}; then
+        # pcsc-lite installs pcscd-sysusers.conf into systemd's sysusersdir when
+        # the systemd pkg-config variable is available (${libdir}/sysusers.d),
+        # and falls back to ${exec_prefix}/sysusers.d otherwise. Drop both so the
+        # file is not left unpackaged (installed-vs-shipped QA).
+        rm -rf ${D}${libdir}/sysusers.d
+        rm -rf ${D}${exec_prefix}/sysusers.d
+
+        rm -rf ${D}${systemd_system_unitdir}
+        rm -rf ${D}${libdir}/systemd
+    fi
 }
 
 RPROVIDES:${PN} += "${PN}-systemd"
-- 
2.43.0


