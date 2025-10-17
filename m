Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A35CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 20:37:53 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.3149.1760733469234512015
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 13:37:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CSoC//W9;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4710683a644so21657335e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 13:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760733467; x=1761338267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aZyq4kf1MwaPgx3Eku1+lxoZArcjgXSZjTRTz4Gnfa0=;
        b=CSoC//W9nKB8JF10X1/Xv/H+CGKxTusDUe85iTg+4y4zRynOTtbBCzkGxCnm3PS30p
         PTaVtmE/UE2Fiqjjtjg18DSl9FIYHxVYNfDvNXMIuvgTwRT7tXPqVVqR61XzwhpmuMTJ
         GRiqXm/vYjf5ZBXDJH5T4J1zbB8FJKcM2zo3+U/ql1wDOlEu5f8vij+2NXtUzi7xKdrh
         s9gmc+F/LOIlNcZNuy8DvZxYmUSuELFKMsjsnksgR2d76RL+hvpf16CgC4lWh6blVdkR
         rpKGzaXFNSbs5PGUbmlBvvXSH9w8en1WmgyndgGWfptUoyvrN/F2BzoI6c8pvIJgUQTx
         FxSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733467; x=1761338267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aZyq4kf1MwaPgx3Eku1+lxoZArcjgXSZjTRTz4Gnfa0=;
        b=CeI3j4EpQEsCTgt0pCdsWwDR/1Ov+ifVuM4PNSCjV3GiLJVCfYQzDkkPFeoG37kULi
         kDjI+RiAE3uCZWuqkrkaPGKqpzv2CvSZ7m6tAf+O8S/44iCMvJbDBxiMPBP/zl4vi3IP
         GnXczjYnpwkM1BpM0VdVAGW/nr5SRUavlhvlAwuKJnRYjm39CmewSiQlDzcy7Jw/As9z
         nFVHv5P/Jc4DbN8pUyomco6oQKR81AfvyiZ78raF3XZcsoF8Y+UYyXMIe3c1PiV9+MmE
         bvv8cocdHfIY0wi0Mf3ZYW+xnqZCsz5k/MK4rsyoj7UotTaiCymLs5ChPSjhvGzsPX1C
         a5Rw==
X-Gm-Message-State: AOJu0YxX1JFtWGiagO1QzL3nQFntbdmpw8uDAujtb8kMNSEkK22vWqsS
	nmUQHD080yEjvQDBvE1mjozp7il4EUHbELwfGy+Pz/niKTtfYS5YPgbMsW4Ctw==
X-Gm-Gg: ASbGnctrj3xbI9J1sHTpamdq2itxaDdVwd5SzmwvzAjh9WFAkX9ctC5n+RrV5iIxK3v
	9Mw3j9S6WSwh2AAGbbjhG5ZfpnJ6abEE+eYIFiU9Fx7snNY2w5lP6Met2CE4XCnyeYCjtZqQ9/a
	TQzJlnc1xijpRvShf7rkjNMMmgvORuJKMYpb10oyA8mLraN6cv8X+SWpu86YDstzkB2j1U8PZOH
	EzYZ765V4UL3dMHfK0DHZq6SXEyTHotYvX0RFDxifs9qhug5rcNHjXt0vl5OKISd53AasriJ1AQ
	wfQ+KQsQTK4bqz+mOB9hHxthgNlNK8U7wQpq+OzLw7t6k6fE+rJVlZ89JfctGzcjsHQzN2g/3vn
	WV389slluWtoNm9AoBOUvoPuUT40TtQzNGO0dQHTslXE8Fh09w6dmPnU713cVDN9RJRdwF0P9Ux
	Otl1XauZHK
X-Google-Smtp-Source: AGHT+IG9BGrtkIhu+tJsLu5zFhaVal5nLIJQDUx7w9NrewKL9iSxyWVpIIaUOAKMn7/zyu7hSvsJNg==
X-Received: by 2002:a05:600c:4e49:b0:46e:1a60:c995 with SMTP id 5b1f17b1804b1-4711721a463mr44065665e9.2.1760733467265;
        Fri, 17 Oct 2025 13:37:47 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710ed9e7d7sm57425425e9.3.2025.10.17.13.37.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 13:37:46 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] libmanette: fix ptests
Date: Fri, 17 Oct 2025 22:37:46 +0200
Message-ID: <20251017203746.3042722-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 20:37:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120778

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
 meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb |  7 +++++--
 2 files changed, 15 insertions(+), 2 deletions(-)
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
diff --git a/meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb b/meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb
index 5509b0bb09..4375e4db9a 100644
--- a/meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb
+++ b/meta-oe/recipes-support/libmanette/libmanette_0.2.6.bb
@@ -7,10 +7,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "libevdev libgudev"
 
-SRC_URI = "https://download.gnome.org/sources/libmanette/0.2/libmanette-${PV}.tar.xz"
+SRC_URI = "https://download.gnome.org/sources/libmanette/0.2/libmanette-${PV}.tar.xz \
+           file://run-ptest"
 SRC_URI[sha256sum] = "63653259a821ec7d90d681e52e757e2219d462828c9d74b056a5f53267636bac"
 
 inherit meson pkgconfig gobject-introspection ptest vala
 
-FILES:${PN}-ptest =+ "${bindir}/manette-test"
 FILES:${PN}-dev =+ "${libdir}/girepository-1.0"
+FILES:${PN}-ptest += "${libexecdir}/installed-tests"
+
+EXTRA_OEMESON += "${@bb.utils.contains('PTEST_ENABLED', '1', '-Dinstall-tests=true', '', d)}"

