Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E17DD37492
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 19:46:22 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2153.1764963972154839579
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Dec 2025 11:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q7JGmyYu;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so1623446f8f.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 11:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764963970; x=1765568770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9003BHBkoe1mkXAA5OSM56q8qNI98ZN5giKGTesX5NU=;
        b=Q7JGmyYuAmySHXJKNIavgAVAiAffJMnyVLdKHOlv8lZFjKp0IVZUtd8kCCS/ay8n8r
         4Q7LNM1hWtuh6238GdS0U81zE9aAaw3q0I8EUTu55HefsFRcdJWnt+ipW5kCYCUEkCWs
         miH+VEIIC/GN/RBdXZme9tjEINpf6f+lklZLIFTssHvIaMcNdTmUZitW5ik7YV0UShIL
         oMzhNJ9Uu7UgH9thvDXAcKk8rzTLl1NkPy26vU/8RoyJTQcvPUPwt7IFBwp3o9YriMt7
         cxkXKq1+QnkL5wfc4sYz41GGqSlHlFKosMTY6PfulHj4Har2DQgVpc7RzYgZtDMUwT7/
         s6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764963970; x=1765568770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9003BHBkoe1mkXAA5OSM56q8qNI98ZN5giKGTesX5NU=;
        b=IpLOeKFSYL+6V/ig1F79O9LHjtorDua24mUBA6m13eJFmJNAGUc+utmx9EX+fWzrAE
         fexBZh60YiwoXt3a1EGmMfio9MKc5R2AqvGlPmpYAxKzOcw7IFnDez7KE6EvE/ary86D
         1UZgDxzR0iBgchVD6yIT6twpT/kA96EN27bjIFW211HI/g+bg1fqzTccBkJHR18XahWG
         hgiR9SKF+mb0ONE3v1u9LbyShGwOne/uHPOEYPPLc89wX8TbZF79t4uUtn5xrMjAuWYu
         OtWWLS4izYefXNxRDUliRoYHqbl4vhJP62+2ZpKm5u07IT35caVYmnaEwvqEu6dSkglw
         +3CA==
X-Gm-Message-State: AOJu0Yz1vpu9CQJ6OLueAAdNWrP9pY6xrQKLmfEg5+z3+eUA5g4EQgRL
	VhHupmrlLAuYSiS+BJHzPmF10KBb5mXFs2BYfwTKfrH34Y7g6VwQfaXjnJN3Kw==
X-Gm-Gg: ASbGncsX8WmD5WTqyPf7JhnlOEkyzJiOZ2PYtARbn7mHH/ms7KqGLqKrLJoi3fyN7vY
	fbrNmHic4sCWEt+G0SSRZrqS6ty06uw2Ddb9OWGwCaoBUO7eNrSTxzlOibNrfiFMnbA1vBz1dta
	Y4UJQMw8fC+Cw25MNuy1IOYd2sH/n+qNEtR3SaOIBaLnfe0tEy4+waXDMIykjzTFJyuJaJ8VvKw
	tUqftjMsxHHVwXm1fOMMAxy/zUXNgkUBWQ69MpuY4IuD8XoqkpzkQITdTyqOd0Y106OFGfwjVx2
	/GQJxuGwwSKyECV6SUGBcQ3+qNkOliMG6FUeOFut61s4I1PJS6UHhdKhycFNySSL32/lbN/r6xV
	sgzRYjfYIu/l7clnyX5nL0Uv75T2mj3Nup29hq5Lgk3z/mlCthCOF0fI3dyQnRc0sNhheai3ra/
	jw/HIhI2HH
X-Google-Smtp-Source: AGHT+IH0C8MBKCXv4dk0UU1RFBZymOWBmXDQpT5A8ObElvaHeIRRw7vnZHfgHJUCInOIKYZ6a6E1wg==
X-Received: by 2002:a05:6000:4008:b0:42b:4951:8af3 with SMTP id ffacd0b85a97d-42f89f53b18mr304253f8f.43.1764963970188;
        Fri, 05 Dec 2025 11:46:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbfeadesm10435614f8f.10.2025.12.05.11.46.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 11:46:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 1/3] gupnp-igd: add ptest support
Date: Fri,  5 Dec 2025 20:46:07 +0100
Message-ID: <20251205194609.1546800-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Dec 2025 19:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122358

Execution takes around 10 seconds.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../include/ptest-packagelists-meta-multimedia.inc  |  1 +
 .../recipes-connectivity/gupnp/gupnp-igd/run-ptest  | 13 +++++++++++++
 .../recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb   |  8 +++++++-
 3 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/run-ptest

diff --git a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
index ec10edfb83..eb8d4ffe89 100644
--- a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
+++ b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
@@ -9,6 +9,7 @@
 PTESTS_FAST_META_MULTIMEDIA = "\
     gssdp \
     gupnp-av \
+    gupnp-igd \
     libopenmpt\
 "
 
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/run-ptest b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/run-ptest
new file mode 100644
index 0000000000..05aa2a9b3a
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd/run-ptest
@@ -0,0 +1,13 @@
+#!/bin/sh
+RET=0
+
+cd test
+for t in $(find . -type f -executable); do
+    if ./$t; then
+        echo PASS: $t
+    else
+        echo FAIL: $t
+        RET=1
+    fi
+done
+exit $RET
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb
index d8dbc262cd..f6cbb82352 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_1.6.0.bb
@@ -5,8 +5,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 
 DEPENDS = "glib-2.0 gssdp gupnp"
 
-inherit gnomebase pkgconfig gtk-doc gobject-introspection
+inherit gnomebase pkgconfig gtk-doc gobject-introspection ptest
 
+SRC_URI += "file://run-ptest"
 SRC_URI[archive.sha256sum] = "4099978339ab22126d4968f2a332b6d094fc44c78797860781f1fc2f11771b74"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
+
+do_install_ptest(){
+    find ${B}/tests/gtest -type f -executable -exec install -D {} ${D}${PTEST_PATH}/test/$(basename {}) \;
+    install -m 0644 ${S}/tests/gtest/*.xml ${D}${PTEST_PATH}/test/
+}

