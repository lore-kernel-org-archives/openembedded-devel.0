Return-Path: <alexander.stein@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DA8C531FA
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 07:25:04 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14232.1784877899377124625
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jul 2026 00:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=gdp9Guwy;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: alexander.stein@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=mtTTt8Cvyj2iET0XAEfqilEz0nZp1yykLV/LgmQ9qn4=; b=gdp9Guwyuj9t9UlZREyWLXbSHe
	iX/OpD4GjYMIOtbXlP9ZeeO1rpBL5hChhO4d13NUe/J58ZEQT4688xJJH/lCy+Yj/NH3QtwdqkJg2
	YLVg2XvTezpFQOEBLRskKnmr87OCUXc27Afm+1axZv4gl2HuVb9AIposTW6gNdIQch+x7QRW9b1Wu
	CHuLD63kq4mevNMyF1kg+5xm6Mu/cuUa5z5UrADbT/QjhK5RfnqnrJ9m16qXaNd1xZZWRvXI8mkl4
	cjHwK38MR83qS9XbaKH8wZLKEW02yBih2Q6SxVjYXygsBMV6A7oQ1TLNKAELO9jysYTEfVuak4AVg
	wkOsAk3w==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wnAHA-000HK0-31;
	Fri, 24 Jul 2026 09:24:56 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wnAHA-0005Gd-23;
	Fri, 24 Jul 2026 09:24:56 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [oe][meta-oe v2] libiio: Move sysvinit script to libiio-iiod package
Date: Fri, 24 Jul 2026 09:24:50 +0200
Message-ID: <20260724072450.878822-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28069/Thu Jul 23 08:24:48 2026)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 07:25:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128438

There is no use in the init script outside of iiod package. Package it
accordingly.

Fixes: 9b5fc1605be1 ("libiio: Add sysvinit support")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 meta-oe/recipes-support/libiio/libiio_0.26.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_0.26.bb b/meta-oe/recipes-support/libiio/libiio_0.26.bb
index 99c153149c..dcd1ebffd9 100644
--- a/meta-oe/recipes-support/libiio/libiio_0.26.bb
+++ b/meta-oe/recipes-support/libiio/libiio_0.26.bb
@@ -52,6 +52,7 @@ RDEPENDS:${PN}:remove = "python3-core"
 RDEPENDS:${PN}-python3 = "${PN} python3-core python3-ctypes python3-stringold"
 
 FILES:${PN}-iiod = " \
+    ${sysconfdir}/init.d/iiod \
     ${sbindir}/iiod \
     ${systemd_system_unitdir}/iiod.service \
 "
@@ -60,7 +61,8 @@ FILES:${PN}-python3 = "${PYTHON_SITEPACKAGES_DIR}"
 
 SYSTEMD_PACKAGES = "${PN}-iiod"
 SYSTEMD_SERVICE:${PN}-iiod = "iiod.service"
-INITSCRIPT_NAME = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'iiod', '', d)}"
+INITSCRIPT_PACKAGES = "${PN}-iiod"
+INITSCRIPT_NAME:${PN}-iiod = "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'iiod', '', d)}"
 
 # Explicitly define do_configure, do_compile and do_install because both cmake and setuptools3 have
 # EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
2.54.0


