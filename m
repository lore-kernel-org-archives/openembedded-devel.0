Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C62CC5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:21 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.836.1787117836297756930
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XOcv8U+g;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso1031907a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117836; x=1787722636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=njogy/lGSmiH8VIO3xJMEbpHwSbU5lb2LE9aMHGSNx4=;
        b=XOcv8U+g2Owlm7aVRnd4vr/HxCFAwp9cNHogRpdPVFc60v6B69e3RvuKmqi7BLofxX
         zGFbX+bcyeTecD3OjLYLP3Iyxju3oo7lPlHDs183lqNHr4Rts+as36yO1qMt2LrDyj+t
         AwTH3CGXUcCatThCJIEtxTtR0S+YOaxUrnN20lA4Li9zI38JSpZi3AKUOnmHCTTJic1Y
         OtWnn695x3htcIHzoGzhIzrxU2F0pvrY50hPi13pkvAMne/A2gl/aVaX2APPwZ2sQ5ka
         2d5u4lSJwAB8E+66TjrNf7kR+GwuOuWI1fazvEeRo78C4sgR7yutYnTOyg5gzf2bpVcm
         ToZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117836; x=1787722636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=njogy/lGSmiH8VIO3xJMEbpHwSbU5lb2LE9aMHGSNx4=;
        b=UXH4oLa14dHF81eBBm2FVg0Qx6E8PoMyOGk0aNcRJAS61PSJnAc3HaZt8eWzTTH3Gp
         qxqAq7D7bj0TddvPSeDPV9Gi06IQR/6Mzj+6h/f1jsUFpGODflSZS7QkoMOenMOADhZh
         6yFB1Q+X9gNnBy2vuhP2PTBl6WOyyYbdHm0d8x5s20b3HdfBxe2SznUaFRrBPQP2YkLm
         ovcHlO2m2F633jM+nBQymd7/aEUwkc+bipd6gxAXcWFmo1POWtvYjnbWTTMXWa1ET0rt
         mDDBmpGXTmelyYekizuB0fdWKWykqqM0KPkixFflPv7PWBScghtcn9JXFLuw1U9yTUyF
         8a/A==
X-Gm-Message-State: AOJu0YzAd2bSp29X7QjE7b02bPUIwvg6uckNTUxcQjjaBSGeeIjvCRl7
	dWR86mCVyWldPjXs6TCAJuK27QFVb7MxILzBcCT0nYZaJpJtUYUmW3lendQQ1bU1
X-Gm-Gg: AR+sD11P+pZgX2wTVPF2hPxlujlt6SFx3VsNCWkqN9+bga/7olDH9fuWIkbpVEDWcDy
	IeId1BLsn3NRTdhB4SUvH29WAEvjx4gwsEPvkUn5p4Cga+gn3sm/2dU8iFeXY/oli+9ATlJ8N16
	jyAQeivbrRa/zf/08MSUWgVOV/qzVPteqKgv2PITV2ZQnOk7/p5N7L+1nhHRtRHfBvVAJGo7Vgu
	NzOnxkJKOCDFuQmgWEy5mEZzGOj93ZvJd6K53oF+FqSgomuSIlyiJxtI6Rj3Dmcynz3qrJ+GfIf
	9dZxQ8gS/xLEhMb4I/JxnwTtei/I0Ms+VaT51UwGI+u4XlvwybmYXCf539MLCYUYhONoEtbLZ1m
	qZ0A0PbH4Tr8ZFZFTCs0Dc8HU3rI4dqkBUS3TsUsv0p9TdswfXWf8e/CEKsF+/KHxtcvDylWtGy
	A5XMtYgkiqLHEF22q39T7O/d4f1lQM4Xva5HK/FOIjWhKJd3tSulxOc0f6AZfk3hkHlLeDwQ7Y4
	JCnxA/TEOuLRg==
X-Received: by 2002:a17:90b:4fd0:b0:390:b41a:b92b with SMTP id 98e67ed59e1d1-39580a53469mr4249912a91.4.1787117835514;
        Tue, 18 Aug 2026 22:37:15 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:37:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 16/25] lmsensors: upgrade 3.6.0 -> 3.6.2
Date: Wed, 19 Aug 2026 17:36:20 +1200
Message-ID: <20260819053629.391864-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129260

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: content unchanged aside from formatting[1]

- Add tag in the SRC_URI
- Add zsh-completion package
- Drop patches which are part of the upstream version

Changelog:
https://github.com/lm-sensors/lm-sensors/blob/V3-6-2/CHANGES

[1] https://github.com/lm-sensors/lm-sensors/commit/6128b9e8eb58d6a12d4c8a8d6a635a3f066a0127

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...nge-PIDFile-path-from-var-run-to-run.patch | 44 -------------------
 .../0001-Fix-building-with-GCC-14.patch       | 36 ---------------
 ...{lmsensors_3.6.0.bb => lmsensors_3.6.2.bb} | 12 ++---
 3 files changed, 7 insertions(+), 85 deletions(-)
 delete mode 100644 meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Change-PIDFile-path-from-var-run-to-run.patch
 delete mode 100644 meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-building-with-GCC-14.patch
 rename meta-oe/recipes-bsp/lm_sensors/{lmsensors_3.6.0.bb => lmsensors_3.6.2.bb} (95%)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Change-PIDFile-path-from-var-run-to-run.patch b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Change-PIDFile-path-from-var-run-to-run.patch
deleted file mode 100644
index c34db695ff..0000000000
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Change-PIDFile-path-from-var-run-to-run.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 25f4f8793730ef3d170f1f2bd729a82fd61a4784 Mon Sep 17 00:00:00 2001
-From: puneetse <22071208+puneetse@users.noreply.github.com>
-Date: Wed, 11 Mar 2020 09:36:51 -0700
-Subject: [PATCH] Change PIDFile path from /var/run to /run
-
-/var/run is considered a legacy directory by systemd 239+ and having it in unit files causes a warning to be emitted to the journal.
-
-Upstream-Status: Backport [25f4f8793730ef3d170f1f2bd729a82fd61a4784]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- prog/init/fancontrol.service | 2 +-
- prog/init/sensord.service    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/prog/init/fancontrol.service b/prog/init/fancontrol.service
-index 3ac1ed02..43293141 100644
---- a/prog/init/fancontrol.service
-+++ b/prog/init/fancontrol.service
-@@ -5,7 +5,7 @@ After=lm_sensors.service
- 
- [Service]
- Type=simple
--PIDFile=/var/run/fancontrol.pid
-+PIDFile=/run/fancontrol.pid
- ExecStart=/usr/sbin/fancontrol
- 
- [Install]
-diff --git a/prog/init/sensord.service b/prog/init/sensord.service
-index 2448beeb..af2f0ae9 100644
---- a/prog/init/sensord.service
-+++ b/prog/init/sensord.service
-@@ -5,7 +5,7 @@ After=lm_sensors.service
- [Service]
- EnvironmentFile=/etc/sysconfig/sensord
- Type=forking
--PIDFile=/var/run/sensord.pid
-+PIDFile=/run/sensord.pid
- ExecStart=/usr/sbin/sensord -i $INTERVAL -l $LOG_INTERVAL -f daemon
- 
- [Install]
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-building-with-GCC-14.patch b/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-building-with-GCC-14.patch
deleted file mode 100644
index 0ff8b3801b..0000000000
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors/0001-Fix-building-with-GCC-14.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From fd49cbcb7f3402e1a4a99b71b901a564060039b4 Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-Date: Fri, 24 May 2024 14:16:21 +0300
-Subject: [PATCH] Fix building with GCC 14
-
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-Upstream-Status: Submitted [https://github.com/lm-sensors/lm-sensors/pull/497]
----
- prog/sensord/rrd.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/prog/sensord/rrd.c b/prog/sensord/rrd.c
-index a531362bddd5..36d685fce514 100644
---- a/prog/sensord/rrd.c
-+++ b/prog/sensord/rrd.c
-@@ -299,7 +299,7 @@ int rrdInit(void)
- 		argv[argc++] = rraBuff;
- 		argv[argc] = NULL;
- 
--		ret = rrd_create(argc, (char**) argv);
-+		ret = rrd_create(argc, (const char**) argv);
- 		if (ret == -1) {
- 			sensorLog(LOG_ERR, "Error creating RRD file: %s: %s",
- 				  sensord_args.rrdFile, rrd_get_error());
-@@ -455,7 +455,7 @@ int rrdUpdate(void)
- 		const char *argv[] = {
- 			"sensord", sensord_args.rrdFile, rrdBuff, NULL
- 		};
--		if ((ret = rrd_update(3, (char **) /* WEAK */ argv))) {
-+		if ((ret = rrd_update(3, (const char **) /* WEAK */ argv))) {
- 			sensorLog(LOG_ERR, "Error updating RRD file: %s: %s",
- 				  sensord_args.rrdFile, rrd_get_error());
- 		}
--- 
-2.39.2
-
diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.2.bb
similarity index 95%
rename from meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
rename to meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.2.bb
index 149c68a455..afbfb6d4f2 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.2.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Hardware health monitoring applications"
 HOMEPAGE = "https://hwmon.wiki.kernel.org/"
 LICENSE = "GPL-2.0-or-later AND LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = " \
@@ -10,13 +10,12 @@ DEPENDS = " \
     virtual/libiconv \
 "
 
-SRC_URI = "git://github.com/lm-sensors/lm-sensors.git;protocol=https;branch=master \
+UPSTREAM_TAG = "V${@d.getVar('PV').replace('.', '-')}"
+SRC_URI = "git://github.com/lm-sensors/lm-sensors.git;protocol=https;branch=master;tag=${UPSTREAM_TAG} \
            file://fancontrol.init \
            file://sensord.init \
-           file://0001-Change-PIDFile-path-from-var-run-to-run.patch \
-           file://0001-Fix-building-with-GCC-14.patch \
 "
-SRCREV = "1667b850a1ce38151dae17156276f981be6fb557"
+SRCREV = "5c3ba50f806dea27c3b1e368966191c735459111"
 # Upstream release tags look like "V3-6-2". The checker only converts "_" to
 # "." (not "-"), so the parsed version stays dash-separated and cannot be
 # compared against the dotted PV; marked unknown until that can resolve.
@@ -128,6 +127,7 @@ PACKAGES =+ "${PN}-pwmconfig ${PN}-pwmconfig-doc"
 # isadump and isaset helper program
 PACKAGES =+ "${PN}-isatools ${PN}-isatools-doc"
 
+PACKAGES =+ "${PN}-zsh-completion"
 
 # libsensors files
 FILES:${PN}-libsensors = "${libdir}/libsensors.so.* ${sysconfdir}/sensors3.conf ${sysconfdir}/sensors.d"
@@ -172,3 +172,5 @@ RDEPENDS:${PN}-pwmconfig = "${PN}-fancontrol bash"
 # isadump and isaset helper program files
 FILES:${PN}-isatools = "${sbindir}/isa*"
 FILES:${PN}-isatools-doc = "${mandir}/man8/isa*"
+
+FILES:${PN}-zsh-completion = "${datadir}/zsh"

