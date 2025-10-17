Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE90CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 19:48:13 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.2181.1760730483872942955
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 12:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=czmP34lQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4710ff3ae81so8802255e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 12:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760730482; x=1761335282; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+fk4w4KwoqVnUhW500gTAzEHjiOLBkAlRdCrB+V5d58=;
        b=czmP34lQAdGbYOmxhqLicUsfw6AycpuKaOdeKZAXGB6ken5v/alfeRLao7G7g8sS2b
         2Rvocy4M6MTJUGga1Ee7Ly6zEyy469FRmF7guu/GYhEUqr2Johb4jIAv2FZp9DOE/N8g
         R0DY585AkNO89neGMNfEt/0qQL+/r0bSVq2yh8iOZPTu39JEhIrGGagN5eN4WSOPlm9p
         rSgsoU6YO6q0xtEItwBUnApmhj/VtIwjy7WbaMeLsniCIMbieIGf7drE4ouCbQW+K8Ks
         T+RJl6bT4p8fGOVHJPqHcPhbTlrNpN57jEUt5tVvZML1jxVX5LiS2s/sNb5E6IF24xEr
         EYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760730482; x=1761335282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fk4w4KwoqVnUhW500gTAzEHjiOLBkAlRdCrB+V5d58=;
        b=psjsaIxvTtgdRbIEmqNdOR7t8IicYJ4R/v2fxRYKdB91DBMWQFsMIVNSdx1HZeJMUg
         hxW8OnYgIJf9HPK8jugZ+mLGQq5d39YCW3L3tgzkWL7yv4RIqb0EzPXJwuOFyCngHYs6
         SUlXlP7QrQbRUKb0WhfZjEmNZCIqh5VBGMvODi+aTPrT9DlV28Ms2BDX9fp6AFz1+yUJ
         xO9vyTV/6J3MpADELPTral4bqSYdpP5VxAm0lhrUzZk9SDWbPYUulvW+PRhIq4bwQrsS
         +pBJBoGEKVy51yePSMfdQqBGl2HnKcaIkdH9X6/C/936aYSz4Dixj2IzWpVlgxucfr4P
         4Qcw==
X-Gm-Message-State: AOJu0Yy7SGB/uEUWA2FfA7s6iGCSZ+ecSuDl8EPk/vrmcssC5toSygVr
	dMtkQz0UeNDPr4y4YQsr0gwqKeK4NGAQyQz4K0SHkCRtXBfL4YMcPMjVl/thzw==
X-Gm-Gg: ASbGncuBAhRu+zjI08GPD95n2nuGsG7k4xGyBELHzlIhbrGcZY1UXto0fIcfoNTf50Q
	q28hqAyNaT0/qK+oIhaWldZNkrb1LhxyDXUj+Ud6JJTBDMl0et6hKK+QJ/+mtYPgK/wLW+joQ4Y
	QT33ZzJc6A2kzqHGfea2LekZ/r3QROMHA9i8TENRfIlbibWPU6dibdhSxcWigXz7IjQwLWYwq7F
	zsZjG7OA+6CauzRlSgzjk4YJMkX/25NrXZ8VudHnlShRx7Yz0IvlL9G21d3bo+Wg3XdoVwYfBiu
	HVnfQ9iXTHvUNoxoRPKZAzi27tinHNydyALFXQDBxFEaYi0+jJYIRWHqSy8Ng2HmZ0GwrFYgnAz
	8fFPZZaXbPScFWAC67vhsK0i48V1Jy/nVPv2633cjGeZD4FgImPKQFbnI+cK6qpwomCi72B4Jog
	==
X-Google-Smtp-Source: AGHT+IFp/CEotaS5reApWT1si+BTkCUFNrw591Dbv+JWQveTJ1ZmmgbHbhYJ6WFGuqMVe8Npln/deQ==
X-Received: by 2002:a05:600c:3b8d:b0:46e:4883:27d with SMTP id 5b1f17b1804b1-4711791c8d3mr38793875e9.30.1760730481945;
        Fri, 17 Oct 2025 12:48:01 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47152959b55sm10336965e9.6.2025.10.17.12.48.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 12:48:01 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] libjcat: fix ptests
Date: Fri, 17 Oct 2025 21:48:00 +0200
Message-ID: <20251017194800.2986899-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 19:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120775

Some files are not installed with the testsuite, making it fail.

Both of these were fixed upstream, however only one patch applies cleanly.
The other is fixed with a single "install" command.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../install_missing_ptest_binary.patch        | 25 +++++++++++++++++++
 .../recipes-gnome/libjcat/libjcat_0.1.11.bb   |  5 ++++
 2 files changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/libjcat/libjcat/install_missing_ptest_binary.patch

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat/install_missing_ptest_binary.patch b/meta-oe/recipes-gnome/libjcat/libjcat/install_missing_ptest_binary.patch
new file mode 100644
index 0000000000..7a363e9d0f
--- /dev/null
+++ b/meta-oe/recipes-gnome/libjcat/libjcat/install_missing_ptest_binary.patch
@@ -0,0 +1,25 @@
+From a056df0dadd8aa09a750a65f2b7201b8742c9378 Mon Sep 17 00:00:00 2001
+From: Jan Tojnar <jtojnar@gmail.com>
+Date: Fri, 29 Apr 2022 18:02:10 +0200
+Subject: [PATCH] installed-tests: install firmware.bin.ed25519
+
+This was forgotten in f802f078ec0349e4056bf764ee4da16fe9973978.
+
+Upstream-Status: Backport [https://github.com/hughsie/libjcat/commit/a056df0dadd8aa09a750a65f2b7201b8742c9378]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ data/tests/colorhug/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/data/tests/colorhug/meson.build b/data/tests/colorhug/meson.build
+index 7ee3e62..b871500 100644
+--- a/data/tests/colorhug/meson.build
++++ b/data/tests/colorhug/meson.build
+@@ -1,6 +1,7 @@
+ install_data([
+     'firmware.bin',
+     'firmware.bin.asc',
++    'firmware.bin.ed25519',
+     'firmware.bin.p7b',
+   ],
+   install_dir: join_paths(installed_test_bindir, 'colorhug'),
diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.11.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.11.bb
index bd17e44cd0..34aa2bb48b 100644
--- a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.11.bb
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.11.bb
@@ -9,6 +9,7 @@ DEPENDS = "\
 
 SRC_URI = "\
     git://github.com/hughsie/libjcat.git;branch=main;protocol=https \
+    file://install_missing_ptest_binary.patch \
     file://run-ptest \
 "
 SRCREV = "ffa0b5a9a49a7880e9ab3ae3b061080f15e95e15"
@@ -32,3 +33,7 @@ GTKDOC_MESON_OPTION = "gtkdoc"
 RDEPENDS:${PN}:class-target = "\
     ${@bb.utils.contains('PACKAGECONFIG', 'gpg', 'gnupg', '', d)} \
 "
+
+do_install_ptest:append(){
+	install ${S}/data/tests/pki/test.ed25519 ${D}${libexecdir}/installed-tests/libjcat/pki/
+}

