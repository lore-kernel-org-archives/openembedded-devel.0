Return-Path: <andre.paiusco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3343EC54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 16:28:41 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.27814.1709828914948288364
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 08:28:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S5Xr40H6;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: andre.paiusco@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-563d32ee33aso1292410a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 08:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709828912; x=1710433712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Ru8lM1fKG8Vzjb8HFqztsbSpZ3UczgFFzDdgAwL/qk=;
        b=S5Xr40H6W2SL98FIKVcAhhbpTWnkKRwbEu3dhd42SoDPxMhgfDGQOPDRVgLPt6OiG6
         YGvzc3E09ndtvhvJ4qiH1JqzwHu0MK+tEKRuRkimzzajJ177Xy48sLlU09JY37BEvb/I
         wRa/5kOnauMlWtTA+anSSFPcGTKeH5pR0fYsByAVgVliBZ/U1LG3uey0NT0lN2zL/fDb
         0n/vK0zCmiVVYQh+rS7CpBpJD8RVk5pGI9r5RH1QacPAcZqpc4zlLSMyHn3Az+UKeZgF
         zlfVIxnpaMiGr9Hvp0cuFXBC86Sw+Q7iONuz2nb6kb0jhf5y807FwUiVrSBMZDwOCc+S
         Q50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709828912; x=1710433712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Ru8lM1fKG8Vzjb8HFqztsbSpZ3UczgFFzDdgAwL/qk=;
        b=hWMWYbtDEo8KQ+I0yCNrWpDRvZDTQbVn9aPbNnW5RYodI2OYrvP8y+aqSqx+u9OUaB
         QVzc6U7kL3/ycG5+0cmqza0COUNKz+6qSNFLlDRpfuXrr4hSzrQABH1nFPhBJWuZrHwv
         IWwmAeDQQVb3dE3sjV/eydmiPyWMD/b0YXI9YD1kPdeb0p0Zs6AtZLLXfLC0/LTTftbR
         Vm/l3bgtbM68ZTOXtsMPtMRQlX84R6+VOhZifwXy0+rGVQVmFHUzMMCX8C3IMh1RlxQy
         DAGEJP2XovKmJmkhtqH9tJ0CTN7k0m82uUYGOX25A6GjM1c77VB+J3/9SCgJZNtZvetw
         37ig==
X-Gm-Message-State: AOJu0YzD+itl5077ELtaxgNLF4ngI81SfsK1n2TRuF6AED5WP+QgDHJU
	HcteUdvNH6BsB6JV9q8HQhjy6ycfw3DjUau3E8ItBckfVFsUho86zUD8Khx5
X-Google-Smtp-Source: AGHT+IH+PIPBQt+ctTDT5atfY9G+PpWlqLq9NCtveN/lWFM/3qs8512ZU9fAvipsIMNfkJv2NKn6Vw==
X-Received: by 2002:a05:6402:2226:b0:568:1444:a828 with SMTP id cr6-20020a056402222600b005681444a828mr177161edb.37.1709828912382;
        Thu, 07 Mar 2024 08:28:32 -0800 (PST)
Received: from localhost.localdomain (84-107-6-196.cable.dynamic.v4.ziggo.nl. [84.107.6.196])
        by smtp.gmail.com with ESMTPSA id y6-20020a056402358600b005645961ad39sm8094464edc.47.2024.03.07.08.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 08:28:32 -0800 (PST)
From: Andre Paiusco <andre.paiusco@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andre Paiusco <andre.paiusco@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ydotool: Add new package
Date: Thu,  7 Mar 2024 17:27:13 +0100
Message-ID: <20240307162712.9329-3-andre.paiusco@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307162712.9329-2-andre.paiusco@gmail.com>
References: <20240307162712.9329-2-andre.paiusco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 16:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109202

CC: Khem Raj <raj.khem@gmail.com>
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
index 000000000..928f5f79b
--- /dev/null
+++ b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
@@ -0,0 +1,18 @@
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
+inherit cmake systemd pkgconfig
+
+EXTRA_OECMAKE = "\
+    -DBUILD_DOCS=OFF \
+"
+
+SYSTEMD_SERVICE:${PN} = "ydotoold.service
\ No newline at end of file
-- 
2.44.0


