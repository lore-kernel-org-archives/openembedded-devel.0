Return-Path: <brgl@bgdev.pl>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id A3CAB744E5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 14:20:27 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id h3so23419364wrh.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 07:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IA3eo9NTuQIyxiaRR8vkG+vEoyVbZJcfotnOFjPC1nw=;
	b=q8Gu+HKRrQ5Db/pWg6sgGBWHmJCltOwZ3xq91cEqYIoF2jYnhDdRaqg6Ue6j6Frt++
	VMszpegx6gY0H6ggt+Jd7m+7IlgCIZRSOmZQoJVOz+mfOztBxHdmPVGRQ+XTDyFXm5ng
	YQNi4zK1RtCitYmtchY7tGB/Ly7dV5NPencvXsv8UryX09XvRTCICnqmMbk81XsVBBGy
	5N/fYehmfWWtT/e2ycgGIH9xTDSEI7SJguNDVZhRykFlC6K2TXQl9hgyi5JwhjCnpbT4
	n6yGl77XbNtzw8BV1P5hkDEs0eeHgArIVWeztriZ1jmqmjZuMIK/AG0/8odbx+I9l/e/
	TfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=IA3eo9NTuQIyxiaRR8vkG+vEoyVbZJcfotnOFjPC1nw=;
	b=X/ZfysLBox7U0A35G25M/UyvWcoKhjecea/0S9s65uQRh259fPlTO4WdIkBgf7jZgm
	ST8ZFlglR8x8i/Djuos+GY+NhX+jFcnMig2fQXs28VclVG+ahRp1AFXTtvuc+J57hnAE
	pYLjcen1pM4dI8Gg8l8C9FZf4SrWWGds2YDjDqQD6PsGuAqu8jBrTYOYZcSzMN17Kob2
	lR9nFQCv4k/7CQveDYTZlodAD/omAdOWkfASo8KyJduqQqjT7RAZ338owOJhiwzadTPl
	hDZf7RmORehMQOsbyrubh7MfPzdiVuzyqlHgOSYZQihTCJuHhD01T5kO744FkAXNOHrL
	2vWQ==
X-Gm-Message-State: ALQs6tCrDAaXfnJS3qBRikfBx6XVYyn8VcZRCTOtQjTc+CTUlgjxB/RU
	RZn85NKjkpNb3nVnQuv/WDvbGg==
X-Google-Smtp-Source: AIpwx4+hmw8mKoA3cwEY423TJwIlJr/gh9vSfh539wzTAbgBPFfXS1c+i8mECNxT4wqfBanvht9lvw==
X-Received: by 10.223.146.103 with SMTP id 94mr1838100wrj.206.1523974828460;
	Tue, 17 Apr 2018 07:20:28 -0700 (PDT)
Received: from brgl-bgdev.lan (LFbn-1-7086-217.w90-116.abo.wanadoo.fr.
	[90.116.254.217]) by smtp.gmail.com with ESMTPSA id
	f132sm6455563wmf.13.2018.04.17.07.20.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Apr 2018 07:20:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Tue, 17 Apr 2018 16:20:18 +0200
Message-Id: <20180417142020.30100-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180417142020.30100-1-brgl@bgdev.pl>
References: <20180417142020.30100-1-brgl@bgdev.pl>
Subject: [meta-oe][PATCH v2 2/4] libgpiod: split recipe into .inc and .bb files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Apr 2018 14:20:28 -0000

The build works the same for v0.x and v1.x series - leave only the
hashes in the .bb file and put everything else into .inc.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod.inc | 21 ++++++++++++++++++
 .../libgpiod/libgpiod_0.3.2.bb                | 22 +------------------
 2 files changed, 22 insertions(+), 21 deletions(-)
 create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod.inc

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
new file mode 100644
index 000000000..cd7750623
--- /dev/null
+++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
@@ -0,0 +1,21 @@
+SUMMARY = "C library and tools for interacting with the linux GPIO character device"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
+
+SRC_URI = "https://www.kernel.org/pub/software/libs/libgpiod/${BP}.tar.xz"
+
+inherit autotools pkgconfig
+
+# enable tools
+PACKAGECONFIG ?= "tools"
+
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
+PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
+
+PACKAGES =+ " ${PN}-tools"
+
+FILES_${PN}-tools = "${bindir}/*"
+
+RRECOMMENDS_TOOLS = "${@bb.utils.contains('PACKAGECONFIG', 'tools', '${PN}-tools', '',d)}"
+RRECOMMENDS_${PN} += "${RRECOMMENDS_TOOLS}"
diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.2.bb
index 20068894e..ea785ad0c 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_0.3.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_0.3.2.bb
@@ -1,24 +1,4 @@
-SUMMARY = "C library and tools for interacting with the linux GPIO character device"
-
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
-
-SRC_URI = "https://www.kernel.org/pub/software/libs/libgpiod/${BP}.tar.xz"
+require libgpiod.inc
 
 SRC_URI[md5sum] = "9c1966bea7dffd59bd099a8b2930e2ea"
 SRC_URI[sha256sum] = "50c7862428ca90b58672e2475aea66d33a6fc86c6bab1928c0660f3aedf44a37"
-
-inherit autotools pkgconfig
-
-# enable tools
-PACKAGECONFIG ?= "tools"
-
-PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
-PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
-
-PACKAGES =+ " ${PN}-tools"
-
-FILES_${PN}-tools = "${bindir}/*"
-
-RRECOMMENDS_TOOLS = "${@bb.utils.contains('PACKAGECONFIG', 'tools', '${PN}-tools', '',d)}"
-RRECOMMENDS_${PN} += "${RRECOMMENDS_TOOLS}"
-- 
2.17.0


