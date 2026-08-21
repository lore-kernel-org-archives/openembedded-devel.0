Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4B4C5DF81
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 00:29:15 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.370.1787272152997065638
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 17:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pQLUZHDV;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787272153; x=1818808153;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6SFBsFOan2TYF1eIVHki+s7zODYC5oDAFBsAXnW/Xcw=;
  b=pQLUZHDV8i7glM023ET3lQvm1ZCEMb72TWo/nY8zfiTyeNY0qZcOCOhi
   wf89tjycMa3PFORezzihTFH/dVJHEytSRhRPaCYxnSDppfwisuljEWPNb
   jSqqWQ4mTIVwT6Ft2lJkO/oW9wcjpYrvn86szQ1yEdDK1ZkPLh0ci70YN
   eQyvX1mwc/mD70dgE+lzfCGQSqm1eNXkZ9h+M0FyVUrxcAYTV8wMDFcpU
   UDhzepzKqpEfUh30qVcdlsdZC8+bL+BOtWMIEm/2qxWdPs49C6aEmp1tI
   aSRrq8BVmwGExrs7V1m6+AwVRYl8ISzbZ5j2lR8AnSfFXumeECRHyKYdS
   w==;
X-CSE-ConnectionGUID: YRJ0foHFS7+ZJv6ToBxMrA==
X-CSE-MsgGUID: hH9TZBIwQT6YQBTyIOuQOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="230979694"
X-IronPort-AV: E=Sophos;i="6.25,234,1779116400"; 
   d="scan'208";a="230979694"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 09:29:11 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id F23861000348
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 00:29:10 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A8269C013CE
	for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 00:29:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id AB00A18001DA;
	Fri, 21 Aug 2026 00:29:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v4] pcsc-lite: install systemd system units
Date: Fri, 21 Aug 2026 08:29:05 +0800
Message-ID: <20260821002905.1356-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 00:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129394

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
index ae20447050..08bd17c64d 100644
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


