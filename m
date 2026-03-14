Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82FFB10706EA
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 17:14:16 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13876.1773508451861917556
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Mar 2026 10:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TBgpYGAf;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852ff06541so34444215e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 10:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773508450; x=1774113250; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TfUOnEO4xgy/j59ChiQy6wMxgOCGc6dYoxF5IoI7cLk=;
        b=TBgpYGAfvnbLl7NZFJFwquOg+tpmCYqZNaVKP+rAOf7jhbC3N3xnscSUM6DUBRGRWP
         2vDXz//83w73BlwsraMGwVfjiKL8gRXyRVs761nG90T5KpybhD+a5PYggh4e6uXvTF3v
         Z/eMW6A/Jf2Io9BubVWR4OJEvwlCbRRTIsROGTa5ELLhwg00zbLvCNt57KNLhoNOi2TE
         69PNSM6eq0FfmmR2mpjqaUF3rkAM2BDte+zV2I0Q5zzR1lye4pIigzRubE6xDDRIa80W
         +jaxhuN/2L3DDUSTVETehdUUdFPkMDD79l7CNVvgNAas9nzZSZPsXvd6qw91BABbSs/V
         4Z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773508450; x=1774113250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfUOnEO4xgy/j59ChiQy6wMxgOCGc6dYoxF5IoI7cLk=;
        b=gaWRp6JnRTxsia7rehervzt+re2nfem0WPBRkxnhChfJm3j9m8I+TUCkV2jsw8zhNd
         EnfBzGN7ESgv9i+YaBaD+OXa85X1Wy/IKN9SgKwK6KlMinIBdxZCxHs/H8gt5qF+UK6L
         0nN6NYLU8xz5NDpRgLg58I25Sjn3u4l6st9lXHJEvVi9nXJTEju8coU1/Gkyl0BIChSo
         s5PkslSuNH4ClbniX9IWQPIPhC23lVfJyfpScJuUp4LuP/qhscyFd02UXHDl0GywS+3v
         54BIBHWFcC8fAZ+6kz2mlWkWLbe0ycF/Q/1C0C5+Q+HU5JCByY52NVECtwRcbLMqf4u/
         Hodw==
X-Gm-Message-State: AOJu0YxOURrDENQ+jZRODlcpgzeablvMUTrblVMB8xQ8pgUFrLr4IMhl
	ikitvcpVmErxy7Q68204cBlvD2uC8gz1xc4D6saNlZj/f1tix/O4f4aubLEVCQ==
X-Gm-Gg: ATEYQzxdy2AYPFLTtwAmWKrOCH5cFxcIvnJQY7YhTp1sarJS3i897HF6o0FRczAMEEQ
	V4Y3LZYY2bapLxqB1FtJvangJKOKzsl+99kv4LJxGlmeWeHabaqxv/DCDHVuLZbHFHo0K4Kpdfu
	MsQnPkVyG2KJbTRXn0ClAsd9qhYHCVID5b/N0DlLJzydg7NcjefLGpz9nd8A/jYgAHiCx0wTDZ2
	oJQHfazoarECFe1xpZFAakCdPKdIyUPHCEXTkCdZf4FDyzDMBw/TAetvPpVwBUWEFBRTUgfSp8n
	GlXazoDNk09jm2CTumv7mtPzSQhaUc5Q8yTaAYHQqpVGLzeZ++gIKIp5g9vKJ8jObMGFyOZd4GC
	QbehCZhYp5xDoo1yDrdDzGlkbyDv8LQ4a6CD3aWTDg4vz5x5kNbkJHFd9jaIPTbWMdxIdh7BrK/
	ZATXU7Ga42GKlhB6AD3SQo
X-Received: by 2002:a05:600c:548f:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-4855670514dmr114725175e9.20.1773508449874;
        Sat, 14 Mar 2026 10:14:09 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c6ece3sm48529595e9.29.2026.03.14.10.14.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 10:14:09 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-settings-daemon: add alsa as a mandatory dependency
Date: Sat, 14 Mar 2026 18:14:07 +0100
Message-ID: <20260314171407.3510715-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 14 Mar 2026 17:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125210

In case the recipe is compiled without alsa DISTRO_FEATURE,
compilation fails with the following error:

../sources/gnome-settings-daemon-49.1/meson.build:132:0: ERROR: Assert failed: ALSA is not optional on Linux platforms

This change makes alsa a standard non-optional dependency.

Alsa is enabled by default in the upstream meson config, it is
not enabled explicitly in the recipe.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gnome-settings-daemon/gnome-settings-daemon_49.1.bb     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_49.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_49.1.bb
index dfda4a3a13..a9b5aceb1d 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_49.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_49.1.bb
@@ -18,23 +18,23 @@ DEPENDS = " \
     upower \
     libwacom \
     networkmanager \
+    alsa-lib \
 "
 
 # all these are mandatory
-REQUIRED_DISTRO_FEATURES = "polkit pulseaudio systemd gobject-introspection-data"
+REQUIRED_DISTRO_FEATURES = "alsa polkit pulseaudio systemd gobject-introspection-data"
 GIR_MESON_OPTION = ""
 
 SRC_URI += "file://0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch"
 SRC_URI[archive.sha256sum] = "2a9957fc4f91c3b9127b49484179bef485120d9c1c208e44d44e6a746e6cc1c1"
 
 PACKAGECONFIG ??= " \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11 alsa', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)} \
     gudev \
     smartcard \
     cups \
 "
-PACKAGECONFIG[alsa] = "-Dalsa=true,-Dalsa=false,alsa-lib"
 PACKAGECONFIG[cups] = "-Dcups=true,-Dcups=false,cups"
 PACKAGECONFIG[gudev] = "-Dgudev=true,-Dgudev=false,libgudev"
 PACKAGECONFIG[smartcard] = "-Dsmartcard=true,-Dsmartcard=false,nss"

