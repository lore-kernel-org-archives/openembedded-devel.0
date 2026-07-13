Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E60C44506
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 00:34:55 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1060.1783902890807797080
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2026 17:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cCG6dQeJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so27992325ad.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2026 17:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783902890; x=1784507690; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+xQSp58/ImlTOLgzUx6DMKzoxyaw6D3s7RdZYZdNABI=;
        b=cCG6dQeJzeHj7OHCOoYy4Vy0wC8+tKeCO/ZaSwEGbOoHoDK4glyyGL+IbORhMfZn5K
         gVrJYdKvYtZKkusBMO8pbb4f6qUzE/vZqNi2ZBUREKifBEw7XDUuKbXK5AxdDKOK7fqY
         gB5hyq05sphEPjl9Do53V1RXHnErVt9XV+0tb+/dz5gOCTcX1ozE0A9HTkECRxO2eqO1
         bZmgtMMCqOaWBCcIMw+pX5Ls7xUcOnX/KCJlFwLQu4cj41jqI3tKnrOoZUdsnqEyPzHJ
         XYF+CeNvs2hkDa0ZGCDgC/z3YXbyYT17NmXYlJPLrQaOLIcRhVuwNcPEVdEnQbkXCoyA
         4gBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783902890; x=1784507690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+xQSp58/ImlTOLgzUx6DMKzoxyaw6D3s7RdZYZdNABI=;
        b=Lc9uTrTUIXEZpxChDD7RkF77YSFJlJDaolVWpbFjP87NX9WF5x4H6D2qIBRfTJDkXk
         H0083X37WYBe+3F6IJhifjMXSgI4Rsf4qLX48IRw+7eulDvlybejYeqjvY6HyFjaCssW
         B6XdbRqjly5nvM1WRs6bq6n69s35L1nAtFZbyPTTsivPO78vJakOd7N/ysRy2nOJeH+l
         A8hcvDySkx5dnti2edKR3WGzl+WMXx1oSYHfTiA6soU+Ono2EhCAb3Gzl+LD+iebdtQY
         aw8SMWvkWXrVxRXEz0juYuyygt+6+rklpYXb8zbtcDCpgqo8EEkiC4FntMYIa5eId3hG
         1jLw==
X-Gm-Message-State: AOJu0YwVcLWjaOC0J95i4K1p/H2PkTPt3Q5HAfrA1uaoqfDZbqusec04
	sh27kGSQh48f5VeGZPkyaVsT1hNz5VvRB4Vz2FIoOYsX5pZ7SqWPR8RqWmOLDIqeyTA=
X-Gm-Gg: AfdE7cm0G6MpxsvfN05NlAO0Luj+bILpHi8YjncCcAwaH338DzQ1R6yqoOivcko+BqY
	m3Yrow4tkJ06qw7GmAbfD6UJMTP7cry1+94jxtXZ1vgTOaRTViPF+juCaj2MyOuD4FLMXVlW06m
	2POJiTRwJ7Fc5wnjZddSOS+L46hr9UsHFeevV3CFtGYoi3inQetQTPFdjdXio4DPz0DhyhV3yE8
	fNDs90xcQOx9kgX3hrDYfIwx6E5bhQqhpBlcpGTLKramIMmSgnR4BtRDsfVcmik68VUL5qtlCmO
	PqR9nMIusaRCxII9H6NBk2ScxR1wVOmmtgMeGd8ktK1d+GgRmlyfzPm9sXA22tCRpSW6BU2JJhy
	nZc8c4m38C7gforW+q0HUE+KH+OzRy7sXE81ed8z7a05QU7ZlUBSThFGvLd9hyr3N7XyBWAgkMS
	OPXiHmbr1h+1SjPHL+kL/8wtgdg0E8Lg19Pbjy6IbxSV5OOw76qmALAeb1NfNMnVMq6TT4RUmXE
	s/jfj37hqNTJ3BZCm6nB13ssFhPfxl7rJwQhMXUVRANjcyfVMoL3o+4U7l5Tb3/HQnoB6BSUQHB
	ZOozqv75qHfFlgqLy//LkOPT0t18Y7mSD+ZxrZwe
X-Received: by 2002:a05:6a21:1b85:b0:3bf:e2dc:bc85 with SMTP id adf61e73a8af0-3c1108cf4ebmr7259103637.40.1783902890075;
        Sun, 12 Jul 2026 17:34:50 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117d847e17sm63316678eec.18.2026.07.12.17.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:34:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/2] postgresql: adapt to systemd-systemctl-native merge into systemd-tools-native
Date: Sun, 12 Jul 2026 17:34:45 -0700
Message-ID: <20260713003446.710143-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 00:34:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128141

oe-core merged systemd-systemctl-native into systemd-tools-native and moved
the PACKAGE_WRITE_DEPS on the native systemctl out of systemd.bbclass into
systemd itself. As a result:

- The PACKAGECONFIG[systemd] dependency on systemd-systemctl-native no longer
  resolves ("Nothing PROVIDES systemd-systemctl-native"). systemctl is a
  rootfs-time tool and was never needed to build postgresql, so drop it from
  the build dependencies.
- The pkg_postinst runs systemctl at rootfs time when both systemd and
  sysvinit are enabled. Since systemd.bbclass no longer adds the native tool
  to PACKAGE_WRITE_DEPS, declare it explicitly (as systemd-tools-native),
  guarded by the same DISTRO_FEATURES condition, mirroring how oe-core's
  keymaps/initscripts recipes handle it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-dbs/postgresql/postgresql.inc | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/postgresql/postgresql.inc b/meta-oe/recipes-dbs/postgresql/postgresql.inc
index 07cd121511..e687399493 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql.inc
+++ b/meta-oe/recipes-dbs/postgresql/postgresql.inc
@@ -45,6 +45,11 @@ CFLAGS += "-I${STAGING_INCDIR}/${PYTHON_DIR}"
 SYSTEMD_SERVICE:${PN} = "postgresql.service"
 SYSTEMD_AUTO_ENABLE:${PN} = "disable"

+# The postinst below calls systemctl at rootfs time when both systemd and
+# sysvinit are enabled. systemd-systemctl-native was merged into
+# systemd-tools-native in oe-core, and systemd.bbclass no longer adds it to
+# PACKAGE_WRITE_DEPS, so depend on it explicitly here.
+PACKAGE_WRITE_DEPS:append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd sysvinit','systemd-tools-native','',d)}"
 pkg_postinst:${PN} () {
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd sysvinit', 'true', 'false', d)}; then
         if [ -n "$D" ]; then
@@ -64,7 +69,7 @@ PACKAGECONFIG[python] = "--with-python,--without-python,python3,python3"
 PACKAGECONFIG[gssapi] = "--with-gssapi,--without-gssapi,krb5"
 PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
 PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
-PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd systemd-systemctl-native"
+PACKAGECONFIG[systemd] = "--with-systemd,--without-systemd,systemd"
 PACKAGECONFIG[uuid] = "--with-uuid=e2fs,--without-uuid,util-linux"
 PACKAGECONFIG[libxml] = "--with-libxml,--without-libxml,libxml2,libxml2"
 PACKAGECONFIG[libxslt] = "--with-libxslt,--without-libxslt,libxslt"

