Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E852CCD195
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:26:03 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.2884.1760732759396652649
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:25:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gS25bJJK;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46fcf9f63b6so11641925e9.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 13:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760732758; x=1761337558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H6CUiFyIFXUQ8ImXCQPpeBGnnlEzxH/n8RcolO1FU7k=;
        b=gS25bJJKfilGa9wevn3Mr47ntkjB0fJLUfJwmBbjOgV4bAYUwZSK+jjNABISOIVycT
         /CE5xxoxZY+5yYtbFtKAaqXTgO+MJv6L5uMCw75LY1OmpxtHVaWXHmdGtDLLH2nuzmyu
         7QGil+u5eYY4HzOSS0+yvtJcB/kKEcLSy9LerCF0NUfvNumcYF26OGqareSh0GdIIfFB
         8rt7Ge8kpvI4EVnESj95flvwIAcxiFWTLXVsL+9qRRWFoYonHgiT45vFbBHLJWtiCUXn
         pbXe+1j7Vt8Q0clBAc+meXJQ9AGRIvsM8i3QD/YHEY9mKJ694tBC3xgO537RFSfmrdYi
         1I0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760732758; x=1761337558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6CUiFyIFXUQ8ImXCQPpeBGnnlEzxH/n8RcolO1FU7k=;
        b=oUtLA+47fEQjCb1GShfV+Fc79/Aexinqn3rlFdhAKoJeyS+y6/8am0bFNEREySFhJE
         cz+r1GVRFGGVi4uSIkl2ENmGDycwvRMewqX6BN5JUBezyXHzNb2gXZVyQIQZ3NoRZ94L
         DWDiDqEENj8N7rSrFxl0wML1VA/0XBEn/4pqydOuUx54cyV0Dv6Bj63seWv6Nro2A+6B
         7ioa8JnM+T56wzpNp3IFpnat09hEO4P1BUIy5Vq1k9mXhMDXXBMg1kgMd51ZF9lv4Fbr
         K00E+PU2irnFjQqRZhM+rgWPF0MwtN43Is8J2xTwJ3g6Ovdj/78lGuI0ve+VjHlQ101o
         Ti1A==
X-Gm-Message-State: AOJu0YyOO1Jb20MZGI7sTvwLY2l6V0bdyUf8zICcHVSKiKzIKXf9Oq5f
	WkRln+rLUXQJuAhoYn1O4dGPWKke/kpfd6JZAnJ7L7KHAZqL/ZMgS7g+nSMZkA==
X-Gm-Gg: ASbGncti/lPpzV3EomTspAVR4tRSTl0JtsFunx5OuAY5l3y2Dd8h/B8g2TnDmKxE8EI
	U+doe+Qg6CO2elMZ02kQCvgmMfuWtPLJ4Ou2A3uy7mXA08ul1zUFguhGMdCtkvBxozAl8Ll7Xxk
	0LWrCC0+IcVdqOpgRCiJfvTKfQzh9kFzRdqCqJqxoeusSWl18WuxOLoMD7KyRk+p1jGccVSbQUV
	ec5ZP2Icx5cfdI4VUmTwlc6lf6IgZ/Y1PuFZ2OXhfnpCNo36z+xLHTQKC/VgFuPbtlf3VRwwmRt
	b1UqkrB68Vz791CxWtBElZwLIHvR29WpAdUTvz7h3B5oX//TJYjGo6IZ+mmhkQ63/K7xDouiZPh
	fJiA0kjZTJ1b4B2+upxszDw2VZjiHNYqmmybOpQPAXHYMn30EQf1YI6DCGd05uwfh/+E8stupds
	iI7KYjgBDJ
X-Google-Smtp-Source: AGHT+IE6HfVjoEOFvOsAfZCDb1cyBQug9/4hSf7fWrh3gY7g+ZoR6sbfP+MkjiPFYP2QE22/TjkKgA==
X-Received: by 2002:a05:600c:6385:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-47117912365mr37993085e9.29.1760732757668;
        Fri, 17 Oct 2025 13:25:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce586sm1152906f8f.49.2025.10.17.13.25.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:25:57 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] libmanette: fix ptests
Date: Fri, 17 Oct 2025 22:25:55 +0200
Message-ID: <20251017202555.3027445-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017202555.3027445-1-skandigraun@gmail.com>
References: <20251017202555.3027445-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 20:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120777

The original content of the ptest package, manette-test, is a helper demo
application (like evtest), and not a test suite. Also, the recipe did not
provide a run-ptest script.

Fix it by installing the actual tests, and adding a run-ptest script.

Note that the test folder structure looks like a gnome desktop test suite
(and the application is under the gnome umbrella), however the project
doesn't provide all necessary scaffolding for gnome-desktop-test to work, so
the tests are executed directly from the run-ptest script.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-support/libmanette/libmanette/run-ptest    | 10 ++++++++++
 .../recipes-support/libmanette/libmanette_0.2.13.bb    |  8 ++++++--
 2 files changed, 16 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/libmanette/libmanette/run-ptest

diff --git a/meta-oe/recipes-support/libmanette/libmanette/run-ptest b/meta-oe/recipes-support/libmanette/libmanette/run-ptest
new file mode 100644
index 0000000000..3c937825d1
--- /dev/null
+++ b/meta-oe/recipes-support/libmanette/libmanette/run-ptest
@@ -0,0 +1,10 @@
+#!/bin/sh
+if [ -d /usr/libexec/installed-tests/manette-0.2 ]; then
+	cd /usr/libexec/installed-tests/manette-0.2
+	for t in ./*; do
+		$t && echo PASS: $t || echo FAIL: $t
+	done
+	cd -
+else
+	echo FAIL: no tests found
+fi
diff --git a/meta-oe/recipes-support/libmanette/libmanette_0.2.13.bb b/meta-oe/recipes-support/libmanette/libmanette_0.2.13.bb
index 2825b8af98..ce12760f54 100644
--- a/meta-oe/recipes-support/libmanette/libmanette_0.2.13.bb
+++ b/meta-oe/recipes-support/libmanette/libmanette_0.2.13.bb
@@ -7,10 +7,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "libevdev libgudev hidapi"
 
-SRC_URI = "https://download.gnome.org/sources/libmanette/0.2/libmanette-${PV}.tar.xz"
+SRC_URI = "https://download.gnome.org/sources/libmanette/0.2/libmanette-${PV}.tar.xz \
+           file://run-ptest"
 SRC_URI[sha256sum] = "287cc2fde0de092919366af757d85e7b3a0248eb1b395344726e97955a77d8ae"
 
 inherit meson pkgconfig gobject-introspection ptest vala
 
-FILES:${PN}-ptest =+ "${bindir}/manette-test"
 FILES:${PN}-dev =+ "${libdir}/girepository-1.0"
+FILES:${PN}-ptest += "${libexecdir}/installed-tests"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'test', '', d)}"
+PACKAGECONFIG[test] = "-Dbuild-tests=true -Dinstall-tests=true,-Dbuild-tests=false -Dinstall-tests=false"

