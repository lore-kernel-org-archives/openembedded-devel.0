Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D35D1266E
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 20:44:12 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3465.1764708250926622043
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 12:44:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pc209Ae8;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so43226645e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 12:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764708249; x=1765313049; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ERTI4RpmoMeyyxG3pAtq/PXMygMevBAcj5MiXbamqNc=;
        b=Pc209Ae8qGI5YtiYyqduahClR31sasENoyX36JLL9atwB3uaNYUy7LTGEmRnn8eDMU
         W0VPHK0sGGRBCDr9o4VptyuwkEqQxBQ2Om1kNCIc/1d1g5YPj3YalIJxN2r8QOAcO7F8
         P6+ZDvhRp1F8d0ckBIGPM+wmrQ6UmpdEbVHamfrswExcVhIcXaUNfT1GYpts1eO0NHUo
         EkBewLdyGUjwxhX525TElC9Ge12yJEteABUYTT4aL2ACPD7bp3sPJc1FHCOEbu6PhbYH
         x5PIAH8RSC+gA6vpNPKvIMmEm1fYlICF13kYu3m2VyeMbazQei0StKGxpqsjDUvjA8G6
         OF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764708249; x=1765313049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ERTI4RpmoMeyyxG3pAtq/PXMygMevBAcj5MiXbamqNc=;
        b=RrPagnnUMGyBElX4HP0tucVf8RgCltsNklfWTJTgcwCJIauOhj9S+lsDiGToUQigXm
         b2tdDMYEyROWRXFy2q1K9eWrjliZe7mXf2qgwZx9t8WrGLK+OUifNtd7Fgep/L+XweF1
         768mAOerqqEd2pNcyO1qfN8Cqt+cz8VE2JukS6CFgZzKOEia0Ou8PTiTmlROwOUeTqCw
         vdtZ1KXji63IxaXuFRCfXbUApJd5pVrh4CVFk45+qdWl04oWmOb3Q3i7j9utK205nLpT
         3+o6D1LCh60TspMmDYqAUQw0IjOj5tpPQwu22FGx/jGFNqTXP1HcRaFHMiCrYwYPli/B
         0uRQ==
X-Gm-Message-State: AOJu0Yxd3vJSyyIhPQQd9I+4tQxaTxYZMw2va1N8EI2ZjLF9oElnfR1I
	dxG0Ln/PglXN8xHdfFQJl2WWGbuArbm1lKbXGDKcT0Nmv/zqqJRy5+dkhH7L8g==
X-Gm-Gg: ASbGncsbldGuCbiDluhlfbaBxG1H4rUAx1J5nKJzkn6RgAyXA6ZcA5gQP3tQDZ5Uh9O
	5jqIgZ2B5wc+c+IOr28nwTDv70iLo2bxD0/XepABFCtsJDoIaMUnFNEujSHttZhOzlljD9lwrC8
	8r6WT3H939GP3zUDBy6pv4geeSJYpbcxnGm+psIpqeCDCLzxgltyIKdgLUcyT0QGTqAu4Q1yQed
	u3+NMbwNz/7/JW0wFf9rOHIBnMxpXhbl8XGqakcL6Brx54t6/PHAtBQKeEF+foQOhDC1kKSNNCT
	h9sJf9Tx725cpE2ieSsEdmKNkt7N8HoH5/Cv5A1Jfg7LXoenTCEeqq18UA+hYiU19X4mHDv3P/l
	9MUrhgeRP0sW65jd8ZvO6eUZGadByx2XNxOAtG0f4Qv1wg3ILrzJ8QoXRysBhB2XRJb8cBiFBXE
	Kg65nGCZgc
X-Google-Smtp-Source: AGHT+IHKtOL5vw1aWbqgau70cgHT1VTCftH1/giUu6sj/2szZio1LBoPW89vM/atXb9oWR25lxjmzA==
X-Received: by 2002:a05:600c:1546:b0:475:e007:baf1 with SMTP id 5b1f17b1804b1-4792a61e69amr8722815e9.34.1764708249134;
        Tue, 02 Dec 2025 12:44:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a7971c7sm8383295e9.2.2025.12.02.12.44.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 12:44:08 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/6] gssdp: add ptest support
Date: Tue,  2 Dec 2025 21:44:03 +0100
Message-ID: <20251202204407.3755450-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251202204407.3755450-1-skandigraun@gmail.com>
References: <20251202204407.3755450-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 20:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122267

It is quick, it finished under 20 seconds on my machine.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
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

