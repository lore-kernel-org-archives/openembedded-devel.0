Return-Path: <limon.anibal@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 940476067D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Oct 2017 14:31:49 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id 14so1075308oii.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Oct 2017 07:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1PChZrfH0d6fIdMyDu4QuQkS8dH2nNlu6IvbSzuvP4I=;
	b=HTuwP2gu7abcfxkN3/6GzhEfSieQKVDFOgCVaEVt7HyqxJjyMVXpopm/WVtqDwIkr/
	UCO3ykO660xWnAfLlYIeF9/PyfFXg+ybcjCfxTDbOn/ZGfy4ApBPK8V23vpM8F6Cgfnw
	FAheVmWQHDf7c6gmaB7QF/QHTippMQ5frwHBOrDEe+uZ8OypOWLFkpDXCkXEGklRuVso
	Xro0i5zi6JkiUuSeC1Y/lZ23eVu5ZyAX4FU9fziUVOf/z9rgqEKtS2gkE6NvmQtfvAB+
	OV+2BQw32VeGI7tIHyxzMzdheWS2hDoGUGkmw5r6FND9xI6ikDWnZbj7ffsCuyKQjjpy
	hoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=1PChZrfH0d6fIdMyDu4QuQkS8dH2nNlu6IvbSzuvP4I=;
	b=VYNJsrQ2xJAxRvBygLszxN4MqQ7Rwh7aJHRfheITvGmOylps6QLYMTDJI0RKCSiB4h
	+kRD3Wzlp8jAj1oX/iXoygZGG0E68yqyz1Cac5Hkk7RcqOnTg/htwGdq5JueG3hmaA91
	WzBvE920AFR9/xPMVNSgAgGuptjOYeCpKEBEFah1MOzGY5zDBtgLK9ysYZi+H1i7rgAL
	L5QHX4ubW46P+CGcRBfR1Y3iPN6uWSMIwtfctfhlGnwe+1Ykf7pePy5Xhf0JfaBGAMiz
	i/M1UbrIiKp4ZEkV257HVG2TzmqAO9Kg+zKKEcScJGtRseDOVE29XzyGyRWBut4g0UlS
	QzOg==
X-Gm-Message-State: AMCzsaWpjU21QL36auFfYQFvtGnKtD4ZXGy8Z+TKANb8tYCqEp1Zi34Q
	ipeknyXXisrv6XeYT49NbWAc5Ge3
X-Google-Smtp-Source: AOwi7QBgzzhQikfUD3ZY1MHhw7e10SxjS/Le6GTSz82JV6KEdlqp2JMXDj0OLh3ue3yZBdRSWQNw8g==
X-Received: by 10.157.51.23 with SMTP id f23mr3691013otc.419.1507732310052;
	Wed, 11 Oct 2017 07:31:50 -0700 (PDT)
Received: from blackbox.Home ([148.240.201.158])
	by smtp.gmail.com with ESMTPSA id
	d185sm3060990oih.53.2017.10.11.07.31.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Oct 2017 07:31:49 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Oct 2017 09:31:44 -0500
Message-Id: <20171011143144.23691-1-limon.anibal@gmail.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH] meta-oe/recipes-test: Add stress-ng recipe
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
X-List-Received-Date: Wed, 11 Oct 2017 14:31:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linaro.org>

A tool to generate load and stress a system, currently this recipe
is on a couple of layers [1] and is not updated, a good reason to
have in meta-oe.

[1] https://layers.openembedded.org/layerindex/branch/master/recipes/?q=stress-ng

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb

diff --git a/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb b/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
new file mode 100644
index 000000000..f8b0a0d27
--- /dev/null
+++ b/meta-oe/recipes-test/stress-ng/stress-ng_0.08.17.bb
@@ -0,0 +1,18 @@
+SUMMARY = "A tool to load and stress a computer system"
+HOMEPAGE = "http://kernel.ubuntu.com/~cking/stress-ng/"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "zlib libaio"
+
+SRC_URI = "http://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "e0f6497a8c06f5d652bc2ad88d449c12"
+SRC_URI[sha256sum] = "37cc73e42f5bdb0e0571ba88f6a69b8f05ee28e51afcafc2231c1058b1a5dd18"
+
+CFLAGS += "-Wall -Wextra -DVERSION='"$(VERSION)"' -O2"
+
+do_install_append() {
+    install -d ${D}${bindir}
+    install -m 755 ${S}/stress-ng ${D}${bindir}/stress-ng
+}
-- 
2.11.0


