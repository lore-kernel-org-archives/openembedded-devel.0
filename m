Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327FFC021A0
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 15:49:57 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.11328.1739634589909693911
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Feb 2025 07:49:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZBvQxC8a;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43962f7b0e4so17976295e9.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 15 Feb 2025 07:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739634588; x=1740239388; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x/k93MBhNkOgajLWAD87dBoeKp6qOqzEGgRLyzUESNc=;
        b=ZBvQxC8aw7xG0dlY2aSImyqatPayeZTb+SjM7rl6gWFXLu/uiDmvBLWc6HZnI20Uva
         b4idpTeizzo+IKfGGhUOKagZhbHnkgv8OLw8ERjqAJUjz07/TAM0Fh1DaBWfAfyaPYx4
         J0KJ0JHxKmFNenvpdKICkin4FCO7jww5hBDEV5RA1khSw+RnpozNkUl4ef4q5hTaTKnJ
         LNQtG9r5gEOOCwFgIhJuihjdOLkF8K9vE9SObwvKn+dIfOKWYDyrh+OUBTDd70GcP2G6
         MKWDs92PeCKGWQ8dju2ePy9TJlupPIZ+7l5vrV9Cy0Lv575PrSuwelGsxnr/GmpYDGiO
         y16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739634588; x=1740239388;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/k93MBhNkOgajLWAD87dBoeKp6qOqzEGgRLyzUESNc=;
        b=eMagwG43JSgaAXMDYaxsOCO89Bp027ZCCT5pP/QalfrbFT965+YSgKdY8gvYepq0Pm
         uxLc0mZ4frwu1rEouaiLtmc+eQetbTllRuomx+Gn1B+EOQM4MPb5wr02cOg3JwAH/+Wx
         /sv7ElPmGQGiDmX0cOBgA9jWZnmK8k+U8V5yUCw3CAV7pY/TPdJ8JIig+WYHvR64NLr8
         QR6Xfv2a50I5hvyFNwdz5Nin0F/Z+nAv9QPKa2XkHaBfidC4VJeooHmuw6z16gfFf0dP
         398Pi/y8mO9VrlvoAEHo77XT+kZCRNWxcHsvjrU/rbxii6jjpHg5uZyUa42nIS3mMmg1
         Lqew==
X-Gm-Message-State: AOJu0YwU+8xIjCeORGUu1MOWp6ZOIfIX8X8mWAwHSh2DOhZ2ujSd6vO3
	iKZrg5nFLQdEI/tNeKbKPOIXNSVWtJlQk6UbX0Rk0gsfLkvwF4ydp3Mp0lP3
X-Gm-Gg: ASbGncv1Utt0pJc5YFISYx9Yd9KU+cXput5rB6ZTlXqDEN9ucfqI4NpcrJzozV5JnQ+
	UyoXANAS4czG0FR+MLIY4oDeY3chld+lbocQgl8kUS7oWXdJVQqtcd9ty5egMLtPjEWxIzkAIt8
	PvW8oSDysCspaPeqviYEgLuDBGELCv7kKss+iuFRTBnqjq04AomwPag5K+2wFpOSOrv03NcDjQk
	Ilr5bsKk1kzRbMkU/O6mjqqUC8q+aAXJNQCm0zP+5ig8k6xZoWpiWWAIiyIifIZKzAzWIQiPOMb
	EYPe1xnIIL9+zmE/n+nB8Hm3qp9TRKMWkcU4R3F3yXL27qMDQu2Z3sXMKQ==
X-Google-Smtp-Source: AGHT+IG4E2m/F4QfVw/xD6wef5Lv/eOYU1NUhnpeRm24SD3OZr3cdt29s0ybvKjZXuE1p+93zPMOgg==
X-Received: by 2002:a05:600c:4fc9:b0:439:4696:c071 with SMTP id 5b1f17b1804b1-4396e739c5bmr31932125e9.19.1739634587629;
        Sat, 15 Feb 2025 07:49:47 -0800 (PST)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258cccdesm7511473f8f.26.2025.02.15.07.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 07:49:47 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-filesystems][PATCH] gpiod-sysfs-proxy: Fix deprecation warning
Date: Sat, 15 Feb 2025 15:49:25 +0000
Message-Id: <20250215154924.1410-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Feb 2025 15:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115495

Replace `\/` sequences to fix:

  gpiod-sysfs-proxy_0.1.2.bb: Var <MOUNTPOINT>:1: DeprecationWarning: invalid escape sequence \/

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
index fef2589106cd..13e4e680fb6d 100644
--- a/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
+++ b/meta-filesystems/dynamic-layers/meta-python/recipes-support/gpiod-sysfs-proxy/gpiod-sysfs-proxy_0.1.2.bb
@@ -24,7 +24,7 @@ SRC_URI[sha256sum] = "4bdd4b8a7042f63a40507ae0f16b360011e67cbb2f0276289636487a54
 # non-standard behavior so make sure the user actually wants it.
 PACKAGECONFIG[sys-class-mount] = ""
 
-export MOUNTPOINT="${@bb.utils.contains('PACKAGECONFIG', 'sys-class-mount', '\/sys\/class\/gpio', '\/run\/gpio', d)}"
+export MOUNTPOINT="${@bb.utils.contains('PACKAGECONFIG', 'sys-class-mount', '/sys/class/gpio', '/run/gpio', d)}"
 
 do_install:append() {
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then

