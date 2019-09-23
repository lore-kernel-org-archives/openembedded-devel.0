Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7A27E7E4FE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 16:47:25 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p7so10793436wmp.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2019 09:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=I0wYPIHER28NUx3rHidUA5i1Z0JTXrnuYeVrKjVxOLo=;
	b=vSXaxCBHHfL7Aph5T2pHlW95PN8vRw99PB1seDnWVP/br62EufbcnvnP494HefGEL8
	1hG9ylvTvyaWa0hAemtjMHMudyNXbXrBdUXX1AqCKNBe4FV5XgclPViIvtMk3JeJ9KUE
	yC8wj/yjFpsv/k5MWXOmjsH5Kq28iioIielIx2JpkXFFDzuU/XP0F4/byCFHntF0aplf
	wPwv+c8hQdWm9pmRAwASzrWhkvJPkqR/rnY7agFwAcK20+5sOS9pkDmad4OrgcAgsUS/
	cyX4j643GiTFcB1hp/GVdE70wHl/E/K1dHcGYeARf2q7fWJGpCID6tHB0yr5LeCz702W
	BeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=I0wYPIHER28NUx3rHidUA5i1Z0JTXrnuYeVrKjVxOLo=;
	b=JqFAUvGdeU0+Ipl3yzz+OceyQfcV4BCfdVYYeb+vm3ZnnfiG3NDlVk8oEabDw4Nncu
	FJy8JDp+XQiSltgRbDdr2ESIwMyV8PtTR85wLqdsr9PMX/4w9EdW9tiWfhXmkWnud7HN
	ciu885tM8TUyr02LebtUoGcWBKOZyKaA8yh9aZjbq6sfjbvyw2CRjGMg2yu45HEBmRgP
	qsRQt5ARHiWWgei8nZyxmVHDiJkPzNoACf5RAKy65hTdbQQKt2qa2Kh7UZJ5PjxgmQkt
	52FridsreF635c0YubliseuoVa2N3+oZT7hHt/ANJ6OR0LYBQR0R/RU/N2o6ifMG+9At
	WMDw==
X-Gm-Message-State: APjAAAX4STEwGzmZ/LFRMJmJnkRoCgsk6A7+3/QMYHK1sXvoOiaVv2sY
	fk8HiWN2U6PR9ftR7V4Dw8ooEw==
X-Google-Smtp-Source: APXvYqyEWzUcdbbq1FpXRJtKwlGMNXL9ofHevcnvEjWUEC1DvMHJAxR9W3+RqnT/9Kwz6Am1Ega3aQ==
X-Received: by 2002:a05:600c:389:: with SMTP id
	w9mr401312wmd.139.1569257246044; 
	Mon, 23 Sep 2019 09:47:26 -0700 (PDT)
Received: from debian-brgl.home (lfbn-1-7087-108.w90-116.abo.wanadoo.fr.
	[90.116.255.108]) by smtp.gmail.com with ESMTPSA id
	g185sm22269249wme.10.2019.09.23.09.47.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Sep 2019 09:47:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>, Tim Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>
Date: Mon, 23 Sep 2019 18:47:22 +0200
Message-Id: <20190923164722.24650-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH v3] python3-dtschema: new package
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
X-List-Received-Date: Mon, 23 Sep 2019 16:47:25 -0000
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This adds a recipe for dtschema package developed by Rob Herring for
easy validation of YAML device-tree files in the linux kernel.

The version is current git as the only release so far - v0.1 - is old
and doesn't work with kernel's dt_binding_check make target.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v1 -> v2:
- added PV

v2 -> v3:
- fixed PV: used SRCPV instead of SRCREV

Note: I'm already seeing patch 1/2 from v1 of this series in master-next
so I'm only resending this one.

 .../python/python3-dt-schema_git.bb               | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-dt-schema_git.bb

diff --git a/meta-python/recipes-devtools/python/python3-dt-schema_git.bb b/meta-python/recipes-devtools/python/python3-dt-schema_git.bb
new file mode 100644
index 000000000..06a9012ca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-dt-schema_git.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Tooling for devicetree validation using YAML and jsonschema"
+AUTHOR = "Rob Herring"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=2;endline=3;md5=c795d4924c5f739424fa8d9b569c6659"
+
+inherit setuptools3
+
+SRC_URI = "git://github.com/robherring/dt-schema.git"
+SRCREV = "5009e47c1c76e48871f5988e08dad61f3c91196b"
+PV = "0.1+git${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+RDEPENDS_${PN} = "python3-jsonschema python3-ruamel-yaml"
-- 
2.23.0


