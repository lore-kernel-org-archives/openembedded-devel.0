Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E09C43638
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:11:33 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69109.1782634288143616147
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kgiM10AC;
 spf=pass (domain: gmail.com, ip: 74.125.82.178, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30c591fb1cbso3618953eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634287; x=1783239087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niUloGl6Yu0tkOPKJNjRY9Wo6CdUSIPbJ7XgTXCxjvY=;
        b=kgiM10ACvV4P7nyva8dzBGEmN4PTu6WkC2xbmnz0K2j8JF2KcaTfVs1yJqr3NvO9ZL
         Sx1LonIapvYQ03p379UrKhZRgt6j02QMMS8GeosOHF8mvpSRFBjwkwEd3RF99/1ErJcp
         E1IMHbNBD632TK5sH4eUH7ga97gdwW1RaFqCyWIZ0pue6a6qxx2lRe1Rrz7A0gNZHGEo
         4Fu1X0jsuUALPZXldny59jmP4xImyObVzmaUlLMWL/t0WxraG6SsnyFuGcg6hlC/fwAX
         cLKTzoCWBDIwgWbJcdx8jcNceG3NwotRkjRgQLvKLcd1M9QpHHCGiJ9JOxPm2s07Jjlv
         5AUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634287; x=1783239087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=niUloGl6Yu0tkOPKJNjRY9Wo6CdUSIPbJ7XgTXCxjvY=;
        b=g8KnfCv3H74f3Em118Oh+SD9Qc2n4TYFZu4K7Pc9YB9E00CLu31GS2jTzfW5nsvZYf
         hiBtPYpFtEMI9BOS3buLPi+st/iKPSE3SOoebJK2ppaHRgs92W586115LDxwoR2AINnF
         vdiAS9Nd4lqVK4Dx1ZMFMq2Lb1ZEKZ6IWRK7ckPxPrybA6h1b2yRtBha8kHoFHvfHUmQ
         h8cOpbp6dPWJzvOHo2pSCOowHJQEl2jGgqsP9l32T9pHwEHy8DDV1cDGJk6qofZ4kdCi
         lk555aENpQIheINQmxFkczyqBDZ9eFru36BqlYEaPXX+6oGIf9Dtml/yKQM85t7JUAO9
         Bztg==
X-Gm-Message-State: AOJu0YzcAAnaeGpL51/dZa+fmXChbMlgx4Aeh3K3GpfWDo/utmxi7Z36
	JuGuwPVpPVQVFL1UJcSutGRQ8/an+X3w3umqPZcNAcEIpNbljUtsP/HSXWIL3r3WPR2VLA==
X-Gm-Gg: AfdE7clSsEFVccjhqNdNSrvoOj6/dDheKh86cce7TJdPgljJRaC7Cw2+Qv+R1by+X0Z
	13ErKaLAq7w4TFyA4ikX4XZxMJzkTqETknk7/kSjiEbFCroNnS3wZQQ9QXfvPJdKtBF49IMmmPU
	kIEAXOIvOrmmxWAF+om9Tiy2V2vIzlxuNu11n8u08+WZ7eNlTf2WmEvKFTkCAFPq86RFT68llew
	tkOrlZnhUv+tafOGxpVzQwjstAqjv2fmsbt0AmBtTpbbG3kv/ZqsLWSUL4OxRCD4KmZtEtP3aB1
	BbdMI0fkk44QUEnff5wYiUWjeTeSDVj/W+iKQKDaK2vbDlcY8UL7ZCBr0cw3+jfkrMoqN44NYIT
	QCqvuh/MxpwtzjKK0chrw1QwfUEYu2vGjZoaOu2//iBVOBUXXM1uJkUnck7PrxwLF8hFGrlgKZ4
	ApNKtGArrn+8HTfR2gofPUGb9lceEsOSn3eCICfTL145qJE36Q6feLlTkt0uTfvS4mCq/Hs5NK2
	QNllpiuawOtuFkqbYz9ONo0Mws5EjMJO2027YbYDyYhCOGiAeySU7aLLpvTOLMxlCeKbyn4jtvz
	cJoZ69TmgBcDrQ/76XRqwxEAh79stg==
X-Received: by 2002:a05:7301:3d17:b0:30c:ab4d:381f with SMTP id 5a478bee46e88-30cab4d3f58mr6010882eec.43.1782634287355;
        Sun, 28 Jun 2026 01:11:27 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:11:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 003/128] ccid: upgrade 1.5.5 -> 1.8.0
Date: Sun, 28 Jun 2026 01:09:14 -0700
Message-ID: <20260628081122.178348-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127813

License-Update: FSF postal address replaced with a URL and LGPL text reflowed

Switch to using meson build system

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/ccid/ccid_1.5.5.bb | 18 ------------------
 meta-oe/recipes-support/ccid/ccid_1.8.0.bb | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 18 deletions(-)
 delete mode 100644 meta-oe/recipes-support/ccid/ccid_1.5.5.bb
 create mode 100644 meta-oe/recipes-support/ccid/ccid_1.8.0.bb

diff --git a/meta-oe/recipes-support/ccid/ccid_1.5.5.bb b/meta-oe/recipes-support/ccid/ccid_1.5.5.bb
deleted file mode 100644
index e76881916e..0000000000
--- a/meta-oe/recipes-support/ccid/ccid_1.5.5.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Generic USB CCID smart card reader driver"
-HOMEPAGE = "https://ccid.apdu.fr/"
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-
-DEPENDS = "autoconf-archive-native virtual/libusb0 pcsc-lite"
-RDEPENDS:${PN} = "pcsc-lite"
-
-SRC_URI = "https://ccid.apdu.fr/files/ccid-${PV}.tar.bz2 \
-    file://0001-Add-build-rule-for-README.patch \
-"
-
-SRC_URI[sha256sum] = "194708f75fe369d45dd7c15e8b3e8a7db8b49cfc5557574ca2a2e76ef12ca0ca"
-
-inherit autotools pkgconfig
-
-FILES:${PN} += "${libdir}/pcsc/"
-FILES:${PN}-dbg += "${libdir}/pcsc/drivers/*/*/*/.debug"
diff --git a/meta-oe/recipes-support/ccid/ccid_1.8.0.bb b/meta-oe/recipes-support/ccid/ccid_1.8.0.bb
new file mode 100644
index 0000000000..6ec6658cfd
--- /dev/null
+++ b/meta-oe/recipes-support/ccid/ccid_1.8.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Generic USB CCID smart card reader driver"
+HOMEPAGE = "https://ccid.apdu.fr/"
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
+
+DEPENDS = "virtual/libusb0 pcsc-lite"
+RDEPENDS:${PN} = "pcsc-lite"
+
+SRC_URI = "https://ccid.apdu.fr/files/ccid-${PV}.tar.xz"
+
+SRC_URI[sha256sum] = "531dc29e7c1b9e22e1918f0767b625d52ce8a98f266eb2144c5cf5dbd29c0f67"
+
+inherit meson pkgconfig
+
+FILES:${PN} += "${libdir}/pcsc/"
+FILES:${PN}-dbg += "${libdir}/pcsc/drivers/*/*/*/.debug"

