Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B15BC55162
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 03:14:15 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35651.1785726849029599075
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 20:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V+jCPkpZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785726848; x=1817262848;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0vs1PvFkZXck5aLhkspED89B5yBWg8OFexE6akV+Ka4=;
  b=V+jCPkpZdw9fNeKwT/KzXB3UxFoP6PiY0Bt7EdsGdwQBQtxQVrXJdcMF
   92T/gXlt6Y8jHgT7PGR1V2UB1+7SE+3ot0GyHusJo25bKDRfnzh56yVH4
   Ysf/lfgbiN+x90Ix6ZXu+wUA7CLd0JSFRvLLGJ5ztpGdcL3YIGPyRLi9+
   Wjl9D4Dm2ZVOKo7OQDF1rHdwVS0P6pOPTaMOUS9JNNPTob0jKDhkjUcN0
   BP6GLiKBuUBRdPC+XG2jzmIDbiOzA7oXqIQn3utcQ2fQw3hQjufo8iUra
   hmDE6pWV3MD0dpBESKldzW5KCNKneJdoWd2LDy6CM5iufTp3xjJSf/VBS
   Q==;
X-CSE-ConnectionGUID: ayX0ENAtRZmM42EJI7dRuw==
X-CSE-MsgGUID: AXmfxiCETi+CqXQRvAVAZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="228337448"
X-IronPort-AV: E=Sophos;i="6.25,201,1779116400"; 
   d="scan'208";a="228337448"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 12:14:06 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E5F8D1461
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Aug 2026 03:14:06 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 9B06A1C1C247
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Aug 2026 03:14:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id B4FD4101E53D;
	Mon,  3 Aug 2026 03:14:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] pcsc-lite: install systemd system units
Date: Mon,  3 Aug 2026 11:14:01 +0800
Message-ID: <20260803031401.316-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 03:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128672

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
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
index ae20447050..bf0b45dd14 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
@@ -18,6 +18,7 @@ inherit meson systemd pkgconfig perlnative
 
 EXTRA_OEMESON = " \
     -Dlibusb=false \
+    -Dsystemdunit=system \
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
@@ -54,12 +58,6 @@ FILES:${PN}-spy-dev = "${libdir}/libpcscspy.la \
 
 do_install:append() {
     rm -rf ${D}${datadir}/metainfo
-    # pcsc-lite installs pcscd-sysusers.conf into systemd's sysusersdir when
-    # the systemd pkg-config variable is available (${libdir}/sysusers.d),
-    # and falls back to ${exec_prefix}/sysusers.d otherwise. Drop both so the
-    # file is not left unpackaged (installed-vs-shipped QA).
-    rm -rf ${D}${libdir}/sysusers.d
-    rm -rf ${D}${exec_prefix}/sysusers.d
 }
 
 RPROVIDES:${PN} += "${PN}-systemd"
-- 
2.43.0


