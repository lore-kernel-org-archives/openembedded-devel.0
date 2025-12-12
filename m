Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB86D4337C
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 08:02:12 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8286.1765526528856588235
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 00:02:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ci2T5z5h;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7f651586be1so221484b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 00:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765526528; x=1766131328; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fn1kCM9E9QOqvyksb5FOiSHU1flU/zq3QS1mJev/Gfo=;
        b=ci2T5z5h3fW6tvkOrar+nuqDCWn90qECPxWFXtCfrcGB8j9B8Zpnmk6Ps1NbJrhafS
         2pUp8xGAidRkc1QVREU42yoPTg8TjswUiIRBlPwIX+wgNezUGGoKj+2IHuujhpvuVaSk
         XR/DswugqyVwISSMJFKSYsYi3tTW15VY+2ZKrNXaEaAR1k8MyNf+T4iNcAk+uTrkezBo
         7vm7d3JUHIQlOUAVb9lhaNY+RdcLELij/xlZiyr439fDRq6hH4lOMd1N/C5tBj06K7dJ
         Yd4Ay9izODCXSBXFafkK/8/ORVtqVdVM0CVlLFsfStvkRC+w09u5elCiUatVoF2gG1LT
         7qnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765526528; x=1766131328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fn1kCM9E9QOqvyksb5FOiSHU1flU/zq3QS1mJev/Gfo=;
        b=kvV0EW8/yGAJGkQ9E/aLnkU8Uf0glrdemTz9EFYIGEysdzLnDp6dhYweVb79cNsaYZ
         rLrRv5uLs/tgZWNBRPT5SFFmcxxhmUnY5oSt8NEkrWVS6QZiEly49z4qsHBtcErl2Mm4
         Ijc3Grmmd5JILFYcAG+V4bHJWvgU5bLJIzB1CGDOELuhU8pcs1uuIZBrvnzGnTljXI/F
         s48MoS0AhIcgtmTOfpyl+wYoym2QjUTIkWYfXKBf/VB4thT0aX1GeRRVo5TdASXMPudl
         e9NqO9keiPhHB/1rnyygHFtYomDi/osKDF66mVJHsQ5mCZXMQQOSZJP55f7hNPt6l8Ve
         TqLw==
X-Gm-Message-State: AOJu0YxkhgGAgqG5uBRf9mXmlCkV268mg7GTmKe93JfXZ0/fZFMZudx/
	4gH0ThGd0vJkwF9NW4CIPxIkCy6CcPF4c39O2JNrISi09dPQ7LhHwAsLpjgDqg==
X-Gm-Gg: AY/fxX7lRyy8NDGUzRbGeRMPRnOK+/8oWH/uGUn4x34PJ1QT9RWKatHyAsYRBI0UpIj
	2zfSRF376qWaLbN4INtziqTsg6sFuqvCtjNoMllcN2FXdE7GPPcuzhGiIU441Uo8DtjiPewEWqW
	5CoekeGyeBanKgkY2AT2hd9ZZoHajQZnuH6nCMB1KHBID0VMjgG5Y6PkOAs4spIPoxXReG1xGke
	7WZPgss4WYBZU/SYMFmujdC0ys1nulVADrtpyu9C8V6oS+VX1y2L/hgwHHr9d42EaCXBRAuZ7BB
	XFGrfH76ZPBgatWCgZKyFdT6SidlhM5lhQVx9m4i8VM/jbfVdvmVcXmp+R8VMOBZw33QpWqwLgP
	TBLfJ2IVopfQQkuB5BhcBqdILMIhGgBOhE8L49EMe2pYmQ3Jsj5tbsf+OlXVL/GEkkPAgq2p2qK
	kJmRgL8JspoXnFqr9620hxvmE=
X-Google-Smtp-Source: AGHT+IG/Z+RhGlqpFc+D9SifSgV9KJP45cAY4Mv8V/61hWXxs7wRK92aJLsgfk4yipXX3aBy33imrA==
X-Received: by 2002:a05:6a00:808a:b0:7e8:3fcb:bc45 with SMTP id d2e1a72fcca58-7f669799a8amr1066946b3a.26.1765526527915;
        Fri, 12 Dec 2025 00:02:07 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093c4bsm4494882b3a.48.2025.12.12.00.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 00:02:06 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][whinlatter][PATCH 2/8] gssdp: add ptest support
Date: Fri, 12 Dec 2025 13:31:45 +0530
Message-ID: <20251212080151.3711461-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212080151.3711461-1-ankur.tyagi85@gmail.com>
References: <20251212080151.3711461-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 08:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122590

From: Gyorgy Sarvari <skandigraun@gmail.com>

It is quick, it finished under 20 seconds on my machine.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 27865a96d576160a0e3a0fda6b7e604f19edbc6c)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../include/ptest-packagelists-meta-multimedia.inc   |  1 +
 .../recipes-connectivity/gupnp/gssdp/run-ptest       | 12 ++++++++++++
 .../recipes-connectivity/gupnp/gssdp_1.6.4.bb        |  9 ++++++++-
 3 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp/run-ptest

diff --git a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
index be347286fb..7eb06f98ba 100644
--- a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
+++ b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
@@ -7,6 +7,7 @@
 # ptests which take less than ~30s each
 
 PTESTS_FAST_META_MULTIMEDIA = "\
+    gssdp \
     libopenmpt\
 "
 
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp/run-ptest b/meta-multimedia/recipes-connectivity/gupnp/gssdp/run-ptest
new file mode 100644
index 0000000000..71693c56b2
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+RET=0
+cd tests
+for t in *; do
+    if ./$t; then
+        echo PASS: $t
+    else
+        echo FAIL: $t
+        RET=1
+    fi
+done
+exit $RET
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb
index b601037608..94679ce28b 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.6.4.bb
@@ -6,6 +6,8 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/gssdp/-/issues"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
+inherit gnomebase pkgconfig gobject-introspection vala gi-docgen features_check ptest
+SRC_URI += "file://run-ptest"
 SRC_URI[archive.sha256sum] = "ff97fdfb7f561d3e6813b4f6a2145259e7c2eff43cc0e63f3fd031d0b6266032"
 
 DEPENDS = " \
@@ -13,7 +15,6 @@ DEPENDS = " \
     libsoup-3.0 \
 "
 
-inherit gnomebase pkgconfig gobject-introspection vala gi-docgen features_check
 
 # manpages require pandoc-native
 EXTRA_OEMESON += "-Dmanpages=false"
@@ -27,4 +28,10 @@ REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'sniffer', 'op
 
 PACKAGES =+ "gssdp-tools"
 
+do_install_ptest(){
+    install -d ${D}${PTEST_PATH}/tests
+    find ${B}/tests -type f -executable -exec install {} ${D}${PTEST_PATH}/tests \;
+}
+
 FILES:gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
+

