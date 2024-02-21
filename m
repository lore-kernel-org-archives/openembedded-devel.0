Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4910EC48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 16:21:08 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.17347.1708532462130910397
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 08:21:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jiRSOUy0;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-299dba8fd24so1577953a91.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 08:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708532461; x=1709137261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbNHfcQW7eBtEc/6k5I7OtVq5MGI//UmhONCTY2pWz0=;
        b=jiRSOUy0NFKOWhtkF+uDo8aP0v6+mPnhiVOdSy7htMK2YP0dlHzyjCNjX0ebpg03Px
         JqIVIzWzyFVpCRyJjQ+NepFjULKoF3gDoAhFevGb2XNPqc4dRKTIIog243wmwJz1f6Al
         9xU7eocIMR7qv3TAqfeksBZUAm9PDqFExQF/spEHLsjzdCx1pwsxYODQQeezpViDD1Tu
         +Olmbe4KgTjb2tw7dIanjHwifqFawryBTaHOJb+JTbHbiFueYjTNSm08qJ9Cpq6BsuRr
         ROWo5Wucis0tdPW4d6YmqzKb3waIzu4o6osfUPgB/IH++J/3S10N3jhrjcoC7G808V65
         OQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708532461; x=1709137261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbNHfcQW7eBtEc/6k5I7OtVq5MGI//UmhONCTY2pWz0=;
        b=MIEdBU9xIHJD+6lgn0ha7O4fFElSxsUMWlnFp2VoG3CdAOrqqp9Lcp1Djx3fon9KGP
         tiuZTTVo85uXsoMHq/e7hLURLiXdNt+RLL/ldwipgxj4/1ZIUL++PwDrK6uZ+bOqhc5L
         fClK0z2pndtaiKg8yhxDwp5CNPcArkHO1qoHBVPrcdVa3zh61hTWRzeB6WZHSa0mgNHx
         4VTAbAEoFpvYAG88eq1vmb0t/hwlurhW//Yd2JbI24GxeVu9M5XuXgS5RtpTw+aRzMRd
         m74Bzut4nEkTsSUMoFHaPCbfvqsgiwG8VdX1idNXEdsHLQRfIvGr266x4rF4DQnOhM+n
         iQNw==
X-Gm-Message-State: AOJu0YyZjj1YOKddmoYtudRdsY5DwqxAPsbVcJrR1gif2s4UMon1HEFK
	yoi48E1cZEOBT29vATS2apMiVcCAqvEvvEoznKQHFplGv6QFMS/L+0dOf+h8v9k=
X-Google-Smtp-Source: AGHT+IHPXjw0mBptQOY9l3ff89fULfmI9GC3W7dvyKbr+agVuAtz66va7rHJyADJ+n9ixEWqInITQA==
X-Received: by 2002:a17:90b:4b44:b0:29a:377e:c393 with SMTP id mi4-20020a17090b4b4400b0029a377ec393mr527371pjb.4.1708532461150;
        Wed, 21 Feb 2024 08:21:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::67c2])
        by smtp.gmail.com with ESMTPSA id nv13-20020a17090b1b4d00b00298e639d17esm9753550pjb.22.2024.02.21.08.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 08:21:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/4] snort3: Fix contains reference to TMPDIR [buildpaths] warnings
Date: Wed, 21 Feb 2024 08:20:57 -0800
Message-ID: <20240221162057.4154660-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240221162057.4154660-1-raj.khem@gmail.com>
References: <20240221162057.4154660-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 16:21:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108967

Fixes
WARNING: snort3-3+git-r0 do_package_qa: QA Issue: File /usr/lib/pkgconfig/snort.pc in package snort3-dev contains reference to TMPDIR [buildpaths]
WARNING: snort3-3+git-r0 do_package_qa: QA Issue: File /usr/src/debug/snort3/3+git/src/js_norm/pdf_tokenizer.cc in package snort3-src contains reference to TMPDIR
File /usr/src/debug/snort3/3+git/src/js_norm/js_tokenizer.cc in package snort3-src contains reference to TMPDIR [buildpaths]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-cmake-Pass-noline-flag-to-flex.patch | 31 +++++++++++++++++++
 .../recipes-connectivity/snort/snort3_git.bb  |  9 ++++--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/snort/snort3/0001-cmake-Pass-noline-flag-to-flex.patch

diff --git a/meta-networking/recipes-connectivity/snort/snort3/0001-cmake-Pass-noline-flag-to-flex.patch b/meta-networking/recipes-connectivity/snort/snort3/0001-cmake-Pass-noline-flag-to-flex.patch
new file mode 100644
index 0000000000..ec7b90cfb4
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort3/0001-cmake-Pass-noline-flag-to-flex.patch
@@ -0,0 +1,31 @@
+From 417ed0045b3d04f539a8eb18b07a208c75f6c7e1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 20 Feb 2024 16:08:20 -0800
+Subject: [PATCH] cmake: Pass --noline flag to flex
+
+This ensures that line directive is not emitted into lexer output which
+could be absolute build paths, since these files end up in dbg packages
+this can be flagged as a build/packaging warning.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cmake/configure_options.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cmake/configure_options.cmake b/cmake/configure_options.cmake
+index f3673f399..fbd0bd2c3 100644
+--- a/cmake/configure_options.cmake
++++ b/cmake/configure_options.cmake
+@@ -28,7 +28,7 @@ if ( ENABLE_LARGE_PCAP )
+ endif ( ENABLE_LARGE_PCAP )
+ 
+ # Flex Lexer
+-set ( FLEX_FLAGS "-Ca" )
++set ( FLEX_FLAGS "-Ca --noline" )
+ 
+ # documentation
+ 
+-- 
+2.43.2
+
diff --git a/meta-networking/recipes-connectivity/snort/snort3_git.bb b/meta-networking/recipes-connectivity/snort/snort3_git.bb
index 0f4a86f61e..4bc2395fae 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_git.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_git.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
 
 PV = "3+git${SRCPV}"
 
-DEPENDS = "flex hwloc libdaq libdnet libpcap libpcre libtirpc libunwind luajit zlib"
+DEPENDS = "flex-native hwloc libdaq libdnet libpcap libpcre libtirpc libunwind luajit zlib"
 
 SRC_URI = "git://github.com/snort3/snort3.git;protocol=https;branch=master \
-           file://0001-cmake-Check-for-HP-libunwind.patch"
+           file://0001-cmake-Check-for-HP-libunwind.patch \
+           file://0001-cmake-Pass-noline-flag-to-flex.patch"
 SRCREV = "e1760a8dbb829bb3fcf1a340ab6cc4bb80a47ecd"
 
 S = "${WORKDIR}/git"
@@ -19,6 +20,10 @@ PACKAGES =+ "${PN}-scripts"
 
 inherit cmake pkgconfig
 
+do_install:append() {
+    sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/pkgconfig/snort.pc
+}
+
 FILES:${PN} += "${libdir}/snort/daq/*.so"
 
 FILES:${PN}-scripts = "${bindir}/appid_detector_builder.sh"
-- 
2.43.2


