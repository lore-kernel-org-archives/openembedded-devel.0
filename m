Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDD2F8DFC5
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 21:11:54 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26717.1776373910293622718
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2026 14:11:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gN3VnoAW;
 spf=pass (domain: konsulko.com, ip: 209.85.219.41, mailfrom: scott.murray@konsulko.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8acb3daf2aaso66455516d6.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 14:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1776373909; x=1776978709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3lZLiZG2kpCDK45GDI7HHsEur3Qs1yD9tkA9aP+7MaI=;
        b=gN3VnoAWN/aZO80RaDKSWmUlwlc4Ct3//Fej30Ypm74aIa8NksElN/ay25YE3Zsng5
         +NZEUwgNY2u9May+q0hVmfWhv3KjyxUuhPLKgJqEbetg4YzCCvDtMZmR/8KIadsXuUWd
         v8P59iiqlw7/Lr//Xfoymf5MO2cbwUGqruiCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776373909; x=1776978709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3lZLiZG2kpCDK45GDI7HHsEur3Qs1yD9tkA9aP+7MaI=;
        b=EgsIXa1ZYGy4mepWGPaT3tIIrgDXgypKVqIvZtOlrm3NgTX1FF3VMPYtxqiF1UgZ8U
         C496q/zTj8cpMEc2Vpti42m0psSjyclM3LuwvFTRoAC4BljWrTWaImVtoL+jD+P6qgqm
         D+Mz15J3Ky8EDDmxoo0jcsjGisLpAD6HdlWJ3L3IwITFSMOK7smCqmQuT7hqLwqO+UDp
         za8Xs19qAk33TrLdkW/VCPgssrGPiehJFqsKd2nzg0MK6I25JS6EnS7IS27KWTOy0IC1
         NR+tL0erj/GIBxofhkGuHifhAfPro62ruz7DGv7OpIWtXF5+vWT2FHzkURV3W1r5d6WK
         +pzA==
X-Gm-Message-State: AOJu0YyI+R/YbCPureYFDjiy91WglnnP9KJ/HzoO+W0fk9BkvPRzFZbs
	ZxRr8vfMyqofRTqFTCIcOcFH+9XzV59b0ZHqDLYNMBoijn4j+iZlv/HjFP0+or9rCRAtN/8V4Tg
	TOWDl
X-Gm-Gg: AeBDiev90jk8dGSJIJVUOt5lynd9+Z40PoP/y43c/oBSYOQL6d04U4xi1LuXBjo58xj
	zTfcKYRLXhdKlDq6J7Y8J+XgTmkZ6bvF0VCF4aue2tiyQA+u9zO3s9zJnjdnUg43gcwVSes1MMK
	cH7+WoKFicw8ld3mw6ZOauXtZmE7DKG258mWmn8xsw9lUXH4w0XberisPbxnbAp+Gmbf+PhGW8f
	Y1K75cz0SxcXsc0UpOEfrJKZZ4c96m95w49jLdB/arO+EqvNIJ5pn0MiDtXZCVrUbGI4/ltwevk
	M1fYEDP2BcBaPITVD3PGKqItLNZr//iDQLOXucbt8/rRqhvvSbDJvK0XrRm9liHaMCjmozXp05B
	BCraou1vSaDFu2gV7Ak/g8kkhbhPxFnYvTguwmbvTho53YPSM/l3fJx2GH6XmGSrOAnljiWAnuh
	twVagZFZjEqJOOxvxgdusJKOJId5saQJf8y6aaSakMCiKUioM7C0Uc6IBib9EGhY76zCw6ap7Bb
	dw972O3/C31YunI13rXFR6ibrhPy1ZHuriOrXw9wNk4m/8oEQLDegfm7KCfVDIfCnZ1CDjRTu0=
X-Received: by 2002:a05:6214:29e9:b0:89c:6bbd:76d8 with SMTP id 6a1803df08f44-8b0280b2f12mr3154796d6.19.1776373908872;
        Thu, 16 Apr 2026 14:11:48 -0700 (PDT)
Received: from ghidorah.spiteful.org (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ae6cbbbb9asm45807086d6.35.2026.04.16.14.11.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 14:11:48 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] mpd: Fix systemd user unit installation
Date: Thu, 16 Apr 2026 17:11:36 -0400
Message-ID: <20260416211136.49864-1-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2026 21:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126415

systemd_system_unitdir was accidentally used as the destination for
the user systemd unit, which means it overwrites the system unit.
Correct it to systemd_user_unitdir to fix starting with the system
unit.

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb
index cb6bd1569f..0c3d672949 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.24.9.bb
@@ -24,7 +24,7 @@ SRC_URI = "git://github.com/MusicPlayerDaemon/MPD;branch=master;protocol=https;t
 SRCREV = "7a9afa059e95668c912f779219ee8fe1e44dd2aa"
 
 
-EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_system_unitdir}', '-Dsystemd=disabled', d)} \
+EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-Dsystemd=enabled -Dsystemd_system_unit_dir=${systemd_system_unitdir} -Dsystemd_user_unit_dir=${systemd_user_unitdir}', '-Dsystemd=disabled', d)} \
     -Dadplug=disabled \
     -Dsndio=disabled \
     -Dshine=disabled \
@@ -93,6 +93,8 @@ do_install:append() {
     rm -rf ${D}${datadir}/icons
 }
 
+FILES:${PN} += "${systemd_user_unitdir}"
+
 RPROVIDES:${PN} += "${PN}-systemd"
 RREPLACES:${PN} += "${PN}-systemd"
 RCONFLICTS:${PN} += "${PN}-systemd"
-- 
2.53.0


