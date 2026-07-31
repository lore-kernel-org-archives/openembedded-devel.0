Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 343ADC54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 04:36:22 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4204.1785472578268546088
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2026 21:36:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R2eMnlyO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785472579; x=1817008579;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Jsvyg9v620gJIppS9TQ7hcxhy4wwbRKykoMjOPsPWSo=;
  b=R2eMnlyO9s/2OCoKiPA7eoLiWjIAtrlEr9JVZbT4xSwTL3eKV/UNlbtm
   mZsxVSgyk99AvhhKrIsmIOcwI9sSY4BMfYKqeNlxOFMNJdqKH/dHC/zrZ
   sSw2cotDVALKhgd3w4nv+lH8mWMjzxkoxJ46Cp18SgF50/aMl5j5Khscd
   qcaxcOIOSjbwZX+s/qZDsKq7ShF5oXjdDXr9eUTEfhjGZOABEqGk5Dvsz
   XNdntlHmqrbZuBCQlNtJruAjOwY0oTU2o8l8F35+65E29jCyC1yU2Kpvz
   91GS7XWLMRX0qNT9USUb4VtvwMVgX3EaxZKWiv5aaBt3PBFQ28EPyZuMs
   Q==;
X-CSE-ConnectionGUID: nVTCmmdJR9K6P6dLldzzng==
X-CSE-MsgGUID: If8Eci8cQmiTrI5B/5Xkbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="249146041"
X-IronPort-AV: E=Sophos;i="6.25,195,1779116400"; 
   d="scan'208";a="249146041"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 13:36:16 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 54A79CA5E
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 04:36:16 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 0F19D102FB96
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 04:36:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 20B591005AE8;
	Fri, 31 Jul 2026 04:36:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] pcsc-lite: install systemd system units
Date: Fri, 31 Jul 2026 12:36:10 +0800
Message-ID: <20260731043610.1552-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 04:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128578

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
 meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb
index d6427d2eba..75b0babec3 100644
--- a/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb
+++ b/meta-oe/recipes-support/pcsc-lite/pcsc-lite_2.5.0.bb
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


