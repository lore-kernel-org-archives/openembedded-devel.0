Return-Path: <andre.paiusco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6486C54E4A
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 19:20:21 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.2337.1709839212790140119
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 11:20:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dEeoAnT6;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: andre.paiusco@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a3ed9cae56fso440562566b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 11:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709839211; x=1710444011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OpH+GVlpYHnTeeE0vD6C/giEfgg/4IpzaFbvbrJN0NY=;
        b=dEeoAnT6L4AJE09eVdUFjNYww84csGjqC02TcyfLkTrSL5ztTEY9WJyPz+64kaOC4m
         +BqcZfCQ3hzlJhOlZDg3dtPjQF8W42ZNk8o1uv9nHTSID/ApSl5bXkEMs/G94+xX37QN
         fiQLDU/jL5yYqZMkwgk3xC9NpyKBGlkKlc2WZ75RHWxC6I3o3rhl296KHohxFbdttuQA
         kBt6KW3eRWIIPmwd6OlBEL2NMm0Iyxx6VtwQDSTqY4hMpNMS981ha2QhmELNyVqbCN4M
         Qcb67awGnRd8nWGwZNT6QdEpwE+7S8QDARrY7FBtuwqMHzuKJEFvFjDuse8/65+56wt7
         jktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709839211; x=1710444011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OpH+GVlpYHnTeeE0vD6C/giEfgg/4IpzaFbvbrJN0NY=;
        b=BWwg4vFaBWa6L97/nuyRozLtDBpugdoH7Al8DGvGP4FC2Mz+YqI+/4HOtzvF2UdLND
         iHXBiRQl1tBuga0nSJS0S/bl0CKveOV6K2UiUM587E1lbg9WYqwUs/ZfvWX6mHFLq3ga
         zg7YRx+wkSo/Tvoi20zMLC32WfpjPbs2Bsq+azUGc0B8kCo2BAzLKyCXcTAEhObdzW8l
         RG3R5M/Ff7JXIhY+ImJj6U5PyS4rGQJhtU7Xiri0j04rmIy3/HcLpJSCNLiKoiojuGJj
         i89SZx3rGNK9+U6WZT8p71r2YxI7kZX7Ad4aFyDmICCsaMr2kV0twFGF9xx0SRY5QzHH
         YK7w==
X-Gm-Message-State: AOJu0YxWJQPEc2JypK/wimpB1fZ/rfunhz4dUOflyntBCnFfXTifU4II
	nOdHB+wMfZaqisE7YstiwuJ3I2iMU5Y9Zr7qkXPLJfEF4SHJpXZGpGkZwCT4
X-Google-Smtp-Source: AGHT+IG7VI8+PrRlYQvYY00dv34oc+0AINoyOuPpBr5K1IYq1ys8MW6tiCMpV/KDTlenT/Dduds2eA==
X-Received: by 2002:a17:906:5acf:b0:a45:6d38:60aa with SMTP id x15-20020a1709065acf00b00a456d3860aamr1066909ejs.30.1709839210686;
        Thu, 07 Mar 2024 11:20:10 -0800 (PST)
Received: from localhost.localdomain (84-107-6-196.cable.dynamic.v4.ziggo.nl. [84.107.6.196])
        by smtp.gmail.com with ESMTPSA id r2-20020a170906c28200b00a412d3d509fsm8567527ejz.181.2024.03.07.11.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 11:20:10 -0800 (PST)
From: Andre Paiusco <andre.paiusco@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Andre Paiusco <andre.paiusco@gmail.com>
Subject: [PATCH v3] ydotool: Add new package
Date: Thu,  7 Mar 2024 20:20:09 +0100
Message-ID: <20240307192009.24569-1-andre.paiusco@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 19:20:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109205

CC: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Andre Paiusco <andre.paiusco@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 .../recipes-graphics/ydotool/ydotool_git.bb   | 20 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ydotool/ydotool_git.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 6e2012dae..dd033208b 100644
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
index 000000000..2525ea70b
--- /dev/null
+++ b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Generic Linux command-line automation tool (no X!)"
+DESCRIPTION = "ydotool is not limited to Wayland. You can use it on anything as long as it accepts keyboard/mouse/whatever input."
+LICENSE = "AGPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eb1e647870add0502f8f010b19de32af"
+
+DEPENDS = "systemd"
+PV = "1.0.4+git"
+
+SRC_URI = "git://github.com/ReimuNotMoe/ydotool;protocol=https;branch=master"
+SRCREV = "c07ae72be46c40912023b91b8ba737630d8720e1"
+
+inherit cmake systemd pkgconfig features_check
+
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+EXTRA_OECMAKE = "\
+    -DBUILD_DOCS=OFF \
+"
+
+SYSTEMD_SERVICE:${PN} = "ydotoold.service
\ No newline at end of file
-- 
2.44.0


