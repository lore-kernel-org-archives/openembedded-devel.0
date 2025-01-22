Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20EE8C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 16:54:52 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.48793.1737564886972034956
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jan 2025 08:54:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YSy9Y09a;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so50125745e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 08:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737564885; x=1738169685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc7PF0uk0F7vrWuoCDyPOK/J6rkg3UUfQMK7RIjlYS4=;
        b=YSy9Y09aDtpH1yJ23zpFxg/So9ZmxJOCxi52cyN7X6YtxZC74vSGZ6qTZDtoPrcZOe
         MVW0dHbKWIZhhb3V6LS/oncGD6VoLYVj0P9MsL2l8asB1Clda0HzBI58rA6wgLxsRkbx
         K65jpiiSAu26TV8mvkBmy+NHX5awZ7D6vo4A7rD1MrzpjvdssYdB5hvusdKpChqiU9J/
         6DaK0uzAq4I/msZS6OuDfKhAGDeSg+9ZfBabwXCe1pRUv+A62NgTcNh4x28SkrOsBU0H
         xcrQEgebFNQBEzclH+5q9JMSEfn2LJg9sQvKyrJYXlwjxrskQ/6zRRWQxF0FEcanJeBs
         pVuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737564885; x=1738169685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dc7PF0uk0F7vrWuoCDyPOK/J6rkg3UUfQMK7RIjlYS4=;
        b=gqt1zGiDSCe/6/pv9VC1EyL0+SVPReNf3bKdLpZ8hbO55SFC0dRyG0Csj24puVYsGz
         z8enZRFszt72/34Ob3rMLoi1Ig7Y4npAwB4ELmfZj6nF+UE5fIAoFU+F4vnImbzXI4x6
         I3m63MSIpe9Epzenr0AETxq5yVt+luXY07ppy9KuzCOnX2dgZIKapCfBwTVjUbqgI3qm
         j36qK+qfWlQ3FLsTjgvjvhR4JE4QNwB/6QST8Px/Xyubwlq0RMXbk4dnJnvnvYc9lBRb
         EAGWaV0ur6pea2YU1Gxtr019nCAuDU2AvR1O5QV0WKsht1zDwae5U+W5Hs9aDoMxika1
         GJUQ==
X-Gm-Message-State: AOJu0YwKDrDc5R7asE2np33oTMM6e4LTb/BrwJiWekffExtpExrALL9T
	IKa0iTW7XWtcK4BSFj1hdrjGccei+14kZOcuvVnI0zHe6eEIj8jj/k6l6w==
X-Gm-Gg: ASbGncvrWMmS2PbrWMvNt1xLEgFQIJYqxg8Oafoss3Cf3WHwv/ydaQqTqAuxyx14lZn
	e9ny/7GqBdgpN9fjBNPL1wltlXRFc3QUx3rQt9UzJkBbt3XYdGMs8ucnt0effq4dKT/hBa5Rc7O
	l62cgkVRU4l9UBgfnmvkHVMFDtrzK3dGW4ZxemijOpQE0N04DkTkgZHeN9pXZCdu/XLOWI/vg3I
	8pl6uvIuckxQLXJOdzDDH1jKWzYTNzRSaRTeVciMOZRLC1vURzdZBakPCPsFWWZ6jcLNKxWwIko
	afCq4rFd3Q==
X-Google-Smtp-Source: AGHT+IEOf0Uj2gl28ZmT47709Z5k7KkLd127pWtZ7YSD5Gtg1ysUkrjVkpDO0TNkHr1PxlC/fRycJQ==
X-Received: by 2002:a05:600c:b8a:b0:434:a386:6ae with SMTP id 5b1f17b1804b1-438913cae53mr216865295e9.7.1737564885035;
        Wed, 22 Jan 2025 08:54:45 -0800 (PST)
Received: from localhost.localdomain ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b318c010sm33167265e9.2.2025.01.22.08.54.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 08:54:44 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: [meta-oe][PATCH 2/2] ndctl: fix building documentation
Date: Wed, 22 Jan 2025 17:54:22 +0100
Message-ID: <20250122165422.2750317-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250122165422.2750317-1-skandigraun@gmail.com>
References: <20250122165422.2750317-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 16:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115020

In case "asciidoctor" meson option is enabled for building
the documentation, meson looks for a binary called "asciidoctor",
which is a ruby application, different from "asciidoc", and fails
with the following error:

../git/meson.build:153:15: ERROR: Program 'asciidoctor' not found or not executable

When "asciidoctor" option is disabled, meson looks for "asciidoc",
which is readily provided by asciidoc-native. When docs PACKAGECONFIG
is disabled, the "asciidoctor" option can be left on its default value.

Also, add xmlto-native as a dependency for the "docs" PACKAGECONFIG,
otherwise build fails with the following error after finding asciidoc:

../git/meson.build:156:12: ERROR: Program 'xmlto' not found or not executable

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-core/ndctl/ndctl_v79.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/ndctl/ndctl_v79.bb b/meta-oe/recipes-core/ndctl/ndctl_v79.bb
index 90f6d13fd..1ad1476d9 100644
--- a/meta-oe/recipes-core/ndctl/ndctl_v79.bb
+++ b/meta-oe/recipes-core/ndctl/ndctl_v79.bb
@@ -25,7 +25,7 @@ EXTRA_OEMESON += "-Diniparserdir=${STAGING_INCDIR}/iniparser"
 PACKAGECONFIG ??= "tests ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
 PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled,systemd"
 PACKAGECONFIG[tests] = "-Dtest=enabled -Ddestructive=enabled, -Dtest=disabled,"
-PACKAGECONFIG[docs] = "-Ddocs=enabled -Dasciidoctor=enabled,-Ddocs=disabled -Dasciidoctor=disabled, asciidoc-native"
+PACKAGECONFIG[docs] = "-Ddocs=enabled -Dasciidoctor=disabled,-Ddocs=disabled, asciidoc-native xmlto-native"
 
 SYSTEMD_PACKAGES = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
 SYSTEMD_SERVICE:${PN} = "ndctl-monitor.service daxdev-reconfigure@.service"
-- 
2.48.1


