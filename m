Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC13C5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 10:09:24 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39620.1786097358122638805
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Aug 2026 03:09:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VZu24YLM;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1786097358; x=1817633358;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZjXEdB3ovS/Pst2qHSakyEvpjKBsNDGDxxOgP9Oyrd0=;
  b=VZu24YLM0eQDPPyCH/8dWWGZKiHEDV5Fycselr3+w+m3dH8uonz7N/1j
   NoVlGFNCsBSZW3iEsNlay8By6k0PWeXYfnQUw2gSY4R90rzbbXBlWI2s/
   HRcn6NDReNNdMd+U2emwgi8i4qyTGPogpTUS4+uX4CgaWUtHff0KJLE5U
   h9vsogr4aMYVtoXmC6SeQsvzP+YrCglZn9z3wjKz7bIq2j4xGMNTSVAY/
   gDumCn8bHIlhZG6My7E4i9EUUHH3JqtTrCyOQn9M7/zZFu9YnnQmmF9YD
   1IC6K+/sbLh/RGEjh+qHZ9ylICfdQ4NwoJTtEMrAFQIi0+7StT3Kpo/6n
   g==;
X-CSE-ConnectionGUID: R4NuZqNHQhGQ7Ts2vZjh1g==
X-CSE-MsgGUID: xBQSaXEqTNmjfVyW7vRw2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="248252787"
X-IronPort-AV: E=Sophos;i="6.25,210,1779116400"; 
   d="scan'208";a="248252787"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 19:09:16 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6D19182110C
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Aug 2026 10:09:16 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 292AE1801FC6
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Aug 2026 10:09:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 4F85010000A9;
	Fri,  7 Aug 2026 10:09:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v3] pcsc-lite: install systemd system units
Date: Fri,  7 Aug 2026 18:09:10 +0800
Message-ID: <20260807100911.1629-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 10:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128867

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
index ae20447050..f70c17495a 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.1.bb
@@ -18,6 +18,7 @@ inherit meson systemd pkgconfig perlnative
 
 EXTRA_OEMESON = " \
     -Dlibusb=false \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemdunit=system', '-Dsystemdunit=no', d)} \
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


