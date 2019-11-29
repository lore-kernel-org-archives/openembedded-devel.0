Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 71F587D40E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2019 02:38:31 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id c14so8592843wrn.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2019 18:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FCtlbWu9PeiLw5LoxVDXts8ntoQ5CDwfKnm7JZNK+QQ=;
	b=cC5wGM7oAzkuIZ0P0GhqoJ0vfBhqVALNkztwiNH2njVJkKDeuLpT6/eYMLihsJoG8y
	ouZ7u1OmhH3rdrB9cDO25Wu8OLL6o+MdJ6hobT5+3BsYd5RpHBmkOmNq0i2VO3EhsfXU
	biU9azf5jgP6F8JivBJfxRcIV6UJgUxnCH6ZXomV97gXo2hiCQ4T3PuilqnljZPLsaQ1
	RiTvJJopfa/1floNqR0WqK+gNeCgBCsgir4nPTKxPxBaGNLQ3iS1/dVvISXjTKD0RkBZ
	T/OH6eHwkkiT4N/CiKLnSXZi/wvKKD+OH6eb2vVcWYyI8sxgo54ShOaRxfrbnxQrYFQs
	NDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=FCtlbWu9PeiLw5LoxVDXts8ntoQ5CDwfKnm7JZNK+QQ=;
	b=Qiykeyf3AnJ9Ys4WPQqjnTK0IizNZJaAxJMkG1I2T1rYsiXHFE0w2qAQ/tFi3K/Vh3
	J6/qeoK1CN+Q5mlRf+3QwmBUKFsskFuBkH1Lh3ihfCTaD/MXPxjit849zuerQbOOkUWz
	az1rc8avWS6NQ5bAGfXw332uDf5Atjm8Aah5ARmrAjkXRpQq9/SH7n93PghXBCy7cjz7
	q7jm/p9n9t0xkgv4LY2gi9wo+SWmO7t/zNcKZBQZvhL5T7mK33YaWMYTZZawtS1Bfq2p
	Id9PZDwEO/8USoe+qCE+q6h4JEfbsLt0o7+7KTpFdslolKplA7ZTtZwue4R+y/whHd+K
	EuzQ==
X-Gm-Message-State: APjAAAVd68E8lgA3VsthFJWteLgi7ZJ/DpH4dXAxBqd7wL1DE0KeU4kf
	2OFAs56p4hr1kOA98NDExNDVJygaHVE=
X-Google-Smtp-Source: APXvYqzyL1ZIPT0SuSTgGGTHSAl4PcHx0aGQinNzXaLAmF7Cfns2SzSDQq8ls2vRkMw1NK7Ou09ycw==
X-Received: by 2002:adf:ea92:: with SMTP id s18mr49305843wrm.327.1574995111686;
	Thu, 28 Nov 2019 18:38:31 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	o1sm10854106wrn.84.2019.11.28.18.38.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 28 Nov 2019 18:38:30 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Nov 2019 02:38:17 +0000
Message-Id: <20191129023817.38750-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-configargparse: add package (version 0.15.1)
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
X-List-Received-Date: Fri, 29 Nov 2019 02:38:31 -0000
Content-Transfer-Encoding: 8bit

This module merges the argparse and the configparser functionality
and is python3 compatible

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 .../python/python-configargparse.inc          | 22 +++++++++++++++++++
 .../python/python-configargparse_0.15.1.bb    |  3 +++
 .../python/python3-configargparse_0.15.1.bb   |  3 +++
 3 files changed, 28 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-configargparse.inc
 create mode 100644 meta-python/recipes-devtools/python/python-configargparse_0.15.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-configargparse_0.15.1.bb

diff --git a/meta-python/recipes-devtools/python/python-configargparse.inc b/meta-python/recipes-devtools/python/python-configargparse.inc
new file mode 100644
index 0000000000..17d296ff8d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-configargparse.inc
@@ -0,0 +1,22 @@
+SUMMARY = "A drop-in replacement for argparse that allows options to also be set via config files and/or environment variables."
+HOMEPAGE = "https://github.com/bw2/ConfigArgParse"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=da746463714cc35999ed9a42339f2943"
+
+SRC_URI[md5sum] = "aba15b7973b7a70bea86fd69289f8fe3"
+SRC_URI[sha256sum] = "baaf0fd2c1c108d007f402dab5481ac5f12d77d034825bf5a27f8224757bd0ac"
+
+PYPI_PACKAGE = "ConfigArgParse"
+
+inherit pypi
+
+PACKAGECONFIG ?= "yaml"
+PACKAGECONFIG[yaml] = ",,,${PYTHON_PN}-pyyaml"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-shell \
+"
+
+BBCLASSEXTEND = "native nativesdk"
+
diff --git a/meta-python/recipes-devtools/python/python-configargparse_0.15.1.bb b/meta-python/recipes-devtools/python/python-configargparse_0.15.1.bb
new file mode 100644
index 0000000000..6d64b8d0b2
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-configargparse_0.15.1.bb
@@ -0,0 +1,3 @@
+inherit setuptools
+require python-configargparse.inc
+
diff --git a/meta-python/recipes-devtools/python/python3-configargparse_0.15.1.bb b/meta-python/recipes-devtools/python/python3-configargparse_0.15.1.bb
new file mode 100644
index 0000000000..698eccf666
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-configargparse_0.15.1.bb
@@ -0,0 +1,3 @@
+inherit setuptools3
+require python-configargparse.inc
+
-- 
2.20.1


