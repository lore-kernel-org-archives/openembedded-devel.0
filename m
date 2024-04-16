Return-Path: <andre.paiusco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCCEDC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 10:53:10 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.17679.1713264781542331094
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 03:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e3mEgX9e;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: andre.paiusco@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-570423c4f80so719403a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 03:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713264779; x=1713869579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LAAU3LHBgZlhQevc7NU2YjyNkS7G57lBzdYSXoq5NFY=;
        b=e3mEgX9e9U1diV0NXsDYrAqTL7FKzomSBim6XpioSsEWOBfJ0edrK12GrAvBor27AL
         /x2ydz8kaLojsdiPfC8vLG4sfmqbiYiqPl2NZdrksl1kfCrATkdT2y+CM8t1izMwwOsT
         dGHq+HgJTVxUZf4YxC/7E0tdKpaySIs1jVndRTrVOQab+k7OmrkdJlJPYEd6LqAxKtlb
         64CIiLmBZM/Focm72XuqiLZWw+oHJU40qFfJBSjqCdHs2tNZNAEhuVdjrxjR9zlPv9Ml
         XakFwkhKIMXmG/ZuwgsXRPh8igxEiR9qbcCraUUK+ipixhoOUvL/bxYKc53WvpIgQ6nM
         anvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713264779; x=1713869579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LAAU3LHBgZlhQevc7NU2YjyNkS7G57lBzdYSXoq5NFY=;
        b=ZbW4HeJ3AUwx6T6uSECB/EhMafEbr3f1MwLbnAsmqOPEU9pon4rGDhrzaz9rp3k+4e
         p7M3/w1sZWsiUngacfvCM1dA/G3du6EVidYnxq1WK0S4wQspEVG5oOp19PoU2kmnta+o
         JsseprGB7c5h7ECQqPJhp34cM+wS548XC9G9/aL2mFq+BsivENdWYwKstHrKwAc2AG2f
         wS4E7bx+hGk4r0wvDinRAOYrL6whhZVxJXE4ULY/Tq/EFRss7djGdAs4Zt3yxzku1/00
         hsZt79vMdMjWAcjAwPYF5GP0VWZ4p7BooL7bqVayUAW0f4+kCnnoDDUwibkPUyOz+JUg
         3l2Q==
X-Gm-Message-State: AOJu0Yz0E/jlpOx36pekDlhrCBJ64/M3hjEJI5bkq+3SuPKPkIyx4hKP
	UfqCj74v+IcVmLmDODD1ep+2jMeP/B0ebNsu0NAi4LODI2VgpQIdVBJMm8Db
X-Google-Smtp-Source: AGHT+IFleQ3NaFjRTjT/6sqXK+V5PN0BT17RKaXAGGwH12TwInsoybPYSHlcqlRGnCvhEDgtbPOlDA==
X-Received: by 2002:a17:907:208f:b0:a52:6b11:308 with SMTP id pv15-20020a170907208f00b00a526b110308mr3423905ejb.30.1713264778987;
        Tue, 16 Apr 2024 03:52:58 -0700 (PDT)
Received: from localhost.localdomain (84-107-6-196.cable.dynamic.v4.ziggo.nl. [84.107.6.196])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090657c200b00a524476aac9sm4762602ejr.108.2024.04.16.03.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 03:52:58 -0700 (PDT)
From: Andre Paiusco <andre.paiusco@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>,
	Andre Paiusco <andre.paiusco@gmail.com>
Subject: [meta-oe][PATCH v6] ydotool: Add new package
Date: Tue, 16 Apr 2024 12:52:57 +0200
Message-ID: <20240416105257.49116-1-andre.paiusco@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Apr 2024 10:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109975

Add ydotool, generic cli automation tool for whatever input
(keyboard, mouse, etc.)

Reviewed-by: Khem Raj <raj.khem@gmail.com>
Reviewed-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Andre Paiusco <andre.paiusco@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 .../recipes-graphics/ydotool/ydotool_git.bb   | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ydotool/ydotool_git.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 8a63f5b20..7544a9fbf 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -611,6 +611,7 @@ RDEPENDS:packagegroup-meta-oe-graphics ="\
     xcursorgen \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xscreensaver", "", d)} \
     yad \
+    ydotool \
     parallel-deqp-runner \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl vulkan", "vulkan-cts", "", d)} \
diff --git a/meta-oe/recipes-graphics/ydotool/ydotool_git.bb b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
new file mode 100644
index 000000000..c1427457d
--- /dev/null
+++ b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Generic Linux command-line automation tool (no X!)"
+DESCRIPTION = "ydotool is not limited to Wayland. You can use it on anything as long as it accepts keyboard/mouse/whatever input."
+LICENSE = "AGPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eb1e647870add0502f8f010b19de32af"
+
+PV = "1.0.4+git"
+
+SRC_URI = "git://github.com/ReimuNotMoe/ydotool;protocol=https;branch=master"
+SRCREV = "0c295346d55afcc6aebaaee564333b3e1efabcbd"
+
+S = "${WORKDIR}/git"
+
+inherit cmake systemd
+
+EXTRA_OECMAKE = "\
+    -DBUILD_DOCS=OFF \
+"
+
+SYSTEMD_SERVICE:${PN} = "ydotoold.service"
+SYSTEMD_AUTO_ENABLE = "disable"
-- 
2.44.0


