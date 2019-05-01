Return-Path: <parthitce@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9488F7D265
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 16:40:30 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id y5so7618759wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 09:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CJ3mroJ9JOuFfjlCx3pcWpM4AE+l9E3mF1VFl+nbK08=;
	b=IjL32ZhV7u0mOBtJiqh7CjtNjlMKiTm5ralrEWYh3VfYE94X4IiGF/jlwDldr2jxKC
	E10QqFt2msKYXRDZH67gPvKhDvcfQJ14b8TWhdYAOJFOmN0Jnal6kLLNTY/7BcmR4gYG
	7+ldGE6msns/cYZ0U5LEG9peGojPtPbK0eEu22lOsOZ7iJ74WWV22OChdgQPzO9GYtxK
	VRCk6P8XZq6DQj0QPbgkFnty3kENxvzf+qGKLVkgxvrdZrGUUMa3qyBfW5mwPpQxrB7m
	ikH2fD5+QBRLmeAM4G7y/zI4SnwPwX6lp3bH8WXMEyPtosdvcyT5ctk91+0wzqGtAWhp
	7dAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CJ3mroJ9JOuFfjlCx3pcWpM4AE+l9E3mF1VFl+nbK08=;
	b=jEjWsQWdQS+k8ETghXZcnRrzuUiWBtEKej/ePzQE+P9rbYT3vYygezd5sycSxaQA4S
	tdG7rYmOU+PjSo1YvIxVUgT3p//cgeNb0kQvApM73r3hcDkOHSUVwqXH5OPlUhgwrzz/
	WpUAdmVPB6J/4RzwjxAwYXR6EIvXtcwqZZhIu0m1HgA15PBXI2CJOj9DuMMAnoUt7S6M
	QJtRYzFJ9vhju8zFJW4hQ+cIXKDXl/x+TvadybuCdHiwbSj+fi8X8+PxSzSACCkadnvN
	957VQ3D4hAQ9P5TK1mOveXx/WQTmw1q/sySLWC5KWpkuLY7P+XBT9N5OJPtlzZcoWVAP
	dCtQ==
X-Gm-Message-State: APjAAAXz5saT7GStxST3HNC/aG3o6jTONSxtz6+GVOpqHu1rpVTlsrAv
	10GMXMH5PD1khHBI9PWjInRQo4qRQA==
X-Google-Smtp-Source: APXvYqxfPFHUpJaTwXRIKTS48WSOMhj8b1t/4QyEFfd3ClfkCGlIcsPNjBQpSbj0TJCiwpppQ12q+Q==
X-Received: by 2002:a1c:6783:: with SMTP id b125mr7010286wmc.79.1556728831040; 
	Wed, 01 May 2019 09:40:31 -0700 (PDT)
Received: from xpert.denx.de ([62.91.23.180])
	by smtp.gmail.com with ESMTPSA id o6sm1148376wrh.55.2019.05.01.09.40.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 01 May 2019 09:40:30 -0700 (PDT)
From: Parthiban Nallathambi <parthitce@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 May 2019 18:40:15 +0200
Message-Id: <20190501164015.2995590-1-parthitce@gmail.com>
X-Mailer: git-send-email 2.17.2
Cc: Parthiban Nallathambi <parthitce@gmail.com>
Subject: [PATCH] python3-tinyrecord: add version 0.1.5
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
X-List-Received-Date: Wed, 01 May 2019 16:40:31 -0000

Signed-off-by: Parthiban Nallathambi <parthitce@gmail.com>
---
 .../recipes-devtools/python/python-tinyrecord.inc | 15 +++++++++++++++
 .../python/python3-tinyrecord_0.1.5.bb            |  2 ++
 2 files changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-tinyrecord.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-tinyrecord_0.1.5.bb

diff --git a/meta-python/recipes-devtools/python/python-tinyrecord.inc b/meta-python/recipes-devtools/python/python-tinyrecord.inc
new file mode 100644
index 000000000..981dc074f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-tinyrecord.inc
@@ -0,0 +1,15 @@
+SUMMARY = "transaction support for TinyDB"
+DESCRIPTION = "\
+Tinyrecord is a library which implements atomic transaction \
+support for the TinyDB NoSQL database. It uses a record-first \
+then execute architecture which allows us to minimize the time \
+that we are within a thread lock."
+HOMEPAGE = "https://github.com/eugene-eeo/tinyrecord"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README;md5=31c1dc11b4ae83546538de4c16bceabc"
+
+SRC_URI[md5sum] = "e47dcfe299686cd3fa7ffaa7cb2ee8b1"
+SRC_URI[sha256sum] = "bc7e6a8e78600df234d7a85c2f5d584130f2c6ffd7cd310f9d3a1d976d3373c8"
+
+PYPI_PACKAGE = "tinyrecord"
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-tinyrecord_0.1.5.bb b/meta-python/recipes-devtools/python/python3-tinyrecord_0.1.5.bb
new file mode 100644
index 000000000..3f1b31f48
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-tinyrecord_0.1.5.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-tinyrecord.inc
-- 
2.17.2


