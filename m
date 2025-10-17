Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3EEACCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 12:54:50 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.14678.1760705685179641552
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Oct 2025 05:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j5g78As0;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42557c5cedcso1098072f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 05:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760705683; x=1761310483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VXVc44tI0x7AiREnjJzlcnkHRpBNdsPKjVU09DoKp+U=;
        b=j5g78As0olV0JlRSFuWcj904XIvcqudetg3HEtTpQGGl6J5GFf0LOWrqUjoi8wrZl8
         n5G4C7eKXq6F2wFzO2NExRNPYaCPK/NB2dkQmFDAqmK8gOuHpE83vB4+rN9Tr7KuYniR
         6ZDyGbrHIsQp2h9lNJRcYcv5yjbr7N4urhyCbSsC8ZzWUCgmJeTN4Vs3YhecSxf0F8MW
         hhI1QkEG/izshnv8i9O2QHQEZ9OtE+7SOtV6HCRzu/39RWzsMQkKrEKaxJY6TQB4APTC
         Bn/vc+cVtFW73wqrDx6QAZ+GfkmNY+iAJ/BHxGf+cWC+8LDggujcXpj3v9XAqwvNVXI6
         Oy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760705683; x=1761310483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VXVc44tI0x7AiREnjJzlcnkHRpBNdsPKjVU09DoKp+U=;
        b=RzFmJS2bbR7D3rz00vNCjxvefak4mKvD7tSpb1wlqxnyRapx5zcmJQtc3VeyF6AMQd
         03xNk6HazMHMY+9MPxPhBhpYuGrDZM2G6fTMlLkII1tcDFSK/4IFLNvDMtMSnx/HQ3qa
         HeVqpDVJAACVpYYyKVlmaLFeDvdZjq93c0PmBfcWzOef87yzuNbzllRzlcvloUctWPpg
         elnj+GcWvZaqtYTSG3tqJ4zyM50js/TZIjx2AEjUgX4bxPaQNVSVXyFrPpoctXMulhOA
         GOdOfr4Jy/0CD5DedRtPdZ9o2Di4nbstjeqFmz8GOyNfTX8PcgYq9S7S0H+pcdPSmxPx
         3FJA==
X-Gm-Message-State: AOJu0YwDgS3858bAzxPLGh28/F7KAHcuEQk3rcKoHLeuMI8+oFjP9JdU
	g+z29Mz2bCJ+IsS6n3UUI6HqGdVh4Lsp7Z5ETvHiVvOdr4PREGHzpvL3PlFpew==
X-Gm-Gg: ASbGncuMQevs+DjBnTGhHhODPIQLap4lOQzYFzSaJ8WNKed86sX6z4/kgigi86tX1zK
	/4sNwhfBgPMRff5L3bietsqUPD/Nnd8z+epK134J3vpprZ/JnllY36s7st9lC75NOFycuEXhGti
	HnGYqrnmyklZYX+nwxyc7fs/4OzUtmjoLl4h+tVU8raDJwdPx79UuDAy9FIRJCfW8twSocn9l5d
	cjTziRNR3V+icQIle8qxwsPF7TE+v0Hdrx6GD5w06Aqmd3OKsXN5CuAaI4ZG9I0VhKEp7ksw/xk
	YYeeGG9qC40Q0MNzSyBiRmW0ZFRHybg8o4V0Z7FtoiIaeI7YTYVoNVCK4GDj9XwHlxO2+BUg05q
	f2MLTY4SmJsVL25bXSJGo5XP88kCHwkk2f/A2P035Biqb1YqMeSbqWF/oPOpYTNC42pV3swXwfw
	==
X-Google-Smtp-Source: AGHT+IFj475E/mg/TMBgtN3UxDRLGcHtWzg6JuRret4osLI8QrsS02ZzgFD4HQI5l17n0CC+BuKiFQ==
X-Received: by 2002:a5d:5888:0:b0:3ec:2ef7:2134 with SMTP id ffacd0b85a97d-42704d54b25mr2049699f8f.18.1760705683219;
        Fri, 17 Oct 2025 05:54:43 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710f289daasm44796985e9.6.2025.10.17.05.54.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:54:42 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] fmt: fix ptests
Date: Fri, 17 Oct 2025 14:54:41 +0200
Message-ID: <20251017125441.2463913-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Oct 2025 12:54:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120761

The recipe has inherited the ptest class, however it did not install
not execute any tests.

This change installs the tests and add a script to execute them.

The tests are quick, execution takes single digit seconds.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/fmt/fmt/run-ptest |  5 +++++
 meta-oe/recipes-support/fmt/fmt_8.1.1.bb  | 10 +++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/fmt/fmt/run-ptest

diff --git a/meta-oe/recipes-support/fmt/fmt/run-ptest b/meta-oe/recipes-support/fmt/fmt/run-ptest
new file mode 100644
index 0000000000..a069e4543c
--- /dev/null
+++ b/meta-oe/recipes-support/fmt/fmt/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+for t in `ls ./*-test`; do
+	./$t && echo PASS: $t || echo FAIL: $t
+done
diff --git a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb b/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
index c53dd38901..54b8fd3d9e 100644
--- a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
+++ b/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
@@ -4,7 +4,8 @@ HOMEPAGE = "https://fmt.dev"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
 
-SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
+SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https \
+           file://run-ptest"
 SRCREV = "b6f4ceaed0a0a24ccf575fab6c56dd50ccf6f1a9"
 
 S = "${WORKDIR}/git"
@@ -13,5 +14,12 @@ inherit cmake
 inherit ptest
 
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
+EXTRA_OECMAKE += "${@bb.utils.contains('PTEST_ENABLED', '1', '-DFMT_TEST=ON', '', d)}"
+
+do_install_ptest(){
+	for t in `ls ${B}/bin/*-test`; do
+		install $t ${D}${PTEST_PATH}/
+	done
+}
 
 BBCLASSEXTEND = "native nativesdk"

