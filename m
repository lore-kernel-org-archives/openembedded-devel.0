Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71056C3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 23:23:03 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.215.1746832973228389170
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 May 2025 16:22:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K9PXVahW;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22e4db05fe8so27383325ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 May 2025 16:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746832972; x=1747437772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJK1FJsB9pJDshGkuRkCKh3/TD3tZccqDjMKyUXS6kg=;
        b=K9PXVahW55d+eVv7IQKbhY/36jNmTZ8rHmc/4AnQ6u+bVO26vXKXHLHjL17dKmwpXG
         dF2WyEYYkb/ydEvajh/X/28PLdm4EAIB2EYvlpnqMTYgztjjNGoQKqy4cPmdqhzgmeBo
         zYJtPOEguNtAmVZZXf52m46mlyMrK8mxGY5f0tVvSAlxspwhK1rIUfxSjXCeyYLyCXf0
         K9c4arKJ9kVNu1pT8RWHDcY8EOmlnfRFIXtJDGreCPQIu+7RFOmqAU1w/3A0i3NZKD76
         UQL/tRd3014o+gduSNKsUin7Bo64qO3sm9sQxl41Xw/lHTQDz7ernwWe4WWvkE4ogtPL
         F1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746832972; x=1747437772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJK1FJsB9pJDshGkuRkCKh3/TD3tZccqDjMKyUXS6kg=;
        b=n2JpIfB5mJFFqM4oYoMInTAeXscLeYXoAkSFrXLhYXN88xXHArH/WIChBYZVvKQgn5
         RzH0gQFEFf7QOFzoI5qD9E1vArNXL8Iq7uyyihmt+o1RoiI32d52bDxrZ8EXNZFPkb8o
         pXYZsS7L6QUx/HfTzwmH/TBi/N3uTRgjHNvKSct9hJBBGdRvVX4LrXTITP5LHmXM3RiB
         Vb3LPS/obW6vMe3ax6Bp4HYH0uSgILIGla8c6lWg0WnbCRTE18b5ZoGWZxAV8W5WNvns
         k/H/U9kmCKDpbJKrVAY/6zPBX9CF5JsHOEZ3RK+4J/uBnXLhYZSGT0w7lDmXjIAaHLKn
         V67w==
X-Gm-Message-State: AOJu0Yymtdl8hqiPrBduodPEGuN2ck0IvskSVz6enuUMFOs0HjOqtXS9
	pqp4/say898fA3WWx/xpK5xSA6T7att/c/mFNNex+p+i8ExjGsDUkSe7KdKK
X-Gm-Gg: ASbGncsv0F5vzPr36WbtL7Bs6bUvJhZQWqELweIBnuRKEdaZb4pQVaUiU+TNOrYVcv9
	i/DTDbKcrzdG9g//mBf1pfH7h0gIe2/Zv46oD+XpvKjIA76OMz41mOueGAZIJ2WM7Vk/BGDryC+
	96kezGneyOga24SjdEldLcpccdqD62iZHFww5HH0Jb/Ds/nAHQb6qg5spb+W+dk2XNeycjHKYt4
	2+wF4PmxO0F3PX4vZ8sNG+DIpPv6YUJu9Lrtv0inGF1zDlOJG+vXcY9gtECAWHGIGsDYVRixgkX
	DclO0aquvhxxArtj2U5z5WqdSoi7rI8UYPikeAUdWyU=
X-Google-Smtp-Source: AGHT+IHEWipQCfbHirE61v0tY4qRP2PsXTBEhcDuip8TW/otoxGRdi2VeRM9TW55qXLrILpYV0YCZg==
X-Received: by 2002:a17:902:ec90:b0:224:1eab:97b2 with SMTP id d9443c01a7336-22fc91ab45fmr82629985ad.53.1746832972315;
        Fri, 09 May 2025 16:22:52 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::efc5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271d98sm22535945ad.154.2025.05.09.16.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 16:22:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH] cockpit: Fix a build race generating fail-html.c
Date: Fri,  9 May 2025 16:22:49 -0700
Message-ID: <20250509232249.616767-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 May 2025 23:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117377

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-webadmin/cockpit/cockpit_337.bb   |  1 +
 ...am-Create-src-common-directory-befor.patch | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-webserver/recipes-webadmin/cockpit/files/0001-Makefile-common.am-Create-src-common-directory-befor.patch

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
index b456fe1951..986a924fb5 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_337.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SRC_URI += " \
     https://github.com/cockpit-project/cockpit/releases/download/${PV}/cockpit-${PV}.tar.xz \
     file://0001-Warn-not-error-if-xsltproc-is-not-found.patch \
+    file://0001-Makefile-common.am-Create-src-common-directory-befor.patch \
     file://cockpit.pam \
     "
 SRC_URI[sha256sum] = "df51ef5920fae69e1b435f657376aa93772c0c1720b954a3bac10ebba26bfedf"
diff --git a/meta-webserver/recipes-webadmin/cockpit/files/0001-Makefile-common.am-Create-src-common-directory-befor.patch b/meta-webserver/recipes-webadmin/cockpit/files/0001-Makefile-common.am-Create-src-common-directory-befor.patch
new file mode 100644
index 0000000000..36cb6c09c7
--- /dev/null
+++ b/meta-webserver/recipes-webadmin/cockpit/files/0001-Makefile-common.am-Create-src-common-directory-befor.patch
@@ -0,0 +1,34 @@
+From fb3b427bcbc17257ac8c38438a82435b2bd36e38 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 9 May 2025 16:17:05 -0700
+Subject: [PATCH] Makefile-common.am: Create src/common directory before
+ generating fail-html.c
+
+During parallel builds, its possible that <build>/src/common directory is
+not yet created and this codepath to generate fail-html.c is executed and
+it will end in build failures
+
+Fixes
+ make[1]: Entering directory 'build/tmp/work/riscv64-yoe-linux/cockpit/337/build'
+   ../cockpit-337/tools/escape-to-c cockpit_webresponse_fail_html_text < ../cockpit-337/src/common/fail.html > src/common/fail-html.c.tmp && mv src/common/fail-html.c.tmp src/common/fail-html.c
+ /bin/bash: src/common/fail-html.c.tmp: No such file or directory
+ make[1]: *** [Makefile:6044: src/common/fail-html.c] Error 1
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/common/Makefile-common.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/common/Makefile-common.am b/src/common/Makefile-common.am
+index ec4b30d..1d55576 100644
+--- a/src/common/Makefile-common.am
++++ b/src/common/Makefile-common.am
+@@ -94,6 +94,7 @@ libcockpit_common_a_SOURCES = \
+ # libcockpit-common.a static-links an HTML template to use on failures
+ nodist_libcockpit_common_a_SOURCES = src/common/fail-html.c
+ src/common/fail-html.c: src/common/fail.html
++	$(MKDIR_P) $(dir $@)
+ 	$(AM_V_GEN) $(top_srcdir)/tools/escape-to-c cockpit_webresponse_fail_html_text < $< > $@.tmp && mv $@.tmp $@
+ CLEANFILES += src/common/fail-html.c
+ EXTRA_DIST += src/common/fail.html

