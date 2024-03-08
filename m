Return-Path: <andre.paiusco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB397C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 07:22:55 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.16415.1709882567666713235
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 23:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JquprMbI;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: andre.paiusco@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a450615d1c4so312296866b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 23:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709882565; x=1710487365; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzwes1IMpSwrJGU0iblGbLnj1fbRwrcWBJBUSbaJb6k=;
        b=JquprMbIugJT4TAP/zrAA52tRkHkj9nxba0+2KKXvYWxXuWy1aVfapfCxofbtFdSIM
         dxkjbCDxWFtquAv7h7UAamMSZkf4ZkL1HKM7y/DvXkJx8nRU9DPyoSPrkhCM/dwRtaSZ
         s1GhRc7SnhJUotnCdh/kuTzQhMGU6pk0jS/BNzbf85ejOD76uYFusqdlGdGxGeY85/0o
         rBU2G2bb2KwnqgYuoTL3dDVVynnfEGX71eyXPNe+3RxkzCwBV6ZwRN9HbjPf0zjLJx/b
         MjdAv0lunf538yicJI9zzfdQPMiXM5XKNeCqX0xa919qAL0+Uo0PkBCxVxmCuqVCJi9I
         YjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709882565; x=1710487365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzwes1IMpSwrJGU0iblGbLnj1fbRwrcWBJBUSbaJb6k=;
        b=qlzqf6cTmYNQAIMuBTEC2mYY/esP2VSBvm+N619sAAguy4W/xFON3iIx5zSvQboEzz
         8WxOpwXyftBxhAaIqBTipwiRJQoECH74mh9mVa03hCmitJlJnalrcaj2qyblu5gmhPJw
         gkGcHR1jQvYrLA5kXYUOMInXv84xJsw5Ndc5mDmG2QbLrzaCc7lvfHmntMcoCZUxnf59
         DEcxxTOsMNJkG3KszuT1Y11pQNuFcktYUdI6xI2dcAhGKWyalXreI5SFG9guPGBEywJW
         pwQLR2nWXoqAXfdYZgXGSDHSABT4EIiSO6RUivm7TRlNE7lDO8HlyYpB0Mr3nx6a7XU/
         TovQ==
X-Gm-Message-State: AOJu0Yzioq0YhTUybgIUrF89DCgF378X+YlQxJDMNNuHOp48kFBOEKyr
	H81KIGBQJrqBNqfAtE/NkXPl9npUXqkpLBgXnlWwA/Zo/PAyer4J37kTaeOa
X-Google-Smtp-Source: AGHT+IH7VwLzn4HOz0aTR6LjXgHsORo9UO+FlSZBLVAMKqaGifCSatrt9HkiWaay4FHonxwzm1UX1w==
X-Received: by 2002:a17:906:f184:b0:a44:1db8:d37a with SMTP id gs4-20020a170906f18400b00a441db8d37amr2442062ejb.32.1709882564977;
        Thu, 07 Mar 2024 23:22:44 -0800 (PST)
Received: from localhost.localdomain (84-107-6-196.cable.dynamic.v4.ziggo.nl. [84.107.6.196])
        by smtp.gmail.com with ESMTPSA id va8-20020a17090711c800b00a45ed8ae166sm340292ejb.190.2024.03.07.23.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 23:22:44 -0800 (PST)
From: Andre Paiusco <andre.paiusco@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>,
	Andre Paiusco <andre.paiusco@gmail.com>
Subject: [PATCH v5] ydotool: Add new package
Date: Fri,  8 Mar 2024 08:22:43 +0100
Message-ID: <20240308072243.106658-1-andre.paiusco@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 07:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109225

Reviewed-by: Khem Raj <raj.khem@gmail.com>
Reviewed-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Andre Paiusco <andre.paiusco@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb      |  1 +
 .../recipes-graphics/ydotool/ydotool_git.bb    | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
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
index 000000000..de515e398
--- /dev/null
+++ b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Generic Linux command-line automation tool (no X!)"
+DESCRIPTION = "ydotool is not limited to Wayland. You can use it on anything as long as it accepts keyboard/mouse/whatever input."
+LICENSE = "AGPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eb1e647870add0502f8f010b19de32af"
+
+PV = "1.0.4+git"
+
+SRC_URI = "git://github.com/ReimuNotMoe/ydotool;protocol=https;branch=master"
+SRCREV = "c07ae72be46c40912023b91b8ba737630d8720e1"
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


