Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F020CA0EE4
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 08:41:01 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.18201.1755160855046356038
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 01:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FI+NsYty;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b0cd668so3164405e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 01:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755160853; x=1755765653; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+FvvNSzhwFdHdLM50+INIwboJTX4mh6NFCqpdh7+Z4=;
        b=FI+NsYtyKkwHAuXVedLFyoxLfrqeniWvTQ9ALs7g/QHKunhzryokPl24mOStgSx6QB
         K/BKpiKL/6dV19xykfMvsRYMe8WeaD4FP05Q/3jIuCasn3eI2LgaL/fp+RkqfIAqF3S7
         86cMHbxOd3r37PSCsxxjNkSY/ggJBidiKaXPmyGdzfJvbFWB2dxOrHzIP5b637Xg6nlv
         wrtNCS1hAjBeGClYUuYmEqIIRHdf5HLyIBEjPTuygytpIZR3ddLNrjesC+CU8NJSYR4S
         OeJT+4kjiRq6kzwZ+soEullYt2GsPkrM+rTZY441AokZZL396CAMujQ1Y+hv0eoNiqxk
         pY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755160853; x=1755765653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+FvvNSzhwFdHdLM50+INIwboJTX4mh6NFCqpdh7+Z4=;
        b=DbmICXr3vJxZKzOyvFvE0nKPE/C+p2tWQjvUFhPl10lpdV9xS8PP7+bboOZea4nC4Q
         erTLCCQjMzDvayxzfIXD5k3DMY093aDd4u1T2fXZfyRVBVvnG6jfsQjMPrTs6OnTtbEc
         pqRD/W1q2MSvFvFWJ+r8tgxRjZRdcZ4BzPrdx30eLfC5oVQpogIDxAUWOYOdHj4b+4OO
         RMDHK+m8f2oEx0xd2isEijiSjUBhzfzWsqCYTJSMISoSB9d2YKMKNp4JHQBV39YnK7W1
         qgeligrCqEB/Ol0vEHyKsrjvPshPxQ1duz+MwdGQcQdhIvEyMCHLnmRa8FuvgcljA/xD
         SIFw==
X-Gm-Message-State: AOJu0YwnyjIY5d9ptf4S5+7NlD3UzpYiA0cxNTgBbIt0PY3aRCBdbHb2
	0YznXnm7Ts9V5odG6v6teCiI8jLbe10xfsBkkupwXyoAP+NQnfKvCuP8I72NNA==
X-Gm-Gg: ASbGnctyYp8/+W0eyWMfWYpu86fGoI9JUHEv+/q6fFZKdNXn0or13qbqp1pIr4pXpB2
	XJVfWrBDprFR/H7tUx3uSYhRDnG8aQYHggcjWcn2dyqAzT4soOXo+c1jc3kID6DJJzVJwDM5Ie6
	pbV1qeV2Sdpa+OjMO0yhEvXAaAikaYcDI0PprHrX5oJKeHvrZKaOBBL4Dm0AlmYSTK2ovbkcLfw
	9EovlCWUYlhfF8AZ6rcUrofD0Pn40C+0F8KUnMmoIW3OORsmgiK6VFleu6atSy2TF3AtiMuLacm
	ai9fFGcpIyj0YloC20UWoq4AAgUzdcaltWWSFOvck98sHGeEGyl12phb90THs/yb8wDa3IN1niP
	BGPeyusE37i4WKmKxpxZ25s0yI9p1KO9SHK5pl7GxRJg=
X-Google-Smtp-Source: AGHT+IGwTsem+jBRT+OeWpogzkSKM+Ni7JHhN1wIAJ8FNOG1s463LfZx8lmJaBL4mXmp1IY5hwi+yA==
X-Received: by 2002:a05:600c:3509:b0:43d:abd:ad1c with SMTP id 5b1f17b1804b1-45a1b605e3amr15628085e9.6.1755160852876;
        Thu, 14 Aug 2025 01:40:52 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c70cb83sm12593935e9.27.2025.08.14.01.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 01:40:52 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] openvpn: Add PACKAGECONFIG for data channel offload
Date: Thu, 14 Aug 2025 10:40:48 +0200
Message-ID: <20250814084048.1088558-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 08:41:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118934

Moved the iproute2 backend enablement into a new PACKAGECONFIG.
It is enabled to keep the current defaults. Added the explicit
runtime dependency on iproute2-ip (the "ip" command) which this
backend requires.

Added a new PACKAGECONFIG[dco] which enables the libnl backend,
which is mutually incompatible with iproute2 backend in OpenVPN.

With these:

  PACKAGECONFIG:remove = "iproute2"
  PACKAGECONFIG:append = " dco"

the data channel offload is enabled:

  checking for LIBNL_GENL... yes
  configure: Enabled ovpn-dco support for Linux

With Linux kernel 6.16 or newer, and CONFIG_OVPN enabled,
the data channel offload will be used.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb
index 67ea09fad5..8627c7812d 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.14.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://openvpn.net/"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=89196bacc47ed37a5b242a535661a049"
-DEPENDS = "lzo lz4 openssl iproute2 libcap-ng ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} ${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)} "
+DEPENDS = "lzo lz4 openssl libcap-ng ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} ${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)} "
 
 inherit autotools systemd update-rc.d pkgconfig ptest
 
@@ -26,7 +26,6 @@ INITSCRIPT_PARAMS:${PN} = "start 10 2 3 4 5 . stop 70 0 1 6 ."
 CFLAGS += "-fno-inline"
 
 # I want openvpn to be able to read password from file (hrw)
-EXTRA_OECONF += "--enable-iproute2"
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '--disable-plugin-auth-pam', d)}"
 
 # Explicitly specify IPROUTE to bypass the configure-time check for /sbin/ip on the host.
@@ -38,8 +37,12 @@ EXTRA_OECONF += "SYSTEMD_UNIT_DIR=${systemd_system_unitdir} \
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
+                   iproute2 \
                   "
 
+# dco and iproute2 are mutually incompatible
+PACKAGECONFIG[dco] = ",--disable-dco,libnl"
+PACKAGECONFIG[iproute2] = "--enable-iproute2,,iproute2,iproute2-ip"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 
-- 
2.50.1


