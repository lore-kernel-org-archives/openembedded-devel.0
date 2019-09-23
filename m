Return-Path: <brgl@bgdev.pl>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id F3A346B07F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 10:01:03 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id i1so13197100wro.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 03:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kCUR4QzaWPAOWpEEjpHG347GshKgu6JUUP2Bw9LaI5g=;
	b=Q1jwiPvQNmx+nkf81AcOApqLAoH0cTq+kdGICn41KER1qJAJ18vz9gngYBDBrXr83F
	V9awY798YpitxMPGLtMnKUpDVQAdo2kwRgyusqsqNiJB3JBxQcAQtZsabz6GhGtwY/p+
	rDrPgJ8K84pHM7lId2zTGb7XORiqDHkrmrHRpIhHKDzSlZSGKbAjbIgTVN04sqDEGiUq
	M0nWbyTCr8UPZce48rzmxSXfjcBgpFn14YP53Cvk7BfcGe3wJu+M3Tj0TNfUVCHLw6Hl
	HJ35Fr21uh1ImRK6/aDgP+1bxsK94wnUTmiJ0E5K/u/sulvondp8U94n8OxFIw7YjMYX
	ej3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=kCUR4QzaWPAOWpEEjpHG347GshKgu6JUUP2Bw9LaI5g=;
	b=P5KRunOusgig2iPle8vV5hGWQLyUp/9Ym6RVlpZxt1JBq+J+xromT+mF/qzc8Nwh2M
	7RrWjFMatW82PSnRzD27h8Cxnk3cwV5rnhyNpVTbDM3vj6yVJUTj/oIeoWffs77SinfX
	/NAjajEuMYkcd3aF8bn5yDyOjqIIKandvHJmYwQc6Uzhk2iAiv47hZNIybBSLTKRt088
	TpOu9NoV1+cxaqmUvmiy6BzeGmZ42YF3zs6+xl2HRIUlMp/1ZmIJ4CuRJIlOhPqHbhiO
	RkogqRRhldYPWIbMLwW2EQQpUuHawx6lWnS8aPLcuhY2UiL6b4xD9M0Ep8Km8eGa4J9M
	nBUg==
X-Gm-Message-State: APjAAAUpaqNClJiuyf3gNhvRNTejspWUiYywI81HhGNYOXqtbo8kD4G5
	cN1smsZ9AWuQiYRP0zDM2KrZWA==
X-Google-Smtp-Source: APXvYqzRgdL1m0qloIYgaRMG0ve74brKOR5j6yYYisvE95/8It6mFwPp99qAnCxUaq8YBvt6NmJYCw==
X-Received: by 2002:a5d:4041:: with SMTP id w1mr20446409wrp.313.1569232864653; 
	Mon, 23 Sep 2019 03:01:04 -0700 (PDT)
Received: from localhost.localdomain
	(amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
	by smtp.gmail.com with ESMTPSA id t14sm9412032wrs.6.2019.09.23.03.01.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Sep 2019 03:01:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Tim Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>
Date: Mon, 23 Sep 2019 12:00:57 +0200
Message-Id: <20190923100058.30454-2-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190923100058.30454-1-brgl@bgdev.pl>
References: <20190923100058.30454-1-brgl@bgdev.pl>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-ruamel-yaml: new package
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
X-List-Received-Date: Mon, 23 Sep 2019 10:01:04 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a pypi recipe for ruamel-yaml parser.

Based on the recipe found in meta-homeassistant by Oleksandr Andrushchenko.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 .../python/python3-ruamel-yaml_0.16.5.bb         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.5.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.5.bb
new file mode 100644
index 000000000..ba095648f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.5.bb
@@ -0,0 +1,16 @@
+SUMMARY = "YAML parser/emitter that supports roundtrip preservation of comments, seq/map flow style, and map key order."
+AUTHOR = "Anthon van der Neut"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=caf8bd842440b537c044e131785a4666"
+
+PYPI_PACKAGE = "ruamel.yaml"
+
+inherit pypi setuptools3
+
+SRC_URI[md5sum] = "7d5a5b0a7621a1247b081cc8e4978354"
+SRC_URI[sha256sum] = "412a6f5cfdc0525dee6a27c08f5415c7fd832a7afcb7a0ed7319628aed23d408"
+
+do_install_prepend() {
+    export RUAMEL_NO_PIP_INSTALL_CHECK=1
+}
-- 
2.23.0


