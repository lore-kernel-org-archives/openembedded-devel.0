Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F98EB28EC
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 08:24:00 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7206.1770366237050405237
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Feb 2026 00:23:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KAJmlQyW;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4362d4050c1so109320f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 00:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770366235; x=1770971035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=zdoC3oMPPq84lgynCfCyjAXlkpwZgdpPnCZ12EfjHNo=;
        b=KAJmlQyWqMrhbnCTLFDiOpZf/KUvhp3afkQQSpMHTpu3XL8+t50BdDqqvdjcxuhFm9
         P/dqFsWGizevuVQ+N2zqW1EixYtozHpXjHQHExuwvSPN3NmeiH/8F5y73+/GVOz5zZmQ
         ovMmu7VNYGwmk7231CVpSpABQZxXqpdJ8JhwdW6fA1MuMKPWQFk9azmdscOtTz84IDWa
         JgqiMNHwabvH8cVl5M5U3v2T8e4MKMucnfD6UXYvSw2/9ggKyIzEUBN0zInQTAI60qfV
         KFSWt9WdRvIqgBAYx5PViS/2CulT2uFtRV2SB4imTzsP9Z1LOWx0JS0N6LzGXzVy5YQD
         dusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770366235; x=1770971035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdoC3oMPPq84lgynCfCyjAXlkpwZgdpPnCZ12EfjHNo=;
        b=Aqhzl/D4cqbXQL6vbAJSuPHaoYoEaODr5AGetWbvC5AUEulNoqSlKfpK42IOcj3exd
         k/T71UamQqSIYNr2SOA9iju49/C2xmCWt/rkR2o7+48X6l6SdZFgozaNpPwBT47EYBO6
         3jJG9KPQVRJQqK7aw217wdRjdB6m7jojfMn3vL1Az1Qwx/Jv3SFY5MZ0NiCuzYR8nwbc
         8Qj8FeDBZkcKHNVIu3KbjbKvxEtqocJM4AZNVvtSMdgxPH/XV4wxWPpxn7f40Q84Pr7F
         OW0r3mutrdYbuwzAemv+O0H+c/DCmtSpRPJ44RETQxH/opqBIDao8PHLNr1gOg0ygJeb
         HZBA==
X-Gm-Message-State: AOJu0YxXds2MyV9V4xvwRRi8L5GNbkjRPiIU0N9Y6QaGk9CfpK0NWmwq
	EsEN9/vEu2jo5dAc/Io9C5jNlk8VWm69dWc44a1VoECP+CCIaHiNy0BqsURQ7g==
X-Gm-Gg: AZuq6aLoSWnZLclTZKAKebpgUQw1u9Gixfho8O4WzeRQs+juMgRu7C1JvupGpk91HMJ
	vhBPabStV+RMFPWbiLlJ6WyuQzPQBJjeLrLw2JpnATpvcY0BM5UiC/3I+7QYZqaC14E1cszediW
	OfVIGrSBr+AS2UyaFuxKG1fNdtQLImCU8qTXSAOIHAUuNdZnNcCNXWkXwcLbXeCoQ0djXGrJVUS
	QfrowqWxqcWQm+kzD6upNg/4OjH+WIQCcaFcIZ2l6lU/l/ya3jF4J0GV9iEPUbjEtiMKUHboKXX
	hn9rZY1+6wv+sV56XT8nFwUXbrQ9yLPivBsAK8Mk4HYzFhMSa9QOo1U4gGKQO9wKY+zNynBEFxJ
	GgbvqoZDbq4PNCrA+iA0TuXILcjqWt5EuuTPjzmNH+NUfm8OkiloEnhVnFLXllYxAmeNexDHYiE
	IfPLBLFwwV
X-Received: by 2002:a5d:588b:0:b0:431:32f:314d with SMTP id ffacd0b85a97d-43629341fc1mr2807584f8f.25.1770366234981;
        Fri, 06 Feb 2026 00:23:54 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd3fdsm3952634f8f.16.2026.02.06.00.23.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 00:23:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] obconf: fix SRC_URI
Date: Fri,  6 Feb 2026 09:23:53 +0100
Message-ID: <20260206082353.1443141-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 08:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124238

The old SRC_URI has became inaccessible a while ago.
This patch switches to Debian mirror.

The file contents are identical to the previous source,
except for the top level debian folder, which is not present
in the new tarball (but it is mostly useful for Debian
packagers, and not used for compilation).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-graphics/openbox/obconf_git.bb | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-graphics/openbox/obconf_git.bb b/meta-oe/recipes-graphics/openbox/obconf_git.bb
index 917492c982..04f10f138b 100644
--- a/meta-oe/recipes-graphics/openbox/obconf_git.bb
+++ b/meta-oe/recipes-graphics/openbox/obconf_git.bb
@@ -10,12 +10,11 @@ DEPENDS = " \
 "
 PV = "2.0.4+git"
 
-SRCREV = "63ec47c5e295ad4f09d1df6d92afb7e10c3fec39"
-SRC_URI = " \
-    git://git.openbox.org/dana/obconf;branch=master \
-    file://0001-Fix-function-protype-visibility.patch \
-"
+SRC_URI = "http://deb.debian.org/debian/pool/main/o/obconf/obconf_2.0.4+git20150213.orig.tar.xz \
+           file://0001-Fix-function-protype-visibility.patch"
+SRC_URI[sha256sum] = "2c8837de833a4f2859ddf06e512d7d96d9a7623f90f95d1137779c69e9209feb"
 
+S = "${UNPACKDIR}/${BPN}"
 
 inherit autotools gettext pkgconfig mime mime-xdg features_check
 # depends on openbox, which is X11-only

