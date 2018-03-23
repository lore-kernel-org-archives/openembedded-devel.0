Return-Path: <brgl@bgdev.pl>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id B4FC678771
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 11:07:27 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id h2so11696716wre.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Mar 2018 04:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5nAA+3k8UfslSm9gZ38f5EP6APG6LPmCMM2dD8W8XNo=;
	b=uQ9vCT5fo5KBIEmJwPemsBUJDckZUpfM/dI5tSfrRdWXLDxrLPaq+RwLp9FsSOn9hu
	f/KjjvKe6ds9GHLyoPAGUm+xEQCoulELwPOcpwerrp+sdyalxIUuQz1RgvcnR8ivf1yW
	L2+cgiyPqonGGE6O35AFJqC/kInF/l1UQlRSR2qtkZNRMlEA56yPy1muD/LeqDt7IF96
	t1uHEaHXXiFhfyDnseuaoax1vgFXcvY5+bQR2phEesNe/7pmYXHtNhpkdp/4TBz+Ww0p
	GMNzG4ZRXsna0f7Z2jPvkvCxfLO6Cu5mImq2HMwhXKdu9Slp6x4Dak7AnvgEGaAainrf
	GE3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5nAA+3k8UfslSm9gZ38f5EP6APG6LPmCMM2dD8W8XNo=;
	b=AG5TjR6ZsTmVfnciEPTPghVIrfaEhJreFRZLh5kNdtNQIOoN2S4snCW9wNCFrpkrXh
	6nC0ghsCQ0JmMEb8D/HQs7S6S8fmfOKhwl1vevaX4O5ETV+1PC2CUvnvXn7z22qLTaN2
	b+NlF/OtdHuT4HCeJFHVx5SJghfCTpUYeRH3XWvBdXaEsAgS6q4wlFvjqOJLqq1ba44y
	yq04zxi+CWdlrQsWSjATR8i5NpP4wrTakMpTKMhDo2hb90tmDPieW/SXvethlmep8XVY
	3SvKwBJNwyPCejVZcqmIAHx/ks/5PKb4iMO7fP8hCpzJjCvy9xn3lHx3aji7XwYNgmz0
	Y9/g==
X-Gm-Message-State: AElRT7EcXr38o2xECcC5S2ba/5lc2E82EsHH7I3RZt9HgafSsPJHOLIV
	CQS3WAm8POgDgU97ifDK6qMsMg==
X-Google-Smtp-Source: AG47ELtrKsUHEvOA3214zagOJelL0jveVezqRl/8wtJEXNHkKwWyl70lragDYmIuKP1pCCfpY30HEg==
X-Received: by 10.223.175.70 with SMTP id z64mr24299558wrc.254.1521803248814; 
	Fri, 23 Mar 2018 04:07:28 -0700 (PDT)
Received: from brgl-bgdev.home ([2a01:cb1d:af:5b00:e837:b8d5:48c1:571b])
	by smtp.gmail.com with ESMTPSA id
	c57sm6184788wrg.84.2018.03.23.04.07.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Mar 2018 04:07:28 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 23 Mar 2018 12:07:18 +0100
Message-Id: <20180323110719.1010-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180323110719.1010-1-brgl@bgdev.pl>
References: <20180323110719.1010-1-brgl@bgdev.pl>
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] libgpiod: split recipe into .inc and .bb files
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
X-List-Received-Date: Fri, 23 Mar 2018 11:07:27 -0000

The build works the same for v0.x and v1.x series - leave only the
hashes in the .bb file and put everything else into .inc.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 meta-oe/recipes-support/libgpiod/libgpiod.inc      | 21 +++++++++++++++++++++
 meta-oe/recipes-support/libgpiod/libgpiod_0.3.2.bb | 22 +---------------------
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
2.16.1


