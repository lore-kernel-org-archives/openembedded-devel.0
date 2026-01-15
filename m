Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FAAD41169
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 10:40:12 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32604.1768473307692481372
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 02:35:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=pjuRxJLz;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.41, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8773fcff60so14152566b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 02:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1768473306; x=1769078106; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=77UpSnSWL8WroGEXD6VubIH7dGB/udvcwRlnH8Z0YzA=;
        b=pjuRxJLzXRpP0R+x1bo2tOhnPZB8beEyB+oiLsPjQ7OIGZyg/s7epWyMfTJ9zUT8MY
         x43yDFIuKQJmQvtzoRZJAKlxLT+pzcuqOCWx8tfXKmAob20ik8z2d55T5YL21KKuPYCW
         iOduFJZKkI/iczEijyTAesQRO9s+uo0IhvmEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768473306; x=1769078106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77UpSnSWL8WroGEXD6VubIH7dGB/udvcwRlnH8Z0YzA=;
        b=h/13nvAa07817IeZREgreJV82DGWxEQEFf9CLlwfvADlNT+ElXfhYaUJXpu1u/QMRo
         mwcdt34NquZLCdWyfDJYU93oWS1ZJMyglxGgRinajj0d98xdQDNPsK8muZo5eb+JRaEM
         fG8wdPAt4RzodgBqn9ryr5hAoJ4qNjo4evWj+xviUl43MnmzyGdIV7Ia7IoNaJWZD/5A
         w8IMXLC6BUU5uonaiKPxho4z4pR/05IKdQf2Vjh237iI+Nl5+CEWETyJd4fwuD3bGVAf
         BrB7f1xl2/+aeuowxZc6PadBua+sK3Z+X8ePgOfJaPOUWtOSQZt1qizXZvWPrsqaO4tN
         AIIw==
X-Gm-Message-State: AOJu0YwSZiZZ+plDrrjcG3S9cGFFJn603fmGSzNhE0nzMe2eMxaVFs9C
	n/I2piC8l/mL/cVvWQiZSUiyHg5QEM8wiLO7TfHxhLPcCOMsCoGTr44Y63rLDY+QfsCCnQwdL91
	nL5sC
X-Gm-Gg: AY/fxX7QIc279ARlzIsRous5Y4Egf/r6vYI4nMU6QjX+PNZ5JyBYWe6b66tDXPCL8lE
	+cWnzfxLJj/pp1hJzqfa7xiwjh+Vw4Cxp+z3bulm10PGkvHtwyPm5HOIpfzcb9UmMN1qXocc0gH
	YtCzVtCpBIEXWx7Ez8Jy1fAPNEEJolbRSTq9U+7ENLyzBMRtV4W85t6Ji7CSDnm3tlSe5PRMyto
	ZQfe/ovyW+2LWqiAwLDWoZFUPlqNK4roKMwUpXq/dNee6Hrnx9uJ+K0Ug1B1ExN/4wGkb1Nl7uQ
	r6SdwIreDnZFjDhGU9ukUO/FCBU6+8/JBsz3kr+2/JhjdyqZAN2Qwl/ANdvfRTNsTKnovKdu3oW
	tIlT3nOTHnkHrKcVduPpqHnm1idk2Mjg2NUyqAfyABfRpT9CAhIYAllPLryXXmWgIGD3VhKG9Bj
	K4t0lXpAt8zH3sR0XxrLOrKU386m/TbsJrwUm1SUKE0r/mbZH1VQMsEId+jTTOKErt6xqf6yJqo
	Ig6FteDjfWDTLadiw/IPpS5DvShHUFcmwJ2+pBO0dN2zuP8rd78yqiqQA==
X-Received: by 2002:a17:907:968e:b0:b71:a627:3d9f with SMTP id a640c23a62f3a-b8760e1aae1mr300613166b.0.1768473305927;
        Thu, 15 Jan 2026 02:35:05 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8773b689a4sm274353866b.62.2026.01.15.02.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:35:05 -0800 (PST)
From: "Adam Duskett" <adam.duskett@amarulasolutions.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v2 1/2] libtsm: add recipe for kmscon dependency
Date: Thu, 15 Jan 2026 11:35:02 +0100
Message-ID: <20260115103503.200126-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 10:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123501

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
v1 -> v2: add tag=v${PV} to the SRC_URI

 .../recipes-graphics/libtsm/libtsm_4.4.0.bb   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb

diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
new file mode 100644
index 0000000000..1764ba628a
--- /dev/null
+++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.4.0.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Terminal Emulator State Machine"
+DESCRIPTION = "\
+    TSM is a state machine for DEC VT100-VT520 compatible terminal emulators. \
+    It tries to support all common standards while keeping compatibility to \
+    existing emulators like xterm, gnome-terminal, konsole, etc. \
+    TSM itself does not provide any rendering nor window management. It is a \
+    simple plain state machine without any external dependencies. It can be \
+    used to implement terminal emulators, but also to implement other \
+    applications that need to interpret terminal escape sequences. \
+"
+HOMEPAGE = "https://github.com/kmscon/libtsm"
+BUGTRACKER = "https://github.com/kmscon/libtsm/issues"
+CVE_PRODUCT = "libtsm"
+SECTION = "libs"
+
+LICENSE = "MIT & LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "\
+    file://COPYING;md5=69e8256cdc4e949f86fedf94b1b320b4 \
+    file://LICENSE_htable;md5=2d5025d4aa3495befef8f17206a5b0a1 \
+"
+
+DEPENDS = "xkeyboard-config"
+
+SRC_URI = "git://github.com/kmscon/libtsm;protocol=https;branch=main;tag=v${PV}"
+SRCREV = "0d33498a6de3619628f7802a0c76fc98c8773d5b"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON:append = " \
+    -Dextra_debug=false \
+    -Dtests=false \
+    -Dgtktsm=false \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.52.0


